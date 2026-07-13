Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B87C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRa3gkBurBR7N5v7ETtohTvNPFwYZWxGltJdYj43XxQ=; b=aTbMLhiww8IrZliNfHH+MN8awo
	33G0nohmv4ib49wN8GgI0FubKX/b2qaw0thYT9upTuHr5qhjLsv1wVLVNNtPHuOaas9osJSOfK4xq
	W8EvPmHbxUr1kSxchaV22BAzSrD3Qz1zv3/aENdHT/lRJVvzWzWDt4C1FOJbaH7bDpJbVbj0qAhr1
	dj+gzPrxr4A8rmjH/TcDtTHJbH1KlMDdyji3++R80ras4EOWVBI8vdelENqbYqUp4MZIrjjhhDpDI
	n9qvaZe5ZQ+VySjzJnZa2iqwm5km48neU/JKAmVjDItHTcGFwqPq16Pb/3iGCY3NGNapliM0rmKSD
	6Van8ebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLFe-0000000ACLM-3ZKL;
	Mon, 13 Jul 2026 18:19:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLFc-0000000ACKD-2YlQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:19:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493b8d99342so5695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783966771; x=1784571571; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TRa3gkBurBR7N5v7ETtohTvNPFwYZWxGltJdYj43XxQ=;
        b=MrcIfMNACr/TbF1dtO/O0VBg7TY+SXe3bpUSb45gr2MqMwjujtcqlkS9IoCA5Z4vfk
         LR+jlMD64bM1EETO9tMQBpGEvbYR5uV6JOUPs9LJ4gmZJ5zkhG8AanbnhR7biPcRvhTi
         8V+xwF4cunugmYUv00QSBzeGExABB0qUOIi9U/UUgiiTYYSW31aJUD+hjPHUKXwtr9MW
         xKCnzJvmE8vkC4wvF9KlW2WfO1s0fwCq9KLkZzi2q4wGAsqdohT5GjEq6S7ZFLlliW6v
         Umxdu4GIv5m97V60HbfZoBiSEaSocKFkMT2UEcAgfnRdvxrX3bUpu+4TBEmS3X+gG/fk
         wn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783966771; x=1784571571;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRa3gkBurBR7N5v7ETtohTvNPFwYZWxGltJdYj43XxQ=;
        b=WByb+HOuqm3jC1R1vAEXFVr+mO2f4iVfF6JrWJpUeQ730rfG0+yp/fEjrycxT2mgcF
         kveoc1vPGOdsbbeSZ6pp+IpnydebJnAoCX8r5ZifjVAxOwsHsQuV5p0J0+D38QJwPutX
         WaMhcN2N2ebSHjNLk5t7tRuhDD9B8A+AM1PnabXSKVYPe06ypztzjilzodTvsk5FhQey
         pBNzuFHryFagFXYSAn6IMfRHIwtTveZ8WXaT+/fwh0voPyAh2LUeGBAz6VAOuHv0IWgi
         jwHDsU9LPCFqltSakFPPPXXRpjnsQ1SWx04kqdTjQwO/vV5h0jTYtgrTH2GsdiQztyvl
         DkOA==
X-Gm-Message-State: AOJu0YwEYbVR2j+FwhwHcW164xuLKyPEyRJ6TpJArHbq5TpG61JyyFPT
	wCrJGdwf40XmrXQ/uouEN2hU/LwP+HigMvIG5JcaG8Fvq3ofwmTfd3uAiBhi9KZTHl7PC6Ta0jf
	JaHIw5A==
X-Gm-Gg: AfdE7cmGNX6VbQ8oO4ku02xh4AGupzfUTqMVV215+vlvNvaT9et40usRIx49g1qKacS
	ZRhVNd0e9eJZ1ZAOaSSvrA6ovFjFgSHq+dUgy0gxMgM+zD2uc4iC+wDaxebUWe2fPPGR5ijVByc
	RdSiLoz5EB/ePDhjZ54tUQlVABfJTC5R9uy/LCXkxtUCmZpIjFIQyCoXa/QW8PIofuBGXNZ7QkG
	hbhHhB18GWIw4o3Kh55CfewBiTbsVTIM9pZf2z6ppQz2b4qoz0/7tgc3Fcl4V/lTpWjpNxvhmUr
	dAmleE5rtcmALbH6kqYSdJU42Nex4XVshPvbM2JMsT9LinTDoQwUf97K+shryQCSf0HNpEJFfrd
	o7lL23nEji+aA25q+nAf4W53kJ9lUwcpW3Vr93viv82YrnQv4sRnxDdMNGK/IfApEioyGxXgddj
	FEghHXojk6MK/yWoTSsXIK9sDgNZrBz0YF4moxsBYDgzHiB+ET
