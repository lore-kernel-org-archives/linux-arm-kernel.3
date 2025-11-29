Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2A0D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 02:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cp/JYRXzpQUfHKnygAW6FMFtqKdikeBl6XCAbZoIbrs=; b=FYolCnwWDTZVdjHCylbklUpqZD
	Idjrqgqpbq5ytJR/qUYuuCmM3dQDvsi5+gUCBgzYZb+OX0RxNmTS4V+KIbX4Wn7IVVKE4Uw7I5SJs
	Nk84ru2T9DLxzYfWZxsIL9R6E9PE+SivCZmVeEGpRx6FbA0UHkrl6jMGtPiFvEp+fXnLSLslL1qZi
	MvmceC93dxE9/KnP8XHGne3ZktqvnkJ/anJbboyyiz2Tlch5GgfeC1uXvrUjdDG9j5SBoP8FRDvcY
	kc96xPiIBWWV6/3UTKaGBoHwRMCuZrCkWqoiijIixx4LHYyEuvhdhsZo0W1YsufQLxSjHsWVn3RFU
	LLD/0/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPArx-00000001Bwv-0Z0l;
	Sat, 29 Nov 2025 02:39:29 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPArt-00000001Bvp-3Udj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 02:39:27 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id E31EC60B9F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 03:39:14 +0100 (CET)
Received: (qmail 7459 invoked by uid 988); 29 Nov 2025 02:39:14 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 29 Nov 2025 03:39:13 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76] wifi: mt76: mt76x02: wake queues after reconfig
Date: Sat, 29 Nov 2025 03:39:02 +0100
Message-ID: <20251129023904.288484-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=r+TbYhbumj1LE8b1/7eJFLcgqdgfk2pwXQgbmKsupuw=;
	b=ZyuQ4RBJKyUA52XzcpBJ26EPkdMekw9p6Bem8sCEckOnqLoU5lOpVspUv5jatMkVYaLf2nfCzd
	rfPgNtHA3ihFfsc+fRXrieV+Co2ZgOJ9ahaP369qXv5z2bA/UXKOsAh3lLu53WdidtKShM8WznPz
	WwFGhVyza0nuZdbOgQ9wXX7ZmI8AHOAXuLg1yaPniWOGXq5vTA+VI71XiEqssDmPjnc4YXbe58aj
	1pKocbb9eH1VX5cF8oQutygWasZFPB+v0jxD0qeZN5GFujDPWihlegGkIRQ5NJ9X3YXWS/L0crd5
	DYfvTDtFXgfAE+C/8g5PzHnN5Ra40Cz9lkGxnW/ishU/4QWYrugGCwt5CcvaXY9AmoNRqj2lQAYU
	jFcgtjcqcDN36CEGQKfDctVyCQgeZL9sLpejrUPLAAFJJCluj8NHGNwbI2ezTMOIJ4NKnjelwH0/
	f76XnovaeViSjESw00+6jlJ4pUjqsE65RI76wjMVewCf37o9XloKN3O+CHSYWtr3Qv59Sz2Di0kb
	9XxMdx7WDJ3fIy/nrR5LLzqoo+0eI61QDQYGXgZk01khhTPjqaP/PAINiWpo590fdOQrFRIs0eki
	OooHEtIqMY2wHvyfrSBBOG3RgOjWAh1agyv2Hw0Tfzi+paYgJfFQW92CI4qxVhu9YjeJJwwpsaE1
	U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_183926_279798_4EA4CF70 
X-CRM114-Status: UNSURE (   8.03  )
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

The shared reset procedure of MT7610 and MT7612 stop all queues before
starting the reset sequence.

They however never restart these like other supported mt76 chips
do in the reconfig_complete call. This leads to TX not continuing
after the reset.

Restart queues in the reconfig_complete callback to restore
functionality after the reset.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index dd71c1c95cc9b..dc7c03d231238 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -534,6 +534,7 @@ void mt76x02_reconfig_complete(struct ieee80211_hw *hw,
 		return;
 
 	clear_bit(MT76_RESTART, &dev->mphy.state);
+	ieee80211_wake_queues(hw);
 }
 EXPORT_SYMBOL_GPL(mt76x02_reconfig_complete);
 
-- 
2.51.0


