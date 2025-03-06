Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C560C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r1mvttKmdlTjRafAKsHmhCEZ5T95Om0QyJBHPC6if+o=; b=1RLyoBUgZYOq6E8J8g99xvfpk7
	XBMJ0dsy7jjojHI1hhCxv18BmpPPhusp/EXCcDeFv8bIMV1HiBrFkr+uGMGk9cwQWn2U8hhdOMC9G
	N+3qqFn3BLvC/QsXiz7ENZ9y9mYLL5UNYyJzsOhQUU+t+VeVnLpeYWe8A9Dtxd5DQ2u9939GyBzJ5
	QMOMY0uCPKY/gxAy+69oZgm/ik9yZv1RmmeGZZXIDRspW58mVKnf72j4D38Pugh2PE4wQE0rInYMR
	BsX0Q/Y4/HjaG4slN+G4URynNQEOFYG6CzhUEb3MH2riZGxC2K1cizLwhScyhl89MGeV+eSay4+Cn
	bCJMo+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6Ct-0000000AHEs-2uan;
	Thu, 06 Mar 2025 08:03:52 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5DS-0000000AA6V-054L;
	Thu, 06 Mar 2025 07:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=r1mvt
	tKmdlTjRafAKsHmhCEZ5T95Om0QyJBHPC6if+o=; b=FalPWDW582aligSeJEfAG
	Oz7pbNRCnY6FUKb5mA9MLzgBXqEGm5oRtgNAMLE76osO/UiFQsVFfknfoE7jof4n
	TQU3m/UScnP2Xo91U81YzeHosLi7Wc8CDt9B+1gVarjhYPJKbbo/QUgBom/poZOw
	pV4twSAAkiT5FP7MiqAz5M=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA33j_pR8lnNEKOPw--.129S2;
	Thu, 06 Mar 2025 14:59:57 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: vkoul@kernel.org
Cc: heiko@sntech.de,
	kishon@kernel.org,
	sebastian.reichel@collabora.com,
	yubing.zhang@rock-chips.com,
	dmitry.baryshkov@linaro.org,
	frank.wang@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] phy: rockchip: usbdp: Check these parameters only when the corresponding set flags are set
Date: Thu,  6 Mar 2025 14:59:51 +0800
Message-ID: <20250306065952.485809-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA33j_pR8lnNEKOPw--.129S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF1DJFyUtryfWF45ZF1fZwb_yoW5XrW3p3
	y5JF4Dtr1UGw13Wa9xtr1kCFn8J3Z7ta17JrWakaySqw13A3yrZF929ryfAr4fGr97ZF1f
	uFW3Ga45CF4DZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFzuAUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBoIXmfJRa42mQAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_230022_498387_F7A63D73 
X-CRM114-Status: GOOD (  13.60  )
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

From: Andy Yan <andy.yan@rock-chips.com>

According documentation of phy_configure_opts_dp, at the configure
stage, we should only verify/configure the link_rate when set_rate
flag is set, the same applies to lanes and voltage.

So we do it as the documentation says, also record the link rate
and lanes in phy internal for set_voltate stage.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 63 +++++++++++------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c04cf64f8a35..d1bbdf382aa2 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -187,6 +187,8 @@ struct rk_udphy {
 	u32 dp_aux_din_sel;
 	bool dp_sink_hpd_sel;
 	bool dp_sink_hpd_cfg;
+	unsigned int link_rate;
+	unsigned int lanes;
 	u8 bw;
 	int id;
 
@@ -1102,42 +1104,39 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int rk_udphy_dp_phy_verify_link_rate(unsigned int link_rate)
-{
-	switch (link_rate) {
-	case 1620:
-	case 2700:
-	case 5400:
-	case 8100:
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int rk_udphy_dp_phy_verify_config(struct rk_udphy *udphy,
 					 struct phy_configure_opts_dp *dp)
 {
-	int i, ret;
+	int i;
 
-	/* If changing link rate was required, verify it's supported. */
-	ret = rk_udphy_dp_phy_verify_link_rate(dp->link_rate);
-	if (ret)
-		return ret;
+	/* Verify link rate. */
+	if (dp->set_rate) {
+		switch (dp->link_rate) {
+		case 1620:
+		case 2700:
+		case 5400:
+		case 8100:
+			udphy->link_rate = dp->link_rate;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+	}
 
 	/* Verify lane count. */
-	switch (dp->lanes) {
-	case 1:
-	case 2:
-	case 4:
-		/* valid lane count. */
-		break;
+	if (dp->set_lanes) {
+		switch (dp->lanes) {
+		case 1:
+		case 2:
+		case 4:
+			/* valid lane count. */
+			udphy->lanes = dp->lanes;
+			break;
 
-	default:
-		return -EINVAL;
+		default:
+			return -EINVAL;
+		}
 	}
 
 	/*
@@ -1146,7 +1145,7 @@ static int rk_udphy_dp_phy_verify_config(struct rk_udphy *udphy,
 	 */
 	if (dp->set_voltages) {
 		/* Lane count verified previously. */
-		for (i = 0; i < dp->lanes; i++) {
+		for (i = 0; i < udphy->lanes; i++) {
 			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
 				return -EINVAL;
 
@@ -1243,9 +1242,9 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	}
 
 	if (dp->set_voltages) {
-		for (i = 0; i < dp->lanes; i++) {
+		for (i = 0; i < udphy->lanes; i++) {
 			lane = udphy->dp_lane_sel[i];
-			switch (dp->link_rate) {
+			switch (udphy->link_rate) {
 			case 1620:
 			case 2700:
 				regmap_update_bits(udphy->pma_regmap,
-- 
2.34.1


