Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FC2EDF16E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n63Ms2CFRkj0ZhrotDNCia9YQIWKE3i0foLYEfRZ9OM=; b=fgBIkUVxxgCQaclzF55833KcJd
	SCLSNTAf4cHqBW+JI/T3UN/OoeWKGKedI1Znq4zLRhO5UMOlDnNyWRsCQwDiThYpEJg4YeNkJdsGY
	fYexmLt8e63TndxEs+eFWXSvZOBu68XZuYqa95GO6Smh3sMfLNBYww4R3e5HF0KPnySGXselLGHJr
	8ui+KZMNAQ7KU3kUDrW2rPTNv1Ax6Hvtt4AOmCBkzDm5KdKcbRb5GV3H5p9T4iaDitguFKxv7ItR+
	vra2TAqWurCRYQchbv7P67IEGIOA8DQ3cA8xfVdrlQ8iNu5OMGdqVvScNWFNu5xf5hKdqDi1vli3H
	Cqqv4yig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKq-00000003YjP-3uRu;
	Fri, 13 Feb 2026 14:39:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKZ-00000003YO9-0F5N;
	Fri, 13 Feb 2026 14:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770993571;
	bh=t6Qag4fKlcyNQ2bp0g4W2ytwsSllPhCO59J7cdiOxhM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RRpsbaygo1BeDiuT2/NKjKXgSBBlqdXfdb+poydH/dIMU6vpEGI8aSezm5vX3bFvY
	 xebMtytqL2UkoMoJdDOvXbRQ1H0uDoDMO2uuc57xvmpjJ4rgXFbCexdcMbj6drTxg4
	 /StDBINseVeXs+eBJWBzprpa+6q6IBuj/MrrTqrfR1Qzs1VBpoz+TrmW6dIIAAjIPG
	 cijxToT7B8dbMCygyiBF0HbCIfoT/qOHug749CvwTRVLnGpMjBnuQ6dJk17xBItY47
	 BX4wXX7YxY18dnkzeUZSmTtnfLxp+tR/YWzyt2bGNVhBvQpYB9ClzbDOJUoHAlGJKD
	 /m8oRS5YoBiZA==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6776817E35DB;
	Fri, 13 Feb 2026 15:39:31 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AC53948002E; Fri, 13 Feb 2026 15:39:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 15:39:32 +0100
Subject: [PATCH v2 9/9] phy: rockchip: usbdp: Cleanup DP lane selection
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-rockchip-usbdp-cleanup-v2-9-b67ec225f96e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t6Qag4fKlcyNQ2bp0g4W2ytwsSllPhCO59J7cdiOxhM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPN6JpbUWKX7+fFbjU3EViR0yPRehliYy8k
 ERY6cluu0Na0okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpjzeiAAoJENju1/PI
 O/qap1cP/3kkujbXo/HgYJ18VQnowLv/vL6GHBhRS869P4YFbM4d8P/ChC/cp9NnqvcmuC2zhYv
 tOmXwqd901CuvixhSyT6CLN49HQ31+NCESPUyHpF+ePxHZaysBKsRVcZOi5ypTIt4LFjYO5AO7n
 AYPepPLLVEly2Gr6TdxkZ2DQeFLrxIs0hSoASPgfyemH2nshOWvZ3KYCM25S+DDvaPqgtzupp1S
 PiJ67Wf7Gd7q39uWQ+0shIQ4+sTz91ZejTH4Zxs3MeEcKWmXKZrbWUOscSB3J+j84z1lp6dF7z+
 fkVSEIDGeI04Ro4aIpEfrDgg9Wid9szCxQ0K0SuHsHHyg8dNHDHqYzOWnU9kkf2LT3+EbbUfzmh
 rHhjtAGq1pTquHLHTXToz4QR7xv4hdr5lfsnY7VYNvgh4RnbQBonnO1sqdzfwDRQy8Ikg+9iCW9
 vBvbmLOt/OGzydnVg96KexlRy9hN0wyzup5a4jwdTBTUxcSGVt2nu4/Z91Hd61MM9q/u9bjxNuR
 J8lE5+6CVw1A4+6O4WwijjslHc17G5Sv/9zk71zAZ3+9Bl285nPCoTx3wlHOXj2ksQiR9VXdoWJ
 QKpGv/bog2gkd3bBjO9fX0fMNWNINybxyRe9iM1h6UBPvXv5Zu/+2p2Y0U9uIMj/VtCmGafhEBx
 uR1bCTivZbAZ3f0oZNzs2nQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063939_366758_242DB1ED 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
logic.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1bfc365e2b2c..c2f52b7125d3 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -3,7 +3,7 @@
  * Rockchip USBDP Combo PHY with Samsung IP block driver
  *
  * Copyright (C) 2021-2024 Rockchip Electronics Co., Ltd
- * Copyright (C) 2024 Collabora Ltd
+ * Copyright (C) 2024-2026 Collabora Ltd
  */
 
 #include <dt-bindings/phy/phy.h>
@@ -550,30 +550,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
 static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-	u32 value = 0;
-
-	switch (udphy->dp_lanes) {
-	case 4:
-		value |= 3 << udphy->dp_lane_sel[3] * 2;
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
-		fallthrough;
-
-	case 2:
-		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		fallthrough;
+	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
+	int i;
 
-	case 1:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
-		break;
+	for (i = 0; i < udphy->dp_lanes; i++)
+		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
 
-	default:
-		break;
-	}
+	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
+	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
 
-	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
-		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
-		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
-		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
+	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
 }
 
 static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)

-- 
2.51.0


