Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192FFEDF050
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 07:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VtkmaXYDRoBb0Ii/zZutz9SPx4ofKw8c7aX2qO71JI=; b=siuM0QaOe6EDkXuujfG8MEnU4C
	qbK4Kuj8ZKca6D4x0YC6LNcH0O0V5M3iUF8Uae9tVm1VWAMbG/aqkx7IeKjGEFCdMdX738pAtukkB
	KIykexFEd7F8t8/OsCSnidPTGpHxkHNGJDXvA2cbASSebLR8zuXbloQLVTeXAVxl34sSum2tOQ1hu
	lchbUuEgsLJU2HgUAcbIw/18TTzYE9FXGp90DVZ8KfgQT8btOpLLR4hUkZUfD3vLdWe6x1YY9fZ5A
	MjyF/sFvCLNwpBNBIc+DbTk0Kr6L+83lueM9w0ggxnbAnEwzYABeJe3QurG8RQan4FNYeYG9Wmq4D
	QurMo1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqQxd-00000001i9M-1vco;
	Thu, 12 Feb 2026 07:18:01 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqQxa-00000001i8f-1gXi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 07:17:59 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-65807298140so4304600a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 23:17:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770880676; cv=none;
        d=google.com; s=arc-20240605;
        b=PALb0yuCZWh6f1eU/k0I/PkqhWCAlUFS296lNb8OsdpWnCAq2sqcOwT/HcsSkXEyD6
         yDhXOa/y+3Cf6vBogtIMX9Xtnvh7mf2NOzEK7jvEn80UBSWHJyYEDjWDzhGkIGg9Fjp0
         JCpOK0y8VTX3qTIgp0zqKA4QMiFL5Dmmym1lgocfxMgc8KvJaaI+CQCjMyxGtj27QxX+
         wPIJXQpnUtfAjavN9MlCWL3zu5xN51m9t1U65Mejx5ovZuO7MZrUvImRrdRgTesoL+40
         OG/zXWwRXK9LO3UB32WnIDgEA3oXZLmCQKaTkDLNGUo9LYX2AO78EdWweF+m86sVBQWP
         bklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4VtkmaXYDRoBb0Ii/zZutz9SPx4ofKw8c7aX2qO71JI=;
        fh=bxdpDkQTsmv55hZhJ9N8f8nRKofFS3KMlh3aBHm8SGE=;
        b=f0WgdO2+WjWguzcrD1Cn/fAVVkYeGK/XJvDCkpaE6kjaMtRdho+2bhbZqgorLvTew7
         g2niHRM8k0+LRtu+ckQAAljhOuRy+sxZgxtkX/y7CMCsqAxt+0gcfnZvn5WRMZibXpje
         hCo5HQiCEJZm4zvPu0S49ioK3N6Pu/3VeyA4SNIzuz//I2qxZaqNh9M1+PHTRBGZn3hi
         UPsygvRC87QuJ+GRK8Hw+Mir4Z2BbvbwPjSVxbtHeFl92/cj7lkYcZ4wAFY8wrf0jhMU
         uIXwydB3JdcKRBfw34wTuZW2fqBDqvoeM7I+ZFQnNZTmW9U+FO0s9CQ+NAjknjicKbA7
         IYCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770880676; x=1771485476; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4VtkmaXYDRoBb0Ii/zZutz9SPx4ofKw8c7aX2qO71JI=;
        b=FenPVZ72k8X26VhncQer2c5yIdo/5FnA51xs7wQqsu7uCPfCkbvTO5L998KdsiqrrX
         nnbpHxnmJa4SqDvf2MlBrbhHZ8tlRTgWKFcP685Rj0AzRE9+5ARn5xAIRZWYnCp3c2l4
         3jEc1jkZBugNw7+S+nTpgmuZHhtXdG7YrMZYfMDEUhuQjM+1JFBJmDbT2Pmfw9RMVBCF
         ZPLS5IW2TB5UqX241E1bxzSop1FIj0cCR0WVEXjZMfxSjQVuX/5EWMQTp8BZR/R3kW1M
         yvSpCU+tRb5ux9JxtvhZWhpBI6clLtsVIb8TYYrx4XmwTUYxTIA0/Q92TkKYI+SLJc2P
         3Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770880676; x=1771485476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VtkmaXYDRoBb0Ii/zZutz9SPx4ofKw8c7aX2qO71JI=;
        b=pRk735ybr5YlYuqPC0Fkl/xe4X32FcJa2mvMbTFjhehQCgH8PFbBsNArll5BmQ7yaD
         VtntSUWkJxLpWr3nu+nuLvvcs4eqdA75Xi8hSUHzPrv6iGrKobvjMAGcX1zj4l0yeQLT
         J77kvnWqrmAAEBmNVDkWqW2PUjkDx4paVx2jJqhH9vX4C4Mfv7yfBJOMfuAD/n3GQUfR
         ZvuV54PHkVyIDElABs2ayBhism42Rg2ALCKWz7Z1hd+PH1/97qlimUjIEezB2DylIqTe
         2YsKziDuYLYIiOQlhAw0r+1FUdeiOnYaDp5JVSv+9aWqxtTBPWGCb8nAxa6SMcfVBECK
         sN1w==
