Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDE5C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOhmSbQRDqCEb/A2sqYTkgFarvxluyIQ+deEPZ6m+b4=; b=IZR/8s/bm13cQh+ljxjXxpE2H/
	I6AtQmc4ubjbhwo0WyrEnvr2t5NFfnNagiT1nBAX3KWwkWx+URrKzQPq8trcu4DEJuK/2N5NJSxCH
	aaEZhVE7KiVxQkTJELlTCMi516LzMut8R6LMb9s2TfAtQDP8npt/Ok7m6sVHjaZeqf7psjpxcBwKK
	mNcZR/QELaE7YXXhfDXQpzErLpAlOa26UlC9kHQrbpNIea/Hlo+1VDEwsZ5u8mWjmHb57QrQZ03//
	N8M+2wiNBMlI5ZAd4wKKUJKkcHm8zWiIV3eBfnzgYCku5d18f2ysCIA6tig7AJxyghLmfodwUgzEt
	PNyiB8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zL5-00000005GuR-1BAN;
	Tue, 22 Sep 2026 12:11:11 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zL2-00000005Gu5-3Bvc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:11:10 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469b355ffso2436419b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790079068; cv=none;
        d=google.com; s=arc-20260327;
        b=fz7MGJ9qrM5ltCZkNsnxv5rpU5ZzgMqsx9W9fPcELExAqnqXOaxfPxCN8VzsFgErFR
         D36HjE/mP1Y21WnuKt3IuB0SsNVOu2Bir0GQFWoUKKTc81tPzJxSiPDx8NmW6cj33XRw
         RhODQN2f9tsN55cnPgjH7OpM2ZTdLvwj/Pqh4WepKx4sT24Ek0bJLiJfmjvNg2Zq9O73
         P9GuDUhsAvCPs6nsLUuaOR7yMLpFamgeGa+aYGlOzH//hL5brdAnGjeOhrK9MTyYVWX4
         vWh/goJtC+lh0mKAxjVFDQzyHrIj6Ij1AOnarFPqLuOWpiWgAiOs1aQuznFFlBDfW+2E
         6Vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOhmSbQRDqCEb/A2sqYTkgFarvxluyIQ+deEPZ6m+b4=;
        fh=L4PG7LGch50axQaOV+fWQ8JHBulcaGv1HysZm5lXwtY=;
        b=dtUsa7OeCdvVP3gX8nGPFK+68bkvIhoXs4RW9uds+FKLd8kMhWvJDW0lazaCQETAd+
         4Bk6bug1wxXnGh1NXU7j5gGyAYKzY6LX/BXAhI+kWLXf4dot50el9ZbFf5MEUMPdzNJf
         tjLu+OAtTpx3JCDkNG70A+2XN/LCrgzTwqR7/Zjg3QuFulfdck6QlOXRBvUvWlbdoyf8
         S5jGy7KDxWvGn9n/V8ebNsMCV72zEIlx4iEtTWuVW9xOp64z7FFvqTqzOcXdTIR/sJdR
         tX5Q4nPFju0A7H6DV99MruUeBdT3lQ1so2uZnPl58RL4hpnbzXtprXU0LMuyDUBKGJ85
         fdrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790079068; x=1790683868; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOhmSbQRDqCEb/A2sqYTkgFarvxluyIQ+deEPZ6m+b4=;
        b=lk9j++O1DplJEBCHlTHVq7x8V58yHdQH7RFX8lSQ05DaKh7+LKjWD/bSrLRx/llcLN
         LtZ+0jqRuF7PgVeHZSC4A2xNx0foyBvl8Squ1LzPvM6XtoD6RVJgrA0B4SsJpSgAraHq
         FFzpM76UdDhsibdD7JoW+OT+z/7RciCwyZcoiUKG5Wr/4iaawmq6M9IAvJgGLUFpUKA1
         Xx64ZIvuD/WpJNHsjf9ntA3OnBeA1exJN+DVPl3vuDXjnGEVpnzAU//fIBdTpxyzvfRb
         Oww9UyPf3PGnTWfyXTRLmffvgEYIYI/WoQKUooRU3peMM9e6FGM8c2iXvapz/a0gtavv
         xYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079068; x=1790683868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOhmSbQRDqCEb/A2sqYTkgFarvxluyIQ+deEPZ6m+b4=;
        b=d7U7ECz6SMvkjyylGSUwSGYu6xZmVvxEq87oSZUpzeKfNiRVQwMKg6XeH1malZ556D
         WfZScCTFCeU2ZEdI5kZ/nIk8G4Cd2XGvhuMcPRbvFDl2xYRbsFN3HyaTJ2aUcBRwSKY0
         tRBCTWq3t9grdfN1yvv9EGLiUT5uDai5bH5iEvmVSgLdUMcZIvAEW+t0Jn30eTRV88ME
         WFfUHT9w+g6J6ujoWoCmkDLPMu4VX1S7rqiBTz1+7lBy9czIOG+WiLj3y4JuuSy/ENNv
         NEQlDVDANTFA7eFfJcPeX4X2f9zt+6aXaFQD34yWQYct84gfaf00RylGuA76C4JXWwn8
         DLvg==
