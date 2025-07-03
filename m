Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12991C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xwCIJC2QTIguHbj6bfqmGbxCViDVvN8lzVJAHO5scQ=; b=XK6iDnKcL/wiGfVY70Qg6M2pes
	oHVY2RsXPrE/Gcg8yyP4HFN7pZ5rA9cx0i6weQGvVKvZJq285FIAPmlTMaYtMpXR/lTomHgF1/MN/
	XQ+tekPhM/Wppz2bASpnaFSaNIM/7Wcd9w6ZTAautVanbTOP4pcIMJWMQHFDRO+dE7eY3LeLmohLX
	dbS3apIRJVizxM5Pt7v+8SKC7+hqiXUBi/4TcUdq9U/YR3LZENyG3lYKv0Wwj0iaRLJ5ifZk/xtG1
	ySywmYbjpMh8Ygq9wcfDdQiHVXGTSXwU8Wv6cB3zoLTZy6NUqa+q2jMT4pgpao/5FT5U35yJMxRWe
	SNkgGg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMJG-0000000BuG4-3cFp;
	Thu, 03 Jul 2025 15:57:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKXJ-0000000BaQv-1pbs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751551415;
	bh=FpZLtZ9+kg2xfwMSODwaNlSk19qiCrhlb9UcLr8pDQM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EzFU7kBmDoOu3fC4oMWsBxPdYyWqgM2KbTgQG5ezlvt34ZcMaIxUdwADSU93UtylT
	 vmTj7RyC5Z6Q6C/BtYNM7WV9CB7tB/lCBrgbwrE940HxUmHT4UYhByragcmbx3W+gM
	 gDIWgxFxMptnJ3Qo1aPQ/U5O+TrUIoxx/Hx9nxxQvF/e30pIhlv3/YNFk5oQIKztsW
	 ROdncfWCRtWxmU5Kb7uwbTHrZCTVenLJ2xknl56dKA0XmXnu+DdYPQ8JHLRwshtJXe
	 +cEBl0cirn3EAo3Nv62UgZGWLgR7DEiXVLgJlFc/eziU1FLHvkCV1cYEejkAiEDCg9
	 gUQ0MXW7T6AwA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8f85cf092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A2D517E04AA;
	Thu,  3 Jul 2025 16:03:34 +0200 (CEST)
Message-ID: <026ab4ca4a237e84ce53bfa491bf27268b745fa8.camel@collabora.com>
Subject: Re: [PATCH v5 18/24] media: i2c: maxim-serdes: add MAX96717 driver
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Thu, 03 Jul 2025 16:03:34 +0200
In-Reply-To: <5fad0945-27a5-4c49-8f20-59c197fc1ba0@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <20250702132104.1537926-19-demonsingur@gmail.com>
	 <b591e7daf1e351fbfee181fcce399db08b28faf9.camel@collabora.com>
	 <5fad0945-27a5-4c49-8f20-59c197fc1ba0@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_070337_642864_4B70FAB1 
X-CRM114-Status: GOOD (  27.26  )
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

