Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BE9C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8oFJfNXcX3rvNozL61a5flKxGo2/aiCWCnQ35Drmb0=; b=j1yFp8W2Zzt3KHdb8Mp0CqJEl9
	lJ5PcyOL2tTe1KmhVm3XTBoMWl46UiKw4rZsz71Ch4BYzGGtDy9BTzjyAn+rzIXiWaq+O+A8Yu2Uq
	OkfoL8xitYbF5NyYXlf7+9Z5w06h6+hks7gMnpcNhT7MPZp+4qpmp/est5OH/KtLABv0YmrBl00/r
	+Rq+nt2mGPyUhyFMVmhY4/zaLKOvZaLPGT1vEisAywXe16x+HYza8uoK9tL/xFWpsbCIjNkIhpuas
	3g+RUX02ELIQPrxjxq7vn7nV32yLVhApFXIg4JnJ0x88ta+X4A8Xrma9QS509IJoKR4u16CBtPDZq
	oPDrvRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojk8-00000005e61-2WRL;
	Tue, 28 Jul 2026 15:29:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojk5-00000005e4c-3xLP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:29:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c1c26d7e951so570606966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785252554; x=1785857354; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8oFJfNXcX3rvNozL61a5flKxGo2/aiCWCnQ35Drmb0=;
        b=DcI9k4mfNHxMmiL/55LC42vTUHz68ZxdW1R6/+Mam2uuEYdniqCkq0bT9rsCh/WX1l
         UUfpor5psyF7bA92aMPy8G/QuJA9wFP3X4jY77L+6QugIuA+OysCfQXo39eS4ryUJLJ/
         5CwcRPyiMxSU9JTbtbeZHyzmpwsgviwDBtOL+NUjLdqPlu913a7J/KhQmMb3XcUyC1d4
         LNYTFnCx3ixVvjhRqiI1q9KYAF1b2c1n5weUDtX2vsvlQd1QLP1gHwyBUTgtLRD843la
         gdyCFZ8mcJUnwz5b884fZnwJoXZ83/KuNok1wo3h1+bDserfnXu+CEFCu0PVnnwzh8IL
         2w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785252554; x=1785857354;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8oFJfNXcX3rvNozL61a5flKxGo2/aiCWCnQ35Drmb0=;
        b=fNdJO445vCUghUG5ckPMrq3pyg8BwcTybLZib38W8gsQJrrxKJBVXOVD304yDdhTGY
         E+UDjtjjuus6gWbrXgFFyKgxr3NYzq+o+3Hg39UkOhZPoIXuydrIdlYF/LqSCdtZm+10
         HalL5juWf98JJXutxsJ5JPtvZ3DNJ+x4y987kKhKx35cjbL2jzeBWUmXsD3CvmiAlP5h
         77TSaYJmSY9IYjxeknR1imydtwEu2GWEjRIeF+uly3EdaOSmD22pKPx8/Oizp9kEahGp
         vxgGRNKcviC9qbbUmSl2sVlDCdB+Ok45kAhoos0sCGQEHM//tJ1m1rtYRA2pMHmh7tId
         eQfw==
X-Forwarded-Encrypted: i=1; AHgh+RrzuzmIZeS5gTDDt/LaSxOq9R3227sfoXd3zFXwPNeIw9LbXCp2uozzC1ZgZLZwkq7i69IzA7bXWFlRXNSbRoGU@lists.infradead.org
X-Gm-Message-State: AOJu0YxV1AOlp6D9t9kFV+kL7HnJzDYhqlxnqtexcDxhMs6cfqb17/sA
	lVodZOr8rJY+W4eaTOHJekq7dM+B6AODzAkZVC9HX80p6XBAuDK/8SX16XwwmsxZPw==
