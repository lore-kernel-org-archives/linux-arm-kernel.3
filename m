Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DD3C02195
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksgaCjHXcNTsY42mVRcdo2AzL+mmzyJ8+XW8+N+WA34=; b=F3yA46Y2IDKlDhXGA93MKnpqDB
	MM3VQ7win6BkYDlIqgG1oyK24h/EIAuB3k3p+ix10C97A4S9wNLtTAmBEfqjqPrL45P5+0Jxs2+FJ
	C9tw0WyIyVMCl/2jZLq4jm5qCxW3Y/MLh/DqfnlebcJ4wnhkUxlodN97snGEucMPmlJelLtyv6OLg
	pYwWdW7JmwAUfGYQWCUaeZAiXklGuDYIUWdswN7irv47OCDHi7b6Lzqsa7bOpKyVHPKIHMlPFnryh
	XhVNnjc2xp0HM5XoviOFRLSyGfMpjQr8CvKfg0bDQ7NpQ+ZhmoFYYx/coGSoddOQ8PgTjO8owJMpu
	Car/mQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tco6I-00000005GNs-0RST;
	Tue, 28 Jan 2025 16:06:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnp6-00000005CHD-23iA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ksgaCjHXcNTsY42mVRcdo2AzL+mmzyJ8+XW8+N+WA34=; b=xuhKidjns8i42OiR8OCyzb21qU
	18Uy4KhSwZWUVfZaXMnJvQiLy+NSKXzHy80rnOLdW24JroeHl5N7oePrh5BzH7nb6yol3fJt5aqd7
	RwtKehCd4lPyVBctJYRZorSWNpDozn8N+dYQ3U5rDQMJiR5P2C1F/U0G+Xpb9B8/tQY6/qNdhcqXB
	8AQeB0p26LVzeIHA0L2i8us1sWj190mNZbOwOcfUkhOmEjI5pqynpviFe9Xf5+n9LMYMmiRBJuMi2
	G8Zk9e1+Lkoe382NKvUt7p/986A2ZQXDAZc+zps5ADyBEe/UlTYx8QZyH3HULiOCdD7NwCFOw6d7u
	hc3rSciQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39556 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnp2-0007WS-12;
	Tue, 28 Jan 2025 15:48:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnoi-0037HQ-Hc; Tue, 28 Jan 2025 15:47:56 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	 Vladimir Oltean <olteanv@gmail.com>,
	 Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH RFC net-next 14/22] net: stmmac: remove old EEE methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnoi-0037HQ-Hc@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:56 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074820_682059_9DF337A6 
X-CRM114-Status: GOOD (  10.49  )
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

As we no longer call the set_eee_mode(), reset_eee_mode() and
set_eee_lpi_entry_timer() methods, remove these and their glue in
common.h

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 13 ---------
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 29 -------------------
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 15 ----------
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 10 -------
 4 files changed, 67 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 622f5ef241d4..7900bf3effa7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -362,17 +362,6 @@ static int dwmac1000_set_lpi_mode(struct mac_device_info *hw,
 	return 0;
 }
 
