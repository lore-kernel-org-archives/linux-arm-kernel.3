Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78844C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 06:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ccm3JgzdOSGH62qHobc9OF3iYrGg3m8/wnqVF4zJglU=; b=4ewBwjIEMOzlMjntd8co38SUNl
	QXHWT9av17Am/MIdJnZGl9JYmslK6+J9WU9edfJZkeWEQYJL6Dr0OnRY6hLh1QZyadrx9bPabokJU
	lMECp6+5jym/dCGlbZGBkws99wQr6emREe2U30our9QoCF7WOl4cPJCfGoO53t7DPfcvYt8N7L0WQ
	xgcsZhw5vGtJRU4Dy8jv+n9qiXlz406WK3cl27hmW10WLBfPcTxC2nvhAGL96vQE1r/BZOJX8d6CC
	2MbdZpuL1iP/guf/H5EWmv7JI7tWk+5XuMTAEbET5KInkAao/ZUv/vyLRKAXuISGEKvopek8sHVm/
	uwy3MRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsbnJ-0000000ACPa-47Hi;
	Thu, 13 Mar 2025 06:11:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsblc-0000000ACFC-2E5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741846201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ccm3JgzdOSGH62qHobc9OF3iYrGg3m8/wnqVF4zJglU=;
	b=Z6pq+CI1j2uZofQ53dpRXG5XBq024e57JhDvLzaR1Bn+snNUmAyD9PItM5x4GZZhPvrq5Z
	JPEelAkd4/5Vw8wfRmIN4NOBKHEBrJLqThw/Cex9kivMch60Z8IPIA05QmxyVGtBqfeVhg
	K+K8he1Vjq5/tn700wGEsqdCt99Y1uc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-0D80Y34qP3iXt7BHgyfmyw-1; Thu, 13 Mar 2025 02:09:59 -0400
X-MC-Unique: 0D80Y34qP3iXt7BHgyfmyw-1
X-Mimecast-MFC-AGG-ID: 0D80Y34qP3iXt7BHgyfmyw_1741846198
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224192ff68bso10621685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741846198; x=1742450998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ccm3JgzdOSGH62qHobc9OF3iYrGg3m8/wnqVF4zJglU=;
        b=loLMmyU8TNW0OUbqMgH1NYE1j+aqPLRo1dUnXw8qwQBgqiW+QioHPNLQ69ewbghUhm
         Z/2pBmkKy8umSiz2F9pjsiNu7VRC5NLk0fmUcD2sXRunJwmwh1sZ4t9HVbMLScCtOClR
         mkSwxPeKFJIJeJIpKWBEDXbcbS+GzuurbspjPqFDvodKdHybjZblwr6TMpJoE1ajI9pw
         vyLudqBKClZQ5N6Sk2F0cdF9VTK8U+yD3ObonDSfoX+RtYSqBa9RQtmUdj4Q978JkRvz
         RWPhDPenNYoKnTGWItkNd5hOtc4qX3k6TU8XSF04Sn1UagNAL3pGJMx3bjxkDpsDs5tX
         Iq9w==
X-Gm-Message-State: AOJu0YxKuhi23tqwLzmsXzlBxHDr5lxb/nwhavHVSpmVMUe593Pwiu/y
	HnBJmXslpAoppVg+U8lEkhDka25E5LfGAoo4wV8Qipf7b59yxhDK+D6X5d6PPQPJlDYqXKX3vKN
	5vFRpxA4QjCaj1LWBUKDv19cAFHvbt9VDAC3Yb8FQmbpRajmwQCzlKJWMD3z8g3lf8qXY0ggD
X-Gm-Gg: ASbGncsMjRXoC+nw7H4bDAU8qKOSTCRjr7ohUGZM4DyB+0mvIgou+30OPzBKRa1RdDJ
	tGza6eqHagxe9324DMZNyo9NxC9QMJc/D3aJFwsSndnPPFQW9qHj+Ao+DKv3x43XirIVP5jlfWA
	3yJsMaM3Wl54Phuk1ItPmoqn6xzFe/lTYyLvfB4pHDKI13VLF9+fbRKM4JVek8AWsAnL+CAs9Gt
	4mm9bhDScvT0oSSUm3FWEQ9XpsVYOY5SdKmLwfQ34p88X+rxF02/CXjbGzRHEhF6R0Qthlm+Nk2
	oNawsR0LQlr8Pf16Zg==
