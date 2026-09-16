Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7D5C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPNoc/IlVGOzrz4AF5oUnZbB8ytSLfqRYFF3aP/E0sQ=; b=PT/L4SOyvNDxBTqUiUeYq4V4zi
	OTq8cmGnKD9vDWS/SauN1kK5/9YN8Ad1L1UqeSNBX3jSj/1G4iZazL7+43eTTbYyjiIMp7QYiVq0D
	MAv1Eys1IGxgc/2jVWNQa+bkirN24BQaXqIvzeeu85qLUrlMfa7RcQZQY4ROfE4xlYGD/YPpkLii2
	ccUCCzcHUWCBvmMl/Fnd9WaadUIXPbChebuA+hgIgMPfVLukUrbosYDusdcAkL/KUgK4bnsfajYki
	J8Kal2EYbG6POWCLK+Zc0QHSiNq8F3WM9HDTLufTxYkOOAW3mUjGwkqgFbxg06blDxJbb6uPFATp9
	mqkQhtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sqc-00000009n9e-0hAo;
	Wed, 16 Sep 2026 16:51:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sqa-00000009n9C-1QtY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:51:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EDB4443BC4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4E01F008A4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577459;
	bh=aPNoc/IlVGOzrz4AF5oUnZbB8ytSLfqRYFF3aP/E0sQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KDzpsTWg/z/5krxTobDbUSigXfKLPKN3GY+kPVHqBR7Qs64CjzbIot5CkPAxP2KI+
	 Upq0GS82M9H0w++Czaj9svBiDTIMQmYdYP/CnWtiPeFrOEHUujcdjRSLexmI83DV+8
	 d3OQKB1DCYTLA88vtfqbmhxp+3cXxscBoXEspNQE0qlsMYOfCwjg24mnoTiNgsl1/S
	 2qLgSSSaznjuc0hKlv6DMiusMtJMUHjJIhhSSySZ7vl9callQF4Q+5MgOlSemRyTDx
	 yueZt3Uscllvxw64KPLdcYhjZOLgiIXI50AcSMUhvVtuef5e/bhhcPutASFv5vSY+5
	 AtaQQrqZxPKdg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so1334927e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwl+1AjWZteVsW7h/A7r0Qvk5DssNssMUtoNBdnZQ2MCJxHjG8XCdwcHxnX4kUgzLE9nA9szp2yGgqBY/yAMaf3@lists.infradead.org
X-Gm-Message-State: AFuF++mggO1+DYM784gLjD9eachxJIw8rXrC1d09X190iJlW7FCwdyiz
	hDLlhx0sbxs1tuqAv+U0ixGQJtdUNcfhF7WPF8LJc97N7COouin0genn/hRIVrv2EshM1Cn3bgr
	5FEp3VxEAHqnDFGNl+IrSunAv+m1iJpc=
X-Received: by 2002:a05:6512:4023:b0:5b8:b419:c8ad with SMTP id
 2adb3069b0e04-5b8b6617917mr969995e87.17.1789577458536; Wed, 16 Sep 2026
 09:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-9-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-9-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:50:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=dBJNiZMwRfYtVXC=qfWEU8WY1DRRzDA1o9Ngsd_VRqg@mail.gmail.com>
X-Gm-Features: AcwNN1VWCbypMBp0nAwSnIVxOHs3QNpjZkwVGv_5Swi1QUA8mHWSb92JoMn3LYg
Message-ID: <CAD++jL=dBJNiZMwRfYtVXC=qfWEU8WY1DRRzDA1o9Ngsd_VRqg@mail.gmail.com>
Subject: Re: [PATCH 08/14] mfd: remove unused aat2870 driver
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
> This driver was apparently never used, as it has has no devicetree
> support and never had corresponding platform_data definitions.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

