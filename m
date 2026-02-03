Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F8BE8B37E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 23:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUtAEzuFZ3UXsgeYeGcULd0s9lsr291/wS31tUAYPQI=; b=AEhiopehFpZslmP/mIWs+rkY0N
	rLu6rCeKZwp1Bk+vg2xtsvEIVDf57juoW3sux0nHxC3rzBmw+c+qHGqyfc4abSPz1ZaIa8CLGi6Mp
	7hR9yUbLpe7DKP69aZlt/p2DcVXvdlQCgTGDVZtMWdpKTlZy1yVXlhsIl6x2BG7tpMf6Q4//7j0Vb
	f8xLMCFFzR6MGRtjZiEanv7xVAPtfWojP9teOGaMFkZXGBbeja3YFTyhJkexrAneVr3Q9ycEFLBvE
	jf1oOBLhOmoNwwZ+i6Zwt57iNP7HGq+fQh6dY3kAxZAnlDNBvTxO7iLvGO9aNDO6FM1YNsUCK267T
	DvsN6uJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQ4a-00000007aDw-1WrT;
	Tue, 03 Feb 2026 23:44:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQ4X-00000007aDP-0ZRV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 23:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63B62418A9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 23:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A99C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 23:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770162280;
	bh=MUtAEzuFZ3UXsgeYeGcULd0s9lsr291/wS31tUAYPQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ugcyN0RqC48lMQVC290mr54/cSG8mF5qG6qEw1bXtuEg1AHRMdgpEol4MTB4WYgbx
	 2xgqlBNWqkJckBepT2lyA7KPKwAVTR7exlJt6+nKU49bLYyk6a32A0JXHEgkYdX0JW
	 JdKy89rOSuHUxQGG36O3GomJnrxi8DRpkj9qqaL1u59b5X03z9pAKndSF27sExk6Mu
	 e+wEhvO8nkNb10Lh7E62jU/jKYzK+2n8Cn3jkoSu8teRtumFaYuuD7lBca1tjzvYHH
	 DNwMUzf8L2cy3eu0zdga38VJVA/+z07Ak3oWCQxVORf+z7cadCUrLBIMwDdqHvpyx/
	 3Nl558QdYMMaA==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64965ee303dso288785d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 15:44:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXUvbQgQbl+PqDf/101cN6FiNTO8pdu6su4zcrr3kjmA1vOI6zGL/+nzESl5Lu8gsgXlcc9SAGzCXqMmUdVrMVc@lists.infradead.org
X-Gm-Message-State: AOJu0YykfxmPU0sNPKGS73AcMSkrATkooGa3rCX3poTz3VMSeFmmTLF9
	H6hSuH5fwBwqLLpkfoOWDVMCnXqdtQDjJaNmmTSnydYhFiieISRnkiUNKr6soRmhC0UjGYzKEzO
	jDJcjsYZwP0tMNkTxqbsbN198kOrBai4=
X-Received: by 2002:a53:d8c6:0:b0:645:68cf:2bf4 with SMTP id
 956f58d0204a3-649db4ac96bmr877835d50.77.1770162279637; Tue, 03 Feb 2026
 15:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com> <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 00:44:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLmsx885MteExK0NcS6aD3BVimK82Z3bosSpUvSs8p4Cag@mail.gmail.com>
X-Gm-Features: AZwV_QjuysNBoHyalaty048gguXHT55tueRC1-zJSip9FADgZXaoN46HJGRIgaE
Message-ID: <CAD++jLmsx885MteExK0NcS6aD3BVimK82Z3bosSpUvSs8p4Cag@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_154441_213909_96CCFB10 
X-CRM114-Status: GOOD (  10.61  )
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

On Tue, Feb 3, 2026 at 5:21=E2=80=AFPM Thomas Perrot (Schneider Electric)
<thomas.perrot@bootlin.com> wrote:

> Add GPIO driver for the Aaeon SRG-IMX8P embedded controller. This
> driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
> that can be configured as inputs or outputs.
>
> The driver implements proper state management for GPO pins (which are
> output-only) and full direction control for GPIO pins. During probe,
> all pins are reset to a known state (GPOs low, GPIOs as inputs) to
> prevent undefined behavior across system reboots, as the MCU does not
> reset GPIO states on soft reboot.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>

Looks good to me!

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

