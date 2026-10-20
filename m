Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056AA60A262E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DExSafQo;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Cr+WWcS/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSqZs6kvQ73jpKV//X6SsqeslDJs9OL8i3dqvINNPv8=; b=DExSafQoPIEcqZnxLCs/XtHv5K
	atiHg2iGsSFSfrI7qdGTbSB7uvuHbpsoF/oTAaG/HKtLbygdbI1IbwXTuI/W6j23sxUVdufxKM88q
	rlv3Smh4i3HofXrdSzkEpWQh9oXPT99QwkGvzH2OXnryUsdYWYqlofN//iKhrckoW+p022ZxANYfW
	QXTkaRTwL+J22Vr4JyW133DjJ4M+YQjoWwFaMudbMuxf/VhI1rqkzQLasfg+K7SxfS8o2uLUH63E9
	Ie7gKcQ83vS05nPhztYhZFAfFT1+djJKkfsiq7pJuh79sRoKBqERPFmC8bNG5luvs4aK4vUc4uJIi
	1LuZM3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvT-00000008jPm-07h7;
	Tue, 20 Oct 2026 02:50:07 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvH-00000008jFA-1ZJ2;
	Tue, 20 Oct 2026 02:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qS
	qZs6kvQ73jpKV//X6SsqeslDJs9OL8i3dqvINNPv8=; b=Cr+WWcS/vDlwgfM9TA
	zmmFWxnFaSAEYN63MwVeOVcDhXvfSNnGubjHlrqRnHSnNrO1vfOkIRVSERO0ttAo
	WuK8zUU5xV1iiA3Rqfk9s4fpu3Lb5lyImNu3vk8JMpjAz42X/hnh/ljCme2SJOO3
	eq+WG1WycGCfdg+MHkLKxM+FY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnr8C+1tZqMLhIBA--.5123S8;
	Tue, 20 Oct 2026 10:49:44 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 6/7] wifi: mt76: mt7996: validate temperature response length
Date: Tue, 20 Oct 2026 10:49:32 +0800
Message-Id: <20261020024933.3205681-7-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024933.3205681-1-yaojiale02@163.com>
References: <20261020024933.3205681-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnr8C+1tZqMLhIBA--.5123S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw4rAFW3AF48uryDAr1fJFb_yoWDZFg_uw
	na9FnxJr18Kw4UKr42kwsrCryakay8u3Z5C3yrt3yfJay7JFW7ur93Zrn3GrZ2k3Z29F1D
	Grn8Za47Za43ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbG-e7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgg4cmrW1sildwAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194955_738975_59AE1010 
X-CRM114-Status: UNSURE (   8.60  )
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

The temperature query reads a fixed firmware event without checking the
response length. A truncated response can cause an out-of-bounds read.

Require the complete thermal event before accessing its temperature.

Fixes: 6879b2e94172 ("wifi: mt76: mt7996: add thermal sensor device support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 5391666553d9..d87851c5fc1d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4702,6 +4702,10 @@ int mt7996_mcu_get_temperature(struct mt7996_phy *phy)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	res = (void *)skb->data;
 	temp = le32_to_cpu(res->temperature);
-- 
2.34.1


