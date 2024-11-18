Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9338D49219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UR8GIjrMMnC/dhPfWscDqXyHzHAnpCapzjPhzgEVucg=; b=QXE2TeG8dYMF7teMMSLLmuFCrT
	IBEYDnXZcPw40C2R4YDCsYpX7x8+qAQvotTKc4x2+tSgUl6gHkA7b92m5GbddvTpZGBhbAqVIN9gN
	C8bVE8tej7HOte8oo4XNwF2s+gkozfHs1u2DO/nZkRcHBXb/H0pOHpARFD+YJC7rvuYvB9dVTdyZW
	GhrisJhJo85wSAbHpxMa8RGqsR1GZYtebxmcHGMqRuMHm+Lox5nIohbFDwZAY7v7P/oaZ2bgc9IyF
	XEaKzAhLJxXs1L0lA16DfaZ7ks2XvZrO/76MvCuzZWGkgq+w84rmj6RM829CeIilIeLNxK+jL81QA
	oindcg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1Uv-00000009VV4-1tvx;
	Mon, 18 Nov 2024 13:08:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1Ni-00000009TJC-3RIa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731934891; x=1763470891;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=0VdMPso6LQlp9RroMsEOZb8JIdUw8DDtqtEgS7qnY4o=;
  b=E+GFJ+rkqnqkQehaHx2IRVid0qMGy6Od+ARXYO9k346apCdsV1h0RB3t
   mZGhqq+9x3yir521MzGv+G50N4bLPX5x7rr7UdxiWSIvdgbzwin6+ugNN
   ykNIlYEhgbFeIafSAMpbsS2Uv621qHHQxqr27neUaaw+hfTypdppjZWli
   69K483ShMlyOmXLPgsf77w0R9EBhtt1c5agVmFZiQZRQEP6ClITdnjYMf
   F4Bhq6udSNiLqQf+eWmX4TsoJ70cnvjPBiaT/yqbOFaINRd032fvQBugf
   HLjO4x0Bsq3a/cBLr0i1F09QCO7s8jCbG3Q43zuHA/X7cYsYvyVV92nL6
   w==;
X-CSE-ConnectionGUID: pV1s/Z6yQPOamzioY1xjCw==
X-CSE-MsgGUID: xMDNByP1QMa67yLDMwN2Ww==
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="34953032"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2024 06:01:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Nov 2024 06:01:15 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 18 Nov 2024 06:01:12 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 18 Nov 2024 14:00:52 +0100
Subject: [PATCH net-next v3 6/8] net: lan969x: add RGMII registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sparx5-lan969x-switch-driver-4-v3-6-3cefee5e7e3a@microchip.com>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
In-Reply-To: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_050130_956141_79FE3CDF 
X-CRM114-Status: GOOD (  12.84  )
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

Configuration of RGMII is done by configuring the GPIO and clock
settings in the HSIOWRAP target, and configuring the RGMII port devices
in the DEVRGMII target. Both targets contain registers replicated for
the number of RGMII port devices, which is two.

Add said targets and register macros required to configure RGMII.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan969x/lan969x.c   |   3 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 145 +++++++++++++++++++++
 2 files changed, 148 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
