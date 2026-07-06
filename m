Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y64q1rOVJRV8XgnWzacRRJCI5ERmLc/qdiLuRcjP4a4=; b=12PkPpX7aLzEFDoUBcWu4XzG3r
	TWh3AC+z0PuDb0aNAARbFZn4U4UNUqCNQFOgtIkTsSqG+LncysaAUYCipf4ck50OTY52SkNc4rtiH
	p9EG/oGRd3xXbHkePs/Gl/cbOLbjuBILabD15PW8piPLP8eGljgv1yiEdEJI2lAERVDiD6ZFisZ5b
	Ruk7GNbWe+rXUi2ttm5pfMzwAvDeeUKG2GGihYCiD7eyh7O3XKaTCNZQB51EMiC4PfK4UzQrglsMd
	qMP3CaMowrxsoRgypv3GTPwZ+lU44T0XaoO6MYNifwvgbeYrRSZaf/DCBfBYokLGk7ExEa2pllHPY
	qnAW8nWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgg85-0000000C7su-2ha2;
	Mon, 06 Jul 2026 10:00:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgg82-0000000C7oh-2NAK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9FBE4083C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 10:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3E61F000E9
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783332041;
	bh=y64q1rOVJRV8XgnWzacRRJCI5ERmLc/qdiLuRcjP4a4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=a92Cx0Yx95nitvrpm9IZYZyQRkVgeDmk3TYr4cA44b1O1HGWIo9HO7YP3wUUo24i6
	 yJYW/nICKrSvZi1ftKhRbdtBCBAHG+2lvfSA3BUCyDpPUpfYaKOzOWIDC7PL8vyoMD
	 SSbdEffQNZcauKyVHfyGkC0q2vtaLf1Rrt0OOeU+UU9Ydi3DTU7X9Gcvh2D4srTjfl
	 Jxx5euA8t83wgJacLozCBxc117rpFle6XlrjBLK/kjxtHSmXjTOBLVVU1JWsVXcYeq
	 YGvZ8IpocYS8z9YsisiXpStKnElkBU3WZwyVc+KLqfh87/4qlrztuq/qvxHpGPbZre
	 4i67NEDHI+vWA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39af64026dcso22277351fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:00:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro+3EIlMbDgPg0MvQPwZWEBWS0VvQWiQiqrJlQSLVg4irff+xs+i4hBqNaGKRCcJh5dn3EUiz3SdGnigN0nelBP@lists.infradead.org
X-Gm-Message-State: AOJu0YyvFMpAuxxT4qHOCwh5CpnsFyoR3ei1Nm131edxf+51/BK4oRop
	9VBCyB1SGpGr9/WNMXIHHcdq0aSZWKaatr1JJQ8OpxeWs+/qfvvkM5PASbGnPCmZMrg2xkcMh5G
	SQasAQOX86613EK+SYkGNXKvQraHHICH63LKs0FGmrQ==
X-Received: by 2002:a05:651c:1987:b0:39b:8b6:2ef5 with SMTP id
 38308e7fff4ca-39b53dc2376mr16221831fa.37.1783332040596; Mon, 06 Jul 2026
 03:00:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 03:00:38 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 03:00:38 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
MIME-Version: 1.0
References: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
Date: Mon, 6 Jul 2026 03:00:38 -0700
X-Gmail-Original-Message-ID: <CAMRc=Meik0TZb0SVqOFNGq9rNxaTkUjoWDDyrUJ_jpeC6F-_+Q@mail.gmail.com>
X-Gm-Features: AVVi8Cd_vTiB1-2lXKJ5QQiOBjkZqXBIiW8idxZ7MnJk6oKjPDQqHOTb03-acoI
Message-ID: <CAMRc=Meik0TZb0SVqOFNGq9rNxaTkUjoWDDyrUJ_jpeC6F-_+Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] ARM: orion: convert legacy gpio-keys to software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>
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

On Mon, 6 Jul 2026 03:29:17 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> This patch series converts Marvell Orion and MV78xx0 board setup files
> from legacy platform data to software nodes with the eventual goal of
> dropping support for legacy gpio API and platform data from gpio-keys
> driver.
>
> The series registers static software nodes for Orion GPIO controllers
> during gpiochip registration in orion_gpio_init(), allowing board setups
> to reference GPIO controllers via PROPERTY_ENTRY_GPIO(). It then converts
> gpio-keys setups to software nodes across MV78xx0 and Orion5x boards
> (Buffalo WXL, DNS-323, MV2120, Net2Big, QNAP TS-209, and TS-409).
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> Dmitry Torokhov (7):
>       ARM: orion: register software nodes for GPIO chips
>       ARM: mv78xx0: buffalo-wxl: convert gpio-keys to use software nodes
>       ARM: orion5x: dns323: convert gpio-keys to use software nodes
>       ARM: orion5x: mv2120: convert gpio-keys to use software nodes
>       ARM: orion5x: net2big: convert gpio-keys to use software nodes
>       ARM: orion5x: ts209: convert gpio-keys to use software nodes
>       ARM: orion5x: ts409: convert gpio-keys to use software nodes
>
>  arch/arm/mach-mv78xx0/buffalo-wxl-setup.c     | 50 ++++++++------
>  arch/arm/mach-orion5x/dns323-setup.c          | 98 +++++++++++++++++----------
>  arch/arm/mach-orion5x/mv2120-setup.c          | 68 ++++++++++++-------
>  arch/arm/mach-orion5x/net2big-setup.c         | 94 ++++++++++++++++---------
>  arch/arm/mach-orion5x/ts209-setup.c           | 70 ++++++++++++-------
>  arch/arm/mach-orion5x/ts409-setup.c           | 69 ++++++++++++-------
>  arch/arm/plat-orion/gpio.c                    | 10 +++
>  arch/arm/plat-orion/include/plat/orion-gpio.h |  3 +
>  8 files changed, 303 insertions(+), 159 deletions(-)
> ---
> base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
> change-id: 20260704-orion-mv78xx0-swnode-9e94ae913a21
>
> Thanks.
>
> --
> Dmitry
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

