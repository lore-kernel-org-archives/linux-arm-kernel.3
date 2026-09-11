Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E59EC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OnfCGLquB76g8nW5eb0c7ZCBPmlKDyddEjSpGRtgpT8=; b=q0LpGM4DCvwdyUopdt5+LvmAiO
	xUINf1q1hjXmBq2hLUuXaGjwx5l3H/ResE523OwC9zScQfmz7VYt0bgnvUQzNQzBFHinZR9mSVUNt
	qODXH2DmOqUIjVbSIqzQ7vSpYaKfHYZCaK7xqKRrhDMR025YiNnE0lyhGDe8hKNNnYaQT1ofzlssx
	Vt5xS1J1VLqCx5v7Qk7VTiSEPsa0gIxlZSxJK/esF6TBrUCtUpL47oQhmnNFl2aw2WbxCa4XNoSQZ
	LspItVEZBTHFMxXvsz8kLXtz09jPOTMaHBWT/faXq/zf/oM8A5BmNgOslnzMpoGgbtXZvqHMEvSbk
	ngv2z77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rFo-0000000FjO5-3TGq;
	Fri, 11 Sep 2026 02:44:40 +0000
Received: from out-25.mta0.migadu.com ([2001:41d0:1004:224b::19] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rFk-0000000FjNP-0xKT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:44:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6s7db2mV+TlkzTBdjKbi5IdNEnFyPr3Kh2+StaULis0=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789094672; v=1; x=1789699472;
 b=jmR4bZcdh9NrgUWk1uo/zORoV7q+POewcXMH1/mSHpeNKNEOtYyd40jpb7z2Uk9zGPp4QjyL
 srb3ro/D1zU9g5f4VfDnD6lJv2WIdWLeQ3szcSxKC1vvC6QyiZHZ3VUQDOJYPixtlxljULnhms0
 CDhmdJiSLxgvsgE9JH9MAFhbm/i8ZF2xEXSJNrUlp/u7IybV0EC67jtLebpnfdHKVrfg5RHD0J4
 NN/rb/RmqXxJ0gA7/TjqPOCqcEphj7UgnZv27oj8fHsWJ12sYV73lKtW/58Pe+/HmfhuQGj26SO
 ZqMQOlNUfaqI83NRSygNajMblCiveyPU0caGq46hVhm1A==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ea8fa00fd0bba988;
	Fri, 11 Sep 2026 02:44:32 +0000
X-Mizu-Trace-ID: ea8fa00fd0bba988
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: mt76: mt7925: don't put the band auto marker in TGID
Date: Thu, 10 Sep 2026 19:44:28 -0700
Message-ID: <20260911024428.65244-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_194437_643559_C2940D14 
X-CRM114-Status: GOOD (  10.10  )
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

band_idx starts out as 0xff, which tells the firmware to pick the band on
its own. A remain-on-channel grant normally writes a real index over it
before anything else looks. Two cases never see that: an MLD station
throws the grant away, and an AP has no association to trigger one.

The TX descriptor reads the same field into a two-bit slot, so the marker
comes out as 3. Every data frame from those two goes out tagged band 3.
Beacons are fine, they reach the firmware separately and never build a
descriptor.

Same numbers on an MT7925 and on a Netgear A9000:

                        stock         patched
  station, one link     0x00000001    0x00000001
  station, two links    0x00003001    0x00000001
  AP                    0x00003013    0x00000013
  real band index, STA  0x00001001    0x00001001
  real band index, AP   0x00001013    0x00001013

Only the marker cases move.

Fixes: 0cb349d742d1 ("wifi: mt76: mt7925: update mt7925_mac_link_bss_add for MLO")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 101f571b0..3b82c9de2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -798,7 +798,8 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 	val = FIELD_PREP(MT_TXD1_WLAN_IDX, wcid->idx) |
 	      FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
 
-	if (band_idx)
+	/* 0xff means BAND_AUTO to the firmware, and TGID cannot encode it */
+	if (band_idx && band_idx != 0xff)
 		val |= FIELD_PREP(MT_TXD1_TGID, band_idx);
 
 	txwi[1] = cpu_to_le32(val);

