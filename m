Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC67CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWDv7QgtWpFRbFd8EFQQNhSn0JvkvImiDgitgfxQfQw=; b=oYu/qPMr3Md9mi6gE2AiFTszIl
	fl3BjEDpCxrKfk38f7gf29douYuKVD5xqgn1pk8l9QDZEXe7yydDyBJnfPpcUXyuGztSU511yH1Sp
	K8V54DkEf6ZIFzXWaZB4cD+fL9AS1F9GLHG49pRVC7hoaDuCVhbHXokxIv3UFa6XcyBQ0blUTjvXq
	PLmbWwsduuoLxOsr1FHuvBO9Ri7GoIfk0z11GHAWJyARmEo1QJ1DJEfurwcKO2lORoLlbp9+o5D6S
	vnRuXVbMoOv1m5h+HWrP5xD4uqZF998/E12z2JBUOMScps3zGybylpI5Z6hXaizKXGCt7e70wlkQG
	0Cds+qTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKB5-0000000Ea9h-44yl;
	Thu, 01 May 2025 03:01:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAK8q-0000000EZr7-1Vqi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 02:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yWDv7QgtWpFRbFd8EFQQNhSn0JvkvImiDgitgfxQfQw=;
	b=CemDA3RCJqzjnvq1R/Ye6HurinvNIG5G7yzcUTdfBiekUfwjq6jMmW8IdyBZYe59bDN2Gj
	qm+A8FuPJXBgDNDNVuzLsa0ImVCmxWI/zSy45Xu1BwycZj1TUQkX63NNgg4d9BAcj9j8vv
	77RmAVxexsMv2ufQR/zjbEaAZN0K37o=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-wzVr4R4KPpKGbpCjbvH7OA-1; Wed, 30 Apr 2025 22:59:13 -0400
X-MC-Unique: wzVr4R4KPpKGbpCjbvH7OA-1
X-Mimecast-MFC-AGG-ID: wzVr4R4KPpKGbpCjbvH7OA_1746068353
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73917303082so397064b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 19:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068353; x=1746673153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWDv7QgtWpFRbFd8EFQQNhSn0JvkvImiDgitgfxQfQw=;
        b=UJBLmEhgbjyoAANP7TCyPNsYPhfWc280922PI+j7UOSx61jYvGIizOB4lKpTPVmGtR
         E+ZLVUsJi6MfrZzJJOSUEYEZGZrvMQg+tutQ9tKIVLNARblDq8hX2zxWVfU6dSdHmDsX
         vKzTzrMFksP3rd8Bxj7DQPodk3dzxhHCznC1jwfl/oWVeazA7Bd1zxFNEE4Pq28S1+D7
         6SiVUV+om4dvicdRHpnjl6KauINteXQ/B2ECXkTQRzScaEwhDMbVx03pRcjroncxTDjj
         2W3RxsmhahuMUCWYNojY8XkYF1D/TrceOkhgsywiA3SttHtJJSaEr9YFhDWd5qlEzFw+
         J/LA==
X-Forwarded-Encrypted: i=1; AJvYcCWtK3pITe/3IBFroF5UFNWLEtIgnN91R/A+xbYASHNddQc2ukjHISjNehuTPRxBp0xUyFD3lZ//TvkxPZziU4Q5@lists.infradead.org
X-Gm-Message-State: AOJu0YzM0t9FHetc9KNjbS9V/+x9kph5rSMqFeorFCQMBZ/109cDg452
	zgQ8cgy1DGmjFXhjJFKdeMjAsHQfT9ovNSS1cu8Re1B6LhktsUKTSpIAv4kosXGW9+v/HVAU3x6
	9P1/au7/s+RbHzp2reRiJcYMILFV1rLblQZo2QwkRZdYGdN4tWOddoT1wDsNF7GorQg4Danne
X-Gm-Gg: ASbGncsNIedZdVIQcZsjN6547IQ0HCjcMFmxQkx5uRKuk7CF8NSPyWTVVGQ3BEtRNGk
	L47ql72gztATwlHQ5cLUJNgA8gVJ4uuCPvaEFHMpivwXtnMf/+19roIEFe/tSh10Osr1/0urATM
	cPifdImLjyBr3OYxZl4C/+ApJ6MO8rZden0dz+q3aPQDWpSiroxY9pijujqUifvsFFgpDpU+zq6
	Cf2g/H6fDJv1R5/Dj9np6tHKbTes/wEC9lc5J8Hb+9Aulpnvr2zNLK5232JtFxPLoFkBqh+ScOA
	HzWQGDWnVwz/
X-Received: by 2002:a05:6a00:3a25:b0:73e:10ea:1196 with SMTP id d2e1a72fcca58-7403a77bf00mr7642188b3a.8.1746068352828;
        Wed, 30 Apr 2025 19:59:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0SD+HY6HsoDRs4fU8wKvcmnTLQD3iURrjVjXooMLHosKIAp3vt2EoNdzvtsz4Y2FqbqtOvg==
X-Received: by 2002:a05:6a00:3a25:b0:73e:10ea:1196 with SMTP id d2e1a72fcca58-7403a77bf00mr7642161b3a.8.1746068352436;
        Wed, 30 Apr 2025 19:59:12 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7403991fcbfsm2480425b3a.49.2025.04.30.19.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 19:59:11 -0700 (PDT)
Message-ID: <0cd3d811-1e05-4cdc-aaea-b45fddfc9e2d@redhat.com>
Date: Thu, 1 May 2025 12:59:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 29/43] arm64: RME: Always use 4k pages for realms
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-30-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-30-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G54jxpSFB8BAgCfmC1ifUikONZcdXzmLLQR9dlThGcU_1746068353
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_195916_496640_53D78256 
X-CRM114-Status: GOOD (  22.45  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> Guest_memfd doesn't yet natively support huge pages, and there are
> currently difficulties for a VMM to manage huge pages efficiently so for
> now always split up mappings to PTE (4k).
> 
> The two issues that need progressing before supporting huge pages for
> realms are:
> 
>   1. guest_memfd needs to be able to allocate from an appropriate
>      allocator which can provide huge pages.
> 
>   2. The VMM needs to be able to repurpose private memory for a shared
>      mapping when the guest VM requests memory is transitioned. Because
>      this can happen at a 4k granularity it isn't possible to
>      free/reallocate while huge pages are in use. Allowing the VMM to
>      mmap() the shared portion of a huge page would allow the huge page
>      to be recreated when the memory is unshared and made protected again.
> 
> These two issues are not specific to realms and don't affect the realm
> API, so for now just break everything down to 4k pages in the RMM
> controlled stage 2. Future work can add huge page support without
> changing the uAPI.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Rewritten commit message
> ---
>   arch/arm64/kvm/mmu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 

One nitpick below.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 02b66ee35426..29bab7a46033 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1653,6 +1653,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (logging_active || is_protected_kvm_enabled()) {
>   		force_pte = true;
>   		vma_shift = PAGE_SHIFT;
> +	} else if (vcpu_is_rec(vcpu)) {
> +		// Force PTE level mappings for realms
> +		force_pte = true;
> +		vma_shift = PAGE_SHIFT;

		/* Force PTE level mappings for realms */

>   	} else {
>   		vma_shift = get_vma_page_shift(vma, hva);
>   	}

Thanks,
Gavin