index a7e41058cb7c..4dce88e23a24 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
@@ -90,9 +90,12 @@ static const struct sparx5_main_io_resource lan969x_main_iomap[] =  {
 	{ TARGET_DEV2G5 + 27,         0x30d8000, 1 }, /* 0xe30d8000 */
 	{ TARGET_DEV10G +  9,         0x30dc000, 1 }, /* 0xe30dc000 */
 	{ TARGET_PCS10G_BR +  9,      0x30e0000, 1 }, /* 0xe30e0000 */
+	{ TARGET_DEVRGMII,            0x30e4000, 1 }, /* 0xe30e4000 */
+	{ TARGET_DEVRGMII +  1,       0x30e8000, 1 }, /* 0xe30e8000 */
 	{ TARGET_DSM,                 0x30ec000, 1 }, /* 0xe30ec000 */
 	{ TARGET_PORT_CONF,           0x30f0000, 1 }, /* 0xe30f0000 */
 	{ TARGET_ASM,                 0x3200000, 1 }, /* 0xe3200000 */
+	{ TARGET_HSIO_WRAP,           0x3408000, 1 }, /* 0xe3408000 */
 };
 
 static struct sparx5_sdlb_group lan969x_sdlb_groups[LAN969X_SDLB_GRP_CNT] = {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
index 561344f19062..d9ef4ef137b8 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
@@ -37,6 +37,7 @@ enum sparx5_target {
 	TARGET_FDMA = 117,
 	TARGET_GCB = 118,
 	TARGET_HSCH = 119,
+	TARGET_HSIO_WRAP = 120,
 	TARGET_LRN = 122,
 	TARGET_PCEP = 129,
 	TARGET_PCS10G_BR = 132,
@@ -54,6 +55,7 @@ enum sparx5_target {
 	TARGET_VCAP_SUPER = 326,
 	TARGET_VOP = 327,
 	TARGET_XQS = 331,
+	TARGET_DEVRGMII = 392,
 	NUM_TARGETS = 517
 };
 
@@ -5367,6 +5369,69 @@ extern const struct sparx5_regs *regs;
 #define HSCH_TAS_STATEMACHINE_CFG_REVISIT_DLY_GET(x)\
 	FIELD_GET(HSCH_TAS_STATEMACHINE_CFG_REVISIT_DLY, x)
 
+/* LAN969X ONLY */
+/* HSIOWRAP:XMII_CFG:XMII_CFG */
+#define HSIO_WRAP_XMII_CFG(g)                                                  \
+	__REG(TARGET_HSIO_WRAP, 0, 1, 116, g, 2, 20, 0, 0, 1, 4)
+
+#define HSIO_WRAP_XMII_CFG_GPIO_XMII_CFG         GENMASK(2, 1)
+#define HSIO_WRAP_XMII_CFG_GPIO_XMII_CFG_SET(x)\
+	FIELD_PREP(HSIO_WRAP_XMII_CFG_GPIO_XMII_CFG, x)
+#define HSIO_WRAP_XMII_CFG_GPIO_XMII_CFG_GET(x)\
+	FIELD_GET(HSIO_WRAP_XMII_CFG_GPIO_XMII_CFG, x)
+
+/* LAN969X ONLY */
+/* HSIOWRAP:XMII_CFG:RGMII_CFG */
+#define HSIO_WRAP_RGMII_CFG(g)                                                 \
+	__REG(TARGET_HSIO_WRAP, 0, 1, 116, g, 2, 20, 4, 0, 1, 4)
+
+#define HSIO_WRAP_RGMII_CFG_TX_CLK_CFG           GENMASK(4, 2)
+#define HSIO_WRAP_RGMII_CFG_TX_CLK_CFG_SET(x)\
+	FIELD_PREP(HSIO_WRAP_RGMII_CFG_TX_CLK_CFG, x)
+#define HSIO_WRAP_RGMII_CFG_TX_CLK_CFG_GET(x)\
+	FIELD_GET(HSIO_WRAP_RGMII_CFG_TX_CLK_CFG, x)
+
+#define HSIO_WRAP_RGMII_CFG_RGMII_TX_RST         BIT(1)
+#define HSIO_WRAP_RGMII_CFG_RGMII_TX_RST_SET(x)\
+	FIELD_PREP(HSIO_WRAP_RGMII_CFG_RGMII_TX_RST, x)
+#define HSIO_WRAP_RGMII_CFG_RGMII_TX_RST_GET(x)\
+	FIELD_GET(HSIO_WRAP_RGMII_CFG_RGMII_TX_RST, x)
+
+#define HSIO_WRAP_RGMII_CFG_RGMII_RX_RST         BIT(0)
+#define HSIO_WRAP_RGMII_CFG_RGMII_RX_RST_SET(x)\
+	FIELD_PREP(HSIO_WRAP_RGMII_CFG_RGMII_RX_RST, x)
+#define HSIO_WRAP_RGMII_CFG_RGMII_RX_RST_GET(x)\
+	FIELD_GET(HSIO_WRAP_RGMII_CFG_RGMII_RX_RST, x)
+
+/* LAN969X ONLY */
+/* HSIOWRAP:XMII_CFG:DLL_CFG */
+#define HSIO_WRAP_DLL_CFG(g, r)                                                \
+	__REG(TARGET_HSIO_WRAP, 0, 1, 116, g, 2, 20, 12, r, 2, 4)
+
+#define HSIO_WRAP_DLL_CFG_DLL_ENA                BIT(19)
+#define HSIO_WRAP_DLL_CFG_DLL_ENA_SET(x)\
+	FIELD_PREP(HSIO_WRAP_DLL_CFG_DLL_ENA, x)
+#define HSIO_WRAP_DLL_CFG_DLL_ENA_GET(x)\
+	FIELD_GET(HSIO_WRAP_DLL_CFG_DLL_ENA, x)
+
+#define HSIO_WRAP_DLL_CFG_DLL_CLK_ENA            BIT(18)
+#define HSIO_WRAP_DLL_CFG_DLL_CLK_ENA_SET(x)\
+	FIELD_PREP(HSIO_WRAP_DLL_CFG_DLL_CLK_ENA, x)
+#define HSIO_WRAP_DLL_CFG_DLL_CLK_ENA_GET(x)\
+	FIELD_GET(HSIO_WRAP_DLL_CFG_DLL_CLK_ENA, x)
+
+#define HSIO_WRAP_DLL_CFG_DLL_CLK_SEL            GENMASK(17, 15)
+#define HSIO_WRAP_DLL_CFG_DLL_CLK_SEL_SET(x)\
+	FIELD_PREP(HSIO_WRAP_DLL_CFG_DLL_CLK_SEL, x)
+#define HSIO_WRAP_DLL_CFG_DLL_CLK_SEL_GET(x)\
+	FIELD_GET(HSIO_WRAP_DLL_CFG_DLL_CLK_SEL, x)
+
+#define HSIO_WRAP_DLL_CFG_DLL_RST                BIT(0)
+#define HSIO_WRAP_DLL_CFG_DLL_RST_SET(x)\
+	FIELD_PREP(HSIO_WRAP_DLL_CFG_DLL_RST, x)
+#define HSIO_WRAP_DLL_CFG_DLL_RST_GET(x)\
+	FIELD_GET(HSIO_WRAP_DLL_CFG_DLL_RST, x)
+
 /* LRN:COMMON:COMMON_ACCESS_CTRL */
 #define LRN_COMMON_ACCESS_CTRL                                                 \
 	__REG(TARGET_LRN, 0, 1, 0, 0, 1, 72, 0, 0, 1, 4)
@@ -8110,4 +8175,84 @@ extern const struct sparx5_regs *regs;
 #define XQS_CNT(g)                                                             \
 	__REG(TARGET_XQS, 0, 1, 0, g, 1024, 4, 0, 0, 1, 4)
 
+/* LAN969X ONLY */
+/* DEV1G:DEV_CFG_STATUS:DEV_RST_CTRL */
+#define DEVRGMII_DEV_RST_CTRL(t)                                               \
+	__REG(TARGET_DEVRGMII, t, 2, 0, 0, 1, 36, 0, 0, 1, 4)
+
+#define DEVRGMII_DEV_RST_CTRL_SPEED_SEL          GENMASK(22, 20)
+#define DEVRGMII_DEV_RST_CTRL_SPEED_SEL_SET(x)\
+	FIELD_PREP(DEVRGMII_DEV_RST_CTRL_SPEED_SEL, x)
+#define DEVRGMII_DEV_RST_CTRL_SPEED_SEL_GET(x)\
+	FIELD_GET(DEVRGMII_DEV_RST_CTRL_SPEED_SEL, x)
+
+/* LAN969X ONLY */
+/* DEV1G:MAC_CFG_STATUS:MAC_ENA_CFG */
+#define DEVRGMII_MAC_ENA_CFG(t)                                                \
+	__REG(TARGET_DEVRGMII, t, 2, 36, 0, 1, 36, 0, 0, 1, 4)
+
+#define DEVRGMII_MAC_ENA_CFG_RX_ENA              BIT(4)
+#define DEVRGMII_MAC_ENA_CFG_RX_ENA_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_ENA_CFG_RX_ENA, x)
+#define DEVRGMII_MAC_ENA_CFG_RX_ENA_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_ENA_CFG_RX_ENA, x)
+
+#define DEVRGMII_MAC_ENA_CFG_TX_ENA              BIT(0)
+#define DEVRGMII_MAC_ENA_CFG_TX_ENA_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_ENA_CFG_TX_ENA, x)
+#define DEVRGMII_MAC_ENA_CFG_TX_ENA_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_ENA_CFG_TX_ENA, x)
+
+/* LAN969X ONLY */
+/* DEV1G:MAC_CFG_STATUS:MAC_TAGS_CFG */
+#define DEVRGMII_MAC_TAGS_CFG(t)                                               \
+	__REG(TARGET_DEVRGMII, t, 2, 36, 0, 1, 36, 12, 0, 1, 4)
+
+#define DEVRGMII_MAC_TAGS_CFG_TAG_ID             GENMASK(31, 16)
+#define DEVRGMII_MAC_TAGS_CFG_TAG_ID_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_TAGS_CFG_TAG_ID, x)
+#define DEVRGMII_MAC_TAGS_CFG_TAG_ID_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_TAGS_CFG_TAG_ID, x)
+
+#define DEVRGMII_MAC_TAGS_CFG_VLAN_LEN_AWR_ENA   BIT(3)
+#define DEVRGMII_MAC_TAGS_CFG_VLAN_LEN_AWR_ENA_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_TAGS_CFG_VLAN_LEN_AWR_ENA, x)
+#define DEVRGMII_MAC_TAGS_CFG_VLAN_LEN_AWR_ENA_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_TAGS_CFG_VLAN_LEN_AWR_ENA, x)
+
+#define DEVRGMII_MAC_TAGS_CFG_PB_ENA             GENMASK(2, 1)
+#define DEVRGMII_MAC_TAGS_CFG_PB_ENA_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_TAGS_CFG_PB_ENA, x)
+#define DEVRGMII_MAC_TAGS_CFG_PB_ENA_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_TAGS_CFG_PB_ENA, x)
+
+#define DEVRGMII_MAC_TAGS_CFG_VLAN_AWR_ENA       BIT(0)
+#define DEVRGMII_MAC_TAGS_CFG_VLAN_AWR_ENA_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_TAGS_CFG_VLAN_AWR_ENA, x)
+#define DEVRGMII_MAC_TAGS_CFG_VLAN_AWR_ENA_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_TAGS_CFG_VLAN_AWR_ENA, x)
+
+/* LAN969X ONLY */
+/* DEV1G:MAC_CFG_STATUS:MAC_IFG_CFG */
+#define DEVRGMII_MAC_IFG_CFG(t)                                                \
+	__REG(TARGET_DEVRGMII, t, 2, 36, 0, 1, 36, 24, 0, 1, 4)
+
+#define DEVRGMII_MAC_IFG_CFG_TX_IFG              GENMASK(12, 8)
+#define DEVRGMII_MAC_IFG_CFG_TX_IFG_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_IFG_CFG_TX_IFG, x)
+#define DEVRGMII_MAC_IFG_CFG_TX_IFG_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_IFG_CFG_TX_IFG, x)
+
+#define DEVRGMII_MAC_IFG_CFG_RX_IFG2             GENMASK(7, 4)
+#define DEVRGMII_MAC_IFG_CFG_RX_IFG2_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_IFG_CFG_RX_IFG2, x)
+#define DEVRGMII_MAC_IFG_CFG_RX_IFG2_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_IFG_CFG_RX_IFG2, x)
+
+#define DEVRGMII_MAC_IFG_CFG_RX_IFG1             GENMASK(3, 0)
+#define DEVRGMII_MAC_IFG_CFG_RX_IFG1_SET(x)\
+	FIELD_PREP(DEVRGMII_MAC_IFG_CFG_RX_IFG1, x)
+#define DEVRGMII_MAC_IFG_CFG_RX_IFG1_GET(x)\
+	FIELD_GET(DEVRGMII_MAC_IFG_CFG_RX_IFG1, x)
+
 #endif /* _SPARX5_MAIN_REGS_H_ */

-- 
2.34.1


