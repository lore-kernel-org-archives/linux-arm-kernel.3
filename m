Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12993C83F0C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIh1pmSY2iCvVHFdiL9mgPjsREaH7LtF8UqDDd2a/yU=; b=UV/gp67YHA4Vrvz2s9mUytP15v
	DUOFJKeDZwa1NaQ7d3DzMUmb6DzM84f4GGJZrVBO4z1H7Kx7rX0Y30GYEm/7gPZh+XwL+WkSzBfHv
	sRR3NwJbD6RyViNfO2FctJUyIX8u1EEVElnOfNGRthxeBXXbi8ZdkqZ4pX1oKBq6eDbUOhYnw56rm
	wnnpKeJUwVgGebZyYrDVJTXGeYuhv5GEZTL7kpmlnwDjwewcQMadAGlLhgl4J0JrxOnUOZo5jizs/
	cF4WV5IM6aUIE5CbIKrd4XA1Re2e/9/wODr6ao/gI2yBO0psM3aJrxbN2eRLtPj/XKq07roSshk5A
	UAAiXk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhIE-0000000Eefu-39uM;
	Fri, 04 Jul 2025 14:21:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9b-0000000ETJt-2hcy;
	Fri, 04 Jul 2025 13:08:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BD0C5C57C5;
	Fri,  4 Jul 2025 13:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E829C4CEE3;
	Fri,  4 Jul 2025 13:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634514;
	bh=13s+yUJkFfS3KoiwPRRfaKBkp+syuO1jDT4DF9d14Tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=utiiFBeC12pPXuC2G8rvmRsKlTB4bE8w5JKGI3ccQ8SCSpovT3aox5ZW16Zi6bPd3
	 DZ5di+LFJokeBXGySSgvwQU0dsHctEZU8tEMTOW5pZ5JKG5xFUyfMLGlHiMlcKkElm
	 gzVK7ga40TznMkN+4OFh2/2MlOmppja0xKxi/oZFZIpYGOQJlD0f9odZPkGSejTqw8
	 hLsNUfKCu8o59GnK5iShUocwuO9lrQASq9g/GCbH6lZMhI7MeBTM12S2n3MVEFJ/ud
	 OxDZSNezNHLIe2Rd59H1WT+rrxFC02tM9RnusghgC6BPv87o1OmNHFiSA8cvoPEoIR
	 MJlgDTaKKbqVw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 04 Jul 2025 15:08:08 +0200
Subject: [PATCH mt76 4/9] wifi: mt76: mt7996: Do not set wcid.sta to 1 in
 mt7996_mac_sta_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mt7996-mlo-fixes-v1-4-356456c73f43@kernel.org>
References: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
In-Reply-To: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060835_732411_212149BF 
X-CRM114-Status: UNSURE (   9.10  )
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

msta_link->wcid.sta is already set to 1 in mt7996_mac_sta_init_link
routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 5283aee619a9811f2e75fa4434ceced9185991f0..d1f90dea512bade652743611b7d062863a63ccfe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1119,7 +1119,6 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 				return err;
 
 			msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
-			msta_link->wcid.sta = 1;
 			break;
 		case MT76_STA_EVENT_AUTHORIZE:
 			err = mt7996_mcu_add_sta(dev, link_conf, link_sta,

-- 
2.50.0


