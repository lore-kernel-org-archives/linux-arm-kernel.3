Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D157C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeHFLkjfWtRxfDUQFOy9gyg8C+i7BEnpkwJhjjc+Qik=; b=yC4F28EBdNGolvErtni9Tcjt5L
	TcrQ7MjB/3xPuIei5SsI8J1Z92st69QkfTCTtC3ikmiEbsS0P9pt5H6kTvcVsFf6FQjzlrN8rQx5Z
	bJ6U3Fenu6P6V/e6j0atFiUYaTUlrFKE+Ao8WQN/XCztApvmV4HwkAgRZTi0lr7prnPyxyppUF+Ol
	VR6bkdF58RMqYylDpYK2M1kxJISxmRdlr45TPmoYwFnjuNhh9WC1hP1cHsV0ZOyj41Z1Pz3FewJtc
	J1kNwymSYrYAUx5i/L6g1kOl8jYZiVXO/ao8Ak27JBLLieShE8W7NFBjZhcbyv01CUH9ikERrvOA3
	WMy8j3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZHw-00000002S43-0uHA;
	Wed, 05 Feb 2025 06:53:32 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZG7-00000002RtR-0PPl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 06:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738738299; x=1770274299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KeHFLkjfWtRxfDUQFOy9gyg8C+i7BEnpkwJhjjc+Qik=;
  b=n0f+/OAg9wOEQS2qDmC8Y7ZK30IV7yGITwnHOcRaYWF2UTwXPKmJPGNK
   jmedAawND2rN8UI1e5TevfBASW4zPi9/BD8hRBQH04H/WHM2yf9LPd9oS
   YVdRuWf0xYj9iJ/DdTobdSBOeU9m09Z3IxqnOqPy4UZCLzN7ZSM7Ap8j1
   WMYbkIng4HlhWRAzuyQUYaPenKdxQo+n3lHqHO/zEy/3N1GKsk5HNa5yV
   IxF3kWxnLuz1MeT3kbY9L7j/k7vWiNwbzDBIcszllRczndK9GEpAJbIr/
   OM0Q/k7XPf3tPhm7O8ZbcT2uYIzxUqxaMkDQTCw94z7CLIGFF2CV2lgIX
   g==;
X-CSE-ConnectionGUID: qXX3ANZUTFGznOjv2F6fwQ==
X-CSE-MsgGUID: CvaGeVioTTKTcoJs2PiBKg==
X-IronPort-AV: E=Sophos;i="6.13,260,1732575600"; 
   d="scan'208";a="41557887"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Feb 2025 07:51:32 +0100
X-CheckPoint: {67A30A74-1-C6D8D88D-F91F9E6B}
X-MAIL-CPID: 97E800B69666A87223C2F728F94B1646_2
X-Control-Analysis: str=0001.0A682F29.67A30A76.0429,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C89E0160ABA;
	Wed,  5 Feb 2025 07:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738738287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KeHFLkjfWtRxfDUQFOy9gyg8C+i7BEnpkwJhjjc+Qik=;
	b=KQF44lI123mj3JI+bf1eNCEaDG/8mACwABZMZTbulko216vyebIMHv/cs1YCtv9nquxibY
	pCX2ncwQbFbh1gKAYpIOhwy9+2QJMXch0x0twjmFmKD9a/T5W5w0pLxC7x0xJ8UTJ+Jwrs
	zpkg9dv0FWNO4wEnGX1TZfh0fch/Wacc0HD2s1pMFy+o8J+QfDtCVujLIICSK8XX1PMy10
	v44b6FbQtSK2ZJwAl2DFMlqhEPtfCAi7zrMSLxrvzeDWso1pZNLygVQdD1twcbIxy5CH6U
	+JcjuC7fds99m02Uqwi2WGePQfZecM6qRukJYTCZ9hSBM7uzYb58gdDNUG56vQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] nvmem: imx-ocotp: Support accessing controller for i.MX8M Nano
Date: Wed, 05 Feb 2025 07:51:23 +0100
Message-ID: <6396921.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z5z0/382k8MkcZpP@lizhi-Precision-Tower-5810>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com> <4961006.GXAFRqVoOG@steina-w> <Z5z0/382k8MkcZpP@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_225139_622632_95C67C0B 
X-CRM114-Status: GOOD (  33.95  )
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

