Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D51BCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/OOMMnGRa0UXdpVnw4kyErz+/pXJcwYvTUnm/qmSyM=; b=lJwf3XnPIKhBy94vh0F7FxZBLI
	Sz9+TB37+nZ7oexFIu6oJ0IRPL4O0Avvl4pDUMMcTpIO0xiZrcKBKxRGU//QMyrFMmP2ALYWpsK27
	LeH7L4BPRnjBD584i3+jEtcgLEyGZOpmDSSxxL3G+Q5CEsnbVHZ/ahkpPECtf3hb1hbt//5zEyZo6
	CZcEIUJFkBtioj7h5rFjwUwzSrb8vYvjRYjqJ5I95m3N8/MMro87QUSgY7o4/zyW9zu1HTo0odYhT
	Le/nhlVbbX9CHWrB4+euQpQrATosO+XenQBn9G542cna0FW2hpBoI54dYJpuhbPbPic7x6LS5whty
	tR+F/Spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0o-0000000FxyZ-38mc;
	Fri, 05 Sep 2025 02:17:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCyw-0000000D0KC-0z6g;
	Thu, 04 Sep 2025 16:38:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAF0660247;
	Thu,  4 Sep 2025 16:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED72C4CEF6;
	Thu,  4 Sep 2025 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757003921;
	bh=MFLQY/3DGbD2c7bfFL0UAO+xBUCRpSIBXkqsHYgalMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YTSipvNU+p80tQCjNX9bEipUoYOTR+avO1QWBlFoA/sTdGsbWJV1bw2ShDsGE54eY
	 p3Zjqnudr0+kxc+cLmccSQUmJc3iihUjpZ3whvxcD2Gjrg8Oj1ZVzHVLsla0nBYEft
	 /ILbVe8UlLKXlLe+ewgBL8mO/u9Mv9u2c4jLvlosLt70IIZOHW0L+SQJfRGitkturx
	 si7e2X/9PY5mOBS+o86n+AAcKqZjXBoeUBGFiYsgzQghTBLa5Opqj3hVEAbv75xQlH
	 OVyjjSbkWfFhYY6udAZDDrYSHCjUXZ+N+kATh/hQhD8BXjLoF69wNhtXjCScmVWHP4
	 YwjyXcDhaILLw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Sep 2025 18:38:03 +0200
Subject: [PATCH mt76 v4 09/15] wifi: mt76: mt7996: Fix RX packets
 configuration for primary WED device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mt7996-rro-rework-v4-9-2cd91e7229d6@kernel.org>
References: <20250904-mt7996-rro-rework-v4-0-2cd91e7229d6@kernel.org>
In-Reply-To: <20250904-mt7996-rro-rework-v4-0-2cd91e7229d6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

In order to properly set the number of rx packets for primary WED device
if hif device is available, move hif pointer initialization before
running mt7996_mmio_wed_init routine.

Fixes: 83eafc9251d6d ("wifi: mt76: mt7996: add wed tx support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index 19e99bc1c6c4157fb3c2c1b9ee70ed00a6e28a73..f5ce50056ee94e2915fd189419905acc8cebd853 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -137,6 +137,7 @@ static int mt7996_pci_probe(struct pci_dev *pdev,
 	mdev = &dev->mt76;
 	mt7996_wfsys_reset(dev);
 	hif2 = mt7996_pci_init_hif2(pdev);
+	dev->hif2 = hif2;
 
 	ret = mt7996_mmio_wed_init(dev, pdev, false, &irq);
 	if (ret < 0)
@@ -161,7 +162,6 @@ static int mt7996_pci_probe(struct pci_dev *pdev,
 
 	if (hif2) {
 		hif2_dev = container_of(hif2->dev, struct pci_dev, dev);
-		dev->hif2 = hif2;
 
 		ret = mt7996_mmio_wed_init(dev, hif2_dev, true, &hif2_irq);
 		if (ret < 0)

-- 
2.50.1


