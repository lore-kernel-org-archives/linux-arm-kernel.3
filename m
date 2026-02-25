Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE17CFD375E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWDapfQMSHQo645PmLjObrtYUkjcF1qIGp665H7E8ZM=; b=wRmf10Mdrx4W866wbRlQlEpw2y
	JOWEfNXPrEfmrDg7EAiga5M0vCIv44nxntz1LhM46e67sWxfkJ5x1K4R8GQ8HATrVmoSPlQXZkE6F
	5JW85oO0GzY4IqZCYA3+yN340rC1vDOf83B/PoPMLJlvHHHfGFd1IGbziK0jKxY4kmyn+4CIRR2bc
	G032ktrsg1dQ0UqcqOe21tkvKkySQY7tPCjYaxSEEtq/Yh4Wx5faexZcP3vYDglTP6P9+bifxzylO
	vXjMdt5SsOsaczHT6BlKKexfuWvgsoN8s0zu4D95gcJRja2RD/RR5JEzifgVfv9sbVl8uonhuyge7
	GN7p2dtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFRj-000000049il-0cFi;
	Wed, 25 Feb 2026 14:00:59 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFRf-000000049hf-1Acc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:00:57 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b8f8d80faebso139932266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 06:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772028053; cv=none;
        d=google.com; s=arc-20240605;
        b=JeV2vA2i0MZtq+1f2uqAYSAHH0/XKcvAIoMf2PYcK4pQOQxlKU1Pr9aZNf4lfAuhQa
         xuIdgyeys7T5GcdTH1TPsL4Ju0KF/cQZmugV3BaRR/LDAszuu1LxduSMJDab5Xk5hKHn
         wI9kWbX1ZefobadyAoDQx1X/kqoKeidpm/IU0Ijk6iiSPCXRZlNf7NZJRlvq1n4a2k2b
         sodQwjLAu6rCbxfW2sWAV6QU8ovzYJwCU3NzqofdssTgyQHM9WvXf6po9QPWrkzulR7R
         uZui57MowoMa3h6cme+sDN/8PD5/wyWEPRA6iEL66L4XdIq+I7Pr/TtI86djNQwDyf72
         pdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LWDapfQMSHQo645PmLjObrtYUkjcF1qIGp665H7E8ZM=;
        fh=G6ZOLk8qugO/C99VRGcEaDpXVzXsJrgWQchFFcjJaKc=;
        b=DOUfkXCxHH/BmNQo4V6pmOtWa54c/zd+pVKgqZazB2hu9kz+MpbwqU3/4caRz5FTMh
         aCQx9bmrHHICBZ9wrchUoKDYVk4KSKLq3OON3EjP5DeAio3ZLofvxow5C802AF9HNxNV
         VjdzLRSMw2YVnTqlANcEqlbWeznYAI/OJ4eivegMzDoi7OY+Jw06R8tqTjGNTAL/7YaX
         Tf/9dK8wJ26DjuVY79LroW4KDHOBbhqQdKo6HmCRT03RU9D+iVM5/sfilAIeXiufikv+
         NgvgFuyYgwjm5ZzWKFBwi9qyVHOC9bpJ5b9bokGdBSDJlEdmwzc/ipHTPaEXMYC12r5s
         HliA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772028053; x=1772632853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWDapfQMSHQo645PmLjObrtYUkjcF1qIGp665H7E8ZM=;
        b=HK+5a7UOuQEwr+7mfN7z59fwOw/uBlsUTHVeIWjCx1Ij6IcOqR5ErfI0P1oYlm9ZUA
         ISsj1sqHwBCdjkmSUCgLddHFsA0H+LU1IFQdehTCRwOWU/KCJSIcRs6sXWWK13QS2M1Z
         Idde3DiyeSODHDeCOqR9PaSqf2pHNZiyMCPt92rXthVmao1rIVcWJljNdUtIyN651R+q
         h5GuJxYQ3nx1VZH84WDwTJ3z8qEnKR+/nRvPPWvC/7fdtuWwkJtrnlTan0bCoCHQ+F0G
         8hGapZXwrVV9VUC53G3Ul+YzPgepth5IX7EEbzlxohSi1xHvN3P6Yj3lCCyyngvCnkTh
         +F/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028053; x=1772632853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWDapfQMSHQo645PmLjObrtYUkjcF1qIGp665H7E8ZM=;
        b=ZF0z8ZzMPhee1PK7GT2RUDamTHV/CU4fa22gChtrPGznKz3Fuk8eGQoBGZHdRzrZUK
         Q/FaMkphraMhfYvClLnaIUnnlaz7al0/jPeo1DbQ95Vi+PKiXBR8nPOAwFx1vQvYzrW8
         +4lAGW/nxtOap++RfPRVAHATMtZgTB5e5roqUswBdDoqYdbhM+C23y3ePx2ph0GCjJAv
         h7oM87fME/NMgsMHny9gqWQukCs2twVWPwGVhlssmDV0qaL9iHDi8YlzsjZD1InNarj8
         q43KxW8RlWKy7lgb7JrpCnUBYWd9GPwzKgukF8tXl7Dz3hQFnUfz5oBXGrZEOA9aR0VE
         Y0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUR8/pmg65MWISLI5oXDDwN4cwfKvRCUED04zptq4JuVlHfmF0f1ySJO6jb3jjhlGvpmfae0WCKgG8JpiOxUWJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyiuZLKhfpAlg/WXa0XBflB6t1ItM5U6OiQfz9CRqt8In8q3j2Y
	Z5w3IWXBZQM/bd1qqv+NyS8+7ZOQEYKR07SDLDh0KFs0ElRBWUGbUqLPsd2dmwz2NUWmrxauhYe
	xcniZ2kt6JezTCKYqxUbdq/BX5VY2BeuEqoxEdRp1dg==
