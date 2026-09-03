Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ED6C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SwtI08RZDEkJ98ihmiAAaqdPKBHI1mrBR8jqovEMLw=; b=ruwVPGV4XDDVVpC0QV5+FjFxpj
	diQ66nTcVGHp4LMCFkuS32FX6IIDz1hkkzgPe3wkyayV/GAS0KW4c5nMsWTY4/XbUNmKudtPduLvo
	Q+VOxv5oi9HQI2QjBk78YiTNDuhA/CMs6x80+HHbpwwnGk2Abnq+MvpF4Fjugeys01U+Y14/LEkiy
	PmACzMTK32g7h7whAXH/BCyKhJbdUMB+kGtHcSfoigyznotXe2776WnfnQV0nJCi/db4DF3FMXUdH
	TO68j7H8IFoTWY/2GovCK6OgTUbkCpgx+cHnAMfFTKDTmLguNtNUv7nH81qBNVA7AbUFnjiRxRapU
	jBNthKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26ga-0000000HJXR-49TZ;
	Thu, 03 Sep 2026 12:36:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26gX-0000000HJS7-1P4A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:36:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49b9320423cso23254325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439011; x=1789043811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SwtI08RZDEkJ98ihmiAAaqdPKBHI1mrBR8jqovEMLw=;
        b=Sco9FetYh3MVkWJsjkIwjAHLftbRq70vITc4SPEueZoDWAPJdV2GBLGPYzCxy6USIE
         kRoF/S3dWuMOcj30v1QHaqE9lY/0UcPU68EJfU5tEZg/Z2hw9YcfZvfB9BkTCIr5xKGH
         8zcp64oM4BiU2sUVGjosI3X92qOWmUQY/LjRqnywUQdsTU5LI2oCTWOTiDXRQn/RfIA8
         Ftk9+Il3gYthD2gEOzCGYSUY6Nxuz6IieH921hYBZJ7UJmPCNsB3OhhlUW5g2vfk+YIS
         QAlWzeNSxqb0wpbx0EII63HWibDKvEYmCvEpEII7N2he4Xz8g7VUxlEv0rEUQJQK2pwe
         ZNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439011; x=1789043811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SwtI08RZDEkJ98ihmiAAaqdPKBHI1mrBR8jqovEMLw=;
        b=QSa1Pe6s7vwIYIJXx+oTAyFdORmAaEUEaWhjv30K7wQk/B82x+hLlwDDq9HRt4Pysy
         YjNr6v0EcCS2b/Z//8Tq5A+RIO6O2OKNebqXxBmoY52VhXEoUObD3KOGIGyEB/Ev2Vq9
         GeMvUIS1nydMvn955kqnGy+h9UfuRCw0zYe2M3JMjxq50r5L4pN5J7gnJ5vBpm53x4LC
         TBeBp07kQN7WiuZU/oDmbDK0f/GaIW7obYvakNC9w2zHE5+c8fz2W1TRp7mzuS5p+kUZ
         y8S+XRNCl3FEM1uKViwvxxs6OhvtepnR+dNyu8qaJlANYG0GZSTjJVnceUAUAuw1hheE
         MALw==
X-Forwarded-Encrypted: i=1; AKwUvBw31KsCURfioN9kff+KYmuDAaf3vXblf+ChmPjjBRSVrT/DZ+un4fncn/EYgvnqjMWny9FsxVidI9YbI4Yo5ujv@lists.infradead.org
X-Gm-Message-State: AFuF++kXiRgCUyq8GMn1exyvn7tWvvExnF3a611/YGyJ7qPYvApTz3GK
	buzI4cHlAR69n+0xIx5zT7XgH6Wq5iYAiXGgelM9p1xfiwwtCQZiIdREyfxLUQBR2vU=
X-Gm-Gg: AYBFou15XUdq7Mv/KU06SaPRrKyQn9vx1LGquZb+/x3EVbjcaglvHSTJolhKjjaw+Y/
	jWoXA9RbajS5AwIJVjQOCOzzD4x0757DS6ce8fMw0LkjQ2Z96wr54uxCM5JwVx2VCTurZtq0Fuo
	G8BpV8qzwsB8uxSNZPR+LxMdx1vLY0bobJOH66wM7aFtBhEHD5MC59CyPuxjgROop09R0t66esH
	0O7gqv69Ulxox4qy/2jwEp7K1yTJmfLMEBihM/uHWYG45URYgmzJYbRIBb/GZfaV9b0XFtCS2WK
	chp7PYnRMJ2RsVMgXOftj5t4hRUXmNvhbBmrzeNgU6dnW1Na/LBy3aZJkhDb2e6+F2JAYDTVCrj
	kwShtiWSO75myIi4ynN7gVUnctzjgmWF+vBMj8n4eg6UjHwAr1pUceqSjbmat2iK3jVjqV8oPg9
	jrkA0r2mETEUu6uoOM76QoLx1H9SGMyF7qB5Unx20=
X-Received: by 2002:a05:600c:8b05:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49ce5817bfemr260421475e9.6.1788439010332;
        Thu, 03 Sep 2026 05:36:50 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72d2asm12828927f8f.8.2026.09.03.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:50 -0700 (PDT)
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
Subject: [PATCH net v5 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Thu,  3 Sep 2026 12:36:44 +0000
Message-ID: <20260903123644.23800-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903123644.23800-1-f@lex.la>
References: <20260903123644.23800-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_053653_399949_857DDD81 
X-CRM114-Status: GOOD (  19.81  )
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

Leave 2.5 Gbps out of both bitmaps, and the xGMII modes that
mtk_mac_enable_tx_lpi() already refuses. MAC_MCR folds SPEED_2500 onto
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

v5: comments cut to one line (Maxime Chevallier); no code change.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 18 +++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 +++-
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..fd7a49ae88d0 100644
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
 
@@ -4907,8 +4907,8 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.type = PHYLINK_NETDEV;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
-	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
-		MAC_2500FD;
+	/* LPI above 1 Gbps is not supported */
+	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
 	mac->phylink_config.lpi_timer_default = 1000;
 
 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
@@ -4966,6 +4966,18 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  mac->phylink_config.supported_interfaces);
 
+	/* LPI wake-up timing is only verified on MTK_GMAC_EEE SoCs */
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_GMAC_EEE)) {
+		phy_interface_copy(mac->phylink_config.lpi_interfaces,
+				   mac->phylink_config.supported_interfaces);
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


