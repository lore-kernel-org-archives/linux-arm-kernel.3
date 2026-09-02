Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30114C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWL1kkTYSShipF3wkJ7JupP0b7TLAg9zfV2HGt6qDKw=; b=er8UZgGIetKjQUDJffosgPcmYU
	KyQbA2yKSP8oYjfAjj0+YiwRYenqQd3ML7GzKYvQvUyek2enjR4Vrc76pGC8NK0u/MbbBxVZ8w4JN
	Mm95W56abNYOH/9keLUQvhbj1iYuOAqhbCVeaZv8F+oqNd/4Z+kOWy1if/NCoONzISaCwM4xRJP8C
	xdXdOfDYEdkd92jJ2JP1j6wFoqv/CKOZVo+/PWCUu6kUe4WaWZXfDUvPPZgWUb27apPIUY1SU1rsy
	PVCfeUjN47v9k9dIGCEOdj1vpXylvZmPtgGvdfvFfenTOQkAmWKo8wARLMQrd0g2r7b6yo62vaco2
	bHDH5KTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fyR-0000000E1F5-3i6Z;
	Wed, 02 Sep 2026 08:05:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fyJ-0000000E14O-2V6r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:05:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48431648f33so1436176f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 01:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336326; x=1788941126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWL1kkTYSShipF3wkJ7JupP0b7TLAg9zfV2HGt6qDKw=;
        b=iGwx7U1/mVsIallR4+6wnDAPOIIZzWppujP7WEVWIdV8Lfi+lwPWHkydBwYafwu4yc
         /LGvKmJUjSo/WiWQYjvg6/PJ2J3tXM68G1LjNxKw4oRhqkErv3PbynDLRJSCGc7a0mml
         5jp92jDz+wTXL4r9GClgb92xxXgjyLfkochAjH3eAWhlhOpGIj9uVdI78drJM65ytNlL
         MBABsEI+A4hFnZT5QgngyctX2l6bZ7Vh/0Bw0+yQ8BgUyj/n95sygOIOu7u7LILde7VS
         2KpqdRANiypcpLSZAMD2VFOYj4FDBMsFo4En/c4zf2neL4PpZftxDnAEoSVVTB6JaiRe
         BBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336326; x=1788941126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZWL1kkTYSShipF3wkJ7JupP0b7TLAg9zfV2HGt6qDKw=;
        b=cDVAsKTEC0gPotMsoym79YRyU3hu8KV/x+p3sSXe+Bu4FqbLI9GXWBc41ZcaRXAXzf
         FSaDfjg7ZdwN+9gtOGQv7G6FOl6/U/IEm0K8dlf/UzkGor/wJ0+6LcKFt6zgw6GmS9Dj
         bxWqiT78fzY9ha/jLqHD+5l4viY7Z4Tf/arTuWbFsvAbw9efRcmAcco+gpKWRX0F1VIn
         TmKUfQJuPWP2NgQroBEvIA2VshG7SYdwWRtuoD0DRG0EWUXMVd3rNTP7h0tDYx8kEDYq
         c1KgkjO3eMCUD/srv58zGjxtvpVj4/GgKKml7SJTuoxzADPROsNrBPDcztIUgT8mAiOq
         XEjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTKuZgnVCCNe19qCr/UoUYeK7tr/Srcd1H6yOWzAZg9zdvjut5MxWMOIVX3CnvOBR8DVdjKFgUL8IhjJQjjuIt@lists.infradead.org
X-Gm-Message-State: AFuF++lNhns21VHc6PrZgYLn9w1eT8z8yNKiP86pN9+0/3Cr92F6ZV7l
	93smMmfShEHsioec5ZrGQzUUkQLPoE2lXSnmAcUBPDRngcgPR1HhCbp/mfQACwFwVpA=
X-Gm-Gg: AR+sD112vRF+El9CExwuvMYR2C8gh4zUepr/bj3QT2R1l7K8XIyIzbks4dItJwVQHQZ
	3dS/X5HIE00PelFb1Br8iW1UKF06BKH45Az8E3bPqvx6puEnb0Un+F8SkJeuuUlDsZ/wi+hTfBd
	G8gtT4DPGbQDg1Z9wr+wbD3mlNwzCuVnz/oYAndkePuliHd0rCv83J4LtZInJvTZ4zzbnzBegnQ
	dGi5RlMV5UzeNrtoUf2Y/emc2BPjUjRMdn1Vw6P53MwnwY4ZMstuZj2MtSfcNvU5TRXxiJHI04b
	0DnduUjT0rY1w7NhJ7a1o8U6X+qE5o3/2bXTUR4/H6GgJna2X40xvRa0suLSG6Jj3M5YSpgnNp1
	IB6saTieIkptZoFDzkhEPxSjSNKM3zdXxelzYM96TVipprF5uYC3mdemfhkMGEVju110YGYGjZd
	3dXPOmbypLk0LnUho9OUEGqQi2M6HVgBkyiJiKQJg=
X-Received: by 2002:a05:600c:3485:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49ce7c26ecemr20592395e9.5.1788336325567;
        Wed, 02 Sep 2026 01:05:25 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce309e418sm72781715e9.13.2026.09.02.01.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:25 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v4 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Wed,  2 Sep 2026 08:05:19 +0000
