Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9F5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4Yn1AmvZSHJwnVEX7Q8ZOWNcDOmD6fTQEVrdoy4wnE=; b=WGNTEg3l2odukOUipJY4okBrJj
	cPh2zvNu+7bRS2bG4p8+nLyNG56HX61aHudAAEVBG5qkzZ4vhSuN9p9rDX6SZ8tsDZO+7fJJhl3CC
	2UPG2ucjpWeeCLb/ncABIsHTXCm1ZADp2qKTZ3MA4fLiaOyw3ObgyWddHm9MmxZdzzlkWKZ7DKDDK
	zBDiMMJb4YyYJ1nm1gCcUhr+6a/3Iq84Frr0PCsn9vAhLe6ZwMet5ChN+J3lW5LvTiChztrJJllJ8
	1EK6cQ0pw1qAZvNRBwgHyWQ7tQmbht06r2q0vnSaqNpOfUSeUo725ON/ECYFu2zy/Ccu/8XmuTuZp
	cI+2nd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRS-0000000DRPa-2w5z;
	Thu, 19 Jun 2025 15:44:43 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBoc-0000000CeQ4-1U0F;
	Thu, 19 Jun 2025 09:44:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D243443B02;
	Thu, 19 Jun 2025 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750326250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4Yn1AmvZSHJwnVEX7Q8ZOWNcDOmD6fTQEVrdoy4wnE=;
	b=plQyC+M2KzD70YQbE/E8RIPi+QPaZRyIMMyZmqDdCoNbRKl0cX9fk0BwXTB/JKO1N96KHO
	qLcWINZiAqq25ltHOUAEBoUGvBFuz93SwRDAZNkG92uzBvFBhpwN5hSkYU3QXmQkWGfwxy
	hpb4yQlmi60F/YGqrWb+vZB5MZRFgbBHeAQKASLk6ycJlvydvT2JoOltRbX9gW7zY/ZZTQ
	FTVHX/clQAqrkhFlJvxKpcKdIIKuzHU0KHBAJmHt0Au17KqOdDi/AUKxJzpZR8JWXBmlyH
	Vva3+4TK5YWTKZMvTcAmqHvZXZjjmOQjRtAN8oTyAcfLmreN59KjPjRq0aswtg==
Date: Thu, 19 Jun 2025 11:44:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Aleksandr Shubin <privatesub2@gmail.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20250619094407c4c849f3@mail.local>
References: <20250427142500.151925-1-privatesub2@gmail.com>
 <20250427142500.151925-2-privatesub2@gmail.com>
 <20250512235619.30cff739@minigeek.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512235619.30cff739@minigeek.lan>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdekudegleeiteefgfekteevieeuudekfeeiudeiheduleeuueeuudfhffeuudfhnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpihhnfhhrrgguvggrugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedvrggtjeemfhgvgegvmeehiegrugemtgekvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedvrggtjeemfhgvgegvmeehiegrugemtgekvgegpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrnhgurhgvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehprhhiv
 hgrthgvshhusgdvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepuhhklhgvihhnvghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_024414_541241_FD6F3E04 
X-CRM114-Status: GOOD (  32.65  )
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

On 12/05/2025 23:56:19+0100, Andre Przywara wrote:
> On Sun, 27 Apr 2025 17:24:53 +0300
> Aleksandr Shubin <privatesub2@gmail.com> wrote:
> 
> Hi,
> 
> > Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> > controller witch is different from the previous pwm-sun4i.
> > 
> > The D1 and T113 are identical in terms of peripherals,
> > they differ only in the architecture of the CPU core, and
> > even share the majority of their DT. Because of that,
> > using the same compatible makes sense.
> > The R329 is a different SoC though, and should have
> > a different compatible string added, especially as there
> > is a difference in the number of channels.
> > 
> > D1 and T113s SoCs have one PWM controller with 8 channels.
> > R329 SoC has two PWM controllers in both power domains, one of
> > them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> > 
> > Add a device tree binding for them.
> > 
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> > ---
> >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 84 +++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > new file mode 100644
> > index 000000000000..4b25e94a8e46
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > @@ -0,0 +1,84 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner D1, T113-S3 and R329 PWM
> > +
> > +maintainers:
> > +  - Aleksandr Shubin <privatesub2@gmail.com>
> > +  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: allwinner,sun20i-d1-pwm
> > +      - items:
> > +          - const: allwinner,sun50i-r329-pwm
> > +          - const: allwinner,sun20i-d1-pwm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    const: 3
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus clock
> > +      - description: 24 MHz oscillator
> > +      - description: APB clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: hosc
> > +      - const: apb
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  allwinner,npwms:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The number of PWM channels configured for this instance
> > +    enum: [6, 8, 9]
> 
> Do we really need to be so restrictive here? The IP has an
> "architectural" limit of 16 channels (due to the MMIO register layout
> and status/control bits usage in some registers), so can't we just leave
> this value to be anything between 1 and 16 here? If people configure
> this wrongly, it's their fault, I'd say? Without confining this further
> based on the respective compatible strings this enum is less useful
> anyway, I think. The Allwinner A523 uses the same IP, and supports all
> 16 channels, the V853 implements 12, that's what I quickly found
> already, and there might be more examples in the future, so I'd rather
> open this up.
> 

Do we really need this property? I feel like the number of PWM channels should be
something the driver could infer from the compatible string as we are going to
have one compatible string per SoC anyway.

> > +
> > +allOf:
> > +  - $ref: pwm.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-r329-pwm
> > +
> > +    then:
> > +      required:
> > +        - allwinner,npwms
> 
> Can't we just simplify this by always requiring this property? As
> mentioned, there will be more SoCs with different values, so just
> omitting this for the D1 seems odd.
> 
> Cheers,
> Andre
> 
> 
> > +
> > +unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#pwm-cells"
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/sun20i-d1-ccu.h>
> > +    #include <dt-bindings/reset/sun20i-d1-ccu.h>
> > +
> > +    pwm: pwm@2000c00 {
> > +      compatible = "allwinner,sun20i-d1-pwm";
> > +      reg = <0x02000c00 0x400>;
> > +      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
> > +      clock-names = "bus", "hosc", "apb";
> > +      resets = <&ccu RST_BUS_PWM>;
> > +      #pwm-cells = <0x3>;
> > +    };
> > +
> > +...
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

