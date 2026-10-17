Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9042CCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 05:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufvOefWhgYH0/UBXiQmCrndB2RGKCn2LAdl5KbhcjzI=; b=1hQxfgiQVAOjoROI4x0aX/XX/w
	6F4mhOSh6o2DBIPMJFmgulSvHYes1FqumzQaW/pZF543j0lYFHl3KH8JoOR5wcAxN5dWCdX35OcbT
	m/wXbEKmx1RRu0sZRx3RizF/pNUuNTKl2Dg/SU/Mv5Cd8iu2kRTz/qqUwRZOtG5+rJtAkoUIjbXEr
	/BjCr7e8NDDxZHr51AkmVw+WOXuw01bwtJZkB5wk7mSlDx+dlWg+AsGSnlgS4ZaqqFZrXFjOIcoZo
	h+JX5crvYIPUx4iwOudtUQASRfNWIPe+7mwb+yDvhL94AvxTvvv4hWdpPF5wRtEEL3ulf6aGScylW
	VjELw8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxES-00000004SeF-2p00;
	Sat, 17 Oct 2026 05:45:24 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxEN-00000004SZ6-1cKk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 05:45:23 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3ac803d3bafso17728a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 22:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215918; x=1792820718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufvOefWhgYH0/UBXiQmCrndB2RGKCn2LAdl5KbhcjzI=;
        b=i693lNgskVjFw2fai0W4HUg/+bNqfKRVlQuCfC7Av3GTX4VwonUkBZjjx9H87QtF+E
         iCQ6MgVp3+Q420qwfI3/rZ9ybf8e8ZMcPGlJKz9bdzBV/QJY3CK1YJXjACve8GJYWJvL
         7itYKbJbNAgzhfdY6hx2BnjRVnBX+4IdVTOxkBwLS+RKJpr7sHRGSw0GjiQW85zlduT/
         rFjLdbrxMxHc5L1w6QQoZ2wGyr5fKMS3rs6auRZILNdzyQU6iik8tjFjTDbz1pCdqa7o
         oxnTOF1TE6+ctPMErqsdWPL1nEHEuhOKvBugI7LwvwReM7I+I2PkDdc9Li+0K1LisdrT
         vuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215918; x=1792820718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufvOefWhgYH0/UBXiQmCrndB2RGKCn2LAdl5KbhcjzI=;
        b=qiLKBGqzpBZVIPwuo6m95XWdm/QA730/ujLrSFuZeFUqmk5xiQscwx9n8MstOO3Jhv
         oPCq+haiJQfRwLPXLTo6HMvh+XxqIlmhf5nAblvHiH8geR/JfNpa/CHi+4i0CNSmDjq4
         KQhbv/iq/syW/D2iwjXtQZcBqWT9DOrqHS759qIEO0J9zQ4Km/1FGQjmNSOytCJaDH8a
         2ixI/4aPZptS+xUKcwFvTGoommOn0NkesHW5ppV6Qg+Ve24RQDJPFES3BsbQDu6xAlKT
         W3H3my8RQ9Ri9yfsjmEgE9UX7KQ4W17vjLsa1c745+cnoS7QEK8WQuevp6jFcERjqyi9
         0HSg==
X-Forwarded-Encrypted: i=1; AKwUvBxnkh3IvDOjGL/Gd9rai563EV+ZaQVaA08T5amJFi03rURAnBc6heg+N1i12y1TAUiG8Pppu0pFzvznkmHsru6W@lists.infradead.org
X-Gm-Message-State: AFq9FYITrJ8G2Zlapm1crQzqP3m3yxcvbYt270bGJcQ7u3oNbeEGA3dn
	JTShdU1eGpHXXCa+KcypuXdiZRlW8HntAyidQDjvu2OHeUHZ9L9EWJOZ
