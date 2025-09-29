Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075AFCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8UnufLq/Mcz1Rl9avuBFpaPVNHTq+GFP8JL6IXXjIo=; b=xjVpePpmMSRa9wdKISzxcLBCg6
	0jixEqR2JXHoub5d+Vs/+nLmnMJMdGpfQQb96onAPQBkXuYZ1lQPHCZR4lA+1TunsErK3BCn75Xmp
	xwBSEGMvQjbqMs1WahLssxVL5+sSUsbhZzq8ZM9Ridu86a8ld7WhvDVjW2lClHT4dDu3bsQF5ajzm
	waWoJnSDvGoaBnv+ECBW1nl4gVDuE/Ss/0woIkWKDWQNIbC2w8upW1P0UxV77CVkzZqIncQZdFaHg
	rQUhfhKoSudVIP663/i2F2LwaC7VALjJKCfnLiQfa/yUeMVC6LOUyPiV4KUXVOgrcOWuFyLQlNx6j
	lk/HK8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BZi-00000002Fdn-3UrY;
	Mon, 29 Sep 2025 10:57:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BZf-00000002FbZ-2mzh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 10:57:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e3bcf272aso120035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759143461; x=1759748261; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O8UnufLq/Mcz1Rl9avuBFpaPVNHTq+GFP8JL6IXXjIo=;
        b=ul2pz6d2oajgc1LLMT2QiqxeBd1zpk6PXrT7P8/RbG2HwVw493FnmD3pumhbV1CDrw
         pqlqRobqxQCrDiMQcZ0xpdL4/QrgGfnC2DnOL4U2pD3dEKcKcLIUdtEMrdL6m4e9dw9N
         +u+3fg2LGbInCDtzL19zMgIIBlEdCOVZrCVwA62DN5MzX0yZojxJPKBK8zPRBJ0+bp7i
         fQfySYdKOarjXlkVJlPXvOzeDZaQzD5jbCbDN26ly/uZCFr6CTTMOHfbtg9VKLLtmTqS
         8buyWyfDtm7y+dLWUGKe7fW9AwXHvf8hTasQWQeE2Q0QQvg44eY+ejsYjSqMIZA4vBcY
         7FOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759143461; x=1759748261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8UnufLq/Mcz1Rl9avuBFpaPVNHTq+GFP8JL6IXXjIo=;
        b=gIt1ggrCNNMzUoxMYe6cZgcZvOSSSoPGE+Sg/4K4i9Iros/QMAS3GJk3rZQ1dkMPyd
         HYUGRH3RBV0ZuFpViHSTgJjD6doYTFDuXycjEigdAsbPtGY+FlNjQsyVfFNBOMH3m0U3
         JhSWypTklTAVlU18rjxw2iTpMVYvir0qYh8BUC11EhimAH8ny6rJQFeK5Aa3bqlaaZGw
         DQ87cPe6mCOZazRwr/74m1UOBtSKq6njzV9hGI3giUYQr9NzwqtKKY1gd3zGzcIIWX1v
         ji73+kSGpiuZ78npHXH2Nq08G6S7XS8EbuZ57PnUaDD4ENiiMFIdxU8/bx46eF6Le6p8
         wVCg==
X-Forwarded-Encrypted: i=1; AJvYcCVwIojLu+dPIsiUt3pmbHp4tJ8R8j4tan7cRxr/XIyeNcoQ2+5NF47jLV6h6r4Nhvw3RpG0VhJoC4CAfW89aOjs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn2WKiuqv4uOSyJHqURJCb8Z3q66SLzBTgU4NBx0xw/CedbDsR
	HfcA493DHeEv6gaMlySb+VDybppfrO07BF9ztrxMRyFREy0LVQVCWe5mCqZukCRKuQ==
X-Gm-Gg: ASbGnctkAO06unza9F1352yW6FPtjCEK0PVaBiHeuvfiRDVTL0wGvTw8E6+u6rKi2fT
	UWZssSRuln9/dwQ3g8ZzatfrMO7oV82RUybTqt7dLM+Ayw9S6MpxED7v108oVp2T8Ew15rtdUUz
	/N3ZRy9Y59zxYN9Cs3R6GTGpoxsr/owliU33icq/Tb9wbFVyx/uotJLxQJdS295lcUr+ndvaUXR
	RD++1g/kUDcx9DtW7nnrAWaq+HaUjNlzPp2BYugFfju9743uLUdn6wZvfNoXLO0nVqCg2LKYvbx
	oDOD85QGDmC42FvIXQ4lxaqA19gUNDMhJkKHeWdijsgmY0jWIV5rex5ZTvg4DntenkRCqzmWr1h
	L3Oaa+wqS9m5nxkrLxezVUG+fVgyexAzrmebvEc4bRgCBr6b2Z1ckURWvvvU5WldvTJ1LlTPy0a
	RggbdLBbui9jv0
X-Google-Smtp-Source: AGHT+IFGle5uSDx6pJtL9z0dOczocAV6Sw1uDcPJYNHRfsKx0x2lgw6GyR50H0eIdWA6EZ8zfTw+TA==
X-Received: by 2002:a05:600c:a413:b0:45d:f6a6:a13e with SMTP id 5b1f17b1804b1-46e57589541mr240935e9.1.1759143460763;
        Mon, 29 Sep 2025 03:57:40 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab61eecsm220878875e9.20.2025.09.29.03.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 03:57:40 -0700 (PDT)
