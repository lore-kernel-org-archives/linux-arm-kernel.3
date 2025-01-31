Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A0AC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmJv3L+eZ/sNXSvW474bg5iy0+Z7o6xX/pDPZGEj3Ng=; b=HT41Xnd4wbLQMYOKMuBEwffKkb
	Wns/9e1lcpIXJzY9iiZU0y68sdqOt8ZQEK4CdUwjIhT/mHCL076Uwi8r4wn4eAUar3qqYtSU3q6au
	gajs8u/QqJI/wkr/7M8AfRQKsbD9Yc8xO7kRtw81ruAjX9nGQ5kjYJxCTK1k8fVBIlQmsn2g2xWgG
	tyRFTZhhHwNPHdsm/dNa7FZhos4koVzYU8WQ/9VfPpZ694FlxzktfSwim+V3YdYVPpmJiANJWIIp0
	NZoWFb2yx9vilzljLbH+TNQARC5MuFGSEDRY/LZ1D6GVUTpCCE5IG5OOE8rSBUgosrVEx8Dln8N0J
	Jf7RT5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnak-0000000AKi8-0a0X;
	Fri, 31 Jan 2025 09:45:38 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnZR-0000000AKd8-1oIZ;
	Fri, 31 Jan 2025 09:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738316631; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O+8GsUz06uMmRr7Bdid+cRMrb/6hpguS+VcdRiHKxUb0tgU9pj3BBrKn+4j4+Kz9PyVzR5WjMiqCG4TRt68fqtf+V9Cv/eLnf3jdnzQSLkYMoW3rWnD2jqz4TAU23ThZTNM3xLlCCFSF3z6CAabNZEnfmXkcAF1tDUesprhWu4Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738316631; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MmJv3L+eZ/sNXSvW474bg5iy0+Z7o6xX/pDPZGEj3Ng=; 
	b=S5ddfO5ntiwA7c1EPKB0bQozZND9SWf7CG/qlVkrawkhkUcZVKXN3BzOtyrWsm5QYzDKvZgiQh2O16DRoPVK1SA1p0Fwgz9BQU7llGKQP6kTsHwvu7uvbsi1f8nLVc+cPIrwQbaN7A+ktEffkV6/ujuNs4jogH58eHUIEP3atN8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738316631;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=MmJv3L+eZ/sNXSvW474bg5iy0+Z7o6xX/pDPZGEj3Ng=;
	b=cBHUYUO6+5+VBiWBdHybhQgVtrqBelSEtdU26DaI4swbkAZMHBCjCA8kNdmhC4jS
	6mMARl6eg5rvoXvFaRKixZQV57n6Nf6BOZ8lNhxhflpcHCgCbl547vZXC4VgRcWJhvy
	6aHjMT86T7YC/hZwA2ZvL/1ZTflRrF8R39v2IlPs=
Received: by mx.zohomail.com with SMTPS id 1738316626127798.141295591807;
	Fri, 31 Jan 2025 01:43:46 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Golle <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: rng: add binding for Rockchip RK3588 RNG
Date: Fri, 31 Jan 2025 10:43:41 +0100
Message-ID: <4955605.GXAFRqVoOG@workhorse>
In-Reply-To: <979564a4-c8e9-4427-8019-349d0794d9af@kernel.org>
References: <20250130-rk3588-trng-submission-v1-0-97ff76568e49@collabora.com>
 <20250130-rk3588-trng-submission-v1-2-97ff76568e49@collabora.com>
 <979564a4-c8e9-4427-8019-349d0794d9af@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_014417_546859_77B7239B 
X-CRM114-Status: GOOD (  30.12  )
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

On Friday 31 January 2025 09:30:51 Central European Standard Time Krzysztof 
Kozlowski wrote:
> On 30/01/2025 17:31, Nicolas Frattaroli wrote:
> > +title: Rockchip RK3588 TRNG
> > +
> > +description: True Random Number Generator on Rockchip RK3588 SoC
> > +
> > +maintainers:
> > +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-rng
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: TRNG AHB clock
> > +
> > +  # Optional, not used by some driver implementations
> 
> What driver implementations? Downstream? They do not matter, because
> they are full of all sort of crap.

Downstream and this very driver in the series. The patch includes a lengthy 
explanation of why all known implementations have foregone using the 
interrupt.

> Can this block have interrupt really disconnected? This is the question
> you should answer.

I do not have the gift of prescience. If you want me to make the interrupt 
required even though it is pointless just because all hardware that implements 
this that I'm currently aware of does have the interrupt then I will add it as 
a required property.
 
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  # Optional, hardware works without explicit reset
> 
> Just because bootloader did something? With that reasoning nothing is
> ever required because firmware can abstract it. Either you have there a
> reset or not. In this particular case your driver is irrelevant.

No, it's not the bootloader that does it, it's the hardware itself. It's 
power-on reset. Hardware can reset itself without software, I don't know where 
the assumption of it being done by the bootloader comes from.

> > +  resets:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> 
> BTW, there is a binding for Rockchip TRNG, with a bit different clocks
> so I have feeling yours is incomplete here.

I know and they're not. As the cover letter states, this is different hardware 
from the other Rockchip TRNG. This hardware only has one clock. It is a 
separate binding with different clocks because it is different hardware.

The patch's message also states this:

> [...] and a standalone RNG that is new to this SoC.
> 
> Add a binding for this new standalone RNG.

It's a standalone RNG that is new to this SoC. It has different registers, and 
different clock requirements.

> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> > +    bus {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      rng@fe378000 {
> > +        compatible = "rockchip,rk3588-rng";
> > +        reg = <0x0 0xfe378000 0x0 0x200>;
> > +        interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&scmi_clk SCMI_HCLK_SECURE_NS>;
> > +        resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
> > +        status = "disabled";
> 
> Examples cannot be disabled.

Okay, I will fix this.

> > +      };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index
> > bc8ce7af3303f747e0ef028e5a7b29b0bbba99f4..7daf9bfeb0cb4e9e594b809012c7aa2
> > 43b0558ae 100644 --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20420,8 +20420,10 @@ F:	include/uapi/linux/rkisp1-config.h
> > 
> >  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
> >  M:	Daniel Golle <daniel@makrotopia.org>
> >  M:	Aurelien Jarno <aurelien@aurel32.net>
> > 
> > +M:	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Like Conor said, this is not really relevant and should be a separate patch.

Should just the added M be a separate patch or also adding the file to the 
MAINTAINERS file? Because if the latter is separate then I think checkpatch 
will yell at me, and if the former is separate then the binding's statement 
that it is maintained by me is disconnected from what's in the MAINTAINERS 
file.

> 
> 
> 
> Best regards,
> Krzysztof





