Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487A4C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2/IIP3n3Vq0jAraoBBXavMXEaBuRqCM8Y1vyh7jgZo=; b=xOlllIFdKYs62L
	kOmv6e1fD98OmvmZADqr+5zIPD9LzdeWBtu1+bCSv6HGGJ+ZoRVyftNy5Cgi+sNYa8cYYYyf9XN+E
	1ITXlbwb7/WBkusy/hDNlndfaiXyTldKyNWuCK6wrtHWEGR/IAIIfMgRB4483IJMEMPZoPqHDzDpS
	ka/7472SmWzyVjyPmPqUijj4v/xj6/Xmftvnql4fN75TzDYNqg7Ecu8Rvt1h3UHq1XuyJqxu7msEK
	Pqtl9IcjZcpRqnaAtk/5g01aa/25qFcK+ec4TPpPNge1QfaBCmM7nyNR5vsAdLj+NaMo8adL52D6O
	d8IZf8EiV0CiL8syQCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfywp-00000005xPN-2fZa;
	Thu, 06 Feb 2025 10:17:27 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyu9-00000005wzl-1apn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:14:42 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54412a7d75cso91518e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836879; x=1739441679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2/IIP3n3Vq0jAraoBBXavMXEaBuRqCM8Y1vyh7jgZo=;
        b=AkeNAHUSuG40DskQIJa8kyM9iXZrvMRuNQOGQb92g+ZEZD1dRHhAXURFjh0kB5R2Wx
         FwywEvKx1ZHy3euay1j3K7eTET1IqBrf1pvWveYtkRG9tk3XcG7JXRaMXaS/+s/3gVYw
         OEvaCNM/FlxNFx+IQiebAfS1+g10F1WnJNOzAyh771uBjvOgvaSAbFwuWmwH9F0PgmCL
         AiLIJ+fKH6UM/QsGzhw26EvAnmd3mhxk2dM+axutLVdHh9FdrKk1obf50Jjf1OLrylZ1
         rn0xo0KqD59hpqAb/ykLZ9j1neYo+TIpXkUPurd5ozKWGy2BhZJ87r2MN0QZHJbpGDIs
         2d4Q==
X-Gm-Message-State: AOJu0Yy2gdWq6Hyc9k6HwRlBNNwu4oC364dD2TqSz1zj5u9AYTJv0R9F
	3Hm7ttLmqdXT3xQQrmSC4YkeWVnzCH+RzHhSeQEIGDq3+pEUj2E/AJyvrp5o
X-Gm-Gg: ASbGnctaEgPGd235a5QHALQHGH1PkjuhUaZwZDImCJ0S/N/xJ7uPUvXmLNKJ6ps5yMX
	7+XknAg98UdDvTO5tnRcAagOqckNlv9FnS8H/Jkeztlhzeao+LbHBIEqtY3q+FdAhLdv/yUSatl
	fnpoxM0mSp7IUcsBHU8J3a5h/3seidn0lmYjs01di/cwcZckoRvg+9SqZZqJQn7UtkdwdLbN2yj
	uv/03BGFhDJQLNFM34ipaOfdMOKUWvPdIZkrMpg6l9QcLmbk0o/3f2WnLK56gcUXGqyj/wx6zLm
	p2MINpRkST3P3muHFK2aHGiIKrByfhncX/chhcC9xmx3wCgb
X-Google-Smtp-Source: AGHT+IGDQPZ5gMKi6b93TSK34/VQPJ0kC599Ayijejb3CgfTAscM3BUKn7/lFSwA+wiIJdR//apg6Q==
X-Received: by 2002:ac2:4850:0:b0:544:f67:f0d with SMTP id 2adb3069b0e04-5440f6711e4mr584526e87.17.1738836878771;
        Thu, 06 Feb 2025 02:14:38 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441055573asm95865e87.81.2025.02.06.02.14.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:14:38 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-307e00d6b09so2255131fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:14:38 -0800 (PST)
X-Received: by 2002:a2e:a912:0:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-307cf2ecc76mr23979521fa.4.1738836878292;
 Thu, 06 Feb 2025 02:14:38 -0800 (PST)
MIME-Version: 1.0
References: <20250206093956.46593-1-regis.dargent@gmail.com>
In-Reply-To: <20250206093956.46593-1-regis.dargent@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Feb 2025 18:14:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
X-Gm-Features: AWEUYZlm4gSn7cw1IB1gbPXGlwF-pdLLAGIdGOws-wlbxjHAlekI14cTphPxU20
Message-ID: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
Subject: Re: [PATCH]: watchdog: Allow watchdog to remain enabled after probe
To: Regis Dargent <regis.dargent@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_021441_419434_36A2936A 
X-CRM114-Status: GOOD (  32.42  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 6, 2025 at 5:40=E2=80=AFPM Regis Dargent <regis.dargent@gmail.c=
om> wrote:

Please format your commit subject correctly. See previous commits for
examples.

Please provide a commit message including justification for the change.
The message below already makes sense, though it could be made more
concise.

Please also include your Signed-off-by.

> ---
> The sunxi_wdt watchdog unconditionally stops the watchdog during probe (o=
n my Allwinner H616).
>
> What I want to achieve with this patch is to start the watchdog in the bo=
otloader (either manually or automatically), then boot Linux.
> The watchdog is about 16sec timeout maximum, while the full boot to userl=
and lasts about 90sec, and I want the board to reset if, eg.
> the rootfs cannot be mounted. So I need the watchdog to be handled by the=
 kernel during boot (which it can do pretty well).
>
> The thing is, the current driver stops the watchdog during probe, so it d=
oes not run during boot, and it also does not manages the "status"
> field, so the kernel would know that it must handle the HW watchdog.
> This avoids automatic reboot in case a problem occurs during boot (and fo=
r example handling in the bootloader).
>
> The driver should detect if the HW watchdog is already running during pro=
be and set its appropriate status bit to allow the kernel to handle the wat=
chdog pings itself.
> The call to sunxi_wdt_start/stop allows for proper driver and device conf=
iguration.
> By default, the kernel will then ping the HW watchdog at apropriate frequ=
ency, but the user can have it stop after a time with open_timeout paramete=
r.

                                                           ^ appropriate

Please wrap your messages under 80 characters per line.

>  drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..20fe7da445ea 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *w=
dt_dev)
>         return 0;
>  }
>
> +static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)

