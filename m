Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87426C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 05:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euk2fmZv2LNbLice/Z0x6Rljhq6arGIlFTmkqCQAlc0=; b=2c2iGdi7M3ite1T6wxfV9Vs3Yh
	/xGDLxA7QJETDtSe8UqccJEnMpku8igsTn/nveHzKRYYFBt7Dv99lQiZi1OUsl84KXsbBdELljgJe
	WuJqr+n+CHRcLoNNy0A4dMOIU+3zmU8NnZRugeE5KyUtYfzazFvWFkaOJ/HNPdCiRbZOQ3K43jowf
	lE5PWsszefIKqEUj4SY7mmwpTELxKj+reVhz7wUduRvZTT3CE7v6tFVwTWc8APL59hDLy3pLQXqz2
	6DjW5LPOaLcdWgar7bCkO28HIC0BNwLrOxHv/8DhN+02cdRo0lrUV8QqyMsWkl3hXDM61rlLUDgOO
	rOAFL7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnSd-0000000G0T2-3wIX;
	Tue, 25 Feb 2025 05:26:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnR7-0000000G0Nt-0MDn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 05:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740461090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=euk2fmZv2LNbLice/Z0x6Rljhq6arGIlFTmkqCQAlc0=;
	b=GhuMMqAd15MJgLedDtIxTyNI/ZtB2C4i9YK6HXJf2ZybhYdLam+L4c02YAGwCmtZFdHv/l
	8u+1xvosKT1pj/s66h0x7Drcr5qh1UkpIOqxiNOZWpbX0FfXl08SqaTloBsWt3J6LIM8JG
	AkWu0LYy6XmNTAoPhqLgkyWvjv6t5Cg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-VwYejRVVNh6qDq1mah3Scg-1; Tue, 25 Feb 2025 00:24:47 -0500
X-MC-Unique: VwYejRVVNh6qDq1mah3Scg-1
X-Mimecast-MFC-AGG-ID: VwYejRVVNh6qDq1mah3Scg_1740461087
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc3e239675so17483651a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 21:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740461087; x=1741065887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euk2fmZv2LNbLice/Z0x6Rljhq6arGIlFTmkqCQAlc0=;
        b=UdpdT+ah5MEi/GMBXNEqJqaicEm7RLHkds332i+d0axHYDsEF+9q+7eHIcU/Wewa/W
         pRD8cnZkralqBm6U8qgk7zT4gU5Kad6WeU9GQICLmPSwilKEhnSpdrIDcTMjD8v52M5S
         CzO+F6g8qeNG3KTGFU+SPMARC9wdYUlJ2H7Hvx/pdbH4qnn7DsBxRrRgR+AnQonL8HaS
         qYnxMThhJjOavgFj6Bbgbm2gJTxAYBGg7ExS7nJe+sngz8naUwLulWgaHaNdhRoMDjoR
         Rxv6Zub+NHlTqc3EgnuNyYir58JUnXNw0HzI5z2cUfK7Onwy2TtivFbB4vueaqQiEsg0
         P4FA==
X-Forwarded-Encrypted: i=1; AJvYcCW9DRzLHK54AJPjQVzIJnBo4CAFpHtbDdSz66wd4OWMsKLXu+SpB78LW8l8SbFU7Um4MTe8ZuN/NavMAMxKfTEW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2OBVVP2sksJQGP6PVmQ8VN3BaiPeuwdqDDzZXDmmkvkIeP4NZ
	kFiIOdg3ScWhG8Qx1HCBpn/ZNqatvmYo+unqySWMOHhBqJ0ykA5PALSS6iJXKWlkVeW3ats0qyG
	/6mDKuN6hBgpcWcA8N+cnsVabBodbXjrChqoxiaLDePlsAmhvhZnS9oxTEeXTFfuVYqvLTpdN
X-Gm-Gg: ASbGncvinwYHcw87d7trDGBY2V5n5VcKw1uDuFp4lxn1LQ7Aq9gNIXyxjLy0+HmSCyU
	c3+xIKOy5kqybQUoWPfqopLo+1gIzKvqN8F8BqUTcDQiCf8fbvMueutb2BS2Ttys1IILHMxT3G1
	NwbqSKSm5/965eJAop+5o9LzEbYMF+N59sH7BKbvWYgTJQflsasICNCoSRDYRjZjWrYzZEaBmDK
	KxRgvYDMPPqnYbZ6/6JL0a8Dxn2diGWv990/2O1n1qmhfbwgqHe2VY3oUzgCfBxZnHI/3iG0H0a
	/Zq2l48YG2ZA415Ikw==
