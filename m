Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FF1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFIrQtPP73QU4OizVuDkpWxR7v/mfucuSSfwYZ7Tf/I=; b=tXz4csKx9kDziPcDL3dBlc9lkD
	UjI8LCtkZZSw8mBXPhosX4k3y6J9lj5Vm2KpSI48tcOX2yE/j+xpipK4dqHPEO2dWufcuV/oCeAPY
	Tp87FWBzMNBwkMjfjvMWvXJz/PN3mr6r894E1zaF321mV4Ob5XhjHFpmXHoctH/SXJ8LMa4Y3nqlr
	+u/iGy4D9N+s8ur1D0vtkqXOY+OPz0G+km9qGTGr7taqhBKQGv55MVAPgPuPelR89hI6TqzTWVYET
	DqVotDxNYS/58HyJJeLIgS+0qo3ny9w2X7ivGzZJiUGBlniwlBiuU0FdZ7/ZZVnTvTCzBLKznavKL
	iWGi8UhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmMZ-00000001FVq-44Aq;
	Mon, 06 Jan 2025 12:37:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmAh-00000001D80-46CZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kFIrQtPP73QU4OizVuDkpWxR7v/mfucuSSfwYZ7Tf/I=; b=mnr1paHawwFHv+iS5yPQjuCSUt
	OCj+0iRtT4T6c2iSO6+Wc/TDbGvF4GBKau1/UOaxxbrIpPDE7msYNa3e3+oGLg8/c0szHtsEFqNuU
	wNtFyre6KMDjm683BpAg8yzRRD9Zfgn3QI/FthFotFtG6R4BqxcOfrDMJpcohNG1OZUW/JjROyfsA
	PdVfDlDPPgIgMF1GOzonFtgv1K5i9aZEzMDGaofTNYwheWRZ02YewJDpLVU5BYvMmxVZ+Tx6xco9v
	9DGFM0q52k2sJqKi1hRB+Kev/LrG3xlznUWfhdte0Df3/ptGZIWQOydBvMWd9HQY8CyjMrOSfqUON
	rGlZjzsg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40256 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUmAc-0005rv-1B;
	Mon, 06 Jan 2025 12:25:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUmAZ-007VXJ-DT; Mon, 06 Jan 2025 12:25:19 +0000
In-Reply-To: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 07/17] net: stmmac: remove priv->tx_lpi_enabled
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUmAZ-007VXJ-DT@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 12:25:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042528_013578_8F62E7C8 
X-CRM114-Status: UNSURE (   8.89  )
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

Through using phylib's EEE state, priv->tx_lpi_enabled has become a
write-only variable. Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 2eee3c5c4d1e..507b6ac14289 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -308,7 +308,6 @@ struct stmmac_priv {
 	int eee_enabled;
 	int eee_active;
 	u32 tx_lpi_timer;
-	int tx_lpi_enabled;
 	int eee_tw_timer;
 	bool eee_sw_timer_en;
 	unsigned int mode;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 47c57a558e5b..ba6de7b7d572 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -970,7 +970,6 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
 	priv->eee_active = false;
-	priv->tx_lpi_enabled = false;
 	priv->eee_enabled = stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
 
@@ -1085,7 +1084,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
 		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
 		priv->eee_enabled = stmmac_eee_init(priv);
-		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
 
-- 
2.30.2


