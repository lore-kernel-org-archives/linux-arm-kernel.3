Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AB1C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1pxA+bc+vNKzjIaRT1KaTq/RuyMnrlK34dQ5cfd5BU=; b=EyZfMrQhkz5S8FlBPVOXTgyyeD
	4uffFqJCopdknH1oI3l2boQl0dnDHQ4X89H2+jWKl7EYgy9EjLNnV97dWBRnTlvxLhk89yDea4Z7K
	Qhl/2pfnQDYmr2XTOAq1T1L7vbKZ6R5eVNhqVeiFr1i+eQdZO/V6HMIsCaMNempYjK5rvEzkCtF0r
	9zJHDqIVEi8G83Ug22iAtjqXDRRPiWpDGVJC9dxvBlidF9WZkY+ggS7HwXQopOkujuFmFgEkFEEvU
	BgZ/9qTcgpqdVkfJq4CjJOoLhJDw+opZCB1UPIng6uZh41DNX5EBUIXGSfhci3aeMEfPc9F2guhH/
	utcXEwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzmz-00000008BpR-0uO5;
	Mon, 05 May 2025 17:39:37 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzb4-000000088vA-1wKY;
	Mon, 05 May 2025 17:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746466024; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fmdldmq8dsLmVPIYQxY161qfznq7mmrK8ujgoFnjIkPzEUJPSVMYY8y5ut+Yq4vXdqkP7SKZwhP5Wzyxjbfh23I44QYTp86SllgnvqLBSe8GpGFEIykN0WimXb520kO/YGOZ3b+ekHfa4G2XZ6i9Zyqt9/BSN7dbMWLD/wrZW/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746466024; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j1pxA+bc+vNKzjIaRT1KaTq/RuyMnrlK34dQ5cfd5BU=; 
	b=H/LgMSug9gBuSTlAAoH89EXEnXLoIAxQxgP849j+D/LKlY5Q9uHQD6StWX71fuu7j6GqLOaXDO+Jdb7zwLk80/AES7sltnb449RnuCwoPZxPzoZT3MWTb1fewhU88Ft4YcCPajAFM4AIohIiFq6Yr53LcvQIFu3tZoN7/PAtPtU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746466024;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=j1pxA+bc+vNKzjIaRT1KaTq/RuyMnrlK34dQ5cfd5BU=;
	b=OUrrSne5KQrgU8ndZn2XgYB7UVCtE6WukeUoqU9i2h8TpUfJ/GRmK3mGzruZLOa0
	jHVIZbquQBl2aWBB3hos/Jc7xVACAr5a/VaHz9O1rjwyVtjoKU7AGUXj7gpnksa99cV
	KN1nwhKSyjBK54FljqgddZXFRsw1fQcTs6BKIx90=
Received: by mx.zohomail.com with SMTPS id 1746466022200140.16841011130168;
	Mon, 5 May 2025 10:27:02 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 05 May 2025 19:26:37 +0200
Subject: [PATCH v2 2/5] phy: rockchip: usbdp: move orientation handling
 further down
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-rk3576-sige5-usb-v2-2-d5ba4305f3be@collabora.com>
References: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
In-Reply-To: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_102718_563388_24C83C0F 
X-CRM114-Status: GOOD (  12.81  )
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

The orientation handling code isn't referenced until very far down the
driver code.

Move it down some ways so it can later reference other driver functions
without needing forward declarations.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 100 +++++++++++++++---------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c066cc0a7b4f10fc3cd8779323c369360893520d..fff54900feea601c8fe6bf4c7123dfebc5661a15 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -651,56 +651,6 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 	udphy->mode = UDPHY_MODE_DP_USB;
 }
 
-static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
-				 enum typec_orientation orien)
-{
-	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
-
-	mutex_lock(&udphy->mutex);
-
-	if (orien == TYPEC_ORIENTATION_NONE) {
-		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
-		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
-		/* unattached */
-		rk_udphy_usb_bvalid_enable(udphy, false);
-		goto unlock_ret;
-	}
-
-	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
-	rk_udphy_set_typec_default_mapping(udphy);
-	rk_udphy_usb_bvalid_enable(udphy, true);
-
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
-	return 0;
-}
-
-static void rk_udphy_orien_switch_unregister(void *data)
-{
-	struct rk_udphy *udphy = data;
-
-	typec_switch_unregister(udphy->sw);
-}
-
-static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
-{
-	struct typec_switch_desc sw_desc = { };
-
-	sw_desc.drvdata = udphy;
-	sw_desc.fwnode = dev_fwnode(udphy->dev);
-	sw_desc.set = rk_udphy_orien_sw_set;
-
-	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
-	if (IS_ERR(udphy->sw)) {
-		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
-			PTR_ERR(udphy->sw));
-		return PTR_ERR(udphy->sw);
-	}
-
-	return devm_add_action_or_reset(udphy->dev,
-					rk_udphy_orien_switch_unregister, udphy);
-}
-
 static int rk_udphy_refclk_set(struct rk_udphy *udphy)
 {
 	unsigned long rate;
@@ -1451,6 +1401,56 @@ static struct phy *rk_udphy_phy_xlate(struct device *dev, const struct of_phandl
 	return ERR_PTR(-EINVAL);
 }
 
+static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
+				 enum typec_orientation orien)
+{
+	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+
+	mutex_lock(&udphy->mutex);
+
+	if (orien == TYPEC_ORIENTATION_NONE) {
+		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
+		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
+		/* unattached */
+		rk_udphy_usb_bvalid_enable(udphy, false);
+		goto unlock_ret;
+	}
+
+	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
+	rk_udphy_set_typec_default_mapping(udphy);
+	rk_udphy_usb_bvalid_enable(udphy, true);
+
+unlock_ret:
+	mutex_unlock(&udphy->mutex);
+	return 0;
+}
+
+static void rk_udphy_orien_switch_unregister(void *data)
+{
+	struct rk_udphy *udphy = data;
+
+	typec_switch_unregister(udphy->sw);
+}
+
+static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
+{
+	struct typec_switch_desc sw_desc = { };
+
+	sw_desc.drvdata = udphy;
+	sw_desc.fwnode = dev_fwnode(udphy->dev);
+	sw_desc.set = rk_udphy_orien_sw_set;
+
+	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
+	if (IS_ERR(udphy->sw)) {
+		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
+			PTR_ERR(udphy->sw));
+		return PTR_ERR(udphy->sw);
+	}
+
+	return devm_add_action_or_reset(udphy->dev,
+					rk_udphy_orien_switch_unregister, udphy);
+}
+
 static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;

-- 
2.49.0


