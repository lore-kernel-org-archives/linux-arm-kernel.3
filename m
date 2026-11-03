Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AB8606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PiSOThTZ;
	dkim=pass (4096-bit key, unprotected) header.d=david-bauer.net header.i=@david-bauer.net header.a=rsa-sha256 header.s=uberspace header.b=vM7c0oWQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PWx7yD2PbJfwHT7mGuRmzTwLanSHlLuCjcyfxjQ8Zq8=; b=PiSOThTZiGXrvNxqlE7S6smMGx
	ybqvgSavHTc4O0AhhRlu3UHxh+f8wURI2LnHgpwqO9XMkhzHp1WdgWcStyI2LLcDnRWMP+VcDrYx+
	nE+gpemrEusQZVJcRRJijN3xQah5lSViTgmxT0LCpcKE09v8tGNNUMoFZ8NWIskrU54UMtSPAQwnn
	3kdfZdJ3ryQnyHpXHsPvHMDw+kO2i8iacg93wdPVTYy5ekDgbg+wftUXDkxluFk0zqbDYflviyPzh
	mhfCVmTZDTy+K//+xxcrWyH4m8zaEEOnB4SOWGX63McGFD+F/2ibrIsFNKgGqkvZH5U8lLXCmZY0f
	OH7Yd5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2VE-00000000kFr-2px2;
	Tue, 03 Nov 2026 00:35:52 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2V9-00000000kBc-32m1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 00:35:51 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id A7C29610E7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:35:45 +0100 (CET)
Received: (qmail 3470 invoked by uid 988); 3 Nov 2026 00:35:45 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Tue, 03 Nov 2026 01:35:45 +0100
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
Subject: [PATCH mt76] wifi: mt76: mt7603: track consecutive failed PSE resets
Date: Tue,  3 Nov 2026 01:35:33 +0100
Message-ID: <20261103003534.176866-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-3) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=35HUvqpd53EuKLwxCx6c9zVK+zSfoB8JoaLgSV2muLQ=;
	b=vM7c0oWQsSVeeVPhrVjietOxfWaQDUpeCk8BMLGixTIlpccX1fSPUGGVSU7y68ByWHrDeQGWhm
	K374Uc8rMn0a425vxRBN5WygGiiC7WDIdtf7X3y0czMsKc83HFlnCbqENzWniHs/Xd03Aq2dhsvm
	dvcWmFUChQplWd2P0pNiKH3d2iRjNKJDmXEnZCtZ9r2kTaNQfHIz6Lc+qGueQnLbKBXnQP4KVVix
	f9mqpieIHm3nUFgY/0CQDWrc4CwXvf5I7AnygKBACik7JVF9nhMwgHKxwbHuBvLVXGgi/B9swv7d
	PtyMLVy5fvx7iEMb9O1IPfgYmaErymvKu5VR+Rejx0kWxUZMhkyEdtaMfTKsLMALLA4sRoM4gvwB
	X3U5E9MmzcsgZHz27Sgc+KZ4VfjsOe02MzQmMi03uI/yciqB1aVUHWObj9jxlcNq1te0UNCgZYv9
	kj8Ab/G2gw+cdpi8zwPnpsEYAzBYjw5Sf5PCR1gNZKcakxJ5ZHn62xm8hnl+GdnGCCLcw+F580Ue
	MM39KcP1BElYyzARu88BQvq6CPdQG14P8VZsnjJYBo/KgTDIzMd23XeTpglIaWRZ5BBYTn4HqKGP
	RLV1tRZPLADsnnTtxsgjqem0L1+eRz7bfTbOmqj++D90JUD8vrMOn1aCibepeHTAfVeEN3kYFN7D
	Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_163548_053628_E5342D6C 
