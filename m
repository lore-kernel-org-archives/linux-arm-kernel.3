Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD1210AB829
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh4REqgnKzyEzUI/NBTjswi8jAEeySuPefhD1zQxSo0=; b=GhmWMPsoCDUCgBklpziCUarO7x
	lVcVQO307eP/s7rbdq6HRLWa+jB4n369n0aFyWZA03E5Vc5FJsx7svfL4SUktCgyYfPrKgdQt2ZIF
	63v61ja5oxMpEmzroe4HnXoe/7GjPt1bUP0kxrtQBfW0qgIX5nizGYZtPCqh99sD0dBtREoyWgFEC
	FkDMSErzTHBZIAv5nx0Bbk1WG6DTw03M1wKPF/Fpgr/1Grke5ZPmZq8SNkxDucN5QZX53n51NedkC
	2vx+NroNj8/5MBOp9HL1HIaMJTcNUFEtmVB34cem5Usgyu3h0f2u8Us5ifpNfKRDQ3ilqu4AuLXmk
	Wpc1AjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s1y-00000006Dty-0pxm;
	Thu, 26 Mar 2026 21:14:18 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s0R-00000006DBW-14Pn;
	Thu, 26 Mar 2026 21:12:44 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 7AE75138017E;
	Thu, 26 Mar 2026 17:12:42 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 17:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774559562;
	 x=1774566762; bh=wh4REqgnKzyEzUI/NBTjswi8jAEeySuPefhD1zQxSo0=; b=
	OZG5H7uG8A0x+up+a3yxbN7cETFHaZygZxY1fb4sB+L2NA/bxhkhov074Qthh24f
	4CEN4lvbRWP7TBWFzxaSYggi6O7ElyjOA1OyRVmi7sO4f23eqBhhs4DLST0MDEQT
	YYfHdlsxhFcIk0NigFNN2a8GmZbLc9QVc/7iE8GU86VbyYum1XPEJ4Q7m4VLlMRm
	AoFUi5JNTpoMq82kMQKPnzCWucqY2fzONJnxwL1InPt+ryNhCdh6pCh/MgbBl/9g
	j1nfPQKy2dhef12HU/CM7P4KzQmWnfyLcNuoIdVZcM2VS2QqT9csKJrm6ehCr//a
	4Eo3m3E2xkzUe0MUtGXc0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774559562; x=
	1774566762; bh=wh4REqgnKzyEzUI/NBTjswi8jAEeySuPefhD1zQxSo0=; b=a
	ICUo7XoYqh5yZh2M/CE42yeZwO5jrETorta12Nc7/4k5jttNbUNJK69cIqYVotQY
	EDf34pR+kG0Df9LLhrx+oq2LZyMKmFTxHrrGn/cHC9AuRA6zAer/kI6pw4hpR0S5
	TH8r+zQLrcmu3/54m9ZKA35x23wM9KvgrXct9BRUh7eI1CIse7W4xasTUlBkwYvR
	GppWX57QpVBL9ktJN0QwY5hEGYlqIvZWs7bc9RHhZ5EnnS6af5vdNHYwEErcSlC9
	NXCHL7TMUjtLzD7Z6YLwkuOIPH3edu5SuS6/tg+8cB/wdZ0fLLCgFMp1GzhiE9QE
	2i1laXpA0hhUeXuRZT6Ow==
X-ME-Sender: <xms:SqHFaQAP0JAkEaL9WPvmbrBXafd6nl-g5BQ_h6w1uiIZDAkYM_TXvw>
    <xme:SqHFadU2n0W3ACIZ24sMs_2KV5OKj_KSYXAf5aXbja3iWsAb_cGoIdCQjL7LFazEr
    gMInEfPIhAigZLQA703ptkB7JA17-2obYBrQ5wc7yHuxM82_LcouJU7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:SqHFaWzzRu2dx4jH99zY8eg7yx87iQeT7tbaXa8j1o4Ebf9huNZmNg>
    <xmx:SqHFafcDsetcpAnUkQuvN0EvFJI1E-lc6Zl39bgMYVPkmVli7Jg7LQ>
    <xmx:SqHFac0SWjWQJU0xNB4Bs58PWRh1S_NLQvSJhk7fHEcu9l2aLUb0gw>
    <xmx:SqHFaYs2A9U-5NO1_S8FfOKCuP-tww0mxC-RC8fanZYr2RTsfsjCIw>
    <xmx:SqHFacQepzZnpiC94hU5w-btoJYtYZvr0T2na8r09VgyEezc-sE5bMhC>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EBDD41EA006B; Thu, 26 Mar 2026 17:12:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 26 Mar 2026 15:12:32 -0600
Subject: [PATCH v4 8/9] wifi: mt76: mt7925: use irq_map for chip-specific
 interrupt handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-mt7927-wifi-support-v4-v4-8-8ab465addcfe@jetm.me>
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
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxaE4LrOfgn7JrGIyhpnuRTieuHLaNG2kd2xsJ
 6hhpNjoFaGJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWhOAAKCRC17sMLqGd3
 H2vwC/9QvmHMCgKq53HN/wxY8m/JZbWRiNIjKuLpLQdXbvy8R55Eq+kbZrkyYZ+iWupwgouuBoE
 dmT1PwvSltfy+NE0huOlAfg4QMBvFbH9PH/40spsSpNpxxbb0H4aRzOPWUoajbY51Ct55MBXuvY
 pzkd/y/4tvoeMIsI9BvKpsEIEMxXdSpVw977T/NRLWzL/EdWai1O4j0YVyFgJdUjbU4IuW0rEq7
 I56pQIGK1GEE7R1/1HaksJOvt3okCSbgNTZiosbmuarg57oiow4EIqf7R8UXyOpKX7rP1/YmxbZ
 2NDpzm3/dPZj3cOZgrnackAyhirOfEoPaDtkVhO4EZGh2RLiiip+FLcMb4WRWtlhFt+CYuHPWIT
 SZNx7OTQMY7szXw32giTT2antBx/ND9esCe3H+akeAfRktwwDI5ffI3Npoli2KPz0cgZhiUZXh+
 E67KbD7S8DGmZwxRzHGwLjoFfm0tY6BFHbcxIsicyDfNdRYZnuRKhVemCkXIBSDhvsrW4=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
References: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_141243_352195_DB5FD5B9 
X-CRM114-Status: GOOD (  13.54  )
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


