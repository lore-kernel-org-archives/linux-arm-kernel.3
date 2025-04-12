Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960BAC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 08:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQd32sdl+fRSmh8Brlhe3sM7lTnHOxR88TKi6LoNcBY=; b=AEGFJuV1RO3uNsIUI0Vm4dqQBy
	w5/3FK84uH9q6kZf6t1KjrVfwQD69BxjfOuS5UdmL8e6ztBOGfHTLhg1EQ01t+l1YEITJRs0FkFIM
	uibiXI6N9LWPwa650uf5VZyS6wy1+V0i1mllojk/xln/q1bgYMPfBkYt5yko+nhHInDDtiFJX/uT5
	hg64jLLNYtVRe8Z/myoOGsuyvlIZczoKNSeudu6AlztPmKRuxfRYPMXt7qcNEnQdmua1lZ6tvR4Ji
	AbOdGf5+2Ts3rhGvIBaZw1UD4zD/fyFw6KaN7xCJoIul8l4Xfr1L8sSTqvGIe/XR9ejDHMTj8GeV+
	a2tIpSUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3W1E-0000000FddQ-0emz;
	Sat, 12 Apr 2025 08:15:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VvZ-0000000FdE8-37S2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 08:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XQd32sdl+fRSmh8Brlhe3sM7lTnHOxR88TKi6LoNcBY=; b=XBA4nphcVi0vDEM8VQlVZsSdNy
	qeU9eE/20ys3vrLwYFoPkTFzAneVQLJKkNj8ihpugQ3fMRNWvCfhCXyOO6lgJN71jujHKHkcC8evB
	pME2Jb14yY66oryPThM4GBYbF6fUhmgYLLpQLvCCol16gtvBmxg5YVbbiY+OvfdJ+MVdVPlGgzv8D
	oWOCq8mjoZaPmdPRZ7b+fYeuc59YZi2F7NLhAUCo8uHtUCAlXOtBBunKQaVBybfw6aTE3wdw2f+Tj
	CS7U77c7TjC/pHl0T6TpFLy1tLJTT+MYSTtxqR+OmR+G+/FnvBAdkZM9UzBZI4rFqmyJrbaxiL78d
	YctzxBdw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42092 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3VvR-0004MK-1A;
	Sat, 12 Apr 2025 09:09:17 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3Vuq-000E7s-5Y; Sat, 12 Apr 2025 09:08:40 +0100
In-Reply-To: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
References: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 3/5] net: stmmac: intel-plat: remove
 eee_usecs_rate and hardware write
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3Vuq-000E7s-5Y@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 09:08:40 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_010925_780071_3E444096 
X-CRM114-Status: UNSURE (   9.43  )
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

Remove the write to GMAC_1US_TIC_COUNTER for two reasons:

1. during initialisation or reinitialisation of the DWMAC core, the
   core is reset, which sets this register back to its default value.
   Writing it prior to stmmac_dvr_probe() has no effect.

2. Since commit 8efbdbfa9938 ("net: stmmac: Initialize
   MAC_ONEUS_TIC_COUNTER register"), GMAC4/5 core code will set
   this register based on the rate of plat->stmmac_clk. This clock
   is fetched by devm_stmmac_probe_config_dt(), and plat->clk_ptp_rate
   will be set to its rate profided a "ptp_ref" clock is not provided.
   In any case, Marek's commit will set the effectual value of this
   register.

Therefore, dwmac-intel-plat.c writing GMAC_1US_TIC_COUNTER serves no
useful purpose and can be removed.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 599def7b3a64..4ea7b0a803d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -113,16 +113,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 
 	plat_dat->clk_tx_i = dwmac->tx_clk;
 	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
-
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->eee_usecs_rate = plat_dat->clk_ptp_rate;
-
-	if (plat_dat->eee_usecs_rate > 0) {
-		u32 tx_lpi_usec;
-
-		tx_lpi_usec = (plat_dat->eee_usecs_rate / 1000000) - 1;
-		writel(tx_lpi_usec, stmmac_res.addr + GMAC_1US_TIC_COUNTER);
-	}
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-- 
2.30.2


