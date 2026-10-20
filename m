Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB200606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IT2htjq3;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aYuPUjTx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmELMb3Iy2dsfsnzN/3kQI/Gin1VtfTa2L18IbfBUSs=; b=IT2htjq3jibqkPH2kDSJm5KHQy
	PWxPBcfk1MZ4RBpN5C0fRiNRZqXe5f6x10Hh9oaz/NpiunPS+SzHS240bNZVJ/mTvhuTCQ9kItMVL
	itfENXhQuChY3a8LTIZiPbZlwlAK7uwFdlhgy/Y9Kt4XzeHiKZQjBQfbKR/ghFu6Maba5StPK/u+D
	3X8bbcqAiv6rBO96L71FBhBcopKvxp6kaLMhCU1k+fmHuBix0G6p8n2Fv5G9ioI0kljjL5NhUJC01
	bYBVgMtQA2Ov/muYhqY2s8rH1NCWlmQjGGQYk/QY6V3KAgQoDbKtKR7lTYrf/l09vE7sRwhND7i/b
	xNqSJjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvM-00000008jIo-0Tn6;
	Tue, 20 Oct 2026 02:50:00 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvF-00000008jEO-0QmD;
	Tue, 20 Oct 2026 02:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tm
	ELMb3Iy2dsfsnzN/3kQI/Gin1VtfTa2L18IbfBUSs=; b=aYuPUjTxOkibfJ0V6A
	wWXrD62G/n0sMSOCPSktGZY2mXc9pjkrtGkmnUpd+lmos+nzkjh9EiTnKrQ6KMMs
	NEn/Ee8rc6sczw3FCh4orn7wKFoPhRIRIXXkVlO/dLRywmzpB7zKZ7QZdufwOADI
	FbLQVz95OMy8mGjz3KGjbWPfY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnr8C+1tZqMLhIBA--.5123S6;
	Tue, 20 Oct 2026 10:49:41 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Elwin Huang <s09289728096@gmail.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/7] wifi: mt76: mt7996: validate free-block response length
Date: Tue, 20 Oct 2026 10:49:30 +0800
Message-Id: <20261020024933.3205681-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024933.3205681-1-yaojiale02@163.com>
References: <20261020024933.3205681-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnr8C+1tZqMLhIBA--.5123S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDXr4fKry8tFyUWw1xXwb_yoWkJwb_uw
	4vvr9xJr10kws0kr47Cw47Cryak3ykZry8urW3tw45XFW7JFW7Grs3Zw15Gr9I93ZrZF98
	Gr1DXa1UAa4aqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbG-e7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgU3cWrW1sWlMgAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194953_538739_DBB4C3D0 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

The EFUSE free-block query reads a byte after an eight-byte prefix
without checking the firmware response length. A truncated response can
cause an out-of-bounds read.

Require the prefix and block-count byte before accessing the response.

Fixes: f456e1f56c4c ("wifi: mt76: add external EEPROM support for mt799x chipsets")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index eb868c2d5108..c70d7ad3148c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4516,6 +4516,10 @@ int mt7996_mcu_get_efuse_free_block(struct mt7996_dev *dev, u8 *block_num)
 					sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < 8 + sizeof(*block_num)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	*block_num = *(u8 *)(skb->data + 8);
 	dev_kfree_skb(skb);
-- 
2.34.1


