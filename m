Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705A3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 00:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRFt5f9J7tMZL9mrTbFXbEI5C92bjoEptJBjun0m++4=; b=RUVHdksK0xfSDHKNPMRsNVzovH
	Yd0+d2XB8Vy/eMCn+8Dh20ALR2J730uBlk9vbNaUsvowshQxJwi71ZfJMkVkzkpCa8AV2V7ktJd5X
	exM/f+ur4vxaNxcRkVzVf15aF9vduLdkGLSqBoGPLvsURQZdzAXvcgLkp7vRBo+V9ta00Mq7sCwtr
	p1LUmv9+o7dbB85VBXu3bpVS4FOHQFYgAGa0/1F6Cay583Iq66qN1LiA3NqJc0EUD5tIQggAQbqfr
	a59GOf/R/H/JTo9i/w3e++CznlkIRjWJDSNkUXvNfc6JIFA8+ZnU0FQTssyeUKJOmi+hP/bzNUpWI
	hRVWvGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Ty-00000003Bsn-0k4H;
	Wed, 01 Jul 2026 23:36:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TN-00000003A1B-0rkM;
	Wed, 01 Jul 2026 23:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=4RuwzAtf5TKGkkh33ZvgbW91Fqbf6UoXltvoPmdTV2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ni7TxY3WL+87gUUA9z1Z5f8DcDdvcMovMxYaK/ASLRb2ZSuyL7Ecv7J7wObTzV+zf
	 sCemTBs2vCshpQ80SVbVdSuCrnW95mqi0s8PHf4G6YvtMI2vZ0vV+PtlmS9BakzrPJ
	 j1zODvOGyzDBzFgb761PjO+L9bQYfPDcIUT3I2D9SZYQwA5n2VtbNvKU1JNPEs8+zh
	 AikKzBd2R1l4GAw3WbFPsp4WZ74NsZ3+Zi1NPd8R+Vb4PEWL+rWDDcbLXN7R7h1rpf
	 LYeFyMpXOug0R2g831YuuoeBOsuVRfVl+r8T5VEERIS5F25SoX6jsSODr2UJWPZ5sS
	 1Jid6U4+bWr1Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 455AE17E361D;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E08CF48007A; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:13 +0200
Subject: [PATCH v9 35/38] phy: rockchip: usbdp: Simplify power state
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-35-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6342;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4RuwzAtf5TKGkkh33ZvgbW91Fqbf6UoXltvoPmdTV2I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFRa+ou2LkR21OWZwKdVSLxiiOpwQx95q
 8e/kJRzey2gKYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qahH4P/3+Rrju4vHg151N1+iO/jfoqvL83xNF73dzSAh6ZBCRb/m6Vv8Qco7x5rjUIFYbCBZS
 8Ny2UqcA3K4lWpOku02CwPzLaavXxcP5X5Vi+OZgkBi5dAdpRfED0LF5SycWCsKLBGGsxowl9F0
 Oq27qPbJzZJ8B3obUk87ulDOtjk3XVRF2EbxO4E8pTqRsGVmUHAp517UmEBqdFDmh7BoxRR0U/R
 8XrVUvNUpnb0UnFDZxVDAVWhQvyH9ZSyqgJUeDRTahYsOYEA4zJoktLQuUhLQS4DAhuKapghiRC
 /nj2kC3OZ4bvC+jKcApcHpIc6a2dfz9TIoyYIpCp9yAjfnyYpBs8i8FkRy22H3yKcNOB730Zdbd
 hbDvb0Pa9XtzgrjVpUZqEGHMT3qfKYTILoPsqI+OQBGE4A8CrUBi44htl2ACXfMjFSdSXRdVFo9
 qZAj+ggk/6yyk6y0VqeoHz8iaWxkvVxzrztDJesgpycqp/El+FwGZbj4Edm7IH9TSHZpkxMFVsE
 ev1xiEj4DVs2YuL803BRxny+iQDHu4X5/JGYMJzir3B4hQ2i4bvBBVtC8hriT797GxdbkuTnlqi
 xqAcEKsPqplsHMG40U+aD5SIOtheSlNlE03BuA1I1xo0ySNYnzeeqFlzJ7bpeAj/yZ1DcRoBGef
 NCYSXMLyfmJvIkc7O458lzw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163605_486295_F37C6EAC 
X-CRM114-Status: GOOD (  19.77  )
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

