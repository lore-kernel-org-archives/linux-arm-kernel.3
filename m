Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAF1C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kidTGWLf8HiPqYlSnvvASEQy1JGrgJc/URV408B3d04=; b=G9n79V/LWmpZIGEhaAJvTnWp7F
	y318El1CTOR4ILPfnyxPv0n6SPSsO3iW/gO4Ab475HbjKkgzwQwhsNO7V1fDBtW+BKZTt1wvCJqjn
	A4BGRPHEX2wFwbXBkkc9O3jDtGRnlQl6IE6DWleZUnBmRe9czccLHV4C+LsxnkhH7+iQfYmoj40Pv
	deP9N1OpgBVDPq2g12ewKdcXo4KYQHsaPTNI06Exiza6rRPEBAwFAz38RAihal3SfMB37Byld6Q6H
	PkYS/Ex5hO4vC93GngKmdiU1L/jh3d88yGS0MhA20EzDD00T9ucGQutpdCUm1AHPCOpUFTKAOITnU
	X/AA37dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYFR-00000004okb-1rOa;
	Fri, 23 May 2025 19:40:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYBu-00000004oQs-3s4u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 19:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748028985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kidTGWLf8HiPqYlSnvvASEQy1JGrgJc/URV408B3d04=;
	b=E4/UGyeGvsIHDug87T+NwmrE9Rugg1L0cvdGXvDxIcmDVIAaz7U/9fqgkTiUjRBsIT5mYe
	IRIZElQiQsjLZ6ApZawl3xZdHPpQEyLmd8pa4dSJjqjjbOgnWmPAQjsZ3PtX2PAYQCd5bd
	fIi2M8n3AW4GG/XYSsTrtOZavmCg01k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-JYnOZ6IGPIuYZYF4DVsjMA-1; Fri, 23 May 2025 15:36:24 -0400
X-MC-Unique: JYnOZ6IGPIuYZYF4DVsjMA-1
X-Mimecast-MFC-AGG-ID: JYnOZ6IGPIuYZYF4DVsjMA_1748028984
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so20605085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 12:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748028984; x=1748633784;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kidTGWLf8HiPqYlSnvvASEQy1JGrgJc/URV408B3d04=;
        b=VV5gJr3fpwsjA46VWVFdkszNqvsPcteTI1HzWLkGpcsh5UJs21oUvztNsRWk35xdv0
         cFGkOX43NNFLa9atyNO6SRJONw6fMIpu2L6W4wBDQF+RK4HB3tHUO2SSVPum3Z3E34QX
         aoJ/d2lfUwBW9Hx/M9cA9LGUmQOZlivn+00IE4uj+1k30Q0+9Y8WH3tOu/dLOXcV66B9
         Dr4bFnx5eVgZopnNvQoRF9IPbdZy4J2ZUIZ5OGNgSnAXZbh6HD+jeTD5VRNNMZJpnVg+
         kUp1qGiB/umb07UQInP9zhi/L4y1Kv9rZGwMKVgsNKh7oo7S+vSJD5OBW0rS6pTbKHJm
         rueQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVcV4858m0IToeIs3Mt7meoS+Bm2yaT/4jTfyInt0ev6iQgoasqJci8Kl8kYodkzZ8mOZfpdtAekM6ljUWa+yf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1TGquiEi6kb6jNY4pDLNmw6859EcQ0vrSNs8IDzBN8s5m1ut+
	dvZBW4EP+Sb3jS9Lu2rwiFZuG9cCn4PWi6TauhovnlyObov2G+xxW7SORq9Ivbm8XM0TXCxpKN/
	ULKdQaFyWEPN3WAxJ2BDUYEXR61jgexezaVBBFgKFD1Z/ien7bWaoawVmq2gyPzVL5wlnQ5Y8bf
	KM
X-Gm-Gg: ASbGncuI6UmLCoiLmgLp8BKKZ1WtT7nf5UpvNsLArwsUYCmoI2FiiVMBDDkgU8EaZ09
	2RQ8oq1DccIxCdsnaUadFiVIuyiqyd17D+hfzwxsZoweexLCIw1YBHiXl3dJJBrAwb71Ge3BwT1
	7I9DtMm0X9uY52d7ubICgDEKUcR0TOTbOvMnka+V4d/sD2R/sOue8T9onhbtlCEsMX9F8SVAytk
	xukFl4QL/8gsuLcwPUZf9rbS5mKu084a1vwEP/i0ydIggtKjtJXG0IJJ/SRQCrKNOJFdyhuv94t
	6kH6vwMPIn4W
