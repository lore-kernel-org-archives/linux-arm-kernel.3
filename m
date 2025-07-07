Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058ADC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+GVfFR9uH5I3Nm9uSOIy1N/hutywImuzvv+yfWJVh0=; b=Pu2dkyZocXWKE+DJGHCAFpjxWY
	h1wAOGOG5xW7rJHkNKEebZobBNsRigfiiSwdTLFjL890vJ6TgpUJX2T5aLpUJkZ1ZkyH9giub+OJ9
	RvBOJNHx3f+wjQtAbB7wFZhm7exSv5yRS9f1JeR7m2WDbrBCK4JL7VubQkb40EocfhKNfH2Iopid8
	lxRWMtDDfSJnP77dK6p3/XPR4vg7gJdxmV4N6afu9JnhBlH1HuUXXPZzAnnSbdsPC5eFyX0XXiR8a
	mR6WtDjNuCS10v1N9929IY0HHX3V80nZRkMpfxgHjDKbtI/sVVl3Hc+kdA9vEg2yadgXSCxxzjU1q
	65JsvN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYftg-00000001chR-1VCV;
	Mon, 07 Jul 2025 07:04:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfrL-00000001c9K-3mQE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E54D5C5959;
	Mon,  7 Jul 2025 07:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B398C4CEE3;
	Mon,  7 Jul 2025 07:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751871711;
	bh=9ahq02cohoNR+foDAFJMfZIF5F/Fa4v6CbCiyG7PpJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pzx2rAgaDSMTqCdsMQAZzcI60zpddtZZXP3MPU/Q2kyKr/NHBzLVj2c30LiWuh7qh
	 ioXzgDGjdc1uIVuzM0XE90IwUs3WE8ktA/y9x31tvkj+zahhSqtvji/j18jEXCF2x6
	 InrfatdgvcM37KbdMgLRHKZO812uQSnnvv123mCNuZRNATAa6xAhEMXib9N8uuondR
	 b5ao/iR1S0BLl521Q0teBAYJZFSRbQPdnYfTjJksvJ5qdeKxgaBwhUte+gNfte2akq
	 P6A8E/Xqmrr5wUbpoznVgDc45x3m2OfhI9TsIH+cMGKYrrgnhZ92Pe1/R55d0FrzAX
	 x7KyRftNihRsg==
Date: Mon, 7 Jul 2025 09:01:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: add i.MX parallel csi support
Message-ID: <20250707-mustard-avocet-of-success-e68cbf@krzk-bin>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
 <20250703-imx8qxp_pcam-v2-1-188be85f06f1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703-imx8qxp_pcam-v2-1-188be85f06f1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_000151_978127_3F17EA51 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 03, 2025 at 02:33:06PM -0400, Frank Li wrote:
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fsl,imx8qxp-pcif
> +      - items:
> +          - enum:
> +              - fsl,imx91-pcif
> +          - const: fsl,imx93-pcif
> +      - const: fsl,imx93-pcif

This one should be an enum with imx8qxp.


> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pixel
> +      - const: ipg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

Use the properties/port schema instead, you do not have any properties
here (although then question - don't you need anything from video
interfaces?)

> +        unevaluatedProperties: false
> +        description:
> +          Input port node.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

Same here

> +        unevaluatedProperties: false
> +        description:
> +          Output port node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx93-clock.h>
> +    #include <dt-bindings/power/fsl,imx93-power.h>
> +
> +    pcif@4ac10070 {

That's a CPI bus from MIPI so cpi@, no?

Best regards,
Krzysztof


