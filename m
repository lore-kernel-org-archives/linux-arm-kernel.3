Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F58E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=naNnh988TWrcGX1uN/TQIgbtiiszj8Z/oKn/tkyG3dI=; b=ZOb3PyVo28inld8xXFk9c/NlCa
	QHiPiWOq5rUcadeTjp1YqPl4X9cbid26BUd3IoAwRVUSc70n71P9pZ2zn/Pr2UDgWBB6Sb7bB3DOF
	xQJpfOY/myPVMDeJ80+NAft0Zz8pq0RqDXJOtlP/gdQE7orw5YPobiMBCn/jHTtx0v+96BIox9ZyK
	hZheDg7FbWu8BLOafbflutu6XBgBsGG2wSIlemDfwHicq4wIEtU3PwK7Hd6KQuDdJMj0DetCSB2F6
	r8ROyQkz4Q6qZAxYuuctEKx78MZOCfZL1bSIp5lwaUbRZMt2QPUs6rAiG4P9u6kvsO0cxRaueqW5E
	yBFuSkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSfBt-00000007Tpu-1sfI;
	Tue, 31 Dec 2024 16:33:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSfAk-00000007Tgo-3CkQ;
	Tue, 31 Dec 2024 16:32:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 823A7A40A91;
	Tue, 31 Dec 2024 16:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16F8C4CED2;
	Tue, 31 Dec 2024 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735662765;
	bh=OjfLAGmHkWtgKweoyUxQQFG2s2A/m0vcSE7kkcaRedo=;
	h=From:To:Cc:Subject:Date:From;
	b=FAoc79KjudMbrLRJmA/ELEDNWqQoOumJ90lc00KwGoOhj0tV4HX+5saWXCoOLjiBf
	 ROapW+3/q1Rbj59ZbcWDx4IO1Sjg+YVcFHcOuA/t06lMnMYndlDRnuxl0LPWN74x2p
	 wRKxQ/0dEJHXu0IFYR4JeSHHBf9WMsEjM6691PMpDPKD99LCDU35Ob1QWOWpqyVlsj
	 TZ1ZNDkfMJvC3KERmj7bmY27zeNcfiwsvK852febDqH45D3DbYuk5IUQ7gXzRSxhvN
	 fU99cMGEGGFSIt1IJ/FXQpjFe6q7HD1FMCxG8s2SCk7nQSZrDpG+MJOjz/JoRoZmDE
	 Aq7OCwYUPFV+Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] phy: Use (of|device)_property_present() for non-boolean properties
Date: Tue, 31 Dec 2024 10:31:20 -0600
Message-ID: <20241231163121.241543-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_083246_926920_C3793F02 
X-CRM114-Status: GOOD (  10.76  )
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

The use of (of|device)_property_read_bool() for non-boolean properties
is deprecated in favor of (of|device)_property_present() when testing
for property presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/phy/mediatek/phy-mtk-tphy.c           | 4 ++--
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 3f7095ec5978..d36f68dd622e 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -1215,7 +1215,7 @@ static int phy_type_syscon_get(struct mtk_phy_instance *instance,
 	int ret;
 
 	/* type switch function is optional */
-	if (!of_property_read_bool(dn, "mediatek,syscon-type"))
+	if (!of_property_present(dn, "mediatek,syscon-type"))
 		return 0;
 
 	ret = of_parse_phandle_with_fixed_args(dn, "mediatek,syscon-type",
@@ -1278,7 +1278,7 @@ static int phy_efuse_get(struct mtk_tphy *tphy, struct mtk_phy_instance *instanc
 	}
 
 	/* software efuse is optional */
-	instance->efuse_sw_en = device_property_read_bool(dev, "nvmem-cells");
+	instance->efuse_sw_en = device_property_present(dev, "nvmem-cells");
 	if (!instance->efuse_sw_en)
 		return 0;
 
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 96f3d868a526..b5e6a864deeb 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -440,7 +440,7 @@ static int rockchip_usb2phy_extcon_register(struct rockchip_usb2phy *rphy)
 	struct extcon_dev *edev;
 	int ret;
 
-	if (of_property_read_bool(node, "extcon")) {
+	if (of_property_present(node, "extcon")) {
 		edev = extcon_get_edev_by_phandle(rphy->dev, 0);
 		if (IS_ERR(edev))
 			return dev_err_probe(rphy->dev, PTR_ERR(edev),
@@ -1323,7 +1323,7 @@ static int rockchip_usb2phy_otg_port_init(struct rockchip_usb2phy *rphy,
 			goto out;
 		}
 
-		if (!of_property_read_bool(rphy->dev->of_node, "extcon")) {
+		if (!of_property_present(rphy->dev->of_node, "extcon")) {
 			/* do initial sync of usb state */
 			id = property_enabled(rphy->grf, &rport->port_cfg->utmi_id);
 			extcon_set_state_sync(rphy->edev, EXTCON_USB_HOST, !id);
-- 
2.45.2


