Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A6EC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+odMspnKCTRijFn9P3g8Rcr1t0EreI5zprwmnUHlKY=; b=LsOHUPx6rykClV+1gOW4T773dp
	jKd13o013WKVZ1vlpYmV/9Y/zf9BjVD/HVglZfal7gmkWJu1fMUpqts+zHC1I9ZMC+VceT17WFl9f
	gazrnzdDBdPy22ajGC9XYj/F4BUmV4/m4dnAEr9y8/2W/21hZiNQR6lYhcE+jUtrAD91xA/6xgjhB
	yjkSn1a77xnMrnpUD5Pd6zm6uBlYDHHZLFvp1osPmHzWBd/fLLMcPDU2g5pwyLfXhqC4vwDHiI7tU
	N0ljNPKe8AsNErTMXmpiBhe7xude6EcQnjS1hGKdjCB1W7kC2PNqbfqXiHrM9kwkhmvzuMPKW8QUu
	B+QaQD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4lH-00000006gy6-16ZT;
	Tue, 11 Mar 2025 18:55:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4hO-00000006gQ5-1gyj;
	Tue, 11 Mar 2025 18:51:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso35524395e9.0;
        Tue, 11 Mar 2025 11:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741719089; x=1742323889; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A+odMspnKCTRijFn9P3g8Rcr1t0EreI5zprwmnUHlKY=;
        b=i1XWfypdM5e57Rj+rLDRWXJbZEUmt/jVN7LQjwgyzM7Fd68K+qc0NeRfV3CAawYXQJ
         u8721Um7yZbi3djmVLzSRBt6XOfBfIhzbsE+X+1CH76FzNC4nlwwDm13VUISmY+tEsJW
         Olgu/UXbXbo/KJWHe4DbZIKLUfrsILe/SFddW4WuLclNtSOd1VPyhV4nSf7KVfd6C1+3
         rO+6+3voT96YEorReHYSIvWcA85/xzTGnr6UYhulslLN+1csoDJKesgeS69dDvko6i/L
         9rnOjBGRBnhg6qpEL80kDBy/AcxCl6BkUPSwHIrcPKwnHw10JyBFEbj6sOghVHxuREjK
         eiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741719089; x=1742323889;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+odMspnKCTRijFn9P3g8Rcr1t0EreI5zprwmnUHlKY=;
        b=hNcR31HnvnpL1fJ7sLT2sg7Fv2ecdSO7CtdDiSH8nB/fNVRUfoj1lD4ymZOfUn5ubs
         JV6jv5xKnyIVaDp5XvdDXzVJCPZ63Kl5shcOC53QR+OzfySHU9PWK8UrKBjKNEe8CkKo
         dQWxHApoK7TQFeq3rUJHylt6sOY2zuNYvs/ojPB2+AWETb6NLVzG4Zv8dPoP6vJnXyB5
         yGx9GyweViYn7VQ6YG4auJuEm+DJj6vkc2BqhtJDhtwws85Eux+1+KzKPpYAFufxzPjV
         zV+4wyxUfBu/bpkGE6AxLpsgMPqONJl/O/+mnb2+hX0pT5Y1pWi6/M8cgIuCTy6OC/f1
         U2Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUD9kyuLlUZLgEA0ww2TieUYzs3q0K2WekXcwgBv45nDLRH+AP8Z0WOrFpn+FUH/Y2Uyp9EytgtBW/N@lists.infradead.org, AJvYcCVrlte1iw6qcDQBB6+Y36znZWCGcFFwxkHe4YhS1z5OCev/CzsaHHoZRvzZ1U3DXB55Mm7lgfdbYQrszLb7MQM=@lists.infradead.org, AJvYcCW3Iv0rpvDBotkV8zVQwFDWi03MlZJ1KSVnFvfKoemC5CxBcJDwirghF7pGWYaN9EGIvdrAlEFBdL/Xdga2ZKZg@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb6MtXOsSFrFRuxWubqUqKuyy8gJXD/E2jmdY0ocuYsvq0y3MM
	9vRE802Od+5BI4rLaXzONXM/4qP9nYa46ocfU+C9ueAt8ErgYWfv
X-Gm-Gg: ASbGncuQSImzNjVbVkKJ1MCStHj4UR4ZlOl7V0FKEtveMH4p+xhktjnCdhSuFprw+Do
	yRmgLNiuWzVh9uKv7yoPTVmuffOvRGxfMbT2sgVuvmqKafCaekBV25iPgNL8brDbusvR3TVz6O8
	C2vF1SnnelSnFId3KAZcA9zTxYsZIdLwgfAztSw2JmmqapiBoNtQP4Ybsm0qwClzlwolj0KrZk5
	unaMzS3+LNBZcRABn6VS2mumJAoElvkF+1tV8p0avl3uS7zaCXPWEyJ7IkP4iTyctXUHRbdPXDa
	EoOTzy6WLppkBQuJwjvRJMaLQiH+Ky2Qg7wF3FFWqCeANCLhtCMcjc+IA4AIB83Agg7+0eHN8kI
	N9WnYB1t2S2Jc
