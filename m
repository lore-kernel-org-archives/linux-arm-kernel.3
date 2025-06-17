Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8994DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjrUcEdd1CSVr2DGxYk7OT+sXh1B5VIVS3Y+LC0hrdM=; b=g5mnTG/EH8O59BcVoZNyzNanzL
	PsZqAf2OMPXXReSQXVcQyJ7YhiWwe2vj7vzRiQCElBR2SqduccGtXTkNY7d7qpIPkMsAHQJlw0mfb
	HJrtDiAOiH2HCrcp2VU5DU7Gt6sgQul9b5rXxfIUvPG/lPL29GOfew5R+cdPQmC+jj5zDwatyPuP1
	U3aQI+eZOgrTpPwQUKHNtuQA6xQY+PhdQY2Q3vTa2PbGNzV85BmdkdGsVrXkKbNMrVdEIuz0c3n5M
	hdBmjlGFXph7y1ooN5yZ0+e83OC8Sp5S/2k3d2N4F8x87wyidFzaq1lKwIc1sfKenDER8cEhnA2Zu
	jZ3c11mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSVa-00000006j2w-0k8m;
	Tue, 17 Jun 2025 09:21:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSI4-00000006gxz-36Uk;
	Tue, 17 Jun 2025 09:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=rjrUcEdd1CSVr2DGxYk7OT+sXh1B5VIVS3Y+LC0hrdM=; b=pzhDW7qj3Tuj+eF+TqA+dPCkcs
	fzH4aauh7HxhjoONc2hK2CU9NCE/iTiREZ7SkYO7jtLRG8kJg9b4EVz4cSRyfcOSX3a8F62eqRPKY
	4jccw5SEEFMKr7yyjQOyzkjbiPbb5LNNuA+h88jwFnVY1VIouA1+R6679IQTJ1E3V2vVO7m1e0Ivi
	LmlQCeunDPcIprjouKR+sGlfbk0tt6kE3JvlUMFUtQAew/OOTKXEYTJOm9isCtkK2oYHLclrpEKJZ
	uQckkVg1yriZ7JDcw2uePhV2QqVuJiL3ciFpPCoxbc/WGEDx+zXwuH5+35hDp3zO8OnjePiASEO+q
	XGJZfzXg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSI0-00000003kjo-3ztR;
	Tue, 17 Jun 2025 09:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8652E5C63FF;
	Tue, 17 Jun 2025 09:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81874C4CEE3;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151247;
	bh=d+dyV6+8o/m9hnxTruh+bX3GYcHKO9kkCoHEp8YpTPw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=udjkKEhZiBJZXRaQOIi+Kte9fF0f4tojEXCYaBXhs52QIkY4vLi1MXUfqt+y5gmU4
	 4I/90PaR13m07oNHCZG1XpE/ojqRL9Jq+HBqOysop/AiZ2KbsN/6L/MzHZH8nwKrs1
	 NYuAVTKL9jAYVb7x73jcwMf13xSiLhIUhk4PL2wP5z9YyNVN+7ROcacESHhNo27djh
	 vg3Wvv1h27kzTGlk62k4yoZW11YspUA6dd5s5LX3j+mLLghQCRy9RgiXqU4sDXofxH
	 fUs+cau/opTrtqqoo1Y+JLSJmXDFsPeIfF5NhY4Guzej92eDbFZhcSAulBkYTw/Ll/
	 q0UNJzToEpMXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D6BC7115B;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Jun 2025 10:54:45 +0200
Subject: [PATCH 4/5] phy: rockchip: phy-rockchip-inno-csidphy: add support
 for rk3588 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v1-4-84eb3b2a736c@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750150493; l=2785;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=wIvkTfx5p7asQqRE6ZowFTwrVX3fTKBqDPaE5VUrGmU=;
 b=WUajPaJyRXJCRO4z/Nr5IJPT1r7i6jSpEW5MfqDZyghW5BslEBXEeXgkw8ocDJ/cjV0k5YCaF
 IwbJL6eadG5A9FtESWu4ZkEHmOs6FBS7pB33AHWXWk914T8WAf+PxMY
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_100733_427070_56799A8D 
X-CRM114-Status: GOOD (  13.72  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip RK3588 MIPI CSI-2 DPHY can be supported using the existing
phy-rockchip-inno-csidphy driver, the notable differences being
 - the control bits in the GRF
 - the additional reset line
Add support for this variant.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 75533d071025..0840be668bfd 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -30,6 +30,8 @@
 #define RK3568_GRF_VI_CON0		0x0340
 #define RK3568_GRF_VI_CON1		0x0344
 
+#define RK3588_CSIDPHY_GRF_CON0		0x0000
+
 /* PHY */
 #define CSIDPHY_CTRL_LANE_ENABLE		0x00
 #define CSIDPHY_CTRL_LANE_ENABLE_CK		BIT(6)
@@ -115,6 +117,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3568_GRF_VI_CON0, 1, 8),
 };
 
+static const struct dphy_reg rk3588_grf_dphy_regs[] = {
+	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 0),
+	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 4),
+	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 1, 8),
+};
+
 struct hsfreq_range {
 	u32 range_h;
 	u8 cfg_bit;
@@ -373,6 +381,15 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.grf_regs = rk3568_grf_dphy_regs,
 };
 
+static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
+	.pwrctl_offset = -1,
+	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
+	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
+	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
+	.grf_regs = rk3588_grf_dphy_regs,
+};
+
 static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 	{
 		.compatible = "rockchip,px30-csi-dphy",
@@ -394,6 +411,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 		.compatible = "rockchip,rk3568-csi-dphy",
 		.data = &rk3568_mipidphy_drv_data,
 	},
+	{
+		.compatible = "rockchip,rk3588-csi-dphy",
+		.data = &rk3588_mipidphy_drv_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_inno_csidphy_match_id);
@@ -435,7 +456,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->pclk);
 	}
 
-	priv->rst = devm_reset_control_get(dev, "apb");
+	priv->rst = devm_reset_control_array_get(dev, RESET_CONTROL_EXCLUSIVE);
 	if (IS_ERR(priv->rst)) {
 		dev_err(dev, "failed to get system reset control\n");
 		return PTR_ERR(priv->rst);

-- 
2.39.5



