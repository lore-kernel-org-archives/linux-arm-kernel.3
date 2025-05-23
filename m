Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2F7C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTvdxciROz3xcyDGA7SqLlzzoP+BAXCOdB9KfOHNYyY=; b=gTnkRpLbnNyL4PyO7jhziGTCjP
	2M60gxIaCuRFR9ryZLK/22dTixRv+NWjl3wnwP2tSA3lpLjjIZrpM2YPW66Caql6or9FLm5UuG+QK
	ZBJLkptP+pjn6ye5EoyqMzINFpFkW8r+KIKHqGhT/fYKbqtVHXa7ZNERElvppfiTjeDgXJl+d8LZ7
	sW+YIa8wg34OGoX/kX5WnKafRFtf11yPvNH4TE0HLSRmRxLwKX2pV7V0U+etWG+FQmX8RngySpP+X
	qqkXSbLaQ/wo8Vx7qkdms1RfqRPqn3q00TbG87dbIB+SCNgMfCpBkYsEMLplxRpFFEcLMR+YlpTuO
	c7VoM63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYDP-00000004oWu-37b3;
	Fri, 23 May 2025 19:37:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIY8d-00000004o7r-25Pw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 19:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748028781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FTvdxciROz3xcyDGA7SqLlzzoP+BAXCOdB9KfOHNYyY=;
	b=Z4rLT/ouuvhiI6L/VcD5LFXsZJN0OkW1LjupZw+58c2ZcOl7H/LJoRMtijV5C8XZA9iP+C
	13aHnWJbxYU4cJG85aE5Mvbr9u6jy5x0zKNbS9WZVN08wU7BtED1F9EQy23X544ayTg+kj
	dmstdCabqhkfqIMzQgs5FI3YnP/c6aA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-FKXA2vc7P-eYoMOtwfrd2A-1; Fri, 23 May 2025 15:31:00 -0400
X-MC-Unique: FKXA2vc7P-eYoMOtwfrd2A-1
X-Mimecast-MFC-AGG-ID: FKXA2vc7P-eYoMOtwfrd2A_1748028659
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c6ce05e0so3509736d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 12:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748028659; x=1748633459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTvdxciROz3xcyDGA7SqLlzzoP+BAXCOdB9KfOHNYyY=;
        b=ed1X1yYTN7huOsMRlK4np+95sVWRo+q4WRP3lkCaVrea+v954PdLZAm07fQTANg8Bb
         2tFZpLu/aV98piHymPnsEgeG9noNKcOOwVp+5vgVs1VfGpKC1pJ0i1A3DIGnaWVW8/SF
         iHnej+SNl9xzUnaLmrwnGXBKe54P8co93NmQsfm3iq1HEQY2Sr4muIpvuAx/l7g0ACxm
         EYl5IpqAWJ7AXLydeyqB/ORuX4OHDjl+Kx3C0Gq4lrR0rc7kLBptLa97T0EIHWlWD/Zk
         jA/sUug01VqDaLNCPF32AozqaBJxWKAQmBNDbYdR4PxwB531t6NZPYC80h++1bsnmlFT
         tYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKyrNPTzHmzWdVwCRb94uPHlh4nCwv9Bu7JduuetJ4Lla7lZG+j69/8ChlHsHlnHX/CAUS8Pz7uLoxHrSyNdbF@lists.infradead.org
X-Gm-Message-State: AOJu0YzkoWSFbvCsfzz4TjE9x1f45aDEfn8mDMGe3E9fAsSjDVlhplfh
	YI0Xlb9CapvdspX0BcmUzLGTB7FHyqEUmmr6xBNVJabo0xonRVMOoXAGRg9DHraj/JPA/jPO9gs
	KX7Nl1Ju9SB2Gcx+I4lgJ7WKb/7KDDaCRaDWzKLS14bmNi5ZHPLJc2g+wrfmQfM4pqtXGsnXkqy
	Ng