X-Forwarded-Encrypted: i=1; AKwUvBzTV7Ii0gMVq7Pk2xv3kf0DSp7aB5dKM7Z/S19OSgvPJrHQR2K2M4PEkIxdS7sSIIK2+CUpf2YxrGvyusoh+6Kx@lists.infradead.org
X-Gm-Message-State: AFuF++k2aBhNVrRFqo12qSqFfl1bwmr/M8M0hFDN5heJW6r5cWMhSmOZ
	QM0PVlkg66djQLAWz/Y/4b67b7rchRzzet+ZUgxMy3ODF3dLHSgEXaGf0Nyd0yHnSzPQfgQnhL5
	0xboaZRlFThlIjkEGKos5JzahfutSX/8VKzsTAnvAVw==
X-Gm-Gg: AYBFou15Ljm3X/Ajmihqj18Wcs5po0y9P2o+a2a9FM8GG+/FURCb51536x4V2ui/5tW
	3B2kndS1bkIbbFNlcvkKdHbjbLkgdAnf1I/8KyIW/MehI3+0NoQzFDbgw9U5XgmKnsc1EWqWK2J
	kvNHW6Sxh6NoxuH7EihvOoIaeQlRs9ieqCfePo/iVltAaOVhGM5A8pxPmlK4t7aXjqxepuuUFDm
	HjHDS9OolF6eH0sbYiCv9pExDSO40Iv+FssufeEvJSq5lpKcgvPI6tQPpDsBKwprrUtaSa9jf0m
	qSdEh+KtYEETyi1n0uT9UfrE+QOIA+Mme/48aXuZ4p76RnZhEZZcEhyGuQ1yALFrmbhG85s4lf+
	AiZ7dzcRgBLJD79VCbgzNMkEKgE5N/4Ch7nE=
X-Received: by 2002:a05:6a00:1815:b0:86f:68:4427 with SMTP id
 d2e1a72fcca58-87c82992710mr961428b3a.25.1790079067649; Tue, 22 Sep 2026
 05:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-3-robert.marko@sartura.hr> <bfcd57f8-ffca-4a44-a84f-12c46cb9fe76@microchip.com>
 <CA+HBbNFQH-hTnqBOEAau2dP1+zKNsHDBcQA9dC5ofx2U5cbFDw@mail.gmail.com> <ab5b83a9-7ac3-4a0e-bb81-491e3c509b85@microchip.com>
