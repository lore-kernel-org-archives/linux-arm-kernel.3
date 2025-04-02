Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4760EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9Yx8HGWWz6hgTPomrXgKhcRZgBSmV4fN3I8vYiFJco=; b=dLy0t6T6f+cvg+koG/rAeGksQj
	x631ySPG7/J/yWSKhPfGNVNKqOERqdWGt/lSaRh0V4UOcLYKdTT/llnnvw1Sb2vNi2rUMFsV+qjjz
	lWdJFD/WPwEAXPv1ecY+GFBSOsxwwH2MPGW5jDSSkfj4tco0u73QxsQiPDWStasKfVc5f4jv19Ks5
	w3/9eEAN8naTR+/te0HR0/CzMFXFt0fubRQTUNJUojmIMDFJggxscSDiQJY95nMrYG/70J7j3nsOq
	LlzcbmXk85ayhWz0Ahz5acVwuDOsoVhWe2g/np7rA9DG957/93w3FYe77w/kjxCEz/8WBoGzbzGrh
	ossvKr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwfF-00000005yq2-1wHF;
	Wed, 02 Apr 2025 11:53:49 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwW5-00000005x6q-0Ngr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:44:22 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so62526701fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743594259; x=1744199059; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9Yx8HGWWz6hgTPomrXgKhcRZgBSmV4fN3I8vYiFJco=;
        b=TwUrFgDldXa78SUIuIiAIwpqPYL/eK5cgPk+v6oWiujIwGiH9t8M5vic4adN7RuUgG
         mhBlv47UkyaTDw7JOewiekmu2n0d008ooshto4XULr1ZLcj7zTlyeQwawWvznuaWMCWb
         lUw++36EIC4j0icZ1OIBM+RyJQkG7YWM6Pp34ylAoXRNc8bV7c7NefhaOsDbRa87eCNg
         9ErdJcB1WeQRseKvF1IvPaxSItobrmqGjjk117hQZIHhhidzCQXqU4TOPKjTJQr2eLH5
         ZLK89XNKuYSDX/enRBOzGatutnlkD0qC2tSYrKQIMVyOkZRKHS9yJXQnVYQPW7xpyHzS
         +IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743594259; x=1744199059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9Yx8HGWWz6hgTPomrXgKhcRZgBSmV4fN3I8vYiFJco=;
        b=pPPxE6uHUX7aMsNG9CIfcXCtekAHiTnBN/NQShjF1xkx3mXHQT1b/tL24GDCvIIY1Y
         MfAXyRa6C5O/yUpvtNB3LHDqNsD5aDGlS/bB4YH/RSo/kEPd+9O45q/qohRcqQeM9eer
         tOQSqX3glMRCeKld/Gi4BGG1t1hasIoXItgpARBHy+9FW4jG7ErFCTzm1NHdrgnpVgaR
         7NmTE3P39MtRO2wWhtUqqbJJxAsYhAj0/hk05ziuFWOlNaJCXWrnGkJk5F3wZZ8aBvOp
         9ss3mOp4uGOzZNVYX2lQra83gn5il05g46wbhkKJfSzzqX4iqXsTJbz2l/fSG/RM05re
         DdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEr99Uaxml+rNAYhsStaQ0WaN/8JeUEyDoZTTV0M3Bh2mcTWEHk1TMPebDcdPDTwKY/CELGpGENi2iUS0vYLCL@lists.infradead.org
X-Gm-Message-State: AOJu0YzLggEB4+0sN8Pma13FCU6wgugzubRzwCzxQLECHUen5JwtTtiU
	n8nAt0Hv1zPdQ+wdpg4agTxiJRS0YQ21f36IRux9CYB9261xebqH6BcIh6iIyBZJgxbSJVM2yXQ
	VKeq0TkvcDJ5pmC/mlcmlLsUbFqhrRtpDlCS29g==
X-Gm-Gg: ASbGncv8aRtHc0VvI2aggSM94LcnXtXKS9crY8MHEilOV8OMmgz8+Vg/WbHRmJe452z
	4U1yGkwAg9NCtH8kpta0uz1GO7Ebn+ZScdtym+2zFAH1caWMnpox+DIDV06hM5DgZsBGpkgrSeC
	GZS+iBUK4de2r0EbW75lkRx5+5g3cgQGIAQdNIHKYh+ZK6WPIPqDbGvKZn2A==
