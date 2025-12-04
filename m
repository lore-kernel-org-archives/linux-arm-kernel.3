Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F23D1D893
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hG/KdOHq7SuKRVdgR08LyaVUng2vbhQkhjc2lR2Hld8=; b=jZTXJGpBMkv5QN5JFgK5q87Ihx
	3/Mb39aT2zf4d7nWMMIEQclbIwoDkTaLyjuK3a/PuWJv1qE58w/IzZ1nfvQEhEQh8Ik1T9atn+j1Y
	MaLhtxznFU3buUJS9+aoJyDj27MDU8Ae+EaiJnuqv7xsEZtg7RfpuPcXAciAtDQTC3kjyGRbwNici
	ZkVurrvnZhe+o8iZCdD5piWvMSaJ4DThRzdBiB6p63rZdRjm5jl37MhfKk/XAxYFlQQuZXDhY/kP4
	kyEPHSyP4GeNTtGLG67zXH4T4f5db4zdwi5AIHaMtDxhvxlFhLmN5RA2PODvNXozkAAWurK1yneBY
	qxQMG0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4RA-00000007ehx-0fmd;
	Thu, 04 Dec 2025 08:11:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4R7-00000007efS-3LjJ;
	Thu, 04 Dec 2025 08:11:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EED660192;
	Thu,  4 Dec 2025 08:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92391C4CEFB;
	Thu,  4 Dec 2025 08:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835896;
	bh=jKQob5kGhPU6k1EDWVJHsm1KE/0se8/FjngsbWMsNWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BZwzHcYqEX41azFTRd4HvbwGo/xKXk1ke2SjahvGzvsnx0BMnsBMIGOMqo1aZOV0Q
	 U2dzV0+Hul1P4wYy09270wopWqh/KWLpUm1v7b2fgmFTaESC6VN+PaeB7AftXPgX3B
	 GwyHCmw0AG2UCeLOn/DFYmIfp7JcAtnvDJnq3GbF1pMxnArZAhfZDk4UecQw8IYQfg
	 X5bm5S9r/QLWrrq8n2Ycgiz7PcVGLwMYwp3Iov7900usv2CndM+dOd+R9hVONC6Yvv
	 qpVIh41Mbe70ZWeqcX5GdAf4dneqlULcMFAoukX9i7j3ZwQ+5T0jCmpwM86zaSphc0
	 84Tw1NSR1+f3Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 09:10:47 +0100
Subject: [PATCH mt76 05/11] wifi: mt76: mt7996: Fix wdma_idx for MT7996
 device if NPU is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-npu-eagle-offload-v1-5-7819c52c0893@kernel.org>
References: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
In-Reply-To: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hui Ma <hui.ma@airoha.com>
X-Mailer: b4 0.14.2
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

This is a preliminary patch to enable NPU offload for MT7996
(7990-Eagle) chipset.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index beed795edb24c67e1b7b44fe87fd5de125a21d94..d9df3a72f4ef8170722cca626538ea526c04781b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -2204,6 +2204,10 @@ mt7996_net_fill_forward_path(struct ieee80211_hw *hw,
 		path->mtk_wdma.wdma_idx = wed->wdma_idx;
 	else
 #endif
+	if (is_mt7996(&dev->mt76) && mt76_npu_device_active(&dev->mt76) &&
+	    msta_link->wcid.phy_idx == MT_BAND2)
+		path->mtk_wdma.wdma_idx = 1;
+	else
 		path->mtk_wdma.wdma_idx = link->mt76.band_idx;
 	path->mtk_wdma.bss = link->mt76.idx;
 	path->mtk_wdma.queue = 0;

-- 
2.52.0


