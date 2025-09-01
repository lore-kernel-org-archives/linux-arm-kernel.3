Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C227DCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1Tg3csBW9cQH+zLeCwL9eBjnzF/5yA0NVOKjcXCN0U=; b=oepY3k3oen0q2+4Le2ykcQIZxa
	qeZyiunX95shHKDxEzrckZJpGKQ18N+ZutXOGS0oLvnwgiRO3w0BUShE2pFugIW+6CmyEpQ40PCyV
	YbDexGA6SBnZmagfMdETPRo8R7o6RbpH1OOBZpOM/mvfA1K+nE7oKEiGoFpypiCa3Mmq0qdZX2OU1
	PT7k1Av3I4kbpdHuGgVP7BSUuqoTV/LhNwc4vIjiu2f5wR1z1dMg5Gb6cBr96lB03tv1fAxZb7mZI
	6fk3mTHcwvhnmZWIeIZl7i4DvtI8BUoJPR3SbiSdxjmCGflS1gLTqIdSYwwSFeyEPio8vswub33vZ
	kpzpGYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDv5-0000000ELuc-0v3X;
	Mon, 01 Sep 2025 23:26:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBez-0000000DttR-42QH;
	Mon, 01 Sep 2025 21:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A652451DF;
	Mon,  1 Sep 2025 21:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA3BFC116B1;
	Mon,  1 Sep 2025 21:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760513;
	bh=Gc8hKhZmvez+1R7qBtxkfGOQDqE59bJ02H/Yc1b0Phs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SJMuyCskelQfVc3zUjKQg18B8fejhiYYVgzVVu7Rg66NpinGhIHgVT17//kcu8cL3
	 74bhTAgwVZCXVzDxM7+XhB7AeOe2CfDCXPKXZALJLydAhnOprfWPNgSaeeKeqrhGlY
	 pQYDhUcmKvHEjwQrzLr+zHzTRahxebuO1lW2iqMhivNgxfnjJw5TNdPo41WfHaOLx1
	 8RWuXWfvGKu+dUODLSfnreJ1/p3lq9QeHt0ZUg9Emt+c6OnTzMzhvAlUeJ6qQH4QPG
	 SwtB5vhU/3OuNlIEQcX98dz9NqadXA3Lx9cHARWIBm3cJEt2sXbBLj11Vog0Mzn8Nw
	 vIuxPV9S1LKPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B50CA1005;
	Mon,  1 Sep 2025 21:01:52 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Mon, 01 Sep 2025 22:47:47 +0200
Subject: [PATCH v3 6/7] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3588 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v3-6-a5ccd5f1f438@collabora.com>
References: <20250616-rk3588-csi-dphy-v3-0-a5ccd5f1f438@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v3-0-a5ccd5f1f438@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756759662; l=2783;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=yeQXRqZNa57y0uWiIJSkXVpQ6zTLhd7z989yNwE9ju8=;
 b=axGHdEEOobUeI3zoNKyi3w/BvIeQnc8c0vieQuJvuILqmfq0hDhf2j9lz4n1HHC+mpZpcMGlQ
 sfnI99iovo6Aet9/dP2floam3L5KHcJtMU5lA8hHcrkYTxJ+rk2qwrA
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_140154_102103_547FB031 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 6c4ddcd7e5de..c79fb53d8ee5 100644
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
@@ -117,6 +119,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
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
@@ -183,6 +191,11 @@ static const char *const rk3368_reset_names[] = {
 	"apb"
 };
 
+static const char *const rk3588_reset_names[] = {
+	"apb",
+	"phy"
+};
+
 static void rockchip_inno_csidphy_ths_settle(struct rockchip_inno_csidphy *priv,
 					     int hsfreq, int offset)
 {
@@ -390,6 +403,17 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
+static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
+	.pwrctl_offset = -1,
+	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
+	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
+	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
+	.grf_regs = rk3588_grf_dphy_regs,
+	.resets = rk3588_reset_names,
+	.resets_num = ARRAY_SIZE(rk3588_reset_names),
+};
+
 static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 	{
 		.compatible = "rockchip,px30-csi-dphy",
@@ -411,6 +435,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
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

-- 
2.39.5



