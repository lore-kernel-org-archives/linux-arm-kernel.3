Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9958C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=534LbVPyjYMVPj0BO46vzk6oyGda1cLHKL7+ZYYErcI=; b=GTMZXWHvQzYjkusy9rrREC87bm
	FXC0i5i2W/YOqdU1vMS/AjLAuXgsYgdVLCUQY6QFpgRETDlXdl3Z21JE9rQfUhwkhwfNE+IqzJtko
	mocOAp+0JF2ri0fFpWozxqdRcq76ud6ZHrcmISjdJCHukoDmD3a0jBGICsgD9GpKEajCV3m1qqo7I
	yhJJBzpkmsksNyW3o1gcEaCRM3s56GPxB0/v9KiiK+0YwPRkwz8mvrc1u2A7mI9LoNHI0GAh6n4IO
	IWSXr4PhMzheZBqp1cCTGpWYCZyszno9n/eNgtipSU7TSKrLFzhDdTOC62YAY+ESNQGsIbDMMSN+S
	VYvGlyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8su-00000004l0a-1ffr;
	Fri, 10 Jul 2026 10:55:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8st-00000004kzM-1BEQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jul 2026 10:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=534LbVPyjYMVPj0BO46vzk6oyGda1cLHKL7+ZYYErcI=; b=DtgaJnCOlfVdLu363t7X2uuplW
	hKeulk3mo7tiBdWczDJQEoW7PKSJllHqgyBpt9+37Uy+pdTelAEggCFAtxxon3PcTAvvyF6uneLli
	CJHtmjnVTdCPRNiqenQ2zqAI+qaxxfnLe/ELyzhtdprCTXa4Wc1SyUKukPDbr4ImeDJ/xGSAVgzuU
	gfnNNqIWPl8AyswlsBUXtiQNoLua829pSMrYot59wSg2i00lamNKjzJFJdAozg/zng+gIj5pTd4qr
	77CGBpeGHv1z437F6AGU68DWfMh0e5Am73ByBy3ccD3DGjGEdyWFuWzoV2KIgvgCNWMMFSHzbwocP
	MiaV5yRQ==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wi8sq-00000009wiq-1NZy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:55:06 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so371556a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680902; x=1784285702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=534LbVPyjYMVPj0BO46vzk6oyGda1cLHKL7+ZYYErcI=;
        b=MDup3fnAR0eNk6nnTY/DRnWE5y0DnKsATr+fGGKVc5zUNwGeJGSDby5ebCNh2RG1nd
         qGJR+tLgqEIqns0HH6dhZG6ewS7BdGNasg/3HNmCRmPokl4yBh/4/83LqNDzZn0GtpkT
         9Uxmlc0cknFrlqYXm2gVzzIpQEWgof1rKP5790cH5HatsfNL8TVX+CVehD08IJhP7QIe
         PZYHKSJyAAjKoMLvHNQTLH2jBrZQ1bZf4TQusAgkGqvGgxCH4vwRGmDCAhPHVVnTyUij
         gajsJSb7qc4jivOiSo7BNURh8HDu7s/I6QrggYDhB2GHlOyty3wCAnDjnxtrCcIa8IH0
         uQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680902; x=1784285702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=534LbVPyjYMVPj0BO46vzk6oyGda1cLHKL7+ZYYErcI=;
        b=lU6BCvhso228z5lnq5kp+cPnACtm8vMa0ex8Wg3oDUA2j3TGSpNSqhF7EaKZFPMj7D
         095qGYmcUqar/Z6dx2NEIsxBPd1Ss/g10wtKAtpwav2m/UFcuf3mvhbMh90l8HQG0apY
         mnzZbWGQLfl3J3kt1hwUeZnqkcZeL0tj6anN4OYOBHNaKghUhVRxYdR9ILqyQscx7YTN
         uazwkchudQ7/JCIpJFqe6qmAXC1oqYtke16XACe3PldmAXBvaPoc40z8rTFaK5x1/Lfh
         /n1ryJ30xgSF4NTpDD79qbFaNQjcKIchIkQ8c+F3fh9ulXdG+c4hHwvrOuLf5eE/RdIh
         5jJA==
X-Forwarded-Encrypted: i=1; AHgh+RpuEQAyAtYbF20TsqXypQn9TTsM2UhXzRIrioJ0YmW1wDhiDxeR2uWo/DgVLUGnWg75Y4s428O9ycvqQw4DMKwq@lists.infradead.org
X-Gm-Message-State: AOJu0YwPTuq21mmO2TfDSN0ophp7IvBytb+7SFmGxeS9wgPwQkFt7xGU
	jXOYlnpIw8fF7E57HuWjs9+iwGKMqLaTln3YL4/ctLl+ch4NQfUQcF2r
