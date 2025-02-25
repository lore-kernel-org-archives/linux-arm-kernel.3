Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF970C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 05:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NUjSEYdYicw0eBxTkoq1tdaPZmsum3sTHbVvspj4iI=; b=WZwmvum8csz3z5K+TPrD6DcXU6
	DzJKFuhwHjNSL2wAs6MeCncd/yhUMYSxKPxebQBTYXoIlE1YF9ygbFnHMBc9vEAznPMx558Vp7aPn
	Zs7NQFQ2v8KCLvDxoE8C95LxOBiFZXmQ21nh12PznVdXnVpDImUVmbgGL11WK9htdZmt3OAZBADT4
	padweislU/BdaucwxLcGPdkOUtt/BjoFMbVWsaszZWA4QIG1ip7zrzlqJVGB+JIqUh9XERkP9QWNf
	dovG2YxuYPDkrbJGV+841daf862EGkcuepVejZXItuz2PX4a+/EOaLmsrwcnriiRF3pa+W2kYfrrh
	8jdv4yEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnWC-0000000G0eg-31H8;
	Tue, 25 Feb 2025 05:30:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnUh-0000000G0a0-21HX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 05:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740461314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NUjSEYdYicw0eBxTkoq1tdaPZmsum3sTHbVvspj4iI=;
	b=KE26V3mffyNeGagP4e/WL84f5DiNbSIBFth83YDWjS2AEzA2dxxsfFa9pbdmJ6cpu2znuY
	r/LnbmhZ434eign4Zwt7ddu1Jru+ZIpp41q+c//Iwq3AwsJbJSGx//3iqQXSCrNwaHyvz2
	srid+AiD0mlX9724YTlMzLZmU6rrsQc=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-EWvWbZxRMNGjIs_vgWhjng-1; Tue, 25 Feb 2025 00:28:32 -0500
X-MC-Unique: EWvWbZxRMNGjIs_vgWhjng-1
X-Mimecast-MFC-AGG-ID: EWvWbZxRMNGjIs_vgWhjng_1740461311
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2210121ac27so110517715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 21:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740461311; x=1741066111;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NUjSEYdYicw0eBxTkoq1tdaPZmsum3sTHbVvspj4iI=;
        b=ti1CSqDIEGv1kUd12N2wK0ajgG+QgJFzcevTP6/0s40jCWdWW+bp22lLfwLybw6Fm/
         L5TOhpxHGrBbvLzd7YYFyI7E4vUOJSrq3FxY2b6Gbq32L1sh856xB7FtYTy2N0uYW+sZ
         J0WaoFsn2AFhf8qLD7Z2STh3Lyt7HT4iooM5aT/mqtKffqpfKWwr3b01/gIIOBvc4Dev
         JX8Jk9JFCGM+7HM+WF1wFwEIBF7g7RQ4I9P7XmuChrV73hawbW9z9tgDQlSvfYDz0Gbg
         2CeiNjwvp4Yk8Om0oneqmne7t/YLlR2iilLEUk012AlPirNLnkgTaPfEn4n9WOdNg6jr
         FF5A==
X-Forwarded-Encrypted: i=1; AJvYcCUPSbIog4/xBxYAimu5DmQ3nGrnoArWH5rVYy03pFOKUMpu8w0JfxIb70hDPxcQGtPfwR3qmx8pecgh8aSz1R2x@lists.infradead.org
X-Gm-Message-State: AOJu0YxonZ0cyCWM6iZ3EAwQI/zRX9j2VvueQvHBqQ1KVz0UAfmDnuZj
	sAXx9mWIYVAq/1NQAgfOvlotpNF1hD+FyP1v7jjsK/GJsJPoXfCA/NceVvu0Cdhd/gpx4y06PEt
	vQxjV/oRHoyYoUYZYZBTRlqvRIzRpBywZ+ujCgNSLyon4woP18sT8vdYBN10JXm+Z/5QhXz2p
X-Gm-Gg: ASbGnctwYruYYP+cb0ug3Xj4HKM43q6hxwtF8vy4aTMUgW6hR7+idGE5yUH1KdUPyN6
	OCBiP1E1LE+0PMQRhoSkEO11XtW2XuXGw/b23YfbJOOn4S0diNw7Pe+kYTU7svodRQ3PHuFAZWv
	nm9TLULtuuvq0oPo6BsshaAJx0RGax1CQj9vVWIFPBOdXLAOMkPqa86ecY4JteYyKSA+hHW8Qh9
	RTzjxsCrMw392rl5C/ZOaSrhoUkqiu4xlB6d5aLT/EbNJ6u8J+4kLuknUfnc71LKq724Q162tH2
	oxI0LXbxBM1m2S/kqQ==
