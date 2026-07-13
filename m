Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BD7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dzo0aQhKHRe0yCpBtRorQ5XeL5CGII/S8gcGTTckFLg=; b=zA7Flwb2KJBE9QswyUBuFUnQsi
	nLq/U6S04KpvAZA5WcpjeRC/T+6mteH7nj+gl5ABGWsSnGH0lk/P6yOQAEWbWEAFaVTUINfagzaFL
	iqClALxQV5ozKtv7bYuJy0gDL7oK15nEULKC2KwSpiVPH5T8Djzprp+AQC9zVfKU5clyLkrGz611m
	O6R7S+txb4RiDwL+owX7eTdPELO3Aol/xxBPhQw9JcWis5YHDLrV4FDAJ8L+u3R/eWhSjVojPoZ7n
	Y1VOrTJVKWnI4VYw5xpr4w7qwdaNgJs73YE8RNnTUEmOJXskhAtD3YbJX2Z5Yh5y+M0Xj8EHB1hoR
	oBwZP7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ3V-00000009sli-0wem;
	Mon, 13 Jul 2026 15:58:53 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ3N-00000009sis-1kJm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:58:51 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c556ada3so112205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783958323; x=1784563123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dzo0aQhKHRe0yCpBtRorQ5XeL5CGII/S8gcGTTckFLg=;
        b=W9rlkvm+exCfD78/PgrqG5GKeO2h/MNEF5DRBVrMiU1B7ncW2XXyw/tlj1iZ5xyoij
         JimUKVO7FmV0Ag3+aUbQnG2aFP0O1esdukJzSznSJqMmUv6k7wxMnY2/JeVh1Qar+/sI
         hf4dfXxBUx2KckJgbpSlqBMkhsHE91zf+qK58gfeRkDHHccFjSXCkOVCaaKYn5xynscM
         4eS+sAKUwizl+neJjPLuRoTVouPlLa6SjN3Ky0tWwqnba9X8ifoDStsgC5odE/Jhfcxl
         nau025pgPd40NaTrB24Ep4714TtF5k3OW/6HhhDNRqA7IqlaJmFgQSHIbczXUlPJevVQ
         wBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958323; x=1784563123;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dzo0aQhKHRe0yCpBtRorQ5XeL5CGII/S8gcGTTckFLg=;
        b=LEvO0fDT/Q+RiW8Opaiy8PWZJERET4tdSyslh87F1kkqQuvdxrBISYJ0rZVBEwxx4T
         A4nm1J7m7XEGlKiy+LgknqN/UO46oRgmqHZ+bfFM6Hqzi/fcpCOGB+qZxgp9I0s/Sp5C
         AKiDv+X7sGIQca7Th16F+Wucm2aRQZFw1tsZeESER0aHvz0HJGfNAiCXUHzXsoyMepEa
         DbpbT95Ji3+LIChA3sk2Nt6QQHdhhvy6Sn4xmWvqa9NReISh3FjyMWiCNY1NMfMeRDFD
         tAjuaKXvm/dMQqK6xuxGCAZvNMQL+pBivd7D3ckGS6WcvPz0Govah7FuEFJTjQ2GrSZA
         GBow==
X-Gm-Message-State: AOJu0YzAppxAxuvEzXmqCnSBBUvTb5DslJhzC8JWKfZNadn+8kAGqudc
	7NfhcvdSZr6frV2jARpSJewSRRAs5m/sA4h4LF5ksiBMP0j+Wy/cqsgr1bN7WVxYj+OKWViFx5o
	eeejtMA==
X-Gm-Gg: AfdE7ck/1QPBy07HwFg64jyHbrsHkG8VFL0fTrdELQvm2l/z6XuAsO+JOvoxRb43205
	soYF/JMr6sDNKYbgOAY6A01wNds6fmSVE1Jz41rL6AceRirEmvIrRCViD+mCCXXfylnWCKon4J0
	502WJBuxacbE48smcliayt8vyWeWL62qUI7aCuzdNCciPmG8lScYMrFN6cwt/iLKQWtsVJ/lhLE
	WO/gaEx5wXE4pWAlISLUSXSs/RKRvtsKbj90MBDAderF43S6Ws3kwFWPh/nej7ozB/H1nG6yKu4
	1qyQTXo/W/5iTrobhWEiT9bVrOveBR5K3HZQdIrrIs0eAav0Fteio/KozpGyTPaXHq9hKDXd589
	vpf0+7k9cOYCUQhQVMJXEx3pNGd/CQJpwFr+oU2rqDdNwqTxO9ic4bMjN+DiQuQ56ztS67Wtvhp
	lzEFHM3wvbgdPJA4SIG8ar663k2xaLxoudxnflMXIEjaGXZydh
X-Received: by 2002:a05:600c:46cc:b0:493:b47f:a24 with SMTP id 5b1f17b1804b1-494621553d8mr511115e9.6.1783958322657;
        Mon, 13 Jul 2026 08:58:42 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49510c8e220sm1623155e9.15.2026.07.13.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:58:41 -0700 (PDT)
