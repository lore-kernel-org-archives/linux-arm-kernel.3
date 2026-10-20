Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33ED60A262B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wEA9BCQo;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oabHzIZ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCB8hkaX/991fKg2XUmzqmfAjRKigtw03tT5mIJiQnQ=; b=wEA9BCQohG8mw3X+hPJSXQ4/ko
	z5+qqK/6aH7ofa54Ron2IOtXvRSCQdO/i4NnXTlz/4MERYQXjd2kVzlsN7jByS3I8ktDBcw54JeBG
	8268FPrvhsfzKf75SvWvJopc0YztCRFInsB/6bKsQxLFMEHNTVdEQfyDmp8YLgdDMp3KrrPMK/Wpl
	Y4yCL6melakukAMRQKk8tyfWEN47hWkACD+QF5+aioP6Ow88rYksQtH5Uz702tGigL1+QmqDXeHDy
	4pC/k7UElu6qf/d8D4hRu3/XaXlpk/A1Puswg7bYnEAQ5bSZ5COXPjNGQ/L5m+VNaowaD1nFFYy6F
	d/mbeWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvS-00000008jOJ-2BHy;
	Tue, 20 Oct 2026 02:50:06 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvF-00000008jEf-3wxW;
	Tue, 20 Oct 2026 02:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=OC
	B8hkaX/991fKg2XUmzqmfAjRKigtw03tT5mIJiQnQ=; b=oabHzIZ9tkhQBqAxXC
	04GFdRwV0p+ieq6GUsNB2pg7F10/JH5MeEEQAmup0kxDuHPq1onu4XcUinLmEbmW
	gOTiyTj+69nBNxI11WQmxpC0gNEzxdvAarqC/qY5yMtjenze1pPsBMl2SGifAT7Y
	qRNvYFznROVsQ2fkHPkdxlbNU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnr8C+1tZqMLhIBA--.5123S7;
	Tue, 20 Oct 2026 10:49:43 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Money Wang <Money.Wang@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 5/7] wifi: mt76: mt7996: validate channel MIB response length
Date: Tue, 20 Oct 2026 10:49:31 +0800
Message-Id: <20261020024933.3205681-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024933.3205681-1-yaojiale02@163.com>
References: <20261020024933.3205681-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnr8C+1tZqMLhIBA--.5123S7
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWrGFyrCr1fGFWkCw13CFg_yoWkXFgE9r
	1vvFn3tr18K390vr47CwsruryFy3y8CF95urW3t3yrXay7J347urZavFnxGrZFk3Z7ZF4U
	Grs8AayUA3y3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbG-e7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wc3cWrW1seTbAAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194955_120755_720FA6E9 
X-CRM114-Status: UNSURE (   8.32  )
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

The channel survey query removes a fixed response header and reads four
MIB entries without checking that they are present. A truncated
firmware response can cause out-of-bounds reads.

Require the header and complete MIB array before pulling the skb.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index c70d7ad3148c..5391666553d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4627,6 +4627,10 @@ int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(req.hdr) + IDX_NUM * sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	skb_pull(skb, sizeof(req.hdr));
 
-- 
2.34.1