X-Gm-Gg: ATEYQzxFPESZ+esgnDGeQ3M3LAQ7TJ8W8kt+pZC+cpeLKAgz0DCMrd5M7aF1ZiVUF5B
	vvaXsrma9Jug5NXynh/n/qTGWyTI6AUnnvC+3WKS7NXpcv8tR9t0nNhSew20paV4ngHKCf43n2R
	C70sXOfQyRUqtRFadrAwu19OZbapedPq4T7CvbIb8rcFzVzpD5EXILfpGw7SaLBtGWwsW7EZuHv
	lBWsIkc2U2MP3+KX5hleKQJzkalZsTqnQnrxYwOknw3adaBr28XaDGZpHkvsJT2aZCOBPI/vWbw
	D8PD5yg1LtCrIlU/9PkKrDRN0OtblatBBCL9HPNnMAbk
X-Received: by 2002:a17:907:d9e:b0:b88:72da:1055 with SMTP id
 a640c23a62f3a-b933cda1035mr265143666b.29.1772028052640; Wed, 25 Feb 2026
 06:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20260203161917.1666696-1-vincent.guittot@linaro.org>
 <20260203161917.1666696-2-vincent.guittot@linaro.org> <20260210004011.GA2188625-robh@kernel.org>
 <CAKfTPtA299R7yn3r=tCqhhP_tK3E_UpGSMrDLyRP4Ccwt1m58g@mail.gmail.com> <CAL_Jsq+SswpTjQShfkdhVwL_k8gJ_5+NrecPCUiFR52UB5zNMA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+SswpTjQShfkdhVwL_k8gJ_5+NrecPCUiFR52UB5zNMA@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Feb 2026 15:00:40 +0100
X-Gm-Features: AaiRm505TTN6nS9yOA4a06y3Eph6mjLyAzAM02exWTGSkD9LPmzld_Vs-lqHg20
Message-ID: <CAKfTPtCX8cAT0f6k74_uYvP3=A3SFgV-GJfPMq50heUOmH=_Og@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_060055_395238_61117F3F 
X-CRM114-Status: GOOD (  41.22  )
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

Hi,

Sorry for the delayed reply. Some days off kept me away from keyboard

On Thu, 12 Feb 2026 at 22:10, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Feb 12, 2026 at 1:17=E2=80=AFAM Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Tue, 10 Feb 2026 at 01:40, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Feb 03, 2026 at 05:19:14PM +0100, Vincent Guittot wrote:
> > > > Describe the serdes subsystem available on the S32G platforms.
> > > >
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > ---
> > > >  .../bindings/phy/nxp,s32g-serdes.yaml         | 154 ++++++++++++++=
++++
> > > >  1 file changed, 154 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/phy/nxp,s32g-=
serdes.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.=
yaml b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > > > new file mode 100644
> > > > index 000000000000..fad34bee2a4f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > > > @@ -0,0 +1,154 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/phy/nxp,s32g-serdes.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: NXP S32G2xxx/S32G3xxx SerDes PHY subsystem
> > > > +
> > > > +maintainers:
> > > > +  - Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > > +
> > > > +description: |
> > > > +  The SerDes subsystem on S32G SoC Family includes two types of PH=
Ys:
> > > > +    - One PCIe PHY: Supports various PCIe operation modes
> > > > +    - Two Ethernet Physical Coding Sublayer (XPCS) controllers
> > > > +
> > > > +  SerDes operation mode selects the enabled PHYs and speeds. Clock=
 frequency
> > > > +  must be adapted accordingly. Below table describes all possible =
operation
> > > > +  modes.
> > > > +
> > > > +  Mode  PCIe XPCS0           XPCS1           PHY clock       Descr=
iption
> > > > +                SGMII                SGMII             (MHz)
> > > > +  ----------------------------------------------------------------=
---------
> > > > +  0  Gen3    N/A             N/A             100             Singl=
e PCIe
> > > > +  1  Gen2    1.25Gbps        N/A             100             PCIe/=
SGMII
> > > > +  2  Gen2    N/A             1.25Gbps        100             PCIe/=
SGMII
> > > > +  3  N/A     1.25Gbps        1.25Gbps        100,125         SGMII
> > > > +  4  N/A     3.125/1.25Gbps  3.125/1.25Gbps  125             SGMII
> > > > +  5  Gen2    N/A             3.125Gbps       100             PCIe/=
SGMII
> > >
> > > Mixed tabs and spaces. Drop the tabs.
> >
> > okay
> >
> > >
> > > What's not clear to me is do you have 2 or 4 lanes?
> >
> > 2 lanes per serdes
> > as an example mode 0 is one PCIe x2 lane
> > and mode 1 is one PCIe x1 and one xpcs0/SGMII on lane 1
> > or mode 3 is one  xpcs0/SGMII on lane 0 and one xpcs1/SGMII on lane 1
>
> Still confused. So 2 total lanes?

