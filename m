Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CEFC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYEgE/PiBg1IztnrbcbhevaMH2S4img3gfL0GJEJgjs=; b=emZMO4WWuDJhswxBAcZRY0y2Eh
	a0Q3Gicj+Uz9tFzsGznT586uYjjOvjxW7j/LgBoGg/5eYr+1OvGs+sgmjzVNR8xCd281ZNG9oNudL
	C2by2Z19wMaJ1Wet0JEPMcCsz2Fk7MHQSAAkzWOZZqmD1rGj2x1Bq6AsvXvPfEts5yXAh8YyNCM/f
	aLWLTR5cVyfeq/nl57A2gAfyaHx3IV+rDqMJBtOVXUQS9jUbnqSjPs+K4MbrODg4rBhuWj0dwToUl
	ZYPu5ADHyhN6ukdynGjHWVothvkFq8Hqy7WzMe9R3tDh7arpo3YGTIPUdiqpzKB0xTYTxeCYn+Wfb
	R68YXGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W5h-00000007OWG-44ux;
	Wed, 09 Apr 2025 14:07:45 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VFq-00000007Fcm-0N9p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 13:14:11 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6f47ed1f40dso51929527b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744204449; x=1744809249; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UYEgE/PiBg1IztnrbcbhevaMH2S4img3gfL0GJEJgjs=;
        b=cTZeSCvqQp5PSV0ozZMO+rwdNLll2cn1bVX6oA1e+lTBNniCY3uiF8R64zl4SKsl9c
         LoY5SUQpr5mb6vg2vL2H1NnIKbKG5pg6WSFndAwyTXs3iGBpSDoRIkIdkM4TeMD0CbQn
         EuixBtsj6fNcc36bfnRgnEThSiww5e7v84nr9eNVfjVJ/7AmtG4XzXmyU+fV28OTBgkx
         B61Z3ABzRtCBEjwzkif5aaz5mFKOkQy+L7OARpywXTq/0P54yutbpgrGlbnwghrgFLcA
         Nu6fpmA85z6ED8n21HBdCiok4HV+2hN6RZUTRWWuedJ/wLh1XAbJlbBka+U0bsQnHimL
         Ziag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204449; x=1744809249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYEgE/PiBg1IztnrbcbhevaMH2S4img3gfL0GJEJgjs=;
        b=M05nQjAgso92VNlkWygrvnr5E5bab0l+5OQj1SnHaN3X4yIEbRAjpoAh6kcdYvak7L
         QYKZfsBE8eIOB+lrRW6jvOL/btGkwkgq5u5Eay5Jb9wpgSsxQ+DliW+o8abb09mO+QY0
         tS9a9/g/z0oq2Yzqfy7QIpGkTNpNF4HB9tcoDGMJC3QwCfsUKvNNt3E9zhYNKHGaQOwh
         MZL6D8gqTjZs012zrmo8zlKlKuMq+oNqmO4eYAVwPfjZPXAbQNkQv6bneUdcsNs7CVOO
         906b2H/m0nusB8jkJKdxNycz3/Yw01QH51puDeOXOxdUBwDSAM18k5kcR63rso8OrqI3
         szNg==
X-Forwarded-Encrypted: i=1; AJvYcCWndKenK0K5J0uhf2wn97M8xmWiNWwAo9XjNlPzl4isn3ABkvle/rkU29JJ0w2MY0WbZrDalnEQTdfGLIsD0w9Z@lists.infradead.org
X-Gm-Message-State: AOJu0YymPFq/iSizLYl31BLkfd40YlYCPgQJIPq9WRdXfrcLoHyZ46X1
	LAF97bmLsvYSAtRVUzBV0WYszhcdHBzyn0dZMPuZwCZPTtZFTDcVR1DzRfwV0mvio0wblwz3wy4
	ssF8Z2nvAeDb5Vj0+eGxjW6B3uOMVTNNa16KoSQ==
X-Gm-Gg: ASbGncvaM4NbyhH33EkJEm9xwZUGnHTl21HfZXdq6AJd5FQxVgyhfSLanIPNBv2W5Rm
	cYZ1FgTNGTkJ0HKxzQP612Wuf2CVUR28mbYpg+sCCkpt9u8X/iF1Ta9RXhAXXafZ8u/0+Ixp5qe
	ULT5+jsJtZFO2cxMnauxguguM=
