Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB204CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/OOMMnGRa0UXdpVnw4kyErz+/pXJcwYvTUnm/qmSyM=; b=LfV2gz1W61lYjrbtPIDeL4qzZ6
	mvQdN5rYv9sP3EIXQ+3YZDauNszDibRmqKKEfQ1i7AvS+qOuQK0RO0WgNo1BV5+1Vtq/BCJ5EhYwj
	g7Wkw5jYzMvzuD4zkkXxLKAANXI4IkEnCgH9kDuUAsFbQzHbH4PYFA/dBBrBkkK4cEY7f4pxtHtEa
	id3Lf1IqikQ1s0TwGnb43YzpsUC5jVkw601tp4lFHnbGLz5DLXvjFHhZ10vd80/WlYBHvm1RSHBZF
	K1ZhjzFSoLNGOtqAIifXjdPh+QiKEGV+x0jqtQPDpWs8lbtOt3DgZbh+Xie95SJbOfw5ndRgaY9iK
	TXEBwC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbcA-00000002p9U-1PaH;
	Wed, 03 Sep 2025 00:44:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWWf-00000001ggF-0TVE;
	Tue, 02 Sep 2025 19:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=R/OOMMnGRa0UXdpVnw4kyErz+/pXJcwYvTUnm/qmSyM=; b=EXQmBlkQp4i/BKlOhNOHCfcLNT
	0LmNTzCQBvtgzQf2CnVVG1jDFClz0LL69jmChQzzT9YpgyeoLGPPHQi9NJbjdmYkoKw58mkGUvJJ6
	xPFr2sGFVMqg3Fwm2rrMbw7UNEJrPJyRjAFcNyQ1GmCo4amaWn32imW3V1JsjQJExJfEWVNJJc5a4
	L4H3fejqkr5UNkhgVvZKxjYZPw9fEQ7piufB9Q51NtT/NKUDw2H/D2WF1DhHlZO3liKtf58t8ioHG
	QFpL6NilTsHTpBAn4KzahR6AC3CiwfnzjHArrRYJzJAaeWTQcTTpY8/FY9S+oD3CM6IdQZeK/HEYU
	hEfVBj1g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWWW-000000043H2-1rb2;
	Tue, 02 Sep 2025 19:18:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C19340549;
	Tue,  2 Sep 2025 19:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C144C4CEED;
	Tue,  2 Sep 2025 19:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756840711;
	bh=MFLQY/3DGbD2c7bfFL0UAO+xBUCRpSIBXkqsHYgalMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cT33Y4td/U+q9z8KfGp7ejLVtlQ3GF+JT/JPonNoCs++TpyQZ2T4+El/zxnAOrDNE
	 lHjPfpIfsH5kiV3KYQc6ghvWsKBAaehQrbKA0HL3NliFWTT/5UEes1XZjB0QflN5F9
	 xAKV2163+7qsf5d2wUXTBfCSNa+FEmF/HFiOX5XwJd2PJo1jJsw5sTit+zQBc/UktU
	 veXrpzV/bqw8O1ZtaaO67WAO8k+7w14boPhb7XZBCwRBM3o9Mu6hRd6uFvJOtjVW0V
	 w7mPLoCjr4NbolJVZM/k8wJLuu2K2ANbVcz6MmJx+5QrtXiVD5SKEBVdWjQGeg8JVz
	 5N1o0K9dy1GHA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 02 Sep 2025 21:17:59 +0200
Subject: [PATCH mt76 v3 09/15] wifi: mt76: mt7996: Fix RX packets
 configuration for primary WED device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-mt7996-rro-rework-v3-9-8f813890959e@kernel.org>
References: <20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org>
In-Reply-To: <20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_201832_848071_74FB8BA9 
X-CRM114-Status: GOOD (  11.22  )
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


