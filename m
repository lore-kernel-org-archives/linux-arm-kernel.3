Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A11BCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCfMB+9jyOng6UjHASMF1if+uXMBv5ni2DoESrOf5F0=; b=DPbVRM05OJ/vEbQLXfeuvqjWYt
	yVQsfOFgO0LoLKj4oaEWh1o8gkz9XE7cr1FLQSyx4/ZHAOsr9EKJeb5JReYf0xR7teVWCm2q/zW45
	rfokE2IghSYNwYzEpLdYyHXhCWVo8iqrhcrPxmUd6Pmimu7NB9VduJj+px1UrX4GW5DAYvVTxPtUY
	cC0nHsKiM1vecG/QU60T5XP45Efygcglkf5xC2jSpN4abBZi9I/Kb5tCjxPk0qptAmKEbRz81xJ3T
	OYmgG6NUZyCQy7SV8hkMPC02JeJkVYsI/ZzthibnLAn/SsNlYVRISDYQ7kvHXjmTonC34FmRnLkAr
	dQsGm1qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7TG-000000014mM-2wWI;
	Tue, 06 Oct 2026 15:52:50 +0000
Received: from mail-pz2-x09.google.com ([2607:f8b0:4864:3b::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7TE-000000014lR-11r3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:52:49 +0000
Received: by mail-pz2-x09.google.com with SMTP id 41be03b00d2f7-cc4ae08cca6so181644a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301967; x=1791906767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iCfMB+9jyOng6UjHASMF1if+uXMBv5ni2DoESrOf5F0=;
        b=iqCTVsn1EDecW6IxGEnI8NUUicVA6BxklOxM9W5YQXg54vjwLd9S64R5OoURAE/e+P
         KxUShFbHOMKFyBlN7JtsRaBvBf2/b1D0LW6bMQQpjrzkhzBqJ5ANbSzm6rAV8uPbZsqk
         mOSKHp/IM3RgrdEj6/pyZCJFjsn4Usc5rXZf19bkiUzE13MtV+nrpevMLOETBKMPChQM
         ResjJlSktOYS/Ua9vKNBI5Cf8GI9ux9pjAEziv/sF6YMM6y63VHNrTqMlBAl6/SLIyZ8
         ffG74Y6QvP906bd26bZhjiwmwRffOTQ8BnmW3N9HjAo7b5SORnEFyn4cr8Sj6GJqbC7c
         4jOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301967; x=1791906767;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCfMB+9jyOng6UjHASMF1if+uXMBv5ni2DoESrOf5F0=;
        b=YxQT3SWIHuHKgDWedENzT5SyP/vzIPIpZgbDoAjtW1b5mUumdLZ5NXHFXsTNbm9Myi
         TG/4ihyHEQ0Cw3hHPFSpo5gebdNp77bbGacXPkbFl8KlzGHnxiMWr4gEfetAATv/Envj
         Jmba1vPwIksePp5eaet7mmoA9UcEejgbjIkEBR03Wn/8KP/mz1VVqb88pjnhCOYjrBQr
         WhpPr4fczYtTlaBZ5A0w4B9jhvTPLzJ/kg7dPWQ4EdhoheUJbnPhPZxo29h4ZgkvtssW
         DFVPPzkPKQhaQWnVzMJTnxk+kSvQZc2tZPcfOFVCVu5WTW/Vul3G5euITgNAsQapjcvw
         bdTw==
X-Forwarded-Encrypted: i=1; AKwUvBwlZuUqBGcMoqT6pbQyhIXJkXmfHSiuisE4s9+ivb8QcR7lS9YFywgYRjQpsAO/mzM/8TadhPMDxCaVzquHBr6C@lists.infradead.org
X-Gm-Message-State: AFuF++lE+tFfbSdotOzDC5Uw3p+TndiXNz6d/jNW+90zK5zpvq+e4t1E
	HaC3nSYv/6D2zDwPwkKB4fFASO11zeTr5ChMIDa9ck9lStI18Xi2h303
X-Gm-Gg: AYBFou3BnbtaojNwth8PCiEm+r1T//NADzDMNydllkPN0Ps+CApWcdhmZpRa/cg1/yE
	FKXULHKaJfUpyvfJHEUU2N4c3xX2wbFBkBNHS2C5OMqXN+xeRZdpqEKu4VStQUXnddt7NjSFd1E
	hcf5ftUCcBqWPIDcvylvwNnzW3384oKV+wLfi43RR2HolD1xfcdSrPnij5TOhsQZoxAbuytXTQ2
	+j/gP3ZB7wXqYPd19rc1py+3N+udSdNpH2JHEqxEi6O+RIXeaRiL0GH0H4rIRSeI2IjLv1zD1LS
	CT12XOAF74n3IQG3Hrp8w8yj5mKl/mPHUu6ZZ4HPcQa+jYRuxy/NlBuxy/4zSXeozOFb9eR+pLL
	Yx6awhX7C89O6uhP2h4AYz37/9KflZCa11Bn+Z9Tbz7CTmcp8BpG4VJGIh9Jalp2nIDieGfRwvh
	Ia6J4In3rLqsP3M1ok3LL66dqXyOTX/xQSh8MXLlfOAZdMAiX6pQ29N4POCguUvzwOihNC1DSws
	xP/Cr3T
X-Received: by 2002:a05:6a00:22ca:b0:890:e1ff:3bac with SMTP id d2e1a72fcca58-890e1ff47c8mr1583488b3a.8.1791301967068;
        Tue, 06 Oct 2026 08:52:47 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-891894f6c0asm184007b3a.33.2026.10.06.08.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 08:52:46 -0700 (PDT)
Date: Tue, 06 Oct 2026 23:52:22 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 David Wu <david.wu@rock-chips.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_v10_1/6=5D_dt-bindings=3A_?=
 =?US-ASCII?Q?net=3A_pcs=3A_add_rockchip=2Crk3568-xpcs_support?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20261006150831.GC2194299-robh@kernel.org>
References: <20261005223011.1124347-1-coiaprant@gmail.com> <20261005223011.1124347-2-coiaprant@gmail.com> <20261006132428.GA1659963-robh@kernel.org> <96FA84EA-3C0E-4FAC-963F-2A8165538748@gmail.com> <20261006150831.GC2194299-robh@kernel.org>
Message-ID: <46337722-9C86-4118-8286-A506B455B23D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_085248_325684_2DD83DF3 
X-CRM114-Status: GOOD (  27.98  )
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

On October 6, 2026 11:08:31 PM GMT+08:00, Rob Herring <robh@kernel=2Eorg> w=
rote:
>On Tue, Oct 06, 2026 at 09:59:49PM +0800, Coia Prant wrote:
>> On October 6, 2026 9:24:28 PM GMT+08:00, Rob Herring <robh@kernel=2Eorg=
> wrote:
>> >On Tue, Oct 06, 2026 at 06:30:03AM +0800, Coia Prant wrote:
>> >> Add device tree binding documentation for the Synopsys DesignWare
>> >> XPCS integrated on the Rockchip RK3568 SoC=2E
>> >>=20
>> >> The XPCS is accessed over the APB3 bus and internally connected to
>> >> a Naneng Combo SerDes PHY=2E  It supports 1000BASE-X, SGMII, and
>> >> QSGMII modes, with four MII ports=2E
>> >>=20
>> >> The four MII ports are described as ethernet-pcs-mii@N child nodes,
>> >> consumed by the Rockchip XPCS glue driver later in this series=2E
>> >>=20
>> >> phys and phy-names are required because dtbs_check only validates
>> >> required properties for enabled nodes=2E The SerDes link is a board-=
level
>> >> design choice (combphy1 on some boards, combphy2 on others), so thes=
e
>> >> properties must be provided by the board device tree, not the SoC dt=
si=2E
>> >>=20
>> >> The CRU reset lines (SRST_XPCS*) are intentionally not described: no
>> >> in-tree user requests them, and bring-up relies on the PD_PIPE power
>> >> domain, the SerDes PHY and the in-IP soft reset=2E They can be added
>> >> later as optional without breaking ABI=2E
>> >>=20
>> >> Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>> >> ---
>> >>  =2E=2E=2E/net/pcs/rockchip,rk3568-xpcs=2Eyaml         | 110 +++++++=
+++++++++++
>> >>  1 file changed, 110 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/net/pcs/rockch=
ip,rk3568-xpcs=2Eyaml
>> >>=20
>> >> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk35=
68-xpcs=2Eyaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-=
xpcs=2Eyaml
>> >> new file mode 100644
>> >> index 0000000000000=2E=2E703fcff0e3f70
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs=
=2Eyaml
>> >> @@ -0,0 +1,110 @@
>> >> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> >> +%YAML 1=2E2
>> >> +---
>> >> +$id: http://devicetree=2Eorg/schemas/net/pcs/rockchip,rk3568-xpcs=
=2Eyaml#
>> >> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> >> +
>> >> +title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
>> >> +
>> >> +maintainers:
>> >> +  - Coia Prant <coiaprant@gmail=2Ecom>
>> >> +
>> >> +description: |
>> >> +  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Phy=
sical
>> >> +  Coding Sublayer (XPCS)=2E
>> >> +  The PCS provides an interface between the Media Access Control (M=
AC)
>> >> +  and the Physical Medium Attachment (PMA) sublayer through a Media
>> >> +  Independent Interface (GMII)=2E
>> >> +
>> >> +  The XPCS is accessed over the APB3 bus and internally connected t=
o a
>> >> +  Naneng Combo SerDes PHY=2E
>> >> +  It supports 1000BASE-X, SGMII and QSGMII modes=2E
>> >> +
>> >> +  The block contains four MII ports that can be individually enable=
d and
>> >> +  routed to one of the Ethernet GMAC controllers via the pcs-handle
>> >> +  property in the MAC device tree node=2E
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    const: rockchip,rk3568-xpcs
>> >> +
>> >> +  reg:
>> >> +    maxItems: 1
>> >> +
>> >> +  "#address-cells":
>> >> +    const: 1
>> >> +
>> >> +  "#size-cells":
>> >> +    const: 0
>> >> +
>> >> +  clocks:
>> >> +    items:
>> >> +      - description: APB3 bus interface clock (clk_csr_i), required=
 for register access
>> >> +      - description: EEE clock (clk_eee_i), required for Energy Eff=
icient Ethernet operation
>> >> +
>> >> +  clock-names:
>> >> +    items:
>> >> +      - const: csr
>> >> +      - const: eee
>> >> +
>> >> +  phys:
>> >> +    maxItems: 1
>> >> +
>> >> +  phy-names:
>> >> +    const: serdes
>> >
>> >You don't really need phy-names if there is only 1 entry=2E
>> >
>> >> +
>> >> +  power-domains:
>> >> +    maxItems: 1
>> >> +
>> >> +patternProperties:
>> >> +  "^ethernet-pcs-mii@[0-3]$":
>> >> +    type: object
>> >> +    description:
>> >> +      One of the four MII ports of the XPCS=2E The port is linked t=
o an
>> >> +      Ethernet MAC controller via the pcs-handle property in the MA=
C's
>> >> +      device tree node=2E
>> >> +
>> >> +    properties:
>> >> +      reg:
>> >> +        description: MII port number=2E
>> >> +        enum: [0, 1, 2, 3]
>> >> +
>> >> +    required:
>> >> +      - reg
>> >
>> >Why the child nodes? They don't contain anything=2E
>> >
>> >Perhaps that's due to pcs-handle not supporting arg cells to pass the=
=20
>> >port number? That's about to change[1]=2E
>> >
>> >Rob
>> >
>> >[1] https://github=2Ecom/devicetree-org/dt-schema/pull/198
>>=20
>> Hi Rob,
>>=20
>> Both points make sense=2E
>>=20
>> 1=2E I'll drop phy-names since there's only a single entry=2E
>>=20
>> 2=2E For the ethernet-pcs-mii child nodes: you're right that they only
>>    contain 'reg'=2E The reason I used child nodes is because pcs-handle
>>    arg cells are not available yet -- PR #198 is still open and in
>>    RFC/change-request state=2E
>>=20
>>    The RZN1 MII converter binding does the same thing: it declares
>>    MII ports as subnodes and references the PCS via pcs-handle, until
>>    arg cells land=2E
>>=20
>>    So I'd like to keep the child nodes as a temporary workaround, and
>>    I'll add a note in the binding that this can be simplified once
>>    PR #198 is merged=2E
>
>Bindings are an ABI=2E You can't merge the binding then change it=2E Plea=
se=20
>comment on the PR that you all need it=2E
>
>Rob

Hi Rob,

Understood on the ABI point, and I don't want to merge a binding we'd
have to change later=2E

Could I ask for your guidance on the practical path? This series is
ready, and I'd like to get it into 7=2E4 if possible, since OpenWrt and
other distros base their support on LTS kernels=2E Missing this window
means a long wait for users=2E

Given PR #198 is still open, I see these options:

1=2E Wait for PR #198, then use pcs-handle =3D <&xpcs 0>=2E My concern is =
that
   I have no visibility into its timeline -- it could be weeks or much
   longer -- and holding the whole binding on that is hard to plan
   around=2E

2=2E Keep the child nodes as the final ABI, RZ/N1 style, no planned
   migration=2E

3=2E Something else you'd prefer=2E

Which would you recommend? If waiting is the right call, I'll do that,
but I'd like to understand roughly how long PR #198 is expected to take=2E

Thanks,
Coia

