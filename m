Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D675C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqy8zIbPIRA2NX4AxX/zIjHwhaA8zCfusY9CcosIz6c=; b=I6kP7x4pWIo2yImH8QTnqhz8Eq
	O+xQIlYNnCpZz7p3kbntY3g/PKvHrCnG1V6Oc8oyQUL/o4BPj2meDHht92ICKF2Zp4R0OPZ3nWEZy
	R/TNIjSzh0bCb/ZDNNPad4VIYYUaunzvwd87HA/+VB1qEs2PYsiulgtLEB8RbwBVET2w3EE6kquQ1
	DaWD5EdIfhpC9+LLYJGfB0Ca0q96ak47CHJe6TQTV95Y7YCzwQaYilF69/rea9P1TQb+A66x0iesB
	9zVPP74Es65D/pjEiQtc+h18fDfSLZ7MMLBX6AeILDiMjLzDr0plG0GU2oZLAvE60SBdFiqsvpDpD
	kK43+7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGsC-0000000Cj2h-3O5q;
	Tue, 05 Aug 2025 12:34:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGHr-0000000Cdl7-0gBC;
	Tue, 05 Aug 2025 11:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754395017;
	bh=xMXen/bHQmq8eILCFZkOq3t0CKOepKADVu7/ZOwpRaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hBRYKf5xtHx5sucEvqK4GD538m/d/Y5W5uoF0SNFq2XenO30SQSs0/oUg9TtkxhrO
	 ddFsvwxiZszzR51Uo+3MEdgbtaXBeuJWnsru/lxGeJ+EugIaUmauagRBHs69gcrbGH
	 GbVQWL+ijOSF8B8PwlkECi3lUDA/gcH8l6McdKmILSWqLDWPCghhelk6PABV0050Sm
	 W7Ivyk29NpYcgp3IZHhqvHntSNcmKc0Ibi/aQnMFSZ93dyFIYgo5J5lRi++IQMBHWu
	 vRV7lo2tOUVs5kVP6XTtzB6ugt9wpvUv7UOyaESrjnzahoYKiPXg2djS01wvv3O1Gs
	 BbTAN3DLOHQvg==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 69E8C17E0202;
	Tue,  5 Aug 2025 13:56:57 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 05 Aug 2025 14:56:55 +0300
Subject: [PATCH v2 13/14] phy: rockchip: samsung-hdptx: Extend
 rk_hdptx_phy_verify_hdmi_config() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250805-phy-hdptx-frl-v2-13-d118bd4b6e0b@collabora.com>
References: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
In-Reply-To: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_045659_391684_1C6EFEC1 
X-CRM114-Status: GOOD (  14.21  )
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

In order to facilitate introduction of HDMI 2.1 FRL support and to avoid
recomputing the link rate after verifying the HDMI configuration given
as input, extend rk_hdptx_phy_verify_hdmi_config() by providing an
optional output parameter to store the validated configuration.

For improved code readability, also rename the existing hdmi input
parameter.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 35 ++++++++++++-----------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index a44614bc73e9461d4d38663776f547f595169c3b..58eac67cc3b21c17939c303bbea3fcdc5e6b0518 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1472,25 +1472,24 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
 }
 
 static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
-					   struct phy_configure_opts_hdmi *hdmi)
+					   struct phy_configure_opts_hdmi *hdmi_in,
+					   struct rk_hdptx_hdmi_cfg *hdmi_out)
 {
 	int i;
 
-	if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
+	if (!hdmi_in->tmds_char_rate || hdmi_in->tmds_char_rate > HDMI20_MAX_RATE)
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
-		if (hdmi->tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate)
+		if (hdmi_in->tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate)
 			break;
 
 	if (i == ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg) &&
-	    !rk_hdptx_phy_clk_pll_calc(hdmi->tmds_char_rate, NULL))
+	    !rk_hdptx_phy_clk_pll_calc(hdmi_in->tmds_char_rate, NULL))
 		return -EINVAL;
 
-	if (!hdmi->bpc)
-		hdmi->bpc = 8;
-
-	switch (hdmi->bpc) {
+	switch (hdmi_in->bpc) {
+	case 0:
 	case 8:
 	case 10:
 	case 12:
@@ -1500,6 +1499,11 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
 		return -EINVAL;
 	}
 
+	if (hdmi_out) {
+		hdmi_out->rate = hdmi_in->tmds_char_rate;
+		hdmi_out->bpc = hdmi_in->bpc ?: 8;
+	}
+
 	return 0;
 }
 
@@ -1765,17 +1769,15 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 	int ret;
 
 	if (mode != PHY_MODE_DP) {
-		ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi);
+		ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi, &hdptx->hdmi_cfg);
 		if (ret) {
 			dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
 		} else {
-			hdptx->hdmi_cfg.rate = opts->hdmi.tmds_char_rate;
-			hdptx->hdmi_cfg.bpc = opts->hdmi.bpc;
 			hdptx->restrict_rate_change = true;
+			dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
+				hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
 		}
 
-		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
-			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
 		return ret;
 	}
 
@@ -1819,7 +1821,7 @@ static int rk_hdptx_phy_validate(struct phy *phy, enum phy_mode mode,
 	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
 
 	if (mode != PHY_MODE_DP)
-		return rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi);
+		return rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi, NULL);
 
 	return rk_hdptx_phy_verify_dp_config(hdptx, &opts->dp);
 }
@@ -1959,12 +1961,11 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 		struct phy_configure_opts_hdmi hdmi = {
 			.tmds_char_rate = rate,
 		};
-		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
+
+		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi, &hdptx->hdmi_cfg);
 
 		if (ret)
 			return ret;
-
-		hdptx->hdmi_cfg.rate = rate;
 	}
 
 	/*

-- 
2.50.0


