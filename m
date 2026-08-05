Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE94C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 17:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ed7d3IIv5/1/YcqJUTH/1nOy3fvwpEdX0Td4yCp6N7Q=; b=e717PlCltysm6YQ/qI6hMJC87z
	gHfHdEhxfC7a0R6OOgdGyzPYvKsccfFVQ2xLDedyzDbQ6EJFDit5mm4iYbsIHOhv1bkLEWYK26Fne
	uZSp8X9ffnMhD/KuefjmRZmkmKjzGqbpjmH9COAEVgddY6drqgB/Tbci8R0J/eohyOTaIujoKEWcv
	qWg0etU4XmvpxML1LATUwfMWknZWHgyBHkdoEq8VYoSBj1120625IY2lEgOrC600t/0KBLfF8pEtX
	smHvnnLTPzP/Z7TLBqwVGOfc7ngyMwHYNIil9q4cacEteOljelHk6CZ+w7eutPrujeR6VgdhKldRK
	f0Y3YYHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfHv-00000004KFy-3QHK;
	Wed, 05 Aug 2026 17:20:19 +0000
Received: from mail-ej2-x03.google.com ([2a00:1450:4864:34::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfHs-00000004KEX-0aim
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 17:20:18 +0000
Received: by mail-ej2-x03.google.com with SMTP id a640c23a62f3a-c15f8dd6f18so71951166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 10:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785950413; cv=none;
        d=google.com; s=arc-20260327;
        b=DYKJM/x6nQeTcTjNCfQUklh96Ocm3MFBTwUFDbiFQv0ldCuE6idWoz5kW6zqHTHfEX
         r3Q3JNT1a2w8/annxeC9hLO9Ruk3vpVE3CeUCOavFET1aUhvBOR2ZTapKPDtyXBIybbq
         48umTLx/ir3DMMfseZ6jGJGcu1Tj6cHen/gYJGdPMWRvzLzWZ3siQQHN/fxPF4P9ifEH
         nNw56zOz9pX/oTlA0KCiGQmxGYEJqaVxsuHf03yWIzeJss57QIrZ2dCRDoEusyiWXxMD
         AdTo2fERUhFSztKHErjvnQ90/Th93yjAnZBtPM5SILHDgC3i+yV2iCYye9Rimfi1aDHS
         IT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ed7d3IIv5/1/YcqJUTH/1nOy3fvwpEdX0Td4yCp6N7Q=;
        fh=iZ5gsgH79P8yFZ0T8NoNjhrI9r4abqDtPApRaRP55E4=;
        b=IIk/OlGRC4+pLtB4CK7Q4eON9cETv+oL6gs8lO00ZHXYM9HtRotPSc6Wwiy64+rRSl
         8HD8mlm1bNAguPR8AWfYcQV210symizZ7F7ueC7mXGfAGyNg0X2X2G4l0rztgSdP/GEF
         cp0ulOnZ4NGaw/yyTGR4UU3TngYrXoNWyMom/Kjd1BFeLv0suLDrj3e65/BJzt4LnM83
         ieELGQqDMJQ5Ap3xGNl/FKXJIddLK6xWTzTpt54PkXO1ZOVoHxSR6fBCe2bdeWVi5bLm
         jgULigiyvRt4AdlxyPylv0TfqBAwls3qRwTZrJhcMdIkLuqgBhxi/u/MwBGQ214FgP0V
         LA4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785950413; x=1786555213; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ed7d3IIv5/1/YcqJUTH/1nOy3fvwpEdX0Td4yCp6N7Q=;
        b=gvxOqfkdz41naJpMGYF1Gfe5gkUKSB8DgqcffumcB8Jwn5M4gByqlSp3HW36HI8Xn6
         K6AAb9G93lwDFGcggUsErDNGWNV6nE4C2JRU5SuZf6PhSnCI50jJ0MLYP1rMemJeTlsY
         LW95hWkAHNehchoreWvnlYDc/2x7V9XI0qiqdjJ8hQnKQyExIjB+zMpFZXQnoSIzhlu1
         zXgy5MnF7+Q3vAt9bpMzxOKvyY0835fyCHapCzKwEHvd3Jg0HjlJSp+oHCopOpQQ9v0v
         qNq3PduxBrIbMc5nS5bss6v4xfAnKHoP4uV11GAhlbyDe4NHy+Pg/x43txiJibzYjluA
         QfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785950413; x=1786555213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ed7d3IIv5/1/YcqJUTH/1nOy3fvwpEdX0Td4yCp6N7Q=;
        b=DOTwXEUDgAg2NPSANxadxU9Gxk5/QZ5qOqmtxuzEv/My1BhFZlwleKta+8qVVTn69W
         ZdGnws9nTrzIyJ1ZvEAk/MONIBGBb1CPTbwb2DdTrV1O8hP41fW492V7XmmMVpu9hMzP
         VT+rrzjjmRjktbrfqO8f3uyjW/o3w1sqdLCs2hfY94Hsa87VZqEuSfgjJMVw38ikxHuB
         U2IzmvpujWfWDjmzD3lqRJs/4DrKryuI++dctwZAmZrsRzBB3vVLWAftj0DPHqjIvsus
         Kbnpcizm6dxMkcIhZDjDGg86tetW4du+D4+JiHJb6ZTcRytZQkjdvGiLeH1EsbG1mCE8
         suGA==
X-Forwarded-Encrypted: i=1; AHgh+Rq03xen3sH/aupSxhiQZ/uLWzybLhw3RhnRtCyJdg3Jsi4W4ANOJVxVQynmq0ScWjetDUDEV1Sc984FQfZl6bTd@lists.infradead.org
X-Gm-Message-State: AOJu0YzJTlnvRhoIV/YNzWD52KVWAf8G8VqUvIuZRAoaKX14MUZmagVX
	U5NkwyPB+psJJVHOcmkCbrw/CuLJbbo+4cMGPQi0bABcGu7S2eJ2rogrEqhMlDz/Ta34iXZ1KZ3
	0srDU71bn7DprJXUOFK2+hjRvYP2KguE=
X-Gm-Gg: AR+sD13ocTBNc508dKGd/bEGT4BVW3bB17Vp8inZr/a6WTW5NT6q78gGqY2Cvc8a5pa
	enltllGse5pRxq+fdUSx7dfkaj9AVbeV4mRGr9J19yRsDC7yO7C39Y+/CuWCmMaDbCiSH9GwHlS
	8/hOH7AbgQV9I5ma1etm3/ca2AFiSaAW0rbyJxT6JlH38WsD2mu5T8SWqcV+NzMy0waBbO1dFL3
	CUBBg+ZALgk+p5lA1VaTV+3fZbVIQ1twoSkNe8L3XA9qRUVNqhLzamqck5QYfH+eDnHra1xwYjc
	IfDNBCr+h6sw8UfE2TTqGKjJmZ5VVPqCIa68b5HnxUVrmHuHFsLZ93dfQIQ1KElyJM0U4os=
X-Received: by 2002:a17:906:7315:b0:c16:b87:de64 with SMTP id
 a640c23a62f3a-c2039c22d1fmr433223466b.15.1785950412968; Wed, 05 Aug 2026
 10:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-6-coiaprant@gmail.com>
 <20260805-stirring-wondrous-mule-faf37d@quoll>
In-Reply-To: <20260805-stirring-wondrous-mule-faf37d@quoll>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 6 Aug 2026 01:20:09 +0800
X-Gm-Features: AUfX_mx8UFnbdlOwigeC8DoFtEekRCvwbvHBwVKJJj31ufe5iJU09i8ffEdEzOM
Message-ID: <CALj3r0hbp-zS7Sv-6T3uBOCq2ZO4XZHKvkD4dTZ3gXRS=90JUQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_102016_235765_85F9FBF5 
X-CRM114-Status: GOOD (  37.42  )
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

Hi Krzysztof,

Thanks for the detailed review. Here's my response to each point:

> > +title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
> > +
> > +maintainers:
> > +  - Coia Prant <coiaprant@gmail.com>
> > +
> > +description: |
> > +  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physic=
al
> > +  Coding Sublayer (XPCS).
> > +  The PCS provides an interface between the Media Access Control (MAC)
> > +  and the Physical Medium Attachment (PMA) sublayer through a Media
> > +  Independent Interface (GMII).
> > +
> > +  The XPCS is accessed over the APB3 bus and internally connected to a
> > +  Naneng Combo SerDes PHY.
> > +  It supports 1000BASE-X, SGMII and QSGMII modes.
> > +
> > +  The block contains four MII ports (pcs-mii@0..3) that can be
> > +  individually enabled and routed to one of the Ethernet GMAC controll=
ers
> > +  via the pcs-handle property in the MAC device tree node.

1. Commit message: I'll drop the redundant description paragraph and keep
   only the essential information.

2. Subject: I'll drop the redundant "binding" word.

> +properties:
> +  compatible:
> +    const: rockchip,rk3568-xpcs
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

3. reg order: I'll move reg to the second property (after compatible).

4. Quotes: I'll use consistent quoting style throughout.

> +  reg:
> +    description: |
> +      Base address and size of the XPCS register space mapped over the
> +      APB3 bus.

5. reg description: I'll drop it as redundant.

> +  clocks:
> +    description: |
> +      Clock sources for the XPCS:
> +      - csr: APB3 bus interface clock (clk_csr_i), required for register
> +        access.
> +      - eee: EEE clock (clk_eee_i), required for Energy Efficient
> +        Ethernet (EEE) operation.
> +    minItems: 2
> +    maxItems: 2

6. clocks: I'll change to items with descriptions instead of min/maxItems.

> +  clock-names:
> +    items:
> +      - const: csr
> +      - const: eee
> +
> +  phys:
> +    description: |

7. description formatting: I'll remove unnecessary '|' where not needed.

> +  power-domains:
> +    description: |
> +      Power domain for the XPCS.

8. power-domains description: I'll drop the redundant part.

> +patternProperties:
> +  "^pcs-mii@[0-3]$":

9. pcs-mii naming: I used "pcs-mii" because the Rockchip TRM refers to
   these as "MII ports" and they are functionally PCS instances. I do see
   a similar pattern in the Renesas RZN1 MIIC binding (renesas,rzn1-miic.ya=
ml),
   which uses "mii-conv@[0-5]$" for its ports. So the idea of having
   child nodes per port is not new.

   If you prefer a different name (e.g., "port@0"-"port@3" or "pcs@0"-"pcs@=
3"),
   I'm happy to change it. Please let me know what naming you'd recommend.

> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3

10. reg constraints: I'll fix the min/max constraint to use items (or drop
    it since the node name regex already enforces the range).

> +      status: true

11. status property: I'll remove it, as it's a generic property and
    doesn't need explicit declaration.

Thanks,
Coia

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B48=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=B8=89 15:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Aug 01, 2026 at 10:22:28PM +0800, Coia Prant wrote:
> > Add device tree binding documentation for the Synopsys DesignWare
> > XPCS integrated on the Rockchip RK3568 SoC.
> >
> > The XPCS is accessed over the APB3 bus and internally connected to
> > a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
> > QSGMII modes, with four MII ports.
> >
> > The binding describes:
> > - Required properties: compatible, reg, clocks, clock-names
> > - Optional properties: phys, phy-names, power-domains
> > - pcs-mii sub-nodes for each MII port (reg 0..3)
>
> Irrelevant paragraph. We can read the diff. Drop.
>
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree=
/bindings/submitting-patches.rst#L23
>
> >
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >  .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 127 ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-=
dwxpcs.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.=
yaml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> > new file mode 100644
> > index 0000000000000..3e3f3a388d822
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> > @@ -0,0 +1,127 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/pcs/rockchip-dwxpcs.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
> > +
> > +maintainers:
> > +  - Coia Prant <coiaprant@gmail.com>
> > +
> > +description: |
> > +  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physic=
al
> > +  Coding Sublayer (XPCS).
> > +  The PCS provides an interface between the Media Access Control (MAC)
> > +  and the Physical Medium Attachment (PMA) sublayer through a Media
> > +  Independent Interface (GMII).
> > +
> > +  The XPCS is accessed over the APB3 bus and internally connected to a
> > +  Naneng Combo SerDes PHY.
> > +  It supports 1000BASE-X, SGMII and QSGMII modes.
> > +
> > +  The block contains four MII ports (pcs-mii@0..3) that can be
> > +  individually enabled and routed to one of the Ethernet GMAC controll=
ers
> > +  via the pcs-handle property in the MAC device tree node.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3568-xpcs
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
>
> reg is always the second property.
>
> Also, use consistent style of quotes.
>
> > +
> > +  reg:
> > +    description: |
> > +      Base address and size of the XPCS register space mapped over the
> > +      APB3 bus.
>
> Drop description, redundant.
>
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: |
> > +      Clock sources for the XPCS:
> > +      - csr: APB3 bus interface clock (clk_csr_i), required for regist=
er
> > +        access.
> > +      - eee: EEE clock (clk_eee_i), required for Energy Efficient
> > +        Ethernet (EEE) operation.
> > +    minItems: 2
> > +    maxItems: 2
>
> No, instead list items with description.
>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: csr
> > +      - const: eee
> > +
> > +  phys:
> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.
>
> > +      The phandle of SerDes PHY (Naneng Combo PHY) that provides
> > +      the serial lanes for 1000BASE-X / SGMII / QSGMII.
> > +      The SerDes must be powered on and initialised before any XPCS
> > +      register access.
> > +    maxItems: 1
> > +
> > +  phy-names:
> > +    const: serdes
> > +
> > +  power-domains:
> > +    description: |
> > +      Power domain for the XPCS.
>
> Drop sentence and |
>
> > +      On RK3568 this is typically the PD_PIPE power domain, which also
> > +      supplies the SerDes PHY.
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^pcs-mii@[0-3]$":
>
> Why `git grep pcs-mii@` gives me no results? Are you doing this
> similarly to existing devices or is this quite different device than
> every other hardware?
>
> > +    type: object
> > +    description: |
>
> Same here
>
> > +      One of the four MII ports of the XPCS.
> > +      The port number is specified by the reg property (0..3).
>
> Drop sentence, redundant. Schema tells that.
>
> > +      The port is linked to an Ethernet MAC controller via the
> > +      pcs-handle property in the MAC's device tree node.
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 3
> > +        description: |
>
> As well
>
> > +          MII port number of PCS.
> > +
> > +      status: true
>
> Nope, do you see anywhere code like this?
>
> > +
> > +    required:
> > +      - reg
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rk3568-cru.h>
> > +    #include <dt-bindings/power/rk3568-power.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    pcs@fda00000 {
> > +      compatible =3D "rockchip,rk3568-xpcs";
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +      reg =3D <0xfda00000 0x200000>;
> > +      clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> > +      clock-names =3D "csr", "eee";
> > +      phys =3D <&combphy2 PHY_TYPE_SGMII>;
> > +      phy-names =3D "serdes";
> > +      power-domains =3D <&power RK3568_PD_PIPE>;
> > +
> > +      pcs-mii@0 {
> > +        reg =3D <0>;
> > +      };
> > +    };
> > --
> > 2.47.3
> >