In-Reply-To: <ab5b83a9-7ac3-4a0e-bb81-491e3c509b85@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 22 Sep 2026 14:10:56 +0200
X-Gm-Features: AcwNN1X72TJGsn5G-Pd9YhQCT1YVTB77NSdqUoPxnMzfce7-XLlntiULjrzyflA
Message-ID: <CA+HBbNGRtcQ97TW4APKnK7dhq88BpbocZyc4yd4nLDw3W6n37w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260922_051108_816629_372F1BEB 
X-CRM114-Status: GOOD (  29.69  )
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

On Fri, Sep 18, 2026 at 6:02=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> On 15/09/2026 13:31, Robert Marko wrote:
> > On Mon, Sep 14, 2026 at 3:46=E2=80=AFPM Aubin Constans
> > <aubin.constans@microchip.com> wrote:
> >>
> >> Hi Robert,
> >>
> >> On 07/09/2026 15:25, Robert Marko wrote:
> >>> sdhci_at91_set_clks_presets() both enables the controller clocks and
> >>> programs its capabilities and preset registers. This prevents callers=
 from
> >>> restoring the registers without changing the clock enable counts.
> >>>
> >>> Move clock enablement to callers and add a SoC data flag for controll=
ers
> >>> that must keep their clocks enabled. Use it in the runtime PM paths w=
hile
> >>> keeping register restoration separate from clock enablement.
> >>
> >> This change has been required for the SAMA7G54 MPU already, and implem=
ented by
> >> two complementary commits:
> >>
> >> https://github.com/linux4microchip/linux/commit/763a3c05c8f9d0feb279c6=
f308fa5d48d14e07d3
> >> https://github.com/linux4microchip/linux/commit/b5bbc888fb39471d46fe0a=
4ff28f69533c265dd0
> >>
> >> At least they have been validated by test campaigns.
> >> If that existing work seemed OK for you and the LAN969x, then I could =
squash
> >> these two commits and submit the result.
> >
> > Hi Aubin,
> > Yeah, I originally used those in our tree as well before trying to
> > simplify things for upstreaming.
> >
> > Regards,
> > Robert
> >
>
> To follow up on that patch, I have just submitted the original work,
> ported to tag next-20260917:
>
> https://lore.kernel.org/linux-mmc/20260918153414.909333-1-aubin.constans@=
microchip.com/
>
> Hope it will make easier to support the LAN969x, notably.

Hi Aubin,
As long as that is merged, then LAN969x support is really simple.
I tested it locally and it works, so I am waiting on that getting
merged before sending v3 for LAN969x.

Regards,
Robert