X-CRM114-Status: GOOD (  17.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The current PSE recovery process uses the global reset cause counter to
clear the MT_MCU_DEBUG_RESET_PSE_S only every 3rd attempt. The counter
then wraps around.

This does not allow to track the total number of failed PSE reset
attempts. Introduce a new separate counter for consecutive failed resets
and clear the bit based on the value of that counter.

Keep RESET_FAILED reset cause as a cumulative statistic.

Also add a short comment about how the reset procedure handles the
failed case in terms of the retry limit.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 .../net/wireless/mediatek/mt76/mt7603/mac.c   | 21 ++++++++++++-------
 .../wireless/mediatek/mt76/mt7603/mt7603.h    |  1 +
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index fa0bf9a201ce2..549b0d3358f68 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -1342,7 +1342,7 @@ wait_for_wpdma(struct mt7603_dev *dev)
 static void mt7603_pse_reset(struct mt7603_dev *dev)
 {
 	/* Clear previous reset result */
-	if (!dev->reset_cause[RESET_CAUSE_RESET_FAILED])
+	if (!dev->failed_pse_reset_attempts)
 		mt76_clear(dev, MT_MCU_DEBUG_RESET, MT_MCU_DEBUG_RESET_PSE_S);
 
 	/* Reset PSE */
@@ -1351,15 +1351,22 @@ static void mt7603_pse_reset(struct mt7603_dev *dev)
 	if (!mt76_poll_msec(dev, MT_MCU_DEBUG_RESET,
 			    MT_MCU_DEBUG_RESET_PSE_S,
 			    MT_MCU_DEBUG_RESET_PSE_S, 500)) {
+		dev->failed_pse_reset_attempts++;
 		dev->reset_cause[RESET_CAUSE_RESET_FAILED]++;
 		mt76_clear(dev, MT_MCU_DEBUG_RESET, MT_MCU_DEBUG_RESET_PSE);
 	} else {
-		dev->reset_cause[RESET_CAUSE_RESET_FAILED] = 0;
+		dev->failed_pse_reset_attempts = 0;
 		mt76_clear(dev, MT_MCU_DEBUG_RESET, MT_MCU_DEBUG_RESET_QUEUES);
 	}
 
-	if (dev->reset_cause[RESET_CAUSE_RESET_FAILED] >= 3)
-		dev->reset_cause[RESET_CAUSE_RESET_FAILED] = 0;
+	/* Limit the number of consecutive failed PSE reset attempts.
+	 *
+	 * After 3 consecutive failed attempts, the reset limit is
+	 * reached, the counter is reset and the device will
+	 * return to normal operation.
+	 */
+	if (dev->failed_pse_reset_attempts >= 3)
+		dev->failed_pse_reset_attempts = 0;
 }
 
 void mt7603_mac_dma_start(struct mt7603_dev *dev)
@@ -1481,11 +1488,11 @@ static void mt7603_mac_watchdog_reset(struct mt7603_dev *dev)
 		mt76_queue_rx_reset(dev, i);
 	}
 
-	if (dev->reset_cause[RESET_CAUSE_RESET_FAILED] ||
+	if (dev->failed_pse_reset_attempts ||
 	    dev->cur_reset_cause == RESET_CAUSE_RX_PSE_BUSY)
 		mt7603_pse_reset(dev);
 
-	if (!dev->reset_cause[RESET_CAUSE_RESET_FAILED]) {
+	if (!dev->failed_pse_reset_attempts) {
 		mt7603_mac_dma_start(dev);
 
 		mt7603_irq_enable(dev, mask);
@@ -1920,7 +1927,7 @@ void mt7603_mac_work(struct work_struct *work)
 	    mt7603_watchdog_check(dev, &dev->mcu_hang,
 				  RESET_CAUSE_MCU_HANG,
 				  NULL) ||
-	    dev->reset_cause[RESET_CAUSE_RESET_FAILED]) {
+	    dev->failed_pse_reset_attempts) {
 		dev->beacon_check = 0;
 		dev->tx_dma_check = 0;
 		dev->tx_hang_check = 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index 5b0ecd01aad95..47f5be44292d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -155,6 +155,7 @@ struct mt7603_dev {
 
 	u32 reset_test;
 
+	u8 failed_pse_reset_attempts;
 	unsigned int reset_cause[__RESET_CAUSE_MAX];
 };
 
-- 
2.53.0


