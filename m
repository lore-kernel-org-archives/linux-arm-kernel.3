Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31ADCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M37PFrHOe4NamwL53IJLn4KIPoVAgCfZEkMAp1cn/7E=; b=n5+LUBQWw5d3To4KGKlnFsmoR9
	mmXLg+ZzdlMcpAEE2biY7D74y4TtwO4gFdPEwJdWn82+o/W3V+rj0SbzLONsU+2OrXmdHKCvQQaQT
	prKKRPWlPMwzQiq03/MQh2A5G+QjeMZLIujSimmqsXzEtcoKf/y/KkdgtYMrh4NO9DY/Bxp99FPYk
	42PzolLjJ0/vZWX1ZE1Heal1XfA3qFmU1vdOvlJTz6qzQdfN2dUbEF53CwhXm6vlea700oM9xFOFO
	mvTupmproEwLhcQ73W3LNYmRF7EiyVYro2RFcCYfVvF+3e0cyBM9ozmlC3RfgHtkktT9DOKoE5SHV
	YSUKc3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLzt-0000000EmrJ-0OXs;
	Wed, 10 Sep 2025 14:40:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLzq-0000000EmnQ-0ahv;
	Wed, 10 Sep 2025 14:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F2D142148;
	Wed, 10 Sep 2025 14:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED791C4CEEB;
	Wed, 10 Sep 2025 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757515229;
	bh=nispLxiM6cEGgLHVw1aVSd/bJeyN0ZNwxKBMpsAbgVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HNk99NHeVPSgNoRkdAi2v9pHdI1chypEkI0Le3ZBbnBoHWAgGY5TD9Htrr8+I6u9r
	 4ipBWRwLR0dXR7DlWDkDpkh6pM68af9LCUNAt6dzNLzWLUFlVs4y3knlW9YEqok0ZL
	 O57Q2p4Ygah2dB7+wthCmX8GKzI8OI9jKSUR1I6W+hIH4quPKmx9yYTTwBPktginp9
	 Pf1q73UbbrUmekHa/jKgohhm4NHpzs+fPNhfO8raxyWY2hfzNUxDupVI5gK0SX4bJb
	 4FIJCutvYg02Dd5NcEglXxyU51DT3SPRUhJ71FbHUJDSoOIslJtWBAbWJw7dfBNZ6C
	 R4yOP/R4rig3Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 10 Sep 2025 16:40:03 +0200
Subject: [PATCH mt76 2/5] wifi: mt76: Add mt76_dev pointer in mt76_queue
 struct.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-mt76-npu-devel-v1-2-dbde4a37b9c0@kernel.org>
References: <20250910-mt76-npu-devel-v1-0-dbde4a37b9c0@kernel.org>
In-Reply-To: <20250910-mt76-npu-devel-v1-0-dbde4a37b9c0@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_074030_245675_9A160066 
X-CRM114-Status: GOOD (  10.03  )
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

This is a preliminary patch to enable traffic forward offloading via the
Airoha NPU module available on the Airoha EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c  | 1 +
 drivers/net/wireless/mediatek/mt76/mt76.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index f21481d4ed08400141627f91592d4d98789901b0..a285fd0a98369919e5422036b6a88b898ab65b6a 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -794,6 +794,7 @@ mt76_dma_alloc_queue(struct mt76_dev *dev, struct mt76_queue *q,
 	q->ndesc = n_desc;
 	q->buf_size = bufsize;
 	q->hw_idx = idx;
+	q->dev = dev;
 
 	size = mt76_queue_is_wed_rro_ind(q) ? sizeof(struct mt76_wed_rro_desc)
 					    : sizeof(struct mt76_desc);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index eede0c0fe2b97e4fbc5bf8ab75e3bf214d25e81d..d14baea02c48b6c40cd9fc45178aa4eba3e297f1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -247,6 +247,7 @@ struct mt76_queue {
 	__le16 *emi_cpu_idx;
 
 	struct mtk_wed_device *wed;
+	struct mt76_dev *dev;
 	u32 wed_regs;
 
 	dma_addr_t desc_dma;

-- 
2.51.0


