Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3B4C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+beY3V9/dsi/eMagTUtxWvMmsE568RPkT0UJ+9W24k=; b=brobdjBL+FK49R8Hgd/wGRfq50
	+J7Qxbs7JYxEkn0MkqJW8Eyir+cbHRVfKIFSNLbjx1wWLloR5h6Z5djwxWMB+SibtGx0oXcUiWHCn
	4D/slabeqUXvroYZ0qDSdlxsD9ypgWAu95smtlFV2pWs9yJK3ilcdAgbO5ajMjss8D4rL4Uac1Ral
	kruCLr86+p+w9DRW8I0hCJf8iuxdoUkTsPxq74h8iO28/hadanrqaFiNDsnlgWF4NJR2hgW/6/SVv
	hfrv0Ty/xYfbE5SPqnbTVZjw0Qlr1HxNj9kduyhrXKL2rJSL+D6vaqQvO7VE0zyz+ohcZNqGQ06rv
	OFGWRlMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0ee-000000019Js-1eW7;
	Tue, 25 Feb 2025 19:31:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzwA-000000010tV-32uO;
	Tue, 25 Feb 2025 18:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/+beY3V9/dsi/eMagTUtxWvMmsE568RPkT0UJ+9W24k=; b=waLc+/pzfueh2JBlw6t6cI5SrM
	OSmvOm0bhEWmdDHaP9/XmcmztaOdGrkcmpyRwMBj9O5QDN1gFz99v0szxP3InL9jW6vxCSmAhNk/f
	MsttMJ+Grp6AIklxFpjYvzYxNyGr9vvU6mnc0wwNK849+O671VRSV0yfgLfrL+bl6Py7enDpA0fW9
	OdEbxCDPH5WehSBT7haFOLNsOzHJUD4tRZQKf80VYVJDl+FGCslchjPkVBLBZNp0Q1tAdoGxOPQGo
	ezwa6XjOZ29LWfJF9mQ9fXLjPC6VU/sZtJSKYJPfP/Q7cWudAaRfXMMRJM2J2zcBdfTjeIsUhIBG1
	MMSHBHXg==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tmzw8-0006r3-7b; Tue, 25 Feb 2025 19:45:44 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: heiko@sntech.de,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/2] phy: rockchip: usbdp: re-init the phy on orientation-change
Date: Tue, 25 Feb 2025 19:45:19 +0100
Message-ID: <20250225184519.3586926-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250225184519.3586926-1-heiko@sntech.de>
References: <20250225184519.3586926-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_104546_780067_5802821C 
X-CRM114-Status: GOOD (  19.02  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Until now the usbdp in the orientation-handler set the new lane setup in
its internal state variables and adapted the sbu gpios as needed.
It never actually updated the phy itself though, but relied on the
controlling usb-controller to disable and re-enable the phy.

And while on the vendor-kernel, I could see that on every unplug the dwc3
did go to its suspend and woke up on the next device plug-in event,
thus toggling the phy as needed, this does not happen in all cases and we
should not rely on that behaviour.

This results in the usb2 always working, as it's not affected by the
orientation, but usb3 only working in one direction right now.

So similar to how the update works in the power-on callback, just re-init
the phy if it's already running when the orientation-event happens.

Both the power-on/-off functions as well as the orientation-set callback
work with the usbdp-mutex held, so can't conflict.

The behaviour is similar to how the qcom qmp phys handle the orientaton
re-init - by re-initting the phy.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7b17c82ebcfc..b63259a90d85 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1277,6 +1277,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	int ret = 0;
 
 	mutex_lock(&udphy->mutex);
 
@@ -1292,6 +1293,12 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
+	/* re-init the phy if already on */
+	if (udphy->status != UDPHY_MODE_NONE) {
+		rk_udphy_disable(udphy);
+		ret = rk_udphy_setup(udphy);
+	}
+
 unlock_ret:
 	mutex_unlock(&udphy->mutex);
 	return ret;
-- 
2.47.2


