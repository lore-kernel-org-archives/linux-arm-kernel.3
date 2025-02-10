Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3BCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELqbi+gpufx0/yKmKxb0he5MB5h1Oc7NMvQUCKuJaVA=; b=jbUu6J5samZK1iGeVIZibg69/4
	8sH4hJ7+NTlH+z5eNVDg7urSq+Dr7wkZ+AaKgBQxjFnWoXpRgVq11LJHudvPiu3G89RT7k+VaqTEB
	zlMMnDFYjWEkuY/BtaJ3uNdOXb85geNAjlRBurR4lpnH3neMRhO2ra5RgoDl7G86v+Huxs9zInpRX
	y061mNlB5xatauCO3wNO95OINxcN/E/MFaYYS9yCxYfMCmXQEPMBvofqE49GGBvzVTfkIvhlvtMH1
	YNJI/D8ivkAJQa3NlPmD2JQ5J0zzjfZFNhbuODEl1ND1igegRsQ2703okpkrgIoJFfJarm2I/JlvT
	m+6JVh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRkK-0000000HAri-1X26;
	Mon, 10 Feb 2025 11:14:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRQl-0000000H6D7-3kaz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ELqbi+gpufx0/yKmKxb0he5MB5h1Oc7NMvQUCKuJaVA=; b=TYpTedd21CZ6jBLg3V5dD3+HSa
	qgu4+FBV/vgxPPur1vSkX1Vmo2eu8ptRqW5mwdO+GP6n5IhFvghpxxjWSEFS+w0es/Qqb0sXYdCLm
	Zew+RYmfT2V2TaDZRH70rmfJfUS+Mx81MdaMbLAcbZ1j30NDuiYFgKVtewgYcP0OgumxhLM31d969
	osBtwEfS9Gp9XTtbNlyg/wPySSF3PBOyGP/0PIFoVvONn9wHJE9Ma01QfrODPvkafqk13rjBDkXzi
	MDW38i5QlrFUClG+j+7PMGO+9i5RVXil0uyoMWextRWyPOReuA1yIO6E90BtnqZo1Dvv0G+nqSent
	zbCTJt2Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48442 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1thRQh-0006WH-37;
	Mon, 10 Feb 2025 10:54:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1thRQO-003w7I-Ap; Mon, 10 Feb 2025 10:54:00 +0000
In-Reply-To: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
References: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 5/8] net: stmmac: remove calls to xpcs_config_eee()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1thRQO-003w7I-Ap@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Feb 2025 10:54:00 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_025423_929276_F08130B5 
X-CRM114-Status: UNSURE (   8.56  )
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

Remove the explicit calls to xpcs_config_eee() from the stmmac driver,
preferring instead for phylink to manage the EEE configuration at the
PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3b77597ada52..526df6fd732b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1046,10 +1046,6 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 	priv->tx_path_in_lpi_mode = false;
 
 	stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
-	if (priv->hw->xpcs)
-		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
-				false);
-
 	mutex_unlock(&priv->lock);
 }
 
@@ -1068,9 +1064,6 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 			     STMMAC_DEFAULT_TWT_LS);
-	if (priv->hw->xpcs)
-		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
-				true);
 
 	/* Try to cnfigure the hardware timer. */
 	ret = stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_TIMER,
-- 
2.30.2