X-Google-Smtp-Source: AGHT+IHW/kGqImrLP2FvLwHemjcshG451ryY8vcg74Qlr22qJBaIDv63Gcij3j/k2qFPQPNOKFQ4n1acyWCMv+TErZQ=
X-Received: by 2002:a05:651c:98b:b0:30b:963e:9b1a with SMTP id
 38308e7fff4ca-30eecd3b6c8mr23076271fa.23.1743594255916; Wed, 02 Apr 2025
 04:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250401233603.2938955-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250401233603.2938955-1-florian.fainelli@broadcom.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Apr 2025 13:44:04 +0200
X-Gm-Features: AQ5f1JpN-sWsvmePPYG3vEIc3GLu6mXVKUC_Me1qpDGqIHgBjPryChV7V6bxiug
Message-ID: <CAMRc=MeiALzO3XAmH9BLjxrB3EA1br1tpzHd5Qucw2NCVQ2q7g@mail.gmail.com>
Subject: Re: [PATCH] spi: bcm2835: Restore native CS probing when
 pinctrl-bcm2835 is absent
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_044421_121946_89150696 
X-CRM114-Status: GOOD (  32.35  )
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

On Wed, Apr 2, 2025 at 1:37=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> The lookup table forces the use of the "pinctrl-bcm2835" GPIO chip
> provider and essentially assumes that there is going to be such a
> provider, and if not, we will fail to set-up the SPI device.
>

Yeah, the consumer driver itself is an unfortunate place to define the
provider data. This could potentially be moved to gpiolib-of.c quirks.

> While this is true on Raspberry Pi based systems (2835/36/37, 2711,
> 2712), this is not true on 7712/77122 Broadcom STB systems which use the
> SPI driver, but not the GPIO driver.
>
> There used to be an early check:
>
>        chip =3D gpiochip_find("pinctrl-bcm2835", chip_match_name);
>        if (!chip)
>                return 0;
>
> which would accomplish that nicely, bring something similar back by
> checking for the compatible strings matched by the pinctrl-bcm2835.c
> driver, if there is no Device Tree node matching those compatible
> strings, then we won't find any GPIO provider registered by the
> "pinctrl-bcm2835" driver.
>
> Fixes: 21f252cd29f0 ("spi: bcm2835: reduce the abuse of the GPIO API")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/spi/spi-bcm2835.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
> index a5d621b94d5e..5926e004d9a6 100644
> --- a/drivers/spi/spi-bcm2835.c
> +++ b/drivers/spi/spi-bcm2835.c
> @@ -1226,7 +1226,12 @@ static int bcm2835_spi_setup(struct spi_device *sp=
i)
>         struct bcm2835_spi *bs =3D spi_controller_get_devdata(ctlr);
>         struct bcm2835_spidev *target =3D spi_get_ctldata(spi);
>         struct gpiod_lookup_table *lookup __free(kfree) =3D NULL;
> -       int ret;
> +       const char *pinctrl_compats[] =3D {
> +               "brcm,bcm2835-gpio",
> +               "brcm,bcm2711-gpio",
> +               "brcm,bcm7211-gpio",
> +       };
> +       int ret, i;
>         u32 cs;
>
>         if (!target) {
> @@ -1291,6 +1296,14 @@ static int bcm2835_spi_setup(struct spi_device *sp=
i)
>                 goto err_cleanup;
>         }
>
> +       for (i =3D 0; i < ARRAY_SIZE(pinctrl_compats); i++) {
> +               if (of_find_compatible_node(NULL, NULL, pinctrl_compats[i=
]))
> +                       break;
> +       }
> +
> +       if (i =3D=3D ARRAY_SIZE(pinctrl_compats))
> +               return 0;
> +
>         /*
>          * TODO: The code below is a slightly better alternative to the u=
tter
>          * abuse of the GPIO API that I found here before. It creates a
> --
> 2.34.1
>
>

The fix is good for now but I'd still try to move this out of the
driver at some point.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

