Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D73FED9F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vk6jiSu89wSuSDJHFSnbBGL/1pzCMBbdJHn7EbTjmg4=; b=S4GU645di7FjKXVbGEesZo4+/I
	LJrUmPzc+SGueoe53OyycikKFAYSXSL3NrI+5ksk/M7G6bpHxJQnVj7JezHs3yPR4JhWQMhLmJzPJ
	XeqcktUe2I3T3OaE+zSpDVckxkjO4smNh7gmIRfkOTjWfI7RpQiiVE5TRRZKZtCh61K5adIdl+EiJ
	QKYSeltvXs4UzWBNW/Y68iTdKAP5nJAzmGLp1cZvWyPdVIr5x5v9sfPeuCXbcbXMRQT74+27bpSTk
	YjudTL2ZubaMvcEmpplf7HPL/OKReji1I67Xc//Fmjwj8VE/fSomxf8hNuQD4wYXbCfacueurgDkH
	KJhl7AYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YZG-00000006yc2-2AAg;
	Tue, 17 Mar 2026 17:50:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YZD-00000006ya0-0Xu6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:50:57 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fZzxb2PjmzJ4687;
	Wed, 18 Mar 2026 01:49:55 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id BDBBA4056A;
	Wed, 18 Mar 2026 01:50:51 +0800 (CST)
Received: from localhost (10.48.149.62) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Mar
 2026 17:50:50 +0000
Date: Tue, 17 Mar 2026 17:50:47 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Fuad Tabba <tabba@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, "KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64"
	<linux-arm-kernel@lists.infradead.org>, KERNEL VIRTUAL MACHINE FOR ARM64
 KVM/arm64 <kvmarm@lists.linux.dev>, "open list"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/10] KVM: arm64: Use guard(mutex) in mmu.c
Message-ID: <20260317175047.00000b6e@huawei.com>
In-Reply-To: <20260316-tabba-el2_guard-v1-6-456875a2c6db@google.com>
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
	<20260316-tabba-el2_guard-v1-6-456875a2c6db@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.149.62]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_105055_476378_BB03514B 
X-CRM114-Status: GOOD (  15.95  )
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

On Mon, 16 Mar 2026 17:35:27 +0000
Fuad Tabba <tabba@google.com> wrote:

> Migrate manual mutex_lock() and mutex_unlock() calls managing
> kvm_hyp_pgd_mutex and hyp_shared_pfns_lock to use the
> guard(mutex) macro.
> 
> This eliminates manual unlock calls on return paths and simplifies
> error handling by replacing unlock goto labels with direct returns.
> Centralized cleanup goto paths are preserved with manual unlocks
> removed.
> 
> Change-Id: Ib0f33a474eb84f19da4de0858c77751bbe55dfbb
> Signed-off-by: Fuad Tabba <tabba@google.com>

> @@ -652,22 +632,20 @@ int hyp_alloc_private_va_range(size_t size, unsigned long *haddr)
>  	unsigned long base;
>  	int ret = 0;
>  
> -	mutex_lock(&kvm_hyp_pgd_mutex);
> -
> -	/*
> -	 * This assumes that we have enough space below the idmap
> -	 * page to allocate our VAs. If not, the check in
> -	 * __hyp_alloc_private_va_range() will kick. A potential
> -	 * alternative would be to detect that overflow and switch
> -	 * to an allocation above the idmap.
> -	 *
> -	 * The allocated size is always a multiple of PAGE_SIZE.
> -	 */
> -	size = PAGE_ALIGN(size);
> -	base = io_map_base - size;
> -	ret = __hyp_alloc_private_va_range(base);
> -
> -	mutex_unlock(&kvm_hyp_pgd_mutex);
> +	scoped_guard(mutex, &kvm_hyp_pgd_mutex) {
> +		/*
> +		 * This assumes that we have enough space below the idmap
> +		 * page to allocate our VAs. If not, the check in
> +		 * __hyp_alloc_private_va_range() will kick. A potential
> +		 * alternative would be to detect that overflow and switch
> +		 * to an allocation above the idmap.
> +		 *
> +		 * The allocated size is always a multiple of PAGE_SIZE.
> +		 */
> +		size = PAGE_ALIGN(size);
> +		base = io_map_base - size;
> +		ret = __hyp_alloc_private_va_range(base);
Minor one and matter of taste, but I'd do
		if (ret)
			return ret;
	}
	*hwaddr = base;

	return 0;

> +	}
>  
>  	if (!ret)
>  		*haddr = base;
> @@ -711,17 +689,16 @@ int create_hyp_stack(phys_addr_t phys_addr, unsigned long *haddr)
>  	size_t size;
>  	int ret;
>  
> -	mutex_lock(&kvm_hyp_pgd_mutex);
> -	/*
> -	 * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
> -	 * an alignment of our allocation on the order of the size.
> -	 */
> -	size = NVHE_STACK_SIZE * 2;
> -	base = ALIGN_DOWN(io_map_base - size, size);
> +	scoped_guard(mutex, &kvm_hyp_pgd_mutex) {
> +		/*
> +		 * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
> +		 * an alignment of our allocation on the order of the size.
> +		 */
> +		size = NVHE_STACK_SIZE * 2;
> +		base = ALIGN_DOWN(io_map_base - size, size);
>  
> -	ret = __hyp_alloc_private_va_range(base);
> -
> -	mutex_unlock(&kvm_hyp_pgd_mutex);
> +		ret = __hyp_alloc_private_va_range(base);
> +	}
>  
>  	if (ret) {
>  		kvm_err("Cannot allocate hyp stack guard page\n");
Maybe move this under the guard just to keep the error check nearer the code
in question.

Thanks,

Jonathan

> 