-static void dwmac1000_set_eee_mode(struct mac_device_info *hw,
-				   bool en_tx_lpi_clockgating)
-{
-	dwmac1000_set_lpi_mode(hw, STMMAC_LPI_FORCED, en_tx_lpi_clockgating, 0);
-}
-
-static void dwmac1000_reset_eee_mode(struct mac_device_info *hw)
-{
-	dwmac1000_set_lpi_mode(hw, STMMAC_LPI_DISABLE, false, 0);
-}
-
 static void dwmac1000_set_eee_pls(struct mac_device_info *hw, int link)
 {
 	void __iomem *ioaddr = hw->pcsr;
@@ -514,8 +503,6 @@ const struct stmmac_ops dwmac1000_ops = {
 	.set_umac_addr = dwmac1000_set_umac_addr,
 	.get_umac_addr = dwmac1000_get_umac_addr,
 	.set_lpi_mode = dwmac1000_set_lpi_mode,
-	.set_eee_mode = dwmac1000_set_eee_mode,
-	.reset_eee_mode = dwmac1000_reset_eee_mode,
 	.set_eee_timer = dwmac1000_set_eee_timer,
 	.set_eee_pls = dwmac1000_set_eee_pls,
 	.debug = dwmac1000_debug,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index ed42e1477cf8..cc4ddf608652 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -418,21 +418,6 @@ static int dwmac4_set_lpi_mode(struct mac_device_info *hw,
 	return 0;
 }
 
-static void dwmac4_set_eee_mode(struct mac_device_info *hw,
-				bool en_tx_lpi_clockgating)
-{
-	/* Enable the link status receive on RGMII, SGMII ore SMII
-	 * receive path and instruct the transmit to enter in LPI
-	 * state.
-	 */
-	dwmac4_set_lpi_mode(hw, STMMAC_LPI_FORCED, en_tx_lpi_clockgating, 0);
-}
-
-static void dwmac4_reset_eee_mode(struct mac_device_info *hw)
-{
-	dwmac4_set_lpi_mode(hw, STMMAC_LPI_DISABLE, false, 0);
-}
-
 static void dwmac4_set_eee_pls(struct mac_device_info *hw, int link)
 {
 	void __iomem *ioaddr = hw->pcsr;
@@ -448,11 +433,6 @@ static void dwmac4_set_eee_pls(struct mac_device_info *hw, int link)
 	writel(value, ioaddr + GMAC4_LPI_CTRL_STATUS);
 }
 
-static void dwmac4_set_eee_lpi_entry_timer(struct mac_device_info *hw, u32 et)
-{
-	dwmac4_set_lpi_mode(hw, STMMAC_LPI_TIMER, false, et & STMMAC_ET_MAX);
-}
-
 static void dwmac4_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 {
 	void __iomem *ioaddr = hw->pcsr;
@@ -1214,9 +1194,6 @@ const struct stmmac_ops dwmac4_ops = {
 	.set_umac_addr = dwmac4_set_umac_addr,
 	.get_umac_addr = dwmac4_get_umac_addr,
 	.set_lpi_mode = dwmac4_set_lpi_mode,
-	.set_eee_mode = dwmac4_set_eee_mode,
-	.reset_eee_mode = dwmac4_reset_eee_mode,
-	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
@@ -1259,9 +1236,6 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_umac_addr = dwmac4_set_umac_addr,
 	.get_umac_addr = dwmac4_get_umac_addr,
 	.set_lpi_mode = dwmac4_set_lpi_mode,
-	.set_eee_mode = dwmac4_set_eee_mode,
-	.reset_eee_mode = dwmac4_reset_eee_mode,
-	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
@@ -1306,9 +1280,6 @@ const struct stmmac_ops dwmac510_ops = {
 	.set_umac_addr = dwmac4_set_umac_addr,
 	.get_umac_addr = dwmac4_get_umac_addr,
 	.set_lpi_mode = dwmac4_set_lpi_mode,
-	.set_eee_mode = dwmac4_set_eee_mode,
-	.reset_eee_mode = dwmac4_reset_eee_mode,
-	.set_eee_lpi_entry_timer = dwmac4_set_eee_lpi_entry_timer,
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 51c37a1180ac..a6d395c6bacd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -449,17 +449,6 @@ static int dwxgmac2_set_lpi_mode(struct mac_device_info *hw,
 	return 0;
 }
 
-static void dwxgmac2_set_eee_mode(struct mac_device_info *hw,
-				  bool en_tx_lpi_clockgating)
-{
-	dwxgmac2_set_lpi_mode(hw, STMMAC_LPI_FORCED, en_tx_lpi_clockgating, 0);
-}
-
-static void dwxgmac2_reset_eee_mode(struct mac_device_info *hw)
-{
-	dwxgmac2_set_lpi_mode(hw, STMMAC_LPI_DISABLE, false, 0);
-}
-
 static void dwxgmac2_set_eee_pls(struct mac_device_info *hw, int link)
 {
 	void __iomem *ioaddr = hw->pcsr;
@@ -1536,8 +1525,6 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.set_umac_addr = dwxgmac2_set_umac_addr,
 	.get_umac_addr = dwxgmac2_get_umac_addr,
 	.set_lpi_mode = dwxgmac2_set_lpi_mode,
-	.set_eee_mode = dwxgmac2_set_eee_mode,
-	.reset_eee_mode = dwxgmac2_reset_eee_mode,
 	.set_eee_timer = dwxgmac2_set_eee_timer,
 	.set_eee_pls = dwxgmac2_set_eee_pls,
 	.debug = NULL,
@@ -1594,8 +1581,6 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.set_umac_addr = dwxgmac2_set_umac_addr,
 	.get_umac_addr = dwxgmac2_get_umac_addr,
 	.set_lpi_mode = dwxgmac2_set_lpi_mode,
-	.set_eee_mode = dwxgmac2_set_eee_mode,
-	.reset_eee_mode = dwxgmac2_reset_eee_mode,
 	.set_eee_timer = dwxgmac2_set_eee_timer,
 	.set_eee_pls = dwxgmac2_set_eee_pls,
 	.debug = NULL,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 7279d30d6a8b..27c63a9fc163 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -369,10 +369,6 @@ struct stmmac_ops {
 	int (*set_lpi_mode)(struct mac_device_info *hw,
 			    enum stmmac_lpi_mode mode,
 			    bool en_tx_lpi_clockgating, u32 et);
-	void (*set_eee_mode)(struct mac_device_info *hw,
-			     bool en_tx_lpi_clockgating);
-	void (*reset_eee_mode)(struct mac_device_info *hw);
-	void (*set_eee_lpi_entry_timer)(struct mac_device_info *hw, u32 et);
 	void (*set_eee_timer)(struct mac_device_info *hw, int ls, int tw);
 	void (*set_eee_pls)(struct mac_device_info *hw, int link);
 	void (*debug)(struct stmmac_priv *priv, void __iomem *ioaddr,
@@ -478,12 +474,6 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, get_umac_addr, __args)
 #define stmmac_set_lpi_mode(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, set_lpi_mode, __args)
-#define stmmac_set_eee_mode(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, set_eee_mode, __args)
-#define stmmac_reset_eee_mode(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, reset_eee_mode, __args)
-#define stmmac_set_eee_lpi_timer(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, set_eee_lpi_entry_timer, __args)
 #define stmmac_set_eee_timer(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_eee_timer, __args)
 #define stmmac_set_eee_pls(__priv, __args...) \
-- 
2.30.2


