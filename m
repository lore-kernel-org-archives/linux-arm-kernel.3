Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D74BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MTN/uQ1fj1sjFZFU29nzAA7q3WAULF2DQMtFspMm54=; b=stPONTe10BXmwI6/0S+VagMNrd
	n0TtQfdEKGgAXxaK1wRqQmFn2KCsxuG3UfwWaPVqXb1LFDBSOHGN6q8G1Dq+iqaIsPC8bOAPeirU+
	KU6am4kD7Kf1yP/j0E+O6gEYRh19+T6gtHmhQCoFPaLYz/Iik/QAyFRdpBsNwJ1RG+tb2CMbihhLX
	g9W6GpvV4AqGzYv+EnMYDpK++d62L+VUd+glHVWF2k/YfQWAHnYKaLD9p+oBMegq83gWrOVo/ouvM
	NlIzXEX9aVw1UaCRsuFJQ5yqJIlytADkl5UwNJr2Ve0+eVgLADTeJLF7Is/QqJpuiTMwApjj32omi
	E9bmRjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVptW-0000000BYWb-29b9;
	Thu, 09 Jan 2025 10:36:06 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVprx-0000000BY8e-20a4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736418869; x=1767954869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0MTN/uQ1fj1sjFZFU29nzAA7q3WAULF2DQMtFspMm54=;
  b=ZSm36oEiBKCE0ORuOB8Z60GII/VNfXGl9K/YJrknUrvTLN2tRtlx2qMh
   4gCu0usHtJoK0NuGvGBGPztzMHoZjhpzHWNEpFUww39jtw7eyhpeskIYU
   lWu+hdr2Q9Hv+1i9OhJHDpR3/xBrj4ulZPc4V0BuDW+l9KEFba+hSGhSQ
   RVroTusnrAZ2cJmEl3le7KuRuZHDgn+Gez/LbHSd86HzsUjAaOz9CkbCc
   EJ0DERL4gzz0t7h1W5+Qp9WMBl5SmD0LAKy5mSJ+U9LezZuAUG3eUhrua
   X9Bvx+NXGn236CtCPI4pp9fTSBreXs49g8ImBu+qifuYxndLhjEynpkL2
   w==;
X-CSE-ConnectionGUID: +JTc6dEsTZ60x0BbnUIENQ==
X-CSE-MsgGUID: fLjUKfk6TjaaKBsrd1u3mg==
X-IronPort-AV: E=Sophos;i="6.12,301,1728943200"; 
   d="scan'208";a="40947499"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Jan 2025 11:34:25 +0100
X-CheckPoint: {677FA631-4-C6D8D88D-F91F9E6B}
X-MAIL-CPID: DAEE3929AC4BF68E40EE46756A13F4E5_2
X-Control-Analysis: str=0001.0A682F1D.677FA631.0057,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 085C1166C27;
	Thu,  9 Jan 2025 11:34:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736418860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MTN/uQ1fj1sjFZFU29nzAA7q3WAULF2DQMtFspMm54=;
	b=P0G9oAvddIJbYBTchLqPNFA/W8Ahm04hcZ4n4w9aN9X3yAs4hsjvxeX2/9AFsF60X8nyGd
	xXk2jEKOXvXXA3tpxUfXxdwAEndVs5uOnnK/BUrAp3mAGVjTNF0A6Zi6bqjTBZQhz0Qseh
	J03hbNgSysrkUSJBRZEV9DUPMUIb9TwYPm+UNzoxnhZTvxXMcU4yH1zxGFHL0RgvFjFYJ/
	65kipP5yJuQGlN7YQy7CpQ8SzP8pCrAK72e3lKcdZC2CmwnvkpYZkLuW93w+gVWhlj7Y5a
	jC4OplR+oh3C64I2iWSoWK9MLz48DxcWwwbzootiP27bRJja1m5Whp8AGeWvWg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
Date: Thu, 09 Jan 2025 11:34:18 +0100
Message-ID: <868241455.0ifERbkFSE@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250109033418.GB31833@localhost.localdomain>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com> <3823142.MHq7AAxBmi@steina-w> <20250109033418.GB31833@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_023430_018759_7E0693AE 
X-CRM114-Status: GOOD (  22.47  )
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

Hi,

Am Donnerstag, 9. Januar 2025, 04:34:18 CET schrieb Peng Fan:
> On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein wrote:
> >Hi Peng,
> >
> >Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng Fan (OSS):
> >> From: Peng Fan <peng.fan@nxp.com>
> >>=20
> >> i.MX9 OCOTP supports a specific peripheral or function being fused
> >> which means disabled, so
> >>  - Introduce ocotp_access_gates to be container of efuse gate info
> >>  - Iterate all nodes to check accessing permission. If not
> >>    allowed to be accessed, detach the node
> >>=20
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/nvmem/imx-ocotp-ele.c | 172 +++++++++++++++++++++++++++++++++=
++++++++-
> >>  1 file changed, 171 insertions(+), 1 deletion(-)
> >>=20
> [....]
> >> +
> >> +	return imx_ele_ocotp_access_control(priv);
> >
> >In [1] you mentioned devlink should solve the probe order. How does this
> >play when the driver is compiled in (e.g. ethernet for NFS boot) but
> >this OCOTP driver is just a module?
>=20
> OCOTP needs to built in for using devlink. Or the users needs to be
> built as module.

