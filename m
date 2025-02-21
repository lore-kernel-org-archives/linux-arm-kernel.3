Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52828C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NT+BJtGmQPBJxVdJtnETf4Hylev5huwZTuiokcMHso=; b=O0IOg7aeEI8MJhNPjhi1FYIPUk
	f1B5rkoX+NEbhLSizYmH88oiZUGkm9sKBnEv6+POuizjRxnKa5BfeWti79mno+QXzlp/N2zf37eJf
	/XJ4NXFENxcRHwND8zXxhSUwArMzsS3JFvA/WLIN+3BhRYq+lNv74PtrrW+2y+gdoCFDZhl6xpDS7
	cHGj7bZ8Foq5XfaLL73N4TAT97YHTcRYBOHps4Ze7th1v/J+u9tg62vognqP+ttXzKOcgKDF0SNq3
	flQDdprleOAh6gljGn2O9Dfk4i6z9YhPIQH0sBvyYeABBqE9ntDXyn94IeqPS2xZEFESJlcGZGqDv
	WEeUSwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlT6G-00000005eQ7-3sKx;
	Fri, 21 Feb 2025 13:29:52 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlT4m-00000005eDX-3bJ7;
	Fri, 21 Feb 2025 13:28:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1740144486; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CEWSyxZxoMOT30Lbo9c/GiuYjoKB6lCUpiX7XU0G/Y8ZiqpYqf3rBOyRZg3p3EUHlznUdn9nMDEklLTGSPhLqIzU8Fw5lc1z/YH4ZKY275MvVMGDDuDJOs4OAL56SOjQw6gy15xh3hALazhelUqafcJiGmIfSvjSzKVmIYXvHXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740144486; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1NT+BJtGmQPBJxVdJtnETf4Hylev5huwZTuiokcMHso=; 
	b=S86mae6WsnRg2XGXkrPfCqE7h05p93U6+lmxxLm0OXhnJTkS6Rhukhuh593E5UqWtXkx7hw4QWFuZTTKBP2RnjA0JR6eJ7Vc2a+6OagTK0+GThs8xkkz1FB1urqkF6uZyFCJyGWNITTVXqqU/Wl5MGfsjUMiyYIgTDB9nW9Xbpo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740144486;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=1NT+BJtGmQPBJxVdJtnETf4Hylev5huwZTuiokcMHso=;
	b=PuMLlOuWX0TxQ7RVYJKBcIdAjCg5FCDYgvjVenaUwWadc3X2osGRNo0qF+mSfFFc
	0aRd4Yf/iuxWI2wuedtZqG4B4iO1GCl234AiT4Jo3X7gIjX2PjbTlxyfKlQ0aUGXcTC
	p0CPmV3tSgS/1YUJxLKWsjScJ0XdjN/ekszEukDw=
Received: by mx.zohomail.com with SMTPS id 1740144484347820.7261259225404;
	Fri, 21 Feb 2025 05:28:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: thermal: rockchip: document otp thermal trim
Date: Fri, 21 Feb 2025 14:27:58 +0100
Message-ID: <4631308.LvFx2qVVIh@workhorse>
In-Reply-To: <20250219231036.GA3137058-robh@kernel.org>
References: <20250216-rk3576-tsadc-upstream-v1-0-6ec969322a14@collabora.com>
 <20250216-rk3576-tsadc-upstream-v1-4-6ec969322a14@collabora.com>
 <20250219231036.GA3137058-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_052820_963984_421A42EB 
X-CRM114-Status: GOOD (  24.03  )
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

On Thursday, 20 February 2025 00:10:36 Central European Standard Time Rob 
Herring wrote:
> On Sun, Feb 16, 2025 at 12:34:53AM +0100, Nicolas Frattaroli wrote:
> > Several Rockchip SoCs, such as the RK3576, can store calibration trim
> > data for thermal sensors in OTP cells. This capability should be
> > documented.
> 
> Is several most or a minority as this change is enabled for everyone.

Downstream has trim_h/trim_l nodes for the following SoCs:
- RK3502
- RK3528
- RK3562
- RK3566
- RK3568
- RK3576
- RV1126

If you'd prefer I split the bindings or add a conditional to only enable this 
on those specific compatibles, let me know. It is worth noting that all of 
these SoCs are fairly new, so I assume this is the design that Rockchip is 
using going forward.

Additionally, trim_base/trim_base_frac seem to only be set in downstream DTs 
for RK3562, RK3566, RK3568 and RV1126, so while I'm at it I'd add those to a 
separate conditional as well.

> > Such a rockchip thermal sensor may reference cell handles that store
> > both a chip-wide trim for all the sensors, as well as cell handles
> > for each individual sensor channel pointing to that specific sensor's
> > trim value.
> > 
> > Additionally, the thermal sensor may optionally reference cells which
> > store the base in terms of degrees celsius and decicelsius that the trim
> > is relative to.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> > 
> >  .../bindings/thermal/rockchip-thermal.yaml         | 44
> >  ++++++++++++++++++++++ 1 file changed, 44 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> > b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml index
> > 49ceed68c92ce5a32ed8d4f39bd88fd052de0e80..8d27ddefcc64e29f0faab0598888058
> > 02c948b41 100644 ---
> > a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml +++
> > b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml> 
> > @@ -40,6 +40,21 @@ properties:
> >        - const: tsadc
> >        - const: apb_pclk
> > 
> > +  nvmem-cells:
> > +    items:
> > +      - description: cell handle of the low byte of the chip fallback
> > trim value +      - description: cell handle of the high byte of the chip
> > fallback trim value +      - description: cell handle to where the trim's
> > base temperature is stored +      - description:
> > +          cell handle to where the trim's tenths of Celsius base value is
> > stored +
> > +  nvmem-cell-names:
> > +    enum:
> > +      - trim_l
> > +      - trim_h
> > +      - trim_base
> > +      - trim_base_frac
> > +
> > 
> >    resets:
> >      minItems: 1
> >      maxItems: 3
> > 
> > @@ -51,6 +66,12 @@ properties:
> >        - const: tsadc
> >        - const: tsadc-phy
> > 
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > 
> >    "#thermal-sensor-cells":
> >      const: 1
> > 
> > @@ -72,6 +93,29 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      enum: [0, 1]
> > 
> > +patternProperties:
> 
> > +  "^([a-z]+)@[0-9]+$":
> If each node is a sensor or channel, then make that the node name.

Will do in V2. Should the node name be something like e.g. `gpu` for the GPU 
thermal sensor/channel? Maybe suffixed with e.g. `-tsadc` or something, to 
disambiguate it from other mentions of the GPU, or is disambiguation 
unnecessary noise because it's evident from it being a child of tsadc anyway, 
much like cpu and codec aren't suffixed with anything in simple-audio-card's 
dai-link?

> 
> > +    type: object
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +        description: sensor ID, a.k.a. channel number
> > +
> > +      nvmem-cells:
> > +        items:
> > +          - description: handle of cell containing low byte of
> > calibration data +          - description: handle of cell containing high
> > byte of calibration data +
> > +      nvmem-cell-names:
> > +        items:
> > +          - const: trim_l
> > +          - const: trim_h
> > +
> > +    required:
> > +      - reg
> > +
> > +    unevaluatedProperties: false
> > +
> > 
> >  required:
> >    - compatible
> >    - reg





