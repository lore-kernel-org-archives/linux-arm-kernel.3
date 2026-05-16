Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4BFCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7lRl01Se5Q0jQcED3g7NOrr18imEFUBhEiitHBHJUyU=; b=ri0UxUrtcYzriUmyUgeET8MjtX
	qIGtTsjqI0RdS30EqKUk6FRYEpiBJj226ErtHWLkAyN5SbJ0J6VRPxvdQZ3fAOTBtez+VHNzxbuNC
	6ebBDTYN8Lqw6U+u1vIRa10PXFWDZLNCaO2iRhdK3aXS+BfwasHBbwfchyXgs0xpVXlTdn3YyWRKP
	Jdr8LbecfPVOl98/aSsAzBFwi9HuDQbyWSC6R4R4YSaGsuX+4j8OuVnZHegKSjiIE7GuPmpLq/2pe
	+IkcoijdasnS5r++nM0QrbATJwXedD3TlIeO1saaAUI75YudWzECS89GC89PcAyN/DWWFT7dp0KyF
	8QnmzPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGLF-0000000At4n-2x9m;
	Sat, 16 May 2026 14:50:13 +0000
Received: from mailgate02.uberspace.is ([185.26.156.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGLB-0000000At2u-4AkA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 14:50:12 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 46521180360
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 16:49:58 +0200 (CEST)
Received: (qmail 30872 invoked by uid 988); 16 May 2026 14:49:58 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sat, 16 May 2026 16:49:57 +0200
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
Subject: [PATCH mt76] wifi: mt76: mt7915: configure noise floor reporting on reset
Date: Sat, 16 May 2026 16:49:42 +0200
Message-ID: <20260516144944.2574053-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=TZUxj+HbLt7zXr6JPNAew7gA5D1W4pXAgzIME0JuOv0=;
	b=rF6s+3kZW5JAJo2UVMEHPudnGH8BLyyu/LJ6Z3yRDoz4CPYROD1mZWp43F2WEe9Hrshd6AVFTh
	l+Ocd5j60/t8xwJgn4dsui5vBJ5EAyOkCi143tQX9d1yyqQs5UnTZrP8/hd24SfLj1vNHD5pq8dJ
	1UXyZ3owVLSI7IJNds4LPK9CAesXPMEpgHaQH2JLKxZsUPU/rhcE8lYdKBRLew/hSiCjw8Vds+fx
	nrnylafYd3B9HegA7MVpHQmDKX7i34fkFG4n/Iiib3RGkHGdGUiTIlQeVUgtHTsUcYGxFCzT5wU8
	TcCC1fzArxizcVqCKePMO8jS8AIUzJrzRxpe8/SnxgOtXwf0KOb0NfjJA60FnUCgLReBy4jJTqBH
	Al0ADRMoCrAFpzQowj5u7TcW02csq8KgiwIFeDq8e+m+fE1/2d4+hWshrR1pmuZ+iTn4MTPdDGBs
	dxPYM1Ldl2vcyr0Ayd1+euZB++x9J2zRnErP8Z0w/MkaKDXSP9GMWvY/yvDEZOcUVEBG3OvwusmM
	fzX4HqXEu4tPJkv/j9LBOhFrsM/08cN2UnxUJmJFyYOfD81gH1N70r5F+RcxloXpt96xIeF2L+/x
	KYve2sN89jLr2WL0MQEGcydimm4SpUxRCzsj1P7WmtiZA5hDSnHg4bqbEPakivE1S+RfRrTDPeiT
	M=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_075010_462183_27DB7EB7 
X-CRM114-Status: GOOD (  10.62  )
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

When performing a full system recovery of the MCU on a dual-phy
platform, band 0 (usually 2.4GHz) stops reading correct noise floor
data.

This is due to noise floor reporting only being configured correctly
for the second device PHY.

Configure the respective registers correctly after restarting the MCU
firmware to fix reported noise-floor values.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index e1d83052aa6dd..b42c26d0d09a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -25,11 +25,13 @@ int mt7915_run(struct ieee80211_hw *hw)
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
 	bool running;
+	bool reset;
 	int ret;
 
 	running = mt7915_dev_running(dev);
+	reset = test_bit(MT76_RESET, &phy->mt76->state);
 
-	if (!running) {
+	if (!running || (reset && phy == &dev->phy)) {
 		ret = mt76_connac_mcu_set_pm(&dev->mt76,
 					     dev->phy.mt76->band_idx, 0);
 		if (ret)
-- 
2.53.0


