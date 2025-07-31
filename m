Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B2FC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pV7YGKsXkfb9P0H0WBjzoDAyQmik89jc68S6AND8OW4=; b=KbCgd2U1+Qcc1EbAcwS4GWJqN6
	Ee1Br902XurMG42Ygyq5T6vEGXEaLcEbUnfpQw1GXIfVj/bKuLNCtdQmtzQyKaPu7L1ZSqzyiIJel
	Uif87gI1tv/RwCasMADZaM4bHQn7K0qkle3FlDvKfHDeXCrH9bgt2XElTSaRwjw+i+7xP0F5Orlrf
	s3ufe0WScxc9JAdhXNkEUoOd8zQZ7nxzh+QzjSZkzU61FhkcPsogbbEACT+dlhi9sswRgi734MvAh
	HYf9vbZ3TnU4tqu7ISGNFt0hmzu9gD2Xx+VXMH4vDqgOJ+MjB93VPvn7RZV0a+TXZ+vOXO/EfX9cu
	mAtYCTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhRes-00000003Unt-0U3F;
	Thu, 31 Jul 2025 11:41:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhRcH-00000003UdT-3aA1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 11:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 247665C62BC;
	Thu, 31 Jul 2025 11:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FB0C4CEF6;
	Thu, 31 Jul 2025 11:38:30 +0000 (UTC)
Date: Thu, 31 Jul 2025 12:38:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
	anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com, mark.rutland@arm.com, urezki@gmail.com
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aItVswTcGVz_A6K8@arm.com>
References: <20250723161827.15802-1-dev.jain@arm.com>
 <aIpPsg1Kij8Knnjl@arm.com>
 <8f89490b-bac5-4297-a4a8-9e9c4a8f5ef5@arm.com>
 <20ab00da-e85d-4f18-b482-bb406275693c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20ab00da-e85d-4f18-b482-bb406275693c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_043833_936033_5B15A885 
X-CRM114-Status: GOOD (  22.80  )
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

On Thu, Jul 31, 2025 at 10:00:15AM +0530, Dev Jain wrote:
> On 30/07/25 11:59 pm, Ryan Roberts wrote:
> > On 30/07/2025 18:00, Catalin Marinas wrote:
> > > On Wed, Jul 23, 2025 at 09:48:27PM +0530, Dev Jain wrote:
> > > > +	 * mmap_write_lock/unlock in T1 be called CS (the critical section).
> > > > +	 *
> > > > +	 * Claim: The CS of T1 will never operate on a freed PMD table.
> > > > +	 *
> > > > +	 * Proof:
> > > > +	 *
> > > > +	 * Case 1: The static branch is visible to T2.
> > > > +	 *
> > > > +	 * Case 1 (a): T1 acquires the lock before T2 can.
> > > > +	 * T2 will block until T1 drops the lock, so pmd_free() will only be
> > > > +	 * executed after T1 exits CS.
> > > 
> > > This assumes that there is some ordering between unlock and pmd_free()
> > > (e.g. some poisoning of the old page). The unlock only gives us release
> > > semantics, not acquire. It just happens that we have an atomic
> > > dec-and-test down the __free_pages() path but I'm not convinced we
> > > should rely on it unless free_pages() has clear semantics on ordering
> > > related to prior memory writes.
> > 
> > I can understand how pmd_free() could be re-ordered before the unlock, but
> > surely it can't be reorded before the lock? I need to go unlearn everything I
> > thought I understood about locking if that's the case...

Indeed, it can't be reordered before the lock as it has acquire
semantics.

> You are correct, what Catalin is saying is that my reasoning has a hole.
> There is no obvious ordering between unlock and free(), but
> 
> mmap_write_unlock() will happen before mmap_read_lock() ... (i)
> mmap_read_lock() will happen before pmd_free() ... (ii)
> 
> which lets us conclude that mmap_write_unlock() will happen before pmd_free().

Yes, in this sub-case, mmap_write_unlock() on T1 will happen before
pmd_free() on T2 if T2 waits on the lock.

-- 
Catalin

