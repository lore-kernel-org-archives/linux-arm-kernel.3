Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEC1D59F6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BXmxpEyCcs6z9YayTvJGeiucLyerVWK16c7+Y9tR1w=; b=vwUG71IC8zxx3vinKvqnOU5Gwk
	NlgYRh93UJDSxoqU7swXN1+QJLn1Fq1w6lXDvQ6Nhxd/tQNJpx6JyTfyX4k1ghlR+2/HJK1QtNLhu
	g0HbLUD86eR3JsPW520c3cScbT9FBWJ3zB/635DPLcCWhgh29/f1MIYh/SgVZ+e7mRC9rzwxRUXYt
	M3wxhZPxRuIVE/FqusjvLz++Kn1OBOA2cTiqvPhXxjwHc/AcyCFgzvf78j5Or4zVe6f4gNLbL78bu
	3r6Yku3+YE91rgmojwtjuXuGx5tH+9IjHmrtkBEM+TUtSsPBNz07CfwPOL5r0wUKMrkmRahzp34DV
	34kulOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lhC-00000004VfX-13Xz;
	Wed, 06 Nov 2024 19:28:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lXK-00000004TID-33iL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730920670; x=1762456670;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=b45vVtSN0yrCRwGiJJiPW1/u7sRXUetE4/jESrNuotk=;
  b=yuOwfBA14JXncgS++Bqf2kfPJgkuo7lHNp3SS81QjOzdXh5lc6hZF+8y
   oHKztBzAyAK4DkA1RubY2M8mKdoZ+lwqL5J9rWiJtImMjnFmTPtKG1viv
   aqwShzhpPMDYGuiIn1AXydji9TqeK54uExbIMYs4Wztu5xmjcA3/vmPY2
   aJObfUx2YbTn61fIRLWgwjlBKbkRgYjCMUPG8jkuaFu7ur5YvQjy6zHxP
   OQ4pBs7loCMUezyO2lAlP1WfOIj6wgvEEIdrYb/mcYOkaemFgbD3muc06
   LxzSi5h0x9+dwYGP/uWgnOI50JTuSWdkCNQNogvS1Did2Hvczu/Ckdd/w
   Q==;
X-CSE-ConnectionGUID: R5B6jnU1TTWc0t0C0FxLpw==
X-CSE-MsgGUID: /0jBs2k+TyeNd90/nzhilg==
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="37447986"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2024 12:17:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Nov 2024 12:17:19 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Nov 2024 12:17:16 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 6 Nov 2024 20:16:44 +0100
Subject: [PATCH net-next 6/7] net: lan969x: add RGMII registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241106-sparx5-lan969x-switch-driver-4-v1-6-f7f7316436bd@microchip.com>
References: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
In-Reply-To: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_111750_966402_5369406A 
X-CRM114-Status: GOOD (  13.26  )
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
index 8ac2652ef22c..cfd57eb42c04 100644
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


