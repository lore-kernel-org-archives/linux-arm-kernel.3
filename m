Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF18FC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZykcNbDimAS4m5zQC6qPpRpEexn6V57y3u83AlFoEMA=; b=xXmv87J+TkUkXDfsZz0vxB510T
	szx9g/lzjIYUuAzlONp9NN9bWok9YjG9MpkA6iN94+sQ7jKUijLBdg7JFsnb71k08/pAjVPeoa9so
	tp2Q0jLfw0TLiE9oekCi5s0Is1CCii8Tqt3uA7AxDiVpmH6gktUX08EWTNGHfM/NLrgfH9XZkHue1
	zyY6LPH2OL+vwVt1NL6Qjb/o7nbp88alhHsJbo7XWNLNwHElr1eqhWDy0CeWXGUIEvpgm7u+I630e
	Kd7a40/alm++E3IgFQ2ULYo5Ty/frP1VEvNa9JsM3x6S60n9C8aXPIy/KWcgoMznJpEvmVG5TXfzg
	I+laOwKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdVb-00000004O2z-1fhg;
	Mon, 09 Jun 2025 14:29:55 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdRJ-00000004NUu-3Six
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:25:30 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e81ec95d944so273646276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479129; x=1750083929; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZykcNbDimAS4m5zQC6qPpRpEexn6V57y3u83AlFoEMA=;
        b=f+V2Ar+M120rtlsi98zn0dfCcROZNT00J7cvL2+XdrhUjYpxX/M7mgqm/YmBdSFlc9
         3Y8bjJvC2XAWYCwsmVYDg78eWtmLVOG+4xdraBy2pG40ROGkCDu9/NfzO/0HgZF82H59
         7/QxStvsJoBD+pFuimcUhwOuQkZhZlmptv4S4EcW63JvXzWC2oWF6b0BgQ4hkgnIDKL6
         hA47c2X6ko5cixuWPWhCgR56uXf68aI5BA2sZwfpNJsVOx23UB6qLyAAsTRC+93szn8t
         Sj7zLRu8NPXPZt/BK+aT7QZjBkEBmA2OE7VAiMmjekt2aRZK6CbHZdIErNlFO2bT0Axt
         QEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479129; x=1750083929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZykcNbDimAS4m5zQC6qPpRpEexn6V57y3u83AlFoEMA=;
        b=mGl8ok42d780gyy7vhlPagtHagtJyHvc5qvng5qtjbAhca3PR27YfT4FmuLtGnDFEx
         YusOaR+c5CZT0woTzuGNIEoQJDzXt1x4mmkpDaqBdIAj1WbSjZH77b+zH/l/55emOLZ5
         TIlNdXjl68zNYS8+lv0BIvrnf6IsEtRouLHTwdj3/hyJAYTtesgrvakJKsBSaH3O76VN
         G+Z/aWfJqPV9BTmtLoTGK3LgnbL7F8BbJuizmHaKci14EUqgnyLGHohKu21dMFZdYIlr
         5rNnYkvHTxMdpXp4P/5y3AN5r3sNQp/5PNU8eEdBV+jP+UWbDGE9i+3NTK89frsuuvae
         beVw==
X-Forwarded-Encrypted: i=1; AJvYcCXlLBvbtwthQdNSV07MfJY8y7GH+K82YZPAVY4/csEaj2we+ED9K11YEknw9IA+FB+cC/M8sAsQFO8R6u74tPpp@lists.infradead.org
X-Gm-Message-State: AOJu0YxZCipqOXrGm3nfzvo1gzlIZFkJmb5IfGFEGfEiKyIV6mdsI8bX
	iDXrTXRWt3cPvmflrRrul0ZGWlN+xRhagxkwQtCgCVH5xOZ5MT7eNRUy+BfUAU1/Dqn/tuY9lkj
	t2zmYudWtgC0aXgL2jhGxmHU0nM3Sv5zJY7UqYVk1zA==
X-Gm-Gg: ASbGncuzOuN5ttZdx/Dd+Wq1FcjcdChTqGXX6AHSRlFalGMQjGvdUO7IP6YcUZNPKQs
	nCyf5ZhJzwCgqomNLDMD8EklA1rFPHCkZ0juXq0HgUtx1rSgllTTQUOJsRT6OO9VKiKDALz7VuF
	MckdwNfegpue8lC4QxnSmQc0jrStYNvX32VlPuE7YPvAXa
