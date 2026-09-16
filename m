Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2D6C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ggb+PcHRJDo/Cz5nvBOFJMC2dQF5gLYbmIeM6Iqn8Mw=; b=UFHVeSeMY3A34Fbvz6l0qNh34w
	pvSahDIKfKW3TqwSkKKoaiGle1G10/FLtWrzL5C/H7C/nPw5O13K9ljPzhOkWe5RyjvAFEnKRXJG+
	/XS+aDE6QENDQyX3icSiRUM3rQk+V9pZlney10IR8ltQnxgKVadelGcFV4okdI59GKkFIjc73m72Y
	baMuC+GurE6ZH1S5c4YX1mqbLn9E08IkZ8pUKH0uEwOzb/NciwG+3JS8SecAyzpcIlcubNcOSIdmp
	mcItLD+8norwJnDqT+cT4pKSC5k/fXebSN94VVSsuqavXBKzJLKJl1iKo/Ie8I8KQb04yZVL2R/OW
	WNmrT4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6spV-00000009mto-3OOP;
	Wed, 16 Sep 2026 16:49:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6spU-00000009mtV-2usO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:49:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 12BD7601FD
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9AC1F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577391;
	bh=Ggb+PcHRJDo/Cz5nvBOFJMC2dQF5gLYbmIeM6Iqn8Mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HHEKiZSqg7+GyH1kW7u2Hjh6n954PQBWjugWOQSucOvoJpAfVng+ngPvsQ9NcH4mi
	 xtk7OuOd/JleKPjNisP2KjwOjHIlYAmHsKORnWbSLqnopk/P8kruswK9aha5jKrh2h
	 T5+u99gibJ/LLILgQgGSpKR/8Olwo6hpZbKotqNrJYNTrMVnF8YOJ9y+Y6i4ALwW4H
	 C6w1r6Db2dXNgKyLToIc40EzB8gYnT8NftrmIEs6OAPDomnrsefuQKe0nCSYGQfS55
	 ndgO1nZRsZEjKDvPuli5DD2CV2kvHzdB3pu0VtMl2TRvS1qfTm7mjpI/uYPSwFuoyo
	 g+RkIzLA2y8Fg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so1120198e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:49:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByl0IDzZOeTVcObp/nNQrpuIzfu2mwtVdr4CUn4466h6vw/TfyKioMyAQDvfYd1BsNOZuuiKKt+CzdA0Sf3zocz@lists.infradead.org
X-Gm-Message-State: AFuF++kCtYYgy+frUhxnmD5UUMsQNog+aWoRs8LhLxFgRXv0VUtz2YHR
	4G/5+x1SSxy6IpZByztKLxmrJLezTSBKNg6UnHGfKGWSMrzdGTcCtQIlKgalPtBVYWc+wVolOax
	FdGKEJLIXhPetyczbmZV838oisGssZ0A=
X-Received: by 2002:a05:6512:1595:b0:5b6:422:a61c with SMTP id
 2adb3069b0e04-5b8b666eb43mr1907989e87.28.1789577390371; Wed, 16 Sep 2026
 09:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-3-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-3-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:49:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHa+1e0N8V0znwzeTZSX1Y5YDAa=cVKSYjeFpZM0o_OQ@mail.gmail.com>
X-Gm-Features: AcwNN1Whb6PQ06lQN_GxsWNtotsS8LqxjoSrqgaYpOWlLWlGsW2D5EFYiCtujyY
Message-ID: <CAD++jLnHa+1e0N8V0znwzeTZSX1Y5YDAa=cVKSYjeFpZM0o_OQ@mail.gmail.com>
Subject: Re: [PATCH 02/14] mfd: remove unused rdc321x southbridge support
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
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
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 9, 2026 at 3:22=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The rdc321x was a 486-class SoC developed by RDC. While RDC's later
> products closely resemble the DM&P Vortex86 product line and are still
> sold under both names, I checked the datasheets for those and found that
> the GPIO and WDT blocks on them are incompatible with the rtc321x.
>
> Remove this driver, as there is no way to run Linux any more on the
> older chips after i486 support has been removed.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

