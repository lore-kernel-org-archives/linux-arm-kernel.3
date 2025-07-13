Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C76DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aI3IegnHLk1YlYH5OXrEqUKPGdDnDTtSiSUAXFYZdTw=; b=kkT0aR8JJQXmepuIIcjgnuysQf
	4s30z3vfWy3fxWTRjv4Kt7LiCU2jtY7Lh2ws9nvQWESt+mUXhgDqbL2W9BJMX54HHMm6DM9/EgV9T
	3cLwWB1+weevQcmyzhH/F4gz4OBanAX9fpCwjyI+xoG2k6+4ERMuz+RK2IqBnsJesQTomUSg3eOnZ
	6xQid54zE2ioMbUkcqEmRA+jpOMcKy6DlEJ0rNPTK0XfvBDjuEqUmLy03EdhFrjp5/88Jfdm4X3/o
	o46h0yGt+T1v7wnxWZHDi/sh4T9IbpvG6I4fQb3wzOMTKqJcJzGDZtuw6FAWb76J1KS22qLA0tkZi
	+a2S6Ukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uayGg-00000000Hzj-1Qkx;
	Sun, 13 Jul 2025 15:05:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uayEG-00000000Hll-1EZb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 15:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0580EA4C138;
	Sun, 13 Jul 2025 15:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D22C4CEE3;
	Sun, 13 Jul 2025 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752418978;
	bh=j/0dmZ5J6FfiPtzDxVic7+L+BjaVfzjdrObrU3kASsg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XRu/mA34eHN+f2azJjwRmOiDaO9ZEnXvbFqybf7em3oBrHOwbYMSn0e0Kd3+NCif/
	 VThzq94RuGyI07eh0N+JQHVszh7pEXnAyP+zaEB2AO3wdwkvYn6LdNT7wFo54L7QGv
	 naagZcPV40gl90P/8f0zLu6TWYWN0ZQYCZcPXMvA7Caz0NbLoitpDNMpy+xPWHPg+0
	 0kzaQNuH7775QSrL6DmiOoYcA0ciC+STsKck7bbtWtk4GEShcqPdnD8/6NOQJgLeqd
	 Gc/hLiwqVfkuiljn9QyaYUDh/XCXV80+DAeex8urQtgEd94G3cel8YIvbvol8NAe4H
	 Qnejh6/EoTNWA==
Date: Sun, 13 Jul 2025 16:02:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: imx93: Add calibration
 properties
Message-ID: <20250713160247.0f22bbfe@jic23-huawei>
In-Reply-To: <2bcd758b-c2d0-488a-8ead-ec7fb39f93e2@baylibre.com>
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
	<20250710073905.1105417-2-primoz.fiser@norik.com>
	<2bcd758b-c2d0-488a-8ead-ec7fb39f93e2@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_080300_473713_81F30406 
X-CRM114-Status: GOOD (  21.38  )
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

On Thu, 10 Jul 2025 10:46:44 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 7/10/25 2:39 AM, Primoz Fiser wrote:
> > From: Andrej Picej <andrej.picej@norik.com>
> > 
> > Document i.MX93 ADC calibration properties and how to set them.
> > 
> > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> > ---
> >  .../bindings/iio/adc/nxp,imx93-adc.yaml       | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> > index c2e5ff418920..d1c04cf85fe6 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> > @@ -52,6 +52,27 @@ properties:
> >    "#io-channel-cells":
> >      const: 1
> >  
> > +  nxp,calib-avg-en:
> > +    default: 1
> > +    description:
> > +      Enable or disable calibration averaging function (AVGEN).
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +
> > +  nxp,calib-nr-samples:
> > +    default: 512
> > +    description:
> > +      Selects number of samples (NRSMPL) to be used during calibration.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 16, 32, 128, 512 ]

Allow 1 as a value and drop the enabled above.   Averaging over 1 sample
is same as no averaging and gives simpler binding.

> > +
> > +  nxp,calib-t-sample:
> > +    default: 22
> > +    description:
> > +      Selects sample time (TSAMP) of calibration conversions in ADC clock cycles
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 8, 16, 22, 32 ]
> > +
> >  required:
> >    - compatible
> >    - reg  
> 
> This seem like things that should be set at runtime rather than
> in the devicetree. Unless there is some justification on why
> these values depend on how the chip is wired up?

Further to that, I'd like to see some explanation of why we care
to change it at all. Is it ever a bad idea to enable averaging and
pick a large number of samples for calibration?

> 
> 


