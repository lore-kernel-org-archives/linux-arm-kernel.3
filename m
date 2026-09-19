Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F48FC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6/gGbCzk/OqjK8WB0tNPmKiq0+9IU4ZMakFuMZKwKY=; b=JYUvKti3p8CWT+0/+yq8ElaLNd
	o223TimeAGN4Cty++RDQrdHeiVY0VgXlyxXTsJf6jarU6xhizUC9yDjZ5UpU/CiV625NxkKsIR8gC
	0qwBxDZCqRI3vcIB27H8wFPtGQsrl6tEoD7vYzT6d8zDk/NYH8alnuSeOkSSJ2AV15+DLU5E1OWYQ
	ku7wrmu6gNfUEez76QWQRV8sunP/Fcyc7Qs6cNyo11DJ7f+UcviZp8OPPF8Na4Oi00Voaa3BUDHa5
	EvGL29N/vK+ZIkRjNte+SSaVWYlvCnREfdW31lwHh7CBkA/8M4O53tCOw1zidbNuBdxSeMfxFUcMS
	Lu5BJyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wCf-0000000GNrz-1d42;
	Sat, 19 Sep 2026 14:38:09 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wCc-0000000GNrd-2VmA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:38:08 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843172bff4so830505f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789828684; x=1790433484; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6/gGbCzk/OqjK8WB0tNPmKiq0+9IU4ZMakFuMZKwKY=;
        b=AWQxuX/V+uHWgjlieVS4GKR6M8MpNwrAwPq1Bz4U7t9/isc73BZIiYXJbbcMfcnZ4F
         TLWUaZAl6WuDJ1cA5zXXxNwXut4CyDNoUxOjPHXLiuqgcIHFVvnqU5wVSb76Z7kg6gV9
         8H8gcFt3/KUT0yKxtZ9WL4Fm1M2gAqPwQpKG0R81lR/xkfFt1naLUCj7KUvHIx7/GzNq
         60vWEBOUrPXgy8YzLilGGXFpeRznqn4QTwyVIFKSXuD++7kmOsJ1d16hxnZdwhrqxpFW
         8dK/bkS7NvnzVZmRFgLMtXzgutNb1se+hXqG3RenJ9MavcYHqpjjaVxsd4nPjL+dOIKQ
         JOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789828684; x=1790433484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6/gGbCzk/OqjK8WB0tNPmKiq0+9IU4ZMakFuMZKwKY=;
        b=MzfdQKa75bO6Hv4FRADChfdgXqkOJn+5REVMLNLfIMp61SlyQaDBCVZOyjRK80RXAx
         bxxt1bMqxOBYCcQhBjKVALoMM6GBf8r3AII7aDTb810AraVnKF8LeIeLY3ld//jqyZB1
         K/TlBH6X+e2AGq4DJiiShcD0stkjNja196JqStQEypdcC3i56RED6ySQi9XDjFPazExF
         Yuffa1Q1MH1vgGxI4qlNPg7TNDBIwTEXKFp8PjTZl0LCNzbY8jU0pQ6LWP2/wyodbLCu
         ZVFb4FI2Zvci5g5Bn3AhoKRPvrxt0l0uiTp+kwqA6jKbAhRtTyYSkkAx4hZ3gvnQhySg
         K3Bg==
X-Forwarded-Encrypted: i=1; AKwUvBy7KjGm9V7P8+/4MQRqWKu+1WMeP1oAeXDJbcZY3DsqWiDWj7CmSu32Kd+VHwdht0/02EkSg+a749SxDSecPt8x@lists.infradead.org
X-Gm-Message-State: AFuF++mm7ylHqC7Q7KHpg8EYlAQcbRP2TyZKVhp4MzKtG5/MlTajQN9q
	NWR6SDJJx1ThB9MTBVpp+q3+b7YEYxcMdoCLsaoD/OOLhhX/sQy07+rcmVEJ7dr2MpU=
