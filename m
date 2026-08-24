Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB122C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 02:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eff4/RO9BXDKGgT0WoHgozDOguCB0zRc8wyBEOOYuWg=; b=On4XtYzeYA02OCF3VkKlKtd3vf
	nzW53K6UdotS/psmnqVNFS+pKtvvTYZD6dlLwhfMP4ccR1MD5k4kS0x9KDrzwnNwc6GY0DzalL169
	YiEMpG88yLQtOFmkZu4KA03Ar8pR9VRSZvm5dHwEqCrTg0kpQUSB/H/Gwwelta6LApBwznrQ37rcx
	MFLUBSSDMuWvOZ2xQvjHRnZJ48JUuf4Y8PXD9+/0T/94B1ogKlqlbCyuDjIi8F+Rb7/8aZZ9p02R7
	+oqCf9Q6T11ieKY/JujirAJ3gtTQb28AvHzmgb/E6e4tRaUpTQuxQvonk08XrjXA5nIOvv+kCkhd2
	g+ruVbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKd1-0000000FoZK-2IV7;
	Mon, 24 Aug 2026 02:41:39 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKcs-0000000FoT1-3UAa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 02:41:32 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso7597783a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 19:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787539289; x=1788144089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eff4/RO9BXDKGgT0WoHgozDOguCB0zRc8wyBEOOYuWg=;
        b=bNH8TfTAhFRbJ+ROqBq7P4w1BLtlmG7JI5v0xfp4Qrs6GFGpLoc+TVMCStiZjD2wpq
         C9BdLe17RcGzPnQINf41fSJPkEYRjT3pGXXmAO/nVtO1djgzUqKVFw1mswYdsTkk35jp
         pOCXLxOVly9knXehbVGPQoSaclkfKXcDG060wSaS7nXMg8KwKmZdS4Zquxxebuo5Dixt
         0kmNckkaxKMv7/II3ngnxUj5yWp5F78Lxe12bv2XUGIwrmsxUmwa+FuCAM7kk3CmBneB
         QNtssEwapBr3icNfdrsD6O18vUcC+QJK/G38yXURjbE39rTFrpQoo6Y7KKMNyv+y+mv5
         nixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787539289; x=1788144089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eff4/RO9BXDKGgT0WoHgozDOguCB0zRc8wyBEOOYuWg=;
        b=fHMpTjnEJ6JZD2EFrB/ITCZ9WwKa0B/5fYtpkaELB5YU0wVuwc80o2Yp+44RXVLc+v
         w1C+2Eij363YkqNnhrE5ntP0qUhbfAxFL5Lgl03H2HxmAp52DFaP1Rf5gTBrCuEVApLP
         BSbnuLIjcQ+m/cupRdD5awtNDW7QJcGAH+GiN1pp22QMU3Gx/4NLAdwdV4JKGlAdhwaw
         3mmxir7vDmAocwpq1kiPS7YkG/49380Hm2HI4VqJiLQWGcNcIBI0k50r+E2PumlxYydd
         P/yn+6s5f9/OJMzE/5bAvXdgOgeX80CHP9x7vxytvVqd+q0jcb0VIonPax5VSg1k3LtN
         hJww==
X-Forwarded-Encrypted: i=1; AHgh+RqGB/Fx+Fa/pIygEYPpT+ZV6Krpinycfi+XcVib8M/2ANJvfC+WM28JhzWClFf8laVnS9ULZyPxMYcGGkfjsocU@lists.infradead.org
X-Gm-Message-State: AFuF++lsN9XHkAa9M/diMaXhiGUVcjBNhWHI5CEJ0sMuaCkc9kSIWp1I
	pRrBpC6Z9I6sOhOs3Wj8rNcdcCUNnZEeRgvZsIw7/f/h7PIbDy63itP1YSgnV1DO36A=
X-Gm-Gg: AR+sD122H5htDeb04J2C3AUCggswH073AfaUdb3ReByMiB2Ar+DEy6NG2JxRSYQSOkg
	J388Air2fpoLwHO9RqiNRsROlu6yw6TzgxWm1qFrX/LiP/AugW8FCXf6mYy2KLbWenEwZw1KBAD
	IdnlYZ3CDDwekpNlu0N/CsZ1u5/XnYclXNwVc/RPtZM2bVYA3BfovdRX38PX8Sp3BqdDxZ5mp1W
	bSFnMqwMlH4rtxgOFn/26Un70MnmfZstCJ+406/8tvI8ZcWMK53WC3E79pAF0KxBe6uDWpi83c0
	/2/7ArCQ2rVGakBlVR1ITWBXkAPNS8LdL5iKhBbCvXrxm3ApkKsUN/43GuR4UOwmpCZrMq8dmz5
	6948FjkAr6brE1V/G336QiB8oOY3n+N7rlJSY2IXzgIRjWwAJp+ycXHxoWQVKgHxvVExansdpNO
	Lox8HhNtEzxsEjtHr2EI2ifiq71Rpgxf4VdpM7qsO+ddZRoOK5cl1CYyP3
