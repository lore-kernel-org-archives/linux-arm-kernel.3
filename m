Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABE3109E523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh4REqgnKzyEzUI/NBTjswi8jAEeySuPefhD1zQxSo0=; b=NmG3WWiW8CylMDKM3T8KWv1Qbu
	zXVeqBnws3xVz07xHPeJ6iy7dPgfOewUORS6jdumIicpCLcZHSsypQgtS9AbLb1KW6KYQMOQsSL1s
	qKhx1TdQQKnsVUcfRzMYgV5MsRghwiNYzBdVSm7QSO9I3vVZvIdSjGc5aucRRpapht2fmNsODk097
	L1Rn7S3s3s6kXjUSk55QHB9L+yRFuol2rCdZOz7yz3DXGOsAZGMvBMAI7reMqYWukKNuBFT1ds6gO
	4zSsiBUJjFcv02AomVYQm11vMnwoDenyKQ9VXDoixBTTpXdQ+OOvrkcd/7N4KXXf/yHZhYnRfaeIK
	FmsKHYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRo-00000004KKX-0xCE;
	Wed, 25 Mar 2026 22:11:32 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRT-00000004Jzt-3U7C;
	Wed, 25 Mar 2026 22:11:13 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id B995D1300523;
	Wed, 25 Mar 2026 18:11:10 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 18:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774476670;
	 x=1774483870; bh=wh4REqgnKzyEzUI/NBTjswi8jAEeySuPefhD1zQxSo0=; b=
	TDlZPRlymjCHsHXOfSU+r3oSoxs+WjDOHrnqAdXaR215ikq9KG/MEx7FS0YzNZox
	xsfW+YllfD3tPwSGaAmdo9JOnv7XpeObHKBgma21IlfYGvNXrNTE/ctFmTJvElIu
	lhdWf0+E1QER2xu6zb4154k3ADAJbMo6nwn4QIX5m1z2aVamag7oCZqe5IeN8PoA
	aqZqhcq39u8fsSU59yoUx3gJMHZFim0rjh/IIKP2G1Rg6lQhIz3b0YdjJzx2w6+r
	A7b4yh328EkRxouDF6+3TRVYxxdQ48Nu9go6nR3gevey9gE66iu/ErlJ5lpDpIXS
	Kq1fpYbz5TI1kXd6c9zrlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774476670; x=
	1774483870; bh=wh4REqgnKzyEzUI/NBTjswi8jAEeySuPefhD1zQxSo0=; b=H
	W7VZ+Jyrr2b0GMcUGY2HLbOXnSk4vCqmyoNA+MWIyDjegimWQDy5567NBgFqerBq
	rLnLsU2K7qB1eYMnyXUjOowMNOJFoHBcgERVwquNYPNu//KtauKNvrMjhUmufQOA
	XHKcpTh8d19M/k2pPXiPwb6m+h4XnDOR0JC/0AYaMP2MVrxAW3q5oMT3PSkdnWyV
	gr/RciWl7zWL4GSrX6WrJUbAU8p5C9xekyzyLnSRhdVZW7qKqww55orvBKnRGohi
	VaCLEG4krtJs6aEJTxFtmNKbbElGo4LLjo2IaB8QS68gJJlWT6MNzRjUlzQwQ5/D
	wb6Uu8FYd0aPzkbRIuQHA==
X-ME-Sender: <xms:fl3EaYzqk8xx59pwDoqVo91JcirK29ZrVTLRzYi-4bxITItcnhH-ew>
    <xme:fl3EaXF5U3ymfAzCtGbZ0RXVJY2aWcnTKjF14N8DC9SeOnXp9lhoqIFj4esBsqXEh
    7-5kyD8sG5hbvUvE212wnCXWRX2ZVZnXTql7wkI0nnUb66oquo0FA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:fl3EaRgkeak-d1RUgXIx3PRiySbvQYG9jZuEujhW8IJfwDWYG3gZHg>
    <xmx:fl3EaTNFWisKh5vCIByxLvSCH2HcMy3uthIMPOkWQ2j2MdQ6M2xqBw>
    <xmx:fl3EaVnBVozTArOJuJqXyf29cvBLjibx8p6reom1WimUHSe-6o6DYA>
    <xmx:fl3EaSdQezQTLSVCl2CY-r9kWrKGiTiVp_kkmbkDBlUCs_7Dsic2dg>
    <xmx:fl3EaRCYdD9y2C302IyvDlCihxL0RAN3fsWmI50zt5uBIzsCp4ZTfLgT>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 743B71EA006B; Wed, 25 Mar 2026 18:11:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 16:10:57 -0600