X-Gm-Gg: AYBFou0QTOB8/5gG4jgMi4MgmRT9MqIE38glFQGw2rHb0s0wDXwAGlHtCkGwGIq5dO9
	XuCUatldYAwYeQY0QeS2JzhBWhtw+j4rjviDS+M5+OIY+oBKMzk7lYHG15Ta10elpgswVpJ+zMU
	wnAZmR3nPONbEmvyeAlK5UfPHD74fdXlGcUIEmSK7qJc8NhTFn35uIJdmQMXqjWVTAKcLPlz9nn
	6GPjrNhtvPQXKfHEqBg33F8Rl7/Hx43lsJwlORg5qHB6tkDpxkPTsHKN3rGgmhnX4sNrsc6S/O8
	/4YzyoJr4ccfJy1a0OC69kazHLAe/hQ8FyGc/Ivtoafdun/w6kib1SiKLD0FgWpPSo/8lXhXZaQ
	AzEMBeDpLGWWyNVChOIR4PpTA3f5KH9G2QHqU7LhZqlCRwHrLLh1sNKm3+siFcQGCtdcfWxOWdo
	2yAXYmeae7pmgVnGYce1FVDwwkz/FNu0pSGNW6VgyEQ35aeTYsgrePb0Kd8hvHM2Lq/TV+yx0av
	N6Sm49PoJ1n3nYYygEPnCRs7N6mDZFAq79+4sKr67RM0w6wCMYrAg4s
X-Received: by 2002:a05:6000:612:b0:487:8b9:66d6 with SMTP id ffacd0b85a97d-4871e26cd15mr8462557f8f.40.1789828684591;
        Sat, 19 Sep 2026 07:38:04 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872458f7e3sm7418006f8f.25.2026.09.19.07.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:38:03 -0700 (PDT)
Message-ID: <c55123de-f466-41c8-b50e-df28ecf3bc18@tuxon.dev>
Date: Sat, 19 Sep 2026 17:38:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: configs: sama5: enable current Microchip KSZ DSA
 symbols
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260814075310.11613-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260814075310.11613-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_073806_656541_A83FF20E 
X-CRM114-Status: GOOD (  17.18  )
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



On 8/14/26 10:53, Pengpeng Hou wrote:
> The Microchip KSZ DSA family now uses NET_DSA_MICROCHIP_KSZ_COMMON
> for the common provider and NET_DSA_MICROCHIP_KSZ_SPI for SPI-attached
> switches.
> 
> sama5_defconfig still enables the removed KSZ9477-specific symbols even
> though SAMA5 device trees contain KSZ SPI switch consumers. Replace the
> stale entries with the current provider symbols.
> 
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Fixes: 07bca160469b ("net: dsa: microchip: common menuconfig for ksz series switch")
Fixes: 4658f2fe8fbc ("net: dsa: microchip: common ksz_spi_probe for ksz switches")

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> Changes since v1: https://lore.kernel.org/all/20260624081216.75559-1-pengpeng@iscas.ac.cn/
> - no source-code changes
> - rebase on the current SAMA5 defconfig
> - route the revision to the AT91 SoC maintainers
> - add the coding-assistant disclosure
> 
> The Kconfig/provider mapping was reviewed statically; no SAMA5 kernel build
> was performed.
> 
>   arch/arm/configs/sama5_defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
> index bd7f0b5f7d66..46e7f554faa1 100644
> --- a/arch/arm/configs/sama5_defconfig
> +++ b/arch/arm/configs/sama5_defconfig
> @@ -70,8 +70,8 @@ CONFIG_BLK_DEV_SD=y
>   # CONFIG_BLK_DEV_BSG is not set
>   # CONFIG_SCSI_LOWLEVEL is not set
>   CONFIG_NETDEVICES=y
> -CONFIG_NET_DSA_MICROCHIP_KSZ9477=m
> -CONFIG_NET_DSA_MICROCHIP_KSZ9477_SPI=m
> +CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON=m
> +CONFIG_NET_DSA_MICROCHIP_KSZ_SPI=m
>   # CONFIG_NET_VENDOR_BROADCOM is not set
>   CONFIG_MACB=y
>   # CONFIG_NET_VENDOR_CIRRUS is not set


