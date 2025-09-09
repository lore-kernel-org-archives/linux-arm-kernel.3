Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D0CCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHTTnwWfdKR0nSGMDLv3kx8VYhr1MQ2PFILRuno9jus=; b=tTVVnBDlP1mIt3Zxn/UvrBcCUv
	zCBwKMPF/W7xMc5zYLMqbTy56NPQlt5+1rE/hdylo7ujsZl5n5QCPzkPmQpCZqa64OmxZFE1EarkO
	VAF4+eWEDHFYMzFrs+Y+zH5O8fMp3o5BUkc5TPuq+NJt3hr3ipLy+CnEUBMUlRnbOVhzR+nnpQX/3
	dpEJQngNjz95psh79vdsz556kZJg9rkfB1lLgW6QKkekg3vl5usYT/EKZtiS0K1KsxBA+EFSBmFof
	QwguflwmqJjvkO33ipqr00rcnA4mmK4cet8duvUaEEJMutf9clgoNzuL3wg6+ysW1/bqOx8oIpZzy
	pby3j4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0S5-00000008AIz-0xZ7;
	Tue, 09 Sep 2025 15:40:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuv6-0000000667i-0omH;
	Tue, 09 Sep 2025 09:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC6B340923;
	Tue,  9 Sep 2025 09:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C28C4CEF4;
	Tue,  9 Sep 2025 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411147;
	bh=Ldn4i3vhsJn/28YVTCdrkXvUwM0PE9DmYm36ZQcXL8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZAxOVDt9FnS7usAHgmcnkkArIhnWgdLOIcwFMsShZCU2LQeNGX2aSFbXJtJE0AU6k
	 rsFvxn77EoDxVVq/m0Q6hIFuRaHlTllduxnqrxnW2EO0TcOAQQEuJMuSYxve3wt6MO
	 QoOl+rFmxMrzoDZMaHQ3sBEwAz6v3DkqSBGVVd88bhBI3XH/tGx9ndxEZ/eLsIp8Lt
	 9VYavIdtJJLHsA6DFKXIv5yLHAi8IMlL7bw0Sdz7o/RKBdhtOiZG6DHIo8DUXaNXva
	 488otiJ4SlxNx34f7Kqd7KyUrdbwmLHQXGPFYUgkua+3uHpwY32EDj4zL3jeed/yZS
	 c4g5s5DZbqj8g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Sep 2025 11:45:17 +0200
Subject: [PATCH mt76 v5 09/16] wifi: mt76: mt7996: Fix RX packets
 configuration for primary WED device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-mt7996-rro-rework-v5-9-7d66f6eb7795@kernel.org>
References: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
In-Reply-To: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024548_259000_7ABC47A1 
X-CRM114-Status: GOOD (  11.02  )
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
2.51.0


