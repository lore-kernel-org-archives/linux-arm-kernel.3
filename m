Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FD4EDF170
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T66YRZckKiJh6iQZmC0XtJRqipwfBFnyLGKw5G1g/iQ=; b=kAsUKQlKxr/O1q1Bkg5p5gQAuK
	28HuEvD1wQckitpuSOTohB0z1iLNOqchWdlNPn/7twNjiIeAfj4vAOJ0nJIyZubD8S78RIP/RNQlm
	e8Uq/CPk6bbmILae7dvw0PiI4zBAAgHBNr7D3BpcEvER/aWzImyVYiw1JwMXPZ+s9NeE83pWM18kI
	VEoMSDgEYgZnI7bCxGtXzscwJXFqsaoPtPelyOfDc8h3vl+fz3hpfIH1Ois4//jNHFf0eXjZb0dJE
	BMbewYQ6Kp5eHXqbe5NGKv0fN0qlPVE4jOiApa50TbLPLK9LA7CKlzBX1Oi+AqbmJqTbS7fsCu80f
	EGIwQh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquL2-00000003YyQ-0tuk;
	Fri, 13 Feb 2026 14:40:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKe-00000003YSk-1ZlD;
	Fri, 13 Feb 2026 14:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770993571;
	bh=+wZrIxHRM51w2Jk9G3m2sX8kdyjjY8ZoXrf0WYlfaG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XDH2B+0UTDnqCq0pvdSKb5JTRCe/S+UcbXiFpKtTJ2EJV8SLCfxzQU/4I/2YcuEpf
	 LNXSEjWp6VO45Bc6qtB6giBxh/fMdx9yVeqocSHL5fWMhV0zcH9JrSlEIAjFFI0poP
	 GRwXiUGubZCYefp7r6ntPllHV/2YOaWue728lS0G6yj9C829TIjsw31OdfLUskFsZi
	 jzn6bXbjdiKU2AlEhIHrJfA+OFd1ykf75K2Nr764lZCIXCECH9PVS8UAyJOcPzGEBT
	 lJWSAL9zHXqEUvO8lD6XwHpR9jJ1iF8OrkqT8I9gIGTyiHFZqrWMvd6LlOkWMXRtzG
	 p4pHPYaaDAYCA==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6459017E35D4;
	Fri, 13 Feb 2026 15:39:31 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A9B6A48002C; Fri, 13 Feb 2026 15:39:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 15:39:30 +0100
Subject: [PATCH v2 7/9] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-rockchip-usbdp-cleanup-v2-7-b67ec225f96e@collabora.com>
References: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
In-Reply-To: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=+wZrIxHRM51w2Jk9G3m2sX8kdyjjY8ZoXrf0WYlfaG8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPN6JiP/GSoSD6cri+DYYkpisTNlOrGQfu8
 ZpNSYpvw3YjE4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpjzeiAAoJENju1/PI
 O/qapxQQAJ7jxt8/3iBCHmR9S9g0bcIDF9+bFSXk4H7Lfhc61yQ5esy9EaA/gXHZrRlxiFlLefj
 RELMV+h2whI0Nq/YuQVYJZ2SBteGVKPIjn36DgPwzIj3gAZZeNUp2sGbpbcGdMvsiA0vzURW2b1
 jA9U4OG+6BfD44UT3M4K2rfPtxjj3EcuHEXbQmgkRcv44ibSAV+M/8oIlNR6ZlnZNoRNkQfl4gp
 o92IZWuPfaKKCSSsSari3+CfQd+vreiBDaPIwljwetMCvK73cAZzxYIo+tXdLo6foPOZLdjp8Ao
 84045r1/UczdSVk30auyu+jzTn4r8+woleZE9kNCq6tGFy5S+9cVhcXu+NGbnMHKMxr9k2I0xXV
 V6bEe3pBbwxDiANtgIMHzoRFFfKsGO12y6OSSdR0JcAVMeYnG4JVNzXzSEVercmkjTLXWT7J8KM
 +eTlXsUGRlnHlySRxWiU7+5NrUDE7LOj5Iqjk639q1WMspgcB0QvHFx1wk6LigyDVgfIzHWdjQw
 v51qH+QMnSdGVjst/NjOwsTBDPDE8hW9X0rrj71d/Q1uN4x+uHaXQ3NXTxzBKzL9Jo+o0Acc/+y
 VpWw2OMChzUwoYbNbxt0c0k4UTIpbHvZNiJMlAj2NBxikAzQDzK82gA/gb5hlY4KUK4ATZnJb0V
 e+J1h5ZaiFQ3xFUvYGCQp+Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063946_006708_CEB8E86A 
X-CRM114-Status: GOOD (  11.07  )
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

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index bf8394174294..6d7ca11b308e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -547,7 +547,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -576,7 +576,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1072,9 +1072,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1092,7 +1092,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.51.0


