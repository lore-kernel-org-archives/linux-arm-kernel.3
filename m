Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C80FCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bZUXeO/XWo0k/BstVa6QIDxDsy77uUiqR/wgKyQfe8=; b=ok48Iid3FsF0z7uiBICYD0JOHu
	TcinRCJTwNNKW7Tea+GZPqfYLGUhzyJMpSxJBcr+S52iwY4FgoJtlwLUdij87XBs/Kkmib02/t3qZ
	sQEKQ+Hy1JfpV4lQ7VaHrFt+JeLXjMrEuhdqyDdoirRBSVEuP9Wo/110ZbecTWoqWq1fxPltD4bQ/
	//1PQKlG+2ffFRC5WgAUIxmD6tnN0qymZLNEE3q2lKC78O/Et6+ukwO04PLhJ8bF0i/KgNUiAvw7H
	X78vQNulxI38wJemiZO+v51X1EkskPeVT2FAgSwfuVKQkAkh8EPMPhZKyQ6agHV7VE0AiiAqqbN/V
	oGXDnvUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9w-00000002e5f-27Sr;
	Fri, 19 Jun 2026 15:29:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9W-00000002dXh-2zs5;
	Fri, 19 Jun 2026 15:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=EVPCL9zVkRBzg+EjML3hQjkCgGTjuY/mvZktdVccv/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RO0icPphqGTjLtKrM6tAJC5J0nGdDXBldmuDTvcQZ7sqL0YCJ/ia4LRaSsssX3icf
	 hasgDOohHXVSs7Iw4z8/T4XSclUbDaPD39qwwXdpMqcUyOBgBkNksVzWowR99Tq68Q
	 9ib6yEdkRe/FvsZQH1Fs4JYVzWqQfavjfziaTtSUl7YBUdAJ5Z/zOhyUClvVzEGtFF
	 08rok9axkliVDuS3fR/c0GohDcQblMkTRN/Fp6lBCDLek4zfrLGdxftfI40Q3LXgRy
	 nHxw3RK9q24LuySn91tRnO8sJxKRqAsp7EzJ6dy7exNmu/vI8eFwfDlQtNdfmk430w
	 ef6eRdRpJBnaQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5475117E1562;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 993AB480048; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:03 +0200
Subject: [PATCH v6 12/23] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-12-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=EVPCL9zVkRBzg+EjML3hQjkCgGTjuY/mvZktdVccv/4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDiH4AF6nR0Y8pMlkq7ImAE1wb0xdod7j
 8SGg5kDmSYpPokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qafBgP/j11fTxdDdT0zWXlvJab2gavkKaEHs4sMgo1O3iDbDUI8ThDWCK4ogiOfSXwp66LTSA
 r5QY+p+Zl4swVIKSJM1xC0VqVG+gnJaPbOXMHx4rpoQdpicaAilahlvDqErk2+iDE13sbCycJBc
 xbxgDq7dmQ8E5xu28yvrk9VTwip48Q8kNQZBlXbq7cnlVDlHsTBp8xiwNuF1D6av4w9mF8Ng5XR
 wL4YE20m+tU+JqgpD4gFbXzAn5xG+FOYEisxKMsygiRL34/99ySO93iTOQTT/79TiBbIs5ewDVb
 bVW3gOk3ng0Z0YTJnZEdwb86GWStpCOh96WOoXuuphgYAnYQ44IQnDIuq5RErGBAfjR9rbuOCpZ
 +3HE2kTQPDKGaenIs9/6hWP3ttcN5wCRICQo7yxozhSqz3f0q/h4zZDzwJR/vX2wOMfOmooV+4x
 0jH2S9i25nTuulZU1lIiwGBbl1uTqukcQcOFo2DyXQ2ntYy5iYJI6f2RDrefllfT799SzDqR2cb
 U8JPPNB0BtAhgU3p6KllZFDXxJiLNBMb8aqw1l4zRRTmgbNCBzHTHiJ9sBEKfGVTyljueaX7aWQ
 QP/kpy12yQVLBfJWQCTiKkTCHzTPRsqugTy3Ed59cKzqduvKhBDjKd5ZvvTDVqeyAd2e7QzN83s
 EhCUWHnPRd9asaW+9YRof2A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082907_235942_FADA2651 
X-CRM114-Status: GOOD (  11.23  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a87cb5c0596e..e8b2adecb08a 100644
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
@@ -1073,9 +1073,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1093,7 +1093,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0