X-Gm-Gg: AYBFou2Z0ysrMa5/d+d8ZwAL8TpRZhE7l+Z0qk7Jq5BtzpM/FRl9IMaygCiHnOB4jtT
	Qjy3KFc134HWzQWjvF7hHmLJbGPWaLTNUsE+SXoUDYWPfRuX9EgcgcalEB89W1MyKINh6QrSSUZ
	oRR9rqHAEUiMy2mAio66zELH9G52/7MyeIcdxTPtDwNJxTygVX7XNn0t0OLQWfLRDHg6+WYaymj
	huoi8+nBwYEGoqiRDckvNKz8EgLWTwS4Mttlqekp+gOAkaeghOp5+AM7HyklzQS98Ge5NE8pUrf
	VuVgNk9qlqozo2lAHYXowxBGMDArOnXXp8UnLBBFwT1dqUbXcnUaALgam89qb1EssyfJZNEvDkq
	Z7FonvmQZBwZpcA1Rl9cPJY3nWaBARAYQr/V3WqiBkeBPpa/vHvLpxdiPszMfs4BB9SNxFr8z9o
	DVU7f2743mktLvrKXy7giusZAlAsd7aXujelTFUFFkhVA2jmi5T/kTyXUJq8+GGDIOmjPBpbc9l
	DQWiLE=
X-Received: by 2002:a05:6a20:c5aa:b0:3e0:c346:734a with SMTP id adf61e73a8af0-3e225f6c9b6mr1019029637.11.1792215918388;
        Fri, 16 Oct 2026 22:45:18 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:45:17 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v12 5/6] net: stmmac: dwmac-rk: add SGMII support for RK3568
Date: Sat, 17 Oct 2026 13:44:03 +0800
Message-ID: <20261017054406.1828061-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_224520_213945_F8214EEF 
X-CRM114-Status: GOOD (  33.22  )
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

The RK3568 SoC integrates a Synopsys DesignWare XPCS that can be
connected to GMAC0 or GMAC1 in SGMII mode.  Add the necessary glue
logic to support this configuration.

The current dwmac-rk driver does not support SGMII mode.  SGMII
requires a PCS to handle auto-negotiation and link state reporting,
but the existing driver only supports RGMII and RMII.

Add a set_to_sgmii() callback to configure the GMAC GRF register for
SGMII mode (bit 7 set, interface selection bits 4:6 ignored when set).
Also add a set_to_rmii() callback for rk3568 to explicitly clear bit 7,
since the new SGMII path leaves it set and the RMII branch previously
relied on the SoC reset value.

Provide pcs_init/pcs_exit callbacks to create/destroy the XPCS via
xpcs_rk_create() from the Rockchip XPCS platform driver, and a
select_pcs callback to return the XPCS to phylink.  The MII port passed
to xpcs_rk_create() is the GMAC id (bsp_priv->id): GMAC0 maps to port 0,
GMAC1 maps to port 1, matching the hardware routing.

SGMII is not added to rk_get_interfaces(): it comes from the XPCS's own
supported_interfaces, merged by stmmac_phylink_setup().

The SerDes PHY and the PD_PIPE power domain are owned by the XPCS
driver rather than managed through the stmmac
serdes_poweron/serdes_poweroff callbacks, which are legacy and meant
for single-MAC platforms. On RK3568 the XPCS is the natural owner of
the shared SerDes.

DWMAC_ROCKCHIP selects PCS_XPCS_ROCKCHIP. PCS_XPCS itself is already
selected by STMMAC_ETH, and PM is selected by ARCH_ROCKCHIP, so no
further selects are needed.

Reorder rk_gmac_powerup() so that gmac_clk_enable() is called before
the SGMII check.  The SGMII path skips rk_get_phy_intf_sel(), so the
clock must be enabled earlier to cover all register accesses in that
path.  While at it, unify the error unwinding into a single
clk_disable label and add error handling for the default (unhandled
interface) case.