Make it return bool.

> +{
> +       u32 reg;
> +       void __iomem *wdt_base =3D wdt->wdt_base;
> +       const struct sunxi_wdt_reg *regs =3D wdt->wdt_regs;
> +
> +       reg =3D readl(wdt_base + regs->wdt_mode);
> +       return (reg & WDT_MODE_EN);

          return !!(reg & WDT_MODE_EN);
> +}
> +
>  static const struct watchdog_info sunxi_wdt_info =3D {
>         .identity       =3D DRV_NAME,
>         .options        =3D WDIOF_SETTIMEOUT |
> @@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>         sunxi_wdt->wdt_dev.max_timeout =3D WDT_MAX_TIMEOUT;
>         sunxi_wdt->wdt_dev.min_timeout =3D WDT_MIN_TIMEOUT;
>         sunxi_wdt->wdt_dev.parent =3D dev;
> +       if (sunxi_wdt_enabled(sunxi_wdt)) {
> +               set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);

Maybe also read back the current timeout? This should be done after
watchdog_init_timeout(), so ...

> +       } else {
> +               clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +       }

... you should just combine the if-else block with the one below.

>
>         watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
>         watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
> @@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>
>         watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
>
> -       sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +       if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
> +               sunxi_wdt_start(&sunxi_wdt->wdt_dev);
> +       else
> +               sunxi_wdt_stop(&sunxi_wdt->wdt_dev);

FWIW this is what the dw_wdt driver does as well.


Thanks
ChenYu

>         watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>         err =3D devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
> --
> 2.25.1
>

On Thu, Feb 6, 2025 at 5:40=E2=80=AFPM Regis Dargent <regis.dargent@gmail.c=
om> wrote:
>
> ---
> The sunxi_wdt watchdog unconditionally stops the watchdog during probe (o=
n my Allwinner H616).
>
> What I want to achieve with this patch is to start the watchdog in the bo=
otloader (either manually or automatically), then boot Linux.
> The watchdog is about 16sec timeout maximum, while the full boot to userl=
and lasts about 90sec, and I want the board to reset if, eg.
> the rootfs cannot be mounted. So I need the watchdog to be handled by the=
 kernel during boot (which it can do pretty well).
>
> The thing is, the current driver stops the watchdog during probe, so it d=
oes not run during boot, and it also does not manages the "status"
> field, so the kernel would know that it must handle the HW watchdog.
> This avoids automatic reboot in case a problem occurs during boot (and fo=
r example handling in the bootloader).
>
> The driver should detect if the HW watchdog is already running during pro=
be and set its appropriate status bit to allow the kernel to handle the wat=
chdog pings itself.
> The call to sunxi_wdt_start/stop allows for proper driver and device conf=
iguration.
> By default, the kernel will then ping the HW watchdog at apropriate frequ=
ency, but the user can have it stop after a time with open_timeout paramete=
r.
>
>  drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..20fe7da445ea 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *w=
dt_dev)
>         return 0;
>  }
>
> +static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
> +{
> +       u32 reg;
> +       void __iomem *wdt_base =3D wdt->wdt_base;
> +       const struct sunxi_wdt_reg *regs =3D wdt->wdt_regs;
> +
> +       reg =3D readl(wdt_base + regs->wdt_mode);
> +       return (reg & WDT_MODE_EN);
> +}
> +
>  static const struct watchdog_info sunxi_wdt_info =3D {
>         .identity       =3D DRV_NAME,
>         .options        =3D WDIOF_SETTIMEOUT |
> @@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>         sunxi_wdt->wdt_dev.max_timeout =3D WDT_MAX_TIMEOUT;
>         sunxi_wdt->wdt_dev.min_timeout =3D WDT_MIN_TIMEOUT;
>         sunxi_wdt->wdt_dev.parent =3D dev;
> +       if (sunxi_wdt_enabled(sunxi_wdt)) {
> +               set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +       } else {
> +               clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +       }
>
>         watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
>         watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
> @@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>
>         watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
>
> -       sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +       if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
> +               sunxi_wdt_start(&sunxi_wdt->wdt_dev);
> +       else
> +               sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
>
>         watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>         err =3D devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
> --
> 2.25.1
>