Date: Mon, 29 Sep 2025 10:57:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 02/28] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <aNpmIC-ywzIJCTAq@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-3-smostafa@google.com>
 <aMA13Sowq91XEqP9@willie-the-truck>
 <aMlly_9kDE04Inn2@google.com>
 <aNakIop0jdz9gH-t@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNakIop0jdz9gH-t@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_035743_729941_D9642244 
X-CRM114-Status: GOOD (  40.41  )
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

On Fri, Sep 26, 2025 at 03:33:06PM +0100, Will Deacon wrote:
> On Tue, Sep 16, 2025 at 01:27:39PM +0000, Mostafa Saleh wrote:
> > On Tue, Sep 09, 2025 at 03:12:45PM +0100, Will Deacon wrote:
> > > On Tue, Aug 19, 2025 at 09:51:30PM +0000, Mostafa Saleh wrote:
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > > index 861e448183fd..c9a15ef6b18d 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > > @@ -799,6 +799,70 @@ int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
> > > >  	return ret;
> > > >  }
> > > >  
> > > > +int __pkvm_host_donate_hyp_mmio(u64 pfn)
> > > > +{
> > > > +	u64 phys = hyp_pfn_to_phys(pfn);
> > > > +	void *virt = __hyp_va(phys);
> > > > +	int ret;
> > > > +	kvm_pte_t pte;
> > > > +
> > > > +	host_lock_component();
> > > > +	hyp_lock_component();
> > > > +
> > > > +	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> > > > +	if (ret)
> > > > +		goto unlock;
> > > > +
> > > > +	if (pte && !kvm_pte_valid(pte)) {
> > > > +		ret = -EPERM;
> > > > +		goto unlock;
> > > > +	}
> > > 
> > > Shouldn't we first check that the pfn is indeed MMIO? Otherwise, testing
> > > the pte for the ownership information isn't right.
> > 
> > I will add it, although the input should be trusted as it comes from the
> > hypervisor SMMUv3 driver.
> 
> (more on this below)
> 
> > > > +int __pkvm_hyp_donate_host_mmio(u64 pfn)
> > > > +{
> > > > +	u64 phys = hyp_pfn_to_phys(pfn);
> > > > +	u64 virt = (u64)__hyp_va(phys);
> > > > +	size_t size = PAGE_SIZE;
> > > > +
> > > > +	host_lock_component();
> > > > +	hyp_lock_component();
> > > 
> > > Shouldn't we check that:
> > > 
> > >   1. pfn is mmio
> > >   2. pfn is owned by hyp
> > >   3. The host doesn't have something mapped at pfn already
> > > 
> > > ?
> > > 
> > 
> > I thought about this initially, but as
> > - This code is only called from the hypervisor with trusted
> >   inputs (only at boot)
> > - Only called on error path
> > 
> > So WARN_ON in case of failure to unmap MMIO pages seemed is good enough,
> > to avoid extra code.
> > 
> > But I can add the checks if you think they are necessary, we will need
> > to add new helpers for MMIO state though.
> 
> I'd personally prefer to put the checks here so that callers don't have
> to worry (or forget!) about them. That also means that the donation
> function can be readily reused in the same way as the existing functions
> which operate on memory pages.
> 
> How much work is it to add the MMIO helpers?

It's not much work I guess, I was just worried about adding new helpers
just to use in a rare error path.
I will add them for v5.

Thanks,
Mostafa

> 
> > > > +	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
> > > > +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> > > > +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
> > > > +	hyp_unlock_component();
> > > > +	host_unlock_component();
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> > > >  {
> > > >  	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
> > > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > > > index c351b4abd5db..ba06b0c21d5a 100644
> > > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > > @@ -1095,13 +1095,8 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
> > > >  	kvm_pte_t *childp = NULL;
> > > >  	bool need_flush = false;
> > > >  
> > > > -	if (!kvm_pte_valid(ctx->old)) {
> > > > -		if (stage2_pte_is_counted(ctx->old)) {
> > > > -			kvm_clear_pte(ctx->ptep);
> > > > -			mm_ops->put_page(ctx->ptep);
> > > > -		}
> > > > -		return 0;
> > > > -	}
> > > > +	if (!kvm_pte_valid(ctx->old))
> > > > +		return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
> > > 
> > > Can this code be reached for the guest? For example, if
> > > pkvm_pgtable_stage2_destroy() runs into an MMIO-guarded pte on teardown?
> > 
> > AFAICT, VMs page table is destroyed from reclaim_pgtable_pages() =>
> > kvm_pgtable_stage2_destroy() => kvm_pgtable_stage2_destroy_range() ... =>
> > stage2_free_walker()
> > 
> > Which doesn't interact with “stage2_unmap_walker”, so that should be
> > fine.
> 
> Fair enough. I feel like this might bite us later on but, with what you
> have, we'll see the -EPERM and then we can figure out what to do then.
> 
> Will

