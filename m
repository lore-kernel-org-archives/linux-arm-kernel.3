Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4657AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyZuaZgVMmJscBeBh04gUUQoTYZ+pKlntaOnTL9z2uQ=; b=O12ETpl8gHt150pzoiVL3BPPYv
	u5W22gg4UQH31KbVoByZcwAGd8hovSBq94Qd6L2eiPjeKr7JpLXvhLzU7PH5FcTyn1i/c5igLTvzY
	oEoAm9S+gVa4c+4n5MosEntxYrQGcp4ogiS+fMBruXw9vtIzNh8ZeW1r+0tosD2FhGsmP+c6NoR59
	iDZBMWpikD3cOyTEZ6pxD1GK2NCCb83zwm4NQMoKEXqXppgmeuUSNklFzb+mAt2vVGMwbirMRxoP4
	3+K3X9eD4K1Eerul1Qh26EqfJLLt2QlP0/Dx1KbeEYbFTagehvfjdipueBxeLn0MhaEkxUaal+i+S
	ch3i1aKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYwm-0000000BMoD-0D7v;
	Tue, 14 Jul 2026 08:57:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYwj-0000000BMnr-0yHd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:56:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493b8d99342so40625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784019415; x=1784624215; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QyZuaZgVMmJscBeBh04gUUQoTYZ+pKlntaOnTL9z2uQ=;
        b=vmm02E/GawdXEVGStwnAJPwnugTKKZkMsZUjzavyvgk6nri/ha7uMrrtdyhThDGMpc
         kWs5MBfULhCqOaixrILnnQ13+myhuGUXWWD6xJxXBC5QvA7E2CP0IpNpO++yX9zY99Lb
         oepXFkKi5DL44dCBaW+hYiXuAZSJUPSvFkkfAjJk5iAPuQNj/WvDpo1DPgwlZXyZHDqE
         U7je7siSJVioYkk+Rt8XKarqhkMlOvqeCKeCMUyskqYGupUpO15w/MyA/j8lazncogSH
         Y4HtDvWj1+xBmzH81FBKQJyib+sBn2SdBtWigInveDgyul/rl2QYGRgN+Anv4A8WIyOT
         hJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784019415; x=1784624215;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QyZuaZgVMmJscBeBh04gUUQoTYZ+pKlntaOnTL9z2uQ=;
        b=IxYvJc9JzUOwzlRhgANQeAQXbJ5XONiFcnEd0RCOh1EoQLDMlCdtwaAvRiREaSKXuT
         Lcj3h6ONr1WDQYMSuemn1KJVnIqfFinD5AL6sALuGUDJJKA/r4ONyUvGLE94UN/5dKbH
         GTQvJALFOThi1KIzNCj13/c/XyB0Z3J52J16vyZIcyRJRu/qATIzMNR/6mv++YbSH9/d
         D/nWdDbF3fhYQfuYrAoJb334KxOea9Bn8FOPyaFh61V7puM2U/dhQmAZS5JHfQrPq83W
         bMRlioTT6bsvMlPBeAxn/5PAmd1JG0YBD2uRxkkYlDCSHWPODCYOARnCS7Q4FFeEwfg8
         inDQ==
X-Gm-Message-State: AOJu0YyUkRoMh2ve27Yw84+EzlSWO9bpzlxZbkpDGp4FXeXi2qBR7u2l
	5z0IOaez7dLzinthK/efh7mE17q3iiJtTSu6noGD55ktFMvkTX6VrWzb/2eGTyDJhA==
X-Gm-Gg: AfdE7cn2Aw6Z/UkTv95u7Iv6CmUNdSxgUNFjrLmOFg5M2DOjsXMNI5/rtndyMzNLoB+
	FKC6D/Ny2BoFffDVdkRePjr6oHMAEfEno3HdwdGhogiyIH3cmVX0P3IDXJ9VvuQC7RdBm+M+l2o
	gr1gwFAVl+wiAzE34ajXUcW6x4eVZK4QktKsQlISzx2atN7+84yqal+XIsNoQzDB8v32vvmIPnG
	MKjSbev2fxki1hvNcP+ny7PZhK+oGPaKdT9EgY/bsQ1LosKN+aLM9meqhn4gnsCszies7pIK0JG
	PdxZKNb/35Rl1RDIlhLolhUXv6nVQxEndytwoZHkORyLqYMLXOh5Hxwcz8AE6z9UTluTn4NwX8r
	7AgEQXLoS2X71DIAFPOgoXnAm49LpVnx//XRn056o2mf7eU8BjY5oy1fdNkBPPJQxrspciII1kX
	cfMHUwIRG1H34Dz3pTEViRz2EyQIltel6DDTyXypE79whyk566
