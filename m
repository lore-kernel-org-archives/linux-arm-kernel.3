Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83FDC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Oal8utCZ08ILyHyFTz/wIyOgD/RRDeQUzHjyhfMLf8=; b=rX6s0rRg9iPQqq4Jw9U+ZEl8wA
	gIinSmzXLiFahjCoQwTth6CpJ2ehSBzv3XbWps45Od4ttDzqsJN9TVV8oVmj1woVZyaeaPSd231bV
	thD8lG2GuhUFkT8Ustlql8O5EXScAshOgggzI6VJ4aFnTkEWOe8EIdUs/FNY4BidpXmKfAdqzShYQ
	0o4RoZvVYQjw/NtiS/OcV33wgetiQ3iMuTxWq6QKdv9vyBH/QRJfr2zX3ykDz06ntXPm1aaUxzi+N
	VeSGMheR+kfsIWPv1cs1dJRyAJckMrPpqdmvgD3xuWQk4A4ktnU3vGR3x6U73gr0H1RxU4pCgbKTq
	4toTZH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBib-00000002ToE-2u5x;
	Thu, 20 Feb 2025 18:56:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBh6-00000002TQn-2TGz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:54:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38f488f3161so638728f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 10:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740077683; x=1740682483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Oal8utCZ08ILyHyFTz/wIyOgD/RRDeQUzHjyhfMLf8=;
        b=IcpxCXXVDCQ/XuEOq/N9emwyEJD/SWV3JUuzs49UdiJ1X3ThnUSyOE/Sew4pZ9GJRG
         MrlvwsOXdj3C838k59+dkRkz6Mb+ZKg3QRgmw2Kc1aBhrXCo4nPv8qQs1cXOLWkinVmX
         NkrWJsBNDM1A+UVR3vvnB1aC5C3p0MrImxjZ9m12PKF11TlXhS++HDnijmZti208AHe1
         5HMio+hSZOBF6EC/engNHbPd/mr3qMkqE36WAevmEGKsl1IlGv41RVevGRkZuzLVCwU2
         uCNLLTW3XrPBVUq/H0xsJl60khsyZ6qIC8XW74BtrV2/QIEmYyf2B3VQylzs+4h7eXCn
         rCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740077683; x=1740682483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Oal8utCZ08ILyHyFTz/wIyOgD/RRDeQUzHjyhfMLf8=;
        b=KrTigvLnXRL0LQonj4uGX8g9LK9EjhG0Ut+YcRmmphfmufLreXz6NvxofpvZ9ET30H
         lyPpXCJnW7VPvZr3QpngCMMA5lM3BjOjuCEJBus5qHU0xOJpE8Pz45NVILICARuLcJor
         c/ngX8KMsWbmpQC5RCXhAazHcH9zFWQ7qAG51s3giU9q6VbauvgQLcy1R/gfziNyTRwc
         ClseRNsfaLpPAKv7y0HcR61kbqnNxgzjLzDDBzWkFmNNrxDwD8As02TX8DAmlOgKO9Eb
         cyMDhxIAC0RkS/tyNCCMJdcCskIOxfaUA1HFaHIpE17ZtiWq0wd/0I7Xqay27fKx+4WO
         xh7w==
X-Forwarded-Encrypted: i=1; AJvYcCXN2JTk7+WOzVzRfv/pcIAZnF1nY8IcEP4mDthUkH2a8U0KkFlrtsxWzDn+xK3UxurxXjlm+ZgVRFctC8GXBopR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Q1aFuYQY0rUlyT4yjMbncy/wFE9y32921Z+tRuxygvy72KnR
	aj9Gwg3XeVpSrVHBCxI7Tf/rIWw4o0MxnYl6uGchD3v1X+t80+nR
X-Gm-Gg: ASbGnctYlL2UNTBUEIxAXMzKuY2S8NVLeFCFQM9SNyc06cnoVDnQyCaqGLcRbjxdF5c
	AkKyUm+1SvpiTqBwwOknRoTKcYCHwidly6tAalv5ahnfYiV/uYYhPtx6JBglM9vWVM2i5qYNZxY
	iJ6ATXXqRnUjKnjY8SrHvRj7Up9QDgT7YfA4qPY7ewKXLqgnzsBokRtEePZs7/6E+rcIF9kxkkB
	MgeqZ95dAgMrcfUEk4RZ2rzeX9M2dOjiSfpH6M43jzc1BRs6HLHgK4YffKU7KbFu4CIPS+vQ7Cw
	1OF1MHb7j38xZpSr62D9417/kT0sl9pXbyerdPv/DYNqR6OTskGyvzOpjW40vX02aYw=
