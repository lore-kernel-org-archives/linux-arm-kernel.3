Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CD1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVUc94h1GLoD9GVuzV+kz6LeYSGOIc/TeAnbiXx9G9E=; b=J4C4S/kIa1zVS6e1HS66VEO7Zc
	ZReWJm4gkh9DF4pINZCsKQplqKeL9VcTXmYSOVqGaRq1OkVEZfJNQs1dY9D/2Y4c2duc1R12VHej7
	eCidDJKzQ74UzolIPfcETrPfmC1UGeI4TeKMsYGEokoMu5WwcV1RhOwMFBPK3fyUqrcaWGRY39ha5
	DGCgcpixHexWeF54QHt97dSyUJgsz1wZD41OwZikEjSCBqjYn2ajSxkxbwqK19pQhnsy7eKRssIat
	rqDhZkGqAE7cPmbMOlnyI85jKBx4ZIZ+N0PHE+qm9rlM/fSKtMoN1AOJXjCM7gQJbfGOwWCJb5O5i
	BnoDp2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FWQ-0000000GZrb-2zvv;
	Fri, 25 Apr 2025 09:39:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EtT-0000000GRwd-1sJM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2BAA5C3AD7;
	Fri, 25 Apr 2025 08:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669C7C4CEE4;
	Fri, 25 Apr 2025 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571526;
	bh=189wyjGuYuaHlkManBiYipumPeAhOLGmKz8J7H5MS8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VxBcml0/2zzf7TV0kg2cY1Y1PQOb5g1wqcAAoFO/PPePO/MHbGgE6egAB98PCUNLF
	 HdJvDZh37bJ2MZofOYdkxT5XBcUD7fiBd5XkPcVitRKjPvqoWWxN2O3m/v1ICvl+/2
	 KVWXSXmR1nrWONKydXVyGy+er1VzAxcfUBc82Bu+J6+HceLRcHGQaA/XUEwXma08UQ
	 vKHQqw31i2egxr9bPprVVeQhqmAqsk/n0lFHZUg0aTiAsyXq6NiCNHnrPbV+jLEIDv
	 d9Ln2ZFWNkljVMIZZ1xQRu8ZY3BSYZS09zND5o9DkQerc4Jws/Prtzk9Iql5E+BLi2
	 rWPJ/aU7vJdRA==
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
Subject: [PATCH v2 8/8] net: thunder_bgx: Don't disable PCI device manually
Date: Fri, 25 Apr 2025 10:57:41 +0200
Message-ID: <20250425085740.65304-10-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425085740.65304-2-phasta@kernel.org>
References: <20250425085740.65304-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_015847_573257_CB2F44F0 
X-CRM114-Status: GOOD (  13.29  )
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

thunder_bgx's PCI device is enabled with pcim_enable_device(), a managed
devres function which ensures that the device gets enabled on driver
detach automatically.

Remove the calls to pci_disable_device().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index c9369bdd04e0..3b7ad744b2dd 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1608,7 +1608,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	err = pcim_request_all_regions(pdev, DRV_NAME);
 	if (err) {
 		dev_err(dev, "PCI request regions failed 0x%x\n", err);
-		goto err_disable_device;
+		goto err_zero_drv_data;
 	}
 
 	/* MAP configuration registers */
@@ -1616,7 +1616,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!bgx->reg_base) {
 		dev_err(dev, "BGX: Cannot map CSR memory space, aborting\n");
 		err = -ENOMEM;
-		goto err_disable_device;
+		goto err_zero_drv_data;
 	}
 
 	set_max_bgx_per_node(pdev);
@@ -1688,8 +1688,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_enable:
 	bgx_vnic[bgx->bgx_id] = NULL;
 	pci_free_irq(pdev, GMPX_GMI_TX_INT, bgx);
-err_disable_device:
-	pci_disable_device(pdev);
+err_zero_drv_data:
 	pci_set_drvdata(pdev, NULL);
 	return err;
 }
@@ -1708,7 +1707,6 @@ static void bgx_remove(struct pci_dev *pdev)
 	pci_free_irq(pdev, GMPX_GMI_TX_INT, bgx);
 
 	bgx_vnic[bgx->bgx_id] = NULL;
-	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
 }
 
-- 
2.48.1


