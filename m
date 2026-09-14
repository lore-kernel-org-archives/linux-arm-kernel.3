Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36718C88E76
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1+UORdiqb/MeDL/SnE6evaOSdoz7eKIUxpMIhDv/Ew=; b=2L4IrIbj1jpedr560CimgeGP7X
	m1JFneoV/Xux+M0gefdMAnUAqfml8pTZMO3VoKp9rFnAxZg5tMwDl9FsCZJQqJhxCSc8kPMH37xgi
	aaX/JFrUN++YlqyPCAWLUU4+xOra+OMBHfVIkagfblRJ8/AkGBg7NirErabsoR7ZYXS5TkP4t/kSq
	PkmS1ddweG5v2bl4GWn0MUmKW/kODMZH24wDTZ5nToZQOQPC3zLtsUYamtZFcQVp8Qz4VxqKLgI3R
	QCZdlXz76gnG6iWvXaH/gxepAgFpwTsVFl41CDq8ISPKX7YMQfYt2s9fNHpHGAhr0x30/nVgJ8930
	xzELI5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671a-00000003q6M-2LeD;
	Mon, 14 Sep 2026 13:47:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671P-00000003pzZ-3yvF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789393620; x=1820929620;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AUWd5f1BsfZwB1Pj4UBNwd8TrTwhAsm3rwAnyxw+nsc=;
  b=hBQUtCyQtfrt8BM9nfq3miHjI1d96MxzwE8DX3inz/6p0HwA/SiVsHMt
   2spSvfmyxFgemT3bHbRU9bMzCTOE4yyrb/AJRiRaVYjJpm4+3GI9kkFzn
   qZ0rfY14MKymBq0o/2KOt7QXMplsrnsmfj/o9TdN/yW5Ehtjtv1ZCaELS
   nDpGHRNnbf7sJjXx99hbbnXmaFlMGdEkxGYrN6NhGWRN/MUnSXknDP4ze
   xGIMl6WHJcCeCve/m7Ej95Ia5n57xtPFAVcfajPb2aifdrwED8NUhbz7r
   NKKC5UsS6vvJdI1513QwZ3EHpZxpP6InlacUo6OSvEdBPolev/datPwgo
   g==;
X-CSE-ConnectionGUID: 1o03+rbMSC+xGV5OYnDwfA==
X-CSE-MsgGUID: NH+UKW30SL+1hGVvF2+r9w==
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="63566881"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2026 06:46:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 14 Sep 2026 06:46:57 -0700
Received: from [10.159.227.146] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 14 Sep 2026 06:46:55 -0700
Message-ID: <bfcd57f8-ffca-4a44-a84f-12c46cb9fe76@microchip.com>
Date: Mon, 14 Sep 2026 15:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mmc: sdhci-of-at91: add option to keep clocks
 enabled
To: Robert Marko <robert.marko@sartura.hr>, <ulfh@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <adrian.hunter@intel.com>, <ehristev@kernel.org>,
	<linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <luka.perkov@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-3-robert.marko@sartura.hr>
Content-Language: en-US, fr
From: Aubin Constans <aubin.constans@microchip.com>
In-Reply-To: <20260907132617.1198548-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064700_208334_A46A78B5 
X-CRM114-Status: GOOD (  21.99  )
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

Hi Robert,

On 07/09/2026 15:25, Robert Marko wrote:
> sdhci_at91_set_clks_presets() both enables the controller clocks and
> programs its capabilities and preset registers. This prevents callers from
> restoring the registers without changing the clock enable counts.
> 
> Move clock enablement to callers and add a SoC data flag for controllers
> that must keep their clocks enabled. Use it in the runtime PM paths while
> keeping register restoration separate from clock enablement.

This change has been required for the SAMA7G54 MPU already, and implemented by
two complementary commits:

https://github.com/linux4microchip/linux/commit/763a3c05c8f9d0feb279c6f308fa5d48d14e07d3
https://github.com/linux4microchip/linux/commit/b5bbc888fb39471d46fe0a4ff28f69533c265dd0