X-Forwarded-Encrypted: i=1; AJvYcCVjG+iooCiEhiORLOLumMz2ue69W5UltEfpILXksfKmupMDomVkPoPa73UAVWT9qFDFhKXhipbLT96E3ELfuC/A@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzh+QZ3/sFpxHzbD+DpDWWyPz0Dvzb88XZidekXn9t5KkAxe2F
	6Hq61MAo62L0/pBhY8wjmmmp71z6louQCCN9MAekLjkDkmISJk2vvbadFWSNHcAWvbh/4ILkagE
	SQMXFeeNJsYd5bqS5WSY11xA3o6jQm3SbbBEBgMC1iw==
X-Gm-Gg: AZuq6aKk9LwYXktOcwwcqPTO0jq0qRgS2br41hzUveJOb9Z7IU+vSuy/FLrMj873Z9S
	HgGeR9qjjIHGcW5RzN4OyR2ZuBDC6wGiXh0tkayrHKU0cI4lDzBqMmlBVWNXiH4wktz08yoqntb
	NAUvFvI1zEPeqQFgRwrY1IMmhaC1NlQYTEeBA/sM/TA6C0ybYavpsKm4rNOEADRM3fMgRWXVwnD
	OlzCtZmVrG3Jv+4/1ivJTFUYVwwF4+tY8tTvsVTedPYYv7pXbh2H33CUchojKjoZuczKc04lj8b
	N+d17kwrcT2gJP9xiJbEX7uP1MLhYH75Z9RX
X-Received: by 2002:a05:6402:2690:b0:658:bab5:57f4 with SMTP id
 4fb4d7f45d1cf-65b9db110b9mr587533a12.23.1770880675576; Wed, 11 Feb 2026
 23:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20260203161917.1666696-1-vincent.guittot@linaro.org>
 <20260203161917.1666696-2-vincent.guittot@linaro.org> <20260210004011.GA2188625-robh@kernel.org>
In-Reply-To: <20260210004011.GA2188625-robh@kernel.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 12 Feb 2026 08:17:44 +0100
X-Gm-Features: AZwV_Qj567pfCDwzOGI7nJVgtwTDzptXPKhrNBHBCOrwOw7GShjTLukyePRdLLo
Message-ID: <CAKfTPtA299R7yn3r=tCqhhP_tK3E_UpGSMrDLyRP4Ccwt1m58g@mail.gmail.com>
Subject: Re: [PATCH 1/4 v2] dt-bindings: serdes: s32g: Add NXP serdes subsystem
To: Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	p.zabel@pengutronix.de, linux@armlinux.org.uk, ghennadi.procopciuc@nxp.com, 
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	horms@kernel.org, Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_231758_550307_7A537477 
X-CRM114-Status: GOOD (  27.00  )
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

On Tue, 10 Feb 2026 at 01:40, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Feb 03, 2026 at 05:19:14PM +0100, Vincent Guittot wrote:
> > Describe the serdes subsystem available on the S32G platforms.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  .../bindings/phy/nxp,s32g-serdes.yaml         | 154 ++++++++++++++++++
> >  1 file changed, 154 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > new file mode 100644
> > index 000000000000..fad34bee2a4f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > @@ -0,0 +1,154 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/nxp,s32g-serdes.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xxx/S32G3xxx SerDes PHY subsystem
> > +
> > +maintainers:
> > +  - Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > +
> > +description: |
> > +  The SerDes subsystem on S32G SoC Family includes two types of PHYs:
> > +    - One PCIe PHY: Supports various PCIe operation modes
> > +    - Two Ethernet Physical Coding Sublayer (XPCS) controllers
> > +
> > +  SerDes operation mode selects the enabled PHYs and speeds. Clock frequency
> > +  must be adapted accordingly. Below table describes all possible operation
> > +  modes.
> > +
> > +  Mode  PCIe XPCS0           XPCS1           PHY clock       Description
> > +                SGMII                SGMII             (MHz)
> > +  -------------------------------------------------------------------------
> > +  0  Gen3    N/A             N/A             100             Single PCIe
> > +  1  Gen2    1.25Gbps        N/A             100             PCIe/SGMII
> > +  2  Gen2    N/A             1.25Gbps        100             PCIe/SGMII
> > +  3  N/A     1.25Gbps        1.25Gbps        100,125         SGMII
> > +  4  N/A     3.125/1.25Gbps  3.125/1.25Gbps  125             SGMII
> > +  5  Gen2    N/A             3.125Gbps       100             PCIe/SGMII
>
> Mixed tabs and spaces. Drop the tabs.

