Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49691C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 22:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTcVu3N5A2qxImNE8jx0tO9sA0vxx21QZu6VSH0wmU4=; b=h5r15NDmqfgjBnW3k2D0UwkyVN
	37eFLF3J507YpGCQOcRirmVMyMCIxAXhcaqZuxhu3HegucwjLeKhhrwVCV8RemtDP61LP0uWEIIHM
	58Ax6sBwTZZj7Hdfzj0hOxiY5EJsrEJTXOC32+PvHXkKXvQ92ehTbhOLQvlaC5ybNeIwT/Cw3P9xm
	BjoGEkY3z+n0h/qEcRo94XqYc8fgNw9JFfP0Cyl2WEhrbmI1W4xedYYHTvyO7b/eGFg5dhZHX3yR2
	UZ/Cr/6rmc9qVf8EBn5HwK3dAqhR++Q31m3qBFqIb5GLJv7ymzSAXNBnaWmx4k1lXbDbn+FmwqftR
	JWvW+8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegvW-00000000J9x-0qQL;
	Tue, 30 Jun 2026 22:27:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegvT-00000000J70-2fjG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 22:27:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 806C443E6C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641571F0155C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858450;
	bh=TTcVu3N5A2qxImNE8jx0tO9sA0vxx21QZu6VSH0wmU4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a3nZipE5rJA5y3N4Pt43hJP+a36yVR5xrcMfyXU20kSXL/EMJ9K0p232l6Wre9wwp
	 XZGaTAaW+es9sgk2ARLIAXeZYTEfZEKo5NkLTX00wcwnR0btmfhuX2qmDgsgRcXS/Q
	 BaQDKyMcLqkohVenN5e9fDl+zIbBLwde996RnNIGz3h3eKEQE15LGapkSZsv9IMD0m
	 Iqoina2XyIvqZEumLIqhlDlgyvjWqtUVlH/1DwkhbLX9mv9yy2rvdW7YtvW9bGvLLU
	 x9VHYe8+Vd4Yjn/Rs6RW4nQMcWgQ6Jl5XlPCKLmcmP5L7dbjrZpWPH2Edj+0omjQhI
	 Ur0N2LFTC6dYA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebfa21c62so1179836e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 15:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RppN/I7cQZ5pFuNmN/KGigiXxayxS7e0NlYs8KACru0nR+NtqibGTOu2SvAvnBnMEEJq/pbWGBXyG54BCXaL9Cl@lists.infradead.org
X-Gm-Message-State: AOJu0YyUAQmwxQJItl1+EilO7g7xqd5X5lsYSZColaP/DcXQnQwOmnFG
	C3IYeqFohVBgkhwo0bPd/CW1blkmoSnmd7hxNB7NWVtbyWJbRFR83xCiZroBiokqk39aeFFoBOB
	OqfkbAj4v9i7QZmuhyv6s98tIq7ShyWg=
X-Received: by 2002:ac2:4bd0:0:b0:5ae:a2b5:3ae3 with SMTP id
 2adb3069b0e04-5aebdbb32bdmr1526007e87.29.1782858449161; Tue, 30 Jun 2026
 15:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com> <20260630092406.150587-6-manikandan.m@microchip.com>
In-Reply-To: <20260630092406.150587-6-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:27:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLmURCUfQNoTgLeTRtxfoWxgyPcmHv6rJpmB1gXWFL+NGA@mail.gmail.com>
X-Gm-Features: AVVi8CfX0Qclfl00TlhG9NPtI9hB9ExKc-14XAFH9ZzPrWiRzE1N9YyLdRCBq80
Message-ID: <CAD++jLmURCUfQNoTgLeTRtxfoWxgyPcmHv6rJpmB1gXWFL+NGA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] ARM: dts: microchip: sama5d27_wlsom1: use
 fixed-partitions for QSPI flash
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
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

On Tue, Jun 30, 2026 at 11:26=E2=80=AFAM Manikandan Muralidharan
<manikandan.m@microchip.com> wrote:

> Move the QSPI flash partitions under a "partitions" node with the
> "fixed-partitions" compatible, as required by the current MTD partition
> binding, instead of declaring them as direct children of the flash node.
> No functional change.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

