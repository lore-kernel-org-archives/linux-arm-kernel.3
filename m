Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC20FCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BcRktes/U5lVo22Fcl1qWv50r+fNV+F5WhzGJEWnCY=; b=gFwp1IdB0kI3PJVvwmJgM0zL1P
	9Kn1ZoFuTcUaUNaxe8xDWuahFw6Bo6g47ONK5rOoS/bCJgWSO+OoXIp14n3Y68djWF+lj4wEGItSB
	kVimtzyjhDpeWzuKsJ4EoksW9qst/0L5XGof+//5s9DAi6yNAUar/BTNrcVN4CMNLvldZbQ0TKP4I
	A7ziapP0m2SRR5sqKkrEm5aNMN/E4v2AuZ5t3lLyU/jTaJAEM0KNtPWyKCft6uBEu8mfkSzazDg18
	Cyq9FrPEYRb3Q4O98TyuOrunfB4Jn9VkAUv5uAC1X7ArosdKTYrkltj0nN5ig7hLvgaOYYLcB+C3P
	vVm0B+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbhV-0000000CpUL-2Bjg;
	Tue, 13 Oct 2026 12:33:49 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbhS-0000000CpTZ-2gyu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:33:48 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ab41538192so2050002a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894825; cv=none;
        d=google.com; s=arc-20260327;
        b=VyFeOEKMHzcccx0Stp0+d4DBDwQwzprwtpkDzTs2cAtTvV37nXMWe6DwPmR68yiQHs
         i7yRUKaNJmaOf8CcP6HrhpQTO5jbkI915uBpaX4g2ZAIdOHVONQR9wDO73bQrTVFPAnT
         8BNMX+3EsYINTL2YEEQl1QwNBGzRsSxZB3q3DWvFSo8SaPqBfZ5PHD310hiDUBGmD2PV
         MmxoheG/jESMz/EThZMLzY6wtz9PjoYNEPTvbuBEs0ecoFcXW4+S8f6t5AyrWSaynhol
         m9crwfeq94moM3dvlK1M7/smq+Ehz5d0PyRhVo6qdgkRHMJsNoAVC4IFKOUG8nwUYbra
         j38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0BcRktes/U5lVo22Fcl1qWv50r+fNV+F5WhzGJEWnCY=;
        fh=LZP1BXGt2j8NSFyL5zWAdbP7yeG+7IgjWC2fsT6yXYQ=;
        b=K69JmRZwrQ9o9IWeVsbDahCu6A1V5LLs9OVcJoqtUJEEt2D+Jm5ZMEf8fmV57BooLC
         ILfBbuybn5EzXxzqqfyvFfyuTAp5ybXDBW8QTNbEmkzrqKRhgBIpwQVNQbGQXglqgr12
         cf8Nz0lGrXt07q0cdl5Z4EdIcFDueZh4kbP7MUM+zegR4/JywUQ8RaC57qGYxt878oUA
         IYvBoES/5YCdwsi7hwLaj1dKwDN0/r6lY3oQMHnRmUUPNTMkD0YV4+vWmpajlDuypLLD
         v7mnMC0WOHc6qQxo6Ep8nCVb5VujmiCMMT+YfEuG//FcrgwCD8zY+E+dh+iyeE46/AXw
         hMMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791894825; x=1792499625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BcRktes/U5lVo22Fcl1qWv50r+fNV+F5WhzGJEWnCY=;
        b=wi7LJDBEnN+H39Zz4d8prhlhYl+9FPpGbMZTWtdE5xfzzvZx8KuqtvU0wozBsFgNne
         8UYYYz2MBTCH93bk6Kv+sH8KSdsUvOsHUjPF2jJ3G3LIJivbUiRn1OFhqllKag0lar1f
         cZ9A5DCQ3cX+Puhva/8oDTUJuLhxMdGSpcU8ZdwldOTXyDtfZinWsRL2EyezRPMUkQPT
         lJzbaFDyD+SSL80Zhg1MRnHCfpie7BiuxcETneYxlHqmtamyzylMrIGl8JE5qKB3q9Fj
         YCmc3ngsPNKUriVl0yyJH5Xpi/K6i4PPbs+8DJRtIp35y6UMHk5sQSTDKLeeyih+JMn1
         9IHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894825; x=1792499625;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BcRktes/U5lVo22Fcl1qWv50r+fNV+F5WhzGJEWnCY=;
        b=D1Q5ovphcZ1zJ+/W6m4MVeK8OW0joI3cV7n7GyqWTEdaf0C0/lkOiZSNcTaGKPLDJ/
         tkWPas6Skp0ODNeeI2b3+9GtbWmBqBauLc69WXhKKWn4d9f6sDd+X6URooiMBPJh4CuZ
         EYYgKHBCeQoF3ys67LDa5ph1XIgMGAPN6LLasTxhrbdL2c5l4dstaLr5LpPGxWJz5a+T
         83FVVNPtT0ZcUMobKx0g4xvXF6xPJ86OuZNzTuX71axd7vJSS7xjvo5Ly4w5zcEe99FJ
         ErCiYo/5gfOJNNL9eGYc8u2iw1W0+cQ0PgpIfqadai/3xuSPYpjBld0mbrfDu7whCD1N
         +tfA==
