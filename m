Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C28FC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezeJexvLdIAOyqaTRkV2GqCEVD2bATElU5AWxdy7c60=; b=f/6BfQEVr9AzBVh30NvmGFupuI
	JukK6RP2NPm5jReeibmU81W0u1u1rrXSJl1Gk+NrQfp0R9WbR8O6QIyazH4wVeuK7GNOtP9sEbnyp
	vSB6l7NGbzZyPpdxEI5KWN/8kyQZcghmYABW5K55N+BTIq5j8VuKdwXacslb+09VUS3ofPsJqiE1F
	oqfKVz+24cKQUFTCCdlGwnBqUuwXfZELmYR2pWOjTydY5WKDxcruXxo018oIpVgbmGSEZbtlsCq9v
	r74HJOifI9Lp+N/Evrya3Ag8e/KsOD2N0A0ql+ywNx0D07pVx+GQfN9LRwqyZw2TAIglHEaR286sh
	20RBAspg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPS3-00000002P5y-3vQg;
	Mon, 27 Jan 2025 13:46:55 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPQj-00000002OyT-1sE8;
	Mon, 27 Jan 2025 13:45:34 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdf300d07so2581902137.3;
        Mon, 27 Jan 2025 05:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985532; x=1738590332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezeJexvLdIAOyqaTRkV2GqCEVD2bATElU5AWxdy7c60=;
        b=WTUalK1h5S32W7za3nMmEIjyBeJ8xuUnGTQ0UMTI6/xUceHd705awpnTdgIzFbRwi0
         IMuy7EkZdy3/JOkNkCZBeg2TM2bJqpPpRbB2KbMdIQcMOikjR9FGdqbQafjHX8vwpc/L
         Ju8l4rtJTto0bQsbpl2Xq/G9TQnEpDTVCbU+i/z2O3egjYXth6UtsTstoDfxIWsyr+ns
         KZXiMhTaGKn5LEZC446mwsDZ/ceUYFDzldoBIcTu6OFieaFtBn/YbTJouhWDTkTbPYDC
         z2qz0WgDCp484+xAhEy4zmTF2qFzbdKLdOy0vjylUADv+VYLUYHn4/jz17ooJAhFkZpE
         k9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVT9fd421wmi4uNkJViQ0p7SmwGJ1/WLSNzl03SYjXcPlanqIxITNHbGScXewlmHqbnbtzVCzKurxfaIR0KqHhI@lists.infradead.org, AJvYcCXOApCdONMXASekip15cJRnO5yOBlzZ5PXC6O7mWFpMrYWrC3Q6qJ0SdZAuqRqjfZ7MzYF48czGe7YGYKAPVKU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxD5ztC9FEhe7N/e8iT6BXMMi0uZ1hR8jPblXmgw2LHU+YoLZg5
	Yd+svvA64fhiAIdDCKZc+xQISSmdfiCtJr9hVs1O0eyBUEsLIiOvdhugXY2RTSo=
X-Gm-Gg: ASbGncuszLeHNBxJbTbnVKJryWhbALhcKrrrcfbAp1fMRDhojsk35kWHFDLq7BJhT5J
	rRYCxt6TWzNfxiAYJys3+c4TigIo93j+pUduBbA7JRDO3KnmXKtqyiBGQJz1fmgYTNC7vgmvxvb
	AJfbmxAretobJN5WFwk1XX/8RPQg5zE0tNxXsg7OxG0CNKr+Qiaow4rU/RXmgQJSu53wtvLDizZ
	ggB+M35CQhABnZvJWQ9dBCAazEgVdRrZAVU3ZRFqdxQpHvceV2UIcIrU2+C6xbaxyDpMVjfeLhx
	mNyC3HRAwYJreIg4I7uhUN2i0lxmVMo+L6Y+30KY2V8=
X-Google-Smtp-Source: AGHT+IHw2VCrPNq5TRvsA6+mXJ5aziyIceNAgig8VeNMq3BbpIV6Lp1LYhyS1fVO+geyTqTgblbuHA==
X-Received: by 2002:a05:6102:c04:b0:4b6:d108:cac0 with SMTP id ada2fe7eead31-4b6d108ce5dmr27693802137.3.1737985531871;
        Mon, 27 Jan 2025 05:45:31 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9adb4bbsm1908103241.1.2025.01.27.05.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 05:45:31 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4b63d564e13so2464216137.1;
        Mon, 27 Jan 2025 05:45:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTgNZgUicnaFZ00PohzoclXwXDE4R20JeAJXPxxwwZ4dRGoWHLBbSl8FchnrF33JZEHuFyK8HDRvyqyiGQLkQ=@lists.infradead.org, AJvYcCWWyP0JcY31PLJ+tuctm+/fA0shVIka0clMntsVKBPUnNE2VElGLO3sd0If6a+Js69vSchQ9974P4xt6r+XAzrl@lists.infradead.org
X-Received: by 2002:a05:6102:a4a:b0:4b1:1b07:f7c3 with SMTP id
 ada2fe7eead31-4b690c77e0dmr34279786137.20.1737985531453; Mon, 27 Jan 2025
 05:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com> <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 14:45:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
X-Gm-Features: AWEUYZlEDDkC64B3GghXYxN7ZaYz24mUqfziFlSmlvrKqtJLvKHGpws7NZJvNqU
Message-ID: <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
Subject: Re: [PATCH RFC 14/14] ahci: sata_rcar: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans de Goede <hdegoede@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_054533_485060_691053FF 
X-CRM114-Status: GOOD (  21.97  )
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

Hi Raphael,

On Mon, 27 Jan 2025 at 13:46, Raphael Gallais-Pou <rgallaispou@gmail.com> w=
rote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks for your patch!

The subsystem prefix is "ata", not "ahci" (not all ATA-drivers are
AHCI-drivers).

> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -927,7 +927,6 @@ static void sata_rcar_remove(struct platform_device *=
pdev)
>         pm_runtime_disable(&pdev->dev);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static int sata_rcar_suspend(struct device *dev)
>  {
>         struct ata_host *host =3D dev_get_drvdata(dev);
> @@ -1005,7 +1004,6 @@ static const struct dev_pm_ops sata_rcar_pm_ops =3D=
 {
>         .poweroff       =3D sata_rcar_suspend,
>         .restore        =3D sata_rcar_restore,
>  };
> -#endif

If CONFIG_PM_SLEEP is disabled (e.g. m68k allyesconfig):

    drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_suspend=E2=80=
=99:
    drivers/ata/sata_rcar.c:936:9: error: implicit declaration of
function =E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98sata_rca=
r_suspend=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
      936 |         ata_host_suspend(host, PMSG_SUSPEND);
          |         ^~~~~~~~~~~~~~~~
          |         sata_rcar_suspend
    drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_resume=E2=80=99=
:
    drivers/ata/sata_rcar.c:973:9: error: implicit declaration of
function =E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98sata_rcar=
_resume=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
      973 |         ata_host_resume(host);
          |         ^~~~~~~~~~~~~~~
          |         sata_rcar_resume

>
>  static struct platform_driver sata_rcar_driver =3D {
>         .probe          =3D sata_rcar_probe,
> @@ -1013,9 +1011,7 @@ static struct platform_driver sata_rcar_driver =3D =
{
>         .driver =3D {
>                 .name           =3D DRV_NAME,
>                 .of_match_table =3D sata_rcar_match,
> -#ifdef CONFIG_PM_SLEEP
> -               .pm             =3D &sata_rcar_pm_ops,
> -#endif
> +               .pm             =3D pm_sleep_ptr(&sata_rcar_pm_ops),
>         },
>  };

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