Message-ID: <20260902080519.2211373-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902080519.2211373-1-f@lex.la>
References: <20260902080519.2211373-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_010527_689955_47218D83 
X-CRM114-Status: GOOD (  21.16  )
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

phylink_create() decides once and for all that a MAC supports managed
EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
lpi_interfaces. mtk_add_mac() leaves lpi_interfaces empty.

So ever since EEE support was added, ethtool has answered "Not
supported" on every MAC that uses mtk_phylink_ops, and
phy_disable_eee() has locked userspace out of turning EEE on. MT7628
is unaffected, as rt5350_phylink_ops has no tx_lpi methods.

Leave 2.5 Gbps out of both bitmaps. MAC_MCR folds SPEED_2500 onto
MAC_MCR_SPEED_1000, so MAC_MCR_EEE1G would govern LPI on such a link,
and that is unvalidated rather than known unsupported: MediaTek's SDK
driver sets the EEE force bits for 100 Mbps and 1 Gbps only, and the
unit of the wakeup timers is undocumented with the port clock at
2.5 times the rate.

mtk_mac_enable_tx_lpi() programs wake-up times taken from MT7531's
reset values, and the SoC's own field has no reset value to fall
back on. Only MT7981 has been seen to exit LPI cleanly with them, so
the LPI interfaces sit behind a new MTK_GMAC_EEE capability that only
MT7981 sets; every other SoC keeps the current behaviour until it has
been confirmed.

LPI stays off until userspace enables it, but the EEE advertisement of
a PHY that advertises it out of reset comes back, since phylink stops
force-clearing it.

Fixes: 952d7325362f ("net: ethernet: mediatek: add EEE support")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
On the netsys v3 switch MAC the xGMII filter would empty lpi_interfaces
outright, as PHY_INTERFACE_MODE_INTERNAL is the only interface it
supports. MT7988 does not carry MTK_GMAC_EEE, so this is moot for now.

mtk_mac_enable_tx_lpi() programs MT7531's reset wakeup times (17 for
1 Gbps, 36 for 100 Mbps) whenever it runs, as its own comment says. The
capability gate exists because of that: MT7981 has been measured with
them (see the cover), the other SoCs have not, so they keep EEE
unreachable from userspace as before.

v2, with the full argument for leaving 2.5 Gbps out:
https://lore.kernel.org/netdev/20260824024117.46154-3-f@lex.la/

v4: the MTK_GMAC_EEE gate (Paolo Abeni).

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 30 ++++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++-
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..09f53875d100 100644
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
@@ -4966,6 +4969,27 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  mac->phylink_config.supported_interfaces);
 
+	/* mtk_mac_enable_tx_lpi() programs wake-up times borrowed from
+	 * MT7531; only SoCs where those have been seen to exit LPI cleanly
+	 * get LPI interfaces.
+	 */
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_GMAC_EEE)) {
+		phy_interface_copy(mac->phylink_config.lpi_interfaces,
+				   mac->phylink_config.supported_interfaces);
+
+		/* The MAC side of 2500BASE-X is never below 2.5 Gbps, not
+		 * even when a rate matching PHY drops the media to 1 Gbps,
+		 * and mtk_mac_enable_tx_lpi() refuses the xGMII modes
+		 * outright.
+		 */
+		__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+			    mac->phylink_config.lpi_interfaces);
+		for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++)
+			if (mtk_interface_mode_is_xgmii(eth, i))
+				__clear_bit(i,
+					    mac->phylink_config.lpi_interfaces);
+	}
+
 	phylink = phylink_create(&mac->phylink_config,
 				 of_fwnode_handle(mac->of_node),
 				 phy_mode, mac_ops);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 0168e2fbc619..88a9b3b23bea 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -994,6 +994,7 @@ enum mkt_eth_capabilities {
 	MTK_U3_COPHY_V2_BIT,
 	MTK_SRAM_BIT,
 	MTK_36BIT_DMA_BIT,
+	MTK_GMAC_EEE_BIT,
 
 	/* MUX BITS*/
 	MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT,
@@ -1034,6 +1035,7 @@ enum mkt_eth_capabilities {
 #define MTK_U3_COPHY_V2		BIT_ULL(MTK_U3_COPHY_V2_BIT)
 #define MTK_SRAM		BIT_ULL(MTK_SRAM_BIT)
 #define MTK_36BIT_DMA	BIT_ULL(MTK_36BIT_DMA_BIT)
+#define MTK_GMAC_EEE		BIT_ULL(MTK_GMAC_EEE_BIT)
 
 #define MTK_ETH_MUX_GDM1_TO_GMAC1_ESW		\
 	BIT_ULL(MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT)
@@ -1117,7 +1119,7 @@ enum mkt_eth_capabilities {
 #define MT7981_CAPS  (MTK_GMAC1_SGMII | MTK_GMAC2_SGMII | MTK_GMAC2_GEPHY | \
 		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA | \
 		      MTK_MUX_U3_GMAC2_TO_QPHY | MTK_U3_COPHY_V2 | \
-		      MTK_RSTCTRL_PPE1 | MTK_SRAM)
+		      MTK_RSTCTRL_PPE1 | MTK_SRAM | MTK_GMAC_EEE)
 
 #define MT7986_CAPS  (MTK_GMAC1_SGMII | MTK_GMAC2_SGMII | \
 		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA | \
-- 
2.53.0