X-Gm-Gg: AR+sD13rwDHaUtehZDoKIoUdZweLz7NsNbvRN7cpzh0abqojR/E2KMOLMI+n/E+8gjU
	2+Gtq8pod3+UjxgANHFrF2yjI94EmxBqFEvc/jY4nRVv4mbVRsG4nYSTXF28cbXsU3SOoxk1SKO
	crAjYX50Srln3IMYlj2xGgEIyDr/ROHGMRsBaDl7DcmHI1lHnTvAH5TDKXY9953LNGNRaPPBgde
	QSN0/2ZbqXL2+KZpDryowan5WBqdBORYr5FxQyLnan8LKS1SkfqX5dpW4xvP5puPsSMyNQjFYGI
	aJQlWrhK/nnj74YDF7uHJI/n3sO6N1K8GGFKr83IS5ZbMDfPaNFWnXg4tyv+YqJNmVGHOr114hb
	Zw/nQuy7x1XvN1rqVnvjtxI047J4sAxfJ1QBwgaqIAXDpEkGLYy/hd9n18hAI6Q8etw2f/k42Rj
	Cw/OZ5prh7M11HYjX4HyC0ZVNQV21umam3BvEOHpw5JwQO8PMbBsNlLCcU
X-Received: by 2002:a17:907:73cd:b0:c15:d0ef:a0c3 with SMTP id a640c23a62f3a-c1f7221d235mr160291866b.32.1785252553743;
        Tue, 28 Jul 2026 08:29:13 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cde4dbsm685366b.15.2026.07.28.08.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:29:12 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:29:08 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Gavin Shan <gshan@redhat.com>, Dev Jain <dev.jain@arm.com>,
	Bradley Morgan <include@grrlz.net>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] KVM: arm64: Skip cache maintenance for
 non-cacheable pKVM mappings
Message-ID: <amjKxDd9expCNBwL@google.com>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
 <20260717130317.1953574-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717130317.1953574-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_082918_011705_E4D5BD06 
X-CRM114-Status: GOOD (  23.46  )
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

On Fri, Jul 17, 2026 at 02:03:11PM +0100, Fuad Tabba wrote:
> From: Bradley Morgan <include@grrlz.net>
> 
> The pKVM flush path walks its own pkvm_mappings list and cleans the
> data cache for every mapping, unlike the generic stage-2 walker it
> shadows, which skips non-cacheable leaves. Cleaning the cacheable
> alias of a non-cacheable mapping is pointless and can corrupt a
> device endpoint. Record whether a mapping is non-cacheable in spare
> bits of nr_pages and skip cache maintenance for it.
> 
> Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Bradley Morgan <include@grrlz.net>
> [tabba: use Marc's anonymous bitfield in place of the open-coded mask and helpers]
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/include/asm/kvm_pkvm.h |  5 ++++-
>  arch/arm64/kvm/pkvm.c             | 15 +++++++++------
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 74fedd9c5ff0..57afb07d6b13 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -195,7 +195,10 @@ struct pkvm_mapping {
>  	struct rb_node node;
>  	u64 gfn;
>  	u64 pfn;
> -	u64 nr_pages;
> +	struct {
> +		u64 nr_pages:48;
> +		u64 nc:1;
> +	};
>  	u64 __subtree_last;	/* Internal member for interval tree */
>  };
>  
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 053e4f733e4b..f70c601dcf4c 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -369,7 +369,7 @@ static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64
>  
>  	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
>  		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
> -					mapping->nr_pages);
> +					(u64)mapping->nr_pages);
>  		if (WARN_ON(ret))
>  			return ret;
>  		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> @@ -473,6 +473,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  	mapping->gfn = gfn;
>  	mapping->pfn = pfn;
>  	mapping->nr_pages = size / PAGE_SIZE;
> +	mapping->nc = !!(prot & (KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC));
>  	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
>  
>  	return ret;
> @@ -503,7 +504,7 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  	lockdep_assert_held(&kvm->mmu_lock);
>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
>  		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
> -					mapping->nr_pages);
> +					(u64)mapping->nr_pages);
>  		if (WARN_ON(ret))
>  			break;
>  	}
> @@ -517,9 +518,11 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  	struct pkvm_mapping *mapping;
>  
>  	lockdep_assert_held(&kvm->mmu_lock);
> -	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
> -		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
> -					  PAGE_SIZE * mapping->nr_pages);
> +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> +		if (!mapping->nc)
> +			__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
> +						  PAGE_SIZE * mapping->nr_pages);
> +	}
>  
>  	return 0;
>  }
> @@ -537,7 +540,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
>  	lockdep_assert_held(&kvm->mmu_lock);
>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
>  		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
> -					   mapping->nr_pages, mkold);
> +					   (u64)mapping->nr_pages, mkold);
>  
>  	return young;
>  }
> -- 
> 2.39.5
> 

-- 
-- 
Vincent

