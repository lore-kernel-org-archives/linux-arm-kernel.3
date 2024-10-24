Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684FCCE8E7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4rZ85uABm1rBWYYFvnPSd8gxVULaUc5YT80QXzNgb4=; b=x+xeTafWsWO7GFvpCGYB5ErNwL
	BflU8Oi8zmVLSpbkhTftD9lKk5d4USU3zD+KeIxvrNiFQ4rsOcN1fTF+Vr0LdzZHSLiITPTBW4iIK
	BFBdmvpER1HllS72ZBDYmp4Cj7ScNq1B8dOsT5oqiajr/A6kjESwoOnCs+g22QWY1HvmW08kvPG3a
	Zj4oeBY33irbvAJVi3KsgWCdimsWFz5RWaaR2l0MdmOhPhdUZML5lm3C2JWPN2arwmY0/yn+QdP9M
	HkIVf9VAhhT2ydJg4D3vBmXUcQZ9PfgaMlqS9Hf4HMUCQjGQo6PYvO2OkZ3mSzOzWa8GBqW87euXI
	C6MH2zvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yV3-00000000d8J-2ohO;
	Thu, 24 Oct 2024 14:07:41 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yTK-00000000cQI-0DyA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729778754; x=1761314754;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=B4rZ85uABm1rBWYYFvnPSd8gxVULaUc5YT80QXzNgb4=;
  b=BBPDziah7V7FiAi+/fgFrftlPeZ/2zWahtlTAxjYYntf7dfIUwGvd+kv
   daysie4fNzJTEiH47wjHL4IxcDX5hSFGxZIzxQc7Hu1T4ZVWIOHbD3Lep
   2e9Hgdi4oyq9LzgIWS43/e/naRyrp7o0Yyu9V4mWljE1RpIFXzp6gdwWg
   bOu/pQOhtdL0r3YnpoqehdPUwxmf6l+kS9seDl+NyxO4UC9q6ZO8pgNqZ
   KxEQOJVd2iZJToE6dsOOaYTT7UkF+KkqVFS6bNNInJm2QvOENOXE37ptd
   u8w6RW7nr/EyOhBCCWjCmi9ZFQe2oXZspTyjv8zQNsdogxnj74fzkx7Sl
   A==;
X-CSE-ConnectionGUID: 4+/5weJtQWig6PIjf/4DBQ==
X-CSE-MsgGUID: UOiXlctXSkuUnieqcw8T6g==
X-IronPort-AV: E=Sophos;i="6.11,229,1725314400"; 
   d="scan'208";a="39654474"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Oct 2024 16:05:49 +0200
X-CheckPoint: {671A543D-F-65F98A6A-FADAF7F3}
X-MAIL-CPID: 3E82C7D35B6B9BF454F6351958F5EAB0_5
X-Control-Analysis: str=0001.0A682F1D.671A543D.008C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E867B1614D7;
	Thu, 24 Oct 2024 16:05:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729778745; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B4rZ85uABm1rBWYYFvnPSd8gxVULaUc5YT80QXzNgb4=;
	b=RdTj2nYmrsEIh0AFTJcu9izdoML6Yywu/vHG9n0EbmEzC9JQMSehsZHnQbfmT8H1LMNqpL
	VK62Ga92/ChQ64VURPbHX3ogPlbTNJbM7Yv/OIAjaId2MaLm2nQfLAflvOrXbGKbp9f40Y
	7TndtjmJ32pTMMs9VzFTfmm7pHiJa2/pPcuex1A3lusjBQppLs3WJv9vgMaOsQvMauNeRW
	trv9ZSU3zrTnqlgFDcBRBUINA4m3EBUkbrUmFSTj2+2mJfbuFETxxDXd/y7jSsSiFseB+Q
	RTSkvd3c9JrdhZx0rvg2y69rbM9keP1GDGGxOfK6QsdZOlDvWeOSZzctO+Dzlw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-tqma8mqnl-mba8mx-usbot: fix coexistence of output-low and output-high in GPIO
Date: Thu, 24 Oct 2024 16:05:43 +0200
Message-ID: <8443837.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241023210313.1390767-1-Frank.Li@nxp.com>
References: <20241023210313.1390767-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_070554_643663_4A30E989 
X-CRM114-Status: GOOD (  17.96  )
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

Hi Frank,

thanks for noticing the issue and also providing a patch.

Am Mittwoch, 23. Oktober 2024, 23:03:13 CEST schrieb Frank Li:
> Fix the issue where both 'output-low' and 'output-high' exist under GPIO
> hog nodes  (rst_usb_hub_hog and sel_usb_hub_hog) when applying device
> tree overlays. Since /delete-property/ is not supported in the overlays,
> setting 'output-low' results in both properties being present. The
> workaround is to disable these hogs and create new ones with 'output-low'
> as needed.
>=20
> Fix below CHECK_DTBS warning:
> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-usb=
=2Dhub-hog:
>    {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output-high=
': True, 'phandle': 108, '$nodename': ['sel-usb-hub-hog']}
>        is valid under each of {'required': ['output-low']}, {'required': =
['output-high']
>=20
> Fixes: 3f6fc30abebc ("arm64: dts: imx8mn: tqma8mqnl-mba8mx: Add USB DR ov=
erlay")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thanks, this works as intended. If this overlay applied the USB OTG connect=
or (X19) can be used.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Alex:
> 	I have not hardware to run it. I check dtb output is correct.
> ---
>  .../imx8mn-tqma8mqnl-mba8mx-usbotg.dtso       | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg=
=2Edtso b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> index 96db07fc9bece..1f2a0fe70a0a2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> @@ -29,12 +29,37 @@ usb_dr_connector: endpoint {
>  	};
>  };
> =20
> +/*
> + * rst_usb_hub_hog and sel_usb_hub_hog have property 'output-high',
> + * dt overlay don't support /delete-property/. Both 'output-low' and
> + * 'output-high' will be exist under hog nodes if overlay file set
> + * 'output-low'. Workaround is disable these hog and create new hog with
> + * 'output-low'.
> + */
> +
>  &rst_usb_hub_hog {
> -	output-low;
> +	status =3D "disabled";
> +};
> +
> +&expander0 {
> +	rst-usb-low-hub-hog {
> +		gpio-hog;
> +		gpios =3D <13 0>;
> +		output-low;
> +		line-name =3D "RST_USB_HUB#";
> +	};
>  };
> =20
>  &sel_usb_hub_hog {
> -	output-low;
> +	status =3D "disabled";
> +};
> +
> +&gpio2 {
> +	sel-usb-low-hub-hog {
> +		gpio-hog;
> +		gpios =3D <1 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +	};
>  };
> =20
>  &usbotg1 {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