X-Gm-Gg: AfdE7cmvhnbR4GTDwFTb7yZhfoNWMgNN00WjhV0WKaCB+O1U/LGmZ5rTAzcYR79C4iZ
	z/VBYIHfiP+PJL7eREe6ns0HbszT8xq07WosucqLcKI4o837SAIh/JnI3L141BkDSL0M3Lj1EtS
	vJtHunOff2b8dzkSy+CJaHlUMCnaWxxDlXjUOyT/2+nz69Dt2PMS9d/go9qwTAvCPAznlriKi1W
	UA4K516d4IxYumoKZ8NOj+6zgkCCiGiJ1YYav6JVVoB8vcf/e1umSudkeD9CnsrqKeAJmCcqIlT
	eMPYpMEM74viGv5DyB+yCAchl6bDI0fIYTh6/dO00TQ41VabCTZdpMO+zpLhGiw4F5cqHH/ytB7
	xvcfBez+p7ljzWZ4h1eNVmN7c4Tw6qQZL0E7ocq9zp/pQpiUg7cR1fN1jy+WCD6lgyhqgNFECRk
	VCKntNHfTt5+YBqiz9trN77FYBzvKXLIQ=
X-Received: by 2002:a05:6a21:6b01:b0:3bf:baed:c797 with SMTP id adf61e73a8af0-3c0bd0fa3d7mr13220654637.49.1783680901822;
        Fri, 10 Jul 2026 03:55:01 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm40752937c88.9.2026.07.10.03.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:55:01 -0700 (PDT)
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
Subject: [PATCH net-next 2/2] net: dsa: mt7530: add EN7528 support
Date: Fri, 10 Jul 2026 14:54:24 +0400
Message-Id: <1865eaedef97e593ba608764c7390209cae85b30.1783680864.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1783680864.git.naseefkm@gmail.com>
References: <cover.1783680864.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_115504_724366_3CEA4B46 
X-CRM114-Status: GOOD (  25.86  )
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

The switch core, however, is an MT7530 and not an MT7531 derivative: it
has no MT7531 CFC register, and the CPU port to trap frames to is set
through the MT7530-style CPU_EN / CPU_PORT fields of the MFC register, so
add it to the MT7530 handling in mt753x_conduit_state_change(). For the
same reason the MT7530 mirror and force-mode register layouts already
apply to it as the default of the MT753X_*() macros.

The four user ports (1-4) are connected to integrated Gigabit PHYs at
MDIO addresses 9-12 of the switch internal MDIO bus. The CPU port (port
6) is connected to the SoC Ethernet MAC at a fixed 1000 Mbps full duplex
link, so the port capabilities cannot be shared with the MT7988 and
EN7581 switches, whose CPU ports run at 10 Gbps.

The LAN GPHYs advertise EEE by default, but negotiating EEE with some
link partners results in an unstable link with dropped frames. Disable
EEE advertisement on them at setup time, like mt7531_setup() does for the
MT7531 switch PHYs.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/net/dsa/mt7530-mmio.c |  1 +
 drivers/net/dsa/mt7530.c      | 56 ++++++++++++++++++++++++++++++++++-
 drivers/net/dsa/mt7530.h      |  1 +
 3 files changed, 57 insertions(+), 1 deletion(-)

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
index 3c2a3029b10c..2aecad77af9a 100644
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
@@ -3254,7 +3278,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
 	 * forwarded to the numerically smallest CPU port whose conduit
 	 * interface is up.
 	 */
-	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
+	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
+	    priv->id != ID_EN7528)
 		return;
 
 	mask = BIT(cpu_dp->index);
@@ -3319,9 +3344,17 @@ static int mt753x_setup_tc(struct dsa_switch *ds, int port,
 	}
 }
 
+/* The EN7528 LAN ports are integrated GPHYs at MDIO addresses 9..12 (switch
+ * ports 1..4) on the switch internal MDIO bus, reachable only through the PHY
+ * indirect access registers. There is no mdiodev to derive the addresses from.
+ */
+#define EN7528_GPHY_BASE		9
+#define EN7528_NUM_GPHYS		4
+
 static int mt7988_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
+	int i;
 
 	/* Reset the switch */
 	reset_control_assert(priv->rstc);
@@ -3342,6 +3375,17 @@ static int mt7988_setup(struct dsa_switch *ds)
 	/* Reset the switch PHYs */
 	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);
 
+	/* The EN7528 LAN GPHYs advertise EEE by default, but negotiating EEE
+	 * with common link partners (e.g. Realtek GbE NICs) results in an
+	 * unstable link with dropped frames. Disable EEE advertisement on
+	 * them.
+	 */
+	if (priv->id == ID_EN7528)
+		for (i = EN7528_GPHY_BASE;
+		     i < EN7528_GPHY_BASE + EN7528_NUM_GPHYS; i++)
+			mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN,
+						 MDIO_AN_EEE_ADV, 0);
+
 	return mt7531_setup_common(ds);
 }
 
@@ -3459,6 +3503,16 @@ const struct mt753x_info mt753x_table[] = {
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


