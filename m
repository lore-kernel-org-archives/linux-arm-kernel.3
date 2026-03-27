Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1525B10AB83C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 01:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eVLvdY7TRWDqr+aVGXiB73OE3ATDb5vfU5FBPLA+MZk=; b=faqDoPXsifJJXbaFVKqEesQ9YK
	Ge6zku/ejwQHIURw9vlt0YjZcFRAhTgG6mTdd2fnUIvPeP0wYnlrdLcMY3f1P3PVxKpmmVwNNYl2o
	hxFLj/uOYeiG5oWbKABJ13+QCyJQkF65xRMdhHifgN4bFRv86zVPt4tFuDUG/E5VNskI2pVTPX0lj
	Ka0ZKMjwqMC+0axYAxfBm9g5sywDyrFa24u6Ha47ZOooNN/4OXjH1qstNjWQPdkbQoLZtPY7sm3Lo
	yG3dFe50R+igB5NSx8kw5Ne2qGUi1KOHlTPVPUn9sY7fYcBHmvXcYN6OnGm1S06aEmsF8n+t/tPsY
	YwiUkNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wNc-00000006VR5-1iwN;
	Fri, 27 Mar 2026 01:52:56 +0000
Received: from n169-114.mail.139.com ([120.232.169.114])
	by bombadil.infradead.org with smtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wNX-00000006VQD-0wmv;
	Fri, 27 Mar 2026 01:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=tujcAx/BS3Ii9CWy1ufqr8+jv2uW+4hRFuohfkpdq/oBN/mswbESSPSMfC+FaOYzRWT3EwNXB7EKD
	 Z/IjiNt25OF1a3eYrTcgqFWk1IR51llpQnUu2ANa8X+ApnGblj25yNe5ZVZlKcI/ujo4jx5he/xF2n
	 TLDky607OsRero5o=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from NTT-kernel-dev (unknown[60.247.85.88])
	by rmsmtp-lg-appmail-40-12054 (RichMail) with SMTP id 2f1669c5e2e1df3-00e06;
	Fri, 27 Mar 2026 09:52:38 +0800 (CST)
X-RM-TRANSID: 2f1669c5e2e1df3-00e06
From: Rajani Kantha <681739313@139.com>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	vladimir.oltean@nxp.com
Cc: patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	f.fainelli@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wei.fang@nxp.com
Subject: [PATCH 6.1.y 2/3] net: phy: allow MDIO bus PM ops to start/stop state machine for phylink-controlled PHY
Date: Fri, 27 Mar 2026 09:52:37 +0800
Message-Id: <20260327015237.1713008-1-681739313@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_185252_236384_1987833D 
X-CRM114-Status: GOOD (  26.44  )
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

[ Upstream commit fc75ea20ffb452652f0d4033f38fe88d7cfdae35 ]

DSA has 2 kinds of drivers:

1. Those who call dsa_switch_suspend() and dsa_switch_resume() from
   their device PM ops: qca8k-8xxx, bcm_sf2, microchip ksz
2. Those who don't: all others. The above methods should be optional.

For type 1, dsa_switch_suspend() calls dsa_user_suspend() -> phylink_stop(),
and dsa_switch_resume() calls dsa_user_resume() -> phylink_start().
These seem good candidates for setting mac_managed_pm = true because
that is essentially its definition [1], but that does not seem to be the
biggest problem for now, and is not what this change focuses on.

Talking strictly about the 2nd category of DSA drivers here (which
do not have MAC managed PM, meaning that for their attached PHYs,
mdio_bus_phy_suspend() and mdio_bus_phy_resume() should run in full),
I have noticed that the following warning from mdio_bus_phy_resume() is
triggered:

	WARN_ON(phydev->state != PHY_HALTED && phydev->state != PHY_READY &&
		phydev->state != PHY_UP);

because the PHY state machine is running.

It's running as a result of a previous dsa_user_open() -> ... ->
phylink_start() -> phy_start() having been initiated by the user.

The previous mdio_bus_phy_suspend() was supposed to have called
phy_stop_machine(), but it didn't. So this is why the PHY is in state
PHY_NOLINK by the time mdio_bus_phy_resume() runs.

