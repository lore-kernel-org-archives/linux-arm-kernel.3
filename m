Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0D3C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUpeNq3+QaUFHKyKU5yfrM/FkR0pBOt5e12bFHIM/Rs=; b=QDr06m/CsnlX+pxFdLB31FrBX1
	sMpEND11vV0qrDlGd+3JypadxL0xM3RnZPGPD6jYkxs7ThiOaGxqlGtR8W9QVMZECcYjPH3vF0Pgh
	ItzY09HlCecAOjJ3U1DZL0O4VQ82moi6dIGmv2KBMz9KZW8VZKc251rm356A3IwUZkY0pQJ56LpV9
	lqidNMCx3TjgfZ6ZIBcnq2QDL9d54JpOjbr8Ul2DQfIiPoP1r2vpwQg+/F1YG5RPY/BiB0d9LqUgQ
	bEmbjDkvamkmB2VlXwsZzxy89psoRiTuglXxXPgFC/Ofhjqu/vSBdd5VpsDIL7VrZPzE7S3hVzUB2
	J6CeXsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zEb-00000005GLz-0v0O;
	Tue, 22 Sep 2026 12:04:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zEa-00000005GLp-1lHw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 12:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CUpeNq3+QaUFHKyKU5yfrM/FkR0pBOt5e12bFHIM/Rs=; b=euIV8HY/nB/e7JSdLhQLT3Hy1+
	ZwWu5eF1YQy/58DpashdDKoBCz49r+mFtWKC/ruZ08mGdP/KO1kI1oVLtMDxPQZlDWS6eeCQm+Oka
	nsG47R8+fZrw8OYjpFWHHxTxd/W7Ye2QMfyRV/uJYMeBDh98TH6mjGUqhVmNHqhVRSjHrnQMOHTzr
	Q1GPSXTEz3XJ9tfYpoCTkmOJkAw2OcIAv/lMEo7h8LKh7HCG0dj8IURh47ae1WM2ksP5oa64h8WgF
	ZvVaHxImzwA0RziTZqJQ1uh0xOaUDj5Png96lACfEHYVmSuUIId+wLVmoBq9jsq1jKv0yKS39uWl8
	Gnkz3yjw==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8zEX-0000000DWXR-0fsN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:04:27 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso744437b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790078662; cv=none;
        d=google.com; s=arc-20260327;
        b=MuUuC5xcoGv7joF1CwxKrbpSkwRiCiNHXCYsLAXoZrvMI2en1Yb0wJrbZFAh+JXKYz
         TkpazSgsOMnijPRZbDs4ryWxcM4cNRK4LGoReaua1PVIaur1bz2xPFEUa1snu1pJ5g1P
         +gRwxI1HHBGYOVhyknIdNHOvXlz0s5cQh+VJvvufnOXT9ax9uf5E8FookiYrh0m6Nhsr
         h72CIym/yijk91U1XGbwV+txJTkAVpyCZ2ahecMAIr5SAg/ktpIPJtbFT0bOa3SMA1xC
         f6ojrK1PHov6Ti4uk87FfMdAgMqO7Vkn82UEK/DOB4SK9MpF+3BiMYyGxhswPFrIQNE7
         I1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUpeNq3+QaUFHKyKU5yfrM/FkR0pBOt5e12bFHIM/Rs=;
        fh=FHQYdEjqo1F975w0mepHy+bJe5WyRLtCTtoWlULNlM0=;
        b=Mcgn0/EWRMuVcqiht93dkFLk1rvXbb0gc54QTLadLBT7D6DJHz2NyY7ddBfUKFZW8L
         Ek1KMsx5eobgSkJVHWlbany7xWZiZBQ9vDPC5gDjjqdM/WgziCvoMYM736LlcNzJw76X
         zuj0Oke2dLmJ62PMNOUVbfA2eeWQfQjzMC7KWMou46BdqDvu+i5RSkxhxNf+WjCuAUg4
         tR52DHdvbKSoVJplpvkFc8SpHJ4NHsJfZgF59yvu8exCH7d85HP85OTHQWq6JVDR82Xw
         a4Uti2LKJn/6NpZgJrKbBpQmcfC2+/U1xvF0ekPN1VlMTLcDoB+O9eFDADdDuJdRjj29
         S7Sg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790078662; x=1790683462; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUpeNq3+QaUFHKyKU5yfrM/FkR0pBOt5e12bFHIM/Rs=;
        b=hR3kin8JP1GWa5ACDLVJkGvTp/Lwx2JIavydMXcQ1azOd/tEd/wG/S+fP4zwJ2nA0l
         JD5Q/uCBuE87eWdBw1lpUS7RXiQOPtmBjukt5pi+KagLnL3/Rq/L9jqs/XKtzJn5NkqN
         upqoHEVmurMQbc2nfcATcZ/KFgeYCr4zqZNarPvB6B+FBqPmRt890lxndbKHGl7Z/3BI
         lXJZ8TmDa6xtf2DZeLdzG1Lh+FiEA5eB+TxKA6QIHPPC1DUDkvx4dywIF7TC7P66Fn/Y
         rx/63zLldk+Du0QCmv4m174Vkcoo66IAZtsjQFKUR3s8ZAoElKCmF2jdVUXDNANggIjo
         ZG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078662; x=1790683462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUpeNq3+QaUFHKyKU5yfrM/FkR0pBOt5e12bFHIM/Rs=;
        b=KjWUsl5UN7en8nbVrgnssWiJTO8PYj23d+qEInOd7efswUw2+kBKnBcrNsmU9WZt5T
         BouKdyeh3/DJ0Fes+m0Vc5QUXU5hLEQKGxzVc94GRkbaAU4ZzdryaTm4N/CDKq13AxE/
         +Vc5z7QYpvREKwhlx5d+o970pCWsZt21MK5VEzgUdUZGldTpF3dWNVwwDM/dNW0gT7hu
         YT58vCnRTtHo3P6fWAI5ylZIbv1uaMziaFEKIQ6yt5WH554onNCBRK8wBjoBdH2zzFdF
         n0LR4d1SCSxiVeHK5+1aQgRZo2/EnMfLjUBsMFB6If5TU+4DQvGxdjoCrxV/y3CU449S
         Imrg==
