Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA5AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvpIuIYR+OFZWfZ+noueKHmU0ee5RQLXv8mbWGSuBsw=; b=h7DYjxskBa8H2W1OOAsWbKrp0W
	njs3OyS95655PjSm7K/RB5xNUZI95da6ilkGcSPvdgYL0DAhOZduItesptkh1Xyx5L9o4zQ1Bc+GV
	VLZIQmUZkzfGOEqUHSilLTXOa+s/OuAIlXYvEM606x3oQS77QOb6zWzwvft1J9+fFKTb/3HqHT+pA
	xwPm02zj8DRFo3/BZSvRZiS3osihCC81Sft7+yRUSeEAEGW659N7oi3QhUKDyRtG598XfgCr/q6je
	HQVQjwtOzUIthzyAgnZqM3E4fn+LFfXjK7V0tYRZlhC5Mzr5lrO+5Hn4QwhRikuya/bm5q6fOrwq7
	vEHMbswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugR4c-0000000F28h-0YAH;
	Mon, 28 Jul 2025 16:51:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQ3l-0000000EsJ7-2ydL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hvpIuIYR+OFZWfZ+noueKHmU0ee5RQLXv8mbWGSuBsw=; b=Z1lR3FYIP49Z9k1MorzRPnrMHG
	CedRUGtvJDyzN4J0cYnbsqxGHDkT00bZ17ACNq3UKY9mBOqKSmZb6ZuB6IXYxjVrNyid1gEBUCZoF
	L3oYho/a15hewwVtueD3UQ3meSqfuRhM6W0xpf/LIWskSPZ81b9xw92ajbeEzpGasraOlOHALwxaj
	dVLNaj1MJ3q4Y6QmskK03YtIZkt5I+jSYUWrQ6K753ExCycbclR6v157vNWsEOhwpZI6bPR89yMBR
	TDefZq0uuk57ZpqmkUwDxuJz+4JReRHsVd9KdOc/DT3srMeYtPvrvk49F2TrGRAorItQcNIja6myi
	lwQPS3Ag==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54450 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ugQ3g-0000Up-11;
	Mon, 28 Jul 2025 16:46:36 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ugQ2y-006KDL-K7; Mon, 28 Jul 2025 16:45:52 +0100
In-Reply-To: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next 5/7] net: stmmac: use core wake IRQ support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ugQ2y-006KDL-K7@rmk-PC.armlinux.org.uk>
Date: Mon, 28 Jul 2025 16:45:52 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_084641_749299_81678FA1 
X-CRM114-Status: GOOD (  16.55  )
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

The PM core provides management of wake IRQs along side setting the
device wake enable state. In order to use this, we need to register
the interrupt used to wakeup the system using devm_pm_set_wake_irq()
or dev_pm_set_wake_irq(). The core will then enable or disable IRQ
wake state on this interrupt as appropriate.

Make use of this functionality, rather than explicitly managing the
IRQ enable state in the set_wol() ethtool op. This removes the IRQ
wake state management from stmmac.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 14 +-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  4 ++--
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index cda09cf5dcca..e1df59a643e3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -289,7 +289,6 @@ struct stmmac_priv {
 	u32 msg_enable;
 	int wolopts;
 	int wol_irq;
-	bool wol_irq_disabled;
 	int clk_csr;
 	struct timer_list eee_ctrl_timer;
 	int lpi_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 58542b72cc01..39fa1ec92f82 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -815,19 +815,7 @@ static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 		return ret;
 	}
 
-	if (wol->wolopts) {
-		device_set_wakeup_enable(priv->device, 1);
-		/* Avoid unbalanced enable_irq_wake calls */
-		if (priv->wol_irq_disabled)
-			enable_irq_wake(priv->wol_irq);
-		priv->wol_irq_disabled = false;
-	} else {
-		device_set_wakeup_enable(priv->device, 0);
-		/* Avoid unbalanced disable_irq_wake calls */
-		if (!priv->wol_irq_disabled)
-			disable_irq_wake(priv->wol_irq);
-		priv->wol_irq_disabled = true;
-	}
+	device_set_wakeup_enable(priv->device, !!wol->wolopts);
 
 	mutex_lock(&priv->lock);
 	priv->wolopts = wol->wolopts;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6a4ef32f57ec..7d467b494685 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -29,6 +29,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/prefetch.h>
 #include <linux/pinctrl/consumer.h>
 #ifdef CONFIG_DEBUG_FS
@@ -3724,7 +3725,6 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	/* Request the Wake IRQ in case of another line
 	 * is used for WoL
 	 */
-	priv->wol_irq_disabled = true;
 	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
 		int_name = priv->int_name_wol;
 		sprintf(int_name, "%s:%s", dev->name, "wol");
@@ -3885,7 +3885,6 @@ static int stmmac_request_irq_single(struct net_device *dev)
 	/* Request the Wake IRQ in case of another line
 	 * is used for WoL
 	 */
-	priv->wol_irq_disabled = true;
 	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
 		ret = request_irq(priv->wol_irq, stmmac_interrupt,
 				  IRQF_SHARED, dev->name, dev);
@@ -7277,6 +7276,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (priv->plat->pmt) {
 		dev_info(priv->device, "Wake-Up On Lan supported\n");
 		device_set_wakeup_capable(priv->device, 1);
+		devm_pm_set_wake_irq(priv->device, priv->wol_irq);
 	}
 
 	if (priv->dma_cap.tsoen)
-- 
2.30.2