Am Freitag, 31. Januar 2025, 17:06:23 CET schrieb Frank Li:
> On Fri, Jan 31, 2025 at 02:54:06PM +0100, Alexander Stein wrote:
> > Hi,
> >
> > Am Donnerstag, 30. Januar 2025, 17:42:32 CET schrieb Frank Li:
> > > On Thu, Jan 30, 2025 at 02:01:00PM +0100, Alexander Stein wrote:
> > > > i.MX8M OCOTP supports a specific peripheral or function being fused
> > > > which means disabled, so
> > > >  - Introduce disable_fuse for a list of possible fused peripherals.
> > > >  - Iterate all nodes to check accessing permission. If not
> > > >    allowed to be accessed, detach the node
> > > >
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > >  drivers/nvmem/Kconfig     |   3 ++
> > > >  drivers/nvmem/imx-ocotp.c | 105 ++++++++++++++++++++++++++++++++++=
+++-
> > > >  2 files changed, 107 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > > > index 8671b7c974b93..ba5c928cab520 100644
> > > > --- a/drivers/nvmem/Kconfig
> > > > +++ b/drivers/nvmem/Kconfig
> > > > @@ -84,6 +84,9 @@ config NVMEM_IMX_OCOTP
> > > >  	  This driver can also be built as a module. If so, the module
> > > >  	  will be called nvmem-imx-ocotp.
> > > >
> > > > +	  If built as modules, any other driver relying on this working
> > > > +	  as access controller also needs to be a module as well.
> > > > +
> > > >  config NVMEM_IMX_OCOTP_ELE
> > > >  	tristate "i.MX On-Chip OTP Controller support"
> > > >  	depends on ARCH_MXC || COMPILE_TEST
> > > > diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> > > > index c5086a16450ac..e3ea026a37d0d 100644
> > > > --- a/drivers/nvmem/imx-ocotp.c
> > > > +++ b/drivers/nvmem/imx-ocotp.c
> > > > @@ -23,6 +23,7 @@
> > > >  #include <linux/of.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/slab.h>
> > > > +#include <dt-bindings/nvmem/fsl,imx8mn-ocotp.h>
> > > >
> > > >  #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address o=
f the
> > > >  					       * OTP Bank0 Word0
> > > > @@ -91,11 +92,20 @@ struct ocotp_ctrl_reg {
> > > >  	u32 bm_rel_shadows;
> > > >  };
> > > >
> > > > +#define OCOTP_MAX_NUM_GATE_WORDS 4
> > > > +
> > > > +struct disable_fuse {
> > > > +	u32 fuse_addr;
> > > > +	u32 mask;
> > > > +};
> > > > +
> > > >  struct ocotp_params {
> > > >  	unsigned int nregs;
> > > >  	unsigned int bank_address_words;
> > > >  	void (*set_timing)(struct ocotp_priv *priv);
> > > >  	struct ocotp_ctrl_reg ctrl;
> > > > +	u32 num_disables;
> > > > +	struct disable_fuse *disables;
> > > >  };
> > > >
> > > >  static int imx_ocotp_wait_for_busy(struct ocotp_priv *priv, u32 fl=
ags)
> > > > @@ -552,11 +562,25 @@ static const struct ocotp_params imx8mm_param=
s =3D {
> > > >  	.ctrl =3D IMX_OCOTP_BM_CTRL_DEFAULT,
> > > >  };
> > > >
> > > > +struct disable_fuse imx8mn_disable_fuse[] =3D {
> > > > +		[IMX8MN_OCOTP_M7_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D BIT=
(8) },
> > > > +		[IMX8MN_OCOTP_M7_MPU_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D=
 BIT(9) },
> > > > +		[IMX8MN_OCOTP_M7_FPU_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D=
 BIT(10) },
> > > > +		[IMX8MN_OCOTP_USB_OTG1_DISABLE]	=3D { .fuse_addr =3D 20, .mask =
=3D BIT(11) },
> > > > +		[IMX8MN_OCOTP_GPU3D_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D =
BIT(24) },
> > > > +		[IMX8MN_OCOTP_MIPI_DSI_DISABLE]	=3D { .fuse_addr =3D 20, .mask =
=3D BIT(28) },
> > > > +		[IMX8MN_OCOTP_ENET_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D B=
IT(29) },
> > > > +		[IMX8MN_OCOTP_MIPI_CSI_DISABLE]	=3D { .fuse_addr =3D 20, .mask =
=3D BIT(30) },
> > > > +		[IMX8MN_OCOTP_ASRC_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D B=
IT(31) },
> > > > +};
> > >
> > > Can we direct define IMX8MN_OCOTP_M7_DISABLE as BIT(8), so avoid this
> > > map data?
> >
> > This would be possible for imx8mn, but not for imx8mp which uses
> > multiples fuses for disables. This is an excerpt from imx8mp WIP
> > > struct disable_fuse imx8mp_disable_fuse[] =3D {
> > > 	[IMX8MP_OCOTP_CAN_DISABLE]		=3D { .fuse_addr =3D 16, .mask =3D BIT(2=
8) },
> > > 	[IMX8MP_OCOTP_CAN_FD_DISABLE]		=3D { .fuse_addr =3D 16, .mask =3D BI=
T(29) },
> > > 	[IMX8MP_OCOTP_VPU_VC8000E_DISABLE]	=3D { .fuse_addr =3D 16, .mask =
=3D BIT(30) },
> > > 	[IMX8MP_OCOTP_IMG_ISP1_DISABLE]		=3D { .fuse_addr =3D 20, .mask =3D =
BIT(0) },
> > > 	[IMX8MP_OCOTP_IMG_ISP2_DISABLE]		=3D { .fuse_addr =3D 20, .mask =3D =
BIT(1) },
> > > 	[IMX8MP_OCOTP_IMG_DEWARP_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D=
 BIT(2) },
> > > };
> >
> > Notice the fuse_addr of 16 and 20.
>=20
> Yes, I am not sure if it good idea to encode fuse_addr to IMX8MP_OCOTP_CA=
N_DISABLE
>=20
> like
>=20
> #define IMX8MP_OCOTP_CAN_DISABLE  16 << 16 | BIT(28)
>=20
> So dt-bindings/nvmem/fsl,imx8mn-ocotp.h can be moved to dts directory.

Mh, I personally don't like encoding offsets into bits. How about using
> '#access-controller-cells =3D <2>'
and using the defines like this
> #define IMX8MP_OCOTP_CAN_DISABLE  16 0x10000000

DT stays the same:
> access-controllers =3D <&ocotp IMX8MP_OCOTP_CAN_DISABLE>;

Note: It seems BIT(x) is not usable in DT.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



