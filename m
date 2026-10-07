Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6F7CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrNkpb0d4qtNovZAgW6O0CMNn2hpdnuON/KzQGIiKiQ=; b=EebDWq5xb+1FYL/h/Y+u+hGfx8
	dZyUp6opbJDAgeC/g6KxDvqOjGl1UQE9KGalBD+Xymlz0ZlCi+fpXGNfT7LndL03hMXzLvFscgDx1
	2HaR5sKopjdYBN0CpwlMJ8gLLtElD2FyS8gEpqwOrUZHhj1FrvUnklH/1KFaj8yRaqYDINTAhmZel
	vyJJVIpgEWnTdvk4lFEwtTNdEEGdsJmIucyYFuD8xXezzuR8hsxgGpST9a9kNW+eWgdWZHTpMqPh9
	LRmp5PUgDCYD74mI69PKvReZcRmlpE8ELKN3/GXNUqs6ttOVwq+VOVPKnZZ8ofq7IM7quOR9/p6lS
	SWtuCF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOSD-000000027Cn-0hLh;
	Wed, 07 Oct 2026 10:00:53 +0000
Received: from mail-ej2-x0b.google.com ([2a00:1450:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOS6-000000027BS-2LBu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:00:48 +0000
Received: by mail-ej2-x0b.google.com with SMTP id a640c23a62f3a-c2e25574351so232361466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 03:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791367245; cv=none;
        d=google.com; s=arc-20260327;
        b=dNa/G+kxou1E8azd/89/aJfS5TezckkpYEAtfLiStp2hvQZYBbG6zj/U5lHH9FwE93
         eosnS1nIjgdK7LY9d5Y3JbOAR+lnT+NtKfN/vc5ZHgqp1KsnaHIwlzzzDgwXL4qlfqiq
         8MkjPbAzNpich4c4UnDNtpXyb+Y4hqzUlrVcYQpEGm6cQU88szXD1ziw5Y8NkzORZH8s
         BdyYSwwiFtE2lduCJY/M1A2cVqrP9WkbfDMN+wRtIn7+JPFlqXIxthMwgWqHV807p6lH
         uXsA5SyGly+0Zj3a8FvaNDDFgC6RbsF/e6Gik8/sGMORPIKyFSl4zwX+aMfBSdKfmwtg
         Zujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WrNkpb0d4qtNovZAgW6O0CMNn2hpdnuON/KzQGIiKiQ=;
        fh=2zyUW/MVVNRr3dA12Nkkbt8J9AHKHjLMrEhJ3CXN6OM=;
        b=qu3Si6bDXvQJR8xADNHYPcvOa50qpfUKbrlIz/JdU2loQlgnf9D1TjeIyBusCx1/IG
         j/6/E4Frw0pdftpy6Wq7T/nUpAhgCWWGRFVn2Hy+E/yovW06qCOdBv6Zvh4Ingly/5cI
         0ogp4ZDSPYEsasGaQblCIrmRef+thp3j0WN9TyRbpmKPCpTTN0BeiYK5vwnS2bbu7gvL
         /vc0tq07v+NBHcPkNdUmVGh3uXB5ELPGUYT4Rz7DNNr3T35rRBfcor51XmgUpoS0Ijkv
         As8ffKdJPAFyIGrlvWFT0htZCkshC4Ug5y+LSvqbNt3hjlkqQonqOxCEXihO3GyQ+I43
         5rdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791367245; x=1791972045; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrNkpb0d4qtNovZAgW6O0CMNn2hpdnuON/KzQGIiKiQ=;
        b=J/8vzwItrMR77jnnhfRrB8M6ZrKM6F1PM6uqYTyFOvZLuroPrv5kMF4y+98J5Mj+Vp
         g3FHK4GSrUWGcFEztkZh5l5c5d8k81PaLzGFv4a4rdJJy/F+GHqGukpf3FwKw0wI/0Ds
         RhueYDCgAQ810bng0DW24ALBZvBJuqHsE2l62wnXt5M+xLadv7+cgZ1LKkTscOBt7Vfy
         xaqshOkL9Sp4rFEVNrFwQ2AOvLmOTz6XyFv5GaP2gNIY5U/gkHxnmqj9k7zI979RSNvD
         eZG3OMc10kG5h6R7Ric4ahBUeNQAdxJd8iYdCGuQf6cX5BG3kyoVCYtRDz8i0IPGTyEU
         wB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367245; x=1791972045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrNkpb0d4qtNovZAgW6O0CMNn2hpdnuON/KzQGIiKiQ=;
        b=jTDV8njX9BYlFq3NUkYKdbsUkjavHBX9234tN8JqsWBRSw+LWodSRE42lRr0uYQrGN
         jnSb4v2LGwG/DUSCEXazTAivMLeVZKx90gZePsRkFkaCjtST4oxnXTANthg9jizIfv4o
         SEFOzCamGoakZCE8v/djr+PyMHjaPV6AiHDBJX5whLCgm2nf9DijIT9SmUF4LzG42gkG
         RkfC4uDcDphbUPU8ujimHNdJWWZ6pa+wpG73b+66xo2bxcR2pGlrT7/YNMDej3HrfjBM
         yNfhFHwuFrl45AsDL5Wtwv+fTYrtTqPmYjlKE8RP5nslfqnR5TwqWHi5r2Sn7m6EILEA
         1UrA==
X-Forwarded-Encrypted: i=1; AKwUvBw2XKtU6hIRKdyvYHSJDE+/uHKOEg4nEwrtn/Tw1SWIRu2benCJIrvfGnZEhqCaD5y+Tqfg3+MDAXs5yFdLY3db@lists.infradead.org
X-Gm-Message-State: AFuF++mpor0Ulbw1HUTOs6riTvBkYBr5sbiqrva6AtE7Yoy8UuMWCWix
	VyT+PfTgMYVtww0zAGBFl/a97JvQTdTyN01wsedMucqk+DFQPibDoMBUhRVDYExK8eJtAPWY5FD
	kfO+57vKJotCKGsvQvzHg2Ey9HxUY/yU=
X-Gm-Gg: AYBFou1aV1qCSb7YTxRStbKsXrtMj0y+iGgXtVlzsCgN/IoraE9jHvy+V4fuDFwrdTC
	eNsN0hjPe1zxJEwR4vdW9UyFBQxwWu5+JLa/fl0OZQc/2lDGbxEmzQycef6dSb+coUfL/Hcler4
	jrcwGBEQcuo0q/FhD/YMSTS/UChwDl0yPq77mQHL6HRrv2lQxWVeCTcZS9bUr+XuK6yohqeNiIT
	C86w8CWuf7UFo9EyYdD9svqo/LiGEbCz9XBT59dwbv+cNbtntv4TbPQ5H4Bc6bOVKC2yrgD/TZK
	LU0HE0f2CwuvSj/U3nkwWeyu8wXk5kbs693dr0lwHtR+LWSs+JLvvbb6mg==
X-Received: by 2002:a17:907:968f:b0:c31:5c2b:9e4b with SMTP id
 a640c23a62f3a-c317bd913e3mr171417966b.9.1791367244345; Wed, 07 Oct 2026
 03:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261005223011.1124347-1-coiaprant@gmail.com> <20261005223011.1124347-2-coiaprant@gmail.com>
 <20261006132428.GA1659963-robh@kernel.org> <96FA84EA-3C0E-4FAC-963F-2A8165538748@gmail.com>
 <20261006150831.GC2194299-robh@kernel.org> <46337722-9C86-4118-8286-A506B455B23D@gmail.com>
In-Reply-To: <46337722-9C86-4118-8286-A506B455B23D@gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 7 Oct 2026 18:00:32 +0800
X-Gm-Features: AclHuK8fvALioIp_2ZDF3ZkGQsmcOc_f0Q9lbyHaYtZVARGtB6mcLM_NG_T3Tgk
Message-ID: <CALj3r0ihUKOtn4dE4=UJQG1qZbdE7EEZ76it-17N36gFHDSrzg@mail.gmail.com>
Subject: Re: [PATCH net-next v10 1/6] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs support
To: Rob Herring <robh@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, David Wu <david.wu@rock-chips.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_030046_649067_0DF7D74F 
X-CRM114-Status: GOOD (  43.14  )
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

Coia Prant <coiaprant@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 23:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On October 6, 2026 11:08:31 PM GMT+08:00, Rob Herring <robh@kernel.org> w=
rote:
> >On Tue, Oct 06, 2026 at 09:59:49PM +0800, Coia Prant wrote:
> >> On October 6, 2026 9:24:28 PM GMT+08:00, Rob Herring <robh@kernel.org>=
 wrote:
> >> >On Tue, Oct 06, 2026 at 06:30:03AM +0800, Coia Prant wrote:
> >> >> Add device tree binding documentation for the Synopsys DesignWare
> >> >> XPCS integrated on the Rockchip RK3568 SoC.
> >> >>
> >> >> The XPCS is accessed over the APB3 bus and internally connected to
> >> >> a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
> >> >> QSGMII modes, with four MII ports.
> >> >>
> >> >> The four MII ports are described as ethernet-pcs-mii@N child nodes,
> >> >> consumed by the Rockchip XPCS glue driver later in this series.
> >> >>
> >> >> phys and phy-names are required because dtbs_check only validates
> >> >> required properties for enabled nodes. The SerDes link is a board-l=
evel
> >> >> design choice (combphy1 on some boards, combphy2 on others), so the=
se
> >> >> properties must be provided by the board device tree, not the SoC d=
tsi.
> >> >>
> >> >> The CRU reset lines (SRST_XPCS*) are intentionally not described: n=
o
> >> >> in-tree user requests them, and bring-up relies on the PD_PIPE powe=
r
> >> >> domain, the SerDes PHY and the in-IP soft reset. They can be added
> >> >> later as optional without breaking ABI.
> >> >>
> >> >> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> >> >> ---
> >> >>  .../net/pcs/rockchip,rk3568-xpcs.yaml         | 110 ++++++++++++++=
++++
> >> >>  1 file changed, 110 insertions(+)
> >> >>  create mode 100644 Documentation/devicetree/bindings/net/pcs/rockc=
hip,rk3568-xpcs.yaml
> >> >>
> >> >> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3=
568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-x=
pcs.yaml
> >> >> new file mode 100644
> >> >> index 0000000000000..703fcff0e3f70
> >> >> --- /dev/null
> >> >> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpc=
s.yaml
> >> >> @@ -0,0 +1,110 @@
> >> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> >> +%YAML 1.2
> >> >> +---
> >> >> +$id: http://devicetree.org/schemas/net/pcs/rockchip,rk3568-xpcs.ya=
ml#
> >> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> >> +
> >> >> +title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
> >> >> +
> >> >> +maintainers:
> >> >> +  - Coia Prant <coiaprant@gmail.com>
> >> >> +
> >> >> +description: |
> >> >> +  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Ph=
ysical
> >> >> +  Coding Sublayer (XPCS).
> >> >> +  The PCS provides an interface between the Media Access Control (=
MAC)
> >> >> +  and the Physical Medium Attachment (PMA) sublayer through a Medi=
a
> >> >> +  Independent Interface (GMII).
> >> >> +
> >> >> +  The XPCS is accessed over the APB3 bus and internally connected =
to a
> >> >> +  Naneng Combo SerDes PHY.
> >> >> +  It supports 1000BASE-X, SGMII and QSGMII modes.
> >> >> +
> >> >> +  The block contains four MII ports that can be individually enabl=
ed and
> >> >> +  routed to one of the Ethernet GMAC controllers via the pcs-handl=
e
> >> >> +  property in the MAC device tree node.
> >> >> +
> >> >> +properties:
> >> >> +  compatible:
> >> >> +    const: rockchip,rk3568-xpcs
> >> >> +
> >> >> +  reg:
> >> >> +    maxItems: 1
> >> >> +
> >> >> +  "#address-cells":
> >> >> +    const: 1
> >> >> +
> >> >> +  "#size-cells":
> >> >> +    const: 0
> >> >> +
> >> >> +  clocks:
> >> >> +    items:
> >> >> +      - description: APB3 bus interface clock (clk_csr_i), require=
d for register access
> >> >> +      - description: EEE clock (clk_eee_i), required for Energy Ef=
ficient Ethernet operation
> >> >> +
> >> >> +  clock-names:
> >> >> +    items:
> >> >> +      - const: csr
> >> >> +      - const: eee
> >> >> +
> >> >> +  phys:
> >> >> +    maxItems: 1
> >> >> +
> >> >> +  phy-names:
> >> >> +    const: serdes
> >> >
> >> >You don't really need phy-names if there is only 1 entry.
> >> >
> >> >> +
> >> >> +  power-domains:
> >> >> +    maxItems: 1
> >> >> +
> >> >> +patternProperties:
> >> >> +  "^ethernet-pcs-mii@[0-3]$":
> >> >> +    type: object
> >> >> +    description:
> >> >> +      One of the four MII ports of the XPCS. The port is linked to=
 an
> >> >> +      Ethernet MAC controller via the pcs-handle property in the M=
AC's
> >> >> +      device tree node.
> >> >> +
> >> >> +    properties:
> >> >> +      reg:
> >> >> +        description: MII port number.
> >> >> +        enum: [0, 1, 2, 3]
> >> >> +
> >> >> +    required:
> >> >> +      - reg
> >> >
> >> >Why the child nodes? They don't contain anything.
> >> >
> >> >Perhaps that's due to pcs-handle not supporting arg cells to pass the
> >> >port number? That's about to change[1].
> >> >
> >> >Rob
> >> >
> >> >[1] https://github.com/devicetree-org/dt-schema/pull/198
> >>
> >> Hi Rob,
> >>
> >> Both points make sense.
> >>
> >> 1. I'll drop phy-names since there's only a single entry.
> >>
> >> 2. For the ethernet-pcs-mii child nodes: you're right that they only
> >>    contain 'reg'. The reason I used child nodes is because pcs-handle
> >>    arg cells are not available yet -- PR #198 is still open and in
> >>    RFC/change-request state.
> >>
> >>    The RZN1 MII converter binding does the same thing: it declares
> >>    MII ports as subnodes and references the PCS via pcs-handle, until
> >>    arg cells land.
> >>
> >>    So I'd like to keep the child nodes as a temporary workaround, and
> >>    I'll add a note in the binding that this can be simplified once
> >>    PR #198 is merged.
> >
> >Bindings are an ABI. You can't merge the binding then change it. Please
> >comment on the PR that you all need it.
> >
> >Rob
>
> Hi Rob,
>
> Understood on the ABI point, and I don't want to merge a binding we'd
> have to change later.
>
> Could I ask for your guidance on the practical path? This series is
> ready, and I'd like to get it into 7.4 if possible, since OpenWrt and
> other distros base their support on LTS kernels. Missing this window
> means a long wait for users.
>
> Given PR #198 is still open, I see these options:
>
> 1. Wait for PR #198, then use pcs-handle =3D <&xpcs 0>. My concern is tha=
t
>    I have no visibility into its timeline -- it could be weeks or much
>    longer -- and holding the whole binding on that is hard to plan
>    around.
>
> 2. Keep the child nodes as the final ABI, RZ/N1 style, no planned
>    migration.
>
> 3. Something else you'd prefer.
>
> Which would you recommend? If waiting is the right call, I'll do that,
> but I'd like to understand roughly how long PR #198 is expected to take.
>
> Thanks,
> Coia

Hi Rob,

Thanks for the feedback. I went back to the Rockchip OEM SDK to check how
this is actually wired up, and it confirms the MII port is not an
independent board-level configuration -- it follows the MAC the SGMII
link is routed to (GMAC0 -> port 0, GMAC1 -> port 1).

So I've dropped the ethernet-pcs-mii child nodes and the phy-names
property, and the glue driver now derives the MII port from the MAC id.
The binding no longer needs pcs-handle argument cells, so we don't have
to wait for PR #198.

I'll post the updated series on the 9th.

Thanks,
Coia