X-Received: by 2002:a17:902:d488:b0:223:3ef1:a30a with SMTP id d9443c01a7336-225931ad489mr119271355ad.45.1741846198238;
        Wed, 12 Mar 2025 23:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS/0CiPnvYXrr/SnOgpCHMu4/dKvSfoPKfZt54v9+3wLfVsHrnCrsLrPLUwz74zt1y5GmQxA==
X-Received: by 2002:a17:902:d488:b0:223:3ef1:a30a with SMTP id d9443c01a7336-225931ad489mr119271035ad.45.1741846197900;
        Wed, 12 Mar 2025 23:09:57 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a403fsm5710305ad.61.2025.03.12.23.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:09:57 -0700 (PDT)
Message-ID: <88c66ec3-5b03-4488-9733-ae917cbc0536@redhat.com>
Date: Thu, 13 Mar 2025 16:09:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Drop sort_memblock_regions()
To: Anshuman Khandual <anshuman.khandual@arm.com>, kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 qperret@google.com, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, shan.gavin@gmail.com
References: <20250311043718.91004-1-gshan@redhat.com>
 <34b8242b-529b-4ad5-ac17-e1200965ae1d@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <34b8242b-529b-4ad5-ac17-e1200965ae1d@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c6d4EsxFeGDhMUQ500Jxkb746ifY9ZZ3RLsEfwuvqlo_1741846198
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_231005_428990_1629D559 
X-CRM114-Status: GOOD (  14.18  )
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

On 3/13/25 12:53 PM, Anshuman Khandual wrote:
> On 3/11/25 10:07, Gavin Shan wrote:
>> Drop sort_memblock_regions() and avoid sorting the copied memory
>> regions to be ascending order on their base addresses, because the
>> source memory regions should have been sorted correctly when they
>> are added by memblock_add() or its variants.
>>
>> This is generally reverting commit a14307f5310c ("KVM: arm64: Sort
>> the hypervisor memblocks"). No functional changes intended.
> 
> Just wondering what prompted this change ?
> 

I found the unnecessary sorting by code inspection. Hope there is nothing I
missed and it's why Quentin Perret has been copied, to confirm it. Commit
a14307f5310c was introduced by the initial series [1/2] to support pKVM.

[1] https://lore.kernel.org/kvmarm/20201117181607.1761516-1-qperret@google.com/
[2] https://lore.kernel.org/all/20210319100146.1149909-1-qperret@google.com/

Thanks,
Gavin

>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   arch/arm64/kvm/pkvm.c | 19 -------------------
>>   1 file changed, 19 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
>> index 930b677eb9b0..d9c9174f89a1 100644
>> --- a/arch/arm64/kvm/pkvm.c
>> +++ b/arch/arm64/kvm/pkvm.c
>> @@ -10,7 +10,6 @@
>>   #include <asm/kvm_mmu.h>
>>   #include <linux/memblock.h>
>>   #include <linux/mutex.h>
>> -#include <linux/sort.h>
>>   
>>   #include <asm/kvm_pkvm.h>
>>   
>> @@ -24,23 +23,6 @@ static unsigned int *hyp_memblock_nr_ptr = &kvm_nvhe_sym(hyp_memblock_nr);
>>   phys_addr_t hyp_mem_base;
>>   phys_addr_t hyp_mem_size;
>>   
>> -static int cmp_hyp_memblock(const void *p1, const void *p2)
>> -{
>> -	const struct memblock_region *r1 = p1;
>> -	const struct memblock_region *r2 = p2;
>> -
>> -	return r1->base < r2->base ? -1 : (r1->base > r2->base);
>> -}
>> -
>> -static void __init sort_memblock_regions(void)
>> -{
>> -	sort(hyp_memory,
>> -	     *hyp_memblock_nr_ptr,
>> -	     sizeof(struct memblock_region),
>> -	     cmp_hyp_memblock,
>> -	     NULL);
>> -}
>> -
>>   static int __init register_memblock_regions(void)
>>   {
>>   	struct memblock_region *reg;
>> @@ -52,7 +34,6 @@ static int __init register_memblock_regions(void)
>>   		hyp_memory[*hyp_memblock_nr_ptr] = *reg;
>>   		(*hyp_memblock_nr_ptr)++;
>>   	}
>> -	sort_memblock_regions();
>>   
>>   	return 0;
>>   }
> 


