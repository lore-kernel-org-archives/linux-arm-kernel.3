Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6E5C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ja3ddn8Iyrr0BPUQgL0q4vghx18v/jp3QyN5ZHrPqoo=; b=rIMEkDuVw6IjQ3zNyYWPEmYYVU
	VtUE0jaDAxWq0gj8jfUuG1HPNk0jZEYB2mFxrnmUacujNClapo2TJkKBGZeGyFQKXsmVG3ylUWLpX
	acXvUdb9pYocjLXUNJIOLCvse2NCQm7kJgqKdthr3R/Xz0ePdKyO3w5ySbYwvnrLkpRpMiaeiap3P
	ELYuMCdJTpB4y+cSDsLCzZ6KbBdcQ6T51B5R3EERyJ8byYwjWaAXnDaBa0LxFbfGV555awFvKhieV
	ZqwdVpsUz/atL+M+o4pwvl8iLW95RGGA/NQN85TJfqn1OtVyL1mw8NzWw3mda4Jlr9xMQ48p6nfk3
	wPDPbKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOv8-0000000BidG-0gwL;
	Mon, 10 Aug 2026 12:15:58 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOv1-0000000BiRY-1dNl;
	Mon, 10 Aug 2026 12:15:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BB7BC0517;
	Mon, 10 Aug 2026 15:15:46 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364149; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ja3ddn8Iyrr0BPUQgL0q4vghx18v/jp3QyN5ZHrPqoo=;
	b=EupqziQltR4M0MziVrus8tmeNouchv6VjiDPgtVw/CnZ/Xkk5OjmGmZKXQgQxjIxe5sQ3e
	ghMdgnPty6SMJghCBu5sFgnJBpBB3ytSkam3ttej8Ax8rPYzoXvNwQqPqhUj3nVGHxT0j5
	X50lCTYYm3IvMiw+xO/yRsIG56vxB/Xf5KC5jNT7xBxN4asHahNXGu4Njv8e/LATX3II68
	67fwUFva8u3F81TvAh7WFmqcpKI5q3R3a1klP/uG4ji2cz+/WwEFY1AgwW50dwgLVt1s4y
	99rn7TEuKNIKNc97tgyM/URj99DByOIcWvuR++LmxFwPcZfhNxQPQQCUpB19NA==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Subject: [PATCH 05/25] net: ethernet: stmicro: stmmac: dwmac-rk: Add RV1106 support
Date: Mon, 10 Aug 2026 15:10:56 +0300
Message-ID: <20260810121121.210040-6-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051551_647522_F5AC6588 
X-CRM114-Status: GOOD (  11.36  )
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

Rockchip RV1106 GMAC 10/100 ethernet controller.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 8d7042e68926..a1bf545467cc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1034,6 +1034,60 @@ static const struct rk_gmac_ops rk3588_ops = {
 	},
 };
 
+#define RV1106_VOGRF_GMAC_CLK_CON		0X60004
+
+#define RV1106_VOGRF_MACPHY_RMII_MODE		GRF_BIT(0)
+#define RV1106_VOGRF_GMAC_CLK_RMII_DIV2		GRF_BIT(2)
+#define RV1106_VOGRF_GMAC_CLK_RMII_DIV20	GRF_CLR_BIT(2)
+
+#define RV1106_VOGRF_MACPHY_CON0		0X60028
+
+static void rv1106_set_to_rmii(struct rk_priv_data *bsp_priv)
+{
+	regmap_write(bsp_priv->grf, RV1106_VOGRF_GMAC_CLK_CON,
+		     RV1106_VOGRF_MACPHY_RMII_MODE |
+		     RV1106_VOGRF_GMAC_CLK_RMII_DIV2);
+}
+
+static int rv1106_set_speed(struct rk_priv_data *bsp_priv,
+			    phy_interface_t interface, int speed)
+{
+	unsigned int val;
+
+	if (interface != PHY_INTERFACE_MODE_RMII)
+		return 0;
+
+	if (speed == SPEED_10)
+		val = RV1106_VOGRF_GMAC_CLK_RMII_DIV20;
+	else if (speed == SPEED_100)
+		val = RV1106_VOGRF_GMAC_CLK_RMII_DIV2;
+	else
+		return -EINVAL;
+
+	regmap_write(bsp_priv->grf, RV1106_VOGRF_GMAC_CLK_CON, val);
+
+	return 0;
+}
+
+static void rv1106_integrated_phy_powerup(struct rk_priv_data *bsp_priv)
+{
+	rk_gmac_integrated_fephy_powerup(bsp_priv, RV1106_VOGRF_MACPHY_CON0);
+}
+
+static void rv1106_integrated_phy_powerdown(struct rk_priv_data *bsp_priv)
+{
+	rk_gmac_integrated_fephy_powerdown(bsp_priv, RV1106_VOGRF_MACPHY_CON0);
+}
+
+static const struct rk_gmac_ops rv1106_ops = {
+	.set_to_rmii = rv1106_set_to_rmii,
+	.set_speed = rv1106_set_speed,
+	.integrated_phy_powerup = rv1106_integrated_phy_powerup,
+	.integrated_phy_powerdown = rv1106_integrated_phy_powerdown,
+
+	.supports_rmii = true,
+};
+
 #define RV1108_GRF_GMAC_CON0		0X0900
 
 /* RV1108_GRF_GMAC_CON0 */
@@ -1628,6 +1682,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
 	{ .compatible = "rockchip,rk3576-gmac", .data = &rk3576_ops },
 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
+	{ .compatible = "rockchip,rv1106-gmac", .data = &rv1106_ops },
 	{ .compatible = "rockchip,rv1108-gmac", .data = &rv1108_ops },
 	{ .compatible = "rockchip,rv1126-gmac", .data = &rv1126_ops },
 	{ }
-- 
2.47.3


