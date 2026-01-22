Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65FFC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnmCHgzGK5sCV4n+d8iX5gy1NawC5j7GjLG5PuEIiYY=; b=pQ92wFXzFIrW9oORX+HFpfXxWu
	09V9s7zA+Gq7twmAbcwbz25eLOGYHYXkEPwuiZwIUxAL4Nil9y3uaOteWRBBnEXf1rKUqMLiUobQi
	cfc2YvhwH1kB1mHyeyx/OS8fDXY8Cv/VyOxbQs3xxdyBiXM52TJ7DGfiWp2CDaQUYFmq8/muL7Cjr
	KRRzjI/vF8S2CB0/UDpAbsDt2+UMDPfjFW280NU42yQQciV6IafA86dlFQeK3H+/y/mAIbf/ngGW8
	D7ftwJD+btP25L8XibxMR6VayMpN4QdtqWmrXm5bsnPCJflh8o1lHwi+xrNa+C6suSRnt8NGCOt3/
	fDQBxeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis74-00000006rfb-2BR1;
	Thu, 22 Jan 2026 10:40:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6y-00000006rY5-2Hq8;
	Thu, 22 Jan 2026 10:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vnmCHgzGK5sCV4n+d8iX5gy1NawC5j7GjLG5PuEIiYY=; b=Ur7a/jHdIax1B+RJVZj94u2pJ4
	vvUePYbQRZ8c88Udef5FaiP5V7J5LBsCPU0ISnWB/e1zsgKbsnxGe8A7p6Rui+qUew1XTRY6hsQy5
	TtcpmFhFln1EcCQK/Oz+02RJo6BJn6nKwQEIqL473v376l8D1BJ7ZEu5Z9udrNbUVAmPaa9jQPkFp
	MEUEe+lzRHTnPhq11PKF4HVDSpuXh0lwbETE5FBS/4vM10qzMbZYcgmvZ+TO7A1U0KflPyQt9qZh7
	horuiZRijdgQD+PsPSOjGE+CIFY6V/zCJWXQakMmjdnq6gEiSUXKxretkI2bSRFgm9uRVCsQ1zvYS
	bWzBhttg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6u-00000000AKL-0XpY;
	Thu, 22 Jan 2026 10:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D536344018;
	Thu, 22 Jan 2026 10:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63304C19423;
	Thu, 22 Jan 2026 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078418;
	bh=0+Uz7U0K2hAVNFxVHZqznnMry9ZhYLXUD0TV1aT9XQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YnmmjHfmcgQkM/2XkMRxUoHmYESTfT7qhstYh0nzkLp03Alqci7O23+Z4XkFjNiXr
	 R95utEE05/ZouqIi1koR5W17LX4nyxSK8oBQ3PsGG6+dZzkYX1Sa25tSRBfcl+A9Lt
	 vE+0TXtz1uhvgdIUznBXt7EffdaNE5o0BdIlzsTqZmj7s4yDS+g+Z0xh4u5/otQKE2
	 9xOALLNhHxrtep/4qtqlzy2tyBRYQPodghqE301A7dkI4qrnGhXq+afX3wnGUQoP7Z
	 VCVf6GGlAOHz01fRZY3y/sy8Pt2ZISe8EoocPprJcSRUzejdt0XGBhxyfylK0gWUxx
	 FcoH3jaFVmzaQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:49 +0100
Subject: [PATCH mt76 v2 05/17] wifi: mt76: mt7996: Fix wdma_idx for MT7996
 device if NPU is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-5-2374614c0de6@kernel.org>
References: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
In-Reply-To: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104020_630610_2AD3DDFF 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

This is a preliminary patch to enable NPU offload for MT7996 (Eagle)
chipset.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 78151197feccb0197e44f3f73c0f01c4589314ae..3aa0a7bf830550a05c6f5925014c7c34e0e99f78 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -2237,6 +2237,10 @@ mt7996_net_fill_forward_path(struct ieee80211_hw *hw,
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


