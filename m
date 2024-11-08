Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F17D5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcoPj7QwH8WOviwVSnuYvUqvL2h4DfxSZ9qhESCUO10=; b=VA/Uh8QKJtRTILwMfOvVxhzyn1
	3A3T5l46Kv/5+Uq644N+9Ne0DA3Wwf1eN6q2pi6z2qvKV4gGJ+xo82JUXWjDmKLlVom6mDhY74zJz
	BzmqlbtHJhHd6XDClPXDuI/uVp4+X/kNACEhypbKSWaLczGkqMDDJcY6AALmkyu5qvmbhZiSxiZBq
	oGH+zlbsLBRIV/qLPVSe9WmqM+GDbTsdjHQWo4NP7qPLumfc/HVZBCr0K1mzxzLZzNOFF/83HT4to
	YrVseNfWYioM6Kghdnsq/1CMqyrooKZ+axtJ85oaDfyVWwoGtpaWjoHDNkKEbBw8gZd8Cq7bv+Uo1
	hQbuPHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KoY-00000009rgP-43Om;
	Fri, 08 Nov 2024 08:57:58 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kdd-00000009pXg-1Phb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731055601; x=1762591601;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9yxF5v4ewKOwB1ig1+7/AMlEc1rvebHe5gr3Q238ou0=;
  b=S7mWQSfdPz45uBjT2soqZDtt7g5lbdJgLmXPBfGsOQ77tTs5JFiz4xDQ
   TvlVg4q0fXRsuJ2v8sFoFjuJMIzamxuWWh+5LSyNoGGrio/ILSfIom2zA
   ZlHmWTiVgOx8v42gFDTM3ijoKAxBilgKQls7O3MN6FBDL4Fmd9WQywO78
   P8Dt4sokowp66uYTwW667jPKwPNN1rlIR61GwBhDJhwaygy3ttUEoCNB5
   +Hu/+R0ZoDd5Nko/h3bBshn5KPCNxGaO1UrI3L2uGORrZr1CZ/B1AVbgI
   QVFJRFlhu9vhRRFo3ikk3AXd1pBz3rAXSg4vV8tZvamIy/n80e+Ecx6cs
   w==;
X-CSE-ConnectionGUID: nyfk6DN5RGqJpz9FI/PsxA==
X-CSE-MsgGUID: ND7P7VTyQ7+JlrNxoasvBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41538917"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="41538917"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:46:41 -0800
X-CSE-ConnectionGUID: Mt7p5NSnSEO0XYpMYf0S0A==
X-CSE-MsgGUID: 9tna//0bSZChN+ImPOd9Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="84980240"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.16.81])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:46:36 -0800
Message-ID: <333a5a4c-06d2-4465-af28-3dac607190b1@intel.com>
Date: Fri, 8 Nov 2024 10:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Haibo Chen <haibo.chen@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, s32@nxp.com, linux-arm-kernel@lists.infradead.org
References: <20241104190707.275758-1-robh@kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241104190707.275758-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_004641_703709_60F855F6 
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

On 4/11/24 21:07, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

No longer applies cleanly to mmc next, and one minor comment
below otherwise:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/mxcmmc.c          | 6 +++---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
> index 1edf65291354..dcb1a7336029 100644
> --- a/drivers/mmc/host/mxcmmc.c
> +++ b/drivers/mmc/host/mxcmmc.c
> @@ -1048,9 +1048,9 @@ static int mxcmci_probe(struct platform_device *pdev)
>  
>  	if (pdata)
>  		dat3_card_detect = pdata->dat3_card_detect;
> -	else if (mmc_card_is_removable(mmc)
> -			&& !of_property_read_bool(pdev->dev.of_node, "cd-gpios"))
> -		dat3_card_detect = true;
> +	else
> +		dat3_card_detect = mmc_card_is_removable(mmc) &&
> +			!of_property_present(pdev->dev.of_node, "cd-gpios");

dat3_card_detect no longer needs to be initialized to false

>  
>  	ret = mmc_regulator_get_supply(mmc);
>  	if (ret)
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 8f0bc6dca2b0..cda1872769e0 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1629,7 +1629,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>  	 * Retrieveing and requesting the actual WP GPIO will happen
>  	 * in the call to mmc_of_parse().
>  	 */
> -	if (of_property_read_bool(np, "wp-gpios"))
> +	if (of_property_present(np, "wp-gpios"))
>  		boarddata->wp_type = ESDHC_WP_GPIO;
>  
>  	of_property_read_u32(np, "fsl,tuning-step", &boarddata->tuning_step);


