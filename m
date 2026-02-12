Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DE2EEA850
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 21:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/DYwaq4YjSmI7ukV9pfGEdIud1nDWjs1loeTNl6Sg8=; b=lVNsTV1WOLq1WVCTlMJwBBfgji
	MpGVWPXQfh5t3n1qonDvBGuH5KKUsQ1Ne1lJwQw/eCBvGeV2UwaA2RiPFNszSismkQZoDuJ8A5o71
	SN/NFz+zHrYyeh67Bv6EkptvEvwnQGLkDDHXEBzahrMeYtooyY75aadvxAVJhhLcJSL0tTrhl4/Tl
	IVuTVv4FaTAORrhubxw0ECZtWcCeiqS5fDl5ig1SMKvcOnjlxsj/o2ZibUsqUzIsMDZGXO2brdhot
	fpasNmYsvUrK00dehZzXYKK25qSoAW63zy6n3sbZ5AQ1po6LY69iY5ehhSgQTm91jeyvwJyc3YEJM
	6q2kBv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqdxM-00000002dXj-45Xo;
	Thu, 12 Feb 2026 21:10:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqdxL-00000002dXJ-20UF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 21:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7060A6132B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 21:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133DBC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 21:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770930634;
	bh=mvdPPd9MTlAzGcEDHBnGOWpQp3W0SRG282ox6GhN6yU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MKedIuS7UHjUhPjWdfzeH7gPRKU9MGbhvFeNiyA4RcYeeFQjbnJ2z68IdbptFVcxS
	 Hftd1/ErHqlf6F1LHtuf3bP31mAy6nscejBalABRjCZKIDmhWUFI1LIDpWNA8p0LFq
	 jXxV1TPNwC2eQdhcjjP9vrht2WKzaRRnZL1sk6+G563h7bUBu3MRe7nsaEI9YFLwM2
	 2/217ZxlFyDOqe2kmSMZf2GkOpJSMKGi2/es+J/b9YUsxmD4tPlzB8nmvaYVsRLiPl
	 KDYDkaGYXDg4gIY0qg3Si7ap1P1O3BN+evLrMc9IWrM7y856l7oosyY5oDgaHCJIaG
	 P7CxikvdtY8sg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65a2fea1a1eso3638402a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 13:10:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1QZYe7qNc0D2mG8AbQI4Kx3ofk3tymUIIFbXIArb3kWsSS7V+yvyYtYHkT40JPVlC/jTbAcQ2KaxsBcFBpw7b@lists.infradead.org
X-Gm-Message-State: AOJu0YwG2u0SOnNNYS3RxZuGhb3UQF94kDrSMQ4q+9q3JwQsnaoyqFGm
	ucGTItxxUwXlHSU9KIxRARqC4NwE8IEpUKOLrLpxl7A0K6+rSEGRVfsP18Q9cVgTpM8/sxSLmec
	ytvbbR0WN11EMD9WrvCgk0UjI2HdWsQ==
X-Received: by 2002:a17:907:72d2:b0:b73:37aa:87c0 with SMTP id
 a640c23a62f3a-b8f9069c11fmr208094466b.23.1770930632527; Thu, 12 Feb 2026
 13:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20260203161917.1666696-1-vincent.guittot@linaro.org>
 <20260203161917.1666696-2-vincent.guittot@linaro.org> <20260210004011.GA2188625-robh@kernel.org>
 <CAKfTPtA299R7yn3r=tCqhhP_tK3E_UpGSMrDLyRP4Ccwt1m58g@mail.gmail.com>
