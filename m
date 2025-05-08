Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B80BC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOQcTqANU1leNfWALhEgYRCRqcO0Qjjft1AKNAg4mjA=; b=C7r67+620vZhJtZX4fC7UOywy5
	GzCoSRB7mzWl+ExRDCQkFzjNNmfuXMoaa/I7glplzgtN345U9AJYFienTcSwBbU49tEiMm9CusbVm
	2KQbr2cQk5oU72MhvWywFaC8oa0maVR6YRB01aXTUzELyUsFL8egflNMlsMRrZEIAmYZ8iUZS3p85
	t03dqEk1vjOgq/XnZN7PtEkqi8URnUvrrqQvGzfbpXcPQjn09VGNc5nEaKifF2ghQm12TME4qRax+
	qjbPuAojShZ5F4DFQUMybrecgYnC59rQ8SX5UNn/n9vPZbgBN6H0CsmZfvWcsEjYbva+gTaPesgzu
	C74GFJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxQW-00000000Eux-2QII;
	Thu, 08 May 2025 09:20:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCx6p-00000000Bw9-1qDF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746694802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOQcTqANU1leNfWALhEgYRCRqcO0Qjjft1AKNAg4mjA=;
	b=Yt/bcI1VbLeu3+FKfyOH2Cb10H700MHayy09Dy2C0VysZyBb9yZBE1f1ZAebFoi8cfqduh
	/h7d8xnY5k1GXGMLZsut2BSjaczXhziMAyOVDBaQaUwyzFRJcywsB3j1c3xD4HWvPum/sM
	oUihqgtRVERVQP3M5LnLZ65rzxAqSaM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-vu3TlYDnOcqHugRFwQR9VQ-1; Thu, 08 May 2025 04:59:59 -0400
X-MC-Unique: vu3TlYDnOcqHugRFwQR9VQ-1
X-Mimecast-MFC-AGG-ID: vu3TlYDnOcqHugRFwQR9VQ_1746694798
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so482726a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 01:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694798; x=1747299598;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOQcTqANU1leNfWALhEgYRCRqcO0Qjjft1AKNAg4mjA=;
        b=r2rHxaq4CagE3TGDuvCV3Bqp7wCBCwWXsw0f8YByUGH6dJOv3bGap0YTWVfaey3iDz
         v3IH8OhB2p3tD979UPFf5DACRWi+9BACfgJVMHWwwk4OninJcVTLVBPCFdk6VEppvar0
         JM7FNmgAGqqVKaUw+KHcS0/1MtnfBFACnDArcO3Ylsjz+0vj8NjyOnX94LarHtamXgEA
         2s1r69t7acSeoFWCYQjzLJWrUbWlgsv5kfWjHvQrZH3n7V0mqN12aufrhyYSxs4Ng3G1
         bH8ZYaNLw+SIulfcQrA2cahsccG2giFATrEkqfq2OfjXQRA7wyv0Cu8hQfklaRNCsz4i
         OLJA==
X-Gm-Message-State: AOJu0Yynt8R6ueLS/rXLxgqj9HAW9NHNBDe95PDtUQGKm1zIAzcIbGgn
	NkuwttNhKHRdDbmnnVAMxSUPPiAZj6FcP9U/q/no72SOaBH2i2u5qneCV/LoP2mQdC4Aq3QoTAf
	3f5RsML7ctShxuoRkqhfBL8FGPYBIaALVfECkb150Krl4Icm7Thl2TjiCv5s949yq2S7STfgY
X-Gm-Gg: ASbGncvzWAHNxXDHCJjiMq/V7snFml2zqwnFs/sx3TVokceA0RE4GbLBS5C6DcibwG3
	ZD/7wz2BLGp1+XcMpLW0X8GHkK8TBfEuekP+nvK65RM+aVj/WtfMvg4RqxiVZPcKWFQ/hp5ESZv
	vvK3JBujhIdl7RJVDMMm7AQ5/XVUWmMaMs8hFR4D6ynAj1zRh2vzr6+poDL3Ua5PhSbqqYUi5be
	lNwxcIsoB2QU40G5CfEGO12UtrwKJbC13HM9srnZpeII+TM0hWqmAWCnxtQzRixl8UC1MQs9m7f
	ZnebLdPTZwbh