At least they have been validated by test campaigns.
If that existing work seemed OK for you and the LAN969x, then I could squash
these two commits and submit the result.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> 
>   drivers/mmc/host/sdhci-of-at91.c | 39 +++++++++++++++++++-------------
>   1 file changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
> index 7c4ac65f247d..b7e2a89da348 100644
> --- a/drivers/mmc/host/sdhci-of-at91.c
> +++ b/drivers/mmc/host/sdhci-of-at91.c
> @@ -38,6 +38,7 @@
>   struct sdhci_at91_soc_data {
>          const struct sdhci_pltfm_data *pdata;
>          bool baseclk_is_generated_internally;
> +       bool keep_clks_on;
>          unsigned int divider_for_baseclk;
>   };
> 
> @@ -164,7 +165,7 @@ static const struct of_device_id sdhci_at91_dt_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
> 
> -static int sdhci_at91_set_clks_presets(struct device *dev)
> +static void sdhci_at91_set_clks_presets(struct device *dev)
>   {
>          struct sdhci_host *host = dev_get_drvdata(dev);
>          struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -174,7 +175,6 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
>          unsigned int                    gck_rate, clk_base_rate;
>          unsigned int                    preset_div;
> 
> -       clk_prepare_enable(priv->hclock);
>          caps0 = readl(host->ioaddr + SDHCI_CAPABILITIES);
>          caps1 = readl(host->ioaddr + SDHCI_CAPABILITIES_1);
> 
> @@ -222,11 +222,6 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
>          preset_div = DIV_ROUND_UP(gck_rate, 50000000) - 1;
>          writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
>                 host->ioaddr + SDHCI_PRESET_FOR_DDR50);
> -
> -       clk_prepare_enable(priv->mainck);
> -       clk_prepare_enable(priv->gck);
> -
> -       return 0;
>   }
> 
>   static int sdhci_at91_suspend(struct device *dev)
> @@ -254,9 +249,11 @@ static int sdhci_at91_runtime_suspend(struct device *dev)
>          if (host->tuning_mode != SDHCI_TUNING_MODE_3)
>                  mmc_retune_needed(host->mmc);
> 
> -       clk_disable_unprepare(priv->gck);
> -       clk_disable_unprepare(priv->hclock);
> -       clk_disable_unprepare(priv->mainck);
> +       if (!priv->soc_data->keep_clks_on) {
> +               clk_disable_unprepare(priv->gck);
> +               clk_disable_unprepare(priv->hclock);
> +               clk_disable_unprepare(priv->mainck);
> +       }
> 
>          return 0;
>   }
> @@ -269,14 +266,23 @@ static int sdhci_at91_runtime_resume(struct device *dev)
>          int ret;
> 
>          if (priv->restore_needed) {
> -               ret = sdhci_at91_set_clks_presets(dev);
> -               if (ret)
> -                       return ret;
> +               if (!priv->soc_data->keep_clks_on)
> +                       clk_prepare_enable(priv->hclock);
> +
> +               sdhci_at91_set_clks_presets(dev);
> +
> +               if (!priv->soc_data->keep_clks_on) {
> +                       clk_prepare_enable(priv->mainck);
> +                       clk_prepare_enable(priv->gck);
> +               }
> 
>                  priv->restore_needed = false;
>                  goto out;
>          }
> 
> +       if (priv->soc_data->keep_clks_on)
> +               goto out;
> +
>          ret = clk_prepare_enable(priv->mainck);
>          if (ret) {
>                  dev_err(dev, "can't enable mainck\n");
> @@ -344,9 +350,10 @@ static int sdhci_at91_probe(struct platform_device *pdev)
>                  return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
>                                       "failed to get multclk\n");
> 
> -       ret = sdhci_at91_set_clks_presets(&pdev->dev);
> -       if (ret)
> -               return ret;
> +       clk_prepare_enable(priv->hclock);
> +       sdhci_at91_set_clks_presets(&pdev->dev);
> +       clk_prepare_enable(priv->mainck);
> +       clk_prepare_enable(priv->gck);
> 
>          priv->restore_needed = false;
> 
> --
> 2.55.0