In-Reply-To: <CAKfTPtA299R7yn3r=tCqhhP_tK3E_UpGSMrDLyRP4Ccwt1m58g@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Feb 2026 15:10:20 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+SswpTjQShfkdhVwL_k8gJ_5+NrecPCUiFR52UB5zNMA@mail.gmail.com>
X-Gm-Features: AZwV_QjelX9NLva1DLDx_tMGAWuQk_3-b-qqDMfkQH9yt3x_72JwdyevIvbKnTI
Message-ID: <CAL_Jsq+SswpTjQShfkdhVwL_k8gJ_5+NrecPCUiFR52UB5zNMA@mail.gmail.com>
Subject: Re: [PATCH 1/4 v2] dt-bindings: serdes: s32g: Add NXP serdes subsystem
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	p.zabel@pengutronix.de, linux@armlinux.org.uk, ghennadi.procopciuc@nxp.com, 
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	horms@kernel.org, Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Feb 12, 2026 at 1:17=E2=80=AFAM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Tue, 10 Feb 2026 at 01:40, Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Feb 03, 2026 at 05:19:14PM +0100, Vincent Guittot wrote:
> > > Describe the serdes subsystem available on the S32G platforms.
> > >
> > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > ---
> > >  .../bindings/phy/nxp,s32g-serdes.yaml         | 154 ++++++++++++++++=
++
> > >  1 file changed, 154 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/nxp,s32g-se=
rdes.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.ya=
ml b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > > new file mode 100644
> > > index 000000000000..fad34bee2a4f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > > @@ -0,0 +1,154 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/nxp,s32g-serdes.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP S32G2xxx/S32G3xxx SerDes PHY subsystem
> > > +
> > > +maintainers:
> > > +  - Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > +
> > > +description: |
> > > +  The SerDes subsystem on S32G SoC Family includes two types of PHYs=
:
> > > +    - One PCIe PHY: Supports various PCIe operation modes
> > > +    - Two Ethernet Physical Coding Sublayer (XPCS) controllers
> > > +
> > > +  SerDes operation mode selects the enabled PHYs and speeds. Clock f=
requency
> > > +  must be adapted accordingly. Below table describes all possible op=
eration
> > > +  modes.
> > > +
> > > +  Mode  PCIe XPCS0           XPCS1           PHY clock       Descrip=
tion
> > > +                SGMII                SGMII             (MHz)
> > > +  ------------------------------------------------------------------=
-------
> > > +  0  Gen3    N/A             N/A             100             Single =
PCIe
> > > +  1  Gen2    1.25Gbps        N/A             100             PCIe/SG=
MII
> > > +  2  Gen2    N/A             1.25Gbps        100             PCIe/SG=
MII
> > > +  3  N/A     1.25Gbps        1.25Gbps        100,125         SGMII
> > > +  4  N/A     3.125/1.25Gbps  3.125/1.25Gbps  125             SGMII
> > > +  5  Gen2    N/A             3.125Gbps       100             PCIe/SG=
MII
> >
> > Mixed tabs and spaces. Drop the tabs.
>
> okay
>
> >
> > What's not clear to me is do you have 2 or 4 lanes?
>
> 2 lanes per serdes
> as an example mode 0 is one PCIe x2 lane
> and mode 1 is one PCIe x1 and one xpcs0/SGMII on lane 1
> or mode 3 is one  xpcs0/SGMII on lane 0 and one xpcs1/SGMII on lane 1

Still confused. So 2 total lanes?

>
> >
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - nxp,s32g2-serdes
> > > +      - items:
> > > +          - const: nxp,s32g3-serdes
> > > +          - const: nxp,s32g2-serdes
> > > +
> > > +  reg:
> > > +    maxItems: 4
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: ss_pcie
> > > +      - const: pcie_phy
> > > +      - const: xpcs0
> > > +      - const: xpcs1
> > > +
> > > +  clocks:
> > > +    minItems: 4
> > > +    maxItems: 5
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: axi
> > > +      - const: aux
> > > +      - const: apb
> > > +      - const: ref
> > > +      - const: ext
> > > +    minItems: 4
> > > +
> > > +  resets:
> > > +    maxItems: 2
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: serdes
> > > +      - const: pcie
> > > +
> > > +  nxp,sys-mode:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> >        maximum: 5
> >
> > Though isn't this redundant with the child nodes? You could use the
> > standard 'phy-mode' property in each child.
>
> not really because we can have mode 1 but only a node to describe
> lane0 for PCIe x1 if the lane 1 is not used
>
> >
> > > +    description: |
> > > +      SerDes operational mode. See above table for possible values.
> > > +
> > > +  '#address-cells':
> > > +    const: 1
> > > +
> > > +  '#size-cells':
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  '^serdes[0,1]_lane@[0,1]$':
> >
> > Do you need to support serdes0_lane@0 and serdes1_lane@0 (or similar
> > with "@1")? That's illegal as you have 2 nodes with the same address.
>
> okay, we can find other naming
>
> >
> > > +    description:
> > > +      Describe a serdes lane.
> > > +    type: object
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        enum:
> > > +          - nxp,s32g2-serdes-pcie-phy
> > > +          - nxp,s32g2-serdes-xpcs
> >
> > Seems like phy-mode would be sufficient. Are these separate blocks from
> > the parent?
>
> Isn't phy-mode only for ethernet phy ?

Sorry, it is "phy-type" that I was thinking about. That takes the
types defined in dt-bindings/phy/phy.h. The type can be defined either
in "phy-type" or in the phy cells if the type is per identifier.

Really, Given each lane doesn't have any of its own resources, I'd
probably get rid of the child nodes and put the type into the phy
cells. Then you'd have something like this:

// PCIE on lanes 0 and 1 (mode 0)
pcie {
  phys =3D <&phy 0 PHY_TYPE_PCIE>, <&phy 1 PHY_TYPE_PCIE>;
};

// PCIE on lane 0 (mode 1)
pcie {
  phys =3D <&phy 0 PHY_TYPE_PCIE>;
};
// Ethernet on lane 1
ethernet {
  phys =3D <&phy 1 PHY_TYPE_SGMII>;
};

I perhaps don't have the cells right if it is more than just lane 0
and lane 1, but you can put anything there you want. The cell
definition is provider specific.

If you need to get the overall system wide configuration, that can be
done. It's not terribly efficient, but you can iterate all 'phys'
nodes in the DT, find the ones for your provider (&phy) and examine
the cell values.

Rob