X-Received: by 2002:a05:600c:3f19:b0:493:adf3:d892 with SMTP id 5b1f17b1804b1-49462146d30mr789945e9.3.1783966770170;
        Mon, 13 Jul 2026 11:19:30 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a38b19sm215129925e9.0.2026.07.13.11.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 11:19:29 -0700 (PDT)
Date: Mon, 13 Jul 2026 18:19:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alUsLFBQ5qKFOgwQ@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
 <alUA7zsJO1FGnss-@google.com>
 <alUJa5cbjjqZ8n72@google.com>
 <alUMVU7DYcrvgAYi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUMVU7DYcrvgAYi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_111932_678273_751D5E45 
X-CRM114-Status: GOOD (  45.92  )
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

On Mon, Jul 13, 2026 at 05:03:33PM +0100, Vincent Donnefort wrote:
> On Mon, Jul 13, 2026 at 03:51:07PM +0000, Mostafa Saleh wrote:
> > On Mon, Jul 13, 2026 at 04:14:55PM +0100, Vincent Donnefort wrote:
> > > On Mon, Jul 13, 2026 at 02:00:31PM +0000, Mostafa Saleh wrote:
> > > > On Mon, Jul 13, 2026 at 02:24:19PM +0100, Vincent Donnefort wrote:
> > > > > On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> > > > > > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > > > > > to establish DMA isolation.
> > > > > > 
> > > > > > An initial snapshot is created after the driver init, then
> > > > > > on every permission change a callback would be called for
> > > > > > the IOMMU driver to update the page table.
> > > > > > 
> > > > 
> > > > [...]
> > > > 
> > > > > > +	 */
> > > > > > +	if (pte && !kvm_pte_valid(pte))
> > > > > > +		return 0;
> > > > > > +
> > > > > > +	if (kvm_pte_valid(pte)) {
> > > > > > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > > > > > +		/* If the range is mapped in a single PTE, it must be the same type.*/
> > > > > > +		if (!addr_is_memory(start))
> > > > > > +			prot |= IOMMU_MMIO;
> > > > > > +
> > > > > > +		return kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > > > > 
> > > > > Do we really need to do that when is_memory()? 
> > > > > 
> > > > > fix_host_ownership_walker() by calling host_stage2_idmap_locked() and
> > > > > host_stage2_set_owner_locked() should already handle the memory region. That
> > > > > would also get rid of kvm_idmap_initialized.
> > > > > 
> > > > > So this one here could only take care of the MMIO?
> > > > > 
> > > > > Overall we would have a common point of synchro which is
> > > > > fix_host_ownership_walker() after which the host ownership is ready for both
> > > > > CPU stage-2 and the IOMMU?
> > > > > 
> > > > 
> > > > I am not sure I understand, this is another empty page table, so we
> > > > have to walk all of the host CPU stage-2 page table to shadow it in the
> > > > IOMMU. if you are refering to the case where it handle zero ptes for
> > > > memory, I can drop that but it will not change much in this logic.
> > > 
> > > In fixup_host_ownership() we already walk the hyp pgtable to know what needs to be
> > > map/unmapped from the host stage-2. Can't we rely on that for the IOMMU
> > > page-table as well?
> > > 
> > > As of, fix_host_ownership() could handle the host stage-2 __and__ the iommu? 
> > 
> > fix_host_ownership() only walks the hypervisor page table, and fixes the
> > hypervisor pages in the host.
> 
> Yeah, Looking closer I don't think my proposal simplify things so much in the
> end.
> 
> > That means that the IOMMU page table has
> > to  be fully populated first, then we unmap the donated pages.
> > That seems more complicated and it feels that decoupling the IOMMU
> > logic outside of this would be better.
> 
> Why more complicated? That's actually another solution I was thinking about, to
> just map everything as soon as possible and let host_stage2_idmap_locked() and
> host_stage2_set_owner_locked() unmap what is needed here. (and also in
> __pkvm_host_donate_hyp_mmio())
> 
> We wouldn't need any specific setup walker for the iommu at all.

That would walk the table twice, first time with a massive map, then
to unmap the pages that was just mapped, issuing TLB invalidations
for all of those, also as the IOMMU page table code never frees tables
that means we would immediately exahust the IOMMU pool.

Also, I believe that it is better to isolate the IOMMU page table
shadowing logic from the core hypervisor page table setup, specially
AFAICT, that was not what fix_host_ownership() was designed for, and
seems the IOMMU will just piggyback on a existing walker.

> 
> > 
> > Also, I rely on the IOMMU init to be done at the end of setup, so we
> > do not have to clean the IOMMU init if any other part of KVM fails.
> 
> We could just leak those pages if it fails?

It is not just about pages, the hypervisor will also configure the SMMU
registers. Ideally, we would need a remove() driver ops for such cases
but I added the IOMMU init call at the end to avoid making this series
any bigger.

Thanks,
Mostafa


