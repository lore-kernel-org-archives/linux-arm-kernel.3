Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07144C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 11:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NXYWQYJwVQQ5jEVIP2z582vjRVMjyPXpfZ4/8yMmTM=; b=RHWW4Ab0nlXyk8HRFTh1zUNNWp
	wo6V/4BqEVC4E+LXSc8TSwAsQP9GPvl5Q7CQZGIoUbKEMA1/c4sm6zRk+q3ClPXKfeTlQsf9a6pZ2
	/exD4HQyFFD4XHuZwflKx3ToLC3hEOp1eBO4FmWaHsSZoHQBNANFvoDDCDpzSZqmr+vlWxaryim3D
	jzFuKOqyXFeKykqykRceL9sucOALy13p34+htXsS2cjkpK8laMTwVykugwPrFNGkputrqQOsdC3S2
	0i+IJEzSfujmelX8hk/eEedfN5zUuGnpZpfrjJCIekSGgojKbW8JEjhyB904AtP4w1Ok0CM6QDVJA
	IP0S9edQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8ia-0000000FM4g-1nkm;
	Thu, 05 Jun 2025 11:25:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8c7-0000000FLUJ-2uez;
	Thu, 05 Jun 2025 11:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33C0DA50627;
	Thu,  5 Jun 2025 11:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E3CC4CEEB;
	Thu,  5 Jun 2025 11:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749122305;
	bh=oBSODQMsy1/d5/U6vE4OfmyUvi5gh7AawwYdZIj6y5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MycVClR7i4Ggd4SLTz8CmzHwMSEzB/HiZKzqwvdl99ZbjSM08LzPexT01HXjeaZJY
	 xNCuc+03lYp4Jiuyo5xv2c7KYe+ycdRNClQAnPkiha/9mmdDB0cZzejavJyNe0eU/o
	 EXcxzMjitXzc6/qOX+ioylo18VrsukR0LzacOPfUAqLuiYpavBeW7e2oYcX+0nTPkH
	 ZfTycHPsEREIiGXDiNPaglCh+/imgXwfZwZZZFhogFHU2Lak6d1Pj/7lTqFqxk2edL
	 kDSlIrGtgqe+UpkPuzstMcQB0TAXL4VytFnGA3AKXhka3pKq+/RxgBAZ0w3ie9uk50
	 W39gFTtib4aQg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 05 Jun 2025 13:14:16 +0200
Subject: [PATCH mt76 1/5] wifi: mt76: Assume
 __mt76_connac_mcu_alloc_sta_req runs in atomic context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-mt7996-sleep-while-atomic-v1-1-d46d15f9203c@kernel.org>
References: <20250605-mt7996-sleep-while-atomic-v1-0-d46d15f9203c@kernel.org>
In-Reply-To: <20250605-mt7996-sleep-while-atomic-v1-0-d46d15f9203c@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Greear <greearb@candelatech.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_041827_810084_CB5BB733 
X-CRM114-Status: GOOD (  11.39  )
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

Rely on GFP_ATOMIC flag in __mt76_connac_mcu_alloc_sta_req since it can
run in atomic context. This is a preliminary patch to fix a 'sleep while
atomic' issue in mt7996_mac_sta_rc_work().

Fixes: 0762bdd30279 ("wifi: mt76: mt7996: rework mt7996_mac_sta_rc_work to support MLO")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index cb13d0a768789af956f810e5af19507e436a449a..fa08e952dffa9d6e623a1f6819f136be3a5a0c76 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -287,7 +287,7 @@ __mt76_connac_mcu_alloc_sta_req(struct mt76_dev *dev, struct mt76_vif_link *mvif
 
 	mt76_connac_mcu_get_wlan_idx(dev, wcid, &hdr.wlan_idx_lo,
 				     &hdr.wlan_idx_hi);
-	skb = mt76_mcu_msg_alloc(dev, NULL, len);
+	skb = __mt76_mcu_msg_alloc(dev, NULL, len, len, GFP_ATOMIC);
 	if (!skb)
 		return ERR_PTR(-ENOMEM);
 

-- 
2.49.0