X-Google-Smtp-Source: AGHT+IEz1kRSBdQaUNaxSf9Ymu++DD9XiW/gWiIlW5Kf9eF4M/t3Ayol4FGnQYUa8AygEQgkEekRPA==
X-Received: by 2002:a5d:6c68:0:b0:38f:3a89:fdae with SMTP id ffacd0b85a97d-38f6f0d7237mr322996f8f.46.1740077682854;
        Thu, 20 Feb 2025 10:54:42 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dab74sm21637846f8f.32.2025.02.20.10.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 10:54:42 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Regis Dargent <regis.dargent@gmail.com>
Cc: Regis Dargent <regis.dargent@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: sunxi_wdt: Allow watchdog to remain enabled after
 probe
Date: Thu, 20 Feb 2025 19:54:41 +0100
Message-ID: <3278560.vfdyTQepKt@jernej-laptop>
In-Reply-To: <20250214112255.97099-2-regis.dargent@gmail.com>
References: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
 <20250214112255.97099-1-regis.dargent@gmail.com>
 <20250214112255.97099-2-regis.dargent@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_105444_628182_E2404482 
X-CRM114-Status: GOOD (  21.93  )
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

Hi,

please send new versions as separate e-mail thread.

Dne petek, 14. februar 2025 ob 12:22:54 Srednjeevropski standardni =C4=8Das=
 je Regis Dargent napisal(a):
> If the watchdog is already running during probe, let it run on, read its
> configured timeout, and set its status so that it is correctly handled by=
 the
> kernel.
>=20
> Signed-off-by: Regis Dargent <regis.dargent@gmail.com>
> ---
>  drivers/watchdog/sunxi_wdt.c | 48 +++++++++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 3 deletions(-)

You should add changelog here.

>=20
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..0094bcd063c5 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_devi=
ce *wdt_dev,
>  		timeout++;
> =20
>  	sunxi_wdt->wdt_dev.timeout =3D timeout;
> +	sunxi_wdt->wdt_dev.max_hw_heartbeat_ms =3D 0;
> =20
>  	reg =3D readl(wdt_base + regs->wdt_mode);
>  	reg &=3D ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
> @@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_dev=
ice *wdt_dev,
>  	return 0;
>  }
> =20
> +static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
> +{
> +	struct sunxi_wdt_dev *sunxi_wdt =3D watchdog_get_drvdata(wdt_dev);
> +	void __iomem *wdt_base =3D sunxi_wdt->wdt_base;
> +	const struct sunxi_wdt_reg *regs =3D sunxi_wdt->wdt_regs;
> +	int i;
> +	u32 reg;
> +
> +	reg =3D readl(wdt_base + regs->wdt_mode);
> +	reg >>=3D regs->wdt_timeout_shift;
> +	reg &=3D WDT_TIMEOUT_MASK;
> +
> +	/* Start at 0 which actually means 0.5s */
> +	for (i =3D 0; ((i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] !=3D reg));=
 i++)

Drop parenthesis in condition.

> +		;
> +	if (i =3D=3D 0) {
> +		wdt_dev->timeout =3D 1;
> +		wdt_dev->max_hw_heartbeat_ms =3D 500;
> +	} else {
> +		wdt_dev->timeout =3D i;
> +		wdt_dev->max_hw_heartbeat_ms =3D 0;
> +	}
> +
> +	return 0;
> +}
> +
>  static int sunxi_wdt_stop(struct watchdog_device *wdt_dev)
>  {
>  	struct sunxi_wdt_dev *sunxi_wdt =3D watchdog_get_drvdata(wdt_dev);
> @@ -192,11 +219,22 @@ static int sunxi_wdt_start(struct watchdog_device *=
wdt_dev)
>  	return 0;
>  }
> =20
> +static bool sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
> +{
> +	u32 reg;
> +	void __iomem *wdt_base =3D wdt->wdt_base;
> +	const struct sunxi_wdt_reg *regs =3D wdt->wdt_regs;

Inverse christmas tree.

> +
> +	reg =3D readl(wdt_base + regs->wdt_mode);
> +	return !!(reg & WDT_MODE_EN);
> +}
> +
>  static const struct watchdog_info sunxi_wdt_info =3D {
>  	.identity	=3D DRV_NAME,
>  	.options	=3D WDIOF_SETTIMEOUT |
>  			  WDIOF_KEEPALIVEPING |
> -			  WDIOF_MAGICCLOSE,
> +			  WDIOF_MAGICCLOSE |
> +			  WDIOF_SETTIMEOUT,

Drop this change. WDIOF_SETTIMEOUT is already defined.

>  };
> =20
>  static const struct watchdog_ops sunxi_wdt_ops =3D {
> @@ -275,8 +313,12 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
> =20
>  	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
> =20
> -	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> -
> +	if (sunxi_wdt_enabled(sunxi_wdt)) {

Also check for IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED). This will
allow user to select behaviour via Kconfig.

Best regards,
Jernej

> +		sunxi_wdt_read_timeout(&sunxi_wdt->wdt_dev);
> +		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +	} else {
> +		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +	}
>  	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>  	err =3D devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
>  	if (unlikely(err))
>=20





