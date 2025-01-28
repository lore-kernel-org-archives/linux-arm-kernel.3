Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35356C02190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07l2JUwowhU6Kds29hM9ev3VTddwmEBKcHtBEEd7LSM=; b=Hf1bfBZJuOI5V3V19xIbdIlv7t
	OKbWVIlVIgSas/hJ+as2H3bCmeugDQUeFKnA+CX3FknhieiVLsoXW/FTE3n3i2NHMYbUG0q5ElpmT
	qLUJg49K/pqj/Ia5zMhZlPmAVsBrFKVaS2S1c1+XnzH09CRBJAdmGURj+Z29UYeXRfx5VhpHhxgwQ
	T1f2RmqcPRLeHXwzo9KtEfnL74eus6uPQhyopHC8MZZHyQ+ITTYqpBVAjqAxATMlbX4NP+r3vkqtG
	zhfP04D01Ckn1WljBGmiKg+gzE33Sfmx5Aw6/I3HV2MWw1ITnO3/fG14DDmkiqSKTydz57TFsCFmf
	h+TbiFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnrq-00000005D3J-2LCz;
	Tue, 28 Jan 2025 15:51:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnoC-00000005C1V-2QNr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=07l2JUwowhU6Kds29hM9ev3VTddwmEBKcHtBEEd7LSM=; b=QuUz8KNS2b6kxIsPGQp11LQfmn
	pQRbY8a2C6byP0dgrbIZWs317/4ADiqxGskxjCzS39sMG2xNWELMEdH5tiIv8dwvEYgKWok05QEQO
	Ya6CWQFJk//ANio8eNOinoMfWBIP2h6FmoKJycxpD94EkMjQNsyJP3ezgCViN0uAICmN5+uFamFM0
	BD+Yh9JXnxANzTf8e6qdCqMsOhnbLUeilkFbelf69Xi5UMdMlhLOIzLqvuoDwTYtZNUVm+pD7ykVY
	42Fq3M1oJgqP+UcZJwWYZ3Vwj8r2mLEbtePI10gkcL1AdlPnxb8wkRQT1eGQmhs/e3JEjJha/zvEY
	bssGk1/Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49236 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcno7-0007TJ-2S;
	Tue, 28 Jan 2025 15:47:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnno-0037GK-7U; Tue, 28 Jan 2025 15:47:00 +0000
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
Subject: [PATCH RFC net-next 03/22] net: stmmac: dwmac4: ensure LPIATE is
 cleared
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnno-0037GK-7U@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:00 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074724_614687_60A0F8B4 
X-CRM114-Status: GOOD (  13.50  )
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

LPIATE enables the hardware timer for entering LPI mode. To sure that
the correct mode is used, clear LPIATE when using manual/software-timed
mode to prevent the hardware using the timer.

stmmac_main.c avoids this being a problem at the moment by calling
stmmac_set_eee_lpi_timer(..., 0) before switching to software mode.

We no longer need to call stmmac_set_eee_lpi_timer(..., 0) when
disabling EEE as stmmac_reset_eee_mode() will now clear all LPI
settings.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 4 +++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 9ed8620580a8..17bf836eba7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -387,6 +387,7 @@ static void dwmac4_set_eee_mode(struct mac_device_info *hw,
 	 * state.
 	 */
 	value = readl(ioaddr + GMAC4_LPI_CTRL_STATUS);
+	value &= ~GMAC4_LPI_CTRL_STATUS_LPIATE;
 	value |= GMAC4_LPI_CTRL_STATUS_LPIEN | GMAC4_LPI_CTRL_STATUS_LPITXA;
 
 	if (en_tx_lpi_clockgating)
@@ -401,7 +402,8 @@ static void dwmac4_reset_eee_mode(struct mac_device_info *hw)
 	u32 value;
 
 	value = readl(ioaddr + GMAC4_LPI_CTRL_STATUS);
-	value &= ~(GMAC4_LPI_CTRL_STATUS_LPIEN | GMAC4_LPI_CTRL_STATUS_LPITXA);
+	value &= ~(GMAC4_LPI_CTRL_STATUS_LPIATE | GMAC4_LPI_CTRL_STATUS_LPIEN |
+		   GMAC4_LPI_CTRL_STATUS_LPITXA);
 	writel(value, ioaddr + GMAC4_LPI_CTRL_STATUS);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7480825389e9..e6a6aaa74185 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -493,7 +493,6 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 			netdev_dbg(priv->dev, "disable EEE\n");
 			priv->eee_sw_timer_en = false;
 			del_timer_sync(&priv->eee_ctrl_timer);
-			stmmac_disable_hw_lpi_timer(priv);
 			stmmac_reset_eee_mode(priv, priv->hw);
 			stmmac_set_eee_timer(priv, priv->hw, 0,
 					     STMMAC_DEFAULT_TWT_LS);
-- 
2.30.2


