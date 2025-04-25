Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8C9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zE0tKL/hyf3V5KnSIIgfQtQGYpkPD8lxyQAdHmVUnc4=; b=wPAzjUkUd+BytZIYJt/IkcU63O
	gRSGqPijfcfqTWUejwCCOZu6zKmpogOHUheEPNZq5CS0XjkQkP/xMiuANYJYCvaUXE/UgNg5IBcmW
	KofFjkx7ECDJD1CSEObiA377RIw3Smrnim/SixAy/2OISzVmzBFuFlDaNgX0N9osIR3yIxQu7tta5
	tBXFiP4SE+z3qNMhHT8O1C2+6v5TkPhMlKIsJqRF0x94D9S3GspKF2f7HdwyU6wL30KH/W7McRzUm
	jprMQzTEUuRvkm623sHSzEdRuXLH/KuB82xACB08WPMoq951qjiEuITtrFvaCCy6OH1DAN9phzvAn
	7KOuWisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FJd-0000000GX2N-3dIx;
	Fri, 25 Apr 2025 09:25:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Eso-0000000GRni-3aTB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D71F443FA2;
	Fri, 25 Apr 2025 08:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8EEC4CEE4;
	Fri, 25 Apr 2025 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571486;
	bh=Yvoue+F0edeKn+VVijS0ELNZWKE39hZnWZ8xXcZpPKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fy5NNKAdc+O9dq8VB8U2ZCFdvYGQHFATOAYQ9d5sWnMFUIIjRvY61cNk2+K43bwOi
	 13EoiuUH88j1mrbF9W0J+1y90tgisJVeZQVZ97cQIhwazkNMrHr1ui4/EWDFQ8hmTZ
	 VVAq0aK+7oVTDl2vy1XVzrA4unS//OyLRZsKyEyiF3g5GcBUTwvMhjg+w6UItwAfNV
	 3041sc3geLGJBDnAsd0ZTil9esn9aYlfCmz6D8pRdQlHqNRCXUREtbMcWZxBaoNfpy
	 dufhDbq1x7MZGeHt+AIYvAzMBhtuPNSV5hpqZAZGKNO7Qf+LCsFhGMUbWRNE+tPCpz
	 oVqfIooMixUIA==
From: Philipp Stanner <phasta@kernel.org>
To: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Daniele Venzano <venza@brownhat.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Stanner <phasta@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH v2 2/8] net: octeontx2: Use pure PCI devres API
Date: Fri, 25 Apr 2025 10:57:35 +0200
Message-ID: <20250425085740.65304-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425085740.65304-2-phasta@kernel.org>
References: <20250425085740.65304-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_015806_930885_D17EDFE7 
X-CRM114-Status: GOOD (  14.96  )
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

The currently used function pci_request_regions() is one of the
problematic "hybrid devres" PCI functions, which are sometimes managed
through devres, and sometimes not (depending on whether
pci_enable_device() or pcim_enable_device() has been called before).

The PCI subsystem wants to remove this behavior and, therefore, needs to
port all users to functions that don't have this problem.

Furthermore, the PCI function being managed implies that it's not
necessary to call pci_release_regions() manually.

Remove the calls to pci_release_regions().

Replace pci_request_regions() with pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c   | 14 ++++----------
 .../net/ethernet/marvell/octeontx2/nic/otx2_vf.c   | 14 ++++----------
 drivers/net/ethernet/marvell/octeontx2/nic/rep.c   | 12 +++++-------
 3 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index cfed9ec5b157..0aee8e3861f3 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -3048,7 +3048,7 @@ static int otx2_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return err;
 	}
 
-	err = pci_request_regions(pdev, DRV_NAME);
+	err = pcim_request_all_regions(pdev, DRV_NAME);
 	if (err) {
 		dev_err(dev, "PCI request regions failed 0x%x\n", err);
 		return err;
@@ -3057,7 +3057,7 @@ static int otx2_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
 	if (err) {
 		dev_err(dev, "DMA mask config failed, abort\n");
-		goto err_release_regions;
+		return err;
 	}
 
 	pci_set_master(pdev);
@@ -3067,10 +3067,8 @@ static int otx2_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	qos_txqs = min_t(int, qcount, OTX2_QOS_MAX_LEAF_NODES);
 
 	netdev = alloc_etherdev_mqs(sizeof(*pf), qcount + qos_txqs, qcount);
-	if (!netdev) {
-		err = -ENOMEM;
-		goto err_release_regions;
-	}
+	if (!netdev)
+		return -ENOMEM;
 
 	pci_set_drvdata(pdev, netdev);
 	SET_NETDEV_DEV(netdev, &pdev->dev);
@@ -3246,8 +3244,6 @@ static int otx2_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 err_free_netdev:
 	pci_set_drvdata(pdev, NULL);
 	free_netdev(netdev);
-err_release_regions:
-	pci_release_regions(pdev);
 	return err;
 }
 
