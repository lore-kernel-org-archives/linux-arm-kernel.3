Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C5AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VLD2YO8QmPm18c5l+QwQ6gfFIHKd9nisx97EQyVw55Y=; b=NQCt35acvwLhpRbC/JtkPbnBfV
	Ok3+/iuxSfphKc6IXdZ3e7tUeW5OC/LwU6muey6Bsm/nI6AUcwM1U3M+1yaO4/85NWiTD2ldqXj0e
	Ta0eD0Kp0v/FLLttWqoD9IKfrv4E9FUNtI74eXA0VTNV6j6ag4rHOWYk1izPQ3uj9SpZt+KsSpTWG
	ahX/n4Uy6U2J2mJHWbiUCvO4bplOeKnBOZVHwaeYedhi/rgKdmdluAq2KM9iTJqtYqDJorm+KjCHu
	8Q4jpLYb3HC5M2Zlmj6XevwShPq4Ki+tYSlIHr9mlpVaxLzzhamShHl70kb9BqEjyYeeYajjGk6tk
	1X5kQNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiESc-00000007oz8-2ER5;
	Wed, 12 Feb 2025 15:15:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiECo-00000007mJv-2H1m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:59:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 214095C5F24;
	Wed, 12 Feb 2025 14:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C524C4CEDF;
	Wed, 12 Feb 2025 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739372353;
	bh=oCvq9gSavJWl2kDBTfPs3YD8zX+/lohqwlywSoG+xkQ=;
	h=From:To:Cc:Subject:Date:From;
	b=hHVQnH6CNr1DzWYc7ti8auIZ/FJHzitoE4i/mpGQgFTAleKGfwLoybhM9Pyoop3SW
	 qEwgOvKAQvnZm1sJliTrLgmB74tMM1OGMmzzm/+KuOfYCjKCHFMZBkC49DPz5eoC7o
	 3q6hox23kgW2BrozBC5dt0lXhATKjuMUwfnkR0utm9dwqq5hPKRxlaHXKMAPGCzzWc
	 d/5D1MW5Vf+NBRv7b2xL0TQs2Ib7FRaJhrWTQhV0Jkrq34z9bNgUYWy7MPdeN//8qa
	 sMprTgrL6hVlfF50Ut2YlltyO+xk0b2JZyZoclBGdPliHjbfAVGWTelTS8U+GbGLgU
	 T1DYxD/Orn1PA==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Philipp Stanner <pstanner@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] stmmac: Replace deprecated PCI functions
Date: Wed, 12 Feb 2025 15:58:32 +0100
Message-ID: <20250212145831.101719-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065914_696219_8A925402 
X-CRM114-Status: GOOD (  19.16  )
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

From: Philipp Stanner <pstanner@redhat.com>

The PCI functions
  - pcim_iomap_regions()
  - pcim_iomap_table() and
  - pcim_iounmap_regions()
have been deprecated.

The usage of pcim_* cleanup functions in the driver detach path (remove
callback) is actually not necessary, since they perform that cleanup
automatically.

Replace them with pcim_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 28 ++++++-------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 24 ++++------------
 2 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index bfe6e2d631bd..19b16df864dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -11,6 +11,8 @@
 #include "dwmac_dma.h"
 #include "dwmac1000.h"
 
+#define DRIVER_NAME "dwmac-loongson-pci"
+
 /* Normal Loongson Tx Summary */
 #define DMA_INTR_ENA_NIE_TX_LOONGSON	0x00040000
 /* Normal Loongson Rx Summary */
@@ -520,7 +522,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 {
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_pci_info *info;
-	struct stmmac_resources res;
+	struct stmmac_resources res = {};
 	struct loongson_data *ld;
 	int ret, i;
 
@@ -552,17 +554,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	pci_set_master(pdev);
 
 	/* Get the base address of device */
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
-		if (ret)
-			goto err_disable_device;
-		break;
-	}
-
-	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[0];
+	res.addr = pcim_iomap_region(pdev, 0, DRIVER_NAME);
+	ret = PTR_ERR_OR_ZERO(res.addr);
+	if (ret)
+		goto err_disable_device;
 
 	plat->bsp_priv = ld;
 	plat->setup = loongson_dwmac_setup;
@@ -617,13 +612,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
 	if (ld->loongson_id == DWMAC_CORE_LS_MULTICHAN)
 		loongson_dwmac_msi_clear(pdev);
 
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		pcim_iounmap_regions(pdev, BIT(i));
-		break;
-	}
-
 	pci_disable_device(pdev);
 }
 
@@ -673,7 +661,7 @@ static const struct pci_device_id loongson_dwmac_id_table[] = {
 MODULE_DEVICE_TABLE(pci, loongson_dwmac_id_table);
 
 static struct pci_driver loongson_dwmac_driver = {
-	.name = "dwmac-loongson-pci",
+	.name = DRIVER_NAME,
 	.id_table = loongson_dwmac_id_table,
 	.probe = loongson_dwmac_probe,
 	.remove = loongson_dwmac_remove,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 352b01678c22..f3279c4387c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -155,7 +155,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 {
 	struct stmmac_pci_info *info = (struct stmmac_pci_info *)id->driver_data;
 	struct plat_stmmacenet_data *plat;
-	struct stmmac_resources res;
+	struct stmmac_resources res = {};
 	int i;
 	int ret;
 
@@ -188,13 +188,13 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 		return ret;
 	}
 
-	/* Get the base address of device */
+	/* The first BAR > 0 is the base IO addr of our device. */
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (pci_resource_len(pdev, i) == 0)
 			continue;
-		ret = pcim_iomap_regions(pdev, BIT(i), pci_name(pdev));
-		if (ret)
-			return ret;
+		res.addr = pcim_iomap_region(pdev, i, STMMAC_RESOURCE_NAME);
+		if (IS_ERR(res.addr))
+			return PTR_ERR(res.addr)
 		break;
 	}
 
@@ -204,8 +204,6 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[i];
 	res.wol_irq = pdev->irq;
 	res.irq = pdev->irq;
 
@@ -226,21 +224,11 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
  * stmmac_pci_remove
  *
  * @pdev: platform device pointer
- * Description: this function calls the main to free the net resources
- * and releases the PCI resources.
+ * Description: Main driver resource release function
  */
 static void stmmac_pci_remove(struct pci_dev *pdev)
 {
-	int i;
-
 	stmmac_dvr_remove(&pdev->dev);
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		pcim_iounmap_regions(pdev, BIT(i));
-		break;
-	}
 }
 
 static int __maybe_unused stmmac_pci_suspend(struct device *dev)
-- 
2.47.1


