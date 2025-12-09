Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7C0D3B98E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 19:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehbBuhY39pQQMCdjF+YPVJ5p6PjVxpscMTLZWeMq02c=; b=RfyW4Ivk7EuYK7As24soFCfEf7
	RRdovPT8Iu9ZEvaq4ttdD5y/FZUw3CcB6D0VaM0cYTf98IBkCH5e4dh8yLLMJy7AWcnqUlAVykCp1
	e/vtk12WcXSKlPURKGtSB+lSw1HHVmydTSQreY4i8OiD+TWl41CMdCogkUpCUC8LqBJthEC3ANGj7
	WwZspOhN8JqnGnMB8o5+MBwQnre3P6pqyVzPt61taPZPupGoWaV7lxOCxxLoFA/jr9t5OpoOfY6JF
	RCKqT4T8xer5laUKPyJYdxyL9+Z3EZ4BeHbIZk97HZ1/jnvgwpxfgS44Hu4giJDsqtIXChXzhZdFe
	KMHk30ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT33Z-0000000EgQC-24ru;
	Tue, 09 Dec 2025 19:07:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT33W-0000000EgPn-1sIY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 19:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8303431C5;
	Tue,  9 Dec 2025 19:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CFDC4CEF5;
	Tue,  9 Dec 2025 19:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765307245;
	bh=Oym70OZBadIC1w/YlIPC9DL2FkmLeSFqIX49SQ+L7/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwA+gXGmpmgU5IwRHGVMFdXkRrn2+bkW/1NNddhQa7ZCTcOkRZKqNLyZxseM4ffEc
	 tvoHjUes1u+9UfHDpaHfHBrJKjrOTB5C5P0qTNTSINvTke+8WiffQDDM7v6eRQ1QnF
	 ALj2rikjP19zVrI4FCAiJ5V0WwVzuy6D22psHQrApox27xZXK5Y58q75kL3bEgSmkE
	 YJOXdKxIk8hj3CNeYCUveh0d+yaWA/49Fe+x7I9Eumh+mweANs1I0FWElnnU8nX2FF
	 jwpB+a4Ed6Ruh3KB7nMLnDd2wD3F6WE+vCqHXZmG9Q7zgTpxyzcTo6Q2vVCjya9ixP
	 fEwMfQ3mJUIXw==
Date: Tue, 9 Dec 2025 13:07:22 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Frank Li <Frank.li@nxp.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/4] dt-bindings: backlight: Add max25014 support
Message-ID: <20251209190722.GA945742-robh@kernel.org>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
 <aS3H1qzSMKHamqpP@lizhi-Precision-Tower-5810>
 <b9fe6df7-fdc6-4a32-919b-8f3b44eace7d@gocontroll.com>
 <aS79eKc9Ac4np6Nf@lizhi-Precision-Tower-5810>
 <e428c3a9-49e2-4af5-b597-2cdfef7028f5@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e428c3a9-49e2-4af5-b597-2cdfef7028f5@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_110726_552191_F06405B4 
X-CRM114-Status: GOOD (  36.49  )
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

On Mon, Dec 08, 2025 at 02:56:50PM +0100, Maud Spierings wrote:
> On 12/2/25 15:53, Frank Li wrote:
> > On Tue, Dec 02, 2025 at 08:46:21AM +0100, Maud Spierings wrote:
> > > On 12/1/25 17:52, Frank Li wrote:
> > > > On Mon, Dec 01, 2025 at 12:53:20PM +0100, Maud Spierings via B4 Relay wrote:
> > > > > From: Maud Spierings <maudspierings@gocontroll.com>
> > > > > 
> > > > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > > > with integrated boost controller.
> > > > > 
> > > > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > In the current implementation the control registers for channel 1,
> > > > > control all channels. So only one led subnode with led-sources is
> > > > > supported right now. If at some point the driver functionality is
> > > > > expanded the bindings can be easily extended with it.
> > > > > ---
> > > > >    .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
> > > > >    MAINTAINERS                                        |   5 +
> > > > >    2 files changed, 112 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..e83723224b07
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> > > > > @@ -0,0 +1,107 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Maxim max25014 backlight controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Maud Spierings <maudspierings@gocontroll.com>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - maxim,max25014
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  "#address-cells":
> > > > > +    const: 1
> > > > > +
> > > > > +  "#size-cells":
> > > > > +    const: 0
> > > > > +
> > > > > +  enable-gpios:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  power-supply:
> > > > > +    description: Regulator which controls the boost converter input rail.
> > > > > +
> > > > > +  pwms:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  maxim,iset:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    maximum: 15
> > > > > +    default: 11
> > > > > +    description:
> > > > > +      Value of the ISET field in the ISET register. This controls the current
> > > > > +      scale of the outputs, a higher number means more current.
> > > > > +
> > > > > +  led@0:
> > > > 
> > > > define whole binding, allow 0-3. binding is not related with driver's
> > > > implement.
> > > > 
> > > > it'd better put unders leds.
> > > > 
> > > 
> > > so like:
> > > 
> > > backlight: backlight@6f {
> > > 	compatible = "maxim,max25014";
> > > 	reg = <0x6f>;
> > > 	enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> > > 	pinctrl-names = "default";
> > > 	pinctrl-0 = <&pinctrl_backlight>;
> > > 	maxim,iset = <7>;
> > > 
> > > 	leds {
> > > 		#address-cells = <1>;
> > > 		#size-cells = <0>;
> > > 
> > > 		led@0 {
> > > 			reg = <0>;
> > > 			led-sources = <0 1 2>;
> > > 			default-brightness = <50>;
> > > 		};
> > > 
> > > 		optional led@#....
> > > 	};
> > > };
> > > 
> > > right?
> > 
> > yes.
> > 
> 
> I am feeling a bit weird about these led sub nodes, because it is not
> programmed as a led driver, it is programmed as a backlight. I am trying to
> figure out how this would be used later when the led strings are
> individually controllable.
> 
> it isn't possible to link the seperate strings to different displays because
> it is only one backlight device, so I don't seen any reason why it would
> ever be used in another way than what it is now, were all strings are
> programmed by one register.
> 
> The only way I can make sense of it is if instead I program this device as a
> led driver and then use the led_bl driver as the actual backlight.
> 
> Thats a pretty big step in a different direction, but then the led subnodes
> at least can be properly used I feel.

If you don't have any use for anything other than driving a single 
backlight, then I'd just drop the led nodes completely.

Rob

