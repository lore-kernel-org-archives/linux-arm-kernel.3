Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79108CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DzbQDwi9RbZoob0zYWFQ5/ASNBPHf1VoGppigp5aNlM=; b=zcfIYvgOTCDWFPnXbi/hWyy0oq
	SnBu/ExyCpXnGA2rt5JRPAQazOyhgPog2pe61mJrey+iDSdovpm7rMxmg0dNP7uOpBgiLHA3DUOq+
	y4mwYPBOA/BtB0gvCM5Rwr29hqRG8hrcevGhbYAOEafYRIPm7zGH8V5VrX9K6LcbcnqnwcrKEuAJv
	3r8HnU051YB4Hfd1i7iE2WEJKrgC+wWbUVJVfnOvGB0F6J0Tjhnvyhrr+OnmCNtF3P7EYpOcUiy6/
	EZqiYCHE5+FO+iz02V19R6fwwVTFHiNvRALr2JKFMUb15S/KAGPos4ByfwqtrLs+x9QQJmqsNiCa8
	vpIDORZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzyU-000000074Zn-2iOJ;
	Wed, 30 Sep 2026 19:28:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzyT-000000074Zd-18Z5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 19:28:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61A2F601EF;
	Wed, 30 Sep 2026 19:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E16AC4AF0B;
	Wed, 30 Sep 2026 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790796496;
	bh=TaTFv31TFr0nH5ITR1YGC5q118oXyreNuRrfQm31xwM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LeW3ygNbY+duylUfcQanrxY2IJvmixBqTIMWEwRYLZSSb8IcimOt6tEoRp+sKE260
	 UTxtWxO8lGavYhIEz4Bp8XzcZnmAQJPpsKE+/Yi5QeH0VcyjsUAvfOmpVroMnkn1RA
	 TH1eYkKR39fEbFMQ+V0OsaIECOL8qF4gkfy0UJhNndkmpA8CQoXAQkeLM4+ncVbK1P
	 fvrU9ZW+MbzoW+U1dgrkz/lWHyV3fops2GhukVcXIe3HROwEilVHquCQxxjCS25TnF
	 y5bZTbpKedWtoLUb4DmuzDb60rXh6qjqPLzEF/QN8TBdi1NJ5XByepcHmm+qMN58MD
	 w+gau6r9MrjsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE94CA5FC1;
	Wed, 30 Sep 2026 19:28:15 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 30 Sep 2026 19:28:13 +0000
Subject: [PATCH net-next] net: stmmac: mask the MAC interrupt while resume
 resets the MAC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-stmmac-irq-shut-v1-1-104d1a1dcb28@iav.lv>
X-B4-Tracking: v=1; b=H4sIAMxivWoC/x3MQQqEMAxA0atI1gYyFkf0KuKirXHMwjo2VQTx7
 haXb/H/BcpRWKErLoh8iMoaMj5lAX624ccoYzZUVH2pNYSalsV6lLihzntCMs76urFMzkGu/pE
 nOd9jD4ETBj4TDPf9AOnjI59rAAAA
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3397; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=SA1F6OtzfhBrFw1324lwOQ8HhPxeVaEiK1QpSXhngao=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFl7k849vZl5NLE0Q+mFXo3h9+WRRaGN8nOlfxrqrdCtm
 PWyXMWvo5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAExEVYHhr7xEkcHDOV/viFfM
 Pmo8dWlLooxw7szz+rNWp/QKHHEIjmBkeKsQ3GyfbRS3zyvFst5+suVGnrP/Dk+81JzKppkzf1U
 zHwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

stmmac_resume() resets the MAC in stmmac_hw_setup(). On dwmac1000 the
reset clears the interrupt mask, and all core interrupts stay unmasked
until dwmac1000_core_init() writes it again. A link change in that
window raises an RGMII interrupt, and no handler clears it since
commit 2e2c878a3141 ("net: stmmac: remove SGMII/RGMII/SMII interrupt handling").
The line storms:

  dwmac_dma_interrupt: unexpected status 04000000

The message repeats every few milliseconds and the network stays down
until a power cycle or a watchdog reset. A register dump at the first
message on ODROID-HC4 showed the pending link change with a zero mask:

  core int_status 00000001 int_mask 00000000 pmt 00000000 rgsmiiis 0000000d

Disable the interrupt line for the whole resume and enable it again on
every exit path. The line is IRQF_SHARED, so leave it enabled during
suspend, where another user of the line may wake the system.

Wake-on-LAN resume on two boards:
- ODROID-HC4 (dwmac-meson8b, 7.2): the storm on resume, none in 5
  resumes with this patch.
- Helios64 (dwmac-rk, 7.3-rc5): the storm in 2 of 3 resumes, none in
  26 resumes with this patch.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Ported to net-next, where stmmac_resume() gained error labels. Tested
on hardware with 7.2 and 7.3-rc5; build-tested on net-next.
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 24 ++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3ad9252bf6ae..6e0415538327 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8356,16 +8356,26 @@ int stmmac_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	bool irq_off;
 	int ret;
 
+	/* Resume resets the MAC, leaving every core interrupt unmasked until
+	 * the mask is written again: a link change in that window would storm.
+	 */
+	irq_off = netif_running(ndev);
+	if (irq_off)
+		disable_irq(ndev->irq);
+
 	if (priv->plat->resume) {
 		ret = priv->plat->resume(dev, priv->plat->bsp_priv);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
-	if (!netif_running(ndev))
-		return 0;
+	if (!netif_running(ndev)) {
+		ret = 0;
+		goto out;
+	}
 
 	/* Power Down bit, into the PM register, is cleared
 	 * automatically as soon as a magic packet or a Wake-up frame
@@ -8388,7 +8398,7 @@ int stmmac_resume(struct device *dev)
 	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP)) {
 		ret = stmmac_legacy_serdes_power_up(priv);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	rtnl_lock();
@@ -8442,7 +8452,8 @@ int stmmac_resume(struct device *dev)
 
 	netif_device_attach(ndev);
 
-	return 0;
+	ret = 0;
+	goto out;
 
 error_stop_dma:
 	stmmac_stop_all_dma(priv);
@@ -8451,6 +8462,9 @@ int stmmac_resume(struct device *dev)
 	stmmac_legacy_serdes_power_down(priv);
 	mutex_unlock(&priv->lock);
 	rtnl_unlock();
+out:
+	if (irq_off)
+		enable_irq(ndev->irq);
 
 	return ret;
 }

---
base-commit: 47a1446725732cd3996edf607e8739334bbf4d78
change-id: 20260930-stmmac-irq-shut-03bac57ae0bb

Best regards,
-- 
Igor Velkov <iav@iav.lv>



