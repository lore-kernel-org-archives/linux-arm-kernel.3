Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B476CC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuqbMSXmKaVksZQ0mp9Ucbs7t4/StAc7bwI5H6qAaCU=; b=zG4h4gSWidEzpvCP6/jTLu4XPP
	6q73+C1zE8KnCvsht5NsC1HDPHoNx11/Ey5uNyP+6SA6Vz8OM77X9pnSiuUjHa4j5D2pnp7nIhRGU
	dhHwqmIsALI/XyiWFJC1/2C3LedwJ7WGjw1XYUP61jJvXhUFS/1S92JK28gyk54g7PGgyrr1XKA+5
	PKdbqVFjTQxAx5k39aSlEHkuwbZ3REUoxs2ztv8uC8nIG1MHm/Meewe2T8k9rDiGosBVSaH8iUhUa
	w4auc86AwHprZe1Eo+j3Iw45zebRqnPakqIjaPQwGcdN05M4s7ofyElUZ1yOCy7jOBrpdbah2sOOH
	rOL4mYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6svy-00000009oOF-2nqe;
	Wed, 16 Sep 2026 16:56:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6svw-00000009oNi-2y1S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:56:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A3A56022C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A551F008A4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577791;
	bh=fuqbMSXmKaVksZQ0mp9Ucbs7t4/StAc7bwI5H6qAaCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cg/A8+VC9E080TzyvTpxu0YnPUmsHYmEPc7xtw8lOlwVWQFVXT213KsByPqqSIU2I
	 YKezTVvqkqyFj8RCV6X6z796z+cgGL3/V6KKfDg+c71b1lvwwgWiG1EI1uwu/m3Th0
	 3PiWWmOGjEHneUgz6Si80Fbz7NLf7VJpVq/lxnf4hkRztmLGONXApvwq5Bj6ihxbnh
	 2DEb0f9/ARGDI62c/9rCPp7kYe7gh6X3Np4O26+gdKgWFKq9/xbV2rRVt1oCMkC32O
	 lt6rPATnGQ4rlLkFzK27Q7Nts5BzFzoK5WLviocUhwMjzceCEZEyQbrc9KdJxu4ARU
	 QjSSuos16jzVg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15d00so1184159e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:56:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwq01WhRI1HbiLrtz+9ZK1VRLVng/MFVKdmwpCT9WwbRQpP6Q8BNIxOuIYfWx6DWeg/qTYT2afYPY5zzPINLvkU@lists.infradead.org
X-Gm-Message-State: AFuF++lxyg+uRm+h4TTb5n/kWYuO2f7Ht0u8i5cWcWJjRIUIOIj/4WMm
	ssMk4NBcN6OmBq0bZm/l1XOId2cov6UVUBOAlVBuhhe605DIRZhejOFErVAoamgKu2OFXn4pZZV
	Pur8jb/PT4XqFeOT8Wf16GZ6p1yfvvcU=
X-Received: by 2002:a05:6512:3a96:b0:5b6:1a7c:59dc with SMTP id
 2adb3069b0e04-5b8b66504bdmr1056044e87.54.1789577790547; Wed, 16 Sep 2026
 09:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-12-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-12-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:56:17 +0200
X-Gmail-Original-Message-ID: <CAD++jL=LM2agPEcCxjtQuCNx4q7zqutFA6oDb61kKEDAADR4Vw@mail.gmail.com>
X-Gm-Features: AcwNN1Uahpnh6JEjJOB4HtYt7IIRQWlpnYcwXmBiixUkMQ8clPYYJyQ4xy80br8
Message-ID: <CAD++jL=LM2agPEcCxjtQuCNx4q7zqutFA6oDb61kKEDAADR4Vw@mail.gmail.com>
Subject: Re: [PATCH 11/14] mfd: remove unused wm8350 driver
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

On Wed, Sep 9, 2026 at 3:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This driver was used on the i.MX31 ADS reference board from Freescale
> and the smdk6410 reference board from Samsung. Both used platform_data
> based driver probing and are now gone from the kernel.
>
> Since probing with devicetree has never been supported by wm8350,
> it is clear that nothing can use the driver on an upstream kernel,
> and it is unlikely that anyone is still interested in a devicetree
> conversion, so remove it.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