SGMII In-band vs Out-of-band
============================
On RK3568, the MAC clock is fixed at 125 MHz and cannot be changed per
speed.  Out-of-band mode requires the MAC to change its clock to
125/25/2.5 MHz for 1000/100/10 Mbps respectively, which the hardware
does not support here.  The driver therefore clears rk_set_clk_tx_rate()
and the clock stays at 125 MHz.

The PCS is still told the speed in out-of-band mode (through a BMCR
write in xpcs_link_up_sgmii_1000basex()), but the MAC clock does not
follow.  At 10/100 Mbps this gives working TX and failing RX.

Enable default_an_inband for SGMII and clear rk_set_clk_tx_rate(), so
phylink uses in-band mode, where the PCS is responsible for
speed/duplex negotiation.

Note that default_an_inband can be overridden by a fixed-link node, and
phylink may also fall back to out-of-band if the PHY does not support
in-band signalling.  Out-of-band SGMII is not supported by this driver.
The only out-of-band configuration that would work is 1000BASE-X with a
fixed-link, where the MAC clock stays at 125 MHz; 10/100 Mbps gives
working TX and failing RX.  Boards must use in-band mode
(managed = "in-band-status" or an in-band capable PHY).

1000BASE-X is not enabled by this series; it may be added later if
there is a user for it.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 386)
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 131 +++++++++++++++---
 2 files changed, 112 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index e3dd5adda5aca..5088acc06982e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -170,6 +170,7 @@ config DWMAC_ROCKCHIP
 	default ARCH_ROCKCHIP
 	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
 	select MFD_SYSCON
+	select PCS_XPCS_ROCKCHIP
 	help
 	  Support for Ethernet controller on Rockchip RK3288 SoC.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 72bdbcb5e863a..c4db919ec1640 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -20,6 +20,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
+#include <linux/pcs/pcs-xpcs-rk.h>
 #include <linux/pm_runtime.h>
 
 #include "stmmac_platform.h"
