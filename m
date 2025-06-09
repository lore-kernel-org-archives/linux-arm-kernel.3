Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9148AC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qs9yDBCL9OQQ2dpuHj/+WEzZXErX2MF2uYZnoNM7uA4=; b=fcPGcV6gr4m1YtxCKffCuY1BR3
	BPeW4oiCVVfLEkf9N+EXDXLdywG0GdDUh+tURIzc8I56WkAcSGr+M/R/4du9LIqB/eY78dM8/+SSx
	t5WhoQQhvAkdtw2CEpJ5sAOPt1da/9KeGm9BXAUH+WNJ4jbvqacWKea8doOaxD0vfyWJjoy9gGksu
	ZLKCmJWO4K/QYm5trC6nTC0wjZoaccUK3AFJ6Nr1MbthZTOFTomPpICDGPCCIZjMZCAWkDJPy9qTb
	uHtpvT49y+/m4E5Ime+10awOGFFGm2hF9RDIODa5horu+77iFC339dQLktSbDI7arQCDYybE9WfXB
	pU4ijAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdXm-00000004ODE-0b3D;
	Mon, 09 Jun 2025 14:32:10 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdRO-00000004NVh-0gnU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:25:35 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e73e9e18556so4140029276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479133; x=1750083933; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs9yDBCL9OQQ2dpuHj/+WEzZXErX2MF2uYZnoNM7uA4=;
        b=PE01noR3F9aSVA6LedujPtA80YMwoRVgiRxMwN57ybwpPsaFvhoGp76ZmVOCJoOSGW
         RBbqLriJLB/xC1teOip8fO1lIjIp7B6GwBX2+mRRmGaigxXOTs17A/zaJoGJ9LTMe7Jk
         KhvnIPtoW2MeizegmbU3DCY4sONZN9v0ROQpo2kdHGkBJFWK80CgUoM01S8k3GjV46fV
         HCviTVbG9HniPk3Zf5ep75DRtDNycZ9t6L+/cCq5OgP3NzUcTht3JUzy3FZZKZ3yJpgP
         NIOa7ae0zDEqsOGcg2n13bS5Pm9+rFS4kKWy6VxyVGjmUKAi2HVIBXcR7lK3aQiJ6rWn
         DztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479133; x=1750083933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qs9yDBCL9OQQ2dpuHj/+WEzZXErX2MF2uYZnoNM7uA4=;
        b=PDXGsfZMVkR4U/LvzVVRDVLS+0DqBYBScGShscBOpLc/NofE40C9e5+ieit1As9PVR
         MG9FZcs5Ue7w6S6UTIwasn12jnU1GQJBjHXnMwDOVhxRKFqtfW/JN8V1VczlHkzmEp/T
         yTGhkdqUguo2yHxLAQsdMre9b/2w6CpNM1s9g6f4V40JlTA57mDJfO9vuicrYfKTR14z
         WFaQhe5C7SOeHZ7TbvRAeIERUsg/NqqfSwynQR1ysbnT9OEFa/ub0RYgfl8fSREdotuh
         Ji+MAwY2EGJvI6nXqdNvrD9SexK/X0FFXmMIw3s1qoxEwthUiGwEKMacTEdlzeeZsg/A
         Isrw==
X-Forwarded-Encrypted: i=1; AJvYcCVDvsapyB7J9TOrHID4xq1ugT7gPKmZt/mMExWDUYqGgIFW/UZdMAcHmV/9iPY7KtmAnakmPimpkiIK6yMPhlAL@lists.infradead.org
X-Gm-Message-State: AOJu0YwTIJ2rq4VC5qQyZeUG3lFgqh3xjyUFJ8YsGgoEsmrX6JjRyKFS
	W/W7r2k6gPTqMy0wp1emeaE5mgIwx+XF/tWIji3sq6UGPMKHIu/1e8mLsTdziD+DorSwdJxI1EK
	/t3vSe0cXhF+hv3UTNaSVtKfzvKy82JAbr0wtQ+qwjw==
X-Gm-Gg: ASbGncukpy6mirJOXevuPgT9O7AoRZhKWKOl7dKXinoo1GQhfK7iqS1fag2iS1QMBj+
	Kic9vPR5ayxdFxY6YIxWLDgJD10ztdYPp/oT0FGqun8F+nUP0dz6oNAxQsm5Fp7YiaeOQ/qdmIC
	4DxbyLf31bG9FG6KSMecqpSyP7kJ7RMoHtUw==
