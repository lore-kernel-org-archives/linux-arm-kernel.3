Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88780CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCkNZjlpL9iQI0iTMwF0ACn6X86SzcrWkFRS8szsJ0c=; b=uWP+akYFC8KPZ0taI8VeZRf8Kw
	rw5fz/u/pfQT6/TW6++vArdfm/hq5L9y1orozaonvrtRezNKAtgvfduXrD69HZl4HapTcyv/7I+Zq
	kcvG4cISfkKI/0YXDXvaHoMClEUEB0bG+pV1SIlBwqDx+P75FsXf0bvgJjVH05PCtM7u91lWSI/yb
	KSVi11SdWg82FnJj9hzNSowlFMhWknmZtLtom5icvzIU5y4bYpgjAj8rU60LTxEX/vgCcGhurweNV
	YGFyCTUHJWqOGWh7DnUaQaVDxtQbmHxOD7RYAgMPtjQb+TEzAiLplBwETN9c2S1gz1XMHi4LE6ZcO
	x4i1F4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umife-00000000xHf-0etC;
	Fri, 15 Aug 2025 00:51:50 +0000
Received: from mail.adomerle.pw ([185.125.100.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhiv-00000000oRB-31Jt;
	Thu, 14 Aug 2025 23:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1755215449; bh=LCkNZjlpL9iQI0iTMwF0ACn
	6X86SzcrWkFRS8szsJ0c=; b=nqH63Q/Su04hnBrnLTMiVzH8SVAUrvqLiZAsDhJx42AzcAOpHd
	ibNmMkpmt6qSxw+8Wdwi+K4PM3hN2/0y/xve+n/d21XgDXUnJB500dDqOZEBVkWS39oubtr9gvS
	ZsG3X7S2mrbLN9Ubi8THJE24eXIJgoy5+4TwM4ZWF7nFttlr+fal97X6ebne5f2dIvsGMaYE0Fc
	tJO3sZfBdZ4gduRoqN0qN2hyE2O9WNQ7gv1EsrerlTPOhB1J64HQCJdlw/AkbTWlc65HM7TTxXv
	Q9+Rj+gfCGVhNQk0a+hEXeFlSnh8xnPnE6M9lbnbE1CLrnKRucCT3CZrWdQZ+Lo2m9A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1755215449; bh=LCkNZjlpL9iQI0iTMwF0ACn
	6X86SzcrWkFRS8szsJ0c=; b=vnhsBWzeX8Y51MSoVXgusOp2e2+f4g7uTMiKazSjqIBjUGua3B
	CRfuCfogbARyjOoCll0PDe97BhPYzXuFLxCQ==;
From: Arseniy Velikanov <me@adomerle.pw>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: [PATCH v1 2/2] phy: mediatek: tphy: Add software role switching
Date: Fri, 15 Aug 2025 03:48:25 +0400
Message-ID: <20250814234825.810-2-me@adomerle.pw>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814234825.810-1-me@adomerle.pw>
References: <20250814234825.810-1-me@adomerle.pw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_165109_913449_1A1E2AD3 
X-CRM114-Status: GOOD (  17.94  )
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

MediaTek USB T-PHY has broken role switching on (likely) all mobile SoCs.
Known affected socs are: MT6735, MT6757, MT6761, MT6765, MT6768, MT6771,
MT6785, MT6789.

The downstream kernel manually controls the PHY mode by writing
"test mode" FORCE regs. Setting all these regs fixes device/host modes, but
breaks dual-role functionality. As a workaround we use workqueue that
periodically checks the USB role and changes the PHY mode accordingly.

To address this issue only on affected SoCs, we introduce a new
device-tree property `mediatek,software-role-switch`. This ensures
the workaround is applied only to broken hardware while leaving unaffected
devices (like Chromebooks) untouched.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 148 ++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index f6504e0ecd1a..472859ec929c 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -18,6 +18,9 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/usb/role.h>
+#include <linux/usb/otg.h>
+#include <linux/workqueue.h>
 
 #include "phy-mtk-io.h"
 
@@ -111,11 +114,18 @@
 
 #define U3P_U2PHYDTM1		0x06C
 #define P2C_RG_UART_EN			BIT(16)
+#define P2C_FORCE_IDPULLUP	BIT(8)
 #define P2C_FORCE_IDDIG		BIT(9)
+#define P2C_FORCE_AVALID	BIT(10)
+#define P2C_FORCE_SESSEND	BIT(12)
+#define P2C_FORCE_VBUSVALID	BIT(13)
+
 #define P2C_RG_VBUSVALID		BIT(5)
 #define P2C_RG_SESSEND			BIT(4)
+#define P2C_RG_BVALID			BIT(3)
 #define P2C_RG_AVALID			BIT(2)
 #define P2C_RG_IDDIG			BIT(1)
+#define P2C_RG_IDPULLUP			BIT(0)
 
 #define U3P_U2PHYBC12C		0x080
 #define P2C_RG_CHGDT_EN		BIT(0)
@@ -317,6 +327,8 @@ struct mtk_phy_instance {
 		struct u3phy_banks u3_banks;
 	};
 	struct clk_bulk_data clks[TPHY_CLKS_CNT];
+	struct delayed_work dr_work;
+	struct usb_role_switch *role_switch;
 	u32 index;
 	u32 type;
 	struct regmap *type_sw;
@@ -326,14 +338,17 @@ struct mtk_phy_instance {
 	u32 efuse_intr;
 	u32 efuse_tx_imp;
 	u32 efuse_rx_imp;
+	int current_role;
 	int eye_src;
 	int eye_vrt;
 	int eye_term;
 	int intr;
 	int discth;
 	int pre_emphasis;
+	int sw_get_retries;
 	bool bc12_en;
 	bool type_force_mode;
+	bool software_role_switch;
 };
 
 struct mtk_tphy {
@@ -818,12 +833,118 @@ static void u2_phy_pll_26m_set(struct mtk_tphy *tphy,
 			 P2R_RG_U2PLL_FRA_EN | P2R_RG_U2PLL_REFCLK_SEL);
 }
 
+static void u2_phy_instance_role_set(struct mtk_phy_instance *instance,
+				     int role)
+{
+	struct u2phy_banks *u2_banks = &instance->u2_banks;
+	void __iomem *com = u2_banks->com;
+
+	instance->current_role = role;
+
+	/* end session before role switch */
+	mtk_phy_set_bits(com + U3P_U2PHYDTM1, P2C_RG_SESSEND);
+	mdelay(5);
+	mtk_phy_clear_bits(com + U3P_U2PHYDTM1, P2C_RG_SESSEND);
+
+	switch (role) {
+	case USB_ROLE_DEVICE:
+		dev_dbg(&instance->phy->dev, "set device role\n");
+		mtk_phy_set_bits(com + U3P_U2PHYDTM1, P2C_RG_IDDIG);
+		break;
+	case USB_ROLE_HOST:
+		dev_dbg(&instance->phy->dev, "set host role\n");
+		mtk_phy_clear_bits(com + U3P_U2PHYDTM1, P2C_RG_IDDIG);
+		break;
+	default:
+		break;
+	}
+}
+
+static void u2_phy_role_switch_work(struct work_struct *work)
+{
+	struct mtk_phy_instance *instance =
+		container_of(work, struct mtk_phy_instance, dr_work.work);
+	int role;
+
+	if (IS_ERR_OR_NULL(instance->role_switch))
+		instance->role_switch = usb_role_switch_get(&instance->phy->dev);
+
+	if (IS_ERR_OR_NULL(instance->role_switch)) {
+		if (instance->sw_get_retries >= 10) {
+			dev_warn(&instance->phy->dev, "failed to get role switch\n");
+			return;
+		}
+
+		instance->sw_get_retries += 1;
+		schedule_delayed_work(&instance->dr_work, msecs_to_jiffies(500));
+	}
+
+	role = usb_role_switch_get_role(instance->role_switch);
+
+	if (instance->current_role == role)
+		goto reschedule_work;
+
+	u2_phy_instance_role_set(instance, role);
+
+reschedule_work:
+	schedule_delayed_work(&instance->dr_work, msecs_to_jiffies(100));
+}
+
+static int u2_phy_software_role_switch_init(struct mtk_phy_instance *instance)
+{
+	struct fwnode_handle *ep, *remote_ep, *usb_fwnode;
+	struct device *usb_dev;
+	int mode;
+
+	instance->sw_get_retries = 0;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(&instance->phy->dev),
+					     0,
+					     0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENODEV;
+
+	remote_ep = fwnode_graph_get_remote_endpoint(ep);
+	fwnode_handle_put(ep);
+	if (!remote_ep)
+		return -ENODEV;
+
+	usb_fwnode = fwnode_graph_get_port_parent(remote_ep);
+	fwnode_handle_put(remote_ep);
+
+	if (!usb_fwnode)
+		return -ENODEV;
+
+	usb_dev = bus_find_device_by_fwnode(&platform_bus_type, usb_fwnode);
+	fwnode_handle_put(usb_fwnode);
+	if (!usb_dev)
+		return -ENODEV;
+
+	mode = usb_get_role_switch_default_mode(usb_dev);
+	if (mode == USB_DR_MODE_HOST)
+		u2_phy_instance_role_set(instance, USB_ROLE_HOST);
+	else
+		u2_phy_instance_role_set(instance, USB_ROLE_DEVICE);
+
+	INIT_DELAYED_WORK(&instance->dr_work, u2_phy_role_switch_work);
+
+	return 0;
+}
+
 static void u2_phy_instance_init(struct mtk_tphy *tphy,
 	struct mtk_phy_instance *instance)
 {
 	struct u2phy_banks *u2_banks = &instance->u2_banks;
 	void __iomem *com = u2_banks->com;
 	u32 index = instance->index;
+	int ret;
+
+	if (instance->software_role_switch) {
+		ret = u2_phy_software_role_switch_init(instance);
+		if (ret)
+			dev_warn(&instance->phy->dev, "failed to initialize role switching\n");
+	}
 
 	/* switch to USB function, and enable usb pll */
 	mtk_phy_clear_bits(com + U3P_U2PHYDTM0, P2C_FORCE_UART_EN | P2C_FORCE_SUSPENDM);
@@ -883,6 +1004,18 @@ static void u2_phy_instance_power_on(struct mtk_tphy *tphy,
 
 		mtk_phy_set_bits(com + U3P_U2PHYDTM0, P2C_RG_SUSPENDM | P2C_FORCE_SUSPENDM);
 	}
+
+	if (instance->software_role_switch) {
+		/* Set FORCE modes for manual role switching */
+		mtk_phy_set_bits(com + U3P_U2PHYDTM1, P2C_FORCE_IDPULLUP
+			| P2C_FORCE_IDDIG | P2C_FORCE_AVALID | P2C_FORCE_VBUSVALID
+			| P2C_FORCE_SESSEND);
+		mtk_phy_set_bits(com + U3P_U2PHYDTM1, P2C_RG_IDPULLUP | P2C_RG_BVALID);
+
+		if (!instance->role_switch)
+			schedule_delayed_work(&instance->dr_work, msecs_to_jiffies(100));
+	}
+
 	dev_dbg(tphy->dev, "%s(%d)\n", __func__, index);
 }
 
@@ -906,6 +1039,9 @@ static void u2_phy_instance_power_off(struct mtk_tphy *tphy,
 		mtk_phy_clear_bits(com + U3D_U2PHYDCR0, P2C_RG_SIF_U2PLL_FORCE_ON);
 	}
 
+	if (instance->role_switch)
+		cancel_delayed_work_sync(&instance->dr_work);
+
 	dev_dbg(tphy->dev, "%s(%d)\n", __func__, index);
 }
 
@@ -940,6 +1076,9 @@ static void u2_phy_instance_set_mode(struct mtk_tphy *tphy,
 		tmp &= ~P2C_RG_IDDIG;
 		break;
 	case PHY_MODE_USB_OTG:
+		/* We are managing role in workqueue */
+		if (instance->software_role_switch)
+			return;
 		tmp &= ~(P2C_FORCE_IDDIG | P2C_RG_IDDIG);
 		break;
 	default:
@@ -1129,6 +1268,11 @@ static void phy_parse_property(struct mtk_tphy *tphy,
 	if (instance->type == PHY_TYPE_USB3)
 		instance->type_force_mode = device_property_read_bool(dev, "mediatek,force-mode");
 
+	instance->software_role_switch =
+		device_property_read_bool(dev, "mediatek,software-role-switch");
+	if (instance->software_role_switch)
+		dev_info(dev, "software role switch enabled\n");
+
 	if (instance->type != PHY_TYPE_USB2)
 		return;
 
@@ -1618,6 +1762,10 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		struct phy *phy;
 		int retval;
 
+		/* filter non-phy nodes (e.g. graphs) */
+		if (!of_find_property(child_np, "reg", NULL))
+			continue;
+
 		instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
 		if (!instance)
 			return -ENOMEM;
-- 
2.50.1