@@ -47,6 +48,7 @@ struct rk_gmac_ops {
 	void (*set_to_rgmii)(struct rk_priv_data *bsp_priv,
 			     int tx_delay, int rx_delay);
 	void (*set_to_rmii)(struct rk_priv_data *bsp_priv);
+	void (*set_to_sgmii)(struct rk_priv_data *bsp_priv);
 	int (*set_speed)(struct rk_priv_data *bsp_priv,
 			 phy_interface_t interface, int speed);
 	void (*integrated_phy_powerup)(struct rk_priv_data *bsp_priv);
@@ -63,6 +65,7 @@ struct rk_gmac_ops {
 	bool clock_grf_reg_in_php;
 	bool supports_rgmii;
 	bool supports_rmii;
+	bool supports_sgmii;
 	bool php_grf_required;
 	bool regs_valid;
 	u32 regs[];
@@ -98,6 +101,7 @@ struct rk_priv_data {
 	bool integrated_phy;
 	bool supports_rgmii;
 	bool supports_rmii;
+	bool supports_sgmii;
 
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -809,6 +813,8 @@ static const struct rk_gmac_ops rk3528_ops = {
 #define RK3568_GRF_GMAC1_CON1		0x038c
 
 /* RK3568_GRF_GMAC0_CON1 && RK3568_GRF_GMAC1_CON1 */
+#define RK3568_GMAC_MODE_RMII_RGMII		GRF_CLR_BIT(7)
+#define RK3568_GMAC_MODE_SGMII_QSGMII		GRF_BIT(7)
 #define RK3568_GMAC_FLOW_CTRL			GRF_BIT(3)
 #define RK3568_GMAC_FLOW_CTRL_CLR		GRF_CLR_BIT(3)
 #define RK3568_GMAC_RXCLK_DLY_ENABLE		GRF_BIT(1)
@@ -836,6 +842,16 @@ static int rk3568_init(struct rk_priv_data *bsp_priv)
 	}
 }
 
+static void rk3568_set_to_rmii(struct rk_priv_data *bsp_priv)
+{
+	u32 con1;
+
+	con1 = (bsp_priv->id == 1) ? RK3568_GRF_GMAC1_CON1 :
+				     RK3568_GRF_GMAC0_CON1;
+
+	regmap_write(bsp_priv->grf, con1, RK3568_GMAC_MODE_RMII_RGMII);
+}
+
 static void rk3568_set_to_rgmii(struct rk_priv_data *bsp_priv,
 				int tx_delay, int rx_delay)
 {
@@ -851,19 +867,31 @@ static void rk3568_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3568_GMAC_CLK_TX_DL_CFG(tx_delay));
 
 	regmap_write(bsp_priv->grf, con1,
+		     RK3568_GMAC_MODE_RMII_RGMII |
 		     RK3568_GMAC_RXCLK_DLY_ENABLE |
 		     RK3568_GMAC_TXCLK_DLY_ENABLE);
 }
 
+static void rk3568_set_to_sgmii(struct rk_priv_data *bsp_priv)
+{
+	u32 con1;
+
+	con1 = (bsp_priv->id == 1) ? RK3568_GRF_GMAC1_CON1 :
+				     RK3568_GRF_GMAC0_CON1;
+
+	regmap_write(bsp_priv->grf, con1, RK3568_GMAC_MODE_SGMII_QSGMII);
+}
+
 static const struct rk_gmac_ops rk3568_ops = {
 	.init = rk3568_init,
+	.set_to_rmii = rk3568_set_to_rmii,
 	.set_to_rgmii = rk3568_set_to_rgmii,
+	.set_to_sgmii = rk3568_set_to_sgmii,
+
 	.set_speed = rk_set_clk_mac_speed,
 
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
 
-	.supports_rmii = true,
-
 	.regs_valid = true,
 	.regs = {
 		0xfe2a0000, /* gmac0 */
@@ -1211,6 +1239,44 @@ static void rk_phy_powerdown(struct rk_priv_data *bsp_priv)
 		dev_err(bsp_priv->dev, "fail to disable phy-supply\n");
 }
 
+static int rk_pcs_init(struct stmmac_priv *priv)
+{
+	struct rk_priv_data *bsp_priv = priv->plat->bsp_priv;
+	struct device_node *node = priv->device->of_node;
+	struct device_node *pcs_node;
+	struct dw_xpcs *xpcs;
+
+	pcs_node = of_parse_phandle(node, "pcs-handle", 0);
+	if (!pcs_node)
+		return -ENODEV;
+
+	xpcs = xpcs_rk_create(priv->device, pcs_node, bsp_priv->id);
+	of_node_put(pcs_node);
+	if (IS_ERR(xpcs))
+		return PTR_ERR(xpcs);
+
+	priv->hw->xpcs = xpcs;
+	return 0;
+}
+
+static void rk_pcs_exit(struct stmmac_priv *priv)
+{
+	if (!priv->hw->xpcs)
+		return;
+
+	xpcs_destroy(priv->hw->xpcs);
+	priv->hw->xpcs = NULL;
+}
+
+static struct phylink_pcs *rk_select_pcs(struct stmmac_priv *priv,
+					 phy_interface_t interface)
+{
+	if (!priv->hw->xpcs)
+		return NULL;
+
+	return xpcs_to_phylink_pcs(priv->hw->xpcs);
+}
+
 static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 					  struct plat_stmmacenet_data *plat,
 					  const struct rk_gmac_ops *ops)
@@ -1333,6 +1399,7 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 
 	bsp_priv->supports_rgmii = ops->supports_rgmii || !!ops->set_to_rgmii;
 	bsp_priv->supports_rmii = ops->supports_rmii || !!ops->set_to_rmii;
+	bsp_priv->supports_sgmii = ops->supports_sgmii || !!ops->set_to_sgmii;
 
 	if (ops->init) {
 		ret = ops->init(bsp_priv);
@@ -1364,6 +1431,10 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
 		if (!bsp_priv->supports_rmii)
 			return -EINVAL;
 		break;
+	case PHY_INTERFACE_MODE_SGMII:
+		if (!bsp_priv->supports_sgmii)
+			return -EINVAL;
+		break;
 	default:
 		dev_err(bsp_priv->dev,
 			"unsupported interface %d", bsp_priv->phy_iface);
@@ -1382,16 +1453,19 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	if (ret)
 		return ret;
 
+	ret = gmac_clk_enable(bsp_priv, true);
+	if (ret)
+		return ret;
+
+	if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_SGMII)
+		goto set_mode;
+
 	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
 	if (ret < 0)
-		return ret;
+		goto clk_disable;
 
 	intf = ret;
 
-	ret = gmac_clk_enable(bsp_priv, true);
-	if (ret)
-		return ret;
-
 	if (bsp_priv->gmac_phy_intf_sel_mask ||
 	    bsp_priv->gmac_rmii_mode_mask) {
 		/* If defined, encode the phy_intf_sel value */
@@ -1402,10 +1476,8 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 				      bsp_priv->gmac_rmii_mode_mask);
 
 		ret = rk_write_gmac_grf_reg(bsp_priv, val);
-		if (ret < 0) {
-			gmac_clk_enable(bsp_priv, false);
-			return ret;
-		}
+		if (ret < 0)
+			goto clk_disable;
 	}
 
 	if (bsp_priv->clock.rmii_mode_mask) {
@@ -1413,13 +1485,12 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 				     bsp_priv->clock.rmii_mode_mask);
 
 		ret = rk_write_clock_grf_reg(bsp_priv, val);
