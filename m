Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4CEE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oq60lzgRpWi3eAZ/MUBwnwLL6gwP4hqHvvlrP8GACm8=; b=WBWf1vA4Z4+6KGX+vyZxlsR8oW
	ZHGhbo26Qt6cJU0XX0iA/iEeb++DH4ZsjKFeAkgfMmx7HfYCW6MeGcwmeeQSWlknD5yvggf8ooela
	7pWiNha2Baa5LDJqTqmBQVpKTb9/+42KfityS2qzpizRIPTyByBd9STeVyAiVUzZ4HDaChDpW1DbU
	B66OhD7avf7BnDNjbTLgM/9Z3D79AuXlpTLE1oYBPT5HkRpAn5oVn0Dv0iN/pGg5jtxNHfFk94WdB
	2vTlPdm2ldmh2yd9Sx7hgsLfE9/Nn3m4LPY0rQp4yqksUzXohI7QCrsA05OcPQKXGtLZgaeUH+SyV
	bgaXHDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCmU-00000005iA1-0kmP;
	Tue, 07 Jan 2025 16:50:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCS7-00000005dSA-0PBj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oq60lzgRpWi3eAZ/MUBwnwLL6gwP4hqHvvlrP8GACm8=; b=u0Sn+IXQf9z7nG9lM4bjV2oyUW
	icGUROETYj2EXYtr9PBQWScNAbTReoUogYziDrbBOI5M6ufaenf9e/1jowWF5xlM4HeJosS3LqpKR
	KkCoL7+c5lMIzLaTtVbP5owz5pr54B/c8yHoz0F2XlKBh087mnxFo6eNY2Tu0rw12a9A/b0fRPZAj
	UbXWUIzCy8i9QWdkfA8SiFVLVe2Vi+fpMf/MjBBbRDbTay41K5NQftaL8FxKrrhWgZJLaRvx6iBOY
	yy5fizyyVGl3+ftTxSnMhfFHMAQeslVOAACWjDcjgXTfEeil+EQLbtKnwRGAv3twzi0UXQOM5rzK6
	9NN5bYOw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50286 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVCS1-0007mY-2s;
	Tue, 07 Jan 2025 16:29:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVCRy-007Y3Z-Ri; Tue, 07 Jan 2025 16:29:02 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v3 07/18] net: stmmac: clean up
 stmmac_disable_eee_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVCRy-007Y3Z-Ri@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:02 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082911_133622_F170D8EC 
X-CRM114-Status: GOOD (  11.35  )
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1ccfa40ceddd..be77dd04c8c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -427,18 +427,13 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
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
@@ -4495,7 +4490,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	first_tx = tx_q->cur_tx;
 
 	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
-		stmmac_disable_eee_mode(priv);
+		stmmac_disable_sw_eee_mode(priv);
 
 	/* Manage oversized TCP frames for GMAC4 device */
 	if (skb_is_gso(skb) && priv->tso) {
-- 
2.30.2


