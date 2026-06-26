Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B85C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCS4YkwVPaIwBg6GrbXQl1mtVKVSJQ9qWKDk/qpSbA0=; b=uu1QVveGxXEEokMcw2qj7qwg+Z
	vNjGvdJBx62V1Ay0IIN4s1kQ9AsvBMdUJag8c3al2vQ1Yj9eV4KsPLZ7DXSxOkR31NhQX2PPl5IL1
	V6HaTPPXvSeeLC2Cg+2cNuZtM3NRR9CCMSwnTEYcHTrr29ZOBOgcVVzFzCdqRkTD76XLBlNZjy9mg
	XYPf1Zpb3LJIbg0w33LdCHNc+xZ2pf0DzMyDBFk3MGCnvZ9mHM5KM5Clc4J+7YYvDVvpzlFu4v2dU
	K/xvbVJUxMGC9g6DyHTbt3OZxpHyPsNm+3LoN1E4uEArCTClK1xQQ+EKCSqtfUMkW8+Y4uakN9VmW
	NBYU0XTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDbA-0000000BqvN-2U53;
	Fri, 26 Jun 2026 20:56:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZw-0000000BpcJ-1Inn;
	Fri, 26 Jun 2026 20:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=B1hFP7GBgjpJwgyiWYAhEXHS75Uh6G1z6FfSU+iGafs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=knVVh50VwsLWBd3KmIY6qlXZ2RKNkgsLJvenbrSi43HLpf8+Lr8RqdwSNBphGjdyW
	 hidvPbGG5jVg9ItVHzi+go9c1UFYfO4YJyPaljuKrQP90xSWu82upoW0m3rzgYQ6DU
	 ku+bCmLDE5sR2HKhKzwwKrAjgYCPBA+vIlay5Et52VVI0IBLXMu6bxOM9y2TrD0+R3
	 +aKQuUkbQ0T2gGQ5mYcr03jXDANGrj8Z9aNt83TWF2/Vfh9sLV3yjvZOisMFbhj+an
	 FfpKYJlre3D8w1OUw57aoUIjT3DyCg46o4vHXbAvhsBmdlnNlaH7zaHnf13hcMNbES
	 B56L8TneN8Q8w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4B3117E1562;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1FC8048004E; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:07 +0200
Subject: [PATCH v8 14/29] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-14-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
 bh=B1hFP7GBgjpJwgyiWYAhEXHS75Uh6G1z6FfSU+iGafs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVvFMZUvwP9JJZT9HW0X7ypcrsANPUvG
 HWkf89JIpkaR4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qais4P/1Z05N3q8Wy/MvxN6cxl33Az2WGK46F+hKVJyTkr60nPFLSFY8ieGZOSjX6kpNv12OW
 7hRVRybTo1h7xtQaCbVp1xOTKAWxhF/u7yPb6SbDGKgDCebJVdXcWrydpOQ2FuuIquCZEj26QKd
 bN472U2vknW0MWcuEX8MTvaK87wkMoR7HujD/uQonDBkdfG7nM6UWC2L0ifsd6mo4Nixl+vsq0s
 5+DWyoSl+ObaYgtXCQMzky2FSuX6rLWxa3cid/tgejGRcVQwExYqJTMk7f14YKPb+GiTtvEb+yF
 n6InaUXAHS8SXONeRMrzecYFrZIuqNRfWZg4lUzkep8lkvTt+PElN9eXWs4DOLkn3qY+K2cKEkC
 087wWpcogksDFgbXyz+qGEwr9dbfhLtSFWz1AZ5BDa3ZDI2Ruimss8usM3LpqER7R8Jg4NV4all
 X8W4Af6g0aMHyCvis0X8NR2cXJbdfBB3FmeUDlBngspvu3SIj9AelypGWjWNRWZuL+qPQNQJ/ph
 18pJJ26ht0el1dRb5XeSwft8E4xpPXW1EpMWF8KBbgkMiLAeNZzpBXIF9KNhUg0V8mIS93UfFX7
 tjMfpinsbGyFfxvaY3aiWiifuaowDNkVJC45dMDUlyGDRdTqFKuIYvpXykW97+6Z8MGQJHgCXfx
 sSNb0QLCR1qMsDCe2Oxw5IQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135512_582761_C9776724 
X-CRM114-Status: GOOD (  11.06  )
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
index 6de8ac3f9144..db1ad3c2a953 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -550,7 +550,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -579,7 +579,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1082,9 +1082,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1102,7 +1102,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0