X-Forwarded-Encrypted: i=1; AKwUvBxWDivjaV+I1o4nEG+WM7QYdGQy69NieBP+oR/8VRq5oFAFkf8nZUDvSLUQZ44ysTNUq/WhL+AfBE6TFd5+uRW4@lists.infradead.org
X-Gm-Message-State: AFuF++ma5Zu8Zo0M73S2T08VQYbhGs0xxWPoDW0ttUhNrrdktr41GICE
	C6qdtpM7V+TVBQNiEgLyntj+RUxkvkjAW4pjPykINo0ldkH9dCuzv9bVTYNEBImRl1k174ANdVQ
	kXowVWt8b5bR98gnlea79b1IdeHLOlRjcmwrXwEUsbA==
X-Gm-Gg: AYBFou2LSWvUYnjNLIYjNCce7WdbkzVBYDGb/s77iq+fR8LiwRWC5bUvYmRdWwidQTP
	urMB4GZhusMPC8iI03jCOROK3yT659zpzdbvBOXz/h5kwyIJnEY81kSXPp6ugj/wKULp+hTx47q
	yENeWl4z+22DW1WQgyzswV32jRDu7lDux90/zfVaw1jR4sFpuVbSM2YB6iYLmyKABRu9VVzCekr
	KDJlCVycsgQO5qd3e4FNGjgc/HkCAHKhc80jsS4UzjZwrSOLiKMYFjt8iOBCoDLNYTMFJvl5gIj
	CuGl1CkRggIIE9AdHnkZ8HRGphpAJRGej15gfQxQlH2gKgT1wtiVT5EgpvEJJ0qEor0DnG2dq1J
	53KZvgCsx5TLapH6kpvKX+ZdhnQ4xl/yY184=
X-Received: by 2002:a05:6a00:3a12:b0:878:3705:5724 with SMTP id
 d2e1a72fcca58-87c85de1562mr682886b3a.48.1790078662177; Tue, 22 Sep 2026
 05:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260918153414.909333-1-aubin.constans@microchip.com>
In-Reply-To: <20260918153414.909333-1-aubin.constans@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 22 Sep 2026 14:04:09 +0200
X-Gm-Features: AcwNN1WHiWWomoXHzFPUnhbd-xc9yh6WSNzq7MyJexGie0-v5X9TH742BS0QVU8
Message-ID: <CA+HBbNHG-hTMLSeRKAb1hz4mDna3LDmoPA6CJ_DG6_oRWZajmg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-at91: disable selectively clocks on pm runtime
To: Aubin Constans <aubin.constans@microchip.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Eugen Hristev <ehristev@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Romain Sioen <romain.sioen@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130425_415426_97D5243F 
X-CRM114-Status: GOOD (  29.52  )
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

On Fri, Sep 18, 2026 at 5:35=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>
> SAMA7G5's SDMMC run-time clock disabling is not supported.
> Add support to avoid this scenario for SAMA7G5.
>
> [Amended with a fix from Romain Sioen below this line]
>
> Sama7 boards are impacted by an unbalanced prepare/unprepare
> and enable/disable clock management in sdhci driver due to
> the lack of support for SDMMC clock runtime disabling,
> managed instead by the PMC driver.
>
> Add conditions in the preset function to manage clock
> depending on if the board support runtime clock disabling
> and if we come from the probing or restoring procedure.
>
> Add boolean start_clks variable to manage condition
> in preset function.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Aubin Constans <aubin.constans@microchip.com>

Tested-by: Robert Marko <robert.marko@sartura.hr>