Date: Mon, 13 Jul 2026 15:58:38 +0000
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
Message-ID: <alULLrgdVUZvYYui@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
 <alUA7zsJO1FGnss-@google.com>
 <alUD1IiSgNkhzFGR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUD1IiSgNkhzFGR@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_085848_848392_F7612B2F 
X-CRM114-Status: GOOD (  43.75  )
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

On Mon, Jul 13, 2026 at 04:27:16PM +0100, Vincent Donnefort wrote:
> On Mon, Jul 13, 2026 at 04:14:55PM +0100, Vincent Donnefort wrote:
> > On Mon, Jul 13, 2026 at 02:00:31PM +0000, Mostafa Saleh wrote:
> > > On Mon, Jul 13, 2026 at 02:24:19PM +0100, Vincent Donnefort wrote:
> > > > On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> > > > > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > > > > to establish DMA isolation.
> > > > > 
> > > > > An initial snapshot is created after the driver init, then
> > > > > on every permission change a callback would be called for
> > > > > the IOMMU driver to update the page table.
> > > > > 
> > > 
> > > [...]
> > > 
> > > > > +	 */
> > > > > +	if (pte && !kvm_pte_valid(pte))
> > > > > +		return 0;
> > > > > +
> > > > > +	if (kvm_pte_valid(pte)) {
> > > > > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > > > > +		/* If the range is mapped in a single PTE, it must be the same type.*/
> > > > > +		if (!addr_is_memory(start))
> > > > > +			prot |= IOMMU_MMIO;
> > > > > +
> > > > > +		return kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > > > 
> > > > Do we really need to do that when is_memory()? 
> > > > 
> > > > fix_host_ownership_walker() by calling host_stage2_idmap_locked() and
> > > > host_stage2_set_owner_locked() should already handle the memory region. That
> > > > would also get rid of kvm_idmap_initialized.
> > > > 
> > > > So this one here could only take care of the MMIO?
> > > > 
> > > > Overall we would have a common point of synchro which is
> > > > fix_host_ownership_walker() after which the host ownership is ready for both
> > > > CPU stage-2 and the IOMMU?
> > > > 
> > > 
> > > I am not sure I understand, this is another empty page table, so we
> > > have to walk all of the host CPU stage-2 page table to shadow it in the
> > > IOMMU. if you are refering to the case where it handle zero ptes for
> > > memory, I can drop that but it will not change much in this logic.
> > 
> > In fixup_host_ownership() we already walk the hyp pgtable to know what needs to be
> > map/unmapped from the host stage-2. Can't we rely on that for the IOMMU
> > page-table as well?
> > 
> > As of, fix_host_ownership() could handle the host stage-2 __and__ the iommu? 
> 
> What I have in mind is the completely untested snippet:
> 
> index 75b00c323310..64cd175ad6c0 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -226,10 +226,11 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
>         case PKVM_PAGE_SHARED_OWNED:
>                 set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
>                 set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
> +               kvm_iommu_host_stage2_idmap(phys, PAGE_SIZE, IOMMU_READ | IOMMU_WRITE);
>                 break;
>         case PKVM_PAGE_SHARED_BORROWED:
>                 set_hyp_state(page, PKVM_PAGE_SHARED_BORROWED);
> -               set_host_state(page, PKVM_PAGE_SHARED_OWNED);
> +               kvm_iommu_host_stage2_idmap(phys, PAGE_SIZE, IOMMU_READ | IOMMU_WRITE);
>                 break;
>         default:
>                 return -EINVAL;
> @@ -258,15 +259,20 @@ static int fix_host_ownership(void)
>                 .cb     = fix_host_ownership_walker,
>                 .flags  = KVM_PGTABLE_WALK_LEAF,
>         };
> +       u64 mmio = 0;
>         int i, ret;
> 
>         for (i = 0; i < hyp_memblock_nr; i++) {
>                 struct memblock_region *reg = &hyp_memory[i];
>                 u64 start = (u64)hyp_phys_to_virt(reg->base);
> 
> +               kvm_iommu_host_stage2_idmap(mmio, start, IOMMU_READ | IOMMU_WRITE | IOMMU_MMIO);
> +
>                 ret = kvm_pgtable_walk(&pkvm_pgtable, start, reg->size, &walker);
>                 if (ret)
>                         return ret;
> +
> +               mmio = start + reg->size;
>         }
> 
> I believe this does the same as kvm_iommu_snapshot_host_stage2(). WDYS?
>

I see. However, that does not init the memory owned by the host, neither
unmaps hypervisor owned MMIO.

Besides, as mentioned in the reply, that mean that the IOMMU has to be
init earlier which has it's own problems. So, I do not think that it
is worth changing the current logic.

Thanks,
Mostafa


