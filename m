Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63108EF8FF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsD2KXo/5uEm3T9d0++Do1JcUCIvfCYK9b/f5tqI3q0=; b=qY4C26gc+Fona8So92ub2Z7MjM
	uu5FbNVfSTPdfRdLBu6cAtelH//rd4DIyvKpaG155SsMJgfHH/815v/+JriQDjuBdM/jnyQgD5dNR
	EekVmpFN83ZW5c/K8vX4LfVr7NGVYpJZ+go3LNkdIeHhhaJ7WkbkJb18xjRWv6AYNYo+iO97LxEo0
	W/56PG3kFCouO/wX+udug3YT7wRybD7TqPFSIeKaCA5/cUkaXkuN/EFtxeOGqdJyAuSoxHXlpNtEE
	EGPEImqgWd+TivGxfIDcOlXDjXUfsn6UdtzwoKPk+XhvdB+v0+9O2so8FPIRvqXKXF+qbtpTlkkTf
	V9WC7Sow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnjd-0000000HVKz-1NSS;
	Wed, 04 Mar 2026 15:02:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnja-0000000HVKb-2bM2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 15:02:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25B47339;
	Wed,  4 Mar 2026 07:01:50 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EB233F836;
	Wed,  4 Mar 2026 07:01:54 -0800 (PST)
Date: Wed, 4 Mar 2026 15:01:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Piotr Jaroszynski <pjaroszynski@nvidia.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Breno Leitao <leitao@debian.org>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: contpte: fix set_access_flags() no-op check for
 SMMU/ATS faults
Message-ID: <aahJX0NwtYHy1ILe@arm.com>
References: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
 <aagUtDTca5d0le2Y@arm.com>
 <20260304134313.GM972761@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304134313.GM972761@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_070158_796312_843E78F2 
X-CRM114-Status: GOOD (  30.65  )
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

On Wed, Mar 04, 2026 at 09:43:13AM -0400, Jason Gunthorpe wrote:
> On Wed, Mar 04, 2026 at 11:17:08AM +0000, Catalin Marinas wrote:
> > > @@ -399,13 +416,35 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
> > >  	int i;
> > >  
> > >  	/*
> > > -	 * Gather the access/dirty bits for the contiguous range. If nothing has
> > > -	 * changed, its a noop.
> > > +	 * Check whether all sub-PTEs in the CONT block already have the
> > > +	 * requested access flags, using raw per-PTE values rather than the
> > > +	 * gathered ptep_get() view.
> > > +	 *
> > > +	 * ptep_get() gathers AF/dirty state across the whole CONT block,
> > > +	 * which is correct for CPU TLB semantics: with FEAT_HAFDBS the
> > > +	 * hardware may set AF/dirty on any sub-PTE and the CPU TLB treats
> > > +	 * the gathered result as authoritative for the entire range. But an
> > > +	 * SMMU without HTTU (or with HA/HD disabled in CD.TCR) evaluates
> > > +	 * each descriptor individually and will keep faulting on the target
> > > +	 * sub-PTE if its flags haven't actually been updated. Gathering can
> > > +	 * therefore cause false no-ops when only a sibling has been updated:
> > > +	 *  - write faults: target still has PTE_RDONLY (needs PTE_RDONLY cleared)
> > > +	 *  - read faults:  target still lacks PTE_AF
> > > +	 *
> > > +	 * Per Arm ARM (DDI 0487) D8.7.1, any sub-PTE in a CONT range may
> > > +	 * become the effective cached translation, so all entries must have
> > > +	 * consistent attributes. Check the full CONT block before returning
> > > +	 * no-op, and when any sub-PTE mismatches, proceed to update the whole
> > > +	 * range.
> > >  	 */
> > > -	orig_pte = pte_mknoncont(ptep_get(ptep));
> > > -	if (pte_val(orig_pte) == pte_val(entry))
> > > +	if (contpte_all_subptes_match_access_flags(ptep, entry))
> > >  		return 0;
> > 
> > Actually, do we need to loop over all the ptes? I think it sufficient to
> > only check the one at ptep since it is the one that triggered the
> > fault.
> 
> With CONT we should not be thinking "the one that triggered the
> fault".
> 
> The PTE that triggered the fault is the PTE that the HW happened to
> load into the TLB, we cannot assume it is the sub PTE we are faulting
> at. For instance it could be a sub PTE for a completely unrelated
> access at a different VA that got cached.

Good point. For the AF bit, the hardware is not allowed to cache it in
the TLB, so we can't get an AF fault for an unrelated VA nearby. We can,
however, for the dirty bit since PTE_RDONLY is allowed to be cached in
the TLB.

> Again, the requirement here is that a fault on a CONT PTE must fix all
> the access flags to be consistent or fail. It cannot resume the fault
> and leave the sub PTEs inconsistent as the HW is always allowed to
> load the RDONLY one for any access to the CONT.

It should fix all of them to be consistent if it got a fault. I was
wondering whether we can simplify this with a single pte read (but still
setting all in the range). It only works for the AF bit, not dirty. We
could add a check if it makes things slightly faster on this path.

Now I also wonder if the `pte_write(orig_pte) == pte_write(entry)` check
to elide BBM is still valid if we have hardware that does not support
DBM. I need to dig some more into the Arm ARM.

-- 
Catalin

