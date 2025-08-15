Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0DFCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo2VFsEvx+fN7c8gTRD/Vrtsf+k2CrLOmw1eJfPwpU8=; b=N8Me2EC30K+7pO7iPxOoNCpOHl
	GDrGyKGuQgKQKFr6Tw2HbsnqiSNpYl7MOGyxrJkdXx/NVzB4fnNySi+7ecrYnqf1gsnF72hGV1DFA
	Ao3d2Ru1qy/dbwI3aHeopeKP3SH8wx4b9baoNIyVUgGi8lOuiYLtMgTHf9ArEirtdKRkgz2GKeWng
	3OQ1j9mD7t5rCw6+b+feqC2TQZgUm7ddanO+Rc1ZoHbjyTScc9pkTRVF+fIVTXECgrXN6oBOfMVrr
	JZ3rqNdoMuxM1Oe++E//5qGckKTZGUlrnVjcteDpnnvsZLlFxuJ1RtkHi2rBB1UnkXrnmXSdU4RSP
	iTHGFLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvRS-00000002iaR-32GD;
	Fri, 15 Aug 2025 14:30:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsg7-00000002LFi-1Rc1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bo2VFsEvx+fN7c8gTRD/Vrtsf+k2CrLOmw1eJfPwpU8=; b=Vdd7VkHxf9l/miVsisKi8HxBJu
	MMD3xMgbH9/Y1YXApdfiXdD3grZA2wz9DO9d960tF8FIXpMbxd5QlS9+7F2uJtBXNAMLIfv3m0F8/
	If3ct396y4akRuvPIBTO6C/PlcmRZhhJHbb6lH4bzO8Le5n2qvPHJznNCTvqvcraocCE0xQXGSZJR
	E7B76tS5qzfUwHBuBGTj480Ev1+/vh7qQHNGCqSZS2ZVSgBTsllBUG8DZFWvTBTsGJnw8VY0RqMfy
	7Jg4/dXBTOhRY3Xxu89IExzRTlPT6V8bPCxX7nll82ypqanfTd5vJx3tlxLIC/J+wXTcU82lRlus3
	xvDp6+zw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45706 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1umsg3-00012H-1o;
	Fri, 15 Aug 2025 12:32:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1umsfK-008vKj-Pw; Fri, 15 Aug 2025 12:32:10 +0100
In-Reply-To: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
References: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 5/7] net: stmmac: use core wake IRQ support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1umsfK-008vKj-Pw@rmk-PC.armlinux.org.uk>
Date: Fri, 15 Aug 2025 12:32:10 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_043259_386176_0BDB0958 
X-CRM114-Status: GOOD (  16.96  )
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
wake state on this interrupt as appropriate, depending on the
device_set_wakeup_enable() state. device_set_wakeup_enable() does not
care about having balanced enable/disable calls.

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
index bf95f03dd33f..b16b8aeeb583 100644
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
index c24b890e1089..e715e9f2fe22 100644
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