X-Received: by 2002:a05:620a:3711:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7ceecba7654mr76809985a.13.1748028983757;
        Fri, 23 May 2025 12:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFJKxqzX44nUMqHLBCLT+KOS9BdkBLIZeUURW51Zp0jpVCGq7Lz+5dSD9ytJb95co0Y6Sxbg==
X-Received: by 2002:a05:620a:3711:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7ceecba7654mr76804085a.13.1748028983347;
        Fri, 23 May 2025 12:36:23 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468ccd94sm1220015185a.109.2025.05.23.12.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:36:22 -0700 (PDT)
Message-ID: <9b429da4-8db6-407e-9721-178e01fd1ebb@redhat.com>
Date: Fri, 23 May 2025 15:36:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: New function to determine hardware
 cache management support
From: Donald Dutile <ddutile@redhat.com>
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
 <9ffc7686-0dc0-4978-8cd8-f12a1c148b63@redhat.com>
In-Reply-To: <9ffc7686-0dc0-4978-8cd8-f12a1c148b63@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: csDndtQ7DJCCAHbMinT3ERMNvBYnre5ISorlWDRvCVs_1748028984
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_123627_038306_866829CD 
X-CRM114-Status: GOOD (  21.66  )
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



On 5/23/25 3:30 PM, Donald Dutile wrote:
> 
> 
> On 5/23/25 11:44 AM, ankita@nvidia.com wrote:
>> From: Ankit Agrawal <ankita@nvidia.com>
>>
>> The hardware supports safely mapping PFNMAP as cacheable if it
>> is capable of managing cache. This can be determined by the presence
>> of FWB (Force Write Back) and CACHE_DIC feature.
>>
>> When FWB is not enabled, the kernel expects to trivially do cache
>> management by flushing the memory by linearly converting a kvm_pte to
>> phys_addr to a KVA. The cache management thus relies on memory being
>> mapped. Since the GPU device memory is not kernel mapped, exit when
>> the FWB is not supported. Similarly, ARM64_HAS_CACHE_DIC allows KVM
>> to avoid flushing the icache and turns icache_inval_pou() into a NOP.
>> So the cacheable PFNMAP is contingent on these two hardware features.
>>
>> Introduce a new function to make the check for presence of those
>> features.
>>
>> CC: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
>> ---
>>   arch/arm64/kvm/mmu.c     | 12 ++++++++++++
>>   include/linux/kvm_host.h |  2 ++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 305a0e054f81..124655da02ca 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1287,6 +1287,18 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
>>       kvm_nested_s2_wp(kvm);
>>   }
>> +/**
>> + * kvm_arch_supports_cacheable_pfnmap() - Determine whether hardware
>> + *      supports cache management.
>> + *
>> + * Return: True if FWB and DIC is supported.
>> + */
>> +bool kvm_arch_supports_cacheable_pfnmap(void)
>> +{
>> +    return cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) &&
>> +           cpus_have_final_cap(ARM64_HAS_CACHE_DIC);
>> +}
>> +
>>   static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
>>   {
>>       send_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, current);
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 291d49b9bf05..3750d216d456 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -1231,6 +1231,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm);
>>   /* flush memory translations pointing to 'slot' */
>>   void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>>                      struct kvm_memory_slot *slot);
>> +/* hardware support cache management */
>> +bool kvm_arch_supports_cacheable_pfnmap(void);
> Won't this cause a build warning on non-ARM builds, b/c there is no
> resolution of this function for the other arch's?
> Need #ifdef or default-rtn-0 function for arch's that don't have this function?
> 
ah, I see you have the weak function in patch 5/5.
But I think you have to move that hunk to this patch, so a bisect won't cause
a build warning (or failure, depending on how a distro sets -W in its builds).

- Don
>>   int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
>>                  struct page **pages, int nr_pages);


