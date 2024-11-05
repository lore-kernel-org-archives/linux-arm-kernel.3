Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBE1D1CA37
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSfZmloa5ktLj5m2satJeJFjZZCI/khmEGOs0heit4E=; b=vLKUOxfEcKoxKa6EAH+iWsTfg0
	SoV/uQfmhVP5xdpcUCS30Jkarc0FvQktBGkhpGAzr7dSV3VKqatiCcwcslFnbJjB4c4dUddHheGD5
	740D91VNrAZec1mhQW0gfutmwTnXLVzcylVpDtCBmLZBudf6vGuBswPSuLGu+/EkWbMTtEDmyPiaq
	LoUoYho8c1rB6tdHvv2Uf6KK6VRyOiFayj8AHU3Eifx8POAiRE3IMuY5IWqU/4M2ajoZSfEdX5reX
	3fhrX5vPDNpECEvM9zfW1YIu13xdEneckeB8bhRGleSJrZR8S1kRiT63KO6Lp4BYso+ncAH64Jd3L
	RQHes7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8D6L-0000000G3LJ-0Oxm;
	Tue, 05 Nov 2024 06:31:41 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8D4c-0000000G384-1HeX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 06:29:55 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730788190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RSfZmloa5ktLj5m2satJeJFjZZCI/khmEGOs0heit4E=;
	b=pxeH1pheOQFO9IM4gwFWvB08/Pm/bh3299YWAbgeriWmT03jXKkL0l6UoF4H0KJNDGqcEt
	2qFSavAgbdfOySL1PlPtKAny1u2Kx30iZpS1rM6FXytqu0r6we/O/Ncjec7nosgzTDKaqe
	lxl09XU2iE+EQES14V7CPqY+Q4mi4u5x6wlqBkxCUtK43/j9bbxE4syPt5Y33F/Z0Tz+na
	HvIG7GPMFiZ5ouSwo/Iiv5gEEFU9dPBgV1rkWi1ZC1XU8vpMYAPEHLSYUVTfDfsqYjXpgM
	6EH4BnoOSCKm1Up5urHE9/X3F2Toxe7dDsycOe5Em9y12azIm6gGuwXvRCZUsA==
Date: Tue, 05 Nov 2024 07:29:50 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Haibo Chen <haibo.chen@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, s32@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mmc: Use of_property_present() for non-boolean properties
In-Reply-To: <20241104190707.275758-1-robh@kernel.org>
References: <20241104190707.275758-1-robh@kernel.org>
Message-ID: <e737fdb7766495ec95fdf42d23c68736@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_222954_683921_3B77976A 
X-CRM114-Status: GOOD (  16.08  )
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

Hello Rob,

On 2024-11-04 20:07, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Looking good to me, thanks for the patch!  See also a small nitpick 
below.

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  drivers/mmc/host/mxcmmc.c          | 6 +++---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
> index 1edf65291354..dcb1a7336029 100644
> --- a/drivers/mmc/host/mxcmmc.c
> +++ b/drivers/mmc/host/mxcmmc.c
> @@ -1048,9 +1048,9 @@ static int mxcmci_probe(struct platform_device 
> *pdev)
> 
>  	if (pdata)
>  		dat3_card_detect = pdata->dat3_card_detect;
> -	else if (mmc_card_is_removable(mmc)
> -			&& !of_property_read_bool(pdev->dev.of_node, "cd-gpios"))
> -		dat3_card_detect = true;
> +	else
> +		dat3_card_detect = mmc_card_is_removable(mmc) &&
> +			!of_property_present(pdev->dev.of_node, "cd-gpios");

There's enough space in the allowed 100 columns to align "mmc_card_..."
and "!of_property_..." by indenting the latter further a bit.

> 
>  	ret = mmc_regulator_get_supply(mmc);
>  	if (ret)
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c
> b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 8f0bc6dca2b0..cda1872769e0 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1629,7 +1629,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device 
> *pdev,
>  	 * Retrieveing and requesting the actual WP GPIO will happen
>  	 * in the call to mmc_of_parse().
>  	 */
> -	if (of_property_read_bool(np, "wp-gpios"))
> +	if (of_property_present(np, "wp-gpios"))
>  		boarddata->wp_type = ESDHC_WP_GPIO;
> 
>  	of_property_read_u32(np, "fsl,tuning-step", &boarddata->tuning_step);

