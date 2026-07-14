Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA53C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnpHLlkQxy9SlCZj1TgoiRuRQAs8jFdoKCgVX9dwPjA=; b=OA6hvnOIyxSnSUajexldKFSjkq
	MULH65n593maQDlK5GQzmHFPbJ4pyKaNHR9LZMism/Rd6PYimml6jYZLXEowrtsY7vE8a3n61DC3i
	OtwEqk1WtXH/AzWf/k3Pb2J5R55vHGesOO5bZ8bwHQIxbnDRZZfYxheVXnZMqFQbwQ+TYdzdgaqgO
	o2ksw3fCCZXaGHxXs7MWLSCwveDxHaeEBziaUmD2bZV3AjUmbEkfvgjG2offUpbAhSVizVITGQXRg
	uqd813kEyE3TWeLpM+HRuqWj0WyGs+5JexYy2UiQq51omPP2uiI8xND7OFY66utWxh3ibuEh+yvzU
	I26wqwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYJj-0000000BHBB-2TkY;
	Tue, 14 Jul 2026 08:16:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYJh-0000000BHAc-3IFe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:16:39 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so3549459f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784016995; x=1784621795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnpHLlkQxy9SlCZj1TgoiRuRQAs8jFdoKCgVX9dwPjA=;
        b=tnmGygjiw/BDqUK4099k5FLGgtg+rrHWG0pvCh9UCKrVldBlCUYm/VG3+AuO0wbdJG
         Yh2sNMMHAoV6Eb3a9y6/mmS7C/P+sZet3scuF0jLRLsbC3TpAr/NNthezgWea2sEqEZW
         efjvTVKB5AbIJcEjqlIssLJAIFUYbPLTMPSswujtMTxpzbhSIlwJwasfIxThpqN1eUS9
         AmD2tfFSTb1fGziFTFqtur85ryj8OIIen2HhIQNdBjYfsrQ8jl/zZ1AkGjJZjYTSTKYO
         n98G2a8S3tPgfhibEmJqjHBU8/ALRE7h/wSs8ELWBo2+IzoBKQx8N9t1tFLb27bfhklG
         1P3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016995; x=1784621795;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnpHLlkQxy9SlCZj1TgoiRuRQAs8jFdoKCgVX9dwPjA=;
        b=C1vTSPv6yASJ74YqwRcrEp36T0Twns2X3M78RhQeAIaGpfbmBcaCEGF3Q+3GvNIGLn
         c+6vm9VjyG8iRhlgiR2lnBw1FzzjiEI/tz3kCAkN0LKf9GiM/DOlxi590eCf40DWyUz8
         XniIVDQqI3j4ftbINaGodROjJx5zk7GeTJiXcE3tEcofI3CYPDTVwbjLLpNewp3CunPl
         4nmqL3ZpOOWHobqMK3oiLhNWW44h/LWT8Gc1+Hv3W5ClxTgcWJPBFL9raCt6o4UoNqta
         7vNZwI/g1tzIj4VrdfXE+zU65QodtTVJcWfENrIpSflBm+bmEiW+Aftt1iRGRiBTwPQe
         xNRw==
X-Gm-Message-State: AOJu0YxQ2zQpYN8hsXiImmhsG2t3Kk7v2InDDfDXfsrXgsHkKFEk0ng/
	FPjBn00Y2rJvLqdxGlC1u0FewMMmF2d+WmVD6zE8XXnQ1zjGJVRnztDlWRfxAlv7wg==
X-Gm-Gg: AfdE7cmQqGEwcK4mToCysgPpfHnJvRd0bevGClHWDk2eCXHdK6a7rejZcGLAWHBCcXV
	91J1ieSNeYBvCIF6Jg6Wfzb0jU8B/oe6bMgCKYyGm9SsrP8if21BOpthOQ+5nZOAhmjDaEAXvcl
	BUj2KfafeH3y4CMU7ZNJ1+WlZgIa06kvXiBr3D7zP+SbNj6lHf88eX4EIqhlhyKIPMaAbCMRf4s
	bJxmq8m8RsidGnvanmINU8BBWleSeAGntFfoB4QkDuIi3WfOSC8I7mqdgQhiuVrnCvtUUeKR3QX
	0F9NRCS96q8jbIX2g7VDkgU23x8zIXN+12zhgp+BmvRdhyXuTH4Gj+eOv9VIiXagdLnRJ9eRArf
	EhG6htVkSLC33tW4+sqjevNwTAyIIXF6zcFFuD2XGq/noFS1CHlNlB1pg5QT259ZxMcpVmtgwwz
	W+PYA8tOqysar3zbeoT0peTtu9LhNEg3YQyDBcSeBPCusDuYBHyAe62R9yE7qWFw==
X-Received: by 2002:a05:6000:2907:b0:470:2fb1:3dbc with SMTP id ffacd0b85a97d-47f2dce7c3emr14605080f8f.35.1784016994090;
        Tue, 14 Jul 2026 01:16:34 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a63esm6159416f8f.9.2026.07.14.01.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:16:33 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:16:29 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alXwXRGqECTUZ3ou@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
 <alUA7zsJO1FGnss-@google.com>
 <alUJa5cbjjqZ8n72@google.com>
 <alUMVU7DYcrvgAYi@google.com>
 <alUsLFBQ5qKFOgwQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUsLFBQ5qKFOgwQ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_011637_864745_8168E67D 
X-CRM114-Status: GOOD (  54.02  )
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

