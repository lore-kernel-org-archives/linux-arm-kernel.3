Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAAECA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lgDiGiDkESTunf7jYG2kAM7tCOtBYTh+K/PRaEYgo0=; b=ZkxV/BVqMk3nxNaRsL41z+UqTx
	Oi0uUTEuSS9BIGTVw/AJFWnzU4/PLeE0BVsHrXdT1Jfv5FuYyriv04WPDsEzT0+qF/oHWP4RYRMQq
	SBexO2A5WDU5V7NI3tzIihw1tFDV9uRsvqU0IDGskZcFR1yWQCZtdBRJ7aeYv0DaaDkrCUQvTfRZP
	kXbq88rVRL+P7yUBjcROLLIpqoLq5l0X2djZ6Lpq0aqJbcb0E2REuUJq8we3p07pdS/5rXt/rHKXM
	mNQ+XkS6wNzSohbm8Q09Z9rIljYmLsNsu7ZZU0KF1XLgaZHHpFdmZ22XBzYSUtynq4GtKfdiunX8R
	v00P0ruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5i8-00000000v9M-1wkG;
	Tue, 06 Oct 2026 14:00:04 +0000
Received: from mail-pz2-x08.google.com ([2607:f8b0:4864:3b::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5i3-00000000v7P-05kM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 14:00:00 +0000
Received: by mail-pz2-x08.google.com with SMTP id 41be03b00d2f7-cc75f2924abso3091131a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295198; x=1791899998; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1lgDiGiDkESTunf7jYG2kAM7tCOtBYTh+K/PRaEYgo0=;
        b=F7/fq4fL2MC0/rV5NzlBLFxfMmpld1wqJ2j+/66ws45RvXnId5T7zRFRhi8y59/scH
         k+hcw9S1dBmkmplffJ48qKp+cWqOq9W24ogn31keoTxdysIcYLqZBG2P4ZhrFCCWoIEe
         OQqI04649Hkslr4Rxfol33RsUiL2XWWXb8SKNt0QFK7M2W2NJhl3DO9OxT8DpdTeg9JR
         U2FvLdaV/otoBLSC5mL6bbRZQ3J86jZe+frMxZtJ7oQgs1GIBQojkqNm2zf353eLYijl
         ZIK2W1yXIB3nt6SxKXGmhFrSkIyNGGCa0I8NhqD/kd1tFMtuvCIanZt75TDRyud9aJcV
         pUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295198; x=1791899998;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lgDiGiDkESTunf7jYG2kAM7tCOtBYTh+K/PRaEYgo0=;
        b=BwXWM7bs0R4DiPlHKnRB8A3CPCtWDLrg/VQqtr6URusRbS8TAyME70fXCCsbuWXuOu
         tTEbpjyo+jyfFK3zj2g0/cDiM/2UdpVP4BDHBu43kTORWMfSQ25zhIVcY1LKD2wQED8A
         EWdEbsAnhzd0XA/r25/dw47TN+vUtqARiVJBbe/wW6dxDE7jNSluY1AzMOFZVlq/GoOd
         DMHaWv+eb62osM4m+XzFwzuDQzkrZyV59dhPKt7NVCXFhNVl6TaXJMEnI5YABb2T9KGF
         fnuzB7R+PEyv0zF1xkPaCscEwqWnS/xN+vCKpZua4Ws6UB9g5kpdUXbNaJKgqLU1J4yA
         v2+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgJR5CO/oS7M+G8hIbApQLerjL9N/KsiGezLtzeRsuRBx/2dTLFjyPl+Ud34de4rhFYeEg8c2w2kHUyF2ZvwCd@lists.infradead.org
X-Gm-Message-State: AFuF++mXAzuvj/7sgJZDkMzoIZWMuh0IPY0iv0/wiIkLDQ2pC1/VV5hB
	SE9XFf0WQ/AIaxEdz9Jt0Jbf32HaxKITnpURHZ0Qce6kLL3lhHgrdZq0
X-Gm-Gg: AYBFou39Y1I+ln3vMK0CboX5aDLdNlb8X00XJeaaYUL1pVPGdbzdJ5M8cQewotoxaDd
	l2Sk4BZxQGP11EqGvuX93YJtML/EFc0JpzK6oeMhgSmm3n8xD3OoSsn3oiAD7Cx/qs+Yimpszl5
	1Kisf4VLQVuRm3URAUK8fQSUr0t0D8WYfNHcIFLiFzuYsJzAWenavAMT215U2j6ACrY7cmA0rSW
	Pcm1y3ZfDft3DzHxlA3jxleIhw9PlCHp1f12NPUI0ztWOiWpI40y59zr5uKJuUAl/B7e8IH4ZsF
	DWWPgLbXulTMDAbMTPg3t2MyAyayT3GVqRFHjcGApf1XwGD6UkN/83yqoCymUdEnoqCzHgeTGUC
	s9BTUOci4UiHKN58rsNYr7PAIvXp3DNtFBaPAc5jjZb+GLDOQyHqopx8K71jnepKajt08wW/R+s
	g2lwrLq06+0CRl0jNybzG7k45fOooxa4xMT7Nror++3k+PNrBVZfG5DKue9j7E2usEb/o=
X-Received: by 2002:a05:6a00:3319:b0:882:ace7:88e2 with SMTP id d2e1a72fcca58-890ddffc726mr1294423b3a.12.1791295198063;
        Tue, 06 Oct 2026 06:59:58 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2603:c021:8000:9500:233::14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d04ed92sm5001409b3a.51.2026.10.06.06.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 06:59:57 -0700 (PDT)
Date: Tue, 06 Oct 2026 21:59:49 +0800
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
In-Reply-To: <20261006132428.GA1659963-robh@kernel.org>
References: <20261005223011.1124347-1-coiaprant@gmail.com> <20261005223011.1124347-2-coiaprant@gmail.com> <20261006132428.GA1659963-robh@kernel.org>
Message-ID: <96FA84EA-3C0E-4FAC-963F-2A8165538748@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_065959_068695_8CAA80F2 
X-CRM114-Status: GOOD (  22.78  )
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

On October 6, 2026 9:24:28 PM GMT+08:00, Rob Herring <robh@kernel=2Eorg> wr=
ote:
>On Tue, Oct 06, 2026 at 06:30:03AM +0800, Coia Prant wrote:
>> Add device tree binding documentation for the Synopsys DesignWare
>> XPCS integrated on the Rockchip RK3568 SoC=2E
>>=20
>> The XPCS is accessed over the APB3 bus and internally connected to
>> a Naneng Combo SerDes PHY=2E  It supports 1000BASE-X, SGMII, and
>> QSGMII modes, with four MII ports=2E
>>=20
>> The four MII ports are described as ethernet-pcs-mii@N child nodes,
>> consumed by the Rockchip XPCS glue driver later in this series=2E
>>=20
>> phys and phy-names are required because dtbs_check only validates
>> required properties for enabled nodes=2E The SerDes link is a board-lev=
el
>> design choice (combphy1 on some boards, combphy2 on others), so these
>> properties must be provided by the board device tree, not the SoC dtsi=
=2E
>>=20
>> The CRU reset lines (SRST_XPCS*) are intentionally not described: no
>> in-tree user requests them, and bring-up relies on the PD_PIPE power
>> domain, the SerDes PHY and the in-IP soft reset=2E They can be added
>> later as optional without breaking ABI=2E
>>=20
>> Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/net/pcs/rockchip,rk3568-xpcs=2Eyaml         | 110 ++++++++++=
++++++++
>>  1 file changed, 110 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,=
rk3568-xpcs=2Eyaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-=
xpcs=2Eyaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpc=
s=2Eyaml
>> new file mode 100644
>> index 0000000000000=2E=2E703fcff0e3f70
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs=2E=
yaml
>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> +%YAML 1=2E2
>> +---
>> +$id: http://devicetree=2Eorg/schemas/net/pcs/rockchip,rk3568-xpcs=2Eya=
ml#
>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> +
>> +title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
>> +
>> +maintainers:
>> +  - Coia Prant <coiaprant@gmail=2Ecom>
>> +
>> +description: |
>> +  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physic=
al
>> +  Coding Sublayer (XPCS)=2E
>> +  The PCS provides an interface between the Media Access Control (MAC)
>> +  and the Physical Medium Attachment (PMA) sublayer through a Media
>> +  Independent Interface (GMII)=2E
>> +
>> +  The XPCS is accessed over the APB3 bus and internally connected to a
>> +  Naneng Combo SerDes PHY=2E
>> +  It supports 1000BASE-X, SGMII and QSGMII modes=2E
>> +
>> +  The block contains four MII ports that can be individually enabled a=
nd
>> +  routed to one of the Ethernet GMAC controllers via the pcs-handle
>> +  property in the MAC device tree node=2E
>> +
>> +properties:
>> +  compatible:
>> +    const: rockchip,rk3568-xpcs
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    items:
>> +      - description: APB3 bus interface clock (clk_csr_i), required fo=
r register access
>> +      - description: EEE clock (clk_eee_i), required for Energy Effici=
ent Ethernet operation
>> +
>> +  clock-names:
>> +    items:
>> +      - const: csr
>> +      - const: eee
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: serdes
>
>You don't really need phy-names if there is only 1 entry=2E
>
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^ethernet-pcs-mii@[0-3]$":
>> +    type: object
>> +    description:
>> +      One of the four MII ports of the XPCS=2E The port is linked to a=
n
>> +      Ethernet MAC controller via the pcs-handle property in the MAC's
>> +      device tree node=2E
>> +
>> +    properties:
>> +      reg:
>> +        description: MII port number=2E
>> +        enum: [0, 1, 2, 3]
>> +
>> +    required:
>> +      - reg
>
>Why the child nodes? They don't contain anything=2E
>
>Perhaps that's due to pcs-handle not supporting arg cells to pass the=20
>port number? That's about to change[1]=2E
>
>Rob
>
>[1] https://github=2Ecom/devicetree-org/dt-schema/pull/198

Hi Rob,

Both points make sense=2E

1=2E I'll drop phy-names since there's only a single entry=2E

2=2E For the ethernet-pcs-mii child nodes: you're right that they only
   contain 'reg'=2E The reason I used child nodes is because pcs-handle
   arg cells are not available yet -- PR #198 is still open and in
   RFC/change-request state=2E

   The RZN1 MII converter binding does the same thing: it declares
   MII ports as subnodes and references the PCS via pcs-handle, until
   arg cells land=2E

   So I'd like to keep the child nodes as a temporary workaround, and
   I'll add a note in the binding that this can be simplified once
   PR #198 is merged=2E

Thanks,
Coia

