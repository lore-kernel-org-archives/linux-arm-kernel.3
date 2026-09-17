Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8E4C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E5WkpbT09UncTz0NLbSxU7LKoS2bK+Xs9qCF7WB6oe0=; b=RHbZjy7qYMIqIHmF+v84pRfl4F
	+/ANdq5zhsPguSYjM8o1qXZRIUbbBJ0eC7ZVIv4mOicvHVoFGvODuSc5AP6POhQc3+lTDXmWsRWPr
	BIOL5VmVQI79/MIOHWKItOvO0RFmnoPn7OW3+PqHBSrEkZaQs9HTjD1W5KNNyBou0xgBx/YQdEBYS
	l5Eh6NfwD4p6/IBVsRJ5fLYsUWCb2T5t3gA7VqAF0dcaQrquntj19UQLdhPzmYujrLzC9BRiCuOvu
	jc2BmgDOwDvEKp6XNMFtimUCtex7kYNpxo5fURbK1pE3cN1fkdEzXvKRq3zvo5/N/VYE+47qpP27a
	EFSX/PyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B6w-0000000BH0U-1eAb;
	Thu, 17 Sep 2026 12:21:06 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B6r-0000000BGyK-2p6h;
	Thu, 17 Sep 2026 12:21:03 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB34jwq26tq1mSACA--.2616S2;
	Thu, 17 Sep 2026 20:20:58 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: angelogioacchino.delregno@collabora.com
Cc: kvalo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: Fix skb reference leak on USB/SDIO tx_queue_skb error paths
Date: Thu, 17 Sep 2026 12:20:58 +0000
Message-Id: <20260917122058.2150817-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAB34jwq26tq1mSACA--.2616S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr1kZFy7XF47uryDZw48Xrb_yoW5Aw1fpF
	WjgrWYkr18Jr4UG3Z7ua1UX3ZIya1rKFyakryfW34rurWrAr15XFWI9a42vrs3trs5C3W2
	qr1ktrsxWrZ2qrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPqb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwAC
	I402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrw
	CF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x
	07bnXd8UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwgNA2qrrRmKFwABso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_052102_107811_707C9A5B 
X-CRM114-Status: GOOD (  11.46  )
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

The mt76 queue ops take ownership of the skb handed to tx_queue_skb():
the DMA implementation releases it through ieee80211_tx_status_ext() on
every error path, but mt76u_tx_queue_skb() and mt76s_tx_queue_skb() just
return the error, so the reference is neither queued nor freed.

mt76_testmode_tx_pending() relies on that ownership transfer, so it leaks
the extra skb reference taken with skb_get() whenever the queue is full or
tx_prepare_skb()/mt76u_tx_setup_buffers() fails.

Release the skb on the error paths as well.

Fixes: b40b15e1521f ("mt76: add usb support to mt76 layer")
Fixes: d39b52e31aa6 ("mt76: introduce mt76_sdio module")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/wireless/mediatek/mt76/sdio.c | 13 ++++++++++---
 drivers/net/wireless/mediatek/mt76/usb.c  | 15 +++++++++++----
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index 8bae77c761be..ef82af1f905c 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -526,13 +526,15 @@ mt76s_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 	int err, len = skb->len;
 	u16 idx = q->head;
 
-	if (q->queued == q->ndesc)
-		return -ENOSPC;
+	if (q->queued == q->ndesc) {
+		err = -ENOSPC;
+		goto free_skb;
+	}
 
 	skb->prev = skb->next = NULL;
 	err = dev->drv->tx_prepare_skb(dev, NULL, qid, wcid, sta, &tx_info);
 	if (err < 0)
-		return err;
+		goto free_skb;
 
 	q->entry[q->head].skb = tx_info.skb;
 	q->entry[q->head].buf_sz = len;
@@ -544,6 +546,11 @@ mt76s_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 	q->queued++;
 
 	return idx;
+
+free_skb:
+	dev_kfree_skb(tx_info.skb);
+
+	return err;
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 632ae755c7a6..837b0b251b05 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -861,17 +861,19 @@ mt76u_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 	u16 idx = q->head;
 	int err;
 
-	if (q->queued == q->ndesc)
-		return -ENOSPC;
+	if (q->queued == q->ndesc) {
+		err = -ENOSPC;
+		goto free_skb;
+	}
 
 	skb->prev = skb->next = NULL;
 	err = dev->drv->tx_prepare_skb(dev, NULL, qid, wcid, sta, &tx_info);
 	if (err < 0)
-		return err;
+		goto free_skb;
 
 	err = mt76u_tx_setup_buffers(dev, tx_info.skb, q->entry[idx].urb);
 	if (err < 0)
-		return err;
+		goto free_skb;
 
 	mt76u_fill_bulk_urb(dev, USB_DIR_OUT, q->ep, q->entry[idx].urb,
 			    mt76u_complete_tx, &q->entry[idx]);
@@ -882,6 +884,11 @@ mt76u_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 	q->queued++;
 
 	return idx;
+
+free_skb:
+	dev_kfree_skb(tx_info.skb);
+
+	return err;
 }
 
 static void mt76u_tx_kick(struct mt76_dev *dev, struct mt76_queue *q)
-- 
2.34.1


