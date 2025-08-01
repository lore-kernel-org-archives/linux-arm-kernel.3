Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C361BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7O/9OB/OixobXY+5PaDlI8lOI+I865lgPAWLh+ujUZY=; b=2evn7MVjAXiD5OOWhqqhJu9DNC
	M2Hx/5I+n1WeqzbeD0NHdT8pdxA/7daBtL0uRBTxbyB2YdF04CmMXL13qyl0FEo1lJNDEhyZeXuWZ
	ZUToAWYQCAKw9kOP4tMVPQjDOdUQvMQzk2A9zF6BvV0V8HUpQm1PP7ODULAdmKHt1Cc3YyE49rbvb
	XN4doUuJDROYLJmmDGc6Vt86CdYrG5guXGQfwFDd428uOmZZ5wQR/XoEFywtAHyDTdlMuDk+K5Yvf
	rySK1nUy/Dg2/3gBVkX7Tzv4HBdD9lso1s8Ks+6JAvoy0RsEYu5kZH/kI86JFBImdYoZ4bNxUx+mH
	63fjrfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhs2r-00000006OGe-12FB;
	Fri, 01 Aug 2025 15:51:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhs0G-00000006Nul-1ZVe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 15:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94EE1A55754;
	Fri,  1 Aug 2025 15:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E4CC4CEE7;
	Fri,  1 Aug 2025 15:49:00 +0000 (UTC)
Date: Fri, 1 Aug 2025 16:48:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com, mark.rutland@arm.com, urezki@gmail.com
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aIzh6ixbKR5TnnPb@arm.com>
References: <20250723161827.15802-1-dev.jain@arm.com>
 <aIpPsg1Kij8Knnjl@arm.com>
 <9169f4a1-1ad3-4ef0-8d16-eabebfa64cf0@arm.com>
 <aIuihRzw1xvZ-PaY@arm.com>
 <c53ec40c-1fe4-4092-a876-61d5b37d8b02@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c53ec40c-1fe4-4092-a876-61d5b37d8b02@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_084904_478325_833D630C 
X-CRM114-Status: GOOD (  24.06  )
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

On Fri, Aug 01, 2025 at 05:45:53PM +0530, Dev Jain wrote:
> On 31/07/25 10:36 pm, Catalin Marinas wrote:
> > A control dependency would work as well without a barrier, i.e.:
> > 
> > 	if (READ_ONCE(*ptdump_lock_key)) {
> > 		mmap_lock();
> > 		mmap_unlock();
> > 		WRITE_ONCE(*pte_page, 0);
> > 	} else {
> > 		WRITE_ONCE(*pte_page, 0);
> > 	}
> > 
> > but the compiler is probably free to only issue a single WRITE_ONCE()
> > irrespective of the ptdump_lock_key check.
> > 
> > Of course, using smp_load_acquire(ptdump_lock_key) would also work.
> > 
> > However, things get fuzzier as we don't have a classic load from the
> > ptdump_lock_key but rather a patched instruction. We need to guarantee
> > that t2' is issued after the t2 branch when the instruction is patched.
> > The kick_all_cpus_sync() on the static key disable path doesn't help us
> > since P0 (T2 in your description) may see the patched branch/nop and go
> > straight to the WRITE_ONCE(*pte_page). Not sure what barrier helps here
> > (after more sleep, I may have a better idea tomorrow).
> 
> Got it. The hole in my proof is not with Case 2 but with Case 1: the assumption
> in the reasoning is that pmd_free() will be observed after the patched-in
> read lock/unlock, but that will happen when patching-in happens, for which
> we need to observe the branch before the pmd_free(), but that isn't guaranteed
> since there is no barrier between the if block and the pmd_free(), nor is there any
> control dependency, like you describe above. So, in pud_free_pmd_page, the entire block from "pmdp = table"
> till "pmd_free()" can be observed before the observation of the branch.
> 
> Reading tools/memory-model/Documentation/control-dependencies.txt, I interpret that the
> compiler is free to hoist out the WRITE_ONCE() out of the control block, and then
> we have the same problem, BUT I tested with herd and the test passes :)

I don't think the tool reorders the litmus test events based on what a
compiler may generate. However, with instruction patching we don't even
have a control dependency - there's no check of the ptdump_lock_key but
a replacement of an unconditional branch with a NOP (or vice-versa).

Anyway, email to the memory model experts in Arm sent (you are on copy).

-- 
Catalin