X-Received: by 2002:a17:902:d4d0:b0:21f:8453:7484 with SMTP id d9443c01a7336-2219ff61d6fmr262643945ad.30.1740461311409;
        Mon, 24 Feb 2025 21:28:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWEKWTJ+abF91IxGYeto7bQIpOErHP0Z2jKXfqBhYv9SfzPfkcFZPuQ+Nc/9Vvo9lQFQO3wg==
X-Received: by 2002:a17:902:d4d0:b0:21f:8453:7484 with SMTP id d9443c01a7336-2219ff61d6fmr262643665ad.30.1740461311082;
        Mon, 24 Feb 2025 21:28:31 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a798asm5232455ad.189.2025.02.24.21.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 21:28:30 -0800 (PST)
Message-ID: <308f8a08-a6f8-403e-a130-18c7d3db2e23@redhat.com>
Date: Tue, 25 Feb 2025 15:28:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: realm: Use aliased addresses for device DMA
 to shared buffers
From: Gavin Shan <gshan@redhat.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, will@kernel.org,
 robin.murphy@arm.com, catalin.marinas@arm.com
Cc: maz@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 aneesh.kumar@kernel.org, steven.price@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20250219220751.1276854-1-suzuki.poulose@arm.com>
 <20250219220751.1276854-4-suzuki.poulose@arm.com>
 <c710a9d6-bd1b-4867-bdc9-b3a79e577d0e@redhat.com>
In-Reply-To: <c710a9d6-bd1b-4867-bdc9-b3a79e577d0e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5gEUB3sf7tdDtusq7s5SkxwrIX8JYG5Zgjz33Zbgb9o_1740461311
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_212835_596473_D050DC16 
X-CRM114-Status: GOOD (  22.58  )
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

On 2/25/25 3:24 PM, Gavin Shan wrote: 
> On 2/20/25 8:07 AM, Suzuki K Poulose wrote:
>> When a device performs DMA to a shared buffer using physical addresses,
>> (without Stage1 translation), the device must use the "{I}PA address" with the
>> top bit set in Realm. This is to make sure that a trusted device will be able
>> to write to shared buffers as well as the protected buffers. Thus, a Realm must
>> always program the full address including the "protection" bit, like AMD SME
>> encryption bits.
>>
>> Enable this by providing arm64 specific dma_{encrypted,decrypted,clear_encryption}
>> helpers for Realms. Please note that the VMM needs to similarly make sure that
>> the SMMU Stage2 in the Non-secure world is setup accordingly to map IPA at the
>> unprotected alias.
>>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Tom Lendacky <thomas.lendacky@amd.com>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/include/asm/mem_encrypt.h | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
>> index f8f78f622dd2..aeda3bba255e 100644
>> --- a/arch/arm64/include/asm/mem_encrypt.h
>> +++ b/arch/arm64/include/asm/mem_encrypt.h
>> @@ -21,4 +21,26 @@ static inline bool force_dma_unencrypted(struct device *dev)
>>       return is_realm_world();
>>   }
>> +static inline dma_addr_t dma_decrypted(dma_addr_t daddr)
>> +{
>> +    if (is_realm_world())
>> +        daddr |= prot_ns_shared;
>> +    return daddr;
>> +}
>> +#define dma_decrypted dma_decrypted
>> +
> 
> There is an existing macro (PROT_NS_SHARED), which is preferred to return
> prot_ns_shared or 0 depending on the availability of the realm capability.
> However, that macro needs to be improved a bit so that it can be used here.
> We need to return 0UL to match with the type of prot_ns_shared (unsigned long)
> 
> -#define PROT_NS_SHARED         (is_realm_world() ? prot_ns_shared : 0)
> +#define PROT_NS_SHARED         (is_realm_world() ? prot_ns_shared : 0UL)
> 
> After that, the chunk of code can be as below.
> 
>      return daddr | PROT_NS_SHARED;
> 
>> +static inline dma_addr_t dma_encrypted(dma_addr_t daddr)
>> +{
>> +    if (is_realm_world())
>> +        daddr &= prot_ns_shared - 1;
>> +    return daddr;
>> +}
>> +#define dma_encrypted dma_encrypted
>> +
> 
> With PROT_NS_SHARED, it can become something like below. (PROT_NS_SHARED - 1)
> is equivalent to -1UL, 'daddr & -1UL' should be fine since it does nothing.
> 

I meant (PROT_NS_SHARED - 1) is equivalent to -1UL when no realm capability
is around :)

>      return daddr & (PROT_NS_SHARED - 1);
> 
>> +static inline dma_addr_t dma_clear_encryption(dma_addr_t daddr)
>> +{
>> +    return dma_encrypted(daddr);
>> +}
>> +#define dma_clear_encryption dma_clear_encryption
>> +
>>   #endif    /* __ASM_MEM_ENCRYPT_H */

Thanks,
Gavin


