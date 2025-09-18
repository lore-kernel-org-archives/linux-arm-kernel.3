Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD428CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgLUSeV97No9nYtOeRYrbkT+0ZSSWLHTRfe2zSM1Sxs=; b=unEswa2ez1isQV4/oP5bm7RRt/
	uvzjXZnErcgy4zeKUagyWBP+xKxh/nvXpVSbGNmoZr7PYmoFK+dh3YlKmhx/wmHUyRqU/bn5/YvhC
	F8XU5rzJ/Ib2gvbNgzLH5R1R7wI/LzUebRfSkhdNY+YduY6GpVCQPAg1rM4vNrOUAmdZOHj6M07bE
	Rew90iMfHzECSycTVyHU9mqb44cfl7Il7O2tyATJHnpxtA85CerUzbyPW+xmT3Dr3o5z7I4/KCFLR
	C3ZqneSZbhJAuT2MrnwyWsURjmHIWhKiGNuemgEr7OA4UN6hCMPdRlSFh5Rxc8Ut+s8SgMF570GZd
	1K6DIDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGcH-00000000Ops-2yP3;
	Thu, 18 Sep 2025 15:32:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGcF-00000000Ook-24Ek
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:32:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC3D443FE4;
	Thu, 18 Sep 2025 15:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89847C4CEE7;
	Thu, 18 Sep 2025 15:32:08 +0000 (UTC)
Date: Thu, 18 Sep 2025 16:32:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: will@kernel.org, ryan.roberts@arm.com, akpm@linux-foundation.org,
	david@redhat.com, lorenzo.stoakes@oracle.com, ardb@kernel.org,
	dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v8 5/5] arm64: kprobes: call set_memory_rox() for kprobe
 page
Message-ID: <aMwl9mujvFknSulA@arm.com>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-6-yang@os.amperecomputing.com>
 <aMv_nhEuCSHKp5J6@arm.com>
 <22732cbe-20f8-4d1e-b086-e34d0f9bbb35@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22732cbe-20f8-4d1e-b086-e34d0f9bbb35@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083211_547951_2E8761A7 
X-CRM114-Status: GOOD (  20.69  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Sep 18, 2025 at 08:05:55AM -0700, Yang Shi wrote:
> On 9/18/25 5:48 AM, Catalin Marinas wrote:
> > On Wed, Sep 17, 2025 at 12:02:11PM -0700, Yang Shi wrote:
> > > +	page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
> > > +	if (!page)
> > > +		return NULL;
> > > +	set_memory_rox((unsigned long)page, 1);
> > It's unfortunate that we change the attributes of the ROX vmap first to
> > RO, then to back to ROX so that we get the linear map changed. Maybe
> > factor out some of the code in change_memory_common() to only change the
> > linear map.
> 
> I want to make sure I understand you correctly, you meant set_memory_rox()
> should do:
> 
> change linear map to RO (call a new helper, for example,
> set_direct_map_ro())
> change vmap to ROX (call change_memory_common())

set_memory_rox() is correct. What I meant is that in alloc_insn_page(),
execmem_alloc() already returns RX memory. Calling set_memory_rox() does
indeed change the linear map to RO but it also changes the vmap memory
to RO and then to RX. There's no need for the alloc_insn_page() to do
this but we shouldn't change set_memory_rox() for this, the latter is
correct. I was thinking of alloc_insn_page() calling a new function that
only changes the linear map.

> And I think we should have the cleanup patch separate from this bug fix
> patch because the bug fix patch should be applied to -stable release too.
> Keeping it simpler makes the backport easier.

Yes, for now you can leave it as is, that's not a critical path.

> Shall I squash the cleanup patch into patch #1?

No, I'd leave it as a separate fix, especially if we want to backport
it.

Anyway, for now, with the nitpick on the address variable name:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

