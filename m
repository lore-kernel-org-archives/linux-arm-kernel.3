Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CCBC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VH4Ljw0lA5sqSWylbksASfV+tDTzuOkHLk1j+OVHBqk=; b=gSDIXceu2B8MYnxqSxjDzz5YDl
	4WEr9yWaDNJCF5qLTELdwrtnUZ/Qmxw/HKmTBP7t8Sp5YFFty9IHKMdVbbkWJFYgL5uhs3lmaGn6C
	ol8E+L34uRTUZtzWNC1uPnJID6DAPssNCZmK8S6oJ8EmatExoDzm4v81V36KE2Pl2A+zJ9tIy7gKI
	gQyBUo8yEfzXZRqMeUxjNEZ5o4gImbcuCOeqpsKt76oHj7jORLABp7jydKS1NYCDLBkhlLiG2CJhQ
	n087cInBwDAiVWUt9Dp0l4UzS3pzZZpLFi8HlYXZBCWBr4MW6ogHbAC8U+XvQg75ByZPixoUIjPxL
	gNdb1Z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMzv-00000005mzY-24f0;
	Mon, 13 Jan 2025 16:09:03 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMVw-00000005fwR-0Glr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:38:05 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so7477349276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736782683; x=1737387483; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VH4Ljw0lA5sqSWylbksASfV+tDTzuOkHLk1j+OVHBqk=;
        b=TA5aK8k16D367HzG+zF5Uy+wBzpbxfsh3D1L/BkR6TPfbgr3CSf4l9YWccSSQLsoQF
         pTyAUWoifb0ObAqdacxaAM7SolRScsaj+XLHS0W0/pY5tNJj3l18BUSHLitupkToNcpl
         fnIMqP5UUPHd82Ynv66QUdrni85IIT1gQ2tH+eOO/JTu28gmIW7CdQKHNTD4j5YQywon
         D3RC86+Ox0Do+DUwaWVg9cxamtCHUtw9DqhU/OMJERr+s2Htx3klvW13mm33pz3zl0a+
         m0My+WruqMXe8Snpg5NVzPw4K+jeRYHTdg7L8fIFG5+0YeKlOdQg9e9oLtSMTKUxcmmd
         UvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782683; x=1737387483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VH4Ljw0lA5sqSWylbksASfV+tDTzuOkHLk1j+OVHBqk=;
        b=iLnchsGI2v4SBf6FjPwyyhKSsOtiVYLqOxWfX9cyx35ZbfGE8OkgSuIX29PTGlPre1
         1aZJ6okAhUk9qKjTH5SgXjV5ebG0U4kZD8lYDdhJVDjKkKzJBLQcgyGNG2xbGBfup9pU
         tqCnapSQ9LPJ4gr4hdYBi+bciV+UvhORRzMISqrbJHXckM2CSmSa7OrRj0s3Bu3mGVTs
         B0BrU3IDDLwVL7gkm4H5RsB0RXK4Mfuw3RqkczN25Pn9qpOYz/QgLrx+LiEHmh8HR8Yw
         w4h4NIzTJTHeK2j1WF1lBKQ6sBMg2Y/2s9koYV42WhJ7ziElBJ10Gs5Zc51Em1LnlagS
         pwVw==
X-Forwarded-Encrypted: i=1; AJvYcCXfEeR3QTJIoth9pjnUpinwdFMoTx6EAfw2G4A99sGIP5coV6PWYgBOFbLfjuhMWJ5moIoCnweOl1FYfc+XDoH3@lists.infradead.org
X-Gm-Message-State: AOJu0YwpfKsowbiEjSFiKLBDfSbW945Yj62JhUDZBQr65o7TLMVpy8Oj
	IPMf3iows5aLSIqCPKsxejRRb4q/CCfFNwpxMeACHtYTrLmK58ZWmrZ27Mw1glWmeRAWaMEsHVN
	lJLKQLGsq8s26pAwrMonABSPPqIY3mPLPZNWNFw==
X-Gm-Gg: ASbGncv7FFOWdw1WTwXNOePLNOfbNzdwaYOJzaXAsLvgpPhPR/LKHoE63ov3li49E6l
	voUk93gLlRUAX+l0To+m0GSS1Ilal2zFzh/eImrw=
X-Google-Smtp-Source: AGHT+IFAIkS2Z8ev5ESTCzuaARgkLxMkSS7mawcnRpdDng9xAPRFBPJa8hXfaPAKe2aLptbdzrTd2lhyEVWCfYs6MeQ=
X-Received: by 2002:a05:690c:968b:b0:6ea:8d6f:b1bf with SMTP id
 00721157ae682-6f530eea554mr168333797b3.0.1736782682941; Mon, 13 Jan 2025
 07:38:02 -0800 (PST)
MIME-Version: 1.0
References: <20250109155255.3438450-1-robh@kernel.org>
In-Reply-To: <20250109155255.3438450-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Jan 2025 16:37:27 +0100
X-Gm-Features: AbW1kvYfxaP_KIAtRJ8ddiypXayufpQw7AFPlstt8F8TqoOMhlOX5qWAO8Gx8_g
Message-ID: <CAPDyKFrPB-Sw2Un1tx_POXc_wRD-A9B_6Syhgu7NNeK9qEomsA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dragan Simic <dsimic@manjaro.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_073804_102126_2DF18BED 
X-CRM114-Status: GOOD (  20.42  )
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

On Thu, 9 Jan 2025 at 16:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2:
>  - Drop initialization of dat3_card_detect
>  - Rebase on next-20250109
> ---
>  drivers/mmc/host/mxcmmc.c          | 8 ++++----
>  drivers/mmc/host/sdhci-esdhc-imx.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
> index e7a286c3216f..0a9affd12532 100644
> --- a/drivers/mmc/host/mxcmmc.c
> +++ b/drivers/mmc/host/mxcmmc.c
> @@ -995,7 +995,7 @@ static int mxcmci_probe(struct platform_device *pdev)
>         struct mxcmci_host *host;
>         struct resource *res;
>         int ret = 0, irq;
> -       bool dat3_card_detect = false;
> +       bool dat3_card_detect;
>         dma_cap_mask_t mask;
>         struct imxmmc_platform_data *pdata = pdev->dev.platform_data;
>
> @@ -1048,9 +1048,9 @@ static int mxcmci_probe(struct platform_device *pdev)
>
>         if (pdata)
>                 dat3_card_detect = pdata->dat3_card_detect;
> -       else if (mmc_card_is_removable(mmc)
> -                       && !of_property_read_bool(pdev->dev.of_node, "cd-gpios"))
> -               dat3_card_detect = true;
> +       else
> +               dat3_card_detect = mmc_card_is_removable(mmc) &&
> +                                  !of_property_present(pdev->dev.of_node, "cd-gpios");
>
>         ret = mmc_regulator_get_supply(mmc);
>         if (ret)
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index e23177ea9d91..ff78a7c6a04c 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1648,7 +1648,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>          * Retrieving and requesting the actual WP GPIO will happen
>          * in the call to mmc_of_parse().
>          */
> -       if (of_property_read_bool(np, "wp-gpios"))
> +       if (of_property_present(np, "wp-gpios"))
>                 boarddata->wp_type = ESDHC_WP_GPIO;
>
>         of_property_read_u32(np, "fsl,tuning-step", &boarddata->tuning_step);
> --
> 2.45.2
>

