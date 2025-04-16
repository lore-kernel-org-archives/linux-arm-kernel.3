Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9F0C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/xRy52iYeTroLYnfOD9ninWay+1kO4wUcjeSB6+JNg=; b=N0piNz3Wz8UieplEVmAO5perWL
	VEjPYPR5TT1go1Qy8gUUTOh/v6LtXMmwabFmWymEd5Q2TMBKT1ozkGHJJv4VCw+TgPNucw6DuXovc
	NPhBlhMMtJyvWxULLESYmFkQN4TTmphEC0CvQZA3NnlfAEFSUWF49gOjTpXpwDpFOQb0dBHeIGg7c
	dnB2HWXNbNQ3V4VfSepXtDaplxeSuBqffPuSkN26/CLk3Q4jRp8Zlmb7sFXq5dWm/HtXuBMOffUOh
	mkYQvik/PCVHA9GnAja4r034tsMDulgz5FP6sGsrJrif6r8TBYuCDvYWNPKGmQhku6LmFXoe0xkCE
	foAwPO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56JX-0000000ANM1-02Qj;
	Wed, 16 Apr 2025 17:12:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55sO-0000000AJ7o-1Xz0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:44:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DED6649CF4;
	Wed, 16 Apr 2025 16:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36939C4CEE2;
	Wed, 16 Apr 2025 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821879;
	bh=MlToCWePVf2EnjbdIIgvSQQgrmnwAUG5WRD/p2xO3ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Aci34767h+fcH4jNUxXGMWIf+Z/P2AsHgvmV+JqNiADqPGt0jgHrlylGMymeApR73
	 y59g/0JnSBqaJslBmOGd2zi0wkMglRg5uLkw57ogkpUIxLOBq7q7b9Yk4pHIWS0NUs
	 ZnsWs/bNwkukJ876UXE7HwHS9XUBGlKBJRw2S46Mjb2pT1YiVPAmPGrKR00vty9yui
	 XLdAYjCuGsF8ZGye+sh84TqMGFq/SepChsFfaaGLFZQ9SiTpQZK+ViN/fHCkavEeHd
	 A137Q6UYPaVgWwyCKCQKyPWrJOaLhVKLfO698apVIyFdaaWEeeDL7eYfVqm5futCin
	 GH1iw1NfJJqyg==
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
	Thomas Gleixner <tglx@linutronix.de>,
	Philipp Stanner <phasta@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH 2/8] net: octeontx2: Use pure PCI devres API
Date: Wed, 16 Apr 2025 18:44:02 +0200
Message-ID: <20250416164407.127261-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416164407.127261-2-phasta@kernel.org>
References: <20250416164407.127261-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_094440_447801_299B9B81 
X-CRM114-Status: GOOD (  14.68  )
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
 drivers/net/ethernet/marvell/octeontx2/nic/rep.c   |  4 +---
 3 files changed, 9 insertions(+), 23 deletions(-)

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
index 04e08e06f30f..516471f172d1 100644
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
@@ -822,7 +822,6 @@ static int rvu_rep_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_free_irq_vectors(pdev);
 err_release_regions:
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