X-Gm-Gg: ASbGncvdLYdMin+ysYCkxSjlaRzIxRnv6EAmCkDaZ9BlZT6WPKuCmwHx1WV4HHiQzha
	8CR4sV5dJ85TyaO5OhL+t0hs6vBsSWXKrZE4DVXpwKo37dZ66DzSpZoPLM2jrbSZ5I4b/pgikWd
	MzOPPO2mu3NaLhFFmGoUiMuJ7rReHkByYSHg7KjfTODWNa6tPbJwBnMG3Lk3yeffADaIrErmzgY
	5Mhffr5sKD0WaJSHt7zhSJjWmUtb35w6ysDQXLNtNGGr//kwoKrAX2fPymRvckhJ9MQ+0DJxSt3
	7HnbC5tsyP+H
X-Received: by 2002:a05:6214:1d23:b0:6e6:6964:ca77 with SMTP id 6a1803df08f44-6fa9d29c58dmr11208116d6.28.1748028659037;
        Fri, 23 May 2025 12:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd+qzCAswhS3iuiKWeZE50Wf+7n1+LX7vli2jZxIWG36wkuD8DiM8xlaNuqX/4ezVASlQWyA==
X-Received: by 2002:a05:6214:1d23:b0:6e6:6964:ca77 with SMTP id 6a1803df08f44-6fa9d29c58dmr11207166d6.28.1748028658328;
        Fri, 23 May 2025 12:30:58 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ac5ddsm118552726d6.44.2025.05.23.12.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:30:57 -0700 (PDT)
Message-ID: <9ffc7686-0dc0-4978-8cd8-f12a1c148b63@redhat.com>
Date: Fri, 23 May 2025 15:30:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: New function to determine hardware
 cache management support
To: ankita@nvidia.com, jgg@nvidia.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org,
 david@redhat.com
Cc: aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 kjaju@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
 acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
 danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
 dnigam@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com,
 coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
 linux-mm@kvack.org, tabba@google.com, qperret@google.com, seanjc@google.com,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
References: <20250523154445.3779-1-ankita@nvidia.com>
 <20250523154445.3779-3-ankita@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250523154445.3779-3-ankita@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fsPtq-yxp92v90VtM351M-9f6HQJuzYZp1sxscqRaWM_1748028659
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_123303_606125_ADDB7000 
X-CRM114-Status: GOOD (  23.54  )
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



On 5/23/25 11:44 AM, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> The hardware supports safely mapping PFNMAP as cacheable if it
> is capable of managing cache. This can be determined by the presence
> of FWB (Force Write Back) and CACHE_DIC feature.
> 
> When FWB is not enabled, the kernel expects to trivially do cache
> management by flushing the memory by linearly converting a kvm_pte to
> phys_addr to a KVA. The cache management thus relies on memory being
> mapped. Since the GPU device memory is not kernel mapped, exit when
> the FWB is not supported. Similarly, ARM64_HAS_CACHE_DIC allows KVM
> to avoid flushing the icache and turns icache_inval_pou() into a NOP.
> So the cacheable PFNMAP is contingent on these two hardware features.
> 
> Introduce a new function to make the check for presence of those
> features.
> 
> CC: David Hildenbrand <david@redhat.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>   arch/arm64/kvm/mmu.c     | 12 ++++++++++++
>   include/linux/kvm_host.h |  2 ++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 305a0e054f81..124655da02ca 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1287,6 +1287,18 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
>   	kvm_nested_s2_wp(kvm);
>   }
>   
> +/**
> + * kvm_arch_supports_cacheable_pfnmap() - Determine whether hardware
> + *      supports cache management.
> + *
> + * Return: True if FWB and DIC is supported.
> + */
> +bool kvm_arch_supports_cacheable_pfnmap(void)
> +{
> +	return cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) &&
> +	       cpus_have_final_cap(ARM64_HAS_CACHE_DIC);
> +}
> +
>   static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
>   {
>   	send_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, current);
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 291d49b9bf05..3750d216d456 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1231,6 +1231,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm);
>   /* flush memory translations pointing to 'slot' */
>   void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>   				   struct kvm_memory_slot *slot);
> +/* hardware support cache management */
> +bool kvm_arch_supports_cacheable_pfnmap(void);
>   
Won't this cause a build warning on non-ARM builds, b/c there is no
resolution of this function for the other arch's?
Need #ifdef or default-rtn-0 function for arch's that don't have this function?

>   int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
>   		       struct page **pages, int nr_pages);