mdio_bus_phy_suspend() did not call phy_stop_machine() because for
phylink, the phydev->adjust_link function pointer is NULL. This seems a
technicality introduced by commit fddd91016d16 ("phylib: fix PAL state
machine restart on resume"). That commit was written before phylink
existed, and was intended to avoid crashing with consumer drivers which
don't use the PHY state machine - phylink always does, when using a PHY.
But phylink itself has historically not been developed with
suspend/resume in mind, and apparently not tested too much in that
scenario, allowing this bug to exist unnoticed for so long. Plus, prior
to the WARN_ON(), it would have likely been invisible.

This issue is not in fact restricted to type 2 DSA drivers (according to
the above ad-hoc classification), but can be extrapolated to any MAC
driver with phylink and MDIO-bus-managed PHY PM ops. DSA is just where
the issue was reported. Assuming mac_managed_pm is set correctly, a
quick search indicates the following other drivers might be affected:

$ grep -Zlr PHYLINK_NETDEV drivers/ | xargs -0 grep -L mac_managed_pm
drivers/net/ethernet/atheros/ag71xx.c
drivers/net/ethernet/microchip/sparx5/sparx5_main.c
drivers/net/ethernet/microchip/lan966x/lan966x_main.c
drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
drivers/net/ethernet/freescale/ucc_geth.c
drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
drivers/net/ethernet/marvell/mvneta.c
drivers/net/ethernet/marvell/prestera/prestera_main.c
drivers/net/ethernet/mediatek/mtk_eth_soc.c
drivers/net/ethernet/altera/altera_tse_main.c
drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
drivers/net/ethernet/tehuti/tn40_phy.c
drivers/net/ethernet/mscc/ocelot_net.c

Make the existing conditions dependent on the PHY device having a
phydev->phy_link_change() implementation equal to the default
phy_link_change() provided by phylib. Otherwise, we implicitly know that
the phydev has the phylink-provided phylink_phy_change() callback, and
when phylink is used, the PHY state machine always needs to be stopped/
started on the suspend/resume path. The code is structured as such that
if phydev->phy_link_change() is absent, it is a matter of time until the
kernel will crash - no need to further complicate the test.

Thus, for the situation where the PM is not managed by the MAC, we will
make the MDIO bus PM ops treat identically the phylink-controlled PHYs
with the phylib-controlled PHYs where an adjust_link() callback is
supplied. In both cases, the MDIO bus PM ops should stop and restart the
PHY state machine.

[1] https://lore.kernel.org/netdev/Z-1tiW9zjcoFkhwc@shell.armlinux.org.uk/

Fixes: 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")
Reported-by: Wei Fang <wei.fang@nxp.com>
Tested-by: Wei Fang <wei.fang@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Link: https://patch.msgid.link/20250407094042.2155633-1-vladimir.oltean@nxp.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Rajani Kantha <681739313@139.com>
---
 drivers/net/phy/phy_device.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7d19857a6dc4..fd49616c6608 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -247,6 +247,33 @@ static void phy_link_change(struct phy_device *phydev, bool up)
 		phydev->mii_ts->link_state(phydev->mii_ts, phydev);
 }
 
+/**
+ * phy_uses_state_machine - test whether consumer driver uses PAL state machine
+ * @phydev: the target PHY device structure
+ *
+ * Ultimately, this aims to indirectly determine whether the PHY is attached
+ * to a consumer which uses the state machine by calling phy_start() and
+ * phy_stop().
+ *
+ * When the PHY driver consumer uses phylib, it must have previously called
+ * phy_connect_direct() or one of its derivatives, so that phy_prepare_link()
+ * has set up a hook for monitoring state changes.
+ *
+ * When the PHY driver is used by the MAC driver consumer through phylink (the
+ * only other provider of a phy_link_change() method), using the PHY state
+ * machine is not optional.
+ *
+ * Return: true if consumer calls phy_start() and phy_stop(), false otherwise.
+ */
+static bool phy_uses_state_machine(struct phy_device *phydev)
+{
+	if (phydev->phy_link_change == phy_link_change)
+		return phydev->attached_dev && phydev->adjust_link;
+
+	/* phydev->phy_link_change is implicitly phylink_phy_change() */
+	return true;
+}
+
 static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
 {
 	struct device_driver *drv = phydev->mdio.dev.driver;
@@ -307,7 +334,7 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
 	 * may call phy routines that try to grab the same lock, and that may
 	 * lead to a deadlock.
 	 */
-	if (phydev->attached_dev && phydev->adjust_link)
+	if (phy_uses_state_machine(phydev))
 		phy_stop_machine(phydev);
 
 	if (!mdio_bus_phy_may_suspend(phydev))
@@ -361,7 +388,7 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
 		}
 	}
 
-	if (phydev->attached_dev && phydev->adjust_link)
+	if (phy_uses_state_machine(phydev))
 		phy_start_machine(phydev);
 
 	return 0;
-- 
2.34.1



