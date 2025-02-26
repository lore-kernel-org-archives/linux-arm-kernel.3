Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A467C19777
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRmd87Bt4r/gRs/8A2tyjVoJarc357y7FoApmSgOrbg=; b=t+PJDy9UMBBimc5HKhNqMdsdwI
	qhWff+RYKEc5T939mz6OjOCN7F5m9Yi9rW1EmgyM8K9Ymon98IF7VBXO9dYE9AlA7b6pwowCuLlGB
	lh/XCmL8acCCNMFFgZF/7vG6g/CCR7R483s+2qopkp2RXzqfY/8y95tctK2hxDOINw4SkkA1ru2+6
	8zf7u41K11UuzNpO4vkZDEQL1tlRgyHzjVRUGYC5HuywuNY27DP1jiBim4xH7R1Eo+1qwYR9nqYOK
	u1smfD0ZQrBITGNA6xYQczDPwEYu3pDY4jy/wsDxjTLRFyvAW5CuKkewow9Zof3JNVSf29K0gXAe0
	J6tacipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnG34-00000003ZR3-1DOh;
	Wed, 26 Feb 2025 11:57:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEo4-00000003KMJ-3I7N;
	Wed, 26 Feb 2025 10:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mRmd87Bt4r/gRs/8A2tyjVoJarc357y7FoApmSgOrbg=; b=jQC9vgkx1+0En9VesSDoKW11QF
	BmNxkXGLOF8S0n62Y3KY7U7t3vdTq+yN6cRLw61ZoG/U6DLQiSBxemp0n+xUBkAEBFNhYqZ3ADFMh
	ChXOQe9ujdrerGH8jiLvisoMfcR+rYYx/2gHsSvAnTulNvyJlQo2vUvpwolh6GIsn0gBEOMb3udSz
	D+VmoOwmU9EMnDDXRYC22pJAm6u2WaSjq84Aucra6/hHtJrviNhxT5UFz/1CAzW8GjCzoBxnVB3uK
	Q8f2p5lKQURAgUJZe7gbGqafZRNG4yTGclhAwSy0zoL8wullQu4u42sE3utdawakSmkMFEVCLP8cs
	uUwjyURQ==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnEo3-0006aJ-Fw; Wed, 26 Feb 2025 11:38:23 +0100
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
	christophe.jaillet@wanadoo.fr,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 2/2] phy: rockchip: usbdp: re-init the phy on orientation-change
Date: Wed, 26 Feb 2025 11:38:10 +0100
Message-ID: <20250226103810.3746018-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226103810.3746018-1-heiko@sntech.de>
References: <20250226103810.3746018-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_023824_825074_74A34770 
X-CRM114-Status: GOOD (  20.68  )
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
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 960cad5b01a9..c07b79da5b6b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1277,6 +1277,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	int ret = 0;
 
 	mutex_lock(&udphy->mutex);
 
@@ -1292,9 +1293,13 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
+	/* re-init the phy if already on */
+	if (udphy->status != UDPHY_MODE_NONE)
+		ret = rk_udphy_init(udphy);
+
 unlock_ret:
 	mutex_unlock(&udphy->mutex);
-	return 0;
+	return ret;
 }
 
 static void rk_udphy_orien_switch_unregister(void *data)
-- 
2.47.2


