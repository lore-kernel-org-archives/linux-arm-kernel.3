Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F5CC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGCi7JGudYz4ih1yv+RTXMGqMbQdRYeEJWnczslWMzw=; b=wi8KA1wAW6WjF7ExXcELRcqhUJ
	cw8qW7ltIYBtrgOMtGYCxXdw44R0W/e1Lhnz+kWxayiA9DeFN9xCJ6tgL43gj2+po49wY6OjlGKrP
	i+vpQu9mXKDlx34sXz5sNNuMVvXcRN//nhmtvd01eaW0SMdqcd+/DvU1WJVgZLJnp8qvCqu8KOy9i
	lKiQwm+LNZ3yg7rj4cKn5KOwZE3QKR3aDcT6mjO79TC6awajKQNEJf51cf9SlTPdHQyVGOqefuwS7
	s9MOpk7Z9KeiEh3GDjz8LRniwy1awrUqN15+8sJnYZEAtbabuRGhZuriOZ11It2vaxuBlF7QoXLcQ
	BlmkLE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hoH-0000000EyVv-3tBO;
	Thu, 10 Sep 2026 16:39:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hoF-0000000EyV9-3oq4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:39:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49b965570d7so474365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789058374; x=1789663174; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGCi7JGudYz4ih1yv+RTXMGqMbQdRYeEJWnczslWMzw=;
        b=LwtdeXBOkvLXldjRUFyR2Srdw0/RSz4GZowNw3BJ+J7mVNXQZ2Wr7lW1ix11mnfapy
         GrPhtLt2KmbWGntm8Uq38h53onsRaA1BrsOiRrym9Hd4R32pI8YAlMkQWi/a/Bga4Jq3
         Bo7ERNjSgjrNzzqNXOQ+fTtm/7F0IA1ytCEEXTJNQCd+BPzP8LvPWsAlSKMVozdbCXoE
         StII46+X5uXapO52Uq0Sa56vvBplJpMCaiFYOrCYEDkLGpEjnbS5v89FdAABzrtVQ2ZL
         7s1AYtHnfvh48k8+h8slQ+8dtKWVfoD+9zlLSI5rGLuT0CqyqX/fgKei4x6v50ckgM/Q
         Urlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058374; x=1789663174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGCi7JGudYz4ih1yv+RTXMGqMbQdRYeEJWnczslWMzw=;
        b=NbdYaKwdSfO5f9hTK5EYbDoCCCc2O/UEAjIKFDSeYkoxGKamgkLvV/iLY4j4ZG4phh
         IuiukWmlZEo87XRmhEfmGhbUObwnqDWM0S9z1uDDZb+AB72vlh5PzftcOaqCV1VbUMHm
         7VteD4uI2eG3FGobphzjP8RyCQy8XGr9Y08w5ghBsSsnSi01d/ejX5v4o1nvIpxrrDF/
         fsB83eUXvPbDGvUhV2PQNXYh4Y+3bDB7+zGakhOV231NJjeulLz8yyx+wnYk3Rj8Ao5i
         P76gtpkESkH4CkifZSih1uS9tDWJBF6QIN+ReqmW/WM8tTzswj1hgZMW69bZoRhHWfnz
         W+4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw8SlFXzHxGf+9QK/z1n5a9PSfrTWAvdb43l8J61UXrG/Wrc+loyoF5QMkrYw6ynpfLQkTRq+2sMHn2CIcJOBg7@lists.infradead.org
X-Gm-Message-State: AFuF++nyJwfavZ0opAZk/t2L9Dcd+v5mDF4u/hjvx16isEsnHB1nZsC4
	+zn9lvPFdfUWkMBxPfTIOClWcKZnAP02ZHQjg76/fFPqXH0LXWSlAPVU
X-Gm-Gg: AYBFou1y+BpmzPfqoVWsaG9pAKSZD41YniCNaBlpuZsQd/Ozj7kMPT0y7D8/eaNd/nP
	Fo5JDFSO4sg5i+NJEMMe4Hx1ErRc12ZruZhoPZKKP2X8qCRrjZ4qUJi4WHX1GNrclkm80FChprz
	m59vunKJa413FAMMfBZHwC3VXzF7d6esLubijX4mHezNzH7CFz4SAAODJPoCSybvjz4pt+5XW6A
	qTwZldhKQRvV860VnHU1pyMZF2dvvCXBI2FTmjdOL5opB6DXTVesZ53zzHetULMSFadKA0HLqp1
	jnpZKOcRCfkiN2a3xNtDLbnzC1IDL/qsOVvjSJjA4fPcVgP0Mnr8aMVCuHJsZlMm4uk9H0XC/zV
	mNH+EXTuZKI1eu3xh1I/LBIqA83LPuyH0CSyC7ePRASG50jbEZN/iqnzRSEARmX+6Exda0YjaPL
	CVCakqdaT6VTSTjMrYndwyEWcPTQtDwK+IDlwJ1xUsPuGfd7OmV0crC0ZkCs+u5QbycihZXZII6
	KKbfXFjk7oIV1nAYwYGeA7nm5WLyFBjg8UsThaCOiqYrDLFeGP5h6xrCc9ivD06aR+UmnW52Q==
