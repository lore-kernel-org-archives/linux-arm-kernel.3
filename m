Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B96CCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 05:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kOycQAn3F/dSwnALzJQ/Izf0BV+fvtyjQ4HcxTyjbFA=; b=n1Ui52F1LQUXwnlABRkLrlhtjt
	UCKTM67R/ooztx39j1g5JwHWbBXiQg2i3cVQ6gOdQ5sdDcShQ043ko36C2n6Rs+SeJpVKGRfK/Ytd
	mdu9ttwcHhfpzvTra2pSxiO5Dq0Rz4+u0VZ9RIKFhhlfEhilp1KUi/DqCNNvijrVqmbyk/6DHcrXP
	Ns8GXiwsq8Z4lR0Ed77IB23lSam4SWIOOvJyRqz53F4sy8rbHho0yipH79B5oHhhDaeSJWT2TBcsE
	cUE/xv+5LB0gyawUly6aQPjJONR7Y45A8tbPSbN+IeXWFomlYwodpqR4SB1rHGBp/7EBjITC6s9rJ
	fjsoOyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS6wA-00000003M5p-2BK9;
	Wed, 27 May 2026 05:36:14 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS6w7-00000003M48-2vZ4;
	Wed, 27 May 2026 05:36:13 +0000
X-UUID: f373f398598d11f1aa26b74ffac11d73-20260527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ca10df57-2e0c-4fc6-ae09-74bcce23b991,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:c81a0b6628644515af518e935d81ca37,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f373f398598d11f1aa26b74ffac11d73-20260527
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 627080900; Wed, 27 May 2026 13:36:03 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	xiong.huang@mediatek.com,
	madhurkumar004@gmail.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v3] wifi: mt76: mt7921: fix resource leak in probe error path
Date: Wed, 27 May 2026 13:35:59 +0800
Message-Id: <20260527053559.539603-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_223612_065229_5014FC52 
X-CRM114-Status: GOOD (  10.27  )
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

When pcim_iomap_region() or devm_kmemdup() fail, the code returns
directly without cleaning up previously allocated resources:
  - mt76_device allocated by mt76_alloc_device()
  - pci irq vectors allocated by pci_alloc_irq_vectors()
Fix this by jumping to the existing error cleanup path instead of
returning directly.

To avoid using an uninitialized variable in the error path, move the
dev initialization before the error checks.

Fixes: ee5bb35d2b83 ("wifi: mt76: mt7921: Replace deprecated PCI function")
Fixes: 222606f43b58 ("wifi: mt76: mt7921: handle MT7902 irq_map quirk with mutable copy")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

---
 Change in v3
  - Fix incorrect Fixes: tag as pointed out by Sean
  - Correct tag from unrelated phy/ti-pipe3 commit to the actual mt76 commit
    that introduced the resource leak
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 7a790ddf43bb..49a37185f056 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -343,11 +343,14 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, mdev);
 
+	dev = container_of(mdev, struct mt792x_dev, mt76);
+
 	regs =  pcim_iomap_region(pdev, 0, pci_name(pdev));
-	if (IS_ERR(regs))
-		return PTR_ERR(regs);
+	if (IS_ERR(regs)) {
+		ret = PTR_ERR(regs);
+		goto err_free_dev;
+	}
 
-	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &mt7921_pcie_ops;
 	dev->irq_map = &irq_map;
@@ -359,8 +362,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 		/* MT7902 needs a mutable copy because wm2_complete_mask differs */
 		map = devm_kmemdup(&pdev->dev, &irq_map,
 				   sizeof(irq_map), GFP_KERNEL);
-		if (!map)
-			return -ENOMEM;
+		if (!map) {
+			ret = -ENOMEM;
+			goto err_free_dev;
+		}
 
 		map->rx.wm2_complete_mask = 0;
 		dev->irq_map = map;
-- 
2.25.1


