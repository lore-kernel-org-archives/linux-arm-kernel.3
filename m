Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377B7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SIJqIgqcIKPQwfDfVMCBKbOjc9U8k3NHkGxirv7vm0=; b=ku0WvlXhkiF4IHxS6ecRFWEquT
	01ln/hxJUT5s7CfZBzHHqPuZT+pGsqTTJzALMHtfz3q1x2ixuioltWIIpdYZ6uIeYSj65nCLlhGTw
	XHiWqK/SaZTDbdoGV3H1VbKCsyiUyBF7m2FCelZiDm4HOv2JYOraLrORSSGREr4TtRiG4mYKAuuip
	rPzQ8wkZu1if/KMLMu7xucARYdAVxZVU3Cdp3TNUMopcKENz3hkQf0zROHPd82pLwC7EJr4xoMqAX
	B1+Qlhws6I3LC8J9zlxigiL3NOVj1DLuFX0x5T+dj2OHcVOKVctdr/W8W1jwJUTqY4bZRurSmqmKQ
	s9RbtHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPvW-00000005cBQ-1Kaf;
	Wed, 26 Feb 2025 22:30:50 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPsQ-00000005bZr-1FLj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 22:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E320E612AE;
	Wed, 26 Feb 2025 22:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63415C4CED6;
	Wed, 26 Feb 2025 22:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740608855;
	bh=/TBxRjD+YRDof+mNKcnMf3FsANOHIzAqS1izxvRKSkA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pJUentzn6RXKQfY73yLb7U7Z0MOp2FRQtxkufabY66glfMQGuamgElASdmZN6R8Up
	 Fvi395sNQ2Vm3XBtm0TmeE6e3pIcideJviwU+2LB88nLxQ01yfWKaLyPCHtpIqKVy1
	 d2BgqnPG9pUDZ21Kh7p0VjwtBARziCYpGNKNX65q1bjyx0+F07xEcdKiPL8jSjDZM5
	 SXSka8fFGgmeCDkdRvDm41GKoaNBVvKDB9e7VvobgMyQL2g2YsfzMTj184/fQHdzuE
	 EFXupjHCf8dKEdq3lRmSS6ZPWsaoOCwsoEdN8/aCv0B2WBo7G0GD1Do5aQrvdXXb22
	 nRbCMHTWkdkeg==
Date: Wed, 26 Feb 2025 16:27:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Mark Brown <broonie@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Simona Vetter <simona@ffwll.ch>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>, 
 Maxime Ripard <mripard@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-spi@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
Message-Id: <174060863556.3857034.912870225795774413.robh@kernel.org>
Subject: Re: [PATCH v2 00/12] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display
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


On Wed, 26 Feb 2025 15:19:11 +0100, Maud Spierings wrote:
> Add inital support for 2 variants of the Moduline Display controller.
> This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
> features an imx8mp SoC.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> Changes in v2:
> - Dropped the trivial-devices patch
> - Added a patch with bindings for the gocontroll,moduline-module-slot
> - Added a patch to spidev.c to enable the spidev driver for the module
>   slot
> - Added a missing usb-c connector in the av101hdt-a10 variant dts
> - Switched to the new bindings for the module slots in the base dts
> - Fixed some commit typos
> - Link to v1: https://lore.kernel.org/r/20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com
> 
> ---
> Maud Spierings (12):
>       dt-bindings: arm: fsl: Add GOcontroll Moduline Display
>       dt-bindings: vendor-prefixes: add GOcontroll
>       dt-bindings: connector: Add the GOcontroll Moduline module slot bindings
>       arm64: dts: imx8mp: Add pinctrl config definitions
>       MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
>       MAINTAINERS: add maintainer for the GOcontroll Moduline module slot
>       MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
>       arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
>       arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
>       arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
>       arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display
>       spi: spidev: Add an entry for the gocontroll moduline module slot
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>  .../connector/gocontroll,moduline-module-slot.yaml |  88 ++++
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  MAINTAINERS                                        |  17 +
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  27 +
>  ...tx8p-ml81-moduline-display-106-av101hdt-a10.dts | 100 ++++
>  ...tx8p-ml81-moduline-display-106-av123z7m-n17.dts | 133 +++++
>  .../imx8mp-tx8p-ml81-moduline-display-106.dtsi     | 535 ++++++++++++++++++++
>  .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 547 +++++++++++++++++++++
>  drivers/spi/spidev.c                               |   2 +
>  10 files changed, 1452 insertions(+)
> ---
> base-commit: 2bc63dbeabecce860eb8b261bf67b97552fe7747
> change-id: 20250224-initial_display-fa82218e06e5
> 
> Best regards,
> --
> Maud Spierings <maudspierings@gocontroll.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250226-initial_display-v2-0-23fafa130817@gocontroll.com:

arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: usb@32f10108: usb@38200000: Unevaluated properties are not allowed ('connector' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: usb@38200000: Unevaluated properties are not allowed ('connector' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#