X-Received: by 2002:a05:6a21:3a83:b0:1f5:8d3b:e294 with SMTP id adf61e73a8af0-2148b526dd7mr10023540637.16.1746694798024;
        Thu, 08 May 2025 01:59:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1EwAUJsR9DPVq6ks/wjHy3vUPtJEluOMLF3EubNvy3Xr+lYJJSx5JADt/lM5REM16u/RwNw==
X-Received: by 2002:a05:6a21:3a83:b0:1f5:8d3b:e294 with SMTP id adf61e73a8af0-2148b526dd7mr10023516637.16.1746694797754;
        Thu, 08 May 2025 01:59:57 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405906372fsm13173105b3a.148.2025.05.08.01.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 01:59:57 -0700 (PDT)
Message-ID: <8a05e7da-3640-4e79-b215-c705b879472f@redhat.com>
Date: Thu, 8 May 2025 18:59:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Drop sort_memblock_regions()
From: Gavin Shan <gshan@redhat.com>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 qperret@google.com, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, shan.gavin@gmail.com
References: <20250311043718.91004-1-gshan@redhat.com>
In-Reply-To: <20250311043718.91004-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7iCbjgGXR-UdAu-5l7FXJea_JhIP1ruR3D3OBG-mPUU_1746694798
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_020003_558632_BF6B1D88 
X-CRM114-Status: GOOD (  18.87  )
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

Hi Marc/Oliver,

On 3/11/25 2:37 PM, Gavin Shan wrote:
> Drop sort_memblock_regions() and avoid sorting the copied memory
> regions to be ascending order on their base addresses, because the
> source memory regions should have been sorted correctly when they
> are added by memblock_add() or its variants.
> 
> This is generally reverting commit a14307f5310c ("KVM: arm64: Sort
> the hypervisor memblocks"). No functional changes intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   arch/arm64/kvm/pkvm.c | 19 -------------------
>   1 file changed, 19 deletions(-)
> 

Please let me know if I need to resend after a rebase, or anything I need to
do so that it can be merged? :-)

Thanks,
Gavin

> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 930b677eb9b0..d9c9174f89a1 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -10,7 +10,6 @@
>   #include <asm/kvm_mmu.h>
>   #include <linux/memblock.h>
>   #include <linux/mutex.h>
> -#include <linux/sort.h>
>   
>   #include <asm/kvm_pkvm.h>
>   
> @@ -24,23 +23,6 @@ static unsigned int *hyp_memblock_nr_ptr = &kvm_nvhe_sym(hyp_memblock_nr);
>   phys_addr_t hyp_mem_base;
>   phys_addr_t hyp_mem_size;
>   
> -static int cmp_hyp_memblock(const void *p1, const void *p2)
> -{
> -	const struct memblock_region *r1 = p1;
> -	const struct memblock_region *r2 = p2;
> -
> -	return r1->base < r2->base ? -1 : (r1->base > r2->base);
> -}
> -
> -static void __init sort_memblock_regions(void)
> -{
> -	sort(hyp_memory,
> -	     *hyp_memblock_nr_ptr,
> -	     sizeof(struct memblock_region),
> -	     cmp_hyp_memblock,
> -	     NULL);
> -}
> -
>   static int __init register_memblock_regions(void)
>   {
>   	struct memblock_region *reg;
> @@ -52,7 +34,6 @@ static int __init register_memblock_regions(void)
>   		hyp_memory[*hyp_memblock_nr_ptr] = *reg;
>   		(*hyp_memblock_nr_ptr)++;
>   	}
> -	sort_memblock_regions();
>   
>   	return 0;
>   }


