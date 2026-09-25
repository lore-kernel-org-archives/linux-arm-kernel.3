Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C423C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzdROanWlTNrH8RVUU2vkB9x2qZKNDOucbvjx4s09js=; b=Kg+S7CA6hTgmM21zBLJwjd3jmu
	q8gDRca+1SGLtUpNulkFr2Aw5xRnDN+RLsY8cNEr6Akcl8+q1J8yJMnEi3l2RMNYmfpousVvTa3j/
	aM4Q41MCekaK0qjaHcHy7AUJmSUTNaz3QC+OQeKzUZ7V9+MlgmUmkOwIQ34+EPXI04P2WM2ASDhBp
	cF/IJRkWm3coZwE6mhCezq1JPAuBBLxtn36eX5gueG2E5Yhf5ckoU2aaySSIpx/3Y5+CqC1A59NC0
	nIY5GRO7p7NIUNd0TEZxYgAWIlUa7wMqcexwIKVxRpBKBpVDlJVp3RBCN19Rh9p1p7Q3+3FU0MYOW
	0PM9uuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7VI-0000000DhZB-3qL3;
	Fri, 25 Sep 2026 15:06:24 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7VE-0000000DhV5-1nQu;
	Fri, 25 Sep 2026 15:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Wz
	dROanWlTNrH8RVUU2vkB9x2qZKNDOucbvjx4s09js=; b=DVcs3mEJ/3/NyJ1bLz
	66RyjCWIQ9ZhktvE+Qr48b9Z0dgaPWWog1qncyjcpLs0toYOfqK77ayhEqMcSTQt
	BLH+NBSA56n6m1OnwZNxtkaFG2ObLcKEG+Ugtxk065IRWYJv7KiIGbp236MvYK4J
	nATBwJ0Km9Oh8AprQAXFMmDp4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3J8zYjbZq2yQpAw--.5414S3;
	Fri, 25 Sep 2026 23:06:02 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Markus Theil <markus.theil@tu-ilmenau.de>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] wifi: mt76: usb: fix source overread in mt76u_copy
Date: Fri, 25 Sep 2026 23:05:54 +0800
Message-Id: <20260925150556.2304003-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925150556.2304003-1-yaojiale02@163.com>
References: <20260925150556.2304003-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3J8zYjbZq2yQpAw--.5414S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4UWFy5ZFW5uw45Zr4kCrg_yoW8ZF4kpF
	Z7KFya9rZxGF17Jw4xAan8AF93ZayIkryDKrZ3Za4fu395Jw18KFy8KFyUKrWUZF4Sgr12
	yrnFyr97W3s8taUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pENeOiUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xvhHGq2jdsjagAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_080621_664195_0921C277 
X-CRM114-Status: GOOD (  12.97  )
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

mt76u_copy() rounds up len to a multiple of four and uses the rounded
length as the bound for memcpy() from the source buffer. When the
caller's length is not four-byte aligned, the final copy reads up to
three bytes past the source buffer.

Keep the original length for the source copy and zero the remaining
bytes in the transmit buffer so that the hardware access width remains
four-byte aligned.

Fixes: 9446248669968 ("mt76: speed up usb bulk copy")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index a9af3aa6b80a..a42a33f4e907 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -171,8 +171,10 @@ static void mt76u_copy(struct mt76_dev *dev, u32 offset,
 {
 	struct mt76_usb *usb = &dev->usb;
 	const u8 *val = data;
-	int ret;
 	int current_batch_size;
+	int len_aligned;
+	int copy_len;
+	int ret;
 	int i = 0;
 
 	/* Assure that always a multiple of 4 bytes are copied,
@@ -180,12 +182,16 @@ static void mt76u_copy(struct mt76_dev *dev, u32 offset,
 	 * See: "mt76: round up length on mt76_wr_copy"
 	 * Commit 850e8f6fbd5d0003b0
 	 */
-	len = round_up(len, 4);
+	len_aligned = round_up(len, 4);
 
 	mutex_lock(&usb->usb_ctrl_mtx);
-	while (i < len) {
-		current_batch_size = min_t(int, usb->data_len, len - i);
-		memcpy(usb->data, val + i, current_batch_size);
+	while (i < len_aligned) {
+		current_batch_size = min_t(int, usb->data_len, len_aligned - i);
+		copy_len = min_t(int, current_batch_size, len - i);
+		memcpy(usb->data, val + i, copy_len);
+		if (copy_len < current_batch_size)
+			memset(usb->data + copy_len, 0,
+			       current_batch_size - copy_len);
 		ret = __mt76u_vendor_request(dev, MT_VEND_MULTI_WRITE,
 					     USB_DIR_OUT | USB_TYPE_VENDOR,
 					     0, offset + i, usb->data,
-- 
2.34.1


