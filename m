Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B73C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsZM34R6l1/AkRyfiPorlFEDTy3E0XS0s6W2TrWSqFQ=; b=IOdWCPLnbocyJWuCIiEkDWA33Y
	f6MSoWeDJ4s8dBzXF0RY5ff+Kcc80rvXD5vwHtu0IuEarfWeT4trGUez/ZwsOUUqcQH0vOlksGH4d
	BH918A0lz1kmcuV67WP+hZN9eKa2wGLuZ1E/RxLPY+AN3yf6DXR546pHqRLAcPiOm94Lif05JzHpF
	0Wj+/CFlk1iizQi+iBMw9YpGHbmJJvCapEtenTh2nj/WbVT+a3PRlljZehftUIlETvWqgYvVALa/G
	e8d2JxnQoqgusTfwNmaffbL5Np8h4ROo9VTzSUPiW20pOQo8V8vbeJ11CBqbOcEfQ67OBCGNVkhku
	ZtRfyF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7yt-00000002EUr-2UvS;
	Mon, 17 Mar 2025 10:46:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7o5-00000002BU5-41o7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:34:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2F33A489D2;
	Mon, 17 Mar 2025 10:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0ECC4CEEE;
	Mon, 17 Mar 2025 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742207693;
	bh=OOWMoUFQ23UHSwIZ8BvygHyrXX9kthpv+6WpnSx7ZNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QsDWmFcuxcsgFxG+2Q5SuxHmU93c+w9J/18L5YmxK5aviJm9Z4CUyWBrYiSnWqV2e
	 C7GP8NTC6GV+/vET79P68p6yY4ndZ77nM5Qidg/EocBZRxEpLykxoK52Qq3XaAkOy8
	 KTPXVZOgV5u7aBCFQwCMzMYJxlcldpTrsKgAJlR/4Ny0tx9C890MZIKAAdjizTMV9L
	 VrzNMUMRwumMFNEbDQb1XVLR029YxilgVYa3urlPcqLBoCkLCcynRiwEcK+k2UfCEX
	 T3oAWZCtEW8lZXjXHG9Md0KYqU91/xx4AAldISNUrDm8p8IZVEkSfRfduUQb3z1dPp
	 B3NA64lusvwwA==
Date: Mon, 17 Mar 2025 11:34:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Message-ID: <20250317-massive-calm-bat-43ff61@krzk-bin>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
 <20250226-initial_display-v2-3-23fafa130817@gocontroll.com>
 <20250314210652.GA2300828-robh@kernel.org>
 <PA4PR04MB7630094413C8E1F3D715EE23C5DD2@PA4PR04MB7630.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PA4PR04MB7630094413C8E1F3D715EE23C5DD2@PA4PR04MB7630.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_033454_063262_20B369F3 
X-CRM114-Status: GOOD (  11.77  )
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

On Sat, Mar 15, 2025 at 07:32:28AM +0000, Maud Spierings | GOcontroll wrote:
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - reset-gpios
> >> +  - interrupts
> >> +  - sync-gpios
> >> +  - i2c-bus
> >> +  - slot-number
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +    spi {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +
> >> +        connector@0 {
> >
> >I find this being a SPI device a bit strange. Is there a defined SPI
> >device that every slot is going to have? Or the connector has SPI
> >interface and *anything* could be attached on it?
> 
> So a module slot is like a pcie slot, it can be occupied or not, and when

But which buses...

Best regards,
Krzysztof