X-Received: by 2002:a17:906:fd83:b0:c12:5a0e:3e0 with SMTP id a640c23a62f3a-c246a651b90mr2593036066b.19.1787539288568;
        Sun, 23 Aug 2026 19:41:28 -0700 (PDT)
Received: from ownbook ([195.181.160.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249686e37bsm949008466b.55.2026.08.23.19.41.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 19:41:28 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v2 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Mon, 24 Aug 2026 05:41:17 +0300
Message-ID: <20260824024117.46154-3-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824024117.46154-1-f@lex.la>
References: <20260824024117.46154-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_194131_137725_F516F4CD 
X-CRM114-Status: GOOD (  23.08  )
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

mtk_add_mac() fills in lpi_capabilities and lpi_timer_default but
never lpi_interfaces, so phylink treats every MAC that uses
mtk_phylink_ops as not supporting EEE: ethtool reports "Not
supported" and phy_disable_eee() keeps userspace locked out. MT7628
is unaffected, as rt5350_phylink_ops has no tx_lpi methods.

Copy the supported interfaces into lpi_interfaces once the SoC
specific fixups have finished changing them, and leave 2.5 Gbps out
for now: drop 2500BASE-X from the copy and MAC_2500FD from
lpi_capabilities. MAC_MCR folds SPEED_2500 onto MAC_MCR_SPEED_1000, so
MAC_MCR_EEE1G is what would govern LPI on such a link, and it is
unvalidated rather than unsupported: MediaTek's SDK driver sets the
EEE force bits for 100 Mbps and 1 Gbps link speed only, EEE signalling
on 2500BASE-X is outside 802.3, and the 1 us unit of the wakeup timers
is undocumented with the port clock at 2.5 times the rate. Narrowing
lpi_capabilities alone would not do it, since it gates on the media
speed a rate matching PHY reports rather than on the speed the MAC
runs at. Drop the xGMII modes too, which mtk_mac_enable_tx_lpi()
refuses outright and which on netsys v3 include the mode of MT7988's
built-in 2.5G PHY.

LPI stays off until userspace enables it. The EEE advertisement of a
PHY that advertises it out of reset does come back, since phylink
stops force-clearing it.

Fixes: 952d7325362f ("net: ethernet: mediatek: add EEE support")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

On leaving 2.5 Gbps out: the absence of 2.5 Gbps EEE force bits in
MAC_MCR is not the argument, since the same reasoning applied to the
speed field would say the MAC cannot do 2.5 Gbps at all - 2500BASE-X
here is 1000BASE-X at 2.5 times the clock, and the MAC does not know
the difference. MAC_2500FD was deliberate in the original EEE
submission [1], which set MAC_MCR_EEE1G for SPEED_2500 and SPEED_1000
alike. The masks say nobody has validated it, not that the hardware
refuses.

On the netsys v3 switch MAC the xGMII filter empties lpi_interfaces
outright, as PHY_INTERFACE_MODE_INTERNAL is the only interface it
supports. It is a fixed link port with no PHY, so phylink had no EEE to
manage there before this patch either.

Pre-existing, made live by this patch and not addressed here:
mtk_mac_enable_tx_lpi() programs MT7531's reset wakeup times (17 for
1 Gbps, 36 for 100 Mbps) whenever it runs, as its own comment says, so
they now apply to every SoC driven by mtk_phylink_ops once a user
enables EEE on an eligible interface. Those values do not appear to
have been confirmed for MT7981, MT7986 or MT7988.

[1] https://lore.kernel.org/all/20250210125246.1950142-1-dqfext@gmail.com/
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..37a831f73da6 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4828,7 +4828,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	phy_interface_t phy_mode;
 	struct phylink *phylink;
 	struct mtk_mac *mac;
-	int id, err;
+	int id, err, i;
 	int txqs = 1;
 	u32 val;
 
@@ -4907,8 +4907,11 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.type = PHYLINK_NETDEV;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
-	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
-		MAC_2500FD;
+	/* MAC_MCR folds SPEED_2500 onto MAC_MCR_SPEED_1000, so LPI above
+	 * 1 Gbps would be governed by MAC_MCR_EEE1G and is unvalidated
+	 * rather than unsupported.
+	 */
+	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
 	mac->phylink_config.lpi_timer_default = 1000;
 
 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
@@ -4966,6 +4969,19 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  mac->phylink_config.supported_interfaces);
 
+	phy_interface_copy(mac->phylink_config.lpi_interfaces,
+			   mac->phylink_config.supported_interfaces);
+
+	/* The MAC side of 2500BASE-X is never below 2.5 Gbps, not even when
+	 * a rate matching PHY drops the media to 1 Gbps, and
+	 * mtk_mac_enable_tx_lpi() refuses the xGMII modes outright.
+	 */
+	__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+		    mac->phylink_config.lpi_interfaces);
+	for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++)
+		if (mtk_interface_mode_is_xgmii(eth, i))
+			__clear_bit(i, mac->phylink_config.lpi_interfaces);
+
 	phylink = phylink_create(&mac->phylink_config,
 				 of_fwnode_handle(mac->of_node),
 				 phy_mode, mac_ops);
-- 
2.55.0