X-Google-Smtp-Source: AGHT+IHJ/p0rUk7K02/5PSbIuVcXhRWrqa5T/F5SFDgcDHsDiUclOdluiyUTfuiGgPWpQC5GN31lBQ==
X-Received: by 2002:a05:600c:4710:b0:43c:f47a:ab5f with SMTP id 5b1f17b1804b1-43cf47aac65mr90360605e9.20.1741719088409;
        Tue, 11 Mar 2025 11:51:28 -0700 (PDT)
Received: from Ansuel-XPS. (58.43.196.178.dynamic.cust.swisscom.net. [178.196.43.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfe0004sm18406539f8f.40.2025.03.11.11.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 11:51:27 -0700 (PDT)
Message-ID: <67d0862f.df0a0220.375bd.6b15@mx.google.com>
X-Google-Original-Message-ID: <Z9CGLcR4ZRwYcWKW@Ansuel-XPS.>
Date: Tue, 11 Mar 2025 19:51:25 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 09/13] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-10-ansuelsmth@gmail.com>
 <4f16d239-f540-45d5-b67a-767b09f1c70c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f16d239-f540-45d5-b67a-767b09f1c70c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_115130_445774_8FF22703 
X-CRM114-Status: GOOD (  27.70  )
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

On Mon, Mar 10, 2025 at 05:34:56PM +0100, Krzysztof Kozlowski wrote:
> On 09/03/2025 14:29, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> > for the USB controller.
> > 
> > Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > always supported. The USB 3.0 mode is optional and depends on the Serdes
> > mode currently configured on the system for the USB port. If USB 3.0 node
> > is defined, then airoha,scu-ssr property is required for Serdes mode
> > validation.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 106 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 112 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..39127cfb63a7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7581 SoC USB PHY
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description: >
> > +  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
> > +
> > +  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > +  always supported. The USB 3.0 mode is optional and depends on the Serdes
> > +  mode currently configured on the system for the USB port. If USB 3.0 node
> > +  is defined, then airoha,scu-ssr property is required for Serdes mode
> > +  validation.
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-usb-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  airoha,port-id:
> > +    description: Describe the physical port this USB PHY refer to. A dedicated
> > +      osciallator is used for each port for the USB 2.0 Slew Rate calibration.
> 
> typo
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> 
> I don't understand why do you need index property here (which are
> usually not allowed).
>

Eh... As said in the description this is really to differentiate the 2
different physical port...

Each port have a dedicated oscillator for calibration and these
calibration are identified by an offset (all placed one after another in
a separate register space).

Oscillator 0 for physical port 0
Oscillator 1 for physcial port 1

And model this is a bit problematic without an additional property, any
hint for this?

> > +
> > +  airoha,scu-ssr:
> > +    description: Phandle to the SCU SSR node for USB 3.0 Serdes mode validation.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  usb2-phy:
> > +    type: object
> > +
> > +    properties:
> > +      '#phy-cells':
> > +        const: 1
> > +
> > +    required:
> > +      - '#phy-cells'
> > +
> > +    additionalProperties: false
> 
> Also no resources in usb[23]-phy, so this goes to the parent level and
> you have phy-cells=2. Your DTS gives some hint that devices actually
> differ but the commit msg contradicts it, so I don't get. Do you have
> same IP block here or two different?
> 

SoC have 2 physical USB port.

Physical port 0 on address: 0x1fab0000
Physcial port 1 on address: 0x1fad0000

In those space there are registers to configure USB 2.0 mode and USB 3.0
mode for each physical port.

So yes no child node, phy-cells 2 and reference with phys = <&usb_phy 0
PHY_TYPE_USB2>, <&usb_phy 1 PHY_TYPE_USB3>; that totally works and hope
now the HW is more clear.

The real problematic part is the one above with identify the 2 physical
port.

> > +
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fe34c80b8d52..c2dd385e9165 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -753,6 +753,12 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
> >  F:	drivers/spi/spi-airoha-snfi.c
> >  
> > +AIROHA USB PHY DRIVER
> > +M:	Christian Marangi <ansuelsmth@gmail.com>
> > +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yam
> 
> Typo in extension/missing l.
> 
> 
> 
> Best regards,
> Krzysztof

-- 
	Ansuel