okay

>
> What's not clear to me is do you have 2 or 4 lanes?

2 lanes per serdes
as an example mode 0 is one PCIe x2 lane
and mode 1 is one PCIe x1 and one xpcs0/SGMII on lane 1
or mode 3 is one  xpcs0/SGMII on lane 0 and one xpcs1/SGMII on lane 1

>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - nxp,s32g2-serdes
> > +      - items:
> > +          - const: nxp,s32g3-serdes
> > +          - const: nxp,s32g2-serdes
> > +
> > +  reg:
> > +    maxItems: 4
> > +
> > +  reg-names:
> > +    items:
> > +      - const: ss_pcie
> > +      - const: pcie_phy
> > +      - const: xpcs0
> > +      - const: xpcs1
> > +
> > +  clocks:
> > +    minItems: 4
> > +    maxItems: 5
> > +
> > +  clock-names:
> > +    items:
> > +      - const: axi
> > +      - const: aux
> > +      - const: apb
> > +      - const: ref
> > +      - const: ext
> > +    minItems: 4
> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: serdes
> > +      - const: pcie
> > +
> > +  nxp,sys-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
>        maximum: 5
>
> Though isn't this redundant with the child nodes? You could use the
> standard 'phy-mode' property in each child.

not really because we can have mode 1 but only a node to describe
lane0 for PCIe x1 if the lane 1 is not used

>
> > +    description: |
> > +      SerDes operational mode. See above table for possible values.
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +patternProperties:
> > +  '^serdes[0,1]_lane@[0,1]$':
>
> Do you need to support serdes0_lane@0 and serdes1_lane@0 (or similar
> with "@1")? That's illegal as you have 2 nodes with the same address.

okay, we can find other naming

>
> > +    description:
> > +      Describe a serdes lane.
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        enum:
> > +          - nxp,s32g2-serdes-pcie-phy
> > +          - nxp,s32g2-serdes-xpcs
>
> Seems like phy-mode would be sufficient. Are these separate blocks from
> the parent?

Isn't phy-mode only for ethernet phy ?

here we have either a PCIe phy or a xpcs instance which are referenced
with phandle

>
> > +
> > +      reg:
> > +        maxItems: 1
>
> Just 'maximum: 1' instead.

okay


>
> > +
> > +      '#phy-cells':
> > +        const: 0
> > +
> > +    required:
> > +      - reg
> > +      - compatible
> > +
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +  - nxp,sys-mode
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    bus {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +        serdes0: serdes@40480000 {
> > +          compatible = "nxp,s32g3-serdes", "nxp,s32g2-serdes";
> > +            reg = <0x0 0x40480000 0x0 0x108>,
> > +                  <0x0 0x40483008 0x0 0x10>,
> > +                  <0x0 0x40482000 0x0 0x800>,
> > +                  <0x0 0x40482800 0x0 0x800>;
> > +            reg-names = "ss_pcie", "pcie_phy", "xpcs0", "xpcs1";
> > +            clocks = <&clks 1>,
> > +                     <&clks 2>,
> > +                     <&clks 3>,
> > +                     <&clks 4>,
> > +                     <&serdes_100_ext>;
> > +            clock-names = "axi", "aux", "apb", "ref", "ext";
> > +            resets = <&reset 9>,
> > +                     <&reset 8>;
> > +            reset-names = "serdes", "pcie";
> > +            nxp,sys-mode = <1>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            phy_pcie0: serdes0_lane@0 {
> > +              compatible = "nxp,s32g2-serdes-pcie-phy";
> > +              #phy-cells = <0>;
> > +              reg = <0>;
> > +            };
> > +            phy_xpcs0_0: serdes0_lane@1 {
> > +              compatible = "nxp,s32g2-serdes-xpcs";
> > +              reg = <0>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.43.0
> >

