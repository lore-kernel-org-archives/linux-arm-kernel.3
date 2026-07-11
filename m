Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95015C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9JdVGG2sNfYkjr/rkIYVFcSLhYtKWGKRZRHailPGqU=; b=v0nnazlSsKMYLznHboAoqvOlEQ
	SOZOvw1ozgSl+CIU8Wb2NoFix2Lwo6dlQ5Lc6Yg9083vhNsV9tP+sacs9gsBtfpO3GAzEd0ZNUTJo
	jTgaCDp5HCyfN3FxOUQUAWfEZTESz11Y6RgNKfRai6Jb61gPKtrPXzNXCVQWAo8rAdlhLRGf2uvcY
	+sDipO/h/B/W0jBlWG5uU4wZ/oiEWHNvDIc6WGWSxv2Fr3mu9bdjbS5foWzn8EngkRZiGsL2Cy435
	9vrn+zQ0CT+h7MtV51Jx8xQyIWQ24p0jkMrAPKHwD53sO1Ychoej2stQ4lEZJxgIdrjVq/qnBgQSZ
	YwqE9UBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiW5O-00000006UwZ-14p9;
	Sat, 11 Jul 2026 11:41:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiW5M-00000006Uuv-01u9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 11:41:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ceae1ed204so1493055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 04:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783770091; x=1784374891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9JdVGG2sNfYkjr/rkIYVFcSLhYtKWGKRZRHailPGqU=;
        b=tIgMefbjyCPOLIqS7Gcg0al2YVGiht/rIogDQ+vPPOGUM851po056yduA6xUqp6p6B
         nFPVcuf7+AWxRfNKnaKTro2gNNKzoU4ChHIQxkK6/YY89ydnqXB8RGevCO84N90G7nLh
         bD8GVC+4XYPqMUgKJfovllwqHvhxkp2Z/5Jo3fwVSNaDh94oS8SJQJauKR8q+QLfeIDY
         kiriAgw+26RnOGObFkNwzsNTUSj96juii8YECc3waanxA2APi3EIJHDcEgK5u0CH9tqh
         YSltMIthLqm4C8O+6sn0bunQsfYGVD5N17nhxoG9NFFrVBMx1+I1hdDwQNVJOxjH3+46
         jGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770091; x=1784374891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q9JdVGG2sNfYkjr/rkIYVFcSLhYtKWGKRZRHailPGqU=;
        b=aMfJ6jq9a4i0ToZe75x/A+HxWN8KK+RG9obkWCRToRh7PksnWk2AP5irp7g3hW8ONW
         /h9+eR240oNbuilBHOEgPCfXRp3JDyEu9HOb2dnSjNdDNizhEHwPx4BxYYo87/JSU2QM
         kKm9NF9X7aPn08i5aVepQNvkV1T3yhZ9ZxoibTUUjUPamNrQswK1OGFAEB94bkwhBjwI
         EZKdaZrbPRoSdn9crA6P/iq54YKu6vNnWR1GhydJ6i7sCb5WKdyz0t+gu+GZtHa964+t
         FPx+5HS8zLr1gsK5A/OE2OJKz+b5ZfD+S4OBgkvsGH2aMk2/3EhE/ibxrsHnexOYl305
         TrQw==
X-Forwarded-Encrypted: i=1; AHgh+RplYMFLhlaip79VV+jhvSjUtffIPbJYbWs/81zLNgP69JSLY8fYZZ4yqWjF+kXGxGQkVTKlYV/NHHOCA3xrHoHY@lists.infradead.org
X-Gm-Message-State: AOJu0YxiY2lm1hJ9Wcq971yDcjDpptHG8Turx5an36BxwqPN7ehk8qcO
	vtY9PEorpXTY4tNeRXm8WE917zP50nasTO/+n3E9nH8RqfMix8Yj7ivn
X-Gm-Gg: AfdE7cmH9AuIikC9Y90qaBtTWHcwiQpKpKsJo575i3CzMy2RoWHLggulUgv17KzGMQC
	AyYeDarXWyyq0GyPlpltgHhCCqJ/k3U6Gjj3nLVpA5reIyhVTmXeqLoMQsIXxKl69Lnh59Xe5+Q
	xWmxFiNb/IayROCiHm6ENnRR/7RIkOgdwXtCCGDpQmHXfjb051dgvl2fQizhkHdn9TkyDlTKv3F
	z57s2JBaj0jItV+/k/9zG9kEQTYZuyiyE5aQz9/XghEjFxIDDaqjq8+T7amMrrNy8JEI1Gjwh7q
	U/sUgbSWV9Vb1fN2pE4FSZn/pc1n4E6DNTbBs4OVPhFbGBilJBeIT34chUJPSusm1eoklmfeNor
	K7m0HKFzN4kCx1YlYXOX5zl+ECb1RV7ET9bMMb2aSSazxyb2zzVq7QaCk6a/X6wfecnkF8S4QC1
	H7fw7qN6MHq07we5vRqH+g
X-Received: by 2002:a17:90b:1fc8:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38dc75f4cf5mr2500551a91.15.1783770091060;
        Sat, 11 Jul 2026 04:41:31 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm32390087eec.24.2026.07.11.04.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:41:30 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next v2 2/2] net: dsa: mt7530: add EN7528 support
Date: Sat, 11 Jul 2026 15:41:01 +0400
Message-Id: <8c7dfabd860ab0a6dd771c2bac7b7599eb369a4f.1783770059.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1783770059.git.naseefkm@gmail.com>
References: <cover.1783770059.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_044132_053034_A2F34C5C 
X-CRM114-Status: GOOD (  23.57  )
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

