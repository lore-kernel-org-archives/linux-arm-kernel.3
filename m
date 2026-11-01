Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A6E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ZFY6Jsm;
	dkim=temperror header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.a=rsa-sha256 header.s=dkim header.b=fBmdmYlL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IE/ei9ydvblkzeHHIKH9hvEsVow8o9vYsVhMASi+c3M=; b=0ZFY6Jsmtrytlapwnygrk3ll4T
	+Uc72CxbkoV/ocbkJYYpcS9+pSCq2fXLjt23GHIpYt8TE884hiYoYzOjdahOeFIeU9xTYcxtND/wt
	iUrtWYssR/zD2h90bYQYH7cUH7Mcjy14ea+KmScQVH8sB3eNQSM3eWAAXf9VWDKnRrl0CFeScgygy
	lEqvQxZ/QNlv6zPFl5qG2lmhdOnFPdh6V7LRscLVupVp1muzSwAt+0oVpHzFp8SSrZRec//SDhH9e
	wN/qNzKQAzttytS2FDxXyNbbGk6653V0TLJFawGWobCnedTJN+M+6y74NmDY6VtzizqvzMqJ/2mkO
	lxIG+0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRx3-0000000E3hA-3HPF;
	Sun, 01 Nov 2026 09:34:09 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRwy-0000000E3gH-1XvA;
	Sun, 01 Nov 2026 09:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=IE/ei9ydvb
	lkzeHHIKH9hvEsVow8o9vYsVhMASi+c3M=; b=fBmdmYlLbD20gKWnoE7e1Acj9H
	gpLz/xEjp2aAkByt3gn+1PXbEmI9TQMDSwx8oJNZTuA5Y/fHLLenZQXXTtzYaEeA
	pjzbqvFg9L2O411uTDoEnqQAwUwIlZTAttydMf9WEFA7M/25/YlkDLzDOINWhJNR
	oz68mESfIm3Pb8Y4c=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.43])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkAGCv2BB+dqSbwUAQ--.19624S2;
	Sun, 01 Nov 2026 17:33:55 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <mbrugger@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7925: fix out-of-bounds read in mt7925_mac_add_txs
Date: Sun,  1 Nov 2026 17:33:52 +0800
Message-Id: <20261101093352.3070-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: BbQMCkAGCv2BB+dqSbwUAQ--.19624S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4kJw4fXw1furykGrW7Jwb_yoW8Cr1Dpr
	WjkFyjkrWUJr4DGw18Aa1avan8A3Z5GrW3Gr4Fvw1rZ3s8Grn5AFy5ZF1j9F1YyFWjkF18
	JF4Utry3WrZ8uw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB0b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2jXdUUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUED2rmBFRXBAACsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_013405_107232_DEB9BDD1 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt7925_queue_rx_skb() walks the TXS entries up to skb->len, but that
length only describes the whole packet. For RX skbs that are not fully
linear, such as the ones built from the fragmented USB RX path,
skb->data only covers skb_headlen(skb) bytes, so the loop advances past
the skb head buffer and mt7925_mac_add_txs() reads outside of the
allocated slab object:

  BUG: KASAN: slab-out-of-bounds in mt7925_mac_add_txs+0xe79/0x1290
  Read of size 4 at addr ffff88800ebea648 by task napi/mt76u-rx-0/209

Bound the iteration by skb_headlen(skb) instead. Fully linear skbs keep
the previous behaviour, since both lengths are equal there.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Cc: stable@vger.kernel.org
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 3b82c9de26c5..adea216578f5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1422,7 +1422,7 @@ void mt7925_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	__le32 *rxd = (__le32 *)skb->data;
-	__le32 *end = (__le32 *)&skb->data[skb->len];
+	__le32 *end = (__le32 *)&skb->data[skb_headlen(skb)];
 	enum rx_pkt_type type;
 	u16 flag;
 
-- 
2.34.1


