Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F36C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGwb2ysQ4spjThnrjYtrwlyO99o7U1vRUqimeHR94+E=; b=eCG3P1nKR1wTWPcR4sMwoxu0gQ
	ZT8zQ5ahxvUkOlmrjTUoC8HN1eAEcyIPpzWHdNnmTXW/PBANDs0T7MlCYvHes6EUFa24gOxgpKqWK
	ynVZeg+l05N0LYkV9VzdP4sn8IGpsFJYGouIGcecsS4y1yxNFuhU8Z013LNpK3QNcFn6wEI7+XJrv
	Mf2rVLtr+8LdezKwWdd7Hawkuga19ZFI2UQzR8NM1xuMAyC1BJIAr3m+2kOgNw7L2MOYNT+PtCl8l
	2oUeX/czoHdvZ4gYo42Q9IcjWKILOLDU9Q/5S/yiZVV7cQiwbBai1k3e41Ibr2dyNfcUgiarKFBy6
	ni4PNNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaVW-000000045qo-3Sh1;
	Thu, 27 Aug 2026 13:51:06 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaVT-000000045q2-2Be9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 13:51:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso1056142a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838662; x=1788443462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QGwb2ysQ4spjThnrjYtrwlyO99o7U1vRUqimeHR94+E=;
        b=R7PpI4KaJgJMaV9faAOlZQgFKqKADKf62UudRzxw8GyaQaJ98kbMkSug6qzzm5Mt2E
         rB/Kt2BUvPfWCTfYu+ctaddYKw2F4jxaKxF2Wv3VxIcB60jTBdRmmBKYs2/g4Io4bGkW
         IN16qkjE5NFlUG+rvbl28BgBJbr5iIe7YcZrmQqOIZywIBrngCd57cA1jGkMcTRXbGRm
         Gq8Lmpcl3oRi+irHHNxlvsN0NnsE9NgPuYTnp1FxJWNOoeOgp/jdEwcakXVkXA7UcyqQ
         7tH3pMy30GwHw9bppS/YzQYnfZR5euKRmXMFpUZquo5ByMW+hupzgYM4DlYCegp9k9f5
         rptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838662; x=1788443462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGwb2ysQ4spjThnrjYtrwlyO99o7U1vRUqimeHR94+E=;
        b=sBtmGV8Usb7FFOpKn1Z9SGJxH4EywD7XkAIehrgoleg/NSdcYGYqEnRPPaethuw0xQ
         VAjC4I00PZ5D4jlNK71zRl+u0KQnluygKNo/aQKVOgzQlDPXfkoWVpYbCOGy9laZ0uVc
         e28hpTiwtZjGJt9fGmJOPzByesAv/RtApRefhm3G7qZ4/7/2J4xLSF8StqFCsRDVb2s4
         WDF3OeGaLemn/ZGMwEN04AYTX1fmvW3xn6Bn2faoBYSSvXs7zUxELgkwUbtQj1r+n6Z6
         5ZJS4SXRXvCPaOJEtEYNs1n4H+fNnaFhrGXr4ZWbQe9hdJT1BbGBCcJ+5hro8l1wAbMj
         +0Aw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/CFQqS5hYJLV0bPr6CrFHM4UJgjEspLknL0wvpBGmWNyQV28GgIi77IPEFf1d9LjxfjBrZ38WAM+m9WIwO9qg@lists.infradead.org
X-Gm-Message-State: AFuF++k6KAODuIXafvxhrkyvY9yjOGDsDbPSFzYQuRwz6YeKLN6HRQA1
	z8ePUiRIgr1MM2f8zKP7Cugw9VVhOVeNiL75+AQ/Isv6pAyKzDOSMpZc
X-Gm-Gg: AR+sD111eEYgZJwBMGR4TIPNUcm3duSUyHhLj7tJH6WR21kGPGKLZA1Wz5yca9ylg1t
	KX5VBF5urbvF64+RUjftwG/Tp44vLqezsW5806yZa4f8qDIBAFwKVaqJGdO+TarBVpuLkvE3232
	XzKD6IJ6MJUkpZof7TYJx5F1AzLBlR4Wr06vkYR9AqtSGJhdNCUqJ3P64096R5L0yG6Ih/6KWHF
	P5Ck68CNCQkXm1XvSgxKvgvDnit5te3QpjrdYA0mPqSZa/k0KJBtwBZk2yRltxgSH0yx1Aas+v8
	fYACE8+QcZfTC4oVZ1s7uxkkPj6KN33oOfNP2/oYiJKiq9GEVqkyRa8yETQRZKqA4hVlyuKVvHN
	U3KsQfkKSUovk/S4C4RhKeNT68wFgBzEys9M5e4DZLcZc9vkNcM+fg78bjRkw8GPCdkVRHgifmJ
	8ppZukKTBFNRuu+i0/q3thX2xxT/MNlc3CN33SmZeC7Ki3/x03rMV6mkR17Pf4NTAwxQwIeAKAm
	w==
X-Received: by 2002:a17:90b:4d88:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-3966d36e327mr30704782a91.1.1787838662493;
        Thu, 27 Aug 2026 06:51:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea80edsm2894675a91.1.2026.08.27.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:51:01 -0700 (PDT)
Date: Thu, 27 Aug 2026 06:51:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt
 compatible data
Message-ID: <168be4ed-d670-4d61-a061-e01abb33efa4@roeck-us.net>
References: <20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org>
 <20260821-for-next-lucky7-watchdog-v4-2-d070cee5009f@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-for-next-lucky7-watchdog-v4-2-d070cee5009f@member.fsf.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_065103_565736_424CC53C 
X-CRM114-Status: GOOD (  19.34  )
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

On Fri, Aug 21, 2026 at 04:14:50PM +0100, Aiden Isik wrote:
> From: Aiden Isik <aidenisik@member.fsf.org>
> 
> Add driver data for the Exynos5515 SoC's watchdog timer.
> 
> Unlike similar SoCs such as GS101 or Exynos990, Exynos5515's PMU does
> not require explicit counter enablement for the watchdog to tick.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/watchdog/s3c2410_wdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index e31f93db0509..e61439a3f4b2 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -232,6 +232,20 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
> +/*
> + * Unlike similar SoCs like GS101, Exynos5515's PMU does not require
> + * explicit counter enablement. Hence, QUIRK_HAS_PMU_CNT_EN is not set.
> + */
> +static const struct s3c2410_wdt_variant drv_data_exynos5515 = {
> +	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 24,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
> +};
> +
>  static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>  	.disable_reg = EXYNOS5_WDT_DISABLE_REG_OFFSET,
>  	.mask_reset_reg = EXYNOS5_WDT_MASK_RESET_REG_OFFSET,
> @@ -379,6 +393,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>  	  .data = &drv_data_exynos5250 },
>  	{ .compatible = "samsung,exynos5420-wdt",
>  	  .data = &drv_data_exynos5420 },
> +	{ .compatible = "samsung,exynos5515-wdt",
> +	  .data = &drv_data_exynos5515 },
>  	{ .compatible = "samsung,exynos7-wdt",
>  	  .data = &drv_data_exynos7 },
>  	{ .compatible = "samsung,exynos850-wdt",

