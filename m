Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAFEC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWWxIYlBWABZ3GjM6t1BqbZ6aeOgozwkp5h4xrnqvNE=; b=bY1MXbBgQ58hH4EnWQAcfOChUH
	ZbndYF84NMF/AYd0pCbi+grJYLx2VgEm20YJnr3LU9SRiGEdwzE91vdTmIkC5jpkrotXWtrAxCy6G
	CYYK8TPDYIRXYQ7jRcSNjywDF+IKTBfAa4zOeLqZAFL43aZsRdf7BJnh0fjzGIkpCMhf+Avx/8Pat
	l1ISkBygdpUWKky2kFngKh5MbuHEjyzt0eQFL3HJ5mFPeIYjqGBCcyYCAKwUdz7vV7gu9v5fLLlgF
	9m5WRPXN2xguLXk+ePN88PQeF2Drkgper7+4fvEGEFL73bCG916xhn2G3pPh3HG060qzdRiphDAyM
	qCdW400w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ROT-000000067vQ-00P0;
	Tue, 15 Sep 2026 11:32:09 +0000
Received: from mail-pj2-f12.google.com ([74.125.227.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ROK-000000067jt-1nAF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:32:05 +0000
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d93ff61046so1167615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789471918; cv=none;
        d=google.com; s=arc-20260327;
        b=bO4HXeCJeaelo4xBIZScZsXexCzHYZ9MnQrTA+hKWP+SJzA8Aaj3eLM1mEZ5ZIWusW
         X04qWdMGKqs0bN0+2/SrkV5Bm/nOVSIo4WH9Gqri1Izv2WFpxRKYT3SF3C4B7NrrK7L3
         hZ6I32RBm8In2UiDcC2MN66BB0Pe/p5du4YY9IqDQznkMo3/V+XpC3dDnZfMkCaQExqJ
         emoNCaAOpH/CmhXbyUdpmcUx91DwfZLTv8XBIxSToH/HkfdhyniKVd2sqJjMSoOorHv0
         0G8LC9Sm1zd72YevZnOvPwNqsrkbg172AEgOgMznh7ImXBCodpVygG7qYnj4QM2KqxW8
         2UEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZWWxIYlBWABZ3GjM6t1BqbZ6aeOgozwkp5h4xrnqvNE=;
        fh=6OLOW3cBbKrWb7tb7xX5bG+CW6IAFR3n6rt5tJYrN+g=;
        b=WmOJahvdDBCOHenP6uiJRrds5lRPyhg+hugg8vED5luomtrkeYM0SHUEzOv72GnWgZ
         Gd9xhlVwxAD2bVx9ihiBCPJscH8THPnDvadf5mm8s7wnHZnN7fENuwGCahftOEDeAAOQ
         cwqq6csRuP2F/Y3QAdrwDhomI2hkihFWWZN1RCIgluXumHhdZfcpFAMlIpHnTUw0Br9E
         4QdUTkVeb3a1T/6yBzj9E9L2UdBoENLq8FQCV83EC84DENiY77VlQc1kyMBb6Ct3xlrP
         qJ0+EQ8J+aW1OB1oEd0wOrzd6nEi1Uixfu232xqIsY6l2B2RXoTb6PSJaMm4dLPnBmU6
         sX9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1789471918; x=1790076718; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZWWxIYlBWABZ3GjM6t1BqbZ6aeOgozwkp5h4xrnqvNE=;
        b=lMIfLaeIppJQHwguNoMUST8GpFKxr62l+7dOKnGNR/HRiXTndxWEcfPujoc3QCrFB+
         uVMMAFfGuFU1fbBuuLTiEFrQW6XK90aoo5NndIQHz8p/FzFtxic0pSQrZazf6aUcXoQa
         qjp3TKfgPnRR/vw6AApS2us5XYIpkX5nykEe10srWFco4swYK8xctLIYZ5JZoEm/LQgP
         4AIShUUaIdVl+JDvyof5BZ342zyFkSvejuLGEU1ZSdG5atj+xvIttf2U5EyzfL1czu7/
         SSe9WQZP7QY5Wg/Ei/2AuXtfqqkXxAKLNUwS5Kw9zK1iMqnG0bwYQOC3l4K9rArUHtoy
         WnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471918; x=1790076718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWWxIYlBWABZ3GjM6t1BqbZ6aeOgozwkp5h4xrnqvNE=;
        b=0tWUDbiAOKV4NsftReXOMejrzyMfS533sMvUgwTIuSSSZBN7jl/wtDO8Rx8UG67uuH
         mcF6kDOgMaWkPkwmtusDp4i9R8vwq4Cme2CTjiGU0vJuxPO+9aiZD6dNRN6O0ofdSNml
         MXgdBxkKl9k9z+RX8qDMVQYIp0ebRXYA7is23D2mRu6O9BOObd6Rm7XdUGpKNH4zP5CD
         mEVU4Z3DuvnnMTM80s5ang7BIjQfM2Ekzokpvia860eSbqV9sa5j2tq0zcY7iem77YsK
         91Z7RK0J1pQiycSWyFeqLFKcjI0fCnOajf/tdiGMg7/emX5x9c9qzYFgMqCYNPAnZ4bz
         a6qw==
X-Forwarded-Encrypted: i=1; AKwUvBx91QL+o5Znm/LhtE0U+kgDcdeaJ/+wyl3Ii0WA0GKCjfBA1zkPDUXV0nFneAp3iAY9xojIWhCnOfqGKsEYrL7b@lists.infradead.org
X-Gm-Message-State: AFuF++lM9prmCy+MWWPiAt2/59SnsuIg07yAGwfR2rVeuDEBc9Fqp6yR
	LjSTZr93xZRos746l9oJkUA/lGTwWO6AFDoqF5OueidJYvHMmnSX7KeZShynWYK8NG7KuJj7Hbq
	LJLgQWSR2K8rJPnXAFHBJGqhSkdfQHjgLOtowLNsFPQ==
X-Gm-Gg: AYBFou2Dzc+JSZxgfPriRQcdSsPvacEUp+yez6URADWFvVg4U6py6YH2hTyrP0gwa2B
	tRtG0e01ABtRP/3qz1oB8GVONu5XCIU46oNaRXad+cSdvd0WBphC0VF3dLGx0pl0P+cbXJYHT6k
	7SSode8/A2vMZqe7aYRLWJmsXvGOQgjxmTNWdLFXwltXA+brs5eeoLUlxcUIJGSEBFdqzMQWYFK
	k33CF/WEsv2OwNxlwbW5ffuHr06s+l8PV6naC0Re/VS1XO5zTdQSiqHTzfLnwdkutxFaG9+Y2Kf
	ZPrb2gBmVM32VRqQYfd0R9Cn28kAtGdr+5qtet2tzKECXAeyP/5DoZKAdCqobrrwLeXYTZO4YFr
	MMmyseYgyLsUfSvtpdF2iadPzjYe0wp/ou9A=
X-Received: by 2002:a17:903:238b:b0:2d8:d4cc:5bb1 with SMTP id
 d9443c01a7336-2dd83867c8amr12011995ad.17.1789471917503; Tue, 15 Sep 2026
 04:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-3-robert.marko@sartura.hr> <bfcd57f8-ffca-4a44-a84f-12c46cb9fe76@microchip.com>
In-Reply-To: <bfcd57f8-ffca-4a44-a84f-12c46cb9fe76@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 15 Sep 2026 13:31:46 +0200
X-Gm-Features: AcwNN1UJvA458C1rRtNt9ddKHsmuV8Z1-WqiLjsIfnIGDe3K05sCIbO51uVztps
Message-ID: <CA+HBbNFQH-hTnqBOEAau2dP1+zKNsHDBcQA9dC5ofx2U5cbFDw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] mmc: sdhci-of-at91: add option to keep clocks enabled
To: Aubin Constans <aubin.constans@microchip.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, adrian.hunter@intel.com, ehristev@kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_043200_735426_3070C0AA 
X-CRM114-Status: GOOD (  26.01  )
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

On Mon, Sep 14, 2026 at 3:46=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> Hi Robert,
>
> On 07/09/2026 15:25, Robert Marko wrote:
> > sdhci_at91_set_clks_presets() both enables the controller clocks and
> > programs its capabilities and preset registers. This prevents callers f=
rom
> > restoring the registers without changing the clock enable counts.
> >
> > Move clock enablement to callers and add a SoC data flag for controller=
s
> > that must keep their clocks enabled. Use it in the runtime PM paths whi=
le
> > keeping register restoration separate from clock enablement.
>
> This change has been required for the SAMA7G54 MPU already, and implement=
ed by
> two complementary commits:
>
> https://github.com/linux4microchip/linux/commit/763a3c05c8f9d0feb279c6f30=
8fa5d48d14e07d3
> https://github.com/linux4microchip/linux/commit/b5bbc888fb39471d46fe0a4ff=
28f69533c265dd0
>
> At least they have been validated by test campaigns.
> If that existing work seemed OK for you and the LAN969x, then I could squ=
ash
> these two commits and submit the result.

Hi Aubin,
Yeah, I originally used those in our tree as well before trying to
simplify things for upstreaming.

Regards,
Robert

> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >
> >   drivers/mmc/host/sdhci-of-at91.c | 39 +++++++++++++++++++------------=
-
> >   1 file changed, 23 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-=
of-at91.c
> > index 7c4ac65f247d..b7e2a89da348 100644
> > --- a/drivers/mmc/host/sdhci-of-at91.c
> > +++ b/drivers/mmc/host/sdhci-of-at91.c
> > @@ -38,6 +38,7 @@
> >   struct sdhci_at91_soc_data {
> >          const struct sdhci_pltfm_data *pdata;
> >          bool baseclk_is_generated_internally;
> > +       bool keep_clks_on;
> >          unsigned int divider_for_baseclk;
> >   };
> >
> > @@ -164,7 +165,7 @@ static const struct of_device_id sdhci_at91_dt_matc=
h[] =3D {
> >   };
> >   MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
> >
> > -static int sdhci_at91_set_clks_presets(struct device *dev)
> > +static void sdhci_at91_set_clks_presets(struct device *dev)
> >   {
> >          struct sdhci_host *host =3D dev_get_drvdata(dev);
> >          struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> > @@ -174,7 +175,6 @@ static int sdhci_at91_set_clks_presets(struct devic=
e *dev)
> >          unsigned int                    gck_rate, clk_base_rate;
> >          unsigned int                    preset_div;
> >
> > -       clk_prepare_enable(priv->hclock);
> >          caps0 =3D readl(host->ioaddr + SDHCI_CAPABILITIES);
> >          caps1 =3D readl(host->ioaddr + SDHCI_CAPABILITIES_1);
> >
> > @@ -222,11 +222,6 @@ static int sdhci_at91_set_clks_presets(struct devi=
ce *dev)
> >          preset_div =3D DIV_ROUND_UP(gck_rate, 50000000) - 1;
> >          writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
> >                 host->ioaddr + SDHCI_PRESET_FOR_DDR50);
> > -
> > -       clk_prepare_enable(priv->mainck);
> > -       clk_prepare_enable(priv->gck);
> > -
> > -       return 0;
> >   }
> >
> >   static int sdhci_at91_suspend(struct device *dev)
> > @@ -254,9 +249,11 @@ static int sdhci_at91_runtime_suspend(struct devic=
e *dev)
> >          if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
> >                  mmc_retune_needed(host->mmc);
> >
> > -       clk_disable_unprepare(priv->gck);
> > -       clk_disable_unprepare(priv->hclock);
> > -       clk_disable_unprepare(priv->mainck);
> > +       if (!priv->soc_data->keep_clks_on) {
> > +               clk_disable_unprepare(priv->gck);
> > +               clk_disable_unprepare(priv->hclock);
> > +               clk_disable_unprepare(priv->mainck);
> > +       }
> >
> >          return 0;
> >   }
> > @@ -269,14 +266,23 @@ static int sdhci_at91_runtime_resume(struct devic=
e *dev)
> >          int ret;
> >
> >          if (priv->restore_needed) {
> > -               ret =3D sdhci_at91_set_clks_presets(dev);
> > -               if (ret)
> > -                       return ret;
> > +               if (!priv->soc_data->keep_clks_on)
> > +                       clk_prepare_enable(priv->hclock);
> > +
> > +               sdhci_at91_set_clks_presets(dev);
> > +
> > +               if (!priv->soc_data->keep_clks_on) {
> > +                       clk_prepare_enable(priv->mainck);
> > +                       clk_prepare_enable(priv->gck);
> > +               }
> >
> >                  priv->restore_needed =3D false;
> >                  goto out;
> >          }
> >
> > +       if (priv->soc_data->keep_clks_on)
> > +               goto out;
> > +
> >          ret =3D clk_prepare_enable(priv->mainck);
> >          if (ret) {
> >                  dev_err(dev, "can't enable mainck\n");
> > @@ -344,9 +350,10 @@ static int sdhci_at91_probe(struct platform_device=
 *pdev)
> >                  return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
> >                                       "failed to get multclk\n");
> >
> > -       ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> > -       if (ret)
> > -               return ret;
> > +       clk_prepare_enable(priv->hclock);
> > +       sdhci_at91_set_clks_presets(&pdev->dev);
> > +       clk_prepare_enable(priv->mainck);
> > +       clk_prepare_enable(priv->gck);
> >
> >          priv->restore_needed =3D false;
> >
> > --
> > 2.55.0
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

