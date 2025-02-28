Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D51C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQ/Fl0HwXzRHNyxsWxoDbaxOZuT2N+fcGDEHmXA1hb0=; b=ZZBOXOp7RvfPVGWgJTTZEVriFP
	HbITJc2O2jo8YWHg2sE9Zq/yS2lNgzTetCQWbvnMqVeO+kbM7lVdyXhwibTTx1x3mPqZ98//Xdbqz
	aIq1MOKH4M9w0VvQuL2OYoiPacHZmKtm+KtfchBEmxmTpY1noZYHtkXntKDbWITnuzhQxMs3cKEAI
	JNA1j/iVv+6RhFUYtqPIFQFjAEjqrtx+RBaoiqcT8myJjJcq+QmJy7X5mhHQfQT+f7XQElHuhRFOd
	dZHcOSWtX+Y8A8Xw6dQHdxHHaXL0RIacG4oARDxYsgtssw9Or+DLo4EH9DzZF9WCq33/WAdaJCEN2
	9UmaK2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnppJ-00000009SDE-1jQY;
	Fri, 28 Feb 2025 02:10:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpnk-00000009RwE-1lhQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740708509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQ/Fl0HwXzRHNyxsWxoDbaxOZuT2N+fcGDEHmXA1hb0=;
	b=IMId/STe+3oQLfDC8ekxjcNJo2zPo+RR1Di1+ncSZ7Gmw98eycPNK/BXVIkyE0ncp/jNmw
	fDOSbGDcIyMv9c8Jk9/QVT/hHeog4LOZ25E6LZzqImk4EbGEHjwHY4vqc3qbcXc0I1NEYC
	JdDT8jRXz/zgoVhyoKc0Wf3wlpEyIvA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-3IvJ_wcRPou0NqZ5z31qSA-1; Thu, 27 Feb 2025 21:08:27 -0500
X-MC-Unique: 3IvJ_wcRPou0NqZ5z31qSA-1
X-Mimecast-MFC-AGG-ID: 3IvJ_wcRPou0NqZ5z31qSA_1740708506
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22107b29ac3so26970415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 18:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740708506; x=1741313306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ/Fl0HwXzRHNyxsWxoDbaxOZuT2N+fcGDEHmXA1hb0=;
        b=B3gvlngHp+tQ+Y7hseiwgngc0mj6oANghQtbae48hq2x/kWQaYqE7PwmpYZhpQtheC
         EUgf1UWg0iEDhb3PPkxBrZ4RkmaJnFPzkgAD13JxQFaFcqXAh7xQF3wxmdFWbD/xtNdP
         YdAisd1zrI7+kn7Z6gRT8TH+rQlDdTOMdaGbjZfM/eTOIV6ylq8KHf4LVznus3j42Xl9
         hAeNSYsWXyPtUkXx+zKwXXubJVKAPYypoKyl+apO1DNlroLJO0+USzqGqHW5umksVz36
         79czhf5WuZ7dQPcR0WIoXP2M0ldlBuU3UDYkqu5inokobLze4skuDNZQvY4bqLlDXFgv
         5mVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPI1ARXqq47rGiKGP2Gc3URk16JyBqziiiiF/cUZqDHVz43YdQ8Rrtlb7DBJ3cUkSjCzRNWm0ehH4oQNIbGfQb@lists.infradead.org
X-Gm-Message-State: AOJu0YxY4Wkn7l5sIKaKtTnSgbUEla17jlRvmM1yVJWUGb+OqsrVPO68
	hexLEyOmZ7Pyj6ObNNH1iIXZvSNrWO3zgW4v8jWnH+plvdwPASmKeCbIYpnxYLForQLMA8fGDU9
	zibOmhOxMR/ncXCpx5seD0pfPXYmxXhGk5fBtULq2IYVT4YCG9xYLe+JHavccbrSVKdrnJjyx
X-Gm-Gg: ASbGncuXYAsYzZa/Z70Tl4Jev7PB/54FMrDO50KgejOeWoUfdb1glatzEKm2zrv3aCM
	AgwuQtUtsIESItGb1fFUZBrRtkzTzzoDdI7Uy4hycdmZ8pGHu2NFY+Flml6778ghjFhVTYhmXAX
	IHu/FaDjFu2q9Qn1ttWuTJRhi4FsPGDBc0YXzcA6N0jk4UdvY2dMRNLV+1hSTy7lx7vDlqEeUUp
	BMz/JMcXFnbHwgfFKdBveHgh85dUHKHr58ssjIUrTeBbkavAHeq28dVLqOgB59uoBnGdXk+KCoF
	N+xZn8il2vcFSHokaA==
X-Received: by 2002:a17:902:e88f:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-2236750c421mr28814225ad.25.1740708506486;
        Thu, 27 Feb 2025 18:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqsxG1w4CFgPe7zp+BHrGfr4zyqy2gKPJF3ydIcoqOzD/vMt4rTiKChpT0/GXLXVDP/aNN0g==
X-Received: by 2002:a17:902:e88f:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-2236750c421mr28813865ad.25.1740708506147;
        Thu, 27 Feb 2025 18:08:26 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fae0esm22661535ad.93.2025.02.27.18.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 18:08:25 -0800 (PST)
Message-ID: <5c59d489-f9f9-4383-a90d-93badfb65291@redhat.com>
Date: Fri, 28 Feb 2025 12:08:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: realm: Use aliased addresses for device DMA
 to shared buffers
To: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org
Cc: will@kernel.org, catalin.marinas@arm.com, maz@kernel.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
 <20250227144150.1667735-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250227144150.1667735-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uE7fRYxfLIw_kSKXRQM7IqKpDcP36BxOqeHXPqZP_Ug_1740708506
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_180832_541560_6A3D078E 
X-CRM114-Status: GOOD (  14.78  )
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



On 2/28/25 12:41 AM, Suzuki K Poulose wrote:
> When a device performs DMA to a shared buffer using physical addresses,
> (without Stage1 translation), the device must use the "{I}PA address" with the
> top bit set in Realm. This is to make sure that a trusted device will be able
> to write to shared buffers as well as the protected buffers. Thus, a Realm must
> always program the full address including the "protection" bit, like AMD SME
> encryption bits.
> 
> Enable this by providing arm64 specific dma_addr_{encrypted, canonical}
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
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v2:
>   - Drop dma_addr_encrypted() helper, which is a NOP for CCA ( Aneesh )
>   - Only mask the "top" IPA bit and not all the bits beyond top bit. ( Robin )
>   - Use PROT_NS_SHARED, now that we only set/clear top bit. (Gavin)
> ---
>   arch/arm64/include/asm/mem_encrypt.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


