Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C265BC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qvI3Ij6pHot4GWpLZbVGJuwCMn3p13tzKFz475rd7w=; b=cSqpaCmuUZeA8r1+stZesKXtBw
	zAQs0dJP8KpLZqWFOxapCBBEizqUklTKTX7sG2CLRPVJ6RgEAARDCofXQXi18GWp2CUzaBUazOtl2
	EfQcuscju/FmQ9e2M/ypdGvgDoSEdFOrqT4PvdPzs8JRslYYzcl1gUVFcrHTZKR+oxpCsUEMbfIHG
	wjJwhKrypeXLEaHVOZUshc0RpWaVDG0w0JM2JigaLewJcODr6Oh4ypSdpjYcm7phl1kitVr7d5K2A
	iHdW+acwakdhkTnbJ+13gizDuRJqiT5B76ZvX9DjFS9EW8rdH+fWVn4fEHilwhdzezpZAEgFuzSDc
	H29jmXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IuG-0000000BsNX-06KJ;
	Wed, 09 Sep 2026 14:04:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IuB-0000000BsMB-3kpY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:04:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5240743F4F
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Sep 2026 14:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B14C1F01561
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Sep 2026 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788962643;
	bh=0qvI3Ij6pHot4GWpLZbVGJuwCMn3p13tzKFz475rd7w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=f7DiDcNgtX0V7nhexZdovTM5uwfD8FIy1VWToiVrwFCMZWT4ep6JgIAU9A08oRbCo
	 AN5nLWLvXgYJ0tGr6wFrfzd3rKYIkdLPqiBR0VzeQED0wp7YlqC4jeS1GMXkHG4/9n
	 rSRsC4A/6gdv9Gv8AQI600Wb6YYCblzz9DRARCproumk9co1hoW2WRhNGkDft6Tzax
	 PlG1ifpPiYVwdpSR8gZdxMUAGkHqzxn1Z4gwkjoqczWwZ1lp/WEsPxvp3bMaLysJ7f
	 oDPtMmEa6U0c/+EmoOFo4is5xc/9+yX8aTqSrj5Pdxa0aAdw1d0RPb3GcrSi18mgHW
	 RbsjrhA44gWCQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39ca300db70so45249031fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:04:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzkaTrAlMxHjkIuMV13Xw4Lj1ATF/cDk0AV6j4yDqiTyVswfWlk3/kIrlMexGo15fLMOUd4B2gr4fSX/x7hKadt@lists.infradead.org
X-Gm-Message-State: AFuF++n33mMTAS+ht7onlNv4GLgmTOk/Bj+Pu+zkyNwqreV0/BseGIGV
	MVa4wNkuUkR/RVCllv0yJb1sT5gpcTmmU8gMe6KMDcb9AwHI/famII0yEvxFPHHt0JYL8ear514
	QKY6I6y3u+oeyMS9cCKJKHGQl4dMTc+Do2wWwtxy7mA==
X-Received: by 2002:a05:651c:a103:10b0:3a4:973c:9387 with SMTP id
 38308e7fff4ca-3a4973c96fdmr5064251fa.26.1788962641476; Wed, 09 Sep 2026
 07:04:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:03:58 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:03:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260909132153.1596191-1-arnd@kernel.org>
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org>
Date: Wed, 9 Sep 2026 07:03:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfvwcvV7yvkXz_YikGxQ8M0_ajgGA3bf==ZpT_Z46v7EA@mail.gmail.com>
X-Gm-Features: AcwNN1US7FJNeFLdpa5M-NPN5cGI7wXmVw6SZ5lmp-9zPkwIPUzMBGaaTvwumLk
Message-ID: <CAMRc=MfvwcvV7yvkXz_YikGxQ8M0_ajgGA3bf==ZpT_Z46v7EA@mail.gmail.com>
Subject: Re: [PATCH 00/14] mfd: unused driver purge
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 9 Sep 2026 15:21:37 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> As part of my cleanup of old platforms, I had a look at all drivers that
> may have become unused because the last platform_data or DT definition
> was removed, or because of unmet Kconfig dependencies.
>
> These are all the mfd drivers I found. The first ten in the list
> actually turned out to have been unusable long before my series, and
> I have added explanations on how I determined this in each patch. The
> last four patches are still in use in linux-7.3 but become unused after
> my series [1] that I hope to get merged for 7.4.
>
> Somewhat unorthodox, I took a shortcut here and remove both the mfd drivers
> and the corresponding subsystem drivers (gpio, hwmon, iio, input, led,
> media, power, regulator, rtc, video, watchdog, asoc) in a combined patch,
> to simplify the interdependencies: removing just the mfd driver would
> leave unselectable or broken drivers in other subsystems.  I also have
> additional patches for each of the other subsystems, currently a total
> of 300 patches, many of which still need better testing or proper
> changelog texts.
>
> Please let me know if you all think this approach is ok, or if I should
> explode this further and turn these 14 patches into 70 individual ones
> by splitting them per subsystem.
>
> See [2] for the current state of the overall series.
>
>      Arnd
>
> [1] https://lore.kernel.org/lkml/20260908152808.3928630-1-arnd@kernel.org/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove-7.3
>
> Arnd Bergmann (14):
>   mfd: remove unused 88pm80x driver
>   mfd: remove unused rdc321x southbridge support
>   mfd: remove unused si476x driver
>   mfd: remove unused wm8400 driver
>   mfd: remove unused adp5520 driver
>   mfd: remove unused da903x driver
>   mfd: remove unused lp8788 driver
>   mfd: remove unused aat2870 driver
>   mfd: remove unused lm3533 driver
>   mfd: remove unused rc5t583 driver
>   mfd: remove unused wm8350 driver
>   mfd: remove unused mcp-sa11x0/ucb1x00 driver
>   mfd: remove unused menelaus driver
>   mfd: remove unused iPaq micro driver
>
>  .../ABI/testing/sysfs-class-backlight         |   11 -
>  Documentation/admin-guide/devices.txt         |    1 -
>  .../admin-guide/media/radio-cardlist.rst      |    1 -
>  Documentation/admin-guide/media/si476x.rst    |  160 --
>  .../admin-guide/media/v4l-drivers.rst         |    1 -
>  .../devicetree/bindings/regulator/88pm800.txt |   38 -
>  Documentation/hwmon/index.rst                 |    1 -
>  Documentation/hwmon/wm8350.rst                |   30 -
>  .../watchdog/watchdog-parameters.rst          |    7 -
>  MAINTAINERS                                   |   14 -
>  drivers/gpio/Kconfig                          |   22 -
>  drivers/gpio/Makefile                         |    3 -
>  drivers/gpio/gpio-adp5520.c                   |  169 --
>  drivers/gpio/gpio-rdc321x.c                   |  199 --
>  drivers/gpio/gpio-wm8350.c                    |  144 --

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