> ---
>  drivers/mmc/host/sdhci-of-at91.c | 36 ++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of=
-at91.c
> index 7c4ac65f247d..399856643e57 100644
> --- a/drivers/mmc/host/sdhci-of-at91.c
> +++ b/drivers/mmc/host/sdhci-of-at91.c
> @@ -39,6 +39,7 @@ struct sdhci_at91_soc_data {
>         const struct sdhci_pltfm_data *pdata;
>         bool baseclk_is_generated_internally;
>         unsigned int divider_for_baseclk;
> +       bool pm_runtime_disable_clks;
>  };
>
>  struct sdhci_at91_priv {
> @@ -149,12 +150,14 @@ static const struct sdhci_pltfm_data sdhci_sama5d2_=
pdata =3D {
>  static const struct sdhci_at91_soc_data soc_data_sama5d2 =3D {
>         .pdata =3D &sdhci_sama5d2_pdata,
>         .baseclk_is_generated_internally =3D false,
> +       .pm_runtime_disable_clks =3D true,
>  };
>
>  static const struct sdhci_at91_soc_data soc_data_sam9x60 =3D {
>         .pdata =3D &sdhci_sama5d2_pdata,
>         .baseclk_is_generated_internally =3D true,
>         .divider_for_baseclk =3D 2,
> +       .pm_runtime_disable_clks =3D true,
>  };
>
>  static const struct of_device_id sdhci_at91_dt_match[] =3D {
> @@ -164,7 +167,7 @@ static const struct of_device_id sdhci_at91_dt_match[=
] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
>
> -static int sdhci_at91_set_clks_presets(struct device *dev)
> +static int sdhci_at91_set_clks_presets(struct device *dev, bool start_cl=
ks)
>  {
>         struct sdhci_host *host =3D dev_get_drvdata(dev);
>         struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> @@ -174,7 +177,14 @@ static int sdhci_at91_set_clks_presets(struct device=
 *dev)
>         unsigned int                    gck_rate, clk_base_rate;
>         unsigned int                    preset_div;
>
> -       clk_prepare_enable(priv->hclock);
> +       /*
> +        * Manage clock prepare/enable procedure depending on if the boar=
d
> +        * support runtime clock disabling and if we come from the probin=
g
> +        * or restoring procedure (for backup+self refresh).
> +        */
> +       if (start_clks)
> +               clk_prepare_enable(priv->hclock);
> +
>         caps0 =3D readl(host->ioaddr + SDHCI_CAPABILITIES);
>         caps1 =3D readl(host->ioaddr + SDHCI_CAPABILITIES_1);
>
> @@ -223,8 +233,11 @@ static int sdhci_at91_set_clks_presets(struct device=
 *dev)
>         writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
>                host->ioaddr + SDHCI_PRESET_FOR_DDR50);
>
> -       clk_prepare_enable(priv->mainck);
> -       clk_prepare_enable(priv->gck);
> +       /* Same clock management as for hclock */
> +       if (start_clks) {
> +               clk_prepare_enable(priv->mainck);
> +               clk_prepare_enable(priv->gck);
> +       }
>
>         return 0;
>  }
> @@ -254,9 +267,11 @@ static int sdhci_at91_runtime_suspend(struct device =
*dev)
>         if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
>                 mmc_retune_needed(host->mmc);
>
> -       clk_disable_unprepare(priv->gck);
> -       clk_disable_unprepare(priv->hclock);
> -       clk_disable_unprepare(priv->mainck);
> +       if (priv->soc_data->pm_runtime_disable_clks) {
> +               clk_disable_unprepare(priv->gck);
> +               clk_disable_unprepare(priv->hclock);
> +               clk_disable_unprepare(priv->mainck);
> +       }
>
>         return 0;
>  }
> @@ -269,7 +284,7 @@ static int sdhci_at91_runtime_resume(struct device *d=
ev)
>         int ret;
>
>         if (priv->restore_needed) {
> -               ret =3D sdhci_at91_set_clks_presets(dev);
> +               ret =3D sdhci_at91_set_clks_presets(dev, priv->soc_data->=
pm_runtime_disable_clks);
>                 if (ret)
>                         return ret;
>
> @@ -277,6 +292,9 @@ static int sdhci_at91_runtime_resume(struct device *d=
ev)
>                 goto out;
>         }
>
> +       if (!priv->soc_data->pm_runtime_disable_clks)
> +               goto out;
> +
>         ret =3D clk_prepare_enable(priv->mainck);
>         if (ret) {
>                 dev_err(dev, "can't enable mainck\n");
> @@ -344,7 +362,7 @@ static int sdhci_at91_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
>                                      "failed to get multclk\n");
>
> -       ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> +       ret =3D sdhci_at91_set_clks_presets(&pdev->dev, true);
>         if (ret)
>                 return ret;
>
> --
> 2.43.0
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

