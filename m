Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B7CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 06:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zI8D8uocFF8F+2XhHexBL1IpPQrJANqDT+M7dCzcoYE=; b=Pz7jhDNAc5fg9p9CQHtzyMpoYU
	l3QxnGWqG8J6YiGFi/4RGxVwurI2+Fp22/Pwy0HUu4M24ylFZUKEAeUf4VOrjt97eYjcFdVUKYQrE
	phTVt+8HY8F/Bn2/7SwmsTcxjZew1L3xl7Y/Y05ytEi4p7q9MwsxTSX0Lya6JdVMww7/pvMRhnx67
	1OomOlPF02az1NIzyLStVch23MbvnJBgqbNaAT7hFX9gSB43nJQdAHxRUidIUSi1qBWHo+xx6EpRa
	987K/AGL0nWLrMu50fjZ7ayYcPT09q5vBsKC7OAhPUPiiiDNCR5+pECel89V2HovtWYQBx9I6YDkN
	xwu0DxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aqp-0000000AvKc-0Ujh;
	Fri, 04 Apr 2025 06:48:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ap1-0000000AuzK-26UA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 06:46:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 757C41063;
	Thu,  3 Apr 2025 23:46:36 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 113043F694;
	Thu,  3 Apr 2025 23:46:30 -0700 (PDT)
Message-ID: <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
Date: Fri, 4 Apr 2025 12:16:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting
 ARCH_MMAP_RND_BITS_MAX
To: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ssradjacoumar@google.com, chromeos-krk-upstreaming@google.com,
 =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
References: <20250403183638.3386628-1-korneld@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250403183638.3386628-1-korneld@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_234635_580510_BD0A9EC8 
X-CRM114-Status: GOOD (  16.87  )
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



On 4/4/25 00:06, Kornel Dulęba wrote:
> When the 52-bit virtual addressing was enabled the select like
> ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> Because of that the rnd max bits would be set to the default value of
> 18 when ARM64_VA_BITS=52.
> Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
> be used if 48-bit addressing was used. That's because the 52-bit
> addressing is used only if the caller provides a hint to mmap, with a
> fallback to 48-bit addressing.

Why should ARCH_MMAP_RND_BITS_MAX value be same for both 48 bits and 52
bits VA in case the user does request for 52 bit VA via mmap() hint and
the HW supports it ?

> 
> Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
> Signed-off-by: Kornel Dulęba <korneld@google.com>
> ---
>  arch/arm64/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 748c34dc953c..38e0bac567f5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
>  	default 24 if ARM64_VA_BITS=39
>  	default 27 if ARM64_VA_BITS=42
>  	default 30 if ARM64_VA_BITS=47
> -	default 29 if ARM64_VA_BITS=48 && ARM64_64K_PAGES
> -	default 31 if ARM64_VA_BITS=48 && ARM64_16K_PAGES
> -	default 33 if ARM64_VA_BITS=48
> +	default 29 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
> +	default 31 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
> +	default 33 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
>  	default 14 if ARM64_64K_PAGES
>  	default 16 if ARM64_16K_PAGES
>  	default 18