X-Received: by 2002:a17:90b:3ece:b0:2ea:712d:9a82 with SMTP id 98e67ed59e1d1-2fce8740b67mr26636369a91.29.1740461086796;
        Mon, 24 Feb 2025 21:24:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE629eSWp0iBQ+GwtWJD8yExk0rRA/MA5lHmZY3b0ZVr1mQchvCUVCRPoKdSpkAIzulYrLgmQ==
X-Received: by 2002:a17:90b:3ece:b0:2ea:712d:9a82 with SMTP id 98e67ed59e1d1-2fce8740b67mr26636347a91.29.1740461086502;
        Mon, 24 Feb 2025 21:24:46 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb12dc27sm7652826a91.45.2025.02.24.21.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 21:24:45 -0800 (PST)
Message-ID: <c710a9d6-bd1b-4867-bdc9-b3a79e577d0e@redhat.com>
Date: Tue, 25 Feb 2025 15:24:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: realm: Use aliased addresses for device DMA
 to shared buffers
To: Suzuki K Poulose <suzuki.poulose@arm.com>, will@kernel.org,
 robin.murphy@arm.com, catalin.marinas@arm.com
Cc: maz@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 aneesh.kumar@kernel.org, steven.price@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20250219220751.1276854-1-suzuki.poulose@arm.com>
 <20250219220751.1276854-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250219220751.1276854-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U4xfvvVNDttM4y7wDryyyxprxaVrdlix2jK8jW9Xck8_1740461087
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_212453_207035_4F86CABA 
X-CRM114-Status: GOOD (  23.79  )
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

Hi Suzuki,

On 2/20/25 8:07 AM, Suzuki K Poulose wrote:
> When a device performs DMA to a shared buffer using physical addresses,
> (without Stage1 translation), the device must use the "{I}PA address" with the
> top bit set in Realm. This is to make sure that a trusted device will be able
> to write to shared buffers as well as the protected buffers. Thus, a Realm must
> always program the full address including the "protection" bit, like AMD SME
> encryption bits.
> 
> Enable this by providing arm64 specific dma_{encrypted,decrypted,clear_encryption}
> helpers for Realms. Please note that the VMM needs to similarly make sure that
> the SMMU Stage2 in the Non-secure world is setup accordingly to map IPA at the
> unprotected alias.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/mem_encrypt.h | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
> index f8f78f622dd2..aeda3bba255e 100644
> --- a/arch/arm64/include/asm/mem_encrypt.h
> +++ b/arch/arm64/include/asm/mem_encrypt.h
> @@ -21,4 +21,26 @@ static inline bool force_dma_unencrypted(struct device *dev)
>   	return is_realm_world();
>   }
>   
> +static inline dma_addr_t dma_decrypted(dma_addr_t daddr)
> +{
> +	if (is_realm_world())
> +		daddr |= prot_ns_shared;
> +	return daddr;
> +}
> +#define dma_decrypted dma_decrypted
> +

There is an existing macro (PROT_NS_SHARED), which is preferred to return
prot_ns_shared or 0 depending on the availability of the realm capability.
However, that macro needs to be improved a bit so that it can be used here.
We need to return 0UL to match with the type of prot_ns_shared (unsigned long)

-#define PROT_NS_SHARED         (is_realm_world() ? prot_ns_shared : 0)
+#define PROT_NS_SHARED         (is_realm_world() ? prot_ns_shared : 0UL)

After that, the chunk of code can be as below.

	return daddr | PROT_NS_SHARED;

> +static inline dma_addr_t dma_encrypted(dma_addr_t daddr)
> +{
> +	if (is_realm_world())
> +		daddr &= prot_ns_shared - 1;
> +	return daddr;
> +}
> +#define dma_encrypted dma_encrypted
> +

With PROT_NS_SHARED, it can become something like below. (PROT_NS_SHARED - 1)
is equivalent to -1UL, 'daddr & -1UL' should be fine since it does nothing.

	return daddr & (PROT_NS_SHARED - 1);

> +static inline dma_addr_t dma_clear_encryption(dma_addr_t daddr)
> +{
> +	return dma_encrypted(daddr);
> +}
> +#define dma_clear_encryption dma_clear_encryption
> +
>   #endif	/* __ASM_MEM_ENCRYPT_H */

Thanks,
Gavin


