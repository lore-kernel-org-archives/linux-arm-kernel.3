Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489C3C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pkp/eQf09LCqXaqLSVyyyJ0ciI7AzbJ9Q/c0YuMCG0k=; b=Q5Skt3Io91KL/g6dYRRN3YAiZo
	5hQSCij1qD3aAjlhWYprHdXOdlCy+1qNZgy2Cl7EDsrtohbQKBIN+Dx0FmHA3FeqOlgx5blK9qfqG
	2344Yxxbt7eQymxmx8dpf1DdhUcV+8QVaGIRzbdy3D30Ibwa8uIiPHwV+NJzQ5ihtx5yue0f6yXKz
	CJnj2Bl1Vo/CdUUsl+/zbcFB8y0vAPDTmmFOsbhUlx247d8xnBqTE1/LCuouxc8H3iW+7/v+/mN3D
	wgG6FRpzGUeBVeg1ixV2NeAPIuWingGVJjXes9gHrHdjEtLqnW/Oqyt2m6lXIieERwSr0vPc8pgjU
	u1T9nlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ie4-0000000Bq2I-3Aah;
	Wed, 09 Sep 2026 13:47:24 +0000
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ie2-0000000Bq1J-1ncJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:47:23 +0000
Received: by mail-lr2-x10.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so2148201fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788961640; x=1789566440; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pkp/eQf09LCqXaqLSVyyyJ0ciI7AzbJ9Q/c0YuMCG0k=;
        b=rtomgUTubCbvsYLbKWikH4lLO+Uge8/ACegOk9QVAksWj9RHGhIUKVEc8NiHjNfNb/
         lIyA070dm2GcLt7veRyoG7ZdYSrzh28n/GPUmnTcFrYM+kliPKO2xw+cYk15eXrgtsKS
         jHFstCuhjk+aoSBpn+y+oMVe5aubemMAaeGtK3Tby9vc7w+j2O7aYxw2JzmNuMz/KASv
         q19+wgrDoHSGkQWwqByFebwlrE6NHJ2ft2Y8/xzy91WEsg5D9Rl5dnJyS3wgfd7bcLqL
         TTd3BTRZRt4JsNZE1ozt7li6BJPhdhiaQg4un9GwtSIL1uiS3sWVEYFW0NrZ/nxZenYB
         hceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961640; x=1789566440;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pkp/eQf09LCqXaqLSVyyyJ0ciI7AzbJ9Q/c0YuMCG0k=;
        b=a6bCVxMO1ioKQmTWZNqneIUcwFE1pBMq2C8w0CtFNt5vD49DQLvF1Ofkj9RK7cUSOz
         BVHYLq8DAoPjl87q9kIiYU1OBVSyfC2iFYiGCq7qmw6nbA52Ql9OHax/MNBXpv/Wwc07
         MMPOPfD23tg146u4fzkwAjj5EVpPelWMN7CtKvnAPTSVRSQQBK/9/X012Yw0oEer6O5G
         0C05oBEbVDsaapGytRt2KJY6wGmnUv0SVlg/ISTeRjXfmH4GNOfM+pt6BoPe+yF0ApPw
         m/7cwgjC92zn42TaThxjUfSLVUeuSWLic0twvTs+7hKT4azisT8wvqIuNJPipCkZvZKI
         xcxw==
X-Forwarded-Encrypted: i=1; AKwUvBzxC9/5QdEXrFv9wT71mvcchWwUaAIeW/QvZ3uu63dA4woK+XXIe9OJgt3Gv/EiT5t9mpJYJBoVpUvL38gSwN2c@lists.infradead.org
X-Gm-Message-State: AFuF++k3KuHFRYRItlVqW9HYBa789S8wNahAgCz5/Q+3aw5aqFhQnn+h
	ZfFE+cnmz9UaZPzSUtjLETR+LMENOtI9lhSbB+JBL7hvpzhrWES29XiR
X-Gm-Gg: AYBFou2LiyDPDtJQsVKHfQQrXK4Jlc8pJWWBBiIF9BNylVaDgbD1Cw5AuD1RUysS7MC
	lMnfgj6aI7MxdeFhWsxG5tlKwfWyJG9MtMXsCGTyMX1gwFM6Hrix07UNsJJSx4rsCh5q9p5j7s7
	MzuDUd+VfuDlXUAx9IsJ/OERsPnUTLJzVi6KWJF5iUo2aLySDDotGtAf4/l0A0jP3hLTBmBxl9s
	CotTbcmYEbdjNxvaBkQbLZy73Hes9zZbrYYQrTJGmnKZflPjsx4pg0THlNZFu3SZ5aP/96P61Nt
	xfmUc2VPw020WZgnsLmoH2mLgeXnkJJ7HgIMkf0RfUc47QNVSxx0ngAQMcC8DDERMFAKE/Xo3m8
	LXt6gAYh4xRZIDEHVGNdu3k3GrrUN/IIiPQyEAU+cd51avKIWZYHb4RbtEiH3goKzdH1vUVAJ9y
	n+xzgno/QqQIvnFh3yl5MZ38pgtPbCrMOuf9F9iMxw+hHHb2+W5L387giG2qK5Yc7Nb8zQcocCo
	kkxjEDvaAkV/YLDk+S7dTcJ
X-Received: by 2002:a05:651c:1511:b0:3a4:8913:a259 with SMTP id 38308e7fff4ca-3a58d59a433mr1654671fa.29.1788961639878;
        Wed, 09 Sep 2026 06:47:19 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705cd8d5sm42008571fa.37.2026.09.09.06.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:47:19 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: devnull+hystericaldragons.proton.me@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	jensenhuang@friendlyarm.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
Date: Wed,  9 Sep 2026 16:47:16 +0300
Message-ID: <20260909134716.879-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260907-r28s-upstream-v2-2-21ab570fc91c@proton.me>
References: <20260907-r28s-upstream-v2-2-21ab570fc91c@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_064722_490743_3B77CD43 
X-CRM114-Status: GOOD (  13.32  )
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

On Mon Sep 7, 2026 at 4:13 PM CEST, 安容 via B4 Relay wrote:
> +&mdio1 {
> +	rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac1_rstn_l>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	};
> +};

This is carried over unchanged from the NanoPi Zero2, so not something
this patch introduces, but it is worth fixing while the node is being
moved, because as written the port depends on the bootloader.

of_mdio_bus_register() reads the PHY ID with get_phy_device() before
phy_device_register() fetches the PHY node's reset-gpios, so a PHY that
the bootloader left in reset is simply not found:

  mdio_bus stmmac-0: MDIO device at address 1 is missing.

I hit exactly that on a NanoPi R28S booted with mainline U-Boot
(generic-rk3528), which does not touch that pin - the RGMII port never
came up. Describing the reset on the MAC instead makes stmmac install it
as mii_bus->reset, which runs before the bus is scanned:

	&gmac1 {
		snps,reset-active-low;
		snps,reset-delays-us = <0 20000 100000>;
		snps,reset-gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
	};

with &gmac1_rstn_l moved to the MAC's pinctrl-0 and the three reset
properties dropped from the PHY node. Then the port comes up whatever
the bootloader did, on both boards. Armbian carries the same change for
the NanoPi Zero2, for the same reason.

I had an R28S series of my own out before I saw yours; I am dropping it.
Happy to test this one on the hardware and send a Tested-by.

Andrey