I don't like this kind of assumption. Would it make more sense to make
CONFIG_NVMEM_IMX_OCOTP_ELE as bool instead of tristate?

> >I'm not well versed with devlink, but is
> >> access-controllers =3D <&ocotp IMX93_OCOTP_ENET1_GATE>;
> >already enough to create that link?
>=20
> Yes, the drivers/of/property.c has this
> "DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-co=
ntroller-cells")"
>=20
> The fw_devlink driver will create consumer/supplier to make sure proper
> order.

Okay, thanks for confirming.

Best regards,
Alexander

> Regards,
> Peng
>=20
> >
> >Best regards,
> >Alexander
> >
> >>  }
> >> =20
> >> +struct access_gate imx93_access_gate[] =3D {
> >> +		[IMX93_OCOTP_NPU_GATE]		=3D { .word =3D 19, .mask =3D BIT(13) },
> >> +		[IMX93_OCOTP_A550_GATE]		=3D { .word =3D 19, .mask =3D BIT(14) },
> >> +		[IMX93_OCOTP_A551_GATE]		=3D { .word =3D 19, .mask =3D BIT(15) },
> >> +		[IMX93_OCOTP_M33_GATE]		=3D { .word =3D 19, .mask =3D BIT(24) },
> >> +		[IMX93_OCOTP_CAN1_FD_GATE]	=3D { .word =3D 19, .mask =3D BIT(28) },
> >> +		[IMX93_OCOTP_CAN2_FD_GATE]	=3D { .word =3D 19, .mask =3D BIT(29) },
> >> +		[IMX93_OCOTP_CAN1_GATE]		=3D { .word =3D 19, .mask =3D BIT(30) },
> >> +		[IMX93_OCOTP_CAN2_GATE]		=3D { .word =3D 19, .mask =3D BIT(31) },
> >> +		[IMX93_OCOTP_USB1_GATE]		=3D { .word =3D 20, .mask =3D BIT(3) },
> >> +		[IMX93_OCOTP_USB2_GATE]		=3D { .word =3D 20, .mask =3D BIT(4) },
> >> +		[IMX93_OCOTP_ENET1_GATE]	=3D { .word =3D 20, .mask =3D BIT(5) },
> >> +		[IMX93_OCOTP_ENET2_GATE]	=3D { .word =3D 20, .mask =3D BIT(6) },
> >> +		[IMX93_OCOTP_PXP_GATE]		=3D { .word =3D 20, .mask =3D BIT(10) },
> >> +		[IMX93_OCOTP_MIPI_CSI1_GATE]	=3D { .word =3D 20, .mask =3D BIT(17) =
},
> >> +		[IMX93_OCOTP_MIPI_DSI1_GATE]	=3D { .word =3D 20, .mask =3D BIT(19) =
},
> >> +		[IMX93_OCOTP_LVDS1_GATE]	=3D { .word =3D 20, .mask =3D BIT(24) },
> >> +		[IMX93_OCOTP_ADC1_GATE]		=3D { .word =3D 21, .mask =3D BIT(7) },
> >> +};
> >> +
> >> +static const struct ocotp_access_gates imx93_access_gates_info =3D {
> >> +	.num_words =3D 3,
> >> +	.words =3D {19, 20, 21},
> >> +	.num_gates =3D ARRAY_SIZE(imx93_access_gate),
> >> +	.gates =3D imx93_access_gate,
> >> +};
> >> +
> >>  static const struct ocotp_devtype_data imx93_ocotp_data =3D {
> >> +	.access_gates =3D &imx93_access_gates_info,
> >>  	.reg_off =3D 0x8000,
> >>  	.reg_read =3D imx_ocotp_reg_read,
> >>  	.size =3D 2048,
> >> @@ -183,7 +307,53 @@ static const struct ocotp_devtype_data imx93_ocot=
p_data =3D {
> >>  	},
> >>  };
> >> =20
> >> +struct access_gate imx95_access_gate[] =3D {
> >> +		[IMX95_OCOTP_CANFD1_GATE]	=3D { .word =3D 17, .mask =3D BIT(20) },
> >> +		[IMX95_OCOTP_CANFD2_GATE]	=3D { .word =3D 17, .mask =3D BIT(21) },
> >> +		[IMX95_OCOTP_CANFD3_GATE]	=3D { .word =3D 17, .mask =3D BIT(22) },
> >> +		[IMX95_OCOTP_CANFD4_GATE]	=3D { .word =3D 17, .mask =3D BIT(23) },
> >> +		[IMX95_OCOTP_CANFD5_GATE]	=3D { .word =3D 17, .mask =3D BIT(24) },
> >> +		[IMX95_OCOTP_CAN1_GATE]		=3D { .word =3D 17, .mask =3D BIT(25) },
> >> +		[IMX95_OCOTP_CAN2_GATE]		=3D { .word =3D 17, .mask =3D BIT(26) },
> >> +		[IMX95_OCOTP_CAN3_GATE]		=3D { .word =3D 17, .mask =3D BIT(27) },
> >> +		[IMX95_OCOTP_CAN4_GATE]		=3D { .word =3D 17, .mask =3D BIT(28) },
> >> +		[IMX95_OCOTP_CAN5_GATE]		=3D { .word =3D 17, .mask =3D BIT(29) },
> >> +		[IMX95_OCOTP_NPU_GATE]		=3D { .word =3D 18, .mask =3D BIT(0) },
> >> +		[IMX95_OCOTP_A550_GATE]		=3D { .word =3D 18, .mask =3D BIT(1) },
> >> +		[IMX95_OCOTP_A551_GATE]		=3D { .word =3D 18, .mask =3D BIT(2) },
> >> +		[IMX95_OCOTP_A552_GATE]		=3D { .word =3D 18, .mask =3D BIT(3) },
> >> +		[IMX95_OCOTP_A553_GATE]		=3D { .word =3D 18, .mask =3D BIT(4) },
> >> +		[IMX95_OCOTP_A554_GATE]		=3D { .word =3D 18, .mask =3D BIT(5) },
> >> +		[IMX95_OCOTP_A555_GATE]		=3D { .word =3D 18, .mask =3D BIT(6) },
> >> +		[IMX95_OCOTP_M7_GATE]		=3D { .word =3D 18, .mask =3D BIT(9) },
> >> +		[IMX95_OCOTP_DCSS_GATE]		=3D { .word =3D 18, .mask =3D BIT(22) },
> >> +		[IMX95_OCOTP_LVDS1_GATE]	=3D { .word =3D 18, .mask =3D BIT(27) },
> >> +		[IMX95_OCOTP_ISP_GATE]		=3D { .word =3D 18, .mask =3D BIT(29) },
> >> +		[IMX95_OCOTP_USB1_GATE]		=3D { .word =3D 19, .mask =3D BIT(2) },
> >> +		[IMX95_OCOTP_USB2_GATE]		=3D { .word =3D 19, .mask =3D BIT(3) },
> >> +		[IMX95_OCOTP_NETC_GATE]		=3D { .word =3D 19, .mask =3D BIT(4) },
> >> +		[IMX95_OCOTP_PCIE1_GATE]	=3D { .word =3D 19, .mask =3D BIT(6) },
> >> +		[IMX95_OCOTP_PCIE2_GATE]	=3D { .word =3D 19, .mask =3D BIT(7) },
> >> +		[IMX95_OCOTP_ADC1_GATE]		=3D { .word =3D 19, .mask =3D BIT(8) },
> >> +		[IMX95_OCOTP_EARC_RX_GATE]	=3D { .word =3D 19, .mask =3D BIT(11) },
> >> +		[IMX95_OCOTP_GPU3D_GATE]	=3D { .word =3D 19, .mask =3D BIT(16) },
> >> +		[IMX95_OCOTP_VPU_GATE]		=3D { .word =3D 19, .mask =3D BIT(17) },
> >> +		[IMX95_OCOTP_JPEG_ENC_GATE]	=3D { .word =3D 19, .mask =3D BIT(18) },
> >> +		[IMX95_OCOTP_JPEG_DEC_GATE]	=3D { .word =3D 19, .mask =3D BIT(19) },
> >> +		[IMX95_OCOTP_MIPI_CSI1_GATE]	=3D { .word =3D 19, .mask =3D BIT(21) =
},
> >> +		[IMX95_OCOTP_MIPI_CSI2_GATE]	=3D { .word =3D 19, .mask =3D BIT(22) =
},
> >> +		[IMX95_OCOTP_MIPI_DSI1_GATE]	=3D { .word =3D 19, .mask =3D BIT(23) =
},
> >> +};
> >> +
> >> +static const struct ocotp_access_gates imx95_access_gates_info =3D {
> >> +	.num_words =3D 3,
> >> +	.words =3D {17, 18, 19},
> >> +	.num_gates =3D ARRAY_SIZE(imx95_access_gate),
> >> +	.gates =3D imx95_access_gate,
> >> +};
> >> +
> >>  static const struct ocotp_devtype_data imx95_ocotp_data =3D {
> >> +	.access_gates =3D &imx95_access_gates_info,
> >>  	.reg_off =3D 0x8000,
> >>  	.reg_read =3D imx_ocotp_reg_read,
> >>  	.size =3D 2048,
> >>=20
> >>=20
> >
> >
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



