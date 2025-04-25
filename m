Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8FEC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETEOctSrz3SPZaNwMr7XaKbNs3FrR7Qo8IEpjXVtJ6E=; b=aalEjdDt5PJuN9ty08mt+Af7mc
	piHs+aWQgKl0TNfrgsPOTJpHrxpNIzf/ijNsNmh/P0UQ+WYcL69WBzhisEFoQQONt4q82vOGMLRIA
	TTaSZCTqZEJ8iHaFMoNks1sRcEcNIAb0Zb4IDVfov+EvgGsKT36s3cgmMu4fIxLcMO4PVP5ngfESj
	J++DIma95vlRF2TMQwv8ALLbS8o7iECWBUCNOgu45btnfkXW8bHS+aDI4rB07+LnScuAAWukUjt89
	GEx1DLOzkgZBmhz8zm+69jD6LRsptusPhPDZ+ZCxJJFRLXWt+6BUv9WMn06t0r3f6J3NespRnTTXm
	hBHMQ+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FUb-0000000GZU4-0F8y;
	Fri, 25 Apr 2025 09:37:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EtM-0000000GRuy-42dv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBAC16845F;
	Fri, 25 Apr 2025 08:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFD9C4CEEF;
	Fri, 25 Apr 2025 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571520;
	bh=/riavgLrn/g2Hnn+PvsGhLQKcPhklIh8LsugSyRIhnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q4vcUWZMRmElkhA8v6VQgdgQvXSMS9Xu2h+CVmbQbZY5E1Wo8QmqF/GEDh8Es9vZy
	 dERS/Wq6Cd2a6eI+wRYazECrl8TBsvymEX+AQ+E3HB1FS6rEjNh5T7FK376sQXmQSY
	 tqku3xiNxvmHwM2UsQknFrZOB/4gc+p6dOpZ1gkJaSV8oBZv1FpFLRUQ8sq78AIdBJ
	 V1Uqs3qPr9+wQhuTZ7pY/lJ6+CKJaH0ZYEUwii+lCcfi/wowTTIUkuIRpUh9amA0iC
	 pzmbg/mfqa3KgtLTo+zo5HeWLXr9patZTNIdqV2HS0OOkE8Bws7cXC5Mh0rZ8vOF3C
	 uCb8UTQl+E+9w==
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
Subject: [PATCH v2 7/8] net: thunder_bgx: Use pure PCI devres API
Date: Fri, 25 Apr 2025 10:57:40 +0200
Message-ID: <20250425085740.65304-9-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425085740.65304-2-phasta@kernel.org>
References: <20250425085740.65304-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 608cc6af5af1..c9369bdd04e0 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1605,7 +1605,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return dev_err_probe(dev, err, "Failed to enable PCI device\n");
 	}
 
-	err = pci_request_regions(pdev, DRV_NAME);
+	err = pcim_request_all_regions(pdev, DRV_NAME);
 	if (err) {
 		dev_err(dev, "PCI request regions failed 0x%x\n", err);
 		goto err_disable_device;
@@ -1616,7 +1616,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!bgx->reg_base) {
 		dev_err(dev, "BGX: Cannot map CSR memory space, aborting\n");
 		err = -ENOMEM;
-		goto err_release_regions;
+		goto err_disable_device;
 	}
 
 	set_max_bgx_per_node(pdev);
@@ -1688,8 +1688,6 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_enable:
 	bgx_vnic[bgx->bgx_id] = NULL;
 	pci_free_irq(pdev, GMPX_GMI_TX_INT, bgx);
-err_release_regions:
-	pci_release_regions(pdev);
 err_disable_device:
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
@@ -1710,7 +1708,6 @@ static void bgx_remove(struct pci_dev *pdev)
 	pci_free_irq(pdev, GMPX_GMI_TX_INT, bgx);
 
 	bgx_vnic[bgx->bgx_id] = NULL;
-	pci_release_regions(pdev);
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
 }
-- 
2.48.1