@@ -3447,8 +3443,6 @@ static void otx2_remove(struct pci_dev *pdev)
 	pci_free_irq_vectors(pf->pdev);
 	pci_set_drvdata(pdev, NULL);
 	free_netdev(netdev);
-
-	pci_release_regions(pdev);
 }
 
 static struct pci_driver otx2_pf_driver = {
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
index 7ef3ba477d49..fb4da816d218 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
@@ -548,7 +548,7 @@ static int otx2vf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return err;
 	}
 
-	err = pci_request_regions(pdev, DRV_NAME);
+	err = pcim_request_all_regions(pdev, DRV_NAME);
 	if (err) {
 		dev_err(dev, "PCI request regions failed 0x%x\n", err);
 		return err;
@@ -557,7 +557,7 @@ static int otx2vf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
 	if (err) {
 		dev_err(dev, "DMA mask config failed, abort\n");
-		goto err_release_regions;
+		return err;
 	}
 
 	pci_set_master(pdev);
@@ -565,10 +565,8 @@ static int otx2vf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	qcount = num_online_cpus();
 	qos_txqs = min_t(int, qcount, OTX2_QOS_MAX_LEAF_NODES);
 	netdev = alloc_etherdev_mqs(sizeof(*vf), qcount + qos_txqs, qcount);
-	if (!netdev) {
-		err = -ENOMEM;
-		goto err_release_regions;
-	}
+	if (!netdev)
+		return -ENOMEM;
 
 	pci_set_drvdata(pdev, netdev);
 	SET_NETDEV_DEV(netdev, &pdev->dev);
@@ -765,8 +763,6 @@ static int otx2vf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 err_free_netdev:
 	pci_set_drvdata(pdev, NULL);
 	free_netdev(netdev);
-err_release_regions:
-	pci_release_regions(pdev);
 	return err;
 }
 
@@ -815,8 +811,6 @@ static void otx2vf_remove(struct pci_dev *pdev)
 	pci_free_irq_vectors(vf->pdev);
 	pci_set_drvdata(pdev, NULL);
 	free_netdev(netdev);
-
-	pci_release_regions(pdev);
 }
 
 static struct pci_driver otx2vf_driver = {
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
index 04e08e06f30f..0bb8a971c4ff 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
@@ -763,7 +763,7 @@ static int rvu_rep_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return err;
 	}
 
-	err = pci_request_regions(pdev, DRV_NAME);
+	err = pcim_request_all_regions(pdev, DRV_NAME);
 	if (err) {
 		dev_err(dev, "PCI request regions failed 0x%x\n", err);
 		return err;
@@ -772,7 +772,7 @@ static int rvu_rep_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
 	if (err) {
 		dev_err(dev, "DMA mask config failed, abort\n");
-		goto err_release_regions;
+		goto err_set_drv_data;
 	}
 
 	pci_set_master(pdev);
@@ -780,7 +780,7 @@ static int rvu_rep_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		err = -ENOMEM;
-		goto err_release_regions;
+		goto err_set_drv_data;
 	}
 
 	pci_set_drvdata(pdev, priv);
@@ -797,7 +797,7 @@ static int rvu_rep_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	err = otx2_init_rsrc(pdev, priv);
 	if (err)
-		goto err_release_regions;
+		goto err_set_drv_data;
 
 	priv->iommu_domain = iommu_get_domain_for_dev(dev);
 
@@ -820,9 +820,8 @@ static int rvu_rep_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	otx2_disable_mbox_intr(priv);
 	otx2_pfaf_mbox_destroy(priv);
 	pci_free_irq_vectors(pdev);
-err_release_regions:
+err_set_drv_data:
 	pci_set_drvdata(pdev, NULL);
-	pci_release_regions(pdev);
 	return err;
 }
 
@@ -842,7 +841,6 @@ static void rvu_rep_remove(struct pci_dev *pdev)
 	otx2_pfaf_mbox_destroy(priv);
 	pci_free_irq_vectors(priv->pdev);
 	pci_set_drvdata(pdev, NULL);
-	pci_release_regions(pdev);
 }
 
 static struct pci_driver rvu_rep_driver = {
-- 
2.48.1