The EcoNet EN7528 SoC integrates an MT7530 switch (the chip revision
register reads 0x7530), memory-mapped in the SoC register space and
reached through the same MMIO glue used for the built-in switches of the
MediaTek MT7988 and Airoha EN7581/AN7583 SoCs. Its reset sequence and its
PHY indirect access registers are the same as on those switches, so add
an ID_EN7528 variant bound with the "econet,en7528-switch" compatible,
reusing mt7988_setup() and the indirect PHY accessors.

The switch core, however, is an MT7530 and not an MT7531 derivative: the
CPU port to trap frames to is set through the MT7530-style CPU_EN /
CPU_PORT fields of the MFC register rather than the MT7531 CFC register,
so add it to the MT7530 handling in mt753x_conduit_state_change(). For the
same reason the MT7530 mirror and force-mode register layouts already
apply to it as the default of the MT753X_*() macros.

The four user ports (1-4) are connected to integrated Gigabit PHYs at
MDIO addresses 9-12 of the switch internal MDIO bus. The CPU port (port
6) is connected to the SoC Ethernet MAC at a fixed 1000 Mbps full duplex
link, so the port capabilities cannot be shared with the MT7988 and
EN7581 switches, whose CPU ports run at 10 Gbps.

The LAN GPHYs advertise EEE by default, but negotiating EEE with some
link partners results in an unstable link with dropped frames. Leave the
LPI capabilities empty for the EN7528 so that phylink disables EEE on
these PHYs and refuses to enable it from userspace.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/net/dsa/mt7530-mmio.c |  1 +
 drivers/net/dsa/mt7530.c      | 58 ++++++++++++++++++++++++++++++-----
 drivers/net/dsa/mt7530.h      |  1 +
 3 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
index 1dc8b93fb51a..1065671bcdd1 100644
--- a/drivers/net/dsa/mt7530-mmio.c
+++ b/drivers/net/dsa/mt7530-mmio.c
@@ -13,6 +13,7 @@
 static const struct of_device_id mt7988_of_match[] = {
 	{ .compatible = "airoha,an7583-switch", .data = &mt753x_table[ID_AN7583], },
 	{ .compatible = "airoha,en7581-switch", .data = &mt753x_table[ID_EN7581], },
+	{ .compatible = "econet,en7528-switch", .data = &mt753x_table[ID_EN7528], },
 	{ .compatible = "mediatek,mt7988-switch", .data = &mt753x_table[ID_MT7988], },
 	{ /* sentinel */ },
 };
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3c2a3029b10c..6c8ed00ee9e7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2912,6 +2912,30 @@ static void en7581_mac_port_get_caps(struct dsa_switch *ds, int port,
 	}
 }
 
+static void en7528_mac_port_get_caps(struct dsa_switch *ds, int port,
+				     struct phylink_config *config)
+{
+	switch (port) {
+	/* Ports which are connected to switch PHYs. There is no MII pinout. */
+	case 1 ... 4:
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  config->supported_interfaces);
+
+		config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000FD;
+		break;
+
+	/* Port 6 is connected to SoC's GMAC at 1000 Mbps full duplex. There
+	 * is no MII pinout.
+	 */
+	case 6:
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  config->supported_interfaces);
+
+		config->mac_capabilities |= MAC_1000FD;
+		break;
+	}
+}
+
 static void
 mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
@@ -3101,17 +3125,24 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 				    struct phylink_config *config)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 eeecr;
 
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
-	config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
-
-	eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
-	/* tx_lpi_timer should be in microseconds. The time units for
-	 * LPI threshold are unspecified.
+	/* The EN7528 GPHYs report EEE capability, but negotiating EEE with
+	 * common link partners (e.g. Realtek GbE NICs) results in an unstable
+	 * link with dropped frames. Leave the LPI capabilities empty so that
+	 * phylink disables EEE on these PHYs and refuses to enable it from
+	 * userspace.
 	 */
-	config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
+	if (priv->id != ID_EN7528) {
+		u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
+
+		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
+		/* tx_lpi_timer should be in microseconds. The time units for
+		 * LPI threshold are unspecified.
+		 */
+		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
+	}
 
 	priv->info->mac_port_get_caps(ds, port, config);
 }
@@ -3254,7 +3285,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
 	 * forwarded to the numerically smallest CPU port whose conduit
 	 * interface is up.
 	 */
-	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
+	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
+	    priv->id != ID_EN7528)
 		return;
 
 	mask = BIT(cpu_dp->index);
@@ -3459,6 +3491,16 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c45 = mt7531_ind_c45_phy_write,
 		.mac_port_get_caps = en7581_mac_port_get_caps,
 	},
+	[ID_EN7528] = {
+		.id = ID_EN7528,
+		.pcs_ops = &mt7530_pcs_ops,
+		.sw_setup = mt7988_setup,
+		.phy_read_c22 = mt7531_ind_c22_phy_read,
+		.phy_write_c22 = mt7531_ind_c22_phy_write,
+		.phy_read_c45 = mt7531_ind_c45_phy_read,
+		.phy_write_c45 = mt7531_ind_c45_phy_write,
+		.mac_port_get_caps = en7528_mac_port_get_caps,
+	},
 };
 EXPORT_SYMBOL_GPL(mt753x_table);
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index dd33b0df3419..5f1e841f42c0 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -21,6 +21,7 @@ enum mt753x_id {
 	ID_MT7988 = 3,
 	ID_EN7581 = 4,
 	ID_AN7583 = 5,
+	ID_EN7528 = 6,
 };
 
 #define	NUM_TRGMII_CTRL			5
-- 
2.34.1


