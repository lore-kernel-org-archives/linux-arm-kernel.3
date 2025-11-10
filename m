Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BF4CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kvtJ1fETVqmj4nudSO7ryzRgE/VjqozzSZZ/ggs2S7k=; b=LhdyyQseXlzXDFNJVtczAAXvsj
	6bpt9loyzll4/DwFVtwwT8pRnQkPvH6MdUdWB6CCc/9ISExUn/jag8JquDueYNqE2KfPdaS4+mDNQ
	TZ9DXEo8TBszIoiPy6Vmoq4jHrss6E3VQOnvo0XosZTSF0+K1/jmkCgoPFDzkT7/TduSzxhfkNVRL
	ebEh+49rcOe5Ul3xmV8v8dj0LTSZmNQt0SCAJvMpxZfjrpWfjVKFnJ4THNg2+vkbNuymWn9Bua4yz
	hzGWY4m5gpCitCJZ8ADtk5cMokQQapvrrPRF9+x+dxRLxCRS50Ltk9jz8J9FZDkplMk3eKQ23FSQn
	aYJoJpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQaU-00000005MzQ-1Qgm;
	Mon, 10 Nov 2025 12:01:34 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQaO-00000005Mx8-0JDA;
	Mon, 10 Nov 2025 12:01:32 +0000
Received: from amadeus-Vostro-3710.lan (unknown [58.61.140.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 290ba10ea;
	Mon, 10 Nov 2025 20:01:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Felix Fietkau <nbd@nbd.name>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] wifi: mt76: mt7996: fix mixed FEM check of mt7996 chipset
Date: Mon, 10 Nov 2025 20:01:10 +0800
Message-Id: <20251110120110.193562-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a6da4493d03a2kunm0d50f1f77dd9f9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTh5NVkodT0lNHkNPSkpLTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0tVSkhPWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_040128_329222_E2998980 
X-CRM114-Status: GOOD (  11.52  )
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

To support the following varaint of the mt7996 chipset:
- tri-band: band0 iFEM and band1/band2 eFEM

We should read band1 for the determination, using band0
will incorrectly identify it as iFEM.
This is also the judgment logic of the mt7992 chipset.

This fixes the load error on the Quantum Fiber W1701K:
mt7996e 0000:01:00.0: eeprom load fail, use default bin
mt7996e 0000:01:00.0: Message 0012002d (seq 5) timeout

Fixes: e8cb33ad546a ("wifi: mt76: mt7996: add support for more variants")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 5e95a36b42d1..143400541746 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1137,7 +1137,7 @@ static int mt7996_variant_fem_init(struct mt7996_dev *dev)
 		adie_idx = (val & MT_PAD_GPIO_ADIE_SINGLE) ? 0 : 1;
 		adie_comb = u32_get_bits(val, MT_PAD_GPIO_ADIE_COMB_7992);
 	} else {
-		adie_idx = 0;
+		adie_idx = 1;
 		adie_comb = u32_get_bits(val, MT_PAD_GPIO_ADIE_COMB);
 	}
 
-- 
2.25.1


