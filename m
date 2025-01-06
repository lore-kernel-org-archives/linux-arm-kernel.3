Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0FBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iv3o0tQi4mVCZMUEX+EXxrZSrKEvf9ort8xPFeup/9E=; b=YzxziAXpwba8BbccJT2b/8pccq
	opRFOhN/QfmfpHKem86oGJ1xFAZeLxNAKbWD8YNEMlSsLGDx8iHOsoklouPs5uPf9i9eUB1b4u63M
	Bs9QwhaeSGgnCd+14UoEhxStnd8ZWdVCb4yjkOOepOlVAf5T2WwYolTpkrCdjjPC3B3TBjGQXu3Tn
	D2ATB0yLHZr9/p9nVHHDyzVNc/tECylFJcqCUi3Bs92981Q+i5RpDMrsk1NxT3pAPCMDEIIdkCc4T
	bVwZmszHeT1W31thzFZxkrwpUNmWv0+u/D2lSbdwPa3+MoWnBG+dcqcxvYLD/kFF4DlGFjZ8iPRKX
	21FH/g0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmLQ-00000001FLq-1XKa;
	Mon, 06 Jan 2025 12:36:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmAb-00000001D6R-36dG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iv3o0tQi4mVCZMUEX+EXxrZSrKEvf9ort8xPFeup/9E=; b=HPCvXjvLIYux4i2OdJkQRn7z6R
	oJ26BVHgPVWjocxdKwiWvfBfkRwSM+x2LSHwSztmG1zw67j98C7UAVWFHgybOaMAjQDNaaQmrmXco
	s2rY5V+CS6zr1EnDJcJnh1Jksbg7Irr/UrG7Aobe8ny+WkuxrotIwCkuTOM5fEQ3iDZqjjGsvsLxy
	MPLPPqht7kkgFnw9jIMlf+f6SjkatFX2Qw3fGT2roupS+G9ncLVRvyfD69xOejlOvmUMJk1gRw6o4
	ErzhJGsqoRWoB6K0PnM5PpF+T2KvWKiSP5Rj87NTEyDW3tJ7YpaLvEQvhwrQQ307wy+15/54QmJ+5
	DyjhsNng==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55610 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUmAX-0005re-12;
	Mon, 06 Jan 2025 12:25:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUmAU-007VXD-A4; Mon, 06 Jan 2025 12:25:14 +0000
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
Subject: [PATCH net-next v2 06/17] net: stmmac: clean up
 stmmac_disable_eee_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUmAU-007VXD-A4@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 12:25:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042521_785354_ECAD3C37 
X-CRM114-Status: GOOD (  11.72  )
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

stmmac_disable_eee_mode() is now only called from stmmac_xmit() when
both priv->tx_path_in_lpi_mode and priv->eee_sw_timer_en are true.
Therefore:

	if (!priv->eee_sw_timer_en)

in stmmac_disable_eee_mode() will never be true, so this is dead code.
Remove it, and rename the function to indicate that it now only deals
with software based EEE mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f895bdd75678..47c57a558e5b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -429,18 +429,13 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 }
 
 /**
- * stmmac_disable_eee_mode - disable and exit from LPI mode
+ * stmmac_disable_sw_eee_mode - disable and exit from LPI mode
  * @priv: driver private structure
  * Description: this function is to exit and disable EEE in case of
  * LPI state is true. This is called by the xmit.
  */
-static void stmmac_disable_eee_mode(struct stmmac_priv *priv)
+static void stmmac_disable_sw_eee_mode(struct stmmac_priv *priv)
 {
-	if (!priv->eee_sw_timer_en) {
-		stmmac_lpi_entry_timer_config(priv, 0);
-		return;
-	}
-
 	stmmac_reset_eee_mode(priv, priv->hw);
 	del_timer_sync(&priv->eee_ctrl_timer);
 	priv->tx_path_in_lpi_mode = false;
@@ -4490,7 +4485,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	first_tx = tx_q->cur_tx;
 
 	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
-		stmmac_disable_eee_mode(priv);
+		stmmac_disable_sw_eee_mode(priv);
 
 	/* Manage oversized TCP frames for GMAC4 device */
 	if (skb_is_gso(skb) && priv->tso) {
-- 
2.30.2