X-Forwarded-Encrypted: i=1; AKwUvBwxxYx6kkEUE4sj6ecTwgKa3O5b6/BW/oke5USsbrODIs5lqbJPDg79JK1QgEIVRKPGsMt2cbU4iF4JqHjwbvP2@lists.infradead.org
X-Gm-Message-State: AFq9FYI862kTKg7hbVo7pN+nKXiO3DQFoZE3XTq5SLOrubtu6lCUXVNr
	BCXEW1t4+cD1soOe5H5H/bEzkGX7bpyVWqhn0+csyLIlr3pTzjX8ebSMq3Q1x+jDRITN7D/JIMF
	ZCyad6qzBbMqgjrZVY8QNGnYUNExp4c3Pdimczv6+aQ==
X-Gm-Gg: AYBFou1xOQTb85FZXurESTPFEwfqL4foE9noIPROLenLFc5RJhaBEivQ27EY58kgciF
	5oytjdYJaBjv5qMMz/uPFnE8iZGuYsN4G7DpjiljjPHJX+xRQYf6qlznvJXYdNdNoAduqI8+6ED
	1wFXFrr5OfJOlbQ8ISWWn4BbaxQhHVdN1TejUnYtqz7++d/h3lehoofsMQ9jzPrkb+h2feybyF9
	8Zhrmpc9TyxNB67IJSsgTVeo99xKi9sIAh1mBDVEnJXL7AnBcTb2hXgIZTAx9GkEubpSpk1Qt+g
	OiSlu16T3iZ1jKrmVTI66htAHffxUpafIJ3KrTY00p0APr/7VexHUlzlbZvod/udcnaN6HqKVuw
	nCRBs5xdGO65ozlsVcYt6c1woLIBxKSa109y8iYmuNNKvNA==
X-Received: by 2002:a17:90b:2688:b0:3a4:adea:50ad with SMTP id
 98e67ed59e1d1-3ab3a775938mr10437579a91.27.1791894825280; Tue, 13 Oct 2026
 05:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260918153414.909333-1-aubin.constans@microchip.com> <e75041b4-8450-43f6-bf6d-35a31812f8e1@intel.com>
In-Reply-To: <e75041b4-8450-43f6-bf6d-35a31812f8e1@intel.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 13 Oct 2026 14:33:34 +0200
X-Gm-Features: AclHuK-ahRr2oJBzP7-hAKuKrqD2xh13uJApDX2EwOd8IrbrNAm5T9Br4ypdnAk
Message-ID: <CA+HBbNF59tx+FhWke_Q8ie9O5_4RrPPPJm=iALiBKQb0Tp8ChQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-at91: disable selectively clocks on pm runtime
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson <ulfh@kernel.org>, 
	Eugen Hristev <ehristev@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Romain Sioen <romain.sioen@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_053346_700156_78134D31 
X-CRM114-Status: GOOD (  33.87  )
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

On Wed, Sep 23, 2026 at 4:35=E2=80=AFPM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 18/09/2026 18:34, Aubin Constans wrote:
> > From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> >
> > SAMA7G5's SDMMC run-time clock disabling is not supported.
> > Add support to avoid this scenario for SAMA7G5.
> >
> > [Amended with a fix from Romain Sioen below this line]
> >
> > Sama7 boards are impacted by an unbalanced prepare/unprepare
> > and enable/disable clock management in sdhci driver due to
> > the lack of support for SDMMC clock runtime disabling,
> > managed instead by the PMC driver.
> >
> > Add conditions in the preset function to manage clock
> > depending on if the board support runtime clock disabling
> > and if we come from the probing or restoring procedure.
> >
> > Add boolean start_clks variable to manage condition
> > in preset function.
>
> The commit message is a little confusing.  There is no functional
> change yet - this is just preparation, right?  But it reads like
> it is making it work for SAMA7G5.  Please make that clearer in
> the commit message.

Its just preparation, I posted the series for LAN969x which requires the sa=
me so
Aubin posted the Microchip tested commit that SAMA7G5 will also use.

I am waiting on this to post the v3 of LAN969x support.

Regards,
Robert

