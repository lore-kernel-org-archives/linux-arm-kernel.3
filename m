Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C72D1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vOo3hUD9gYeZk5urddkZ0RCFKXm5RmJh4k3ll+m3Fs=; b=z3VHWfkUMnNISD9StGeFrqkxa5
	oJDOu3JxMNCP4gmeje8JlsbJMCB++Xinbqlu/WE0m0a8cPFOHK/K4SVlapGxbnfWMWoSNV5DE2h8B
	5twktRD7JFypzBF6OtgNeYunu+ibRGwHFHwEjucZ2wvVLwnXaRqjJmNkSA/6nH/Yi6zJBXreoVHfE
	Yzl4ZNDIVZgv8DlL0ICzNVdNhlIEvP22QKH16SyXJQeJPk7H32ll+xg1f4EIAkUjZTpbafw9V0KD+
	9r0se2HBsPpKFFWGjGgS6iM3utlrj0ODQkkEOn1RzKOn/CLknk3yW9q+wb2a0sKKzlUyFSxaqpyLk
	GXSyqNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82cu-0000000Escb-1BtX;
	Mon, 04 Nov 2024 19:20:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82RG-0000000ErEh-1gS9;
	Mon, 04 Nov 2024 19:08:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A7175C2759;
	Mon,  4 Nov 2024 19:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C6EC4CECE;
	Mon,  4 Nov 2024 19:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747313;
	bh=j7klqenx4annFQS56VxG5XYt0rD6Z/IoBUva+ojwv4E=;
	h=From:To:Cc:Subject:Date:From;
	b=HdKZJ063PdQWe4KE3HDKzbd3TrFv6VyHEc+ElSkkrX68ltrXZnmwnA2VKN2tG455J
	 76wgJeHu5PV6lrlCt6dpcmZ2SxyRK9hD2vv0FQ8OwOYUrvnnqcRLccV3mmXsWNEGWg
	 kbFqNzXelXllXntRtsDbWP1nDPUO95rC5JKwGpnChuUttI765wrVh3SkZwOpcJUpGO
	 h2DjbTXBQWoW7ys4r+PSOiCIEEdWFjvtdOuQOEn1V83R2ajOQiPmWs0+yiNc6nvrm3
	 oKv0k9eGkelA0p+H9PpucsqzNsRU5y8zrLnLHtsi9Zgv9eOvVtRgBOS7qwrX9TOsbK
	 HAPUU/i1XfzFw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] usb: Use (of|device)_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:08:18 -0600
Message-ID: <20241104190820.277702-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110834_613593_89F5881E 
X-CRM114-Status: GOOD (  12.77  )
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
is deprecated in favor of of_property_present() when testing for
property presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/usb/chipidea/core.c        | 2 +-
 drivers/usb/dwc3/core.c            | 2 +-
 drivers/usb/dwc3/dwc3-omap.c       | 2 +-
 drivers/usb/dwc3/dwc3-qcom.c       | 2 +-
 drivers/usb/mtu3/mtu3_plat.c       | 2 +-
 drivers/usb/phy/phy.c              | 2 +-
 drivers/usb/renesas_usbhs/common.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 835bf2428dc6..18ecfcc08b97 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -765,7 +765,7 @@ static int ci_get_platdata(struct device *dev,
 
 	ext_id = ERR_PTR(-ENODEV);
 	ext_vbus = ERR_PTR(-ENODEV);
-	if (of_property_read_bool(dev->of_node, "extcon")) {
+	if (of_property_present(dev->of_node, "extcon")) {
 		/* Each one of them is not mandatory */
 		ext_vbus = extcon_get_edev_by_phandle(dev, 0);
 		if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) != -ENODEV)
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 9eb085f359ce..e1beb760e913 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1935,7 +1935,7 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 	struct extcon_dev *edev = NULL;
 	const char *name;
 
-	if (device_property_read_bool(dev, "extcon"))
+	if (device_property_present(dev, "extcon"))
 		return extcon_get_edev_by_phandle(dev, 0);
 
 	/*
diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 2a11fc0ee84f..c2d7582c151a 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -416,7 +416,7 @@ static int dwc3_omap_extcon_register(struct dwc3_omap *omap)
 	struct device_node	*node = omap->dev->of_node;
 	struct extcon_dev	*edev;
 
-	if (of_property_read_bool(node, "extcon")) {
+	if (of_property_present(node, "extcon")) {
 		edev = extcon_get_edev_by_phandle(omap->dev, 0);
 		if (IS_ERR(edev)) {
 			dev_vdbg(omap->dev, "couldn't get extcon device\n");
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index c1d4b52f25b0..649166e2a8b8 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -161,7 +161,7 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
 	struct extcon_dev	*host_edev;
 	int			ret;
 
-	if (!of_property_read_bool(dev->of_node, "extcon"))
+	if (!of_property_present(dev->of_node, "extcon"))
 		return 0;
 
 	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 6858ed9fc3b2..2380552025e4 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -307,7 +307,7 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	if (otg_sx->role_sw_used || otg_sx->manual_drd_enabled)
 		goto out;
 
-	if (of_property_read_bool(node, "extcon")) {
+	if (of_property_present(node, "extcon")) {
 		otg_sx->edev = extcon_get_edev_by_phandle(ssusb->dev, 0);
 		if (IS_ERR(otg_sx->edev)) {
 			return dev_err_probe(dev, PTR_ERR(otg_sx->edev),
diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 06e0fb23566c..130f86a043ad 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -365,7 +365,7 @@ static int usb_add_extcon(struct usb_phy *x)
 {
 	int ret;
 
-	if (of_property_read_bool(x->dev->of_node, "extcon")) {
+	if (of_property_present(x->dev->of_node, "extcon")) {
 		x->edev = extcon_get_edev_by_phandle(x->dev, 0);
 		if (IS_ERR(x->edev))
 			return PTR_ERR(x->edev);
diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index edc43f169d49..e4adfe692164 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -632,7 +632,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	if (of_property_read_bool(dev_of_node(dev), "extcon")) {
+	if (of_property_present(dev_of_node(dev), "extcon")) {
 		priv->edev = extcon_get_edev_by_phandle(dev, 0);
 		if (IS_ERR(priv->edev))
 			return PTR_ERR(priv->edev);
-- 
2.45.2


