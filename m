Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF05FFD8FFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 19:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsrGpH4o2HFZOH/D1AdkaQWzdLv5TPDTs3kNOb4aBj4=; b=j6FAjL3MQGt8cGOXm6vxYmLLjd
	cEG2rTjlN3um6l6XVXB0w/uh1P6c7ym3oYM+/eHCMVPLW5SlBbaRXGAKOZW+eKkbXXsPSLFfxlW+G
	rVHRyjAZXlS/uhRyr2KCeASbqVrsvIzCRhL4u63WLFxFKHvGxTPe+ppjqPfv7tLt29Cq3W7fg/j4o
	ohfBK4opyADW7FpucG+1FcuPw86naH6xeXT7pbJoTg1w61bYzKUDdO0RmaK3MH1k+q3ALu4uZNI1e
	Hvh4QqMEkrFAUyXKhpeIfC1sefHoWG4V1GG/+3paBVbrtp/h5Znaz/83HGohUso1j3tgiH6pa3GxK
	SHx/JSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgmA-000000071z0-3WK9;
	Thu, 26 Feb 2026 19:11:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgm7-000000071w4-3qBn;
	Thu, 26 Feb 2026 19:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93ECA409D7;
	Thu, 26 Feb 2026 19:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0BDC19423;
	Thu, 26 Feb 2026 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772133111;
	bh=+JK0woIfrSlrz8x0i3M8XRl8t8nRrkmf3J1am0HEVcc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KOVJpWOieNu3hwNvs3hC/9lUtZ7HA50gO40q0nQGWa1MswMzxHcVdhvkXXBQw+h2U
	 qPGpjdBGI3mEFNM5zA/woIJEXbfV4rzigQuAv7+xgthayw7zlwY63XrJwGJ+3p4GOZ
	 SV/cJxevho7rPYI/JkuSrL+0IWKLEW7v1rx13qncjCU+pqokmDMuucNUaWFx94IDt0
	 IJSqUIATWo3LcjRlhD2fQsnC0EM5cUevr7+Ztc0m7LOCfhSqB8DfH1OckfUiU+2EO2
	 OVWNUroTkKXfT0RD2TqkZD4tpL8U/+KqofMC9RhVrpnjaD6Tw9to7fJZQCkpUSJtgM
	 ahXYhKAtLTzyQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 26 Feb 2026 20:11:16 +0100
Subject: [PATCH wireless 3/3] wifi: mt76: Fix possible oob access in
 mt76_connac2_mac_write_txwi_80211()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-mt76-addba-req-oob-access-v1-3-b0f6d1ad4850@kernel.org>
References: <20260226-mt76-addba-req-oob-access-v1-0-b0f6d1ad4850@kernel.org>
In-Reply-To: <20260226-mt76-addba-req-oob-access-v1-0-b0f6d1ad4850@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 MeiChia Chiu <meichia.chiu@mediatek.com>, Leon Yen <leon.yen@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, 
 Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
 Howard Hsu <howard-yh.hsu@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hao Zhang <hao.zhang@mediatek.com>, 
 Nelson Yu <nelson.yu@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_111151_992697_E6A07674 
X-CRM114-Status: UNSURE (   7.34  )
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

Check frame length before accessing the mgmt fields in
mt76_connac2_mac_write_txwi_80211 in order to avoid a possible oob
access.

Fixes: 182071cdd594b ("mt76: connac: move connac2_mac_write_txwi in mt76_connac module")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 3304b5971be09e4c20178bdff66febf67bcd5c19..ad66a64200213a45e44d6f30a7a1e4306fd84240 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -413,6 +413,7 @@ mt76_connac2_mac_write_txwi_80211(struct mt76_dev *dev, __le32 *txwi,
 	u32 val;
 
 	if (ieee80211_is_action(fc) &&
+	    skb->len >= IEEE80211_MIN_ACTION_SIZE + 1 &&
 	    mgmt->u.action.category == WLAN_CATEGORY_BACK &&
 	    mgmt->u.action.u.addba_req.action_code == WLAN_ACTION_ADDBA_REQ) {
 		u16 capab = le16_to_cpu(mgmt->u.action.u.addba_req.capab);

-- 
2.53.0