Yes, there are 2 serdes hw ip instances and each instance has 2 lanes
that can be configured to output PCIe and/or SGMII

>
> >
> > >
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - enum:
> > > > +          - nxp,s32g2-serdes
> > > > +      - items:
> > > > +          - const: nxp,s32g3-serdes
> > > > +          - const: nxp,s32g2-serdes
> > > > +
> > > > +  reg:
> > > > +    maxItems: 4
> > > > +
> > > > +  reg-names:
> > > > +    items:
> > > > +      - const: ss_pcie
> > > > +      - const: pcie_phy
> > > > +      - const: xpcs0
> > > > +      - const: xpcs1
> > > > +
> > > > +  clocks:
> > > > +    minItems: 4
> > > > +    maxItems: 5
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: axi
> > > > +      - const: aux
> > > > +      - const: apb
> > > > +      - const: ref
> > > > +      - const: ext
> > > > +    minItems: 4
> > > > +
> > > > +  resets:
> > > > +    maxItems: 2
> > > > +
> > > > +  reset-names:
> > > > +    items:
> > > > +      - const: serdes
> > > > +      - const: pcie
> > > > +
> > > > +  nxp,sys-mode:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > >
> > >        maximum: 5
> > >
> > > Though isn't this redundant with the child nodes? You could use the
> > > standard 'phy-mode' property in each child.
> >
> > not really because we can have mode 1 but only a node to describe
> > lane0 for PCIe x1 if the lane 1 is not used
> >
> > >
> > > > +    description: |
> > > > +      SerDes operational mode. See above table for possible values=
.
> > > > +
> > > > +  '#address-cells':
> > > > +    const: 1
> > > > +
> > > > +  '#size-cells':
> > > > +    const: 0
> > > > +
> > > > +patternProperties:
> > > > +  '^serdes[0,1]_lane@[0,1]$':
> > >
> > > Do you need to support serdes0_lane@0 and serdes1_lane@0 (or similar
> > > with "@1")? That's illegal as you have 2 nodes with the same address.
> >
> > okay, we can find other naming
> >
> > >
> > > > +    description:
> > > > +      Describe a serdes lane.
> > > > +    type: object
> > > > +
> > > > +    properties:
> > > > +      compatible:
> > > > +        enum:
> > > > +          - nxp,s32g2-serdes-pcie-phy
> > > > +          - nxp,s32g2-serdes-xpcs
> > >
> > > Seems like phy-mode would be sufficient. Are these separate blocks fr=
om
> > > the parent?
> >
> > Isn't phy-mode only for ethernet phy ?
>
> Sorry, it is "phy-type" that I was thinking about. That takes the
> types defined in dt-bindings/phy/phy.h. The type can be defined either
> in "phy-type" or in the phy cells if the type is per identifier.
>
> Really, Given each lane doesn't have any of its own resources, I'd
> probably get rid of the child nodes and put the type into the phy
> cells. Then you'd have something like this:
>
> // PCIE on lanes 0 and 1 (mode 0)
> pcie {
>   phys =3D <&phy 0 PHY_TYPE_PCIE>, <&phy 1 PHY_TYPE_PCIE>;
> };

We only register one phy with PCIE x2 in this case

>
> // PCIE on lane 0 (mode 1)
> pcie {
>   phys =3D <&phy 0 PHY_TYPE_PCIE>;
> };
> // Ethernet on lane 1
> ethernet {
>   phys =3D <&phy 1 PHY_TYPE_SGMII>;
> };

For ethernet, we use pcs-handle and we don't register generic phy as
we don't have anything to do

Also, the mode (if a lane output pcie or sgmii) is a static
configuration that is decided before unresetting the serdes ip, we
don't change the mode at runtime

That being said, we can use phy-type =3D <PHY_TYPE_PCIE> or
<PHY_TYPE_XPCS> in child node instead of a compatible to describe the
purpose of each lane

>
> I perhaps don't have the cells right if it is more than just lane 0
> and lane 1, but you can put anything there you want. The cell
> definition is provider specific.
>
> If you need to get the overall system wide configuration, that can be
> done. It's not terribly efficient, but you can iterate all 'phys'
> nodes in the DT, find the ones for your provider (&phy) and examine
> the cell values.

As mentioned previously, we can decide not to use all lanes of a mode.
As an example, using mode 1 for a pcie x1 but no sgmii so we will not
find all lanes description in the DT

Vincent
>
> Rob

