Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999C3C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNFqA3+Nw6GvLgCDAt36lni//r7MMRQPT9N/OXmnuW4=; b=hQ4+iBq3xJarc+hEhOmO2z8P6l
	zGZLvWhlROQy8DWpYQ5FxtFYzL7TMbeihhH+HQvbsnIAltSiTjIMg+KfPPixIh7jowM0I4NcSA71b
	1MCohDIuTpGw+RAUeMFolIYHrusD9THc3s4PpomLJ3nDHdMpdUi972+h+v8F7eAhBNDFUXT3xksL6
	+xQkHUrZGvAneCQWNZXumVRlRJH0cNNt0azXGASdrqfRhsM4b6O6fz4+pUAjpXg8I9viLLKHhv0WO
	ZprE4AmPhxkGx5MsF4tNbHW2M7ti7RI2aMo1ThQcXTQqwMFWmhZzNEmGxvlcOy1OoGcHuq/4LgLOs
	NS4BaS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4t-00000004Wia-1gKd;
	Tue, 04 Mar 2025 12:08:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPwC-00000004Hjl-3thY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZNFqA3+Nw6GvLgCDAt36lni//r7MMRQPT9N/OXmnuW4=; b=FivH1/OBGc7gy5gzL+3Q7u+867
	iLmMa3hIffL2Bl4INg87T+QtW9bV1B6GI557lP63Ae2bUkZHUPwYFFHPQwJuB91Djpc16NpX4drDF
	OP0VBGYGJiGfdIUzICNnPoWBM9FacD9rGR13x3bB/CAZFnjg2aZsyQdE96KtsTCCLkwEbX+Tc+S6o
	tGN29UMjz2j7gJba1UGVpCzcgcjK1CUqfOb1O07a0qaOY+ZUCdvsL40bNEVDvclS0rKM+xPacH2D2
	ar3b/J0QypYvJnTew6hMRef5o5GhMCYmxPUccDTSAzIxav4fCf1C1EPtvwN1TxGUS9AYyO0Lu4tHH
	vceDHLKg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34928 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tpPu9-0002Uh-0r;
	Tue, 04 Mar 2025 10:53:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tpPtp-005SoU-7N; Tue, 04 Mar 2025 10:53:21 +0000
In-Reply-To: <Z8bbnSG67rqTj0pH@shell.armlinux.org.uk>
References: <Z8bbnSG67rqTj0pH@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>,
	 Thierry Reding <treding@nvidia.com>,
	 "Lad,
	 Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 1/3] net: phylink: add config of PHY receive
 clock-stop in phylink_resume()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tpPtp-005SoU-7N@rmk-PC.armlinux.org.uk>
Date: Tue, 04 Mar 2025 10:53:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025548_962327_6256ED1C 
X-CRM114-Status: GOOD (  12.33  )
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

Add configuration of the receive clock-stop in phylink_resume() to
ensure that the clock-stop is correctly configured.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a3b186ab3854..0aae0bb2a254 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2264,7 +2264,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	pl->mac_tx_clk_stop = phy_eee_tx_clock_stop_capable(phy) > 0;
 
 	if (pl->mac_supports_eee_ops) {
-		/* Explicitly configure whether the PHY is allowed to stop it's
+		/* Explicitly configure whether the PHY is allowed to stop its
 		 * receive clock.
 		 */
 		ret = phy_eee_rx_clock_stop(phy,
@@ -2645,8 +2645,22 @@ EXPORT_SYMBOL_GPL(phylink_suspend);
  */
 void phylink_resume(struct phylink *pl)
 {
+	int ret;
+
 	ASSERT_RTNL();
 
+	if (pl->mac_supports_eee_ops && pl->phydev) {
+		/* Explicitly configure whether the PHY is allowed to stop its
+		 * receive clock on resume to ensure that it is correctly
+		 * configured.
+		 */
+		ret = phy_eee_rx_clock_stop(pl->phydev,
+					    pl->config->eee_rx_clk_stop_enable);
+		if (ret == -EOPNOTSUPP)
+			phylink_warn(pl, "failed to set rx clock stop: %pe\n",
+				     ERR_PTR(ret));
+	}
+
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
 
-- 
2.30.2