Subject: [PATCH v3 08/13] wifi: mt76: mt7925: use irq_map for chip-specific
 interrupt handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-mt7927-wifi-support-v2-v3-8-5ca66c97a755@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4873; i=floss@jetm.me;
 h=from:subject:message-id; bh=d/HKmmehbZuZuFy6yrEQuL+8MJqGQNMTKPsrWPbucdg=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxF1qBQGRj7amcApjljBBVQ0Rz4EZPRXfni7HM
 sWQo/NeM5eJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRdagAKCRC17sMLqGd3
 H2DCC/9907z+5653Xpjlrv4WpAr1hJGB3hSf8B6CxwCCzbs1b7RNiZ2Nhaz9Q8RVRY1wnkxKpge
 AjJiNb1MWFDd4H0+kAN4utCs9aoBnaSOQ6kTtT+hkNw1waes4/bZ9/wDfLBrIE9zfbH7liLwsQU
 LFstKbv8FIrXu6RC31NWebepK8hN7O5QVmPTiWz1vg294ecvRwBE+MbW5Fvx7lPVWwzcOb4IPng
 fvyh6opbpJy2AJxL2Z2/160/jzGphxDhou+hVl1YzMzHm8Ac8YdEbcmKwEFxqsAAhJjsYxQQp0L
 D/0rblqOcoz0RXmMqH+lqJ80+6UB0GyOV0O69elTNtjZ5k9YWbblJBA9GKdpHW2oqNufgRwywsp
 pIcsmwxEgWIG7zayLFKX+jtNyJ+pe5yOZV/9cquyCC1OVvuNI6WCeEmlP9dUcFiVzbE1R4xLI0m
 pRtL9oQFmt44u8jvWiyqIjwEu6RLvi2Z3AVF5jp+eyO/nl4Z9xzN812KinGT1lA2qRxTo=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_151112_201717_7F189F5F 
X-CRM114-Status: GOOD (  14.72  )
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

The mac_reset and resume paths use the hardcoded MT_INT_RX_DONE_ALL
constant (bits 0-2) to re-enable RX interrupts. This is correct for
MT7925 (RX rings 0, 1, 2) but wrong for chips using different ring
indices.

Define a per-chip irq_map with the correct RX interrupt enable bits and
replace hardcoded MT_INT_RX_DONE_ALL with irq_map field reads in the
resume and mac_reset paths. Add the MT7927 irq_map with interrupt bits
matching its RX ring layout (rings 4, 6, 7), selected at probe time
based on PCI device ID.

This ensures the correct interrupt bits are enabled regardless of the
chip variant.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c     | 21 +++++++++++++++++++--
 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c |  5 ++++-
 drivers/net/wireless/mediatek/mt76/mt792x_regs.h    |  3 +++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index f820d5aeb723..604c0e9ae7ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -266,6 +266,18 @@ static int mt7925_dma_init(struct mt792x_dev *dev)
 	return mt792x_dma_enable(dev);
 }
 
+static const struct mt792x_irq_map mt7927_irq_map = {
+	.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
+	.tx = {
+		.all_complete_mask = MT_INT_TX_DONE_ALL,
+		.mcu_complete_mask = MT_INT_TX_DONE_MCU,
+	},
+	.rx = {
+		.data_complete_mask = MT7927_RX_DONE_INT_ENA4,
+		.wm_complete_mask = MT7927_RX_DONE_INT_ENA6,
+		.wm2_complete_mask = MT7927_RX_DONE_INT_ENA7,
+	},
+};
 static int mt7925_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -310,6 +322,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	struct mt76_bus_ops *bus_ops;
 	struct mt792x_dev *dev;
 	struct mt76_dev *mdev;
+	bool is_mt7927_hw;
 	u8 features;
 	int ret;
 	u16 cmd;
@@ -358,7 +371,8 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &mt7925_pcie_ops;
-	dev->irq_map = &irq_map;
+	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
+	dev->irq_map = is_mt7927_hw ? &mt7927_irq_map : &irq_map;
 	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
 
@@ -549,7 +563,10 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 	mt76_connac_irq_enable(&dev->mt76,
 			       dev->irq_map->tx.all_complete_mask |
-			       MT_INT_RX_DONE_ALL | MT_INT_MCU_CMD);
+			       dev->irq_map->rx.data_complete_mask |
+			       dev->irq_map->rx.wm_complete_mask |
+			       dev->irq_map->rx.wm2_complete_mask |
+			       MT_INT_MCU_CMD);
 	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
 
 	/* put dma enabled */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 3072850c2752..1626a3684082 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -118,7 +118,10 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 
 	mt76_wr(dev, dev->irq_map->host_irq_enable,
 		dev->irq_map->tx.all_complete_mask |
-		MT_INT_RX_DONE_ALL | MT_INT_MCU_CMD);
+		dev->irq_map->rx.data_complete_mask |
+		dev->irq_map->rx.wm_complete_mask |
+		dev->irq_map->rx.wm2_complete_mask |
+		MT_INT_MCU_CMD);
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
 	err = mt792xe_mcu_fw_pmctrl(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index acf627aed609..a8c8d7d6f565 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -308,6 +308,9 @@
 #define HOST_RX_DONE_INT_ENA1		BIT(1)
 #define HOST_RX_DONE_INT_ENA2		BIT(2)
 #define HOST_RX_DONE_INT_ENA3		BIT(3)
+#define MT7927_RX_DONE_INT_ENA4		BIT(12)
+#define MT7927_RX_DONE_INT_ENA6		BIT(14)
+#define MT7927_RX_DONE_INT_ENA7		BIT(15)
 #define HOST_TX_DONE_INT_ENA0		BIT(4)
 #define HOST_TX_DONE_INT_ENA1		BIT(5)
 #define HOST_TX_DONE_INT_ENA2		BIT(6)

-- 
2.53.0