>
> Regards,
> Aubin
>
> >>>
> >>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >>>
> >>>    drivers/mmc/host/sdhci-of-at91.c | 39 +++++++++++++++++++---------=
----
> >>>    1 file changed, 23 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhc=
i-of-at91.c
> >>> index 7c4ac65f247d..b7e2a89da348 100644
> >>> --- a/drivers/mmc/host/sdhci-of-at91.c
> >>> +++ b/drivers/mmc/host/sdhci-of-at91.c
> >>> @@ -38,6 +38,7 @@
> >>>    struct sdhci_at91_soc_data {
> >>>           const struct sdhci_pltfm_data *pdata;
> >>>           bool baseclk_is_generated_internally;
> >>> +       bool keep_clks_on;
> >>>           unsigned int divider_for_baseclk;
> >>>    };
> >>>
> >>> @@ -164,7 +165,7 @@ static const struct of_device_id sdhci_at91_dt_ma=
tch[] =3D {
> >>>    };
> >>>    MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
> >>>
> >>> -static int sdhci_at91_set_clks_presets(struct device *dev)
> >>> +static void sdhci_at91_set_clks_presets(struct device *dev)
> >>>    {
> >>>           struct sdhci_host *host =3D dev_get_drvdata(dev);
> >>>           struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> >>> @@ -174,7 +175,6 @@ static int sdhci_at91_set_clks_presets(struct dev=
ice *dev)
> >>>           unsigned int                    gck_rate, clk_base_rate;
> >>>           unsigned int                    preset_div;
> >>>
> >>> -       clk_prepare_enable(priv->hclock);
> >>>           caps0 =3D readl(host->ioaddr + SDHCI_CAPABILITIES);
> >>>           caps1 =3D readl(host->ioaddr + SDHCI_CAPABILITIES_1);
> >>>
> >>> @@ -222,11 +222,6 @@ static int sdhci_at91_set_clks_presets(struct de=
vice *dev)
> >>>           preset_div =3D DIV_ROUND_UP(gck_rate, 50000000) - 1;
> >>>           writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
> >>>                  host->ioaddr + SDHCI_PRESET_FOR_DDR50);
> >>> -
> >>> -       clk_prepare_enable(priv->mainck);
> >>> -       clk_prepare_enable(priv->gck);
> >>> -
> >>> -       return 0;
> >>>    }
> >>>
> >>>    static int sdhci_at91_suspend(struct device *dev)
> >>> @@ -254,9 +249,11 @@ static int sdhci_at91_runtime_suspend(struct dev=
ice *dev)
> >>>           if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
> >>>                   mmc_retune_needed(host->mmc);
> >>>
> >>> -       clk_disable_unprepare(priv->gck);
> >>> -       clk_disable_unprepare(priv->hclock);
> >>> -       clk_disable_unprepare(priv->mainck);
> >>> +       if (!priv->soc_data->keep_clks_on) {
> >>> +               clk_disable_unprepare(priv->gck);
> >>> +               clk_disable_unprepare(priv->hclock);
> >>> +               clk_disable_unprepare(priv->mainck);
> >>> +       }
> >>>
> >>>           return 0;
> >>>    }
> >>> @@ -269,14 +266,23 @@ static int sdhci_at91_runtime_resume(struct dev=
ice *dev)
> >>>           int ret;
> >>>
> >>>           if (priv->restore_needed) {
> >>> -               ret =3D sdhci_at91_set_clks_presets(dev);
> >>> -               if (ret)
> >>> -                       return ret;
> >>> +               if (!priv->soc_data->keep_clks_on)
> >>> +                       clk_prepare_enable(priv->hclock);
> >>> +
> >>> +               sdhci_at91_set_clks_presets(dev);
> >>> +
> >>> +               if (!priv->soc_data->keep_clks_on) {
> >>> +                       clk_prepare_enable(priv->mainck);
> >>> +                       clk_prepare_enable(priv->gck);
> >>> +               }
> >>>
> >>>                   priv->restore_needed =3D false;
> >>>                   goto out;
> >>>           }
> >>>
> >>> +       if (priv->soc_data->keep_clks_on)
> >>> +               goto out;
> >>> +
> >>>           ret =3D clk_prepare_enable(priv->mainck);
> >>>           if (ret) {
> >>>                   dev_err(dev, "can't enable mainck\n");
> >>> @@ -344,9 +350,10 @@ static int sdhci_at91_probe(struct platform_devi=
ce *pdev)
> >>>                   return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck)=
,
> >>>                                        "failed to get multclk\n");
> >>>
> >>> -       ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> >>> -       if (ret)
> >>> -               return ret;
> >>> +       clk_prepare_enable(priv->hclock);
> >>> +       sdhci_at91_set_clks_presets(&pdev->dev);
> >>> +       clk_prepare_enable(priv->mainck);
> >>> +       clk_prepare_enable(priv->gck);
> >>>
> >>>           priv->restore_needed =3D false;
> >>>
> >>> --
> >>> 2.55.0
> >>
> >
> >
> > --
> > Robert Marko
> > Staff Embedded Linux Engineer
> > Sartura d.d.
> > Lendavska ulica 16a
> > 10000 Zagreb, Croatia
> > Email: robert.marko@sartura.hr
> > Web: www.sartura.hr
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