X-Google-Smtp-Source: AGHT+IFWaAnhSSW8nsxLfCEosbsRw/tkQutL1OqIK5lEepaSoyu2whvGXaIfcmmuI2AXH/opMexpg40eXSqxjteyUS4=
X-Received: by 2002:a05:6902:a86:b0:e81:8305:b8d9 with SMTP id
 3f1490d57ef6-e81efdccd06mr92199276.1.1749479128789; Mon, 09 Jun 2025 07:25:28
 -0700 (PDT)
MIME-Version: 1.0
References: <20250521025502.112030-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250521025502.112030-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:24:52 +0200
X-Gm-Features: AX0GCFstYtrysknkf_NKK6FH3sANBz-IA2dFPtq7J8l2XlDrZ3cHyVOBugoqvZI
Message-ID: <CAPDyKFrk3B-ZSTgEGqtfuTNa8yqcq55ueUGfoGdTLk6139Rrgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: sdhci-esdhc-imx: refactor clock loopback
 selection logic
To: ziniu.wang_1@nxp.com
Cc: haibo.chen@nxp.com, adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_072529_866196_A20C3A50 
X-CRM114-Status: GOOD (  19.17  )
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
> i.MX reference manual specifies that internal clock loopback should be
> used for SDR104/HS200/HS400 modes. Move ESDHC_MIX_CTRL_FBCLK_SEL
> configuration into the timing selection function to:
>
> 1. Explicitly set internal loopback path for SDR104/HS200/HS400 modes
> 2. Avoid redundant bit manipulation across multiple functions
>
> Preserve ESDHC_MIX_CTRL_FBCLK_SEL during system resume for SDIO devices
> with MMC_PM_KEEP_POWER and MMC_PM_WAKE_SDIO_IRQ flag, as the controller
> might lose register state during suspend while skipping card
> re-initialization.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 7611682f10c3..c448a53530a5 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -728,23 +728,17 @@ static void esdhc_writew_le(struct sdhci_host *host, u16 val, int reg)
>                 writel(new_val, host->ioaddr + ESDHC_VENDOR_SPEC);
>                 if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
>                         u32 v = readl(host->ioaddr + SDHCI_AUTO_CMD_STATUS);
> -                       u32 m = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -                       if (val & SDHCI_CTRL_TUNED_CLK) {
> +                       if (val & SDHCI_CTRL_TUNED_CLK)
>                                 v |= ESDHC_MIX_CTRL_SMPCLK_SEL;
> -                       } else {
> +                       else
>                                 v &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
> -                               m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> -                       }
>
> -                       if (val & SDHCI_CTRL_EXEC_TUNING) {
> +                       if (val & SDHCI_CTRL_EXEC_TUNING)
>                                 v |= ESDHC_MIX_CTRL_EXE_TUNE;
> -                               m |= ESDHC_MIX_CTRL_FBCLK_SEL;
> -                       } else {
> +                       else
>                                 v &= ~ESDHC_MIX_CTRL_EXE_TUNE;
> -                       }
>
>                         writel(v, host->ioaddr + SDHCI_AUTO_CMD_STATUS);
> -                       writel(m, host->ioaddr + ESDHC_MIX_CTRL);
>                 }
>                 return;
>         case SDHCI_TRANSFER_MODE:
> @@ -1082,7 +1076,6 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
>                 ctrl &= ~ESDHC_MIX_CTRL_AUTO_TUNE_EN;
>                 if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING) {
>                         ctrl &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
> -                       ctrl &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
>                         writel(ctrl, host->ioaddr + ESDHC_MIX_CTRL);
>                         writel(0, host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
>                 } else if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
> @@ -1177,8 +1170,7 @@ static void esdhc_prepare_tuning(struct sdhci_host *host, u32 val)
>                 "warning! RESET_ALL never complete before sending tuning command\n");
>
>         reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -       reg |= ESDHC_MIX_CTRL_EXE_TUNE | ESDHC_MIX_CTRL_SMPCLK_SEL |
> -                       ESDHC_MIX_CTRL_FBCLK_SEL;
> +       reg |= ESDHC_MIX_CTRL_EXE_TUNE | ESDHC_MIX_CTRL_SMPCLK_SEL;
>         writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
>         writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK, val),
>                host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
> @@ -1432,6 +1424,15 @@ static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
>                 break;
>         }
>
> +       if (timing == MMC_TIMING_UHS_SDR104 ||
> +           timing == MMC_TIMING_MMC_HS200 ||
> +           timing == MMC_TIMING_MMC_HS400)
> +               m |= ESDHC_MIX_CTRL_FBCLK_SEL;
> +       else
> +               m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> +
> +       writel(m, host->ioaddr + ESDHC_MIX_CTRL);
> +
>         esdhc_change_pinstate(host, timing);
>  }
>
> --
> 2.34.1
>