X-Received: by 2002:a05:600c:6383:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49cf820507cmr379154095e9.5.1789058373630;
        Thu, 10 Sep 2026 09:39:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm155013825e9.3.2026.09.10.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:39:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 18:39:30 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqLaLmz7n31P6igy@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_093935_977595_C6628E45 
X-CRM114-Status: GOOD (  33.81  )
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

Thanks for reviewing this so quickly.

On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Toradex boards route the sideband signals of their 24-pin camera
> > connectors to different GPIO controllers. Camera overlays which name
> > those controllers directly must therefore be duplicated for each host
> > board.
> >
> > Describe reset, power-down, detection and power-control as
> > connector-local GPIO functions. This lets an accessory overlay remain
> > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > remain described separately because the GPIO nexus does not abstract
> > them.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > new file mode 100644
> > index 000000000000..06e6836e1aa6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > +
> > +title: Toradex camera connector GPIO nexus
> > +
> > +maintainers:
> > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > +
> > +description: |
> > +  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
> > +  clock, power, and sideband GPIO signals. This binding describes the sideband
> > +  signals as a GPIO nexus. The other connector resources remain described by
> > +  the surrounding board device tree.
> > +
> > +  The nexus exposes connector-local GPIO function numbers to camera overlays
> > +  and maps the functions wired by a carrier board to their GPIO controllers.
> > +  GPIO specifiers contain a function number followed by standard GPIO flags.
> > +  A board may omit functions which it does not wire.
> > +
> > +  The function numbers are:
> > +    - 0: Camera reset, connector pin 11
> > +    - 1: Camera power-down, connector pin 22
> > +    - 2: Camera identification, connector pin 23
> > +    - 3: Camera power control, connector pin 24
> > +
> > +properties:
> > +  compatible:
> > +    const: toradex,camera-connector
> 
> Name is too generally, suggest use board name, we got similar comments at
> 
> https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.nxp.com/

I saw that and it made me reconsider this name.

However, I believe that in our case it is specific enough. It is really
the same on all our carrier boards, and Toradex specific. It's also only
for cameras, which is more defined than just "io". Curious to see if
others agree or if we should come up with a name for this.
 
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-map:
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  gpio-map-mask:
> > +    items:
> > +      - const: 0xffffffff
> 
> are you sure need full 32bit, only 4 pin, maybe 0xf should enough?
> 

Indeed we could reduce the size of the mask, but I don't really see the
value in it. Isn't it good that a user can pass through the full GPIO?

> > +      - const: 0
> > +
> > +  gpio-map-pass-thru:
> > +    items:
> > +      - const: 0
> > +      - const: 0xffffffff
> > +
> 
> missed
> 	gpio-controller: true
> 

This is one thing I didn't fully understand about the GPIO nexus
concept, why would we need this gpio-controller flag? Isn't the gpio
controller behind the nexus? The nexus just maps onto it. The actual
controller would be on the SoC or an expander.

> > +required:
> > +  - compatible
> > +  - "#gpio-cells"
> > +  - gpio-map
> > +  - gpio-map-mask
> > +  - gpio-map-pass-thru
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    camera-connector {
> > +        compatible = "toradex,camera-connector";
> > +        #gpio-cells = <2>;
> > +        /*
> > +         * 0: Camera reset, connector pin 11
> > +         * 1: Camera power-down, connector pin 22
> > +         * 2: Camera identification, connector pin 23
> > +         * 3: Camera power control, connector pin 24
> > +         */
> > +        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> > +                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
> > +                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
> > +                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
> > +        gpio-map-mask = <0xffffffff 0x0>;
> > +        gpio-map-pass-thru = <0x0 0xffffffff>;
> > +    };
> > +
> > +    gpio1: gpio-controller {
> > +        #gpio-cells = <2>;
> > +        gpio-controller;
> > +    };
> 
> Need't gpio-controller.
> 
> Frank
> 

This ties in to my same confusion above, could you explain why or point
me to a relevant example/docs?

Thanks and kind regards,
Ernest

