Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B29CCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 01:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1KjeJbB49ftbNOn2iCPBabBUaMVVVaJgJNr/pdOrlM=; b=W/1hJm1APEK2O7wgarY1zk7c8b
	muhmTMAldr05RdaSVW/bBxoZ/sNc7qCfWUrOhEgnLMe/qf1URY/UWl0VzyNepcuw/dqWi20+L+pyp
	f51L9XZ65oyRfud1yn2QL2Lk4h3M3Xej2i2kZNVTd6ju/N8jxHb+8L/ioT2LsgBNukqcGOe+AMtUi
	Z84+kabXOadzkZ6t2GMum1cjrwSDK80IeyvRAFKogfzIWonEPpaQUDsi9wLI9EtA1wFLYruw6QGQc
	8bAWOPbrSZ/yQfEsUdzU21mFCcUbnCjEoeV7zfPPoYwSS64mlT50IRGo8DdDt42+aDf+vMUMxLZKE
	BgVis04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ule5H-00000009XSl-3hn3;
	Tue, 12 Aug 2025 01:45:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXcn-00000008qHB-1dmw;
	Mon, 11 Aug 2025 18:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q1KjeJbB49ftbNOn2iCPBabBUaMVVVaJgJNr/pdOrlM=; b=Vxpiq2pSU59mQ/mD4qQ0ewS3My
	cx8Y89kxnQlO2cMXG8zIl+aZlT7kLRvo3tScinz9860YDMaugpKuAxWhHrUooJgQGb37k/uhfaJYg
	MYwGHnfABR6wQhze8fCo6mCfE+N+Y0alWwVuZ+SqqBkEwpaldxt2pzaSksElv7fq4d2sA7gHXu8dN
	hV599OMREjxeaSm2443Nh3rQanaoJKsFbBEJOkzGzB0fQvVVzsRa1FQfRCT8UUxpf/wJ38IwZoYPh
	NOo2JukfcNtlK6m8lKFFZ7SApOoe68l5WXNyGtUAUYIEAH+N4TBhwWeFI8HhNewJW5sWf5C+RrUN9
	oW38ZLYw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48114 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ulXcf-0003bj-3D;
	Mon, 11 Aug 2025 19:51:54 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ulXbx-008gr4-5H; Mon, 11 Aug 2025 19:51:09 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 6/9] net: stmmac: pci: convert to suspend()/resume()
 methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ulXbx-008gr4-5H@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:51:09 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_115201_439069_B1D6A073 
X-CRM114-Status: GOOD (  13.10  )
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

Convert pci to use the new suspend() and resume() methods rather
than implementing these in custom wrappers around the main driver's
suspend/resume methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 73 +++++++++----------
 1 file changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 9c1b54b701f7..e6a7d0ddac2a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -138,6 +138,37 @@ static const struct stmmac_pci_info snps_gmac5_pci_info = {
 	.setup = snps_gmac5_default_data,
 };
 
+static int stmmac_pci_suspend(struct device *dev, void *bsp_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+
+	ret = pci_save_state(pdev);
+	if (ret)
+		return ret;
+
+	pci_disable_device(pdev);
+	pci_wake_from_d3(pdev, true);
+	return 0;
+}
+
+static int stmmac_pci_resume(struct device *dev, void *bsp_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+
+	pci_restore_state(pdev);
+	pci_set_power_state(pdev, PCI_D0);
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	return 0;
+}
+
 /**
  * stmmac_pci_probe
  *
@@ -217,6 +248,9 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	plat->safety_feat_cfg->prtyen = 1;
 	plat->safety_feat_cfg->tmouten = 1;
 
+	plat->suspend = stmmac_pci_suspend;
+	plat->resume = stmmac_pci_resume;
+
 	return stmmac_dvr_probe(&pdev->dev, plat, &res);
 }
 
@@ -231,43 +265,6 @@ static void stmmac_pci_remove(struct pci_dev *pdev)
 	stmmac_dvr_remove(&pdev->dev);
 }
 
-static int __maybe_unused stmmac_pci_suspend(struct device *dev)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	int ret;
-
-	ret = stmmac_suspend(dev);
-	if (ret)
-		return ret;
-
-	ret = pci_save_state(pdev);
-	if (ret)
-		return ret;
-
-	pci_disable_device(pdev);
-	pci_wake_from_d3(pdev, true);
-	return 0;
-}
-
-static int __maybe_unused stmmac_pci_resume(struct device *dev)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	int ret;
-
-	pci_restore_state(pdev);
-	pci_set_power_state(pdev, PCI_D0);
-
-	ret = pci_enable_device(pdev);
-	if (ret)
-		return ret;
-
-	pci_set_master(pdev);
-
-	return stmmac_resume(dev);
-}
-
-static SIMPLE_DEV_PM_OPS(stmmac_pm_ops, stmmac_pci_suspend, stmmac_pci_resume);
-
 /* synthetic ID, no official vendor */
 #define PCI_VENDOR_ID_STMMAC		0x0700
 
@@ -289,7 +286,7 @@ static struct pci_driver stmmac_pci_driver = {
 	.probe = stmmac_pci_probe,
 	.remove = stmmac_pci_remove,
 	.driver         = {
-		.pm     = &stmmac_pm_ops,
+		.pm     = &stmmac_simple_pm_ops,
 	},
 };
 
-- 
2.30.2