-		if (ret < 0) {
-			gmac_clk_enable(bsp_priv, false);
-			return ret;
-		}
+		if (ret < 0)
+			goto clk_disable;
 	}
 
-	/*rmii or rgmii*/
+set_mode:
+	/* rmii, rgmii, sgmii */
 	switch (bsp_priv->phy_iface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		dev_info(dev, "init for RGMII\n");
@@ -1450,15 +1521,20 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		if (bsp_priv->ops->set_to_rmii)
 			bsp_priv->ops->set_to_rmii(bsp_priv);
 		break;
+	case PHY_INTERFACE_MODE_SGMII:
+		dev_info(dev, "init for SGMII\n");
+		if (bsp_priv->ops->set_to_sgmii)
+			bsp_priv->ops->set_to_sgmii(bsp_priv);
+		break;
 	default:
 		dev_err(dev, "NO interface defined!\n");
+		ret = -EINVAL;
+		goto clk_disable;
 	}
 
 	ret = rk_phy_powerup(bsp_priv);
-	if (ret) {
-		gmac_clk_enable(bsp_priv, false);
-		return ret;
-	}
+	if (ret)
+		goto clk_disable;
 
 	pm_runtime_get_sync(dev);
 
@@ -1466,6 +1542,10 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		bsp_priv->ops->integrated_phy_powerup(bsp_priv);
 
 	return 0;
+
+clk_disable:
+	gmac_clk_enable(bsp_priv, false);
+	return ret;
 }
 
 static void rk_gmac_powerdown(struct rk_priv_data *gmac)
@@ -1605,6 +1685,17 @@ static int rk_gmac_probe(struct platform_device *pdev)
 	plat_dat->suspend = rk_gmac_suspend;
 	plat_dat->resume = rk_gmac_resume;
 
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_SGMII) {
+		/* SGMII clock always runs at 125 MHz */
+		plat_dat->set_clk_tx_rate = NULL;
+
+		/* SGMII requires a PCS */
+		plat_dat->default_an_inband = true;
+		plat_dat->pcs_init = rk_pcs_init;
+		plat_dat->pcs_exit = rk_pcs_exit;
+		plat_dat->select_pcs = rk_select_pcs;
+	}
+
 	plat_dat->bsp_priv = rk_gmac_setup(pdev, plat_dat, data);
 	if (IS_ERR(plat_dat->bsp_priv))
 		return PTR_ERR(plat_dat->bsp_priv);
-- 
2.47.3


