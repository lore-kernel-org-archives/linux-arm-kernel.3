Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD501C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFSrzpcz9SqjY9whX53myrmpK+nsdK70cZKH285cMwQ=; b=3veHFIr1DSpbhkcwMpnJvP1HH2
	x6+RoGhq/U1E5vOFbPR0r5J3lGuNuW9sKAVBgGkOlM9OVgDM2hijempmLlKn2b5XPfSAcA6jL1C6E
	Pr87xh5Kr3VBOcJ046hZUoSogiTsqShYxVZ0T7vo49Zn5BzoSqsSV32xoXChQVGoe6/CuMyGojCOZ
	u/ibH1sV2HOPkt/ViOwA/0HLkOO9FueHmnJruF29RxV8Gf3EobPlhRy31S3cnyAlfdm9h3OASUC/+
	pac50o/TLLWjHzFPVVp50FGHf0QE8AwQ2l57B+iOhlQKe8ur51WXaFUtyR5CSRjiRCwD5EjvbeCoF
	qJWryyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4XG-00000008qIy-3MH1;
	Mon, 05 May 2025 22:43:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47b-00000008iDW-3fgT;
	Mon, 05 May 2025 22:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6DC744406;
	Mon,  5 May 2025 22:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3840C4CEE4;
	Mon,  5 May 2025 22:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483431;
	bh=3qEf2fFv1ctCBQfhN3VdnszlaOGcMXZgdrvEJbs9jsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K2SA2VFYka19dbhJEfE04bIzTGVVi/3q6n1KgMalb8BNldNrDzRV7ZXVBQDS0xT6G
	 IG/P7yVWP1qLkDB7Vf5mAGIJgQSdbG6Z8LeB+jYZMnXhxhcRhSYjruOqfS2iIDAYVd
	 jPpyomg29TvzPjRHHlrGjtSnOO8Fh/15rpn+xT1tIhoD+SnClS1/svmWOJUGDmsqva
	 nxvjrpgf12P2uKTZFNMjZ6Twb6vR7Ga/92Mmsngi1TRjnsiwBIw1EkO5/+NEVHnJTA
	 sOtbZ4vYipfUqx5MJi1SrkfyW3Kgd783M7M9GJzUQOx4CUGjVo4CvkJC/tCvRLf/2a
	 ASrWzGYQ8zlSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rex Lu <rex.lu@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	razvan.grigore@vampirebyte.ro,
	Bo.Jiao@mediatek.com,
	shayne.chen@mediatek.com,
	wiagn233@outlook.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 078/642] wifi: mt76: mt7996: fix SER reset trigger on WED reset
Date: Mon,  5 May 2025 18:04:54 -0400
Message-Id: <20250505221419.2672473-78-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_151712_052344_A6734DB8 
X-CRM114-Status: GOOD (  11.47  )
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

From: Rex Lu <rex.lu@mediatek.com>

[ Upstream commit 8d38abdf6c182225c5c0a81451fa51b7b36a635d ]

The firmware needs a specific trigger when WED is being reset due to an
ethernet reset condition. This helps prevent further L1 SER failure.

Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Link: https://patch.msgid.link/20250311103646.43346-2-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h  | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 43468bcaffc6d..a75e1c9435bb0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -908,7 +908,8 @@ enum {
 	UNI_CMD_SER_SET_RECOVER_L3_TX_DISABLE,
 	UNI_CMD_SER_SET_RECOVER_L3_BF,
 	UNI_CMD_SER_SET_RECOVER_L4_MDP,
-	UNI_CMD_SER_SET_RECOVER_FULL,
+	UNI_CMD_SER_SET_RECOVER_FROM_ETH,
+	UNI_CMD_SER_SET_RECOVER_FULL = 8,
 	UNI_CMD_SER_SET_SYSTEM_ASSERT,
 	/* action */
 	UNI_CMD_SER_ENABLE = 1,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index 7a8ee6c75cf2b..9d37f82387464 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -281,7 +281,7 @@ static int mt7996_mmio_wed_reset(struct mtk_wed_device *wed)
 	if (test_and_set_bit(MT76_STATE_WED_RESET, &mphy->state))
 		return -EBUSY;
 
-	ret = mt7996_mcu_set_ser(dev, UNI_CMD_SER_TRIGGER, UNI_CMD_SER_SET_RECOVER_L1,
+	ret = mt7996_mcu_set_ser(dev, UNI_CMD_SER_TRIGGER, UNI_CMD_SER_SET_RECOVER_FROM_ETH,
 				 mphy->band_idx);
 	if (ret)
 		goto out;
-- 
2.39.5