X-Received: by 2002:a05:600c:8b6f:b0:492:668f:410c with SMTP id 5b1f17b1804b1-494688928b1mr1719985e9.10.1784019414601;
        Tue, 14 Jul 2026 01:56:54 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f9402sm64121965e9.13.2026.07.14.01.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:56:53 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:56:50 +0000
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
Message-ID: <alX50s8IglxiEHMB@google.com>
References: <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
 <alUA7zsJO1FGnss-@google.com>
 <alUJa5cbjjqZ8n72@google.com>
 <alUMVU7DYcrvgAYi@google.com>
 <alUsLFBQ5qKFOgwQ@google.com>
 <alXwXRGqECTUZ3ou@google.com>
 <alXzcrnxWADIEL2H@google.com>
 <alX3nHLykNc_nng5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alX3nHLykNc_nng5@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_015657_297556_A9D82124 
X-CRM114-Status: GOOD (  35.86  )
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

On Tue, Jul 14, 2026 at 09:47:24AM +0100, Vincent Donnefort wrote:
> On Tue, Jul 14, 2026 at 08:29:38AM +0000, Mostafa Saleh wrote:
> > On Tue, Jul 14, 2026 at 09:16:29AM +0100, Vincent Donnefort wrote:
> > > On Mon, Jul 13, 2026 at 06:19:24PM +0000, Mostafa Saleh wrote:
> > > > 
> > > > That would walk the table twice, first time with a massive map, then
> > > > to unmap the pages that was just mapped, issuing TLB invalidations
> > > > for all of those, also as the IOMMU page table code never frees tables
> > > > that means we would immediately exahust the IOMMU pool.
> > > 
> > > Well the massive map is pretty quick we would mostly just allocate the PGD? And
> > > then it would be just for the subsequent unmaps to split the blocks. So nothing
> > > to be freed really and no risk to exhaust the pool. But if you put the calls to
> > > the host_stage2_* functions that's pretty transparent.
> > 
> > Not for the IOMMU, everything is mapped with a leaf mapping, because
> 
> Ha Ok my bad, I didn't get that!
> 
> > the pgtable code does not support splitting blocks, this is something
> > I plan to add support for in a follow up series after this one is
> > merged along side other optimizations.
> > 
> > > 
> > > Just to make sure I am clear. Here's what it could look like:
> > > 
> > > in iommu.c:
> > > 
> > > int kvm_iommu_stage2_idmap_init(struct kvm_s2_mmu *host_mmu)
> > > {
> > > 	u64 addr = 0;
> > > 
> > > 	for (i = 0; i < hyp_memblock_nr; i++) { 
> > > 		kvm_iommu_stage2_idmap(addr, reg->start, IOMMU_MMIO);
> > > 
> > > 		addr = reg->start + reg->size;
> > > 		kvm_iommu_stage2_idmap(reg->start, addr, IOMMU_READ | IOMMU_WRITE);
> > > 	}
> > > 
> > > 	kvm_iommu_stage2_idmap(addr, kvm_phys_size(host_mmu), IOMMU_MMIO);
> > > }
> > > 
> > > in mem_protect.c:
> > > 
> > > int kvm_host_prepare_stage2(void *pgt_pool_base)
> > > {
> > > 	...
> > > 
> > > 	return kvm_iommu_stage2_idmap_init(mmu);
> > > 
> > > 	/* 
> > > 	 * From here, all the changes to the host stage-2 will be reported to
> > > 	 * the iommu driver
> > > 	 */
> > > }
> > > 
> > > On the pro side: no custom walker and we really couple the iommu idmap to the
> > > host stage-2 map.
> > > 
> > > On the con side: As you've pointed out, we'd need indeed the iommu to be ready
> > > early enough.
> > > 
> > > If you want to stick to the snapshot function, could we have the walker to
> > > first walk the hyp_memblock? the .arg could just pass if we are walking a MMIO
> > > region? That would avoid that find_mem_range_from() and I believe would
> > > massively simplify the snapshot walker.
> > > 
> > 
> > I see, let me try that.
> > 
> > 
> > Unrelated to this, but while looking into option#2 I see that
> > __pkvm_guest_share_host() does not call either of the
> > host_stage2_set_owner* so that requires another explicit
> > pkvm_iommu_host_stage2_idmap() call.
> 
> It does! it calls __host_set_page_state_range() which calls
> host_stage2_idmap_locked().

But host_stage2_idmap_locked() does not call any set_owner variant,
so __pkvm_guest_share_host() would require an explicit
pkvm_iommu_host_stage2_idmap() call.

Thanks,
Mostafa

> 
> FTR, I don't really like __host_set_page_state_range(). And we removed it
> recently from our Android tree. Because there's just a special case in
> __host_set_page_state_range() to cover guest_share_host. So we can easily
> replace all the callers with __host_update_page_state() and and call the
> idmap explicitely in __pkvm_guest_share_host().
> 
> > 
> > I still plan to use option#2 in v7.
> > 
> > Thanks,
> > Mostafa
> > 