X-Google-Smtp-Source: AGHT+IG+yxIWgvhdp2EZ4of8o0ckVd4NcI4xx0S8pWnptpGAGLHxl9dkGzz2FLcsdd7dMhxlckIuQgH8oFvPnX7b+mk=
X-Received: by 2002:a05:690c:7304:b0:6f9:48c6:6a17 with SMTP id
 00721157ae682-705388b7404mr56470887b3.26.1744204448801; Wed, 09 Apr 2025
 06:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250328112517.2624806-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250328112517.2624806-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 15:13:32 +0200
X-Gm-Features: ATxdqUHDkokNL-noNnSwaaVtmNmb_z1erIlahIdi7LNFHp8TEBsFeL9co4HUot8
Message-ID: <CAPDyKFqBVwdK8O8jkZ6JKvk4zKoCb7vsUQnRVjkBG7WShhchLQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: host: sdhci-esdhc-imx: save tuning value for the
 card which keep power in suspend
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, frank.li@nxp.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org, 
	s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061410_136470_EB5D1E27 
X-CRM114-Status: GOOD (  34.17  )
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

On Fri, 28 Mar 2025 at 12:24, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> For SoCs like i.MX6UL(L/Z) and i.MX7D, USDHC powers off completely during
> system power management (PM), causing the internal tuning status to be
> lost. To address this, save the tuning value when system suspend and
> restore it for any command issued after system resume when re-tuning is
> held.
>
> A typical case involves SDIO WiFi devices with the MMC_PM_KEEP_POWER and
> MMC_PM_WAKE_SDIO_IRQ flag, which retain power during system PM. To
> conserve power, WiFi switches to 1-bit mode and restores 4-bit mode upon
> resume. As per the specification, tuning commands are not supported in
> 1-bit mode. When sending CMD52 to restore 4-bit mode, re-tuning must be
> held. However, CMD52 still requires a correct sample point to avoid CRC
> errors, necessitating preservation of the previous tuning value.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v1->v2:
>  * Used GENMASK/FIELD_GET/FIELD_PREP macro
>  * Added check MMC_PM_WAKE_SDIO_IRQ for save/restore tuning value
>  * Fixed typo and tune commit message
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 88 +++++++++++++++++++++++++++++-
>  1 file changed, 86 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index ff78a7c6a04c..7e8addaed697 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -81,6 +81,8 @@
>  #define  ESDHC_TUNE_CTRL_STEP          1
>  #define  ESDHC_TUNE_CTRL_MIN           0
>  #define  ESDHC_TUNE_CTRL_MAX           ((1 << 7) - 1)
> +#define  ESDHC_TUNE_CTRL_STATUS_TAP_SEL_PRE_MASK       GENMASK(30, 24)
> +#define  ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK  GENMASK(14, 8)
>
>  /* strobe dll register */
>  #define ESDHC_STROBE_DLL_CTRL          0x70
> @@ -235,6 +237,7 @@ struct esdhc_platform_data {
>         unsigned int tuning_step;       /* The delay cell steps in tuning procedure */
>         unsigned int tuning_start_tap;  /* The start delay cell point in tuning procedure */
>         unsigned int strobe_dll_delay_target;   /* The delay cell for strobe pad (read clock) */
> +       unsigned int saved_tuning_delay_cell;   /* save the value of tuning delay cell */
>  };
>
>  struct esdhc_soc_data {
> @@ -1057,7 +1060,7 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
>  {
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> -       u32 ctrl;
> +       u32 ctrl, tuning_ctrl;
>         int ret;
>
>         /* Reset the tuning circuit */
> @@ -1071,6 +1074,16 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
>                         writel(0, host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
>                 } else if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
>                         writel(ctrl, host->ioaddr + ESDHC_MIX_CTRL);
> +                       /*
> +                        * enable the std tuning just in case it cleared in
> +                        * sdhc_esdhc_tuning_restore.
> +                        */
> +                       tuning_ctrl = readl(host->ioaddr + ESDHC_TUNING_CTRL);
> +                       if (!(tuning_ctrl & ESDHC_STD_TUNING_EN)) {
> +                               tuning_ctrl |= ESDHC_STD_TUNING_EN;
> +                               writel(tuning_ctrl, host->ioaddr + ESDHC_TUNING_CTRL);
> +                       }
> +
>                         ctrl = readl(host->ioaddr + SDHCI_AUTO_CMD_STATUS);
>                         ctrl &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
>                         ctrl &= ~ESDHC_MIX_CTRL_EXE_TUNE;
> @@ -1149,7 +1162,8 @@ static void esdhc_prepare_tuning(struct sdhci_host *host, u32 val)
>         reg |= ESDHC_MIX_CTRL_EXE_TUNE | ESDHC_MIX_CTRL_SMPCLK_SEL |
>                         ESDHC_MIX_CTRL_FBCLK_SEL;
>         writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
> -       writel(val << 8, host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
> +       writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK, val),
> +              host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
>         dev_dbg(mmc_dev(host->mmc),
>                 "tuning with delay 0x%x ESDHC_TUNE_CTRL_STATUS 0x%x\n",
>                         val, readl(host->ioaddr + ESDHC_TUNE_CTRL_STATUS));
> @@ -1569,6 +1583,57 @@ static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
>         }
>  }
>
> +static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> +       u32 reg;
> +
> +       /*
> +        * SD/eMMC do not need this tuning save because it will re-init
> +        * after system resume back.
> +        * Here save the tuning delay value for SDIO device since it may
> +        * keep power during system PM. And for usdhc, only SDR50 and
> +        * SDR104 mode for SDIO device need to do tuning, and need to
> +        * save/restore.
> +        */
> +       if (host->timing == MMC_TIMING_UHS_SDR50 ||
> +           host->timing == MMC_TIMING_UHS_SDR104) {
> +               reg = readl(host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
> +               reg = FIELD_GET(ESDHC_TUNE_CTRL_STATUS_TAP_SEL_PRE_MASK, reg);
> +               imx_data->boarddata.saved_tuning_delay_cell = reg;
> +       }
> +}
> +
> +static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> +       u32 reg;
> +
> +       if (host->timing == MMC_TIMING_UHS_SDR50 ||
> +           host->timing == MMC_TIMING_UHS_SDR104) {
> +               /*
> +                * restore the tuning delay value actually is a
> +                * manual tuning method, so clear the standard
> +                * tuning enable bit here. Will set back this
> +                * ESDHC_STD_TUNING_EN in esdhc_reset_tuning()
> +                * when trigger re-tuning.
> +                */
> +               reg = readl(host->ioaddr + ESDHC_TUNING_CTRL);
> +               reg &= ~ESDHC_STD_TUNING_EN;
> +               writel(reg, host->ioaddr + ESDHC_TUNING_CTRL);
> +
> +               reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
> +               reg |= ESDHC_MIX_CTRL_SMPCLK_SEL | ESDHC_MIX_CTRL_FBCLK_SEL;
> +               writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
> +
> +               writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK,
> +                                 imx_data->boarddata.saved_tuning_delay_cell),
> +                      host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
> +       }
> +}
> +
>  static void esdhc_cqe_enable(struct mmc_host *mmc)
>  {
>         struct sdhci_host *host = mmc_priv(mmc);
> @@ -1900,6 +1965,15 @@ static int sdhci_esdhc_suspend(struct device *dev)
>         if (host->tuning_mode != SDHCI_TUNING_MODE_3)
>                 mmc_retune_needed(host->mmc);
>
> +       /*
> +        * For the device need to keep power during system PM, need
> +        * to save the tuning delay value just in case the usdhc
> +        * lost power during system PM.
> +        */
> +       if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
> +           esdhc_is_usdhc(imx_data))
> +               sdhc_esdhc_tuning_save(host);
> +
>         ret = sdhci_suspend_host(host);
>         if (ret)
>                 return ret;
> @@ -1916,6 +1990,8 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  static int sdhci_esdhc_resume(struct device *dev)
>  {
>         struct sdhci_host *host = dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
>         int ret;
>
>         ret = pinctrl_pm_select_default_state(dev);
> @@ -1929,6 +2005,14 @@ static int sdhci_esdhc_resume(struct device *dev)
>         if (ret)
>                 return ret;
>
> +       /*
> +        * restore the saved tuning delay value for the device which keep
> +        * power during system PM.
> +        */
> +       if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
> +           esdhc_is_usdhc(imx_data))
> +               sdhc_esdhc_tuning_restore(host);
> +
>         if (host->mmc->caps2 & MMC_CAP2_CQE)
>                 ret = cqhci_resume(host->mmc);
>
> --
> 2.34.1
>