On Thu, 2025-07-03 at 15:31 +0300, Cosmin Tanislav wrote:
>=20
>=20
> On 7/3/25 3:16 PM, Julien Massot wrote:
> > On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
> > > Add a new MAX96717 driver that also supports MAX9295A, MAX96717F and
> > > MAX96793.
> > >=20
> > > Integrate it with the common serializer framework, while keeping
> > > compatibility with existing usecases, avoiding code duplication, and
> > > also enabling more features across all chips.
> > >=20
> > > Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> > > ---
> > > =C2=A0=C2=A0drivers/media/i2c/maxim-serdes/Kconfig=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 16 +
> > > =C2=A0=C2=A0drivers/media/i2c/maxim-serdes/Makefile=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 1 +
> > > =C2=A0=C2=A0drivers/media/i2c/maxim-serdes/max96717.c | 1685 ++++++++=
+++++++++++++
> > > =C2=A0=C2=A03 files changed, 1702 insertions(+)
> > > =C2=A0=C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max9671=
7.c
> > >=20
> > > diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i=
2c/maxim-serdes/Kconfig
> > > index cae1d5a1293e..648cb891eefe 100644
> > > --- a/drivers/media/i2c/maxim-serdes/Kconfig
> > > +++ b/drivers/media/i2c/maxim-serdes/Kconfig
> > > @@ -14,3 +14,19 @@ config VIDEO_MAXIM_SERDES
> > > =C2=A0=20
> > > =C2=A0=C2=A0	=C2=A0 To compile this driver as a module, choose M here=
: the module
> > > =C2=A0=C2=A0	=C2=A0 will be called max_serdes.
> > > +
> > > +config VIDEO_MAX96717
> > > +	tristate "Maxim MAX96717 Serializer support"
> > > +	depends on COMMON_CLK
> > > +	select VIDEO_MAXIM_SERDES
> > > +	select GENERIC_PINCONF
> > > +	select GENERIC_PINCTRL_GROUPS
> > > +	select GENERIC_PINMUX_FUNCTIONS
> > > +	select GPIOLIB
> > > +	help
> > > +	=C2=A0 This driver supports the Maxim MAX9295A, MAX96717, MAX96717F=
,
> > > +	=C2=A0 MAX96793 Serializers, which receive video on a MIPI CSI-2
> > > +	=C2=A0 interface and output it on a GMSL2/3 link.
> > > +
> > > +	=C2=A0 To compile this driver as a module, choose M here: the modul=
e
> > > +	=C2=A0 will be called max96717.
> > > diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/=
i2c/maxim-serdes/Makefile
> > > index b54326a5c81b..04abda6a5437 100644
> > > --- a/drivers/media/i2c/maxim-serdes/Makefile
> > > +++ b/drivers/media/i2c/maxim-serdes/Makefile
> > > @@ -1,3 +1,4 @@
> > > =C2=A0=C2=A0# SPDX-License-Identifier: GPL-2.0
> > > =C2=A0=C2=A0max-serdes-objs :=3D max_serdes.o max_ser.o max_des.o
> > > =C2=A0=C2=A0obj-$(CONFIG_VIDEO_MAXIM_SERDES) +=3D max-serdes.o
> > > +obj-$(CONFIG_VIDEO_MAX96717) +=3D max96717.o
> > > diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/medi=
a/i2c/maxim-
> > > serdes/max96717.c
> > > new file mode 100644
> > > index 000000000000..60b285e547b7
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/maxim-serdes/max96717.c
> > > @@ -0,0 +1,1685 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Maxim MAX96717 GMSL2 Serializer Driver
> > > + *
> > > + * Copyright (C) 2025 Analog Devices Inc.
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/gpio/driver.h>
> > > +#include <linux/pinctrl/pinctrl.h>
> > > +#include <linux/pinctrl/pinmux.h>
> > > +#include <linux/pinctrl/pinconf.h>
> > > +#include <linux/pinctrl/pinconf-generic.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include "max_ser.h"
> > > +
> > > +#define MAX96717_REG0				0x0
> > > +
> > > +#define MAX96717_REG2				0x2
> > > +#define MAX96717_REG2_VID_TX_EN_P(p)		BIT(4 + (p))
> > > +
> > > +#define MAX96717_REG3				0x3
> > > +#define MAX96717_REG3_RCLKSEL			GENMASK(1, 0)
> > > +#define MAX96717_REG3_RCLK_ALT			BIT(2)
> > > +
> > > +#define MAX96717_REG6				0x6
> > > +#define MAX96717_REG6_RCLKEN			BIT(5)
> > > +
> > > +#define MAX96717_I2C_2(x)			(0x42 + (x) * 0x2)
> > > +#define MAX96717_I2C_2_SRC			GENMASK(7, 1)
> > > +
> > > +#define MAX96717_I2C_3(x)			(0x43 + (x) * 0x2)
> > > +#define MAX96717_I2C_3_DST			GENMASK(7, 1)
> > > +
> > > +#define MAX96717_TX3(p)				(0x53 + (p) * 0x4)
> > > +#define MAX96717_TX3_TX_STR_SEL			GENMASK(1, 0)
> > > +
> > > +#define MAX96717_VIDEO_TX0(p)			(0x100 + (p) * 0x8)
> > This is a bit confusing, looks like this register address is valid for =
MAX9295a VIDEO_TX0
> > but not for MAX96717, VIDEO_TX0 (Z) is at 0x110.
> >=20
>=20
> See pipe_hw_ids field of max96717_chip_info.
> MAX9295A has pipes 0, 1, 2, 3, MAX96717 has pipe 2 only.
> Registers and strides are the same, just pipes are missing.
You are right my brain is just not really good for math today :)

