Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59419C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 23:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8obYoQRW0D7bMouRYacqh4D5cOARHGrRdydWcpJ2O8=; b=PuyNIOseWLS6nfdGEcrlqXfaDM
	GwSYrDbJJEfvgc9AtOn5bNJCZvqa2y3ghsE9aXBF+Gx//IJC2bCmbYl2zU0bylOxezVeQ02WR86M9
	bvivL5mp8ZWOPYcWblr7xe9oOaXzDFP+2qQhVo5kxlZecMqHJuBECaIplG5GfLSOdZQs7bFAzFiht
	zKWI+JYBB6gsIttn67WRBfLSR8Eg17FFaqG9lfP3jbZY3Bd/WqYGMMOBREycIXVlZ2W98mNqh2+Jh
	8lngh23Xtdf/BqLg+85swIsJV4ta2lQjyrtrCJUQpU6v4+GgeCzn5+cg9Xt9+663Bwygt2EGi9NDY
	DteFi6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk8bz-0000000G3hP-0M5f;
	Wed, 15 Jul 2026 23:01:55 +0000
Received: from mail-ej2-x03.google.com ([2a00:1450:4864:34::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk8bw-0000000G3fx-3TZs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 23:01:54 +0000
Received: by mail-ej2-x03.google.com with SMTP id a640c23a62f3a-c15a2e27498so373700866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 16:01:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784156509; cv=none;
        d=google.com; s=arc-20260327;
        b=On0XndeOOM+0TjThmbufADj9UOEFa8wI7DACh0ZCgsbI4KE6JnPovXAQ9xrzFF+8Sl
         9Ia9C/sAmQwNXEJN+deSPrzZyY/i0eSWtXVDHpe8EbglVwF1aLMgzlk2ZZ44PmA7wmWQ
         KJtbr/FMdIySsTYwIFK1GEqUs2LXR5eaG0wvIZxi4gvSvnDoZ6Csi5rK0yKV5xozmFqC
         awCYjWAmZy00Onb4rYPMTRcEEa8FSyGKtFihUESKpDGs/+T1f0qa8zMpSVgHzVfU9Q9G
         MsLcuF9MLxQjNtkIVSE9bsVhNCgnRvNhylFE7nKkL+TdZDNtNRjbeKT72lghklf8efdq
         nd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y8obYoQRW0D7bMouRYacqh4D5cOARHGrRdydWcpJ2O8=;
        fh=1/y04DMDSynZgW1YZ4Zb4CLyyn6DnsiyULcZnwiL4Yw=;
        b=siFKbplpgmCBS37F9uMQ4iDksjmUzNzAlQ1eTba3uZqJhunx8jE+Rj5a2s0pZ0ToSH
         qIHn7wXTU8G2c6kou2eXancXKBKmwBsxj+bh0277G9VmB2PRHXc0myIztTo1i+tlYQjw
         yzh0/nBQU+jc7aqG8SrmTv0ANOQcIoY8kWefDCGXMVlpG6aBK8vtS83akaKzV9LInlX1
         WKw0IH6+vGHc9qYwXfZfSbZmRdXsfBNdaTrSWd6LHkzUDCjWvade96+q1rOKUPVHgtiJ
         s+3OtfmtJ5P79qRTX3kTaBiV7sADWY7MkUG8YsRz0sYNjjO1u3AYJBa67tgtM4uJkfpu
         aQJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784156509; x=1784761309; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y8obYoQRW0D7bMouRYacqh4D5cOARHGrRdydWcpJ2O8=;
        b=VmUbIgjv/IAYNVwj1H04oQPJm3t3kVPhrXhbkfNilpdWe/RVZxEhpsLZp+gJEGB7H8
         38dkXvBUwUdconWabC1xkFybqfrO7stWhJN2twlfAFCLjLTBwh1bBy8I04iRSWx0Bkjz
         U2Xc5E48bkm8OG4SEhSe71OvA/5ZOZ/BXRib5ZRG1PVdkSuZwIG2AMYMfcSbo/b+a972
         xlS/Rp7F4mcH9dKpPrED7rJL7M+Hj5SJBaG0YEhMgDHhgkEZP0/N4avrdkqtNMyCKScc
         mooBazjRVYenBN+LmuHPWyiYsN5vaCsEwzzpL4fOuuAaY/ABE+xBPXx54PjN/MtVGQPc
         7N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784156509; x=1784761309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8obYoQRW0D7bMouRYacqh4D5cOARHGrRdydWcpJ2O8=;
        b=V4AgbLiTyCmfDtX4qe7TWwWKgX6sFPY78+FJez/LmsVlGrt/PYdIXHKF+FpIBOmBQn
         0fqDfk3XBHesyqVCTkboy4Wxr2XZGsWQj+DPn1fG49yx7KQtoF3UKvneSr4lZ4fNHGEi
         d/mOZcurdYHHh105OGj188oc1i1WecGa/XPSYWxKJA6lBB9h7EEPo1jKSgfotGle9tY5
         TkLR0qZNu2uGWFadrVDYhCB2DmKK9JKLiXzZuI41T5EVGjSeA7iYnrVlAwXte2bmtOsJ
         jUf5PHdhRWriW/r1CY0zXKp+xhT0ImmmUWPVEIT3DJXunXmwVylL0dvA1RQrFv84FBJb
         VX0g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+NhBeSDYsB1YEr4hvW5u+ogxpPaYbFwaXt4V7ZbPnOUMm8cB8yy7brdqLFYBv8Z5w3rbSK9BsJL1OJlCYjEf4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb3HwvgswOb21VzN0RDWIROBL/IpKlNxcjWR5zV+w7/I6wi6mu
	fFBota1dXXE5J9vZUSCUryIFAumpid2Lj1kfPQ4y2dpehh5yIk0frszm/hGgQfCP54jl5xxaI05
	Mzkw1ppat3Jpj6DDfrQ2M7hnRM9wVGMI=
X-Gm-Gg: AfdE7clwRuwtIEoy8wtUjuKLYyG1hXl7TQ8IotnUcFvBX9OxyZn/ns37Np6EllX6LZv
	gIMJbjmWO3UADjrI4hkjBsNHekjLHC0mL9XIKV6RE/WhKltEJ7SS2qmvivRkRdgexr9gWuzmYsq
	mF2hHrMgYg0QlqVWimUaV+JF8kb5oGtyrCKtOKH0knZSj9z2RdsPxqJik8Pc9eMD6ICt5+HQw7q
	seuykSMbPU9OBWc4Ipu+s+gaB66zStF2UExTd/Frmi6pPrOuX5mfLFvbDpAqs9X
X-Received: by 2002:a17:907:3f22:b0:c15:9350:dfa6 with SMTP id
 a640c23a62f3a-c16619ad2b0mr539188966b.60.1784156508425; Wed, 15 Jul 2026
 16:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-8-coiaprant@gmail.com>
 <4823c1d9-51d9-45fa-a96c-f2caab1cb29e@bootlin.com> <CALj3r0h4cFd-tp9-UVxihL9-a1W7_4nvnKoXW_cP5WECKc66Hw@mail.gmail.com>
 <1d92078f-3009-43d1-a228-c3e67a1f4f4c@lunn.ch> <CALj3r0gBnyEVwo3rK-dKssYN9F4nFn93QJ24FVv8YBLjNNgPmg@mail.gmail.com>
 <039c2cce-e76e-4321-ba4a-cd80801f136e@lunn.ch>
In-Reply-To: <039c2cce-e76e-4321-ba4a-cd80801f136e@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 07:01:37 +0800
X-Gm-Features: AUfX_mwFPn4a5IZZI8ivW-vw003zPra-aQ5NOk6yPm8eSjdntp4P_3w-2rjiAlg
Message-ID: <CALj3r0gmNudG2pCebGzd+453ORVakkyct4oDYR+SrqLPkx1nFg@mail.gmail.com>
Subject: Re: [RFC PATCH 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_160153_072310_AC80A57A 
X-CRM114-Status: GOOD (  26.08  )
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

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B47=E6=9C=8816=E6=97=A5=E5=
=91=A8=E5=9B=9B 06:25=E5=86=99=E9=81=93=EF=BC=9A
>
> > The current design
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > The dependency chain I chose is simple:
> >
> >     stmmac (GMAC) -> pcs-handle -> XPCS node -> phys -> SerDes PHY
>
> Maybe we need to be more accurate here.
>
> In QSGMII I _think_ it is actually
>
> stmmac (GMAC) -> pcs-handle -> XPCS node -\
> stmmac (GMAC) -> pcs-handle -> XPCS node -------> phys -> SerDes PHY
> stmmac (GMAC) -> pcs-handle -> XPCS node -/ /
> stmmac (GMAC) -> pcs-handle -> XPCS node --/
>
> There are four instances of stmmac, four instances of the XPCS, which
> then all come together into one PHY.
>
> When using SGMII, does it look like this ?
>
> stmmac (GMAC) -> pcs-handle -> XPCS node -------> phys -> SerDes PHY
> stmmac (GMAC) -> pcs-handle -> XPCS node -------> phys -> SerDes PHY
> stmmac (GMAC) -> pcs-handle -> XPCS node -------> phys -> SerDes PHY
> stmmac (GMAC) -> pcs-handle -> XPCS node -------> phys -> SerDes PHY
>
> There are four of everything, all working independently.
>
> Is there 1 QSGMII PHY and 4 SGMII PHYs? Or does one of the 4 phys
> support SGMII + QSGMII, while 3 are SGMII only?
>
> > 2. User misconfiguration: even with reference counting, if a user sets
> >    `phys =3D <&combphy2 PHY_TYPE_SGMII>` for GMAC0 and
> >    `phys =3D <&combphy2 PHY_TYPE_QSGMII>` for GMAC1, the same PHY would
> >    be initialized in two different modes.
>
> I would hope that results in -EINVAL.
>
>   Andrew

Hi Andrew,

Thanks for the follow-up. I've dug through Rockchip's BSP and found the
exact device tree configurations they use for their EVBs, which I think
clears up the topology question.

For reference, here are the relevant BSP device tree files:
- QSGMII: https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr6.1/arch=
/arm64/boot/dts/rockchip/rk3568-evb2-lp4x-v10.dtsi#L185
- SGMII: https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr6.1/arch/=
arm64/boot/dts/rockchip/rk3568-evb5-ddr4-v10.dtsi#L208

Hardware topology confirmed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
The BSP shows that for RK3568, the hardware is indeed a shared resource.

One important clarification: the XPCS block has four logical entities
(corresponding to the four MII ports, pcs-mii@0..3). In my driver, these
are all attached to the same MDIO bus and distinguished by address.

To clarify the PHY topology: there is only one physical SerDes PHY on
RK3568 (combphy1_usq). In QSGMII mode, this single PHY provides four
logical ports via time-division multiplexing. In the device tree, all
four ports are attached to the same MDIO bus and distinguished by
address (pcs-mii@0..3).

So it's not "4 PHYs" but "1 PHY with 4 logical ports", all accessible
through the same MDIO bus with different address. The BSP EVB2
configuration confirms this:
both gmac0 and gmac1 reference the same combphy1_usq with
PHY_TYPE_QSGMII.

To clarify the difference between SGMII and QSGMII:
- SGMII is a single serial link at 1.25 Gbaud, providing one Gigabit port.
- QSGMII is a 5 Gbaud SerDes protocol that multiplexes four SGMII links
  onto the same physical lanes.

So for RK3568: one PHY for SGMII, or one PHY for QSGMII (both GMACs share
the same PHY, each using a dedicated logical port).

For SGMII mode, only one of these ports can be used at a time, and only
one GMAC can use the SGMII link. The BSP EVB5 configuration shows this
clearly: gmac0 uses SGMII, while gmac1 falls back to RGMII.

For QSGMII mode, the BSP EVB2 configuration shows both gmac0 and gmac1
configured with phy-mode =3D "qsgmii", both referencing the same combphy1_u=
sq
as their phys. This confirms your diagram: multiple MACs converge on a
single SerDes PHY via the XPCS, with the four logical ports time-division
multiplexed onto the single PHY.

Why this matters for the design
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
This BSP evidence supports my current design where the XPCS node owns
the SerDes PHY:

1. It matches the hardware: the XPCS is the central multiplexer.
   Placing the PHY under the XPCS node in the device tree accurately
   reflects this hardware reality.

2. It's the only viable path for QSGMII: as the BSP shows, QSGMII
   requires multiple MACs to share one PHY. If the PHY were owned by the
   MAC driver (dwmac-rk), we'd need complex refcounting and cross-MAC
   coordination. The XPCS-owner model solves this cleanly by making the
   XPCS the single point of control.

3. It aligns with the BSP's own logic: even though the BSP uses a
   non-standard property (rockchip,xpcs), the underlying idea is the
   same: the MACs point to a shared XPCS node, which then manages the
   PHY. My design just does this using the standard kernel frameworks.

So, I believe the current design is correct. It's based on the hardware
reality confirmed by Rockchip's own BSP, and it uses the standard kernel
interfaces to do so. I'm happy to keep the XPCS as the owner of the
SerDes PHY in v2 if you agree.

Thanks,
Coia