X-Google-Smtp-Source: AGHT+IG9S1xNruNzhNFugEoEcohrFQLqoxTMTaqwCUIforBGu07/WXI6ZQ6WYR+jbUueu4Zz7wktb1J3/XAbxy5DAZ0=
X-Received: by 2002:a05:6902:1005:b0:e7d:a290:9532 with SMTP id
 3f1490d57ef6-e81efde986amr99713276.6.1749479132960; Mon, 09 Jun 2025 07:25:32
 -0700 (PDT)
MIME-Version: 1.0
References: <20250521025502.112030-1-ziniu.wang_1@nxp.com> <20250521025502.112030-2-ziniu.wang_1@nxp.com>
In-Reply-To: <20250521025502.112030-2-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:24:57 +0200
X-Gm-Features: AX0GCFto9k3Gr4YCVyXjpM_DIPE3WFVihsUYF7aq38OAJZNQC3fiKNoXcigrZNg
Message-ID: <CAPDyKFoHqhgWqy4EeQ2vr0eQgCnUkSf6SLyKEVLzar30Sy7OHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: sdhci-esdhc-imx: optimize clock loopback
 selection with dummy pad support
To: ziniu.wang_1@nxp.com
Cc: haibo.chen@nxp.com, adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_072534_205339_E56AAB1F 
X-CRM114-Status: GOOD (  21.89  )
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

On Wed, 21 May 2025 at 04:53, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> For legacy platforms without dummy pad:
> When clock <= 100MHz: Set ESDHC_MIX_CTRL_FBCLK_SEL to 0 (external clock
> pad loopback) for better bus clock proximity.
> When clock > 100MHz: Set ESDHC_MIX_CTRL_FBCLK_SEL to 1 (internal clock
> loopback) to avoid signal reflection noise at high frequency.
>
> For i.MX94/95 with dummy pad support:
> Keep ESDHC_MIX_CTRL_FBCLK_SEL at 0 for all speed mode. Hardware
> automatically substitutes clock pad loopback with dummy pad loopback
> when available, eliminating signal reflections while preserving better
> bus clock proximity.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index c448a53530a5..5f1c45b2bd5d 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -212,6 +212,9 @@
>  /* The IP does not have GPIO CD wake capabilities */
>  #define ESDHC_FLAG_SKIP_CD_WAKE                BIT(18)
>
> +/* the controller has dummy pad for clock loopback */
> +#define ESDHC_FLAG_DUMMY_PAD           BIT(19)
> +
>  #define ESDHC_AUTO_TUNING_WINDOW       3
>
>  enum wp_types {
> @@ -348,6 +351,15 @@ static struct esdhc_soc_data usdhc_imx8mm_data = {
>         .quirks = SDHCI_QUIRK_NO_LED,
>  };
>
> +static struct esdhc_soc_data usdhc_imx95_data = {
> +       .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
> +                       | ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
> +                       | ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
> +                       | ESDHC_FLAG_STATE_LOST_IN_LPMODE
> +                       | ESDHC_FLAG_DUMMY_PAD,
> +       .quirks = SDHCI_QUIRK_NO_LED,
> +};
> +
>  struct pltfm_imx_data {
>         u32 scratchpad;
>         struct pinctrl *pinctrl;
> @@ -392,6 +404,8 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>         { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>         { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>         { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> +       { .compatible = "fsl,imx94-usdhc", .data = &usdhc_imx95_data, },
> +       { .compatible = "fsl,imx95-usdhc", .data = &usdhc_imx95_data, },
>         { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
>         { .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
>         { /* sentinel */ }
> @@ -1424,9 +1438,10 @@ static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
>                 break;
>         }
>
> -       if (timing == MMC_TIMING_UHS_SDR104 ||
> -           timing == MMC_TIMING_MMC_HS200 ||
> -           timing == MMC_TIMING_MMC_HS400)
> +       if (!(imx_data->socdata->flags & ESDHC_FLAG_DUMMY_PAD) &&
> +           (timing == MMC_TIMING_UHS_SDR104 ||
> +            timing == MMC_TIMING_MMC_HS200 ||
> +            timing == MMC_TIMING_MMC_HS400))
>                 m |= ESDHC_MIX_CTRL_FBCLK_SEL;
>         else
>                 m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> @@ -1678,7 +1693,9 @@ static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
>                 writel(reg, host->ioaddr + ESDHC_TUNING_CTRL);
>
>                 reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -               reg |= ESDHC_MIX_CTRL_SMPCLK_SEL | ESDHC_MIX_CTRL_FBCLK_SEL;
> +               reg |= ESDHC_MIX_CTRL_SMPCLK_SEL;
> +               if (!(imx_data->socdata->flags & ESDHC_FLAG_DUMMY_PAD))
> +                       reg |= ESDHC_MIX_CTRL_FBCLK_SEL;
>                 writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
>
>                 writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK,
> --
> 2.34.1
>

