Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA573C02190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC2pmzmWH4CgIBdJHLFPft8uDI2Dakt08wcW9mTokec=; b=VLEdnEKvke7zu/nN8CGya4021i
	ruP97WC8AyEfPA0CSdQDcb0erdqThYuwUQ2obkhmTYPXlkHSuidBmudt817uKmre6NfLM+7ZY4s7U
	hML97M5OCf+dLmxznkFeJA548BLfBLpQ4JN+E051MFWUouLvv2Xp0JwU2lwnXXC3zdWbVyTG956OA
	oA0l+mJgxeZvYSjtRHWtNs3AQDmlxR3a/7eI/qd9pV71PwdL2NPmuKhM4BdJbCRAUKyDo52FIqzjf
	Q6KXMCivUyTnWLfufEADwtTL2Z5xqA/KFsT+Hxa4NdzYIrJQ7k4v10u6hNp5N1tsW5yvVmoqiuMZR
	PmSXATZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnzh-00000005EdN-1Q12;
	Tue, 28 Jan 2025 15:59:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnog-00000005CBR-0Fad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RC2pmzmWH4CgIBdJHLFPft8uDI2Dakt08wcW9mTokec=; b=Xobegc1RU6kQEofhgts4nN2yIP
	/XloiGBM64YCtWkJc2tMPyGBDaWfJ6c5WBa9mL+9wnpmtmkk9zsbzJv/LBh9z8mHKf8TVTygHjNvc
	eBUHp8hDdw00deaNjknn6CEaMUkmZZlfMuszQhrtiGpMVfvixga6ETSSCyeZ5gyuBaLeCGMIskQVW
	saBlOphZqyD1YSsAERYHDxT7UP3Q/tyZxKnF0m52UcN+PDAuFlbg604Et4n/K/RaOgVePqs8RxfAH
	NBKi7jphRw71PfgKkGIVREqzTOfPg1FEsoIk7SCan/pHVxW5uogiYixng9dfCgkrDifIzxo8XEY8l
	XgklHl2Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39314 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnoc-0007V3-0m;
	Tue, 28 Jan 2025 15:47:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnoI-0037Gu-UM; Tue, 28 Jan 2025 15:47:30 +0000
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
Subject: [PATCH RFC net-next 09/22] net: stmmac: remove unnecessary LPI
 disable when enabling LPI
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnoI-0037Gu-UM@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074754_096634_84C2ADD7 
X-CRM114-Status: UNSURE (   8.75  )
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

Remove the unnecessary LPI disable when enabling LPI - as noted in
previous commits, there will never be two consecutive calls to
stmmac_mac_enable_tx_lpi() without an intervening
stmmac_mac_disable_tx_lpi.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 40b9e387446e..aafd9cee304e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -390,11 +390,6 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 	return dirty;
 }
 
-static void stmmac_disable_hw_lpi_timer(struct stmmac_priv *priv)
-{
-	stmmac_set_eee_lpi_timer(priv, priv->hw, 0);
-}
-
 static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
 {
 	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
@@ -1082,14 +1077,10 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
 		/* Use hardware LPI mode */
-		del_timer_sync(&priv->eee_ctrl_timer);
-		priv->tx_path_in_lpi_mode = false;
-		priv->eee_sw_timer_en = false;
 		stmmac_enable_hw_lpi_timer(priv);
 	} else {
 		/* Use software LPI mode */
 		priv->eee_sw_timer_en = true;
-		stmmac_disable_hw_lpi_timer(priv);
 		stmmac_restart_sw_lpi_timer(priv);
 	}
 
-- 
2.30.2


