Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC41C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 01:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNWNGWaV1C7Rc5It4RVCgRxPXuXUM3HIwMrohqVBiKw=; b=KIwhu6dAtlFOVUwRn7caMTcWH/
	tDuxMvLeK4hl/fH774gKtfMd1spzKD/Gs+thDYA6i4MGMYY8q+m4oNYkHSIeTAPPS3iy8Q0gbhBCd
	BYpu2hQ60dlGjJFTy8PfqSWZM+62cPPXtldjhyHhibJn+kHc2CZTVPrjaKl/qdQSOX0mnjfx/usfS
	zGo7iWBDaoxTdYaQu27nAWr/sbUNg+Hy59W8zytU0qCnyON89KIEqg8vhBnl+yRva11AYgwvtzCjx
	eOlCiauyYpGl3hCVVXTqT1c3FncwpK2UTJxtzZZAX1k9R/CuEmR4ORGeJJ4TpUiAN4YE90RZI2l7k
	VErFXWwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW3Rg-00000000yd7-159e;
	Mon, 30 Jun 2025 01:36:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW3PJ-00000000ySq-1DAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 01:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751247242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNWNGWaV1C7Rc5It4RVCgRxPXuXUM3HIwMrohqVBiKw=;
	b=MW0oV0+D27L/h55y+7XUdIyrGOMDSGfdDcP5GIQ4xVuq7BlA7x6FcUsm9GGlDBjMExEl6v
	OhACNcK4JOI+GJgjIY0oBs/p1vgGZfCpDhH8q6jLm7PWQOyY7eny7pjh8kuFxrf3xF5tDt
	n3q+OPto99DKPr7CqoNZfP1Q5mtR9tI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-q-08mL6cN8igMT2yVFro6g-1; Sun, 29 Jun 2025 21:33:58 -0400
X-MC-Unique: q-08mL6cN8igMT2yVFro6g-1
X-Mimecast-MFC-AGG-ID: q-08mL6cN8igMT2yVFro6g_1751247238
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235196dfc50so33102185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 18:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247237; x=1751852037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNWNGWaV1C7Rc5It4RVCgRxPXuXUM3HIwMrohqVBiKw=;
        b=wJNwGUsMGb/oYBJFKvcX5yoS+UMHtBugrckG3P5f/mTBoOLMvEF/j2CNenYU0RwX5S
         o7IzlTF4GXU0PUcglIxMBqeOO/fzjz0mAhelM//5IsJPIPDmChZd9AkepGmbVxrgQ4Kq
         DdgeX9XjsVca1tIt5jKxdO6frDuFmxS5Ny+WHomr7BjR5vuisO7n2bmwGlJCm78pSiKs
         W8i1txt/p2yzs28IRmys/B3eIA6sOKHauS39SgvuAkrl269O0txj+zP86LFtR2Ezq83F
         vsq3tT2pqKKovkBXw2ufhb66Xu/1B0vP/eIvL+QwNmgzxx1sdhug9+1jDgsOTXC8okle
         xB8g==
X-Forwarded-Encrypted: i=1; AJvYcCX/hw/HcdSKtFA5sy4gSAFd9NVEr550LOfU4mL0aS8GyRTvercg8J5P4VbVRdxiRUOOpsq4CqahQcjaWgp2CSwD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt2xgkmnopUObiD0jYomBA5l7pkEIaOgBzeYnrRab8l+QFKYQC
	s7y4SXS4aAaDmVT3PHHh/N6btjBnJi/DS0h24drzhHnT7jlXshrOPLUdTfWzS6pM5ruNJ0H5Md8
	Y4kpwRbrcZS47zyaLtDNpSPkxK5QV946MLjWfLmaZkDCgC2z2iB3jNmjyAcLRXZzguadxCFiuAQ
	dP+UzA0msPCG8=
X-Gm-Gg: ASbGncv3dt5zfteWv3QduIb17hVvIMgGaAL8XuvTLHA8SVqL44xYOAHbsRREYeue8Y4
	suXKNEJB5LEMlykcj72OBQr4LVWm351+b8CRId86i1zUpSt8/aEWgmkAK/B4/haz3Apg+Bf+kUu
	V1lznAjKdUxZhNeADP3hCtFVKvzr1c8yCcsYWNyXG3qJhWLYP6MIpcEOldvKWGLNdE5sArTx49B
	uHV+OiXhbXMMCn11yHOboZbZwnvXrp6XDvPfnlHdPJ7zskt60W6O6kc5qHxADahbSByPEO02ytI
	le3MHgQrFXwPNC+IK78hKvuYPoXm0TqKP0A47hjLPFjKG0nuZYE6nb0Bznh3bQ==
X-Received: by 2002:a17:902:b786:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23ac4ed658dmr113110185ad.11.1751247236933;
        Sun, 29 Jun 2025 18:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0UzeTes1Wws6mWimwk3D6DY1DWDUcvAN9WVyT3V3qmR+5QMOP2u9XGuIdy+7b5HGR6wUmhA==
X-Received: by 2002:a17:902:b786:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23ac4ed658dmr113110035ad.11.1751247236581;
        Sun, 29 Jun 2025 18:33:56 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c4b23sm67946215ad.214.2025.06.29.18.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 18:33:55 -0700 (PDT)
Message-ID: <20f82d80-58a8-432e-8a9e-40196bbb6cda@redhat.com>
Date: Mon, 30 Jun 2025 11:33:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: realm: ioremap: Allow mapping memory as
 encrypted
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, steven.price@arm.com, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-2-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250613111153.1548928-2-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KCvqyBqRWdfwXvmlCLYi6f-ddPU5ThivCMGbzUDruCQ_1751247238
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_183405_749999_96FF2A05 
X-CRM114-Status: GOOD (  13.20  )
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

On 6/13/25 9:11 PM, Suzuki K Poulose wrote:
> For ioremap(), so far we only checked if it was a device (RIPAS_DEV) to choose
> an encrypted vs decrypted mapping. However, we may have firmware reserved memory
> regions exposed to the OS (e.g., EFI Coco Secret Securityfs, ACPI CCEL).
> We need to make sure that anything that is RIPAS_RAM (i.e., Guest
> protected memory with RMM guarantees) are also mapped as encrypted.
> 
> Rephrasing the above, anything that is not RIPAS_EMPTY is guaranteed to be
> protected by the RMM. Thus we choose encrypted mapping for anything that is not
> RIPAS_EMPTY. While at it, rename the helper function
> 
>    __arm64_is_protected_mmio => arm64_rsi_is_protected
> 
> to clearly indicate that this not an arm64 generic helper, but something to do
> with Realms.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/io.h  |  2 +-
>   arch/arm64/include/asm/rsi.h |  2 +-
>   arch/arm64/kernel/rsi.c      | 26 ++++++++++++++++++++++----
>   3 files changed, 24 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


