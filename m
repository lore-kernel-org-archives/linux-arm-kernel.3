Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D88606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=btrQtRhH;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Q32c1yfm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lRCQZa5YVFO4ifUqBznjC6YOnqAmsQeBaBsRyaw4EU0=; b=btrQtRhHV703yE
	iBftRUmbCSJGAIy/pS3kPnPLauYPSjw87wSlHxDNzRc+dsANkuD0sfYLMjxLzIpRdyPcNFr3ZI66y
	Bq4QF+s/8uYgBLAG5wvfT2FTiwOaS5SPnNZHnCoeTWohxaSYR5BjgVsWpIc5IFFNZqqnShvLQJbgX
	uTKUZDTbqhGBYZaEk85N8f2YNLpjiMKz+ut9wO/wNXYRGfNav0LbdW/y9DIr4sEwCaR0Tu+QC1xHG
	WWPa1+vOp6n2jVWtQkWKBE/K4M7AlQEVLlrHUKmziMZbSYpOOb+KaNFppHclz18qciwhlEt7oiso2
	yAti/x1VPJgwvi5/6mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvt4-00000006LHU-30ks;
	Wed, 28 Oct 2026 05:07:46 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvsx-00000006LDy-28lX;
	Wed, 28 Oct 2026 05:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lR
	CQZa5YVFO4ifUqBznjC6YOnqAmsQeBaBsRyaw4EU0=; b=Q32c1yfmLOLzFQYXgB
	eNnM3lr7sBG2WO6DN+w+LqOuLQAHeebjDuqmiLUPTp2IOlTm0ogu/7OAVjmwRU+5
	GSUJquXvHt2FfXSl2ZWO/ssIon+ZmU6BjL1+RMW/NdjkHoXdyYYv+37O0KTCkKhu
	wfdiTfpCfaXm7mf/62NKxXc8A=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDn31cMg+FqswGRDQ--.35366S4;
	Wed, 28 Oct 2026 13:07:27 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mingyen Hsieh <mingyen.hsieh@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/3] wifi: mt76: mt7925: validate debug message lengths
Date: Wed, 28 Oct 2026 13:07:21 +0800
Message-Id: <20261028050722.135598-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050722.135598-1-yaojiale02@163.com>
References: <20261028050722.135598-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn31cMg+FqswGRDQ--.35366S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr4UXr1DXr15Kw45Xr17trb_yoW5Wr13pa
	yUK3WFyrWUJr4DJw18Can5Zr4aywsYgF47GrWvvwn5ZrZxAr1F9FyqqFyjvF1rtrWrCry3
	Kr4qqry3Crn8XrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFpB-UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQ-2MWrhgw+-tgAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220739_922475_DA20C930 
X-CRM114-Status: GOOD (  14.21  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The debug message event handler removes the event prefix and accesses the
message header without checking the skb length. It also subtracts the
fixed header from the firmware-provided length without checking for an
underflow and trusts the string length. A truncated event can therefore
cause out-of-bounds reads while formatting firmware logs.

Validate the event prefix, fixed fields, declared message extent and each
format-specific payload before reading them.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 26cdb3f0a98a..c612fda55eb7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -596,8 +596,14 @@ mt7925_mcu_uni_debug_msg_event(struct mt792x_dev *dev, struct sk_buff *skb)
 			} __packed txt;
 		};
 	} __packed * hdr;
+	u16 msg_len;
 
+	if (skb->len < sizeof(struct mt7925_mcu_rxd) + 4)
+		return;
 	skb_pull(skb, sizeof(struct mt7925_mcu_rxd) + 4);
+	if (skb->len < offsetof(struct mt7925_uni_debug_msg, idx))
+		return;
+
 	hdr = (struct mt7925_uni_debug_msg *)skb->data;
 
 	if (hdr->id == 0x28) {
@@ -608,19 +614,28 @@ mt7925_mcu_uni_debug_msg_event(struct mt792x_dev *dev, struct sk_buff *skb)
 		return;
 	}
 
+	msg_len = le16_to_cpu(hdr->len);
+	if (msg_len < offsetof(struct mt7925_uni_debug_msg, idx) ||
+	    msg_len > skb->len)
+		return;
+
 	if (hdr->type == 0) { /* idx log */
 		int i, ret, len = PAGE_SIZE - 1, nr_val;
-		struct page *page = dev_alloc_pages(get_order(len));
+		struct page *page;
 		__le32 *val;
 		char *buf, *cur;
 
+		if (msg_len < sizeof(*hdr))
+			return;
+
+		page = dev_alloc_pages(get_order(len));
 		if (!page)
 			return;
 
 		buf = page_address(page);
 		cur = buf;
 
-		nr_val = (le16_to_cpu(hdr->len) - sizeof(*hdr)) / 4;
+		nr_val = (msg_len - sizeof(*hdr)) / sizeof(*val);
 		val = (__le32 *)hdr->idx.data;
 		for (i = 0; i < nr_val && len > 0; i++) {
 			ret = snprintf(cur, len, "0x%x,", le32_to_cpu(val[i]));
@@ -635,6 +650,11 @@ mt7925_mcu_uni_debug_msg_event(struct mt792x_dev *dev, struct sk_buff *skb)
 				   le32_to_cpu(hdr->idx.idx), nr_val, buf);
 		put_page(page);
 	} else if (hdr->type == 2) { /* str log */
+		if (msg_len < offsetof(struct mt7925_uni_debug_msg, txt.data) ||
+		    hdr->txt.len > msg_len - offsetof(struct mt7925_uni_debug_msg,
+						       txt.data))
+			return;
+
 		wiphy_info(mt76_hw(dev)->wiphy, "%.*s", hdr->txt.len, hdr->txt.data);
 	}
 }
-- 
2.34.1


