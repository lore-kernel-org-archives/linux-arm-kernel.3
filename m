Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDEEC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgzFISdebgyulnEYwPr3r7Dfr+yDo59RA9yogZZthtA=; b=UF9xX+3X6fT5gHHWMvEPQJ8rFX
	7+9xpxpnUMFEwA/bQJ7j1Nd65UJhCb02GEydL8tB+lBjggSOXV3eu7q6558raUY7dwiLNTlby/wjp
	5TytO8AbPhon2ATON45qklMzVS44tOxvcL8VLh0YYPDh8q4XBDI5phY/mkkQYj7wuGdu4GL9+bx/K
	l/aveFlPucmAEOdf8rPobAtVY2L3JSEz27TLLD+WLtoNUMdV8ClvG1RgIXQpU7Chs+QAic0aFoxkt
	hAekKOxLWQzTX6JK0DwIm9AQENaVeOsv3GTWvm5l3fbi5ASQnxDCW8MaGLC+jhCgFtNDhoyQHMOJT
	XcTTwQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kdh-0000000CfLh-3Nff;
	Thu, 17 Sep 2026 22:31:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kdg-0000000CfLX-1l7K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:31:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 20A4D40F36
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E821F00898
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684292;
	bh=sgzFISdebgyulnEYwPr3r7Dfr+yDo59RA9yogZZthtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FGJMKFVUkB9f4ceLcBhdlZWUbGYsNG7voSf7Xkw/ZKagmB9IotpZXjviNtCmLv4ry
	 WnjvZcTSIywFqGSEwuLV7fIzM67MNdptwXRQ7QUiUzxmWPEPXcMCCDRVtwIcamEu6G
	 K51ksKGYNXil7lvHuguELVihmri5DXTymzfGLZuYuBeVRTS2GXuuygsI77EevDsBoo
	 Gf/MrkHIWQkwlphH8S0Zu0+iVWJGD3oi8P3QSuXtkq7O6GnftIudf3hObiULlb7DJA
	 LsBPQyP21iXw5NdmpUvsvFLzt7dROMkb4agGDpnHT0IKn6QM07eT8dVNaeRHjyRmKp
	 riuEA5ebNgh3A==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso174336e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:31:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxC9FkhHzRiyPiy9lgWNjJs8Of6GfExL/6BlTCN2gewbkLROu8zxU6yDVqXha491NqSeqAL2Dj3ESHYUg+6XFSl@lists.infradead.org
X-Gm-Message-State: AFuF++l8WrHknVlZHKItH0gUB0YESUSHuI2dAjaxTO9Lh82iy/HQ3qrq
	TyiovYzpr7zYXASdpvYISfwTqa/k1ZS1a8QWA4HDTw0g6G4f3d/9iTm0usucE5DZal9kMwAmfnz
	k5PhSAxOLtsXhzJXkSKlqZG0P2kQM7QY=
X-Received: by 2002:a05:6512:33c6:b0:5b6:183c:5c9d with SMTP id
 2adb3069b0e04-5b8c1958e1fmr84452e87.59.1789684290738; Thu, 17 Sep 2026
 15:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260917155657.2200191-1-arnd@kernel.org>
In-Reply-To: <20260917155657.2200191-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:31:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=D+xCtWx_MX1jbBvByqypabFkFW_xp=2XpUfBb7wyGnQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vq4xrB9hQc50m54nmaYX1xnKUe4T5kma-lOihlY4UA7NShBSz8Spmt7nk
Message-ID: <CAD++jL=D+xCtWx_MX1jbBvByqypabFkFW_xp=2XpUfBb7wyGnQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: pxa25x: prevent ixp4xx + pxa25x combination
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Arnd Bergmann <arnd@arndb.de>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Thu, Sep 17, 2026 at 5:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The USB gadget driver is one of the holdouts of Arm single-platform
> support that conflicts with a multiplatform kernel. Trying to
> build this for both Intel PXA and IXP fails with:
>
> drivers/usb/gadget/udc/pxa25x_udc.c:144:9: error: 'UDCCS_IO_ROF' redefine=
d [-Werror]
>   144 | #define UDCCS_IO_ROF    (1 << 2)        /* Receive overflow */
>       |         ^~~~~~~~~~~~
> drivers/usb/gadget/udc/pxa25x_udc.c:141:9: note: this is the location of =
the previous definition
>   141 | #define UDCCS_IO_ROF    (1 << 3)        /* Receive overflow */
>       |         ^~~~~~~~~~~~
> drivers/usb/gadget/udc/pxa25x_udc.c:232:2: error: #error "Can't configure=
 both IXP and PXA"
>   232 | #error "Can't configure both IXP and PXA"
>
> Until recently this was not a problem, as ixp4xx was only big-endian
> and pxa is only little-endian, so these could never be in the same
> kernel image.
>
> As this has changed recently, an allmodconfig kernel for ARMv5 runs
> into the above failure. I don't think this is an important scenario
> in practice, especially as pxa25x support is already rather broken,
> so prevent this configuration using a Kconfig dependency, and
> rework the driver to allow a combined ixp4xx/pxa3xx kernel that
> only uses this driver on ixp.
>
> Cc: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

That's a reasonable fix. It's not like we would want an actual multi_*
kernel on these devices anyway.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