>
> >
> > Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> > Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> > Signed-off-by: Aubin Constans <aubin.constans@microchip.com>
> > ---
> >  drivers/mmc/host/sdhci-of-at91.c | 36 ++++++++++++++++++++++++--------
> >  1 file changed, 27 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-=
of-at91.c
> > index 7c4ac65f247d..399856643e57 100644
> > --- a/drivers/mmc/host/sdhci-of-at91.c
> > +++ b/drivers/mmc/host/sdhci-of-at91.c
> > @@ -39,6 +39,7 @@ struct sdhci_at91_soc_data {
> >       const struct sdhci_pltfm_data *pdata;
> >       bool baseclk_is_generated_internally;
> >       unsigned int divider_for_baseclk;
> > +     bool pm_runtime_disable_clks;
> >  };
> >
> >  struct sdhci_at91_priv {
> > @@ -149,12 +150,14 @@ static const struct sdhci_pltfm_data sdhci_sama5d=
2_pdata =3D {
> >  static const struct sdhci_at91_soc_data soc_data_sama5d2 =3D {
> >       .pdata =3D &sdhci_sama5d2_pdata,
> >       .baseclk_is_generated_internally =3D false,
> > +     .pm_runtime_disable_clks =3D true,
> >  };
> >
> >  static const struct sdhci_at91_soc_data soc_data_sam9x60 =3D {
> >       .pdata =3D &sdhci_sama5d2_pdata,
> >       .baseclk_is_generated_internally =3D true,
> >       .divider_for_baseclk =3D 2,
> > +     .pm_runtime_disable_clks =3D true,
> >  };
> >
> >  static const struct of_device_id sdhci_at91_dt_match[] =3D {
> > @@ -164,7 +167,7 @@ static const struct of_device_id sdhci_at91_dt_matc=
h[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
> >
> > -static int sdhci_at91_set_clks_presets(struct device *dev)
> > +static int sdhci_at91_set_clks_presets(struct device *dev, bool start_=
clks)
> >  {
> >       struct sdhci_host *host =3D dev_get_drvdata(dev);
> >       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> > @@ -174,7 +177,14 @@ static int sdhci_at91_set_clks_presets(struct devi=
ce *dev)
> >       unsigned int                    gck_rate, clk_base_rate;
> >       unsigned int                    preset_div;
> >
> > -     clk_prepare_enable(priv->hclock);
> > +     /*
> > +      * Manage clock prepare/enable procedure depending on if the boar=
d
> > +      * support runtime clock disabling and if we come from the probin=
g
> > +      * or restoring procedure (for backup+self refresh).
> > +      */
> > +     if (start_clks)
> > +             clk_prepare_enable(priv->hclock);
> > +
> >       caps0 =3D readl(host->ioaddr + SDHCI_CAPABILITIES);
> >       caps1 =3D readl(host->ioaddr + SDHCI_CAPABILITIES_1);
> >
> > @@ -223,8 +233,11 @@ static int sdhci_at91_set_clks_presets(struct devi=
ce *dev)
> >       writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
> >              host->ioaddr + SDHCI_PRESET_FOR_DDR50);
> >
> > -     clk_prepare_enable(priv->mainck);
> > -     clk_prepare_enable(priv->gck);
> > +     /* Same clock management as for hclock */
> > +     if (start_clks) {
> > +             clk_prepare_enable(priv->mainck);
> > +             clk_prepare_enable(priv->gck);
> > +     }
> >
> >       return 0;
> >  }
> > @@ -254,9 +267,11 @@ static int sdhci_at91_runtime_suspend(struct devic=
e *dev)
> >       if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
> >               mmc_retune_needed(host->mmc);
> >
> > -     clk_disable_unprepare(priv->gck);
> > -     clk_disable_unprepare(priv->hclock);
> > -     clk_disable_unprepare(priv->mainck);
> > +     if (priv->soc_data->pm_runtime_disable_clks) {
> > +             clk_disable_unprepare(priv->gck);
> > +             clk_disable_unprepare(priv->hclock);
> > +             clk_disable_unprepare(priv->mainck);
> > +     }
> >
> >       return 0;
> >  }
> > @@ -269,7 +284,7 @@ static int sdhci_at91_runtime_resume(struct device =
*dev)
> >       int ret;
> >
> >       if (priv->restore_needed) {
> > -             ret =3D sdhci_at91_set_clks_presets(dev);
> > +             ret =3D sdhci_at91_set_clks_presets(dev, priv->soc_data->=
pm_runtime_disable_clks);
> >               if (ret)
> >                       return ret;
> >
> > @@ -277,6 +292,9 @@ static int sdhci_at91_runtime_resume(struct device =
*dev)
> >               goto out;
> >       }
> >
> > +     if (!priv->soc_data->pm_runtime_disable_clks)
> > +             goto out;
> > +
> >       ret =3D clk_prepare_enable(priv->mainck);
> >       if (ret) {
> >               dev_err(dev, "can't enable mainck\n");
> > @@ -344,7 +362,7 @@ static int sdhci_at91_probe(struct platform_device =
*pdev)
> >               return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
> >                                    "failed to get multclk\n");
> >
> > -     ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> > +     ret =3D sdhci_at91_set_clks_presets(&pdev->dev, true);
> >       if (ret)
> >               return ret;
> >
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