On Mon, Jul 13, 2026 at 06:19:24PM +0000, Mostafa Saleh wrote:
> On Mon, Jul 13, 2026 at 05:03:33PM +0100, Vincent Donnefort wrote:
> > On Mon, Jul 13, 2026 at 03:51:07PM +0000, Mostafa Saleh wrote:
> > > On Mon, Jul 13, 2026 at 04:14:55PM +0100, Vincent Donnefort wrote:
> > > > On Mon, Jul 13, 2026 at 02:00:31PM +0000, Mostafa Saleh wrote:
> > > > > On Mon, Jul 13, 2026 at 02:24:19PM +0100, Vincent Donnefort wrote:
> > > > > > On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> > > > > > > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > > > > > > to establish DMA isolation.
> > > > > > > 
> > > > > > > An initial snapshot is created after the driver init, then
> > > > > > > on every permission change a callback would be called for
> > > > > > > the IOMMU driver to update the page table.
> > > > > > > 
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > > +	 */
> > > > > > > +	if (pte && !kvm_pte_valid(pte))
> > > > > > > +		return 0;
> > > > > > > +
> > > > > > > +	if (kvm_pte_valid(pte)) {
> > > > > > > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > > > > > > +		/* If the range is mapped in a single PTE, it must be the same type.*/
> > > > > > > +		if (!addr_is_memory(start))
> > > > > > > +			prot |= IOMMU_MMIO;
> > > > > > > +
> > > > > > > +		return kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > > > > > 
> > > > > > Do we really need to do that when is_memory()? 
> > > > > > 
> > > > > > fix_host_ownership_walker() by calling host_stage2_idmap_locked() and
> > > > > > host_stage2_set_owner_locked() should already handle the memory region. That
> > > > > > would also get rid of kvm_idmap_initialized.
> > > > > > 
> > > > > > So this one here could only take care of the MMIO?
> > > > > > 
> > > > > > Overall we would have a common point of synchro which is
> > > > > > fix_host_ownership_walker() after which the host ownership is ready for both
> > > > > > CPU stage-2 and the IOMMU?
> > > > > > 
> > > > > 
> > > > > I am not sure I understand, this is another empty page table, so we
> > > > > have to walk all of the host CPU stage-2 page table to shadow it in the
> > > > > IOMMU. if you are refering to the case where it handle zero ptes for
> > > > > memory, I can drop that but it will not change much in this logic.
> > > > 
> > > > In fixup_host_ownership() we already walk the hyp pgtable to know what needs to be
> > > > map/unmapped from the host stage-2. Can't we rely on that for the IOMMU
> > > > page-table as well?
> > > > 
> > > > As of, fix_host_ownership() could handle the host stage-2 __and__ the iommu? 
> > > 
> > > fix_host_ownership() only walks the hypervisor page table, and fixes the
> > > hypervisor pages in the host.
> > 
> > Yeah, Looking closer I don't think my proposal simplify things so much in the
> > end.
> > 
> > > That means that the IOMMU page table has
> > > to  be fully populated first, then we unmap the donated pages.
> > > That seems more complicated and it feels that decoupling the IOMMU
> > > logic outside of this would be better.
> > 
> > Why more complicated? That's actually another solution I was thinking about, to
> > just map everything as soon as possible and let host_stage2_idmap_locked() and
> > host_stage2_set_owner_locked() unmap what is needed here. (and also in
> > __pkvm_host_donate_hyp_mmio())
> > 
> > We wouldn't need any specific setup walker for the iommu at all.
> 
> That would walk the table twice, first time with a massive map, then
> to unmap the pages that was just mapped, issuing TLB invalidations
> for all of those, also as the IOMMU page table code never frees tables
> that means we would immediately exahust the IOMMU pool.

Well the massive map is pretty quick we would mostly just allocate the PGD? And
then it would be just for the subsequent unmaps to split the blocks. So nothing
to be freed really and no risk to exhaust the pool. But if you put the calls to
the host_stage2_* functions that's pretty transparent.

Just to make sure I am clear. Here's what it could look like:

in iommu.c:

int kvm_iommu_stage2_idmap_init(struct kvm_s2_mmu *host_mmu)
{
	u64 addr = 0;

	for (i = 0; i < hyp_memblock_nr; i++) { 
		kvm_iommu_stage2_idmap(addr, reg->start, IOMMU_MMIO);

		addr = reg->start + reg->size;
		kvm_iommu_stage2_idmap(reg->start, addr, IOMMU_READ | IOMMU_WRITE);
	}

	kvm_iommu_stage2_idmap(addr, kvm_phys_size(host_mmu), IOMMU_MMIO);
}

in mem_protect.c:

int kvm_host_prepare_stage2(void *pgt_pool_base)
{
	...

	return kvm_iommu_stage2_idmap_init(mmu);

	/* 
	 * From here, all the changes to the host stage-2 will be reported to
	 * the iommu driver
	 */
}

On the pro side: no custom walker and we really couple the iommu idmap to the
host stage-2 map.

On the con side: As you've pointed out, we'd need indeed the iommu to be ready
early enough.

If you want to stick to the snapshot function, could we have the walker to
first walk the hyp_memblock? the .arg could just pass if we are walking a MMIO
region? That would avoid that find_mem_range_from() and I believe would
massively simplify the snapshot walker.

> 
> Also, I believe that it is better to isolate the IOMMU page table
> shadowing logic from the core hypervisor page table setup, specially
> AFAICT, that was not what fix_host_ownership() was designed for, and
> seems the IOMMU will just piggyback on a existing walker.
> 
> > 
> > > 
> > > Also, I rely on the IOMMU init to be done at the end of setup, so we
> > > do not have to clean the IOMMU init if any other part of KVM fails.
> > 
> > We could just leak those pages if it fails?
> 
> It is not just about pages, the hypervisor will also configure the SMMU
> registers. Ideally, we would need a remove() driver ops for such cases
> but I added the IOMMU init call at the end to avoid making this series
> any bigger.
> 
> Thanks,
> Mostafa
> 

