Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3043FD3A667
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfSruwmm+EhXu2+6CoTrjQzFc7XhuI6YW/TgDUPgZq0=; b=xJGy2kIZzVR0p7qpp9G59XP9TF
	mCWin+IJp3Lw7WbwokTG2Y/De1LR1LRQrBJ7qP1xKzY741PXJFxgJQ3aiwaWr9pMZPYVc5Y6phABM
	sh+tjqTDQ9YjF/IX5R3NixgojIICrCaDYKhauQTqJf1ia6ro+Jkbcq2atC9vh11jjR5pt8hZuKCnZ
	fZHNGfPef5eqkJRkxMWLEkuf91XLcMJpJnnOGlN2hV+3iWyW2M+C++EUS/Kj6fKdbUs1xJI6khwD6
	MwnURrf0CEKIFYFQZ9+xyLKkaDbVsrJQ9AZi5c+j9MlfbzLuHQSQ+ko1V6eyaYHCLyZWxZEPIB8is
	oJW82bWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t64iY-0000000HMWV-38Cj;
	Wed, 30 Oct 2024 09:10:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t64gv-0000000HMMD-0Uoi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:08:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so62101395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 02:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730279315; x=1730884115; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfSruwmm+EhXu2+6CoTrjQzFc7XhuI6YW/TgDUPgZq0=;
        b=W8C8/JbepanNyqaQSkwL/+NxpjqK0CGN4TLHk/P/jxp79wJiks5AixKS2UxGu6Zl36
         G8DGKAv4VKV2lJcK9Xc7zrBZWXFVlAF7TMYw6tJJdB29b1tKobwXQOWdmA1nAggRzSBn
         5v9n5/AD6uDofFMnUK2/RZZ3Jcd5Vc6E4SaJ5nZ9Fy0+n/LQtMZJi/3776ByvaM5wwpJ
         MbcPRn88OsKZEatbLlOofiWu/kYmL7AcVP43MMuT7RrYbFz97SMwQCpHS9Ao4Fsm13eF
         00oSJTCw9EyB1XdMdfT4LZXJT7KdhJqlSw5+Q8Vn+IncKNG9dVLBrrW+dVKLQ2m5P8kp
         9TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730279315; x=1730884115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfSruwmm+EhXu2+6CoTrjQzFc7XhuI6YW/TgDUPgZq0=;
        b=QKMLlkgnjI7T+pr/OIYN7nMwi3Yqlr5yaTJxXWqg2J4DqOCfFMxEdpZ9jr/GtdjoQa
         j28AKEs6LiWGFasj6nLw4n8SQTR4RBgAlXAtUOic3Lz0Yb/kyD8zYTqLqZ8MzutQf58A
         WigIWpqIsQQI0HQu2gcVYTTxZB/xUbLRfWR1CZnwI5DODA2KQH/vir12D0BOJkIKKEDx
         eZrfvrbd9FtvVBa234PB03tsZi7YRPs/1yYRBTzwo4o9mJKxFEc9O/0RReBet1e+fqJa
         Se4hVS71ZXtlk7x16u4KMPumUMs0NEstT/Bo+MB3hmKpjl/YwOBZEJSarOexcsbyIPyu
         qHvg==
X-Forwarded-Encrypted: i=1; AJvYcCXMxoRng4Chi99JTI2lani0PnVk9H3p1FSckCeoxE40AiKg9irG0Exwo4gs2azqmaYwZNfUtMMpgQE73DFd8mre@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2X7egvtzSjsoAziXL1EhrnCJHm4nIXsdd1cC4j5uG12N2MZ4O
	j/0OLplBwqNYc4iug28m14XwbAPZqxy0lWwKv96a1Ud4eSQjSA5XaHrXZlye/Gs=
X-Google-Smtp-Source: AGHT+IGD4iPjU+Pkh0lZx916PTWhGIipRT1xfez/Mrkm0VvypRRrWcsZWadAIqR4bRvqK/U4Zm60wA==
X-Received: by 2002:a05:600c:458f:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-4319ad02659mr126496625e9.25.1730279315276;
        Wed, 30 Oct 2024 02:08:35 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3b956sm14734821f8f.36.2024.10.30.02.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 02:08:34 -0700 (PDT)
Message-ID: <3f758642-b319-4c00-bde2-2ac62936cf8f@linaro.org>
Date: Wed, 30 Oct 2024 09:08:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] scsi: ufs: exynos: gs101: remove unused phy
 attribute fields
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-6-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-6-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_020837_198076_9FD5B7A6 
X-CRM114-Status: GOOD (  15.12  )
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



On 10/25/24 2:14 PM, Peter Griffin wrote:
> Now that exynos_ufs_specify_phy_time_attr() checks the appropriate
> EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag. Remove the unused fields
> in gs101_uic_attr.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/ufs/host/ufs-exynos.c | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index a1a2fdcb8a40..9d668d13fe94 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -2068,26 +2068,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
>  
>  static struct exynos_ufs_uic_attr gs101_uic_attr = {
>  	.tx_trailingclks		= 0xff,
> -	.tx_dif_p_nsec			= 3000000,	/* unit: ns */
> -	.tx_dif_n_nsec			= 1000000,	/* unit: ns */
> -	.tx_high_z_cnt_nsec		= 20000,	/* unit: ns */
> -	.tx_base_unit_nsec		= 100000,	/* unit: ns */
> -	.tx_gran_unit_nsec		= 4000,		/* unit: ns */
> -	.tx_sleep_cnt			= 1000,		/* unit: ns */

Okay with the removal of the above. All are set in
exynos_ufs_specify_phy_time_attr(), which returns early if
EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR is set.

> -	.tx_min_activatetime		= 0xa,
> -	.rx_filler_enable		= 0x2,

Okay with these. They are used just in exynos_ufs_config_phy_time_attr
which is guarded by EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR.

> -	.rx_dif_p_nsec			= 1000000,	/* unit: ns */
> -	.rx_hibern8_wait_nsec		= 4000000,	/* unit: ns */
> -	.rx_base_unit_nsec		= 100000,	/* unit: ns */
> -	.rx_gran_unit_nsec		= 4000,		/* unit: ns */
> -	.rx_sleep_cnt			= 1280,		/* unit: ns */
> -	.rx_stall_cnt			= 320,		/* unit: ns */

Okay with the removal of the above. All are set in
exynos_ufs_specify_phy_time_attr(), which returns early if
EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR is set.

> -	.rx_hs_g1_sync_len_cap		= SYNC_LEN_COARSE(0xf),
> -	.rx_hs_g2_sync_len_cap		= SYNC_LEN_COARSE(0xf),
> -	.rx_hs_g3_sync_len_cap		= SYNC_LEN_COARSE(0xf),
> -	.rx_hs_g1_prep_sync_len_cap	= PREP_LEN(0xf),
> -	.rx_hs_g2_prep_sync_len_cap	= PREP_LEN(0xf),
> -	.rx_hs_g3_prep_sync_len_cap	= PREP_LEN(0xf),

Okay for these as well, all are set in exynos_ufs_config_phy_cap_attr()
which is guarded by EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR.


>  	.pa_dbg_opt_suite1_val		= 0x90913C1C,
>  	.pa_dbg_opt_suite1_off		= PA_GS101_DBG_OPTION_SUITE1,
>  	.pa_dbg_opt_suite2_val		= 0xE01C115F,