Simplify power state handling by introducing sw_mode in addition
to the hw_mode field, so that the PHY knows about the currently
supported modes from the hardware perspective, the current modes
requested by software and the actual hardware status.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 117 +++++++++++++-----------------
 1 file changed, 49 insertions(+), 68 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a19b048fb39c..51aac07ef9fe 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -176,7 +176,8 @@ struct rk_udphy {
 	bool flip;
 	bool phy_needs_reinit;
 	u8 hw_mode; /* modes currently supported by hardware */
-	u8 status;
+	u8 sw_mode; /* modes currently requested */
+	u8 status; /* current PHY power state */
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
@@ -585,15 +586,6 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode)
-{
-	if (udphy->hw_mode == hw_mode)
-		return;
-
-	udphy->phy_needs_reinit = true;
-	udphy->hw_mode = hw_mode;
-}
-
 static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
 {
 	u8 hw_mode;
@@ -627,7 +619,7 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 		break;
 	}
 
-	rk_udphy_mode_set(udphy, hw_mode);
+	udphy->hw_mode = hw_mode;
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
@@ -1023,66 +1015,61 @@ static int rk_udphy_parse_dt(struct rk_udphy *udphy)
 	return rk_udphy_reset_init(udphy, dev);
 }
 
-static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
+static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 {
+	u8 target_mode = udphy->hw_mode & udphy->sw_mode;
 	int ret;
 
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
+	if (!udphy->phy_needs_reinit && udphy->status == target_mode)
 		return 0;
-	}
 
-	if (udphy->status == UDPHY_MODE_NONE) {
-		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+	/*
+	 * Inform DWC3 driver, that we are about to reset the PHY, so that it can
+	 * assert its PIPE reset lines and avoid DWC3 getting into a buggy state.
+	 */
+	phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
 
-		rk_udphy_u3_port_disable(udphy, true);
-		udelay(10);
+	/*
+	 * Disable USB3 port, which among other things re-routes a DWC3 clock to
+	 * avoid SErrors when the DWC3 registers are accessed while the PHY is
+	 * disabled.
+	 */
+	rk_udphy_u3_port_disable(udphy, true);
+	udelay(10);
 
+	if (udphy->status == UDPHY_MODE_NONE) {
+		/* Power up (incl. clocks) */
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
-
-		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
-			rk_udphy_u3_port_disable(udphy, false);
-		udphy->phy_needs_reinit = false;
-
-		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
-	} else if (udphy->phy_needs_reinit) {
-		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
-
-		rk_udphy_u3_port_disable(udphy, true);
-		udelay(10);
-
+		}
+	} else if (target_mode == UDPHY_MODE_NONE) {
+		/* Power down (incl. clocks) */
+		rk_udphy_disable(udphy);
+	} else {
+		/* Mode change => re-init */
 		ret = rk_udphy_init(udphy);
 		if (ret) {
 			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
 		}
-
-		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
-
-		udphy->phy_needs_reinit = false;
 	}
 
-	udphy->status |= mode;
+	/* Ensure USB3 support is enabled when supported and requested */
+	if (!udphy->hs && target_mode & UDPHY_MODE_USB)
+		rk_udphy_u3_port_disable(udphy, false);
 
-	return 0;
-}
-
-static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
-{
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
-		return;
-	}
-
-	if (!udphy->status)
-		return;
+	/*
+	 * Inform DWC3, that we are done with the reset, so that it can deassert
+	 * its PIPE reset line.
+	 */
+	phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 
-	udphy->status &= ~mode;
+	udphy->status = target_mode;
+	udphy->phy_needs_reinit = false;
 
-	if (udphy->status == UDPHY_MODE_NONE)
-		rk_udphy_disable(udphy);
+	return 0;
 }
 
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
@@ -1091,9 +1078,11 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	int ret;
 
 	scoped_guard(mutex, &udphy->mutex) {
+		udphy->sw_mode |= UDPHY_MODE_DP;
+
 		phy_set_bus_width(phy, udphy->dp_lanes);
 
-		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
+		ret = rk_udphy_update_power_state(udphy);
 		if (ret)
 			return ret;
 
@@ -1118,8 +1107,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode &= ~UDPHY_MODE_DP;
+
 	rk_udphy_dp_lane_enable(udphy, 0);
-	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
+	rk_udphy_update_power_state(udphy);
 
 	return 0;
 }
@@ -1329,13 +1320,9 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
-	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
-		rk_udphy_u3_port_disable(udphy, true);
-		return 0;
-	}
+	udphy->sw_mode |= UDPHY_MODE_USB;
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	return rk_udphy_update_power_state(udphy);
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1344,15 +1331,9 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
-	/* DP only or high-speed */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
-		udphy->status &= ~UDPHY_MODE_USB;
-		return 0;
-	}
+	udphy->sw_mode &= ~UDPHY_MODE_USB;
 
-	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
-
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static const struct phy_ops rk_udphy_usb3_phy_ops = {

-- 
2.53.0


