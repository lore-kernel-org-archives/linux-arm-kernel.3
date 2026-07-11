Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E2AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RsxVtJ3F9+zJOkJQ6Hk1HPdO5PzPQX9X5kHg2GQ5Qyw=; b=GtEApKyj6eU78Y4HoB1zfeEdKt
	mbR8xI03/bPoRP7pMYJMktCJ5ZB2SiEQf+UGYcDx+IjKL+ZTQTiYwg6UZfficnSIo9ERQZ7M16/bf
	NaeD9kDBauerWQ/tvdZA1orbl+WGaRrhP3uHY92z+LiZdLevAse7SYRriJ14NTT6pz9cRGCp5Ww70
	bUehKRbH1+MBTit7Ls7mRw3j3gtgxOBKax9mPLChjhxX51UlfrbSBzbMgwNZi2sE75rxjQyAAwixD
	6Ggk7K1iZVscmWIc+00CXmZygJS7lcGJps4mI05sWF2hVxwYHYXIW3ZdHvLByFPmJLHopqp7y359q
	cBFCRSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiVmT-00000006ULS-0wnd;
	Sat, 11 Jul 2026 11:22:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiVmQ-00000006UKm-1Ol9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 11:21:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c7c61b5292so31583365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783768917; x=1784373717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RsxVtJ3F9+zJOkJQ6Hk1HPdO5PzPQX9X5kHg2GQ5Qyw=;
        b=JaneEOaZeMSOylWJhLI7Jzul5Bsa9zx3fGILmrVsdr0cukGfSgqYfnKV08HmXMoiHu
         QJcfJzxJV46NWIt25GphcXJR7lPKRZjwHjTs3vptdZMieT3li7DqPbimDJ/2ffrnsKPs
         64fgCmCfHCQMqmkBPjY9zyl/G055ypFoYjFQ2Fet/kcdTvJTgQLp4dTbG4gJmS+9OCFR
         pDw/mCiAR2JLqkulLzmw//i2Wh0n15UAyycOfqFgQyIIAq36KgIZv/GBJetrLP1xEZ4M
         1KundQ+h/TnQbUWourBHde2xSGxmMwsSOEPj2BTQL5Q4TTbDx05I57uKCgJBmMnmuXH9
         yxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783768917; x=1784373717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsxVtJ3F9+zJOkJQ6Hk1HPdO5PzPQX9X5kHg2GQ5Qyw=;
        b=Rzs231zClA7Q8qMSG5uzu5+G3GAsvxjhcfs61X3VRaopvtXI5QRE3xFbEVmnx1OfV/
         yM0AeWrkp1jppQLcONz3jXfoaS6rfZ+PFhX+AYczeNTmIRWnp/c5rFi+DGMYkNNLzn6U
         IWQuGG9aWkG93K7Kbw2WNWwSGukzAIrweih5Y2u0nILFGez/ixWkDecZ/DGxB4dcrapd
         xUqExZtdFa3aoKGsL764Fy85jvglPEeRXFj1hhQ6r2wQmPhCHGeBeZoR8U9StsMDdYuo
         nJYiUxivNf5XSnuT2HzAXFFc0wDgOQvuiX4ZCEqWaAXNUkxVhK+9cuGUEGNPRWbfpHkr
         rX7g==
X-Forwarded-Encrypted: i=1; AHgh+RqMsVhmOx5V5JdYY5d0sTaOgEZ/D9zfZMwghM7qyjlrP8lS+xb0ZiRYZfpSTIP+j1tZXrwzMvrNxxmhRRe0muUi@lists.infradead.org
X-Gm-Message-State: AOJu0YzTbZGhAa15yTgfeQovIs1SIVS5eVUfDn0rZ17BA7YhkLdO2f64
	3lhdjo8nP1n6wMF8hiKel2iTVhVR5Pmj9gcZ4vfwffpfZu8LnFNp9ZitT/z9keDh
X-Gm-Gg: AfdE7cnxqUU4QCboCTI799LWYOIikYGw2kpoMY3Sga62AJ5eWYY1EO2QGljx4yNPAPl
	9Pkrpx4ZeJYsWU7vD4iA0r7cU+7PRA4HSEmZs1lxWukQamRnOQv1GKFTyKdXlDCNb1YIQRGPTrh
	2xLQw/ik+9KkGOVdP1ufUdzO0rei3b2ZhitsV8d4mvqPdrF5AMhVbtIMYVTDXLy/uHc+hqYKTSG
	cSOFsuJu5yIN5G1ihV1X6sszK1Yp0ed0v3TDbtF/92ShcB7dzPSrS8VR2KUh+5QlvdNe79XA/Cc
	8aUzQJWc0qH7Cr4/HSfh8CHbI89A9Kg2unvTc5rBYwjvDq909KFkhI+3qunStbk8AYh+oBUeEjt
	ubSKaJf7YPMubGk4/1KMnfipOmOF5VW7U9B1T3h/907zeptZlXX+Sgwkj9OVXlquc+Bha1SOiF+
	yVOEf/FNPx0hwEG/S8RpcrKkx1s5fhVCBDKAJ7Gg2Qic4W5c1zJ+X2cw==
X-Received: by 2002:a17:903:2f88:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2ce9f044760mr26086835ad.39.1783768916739;
        Sat, 11 Jul 2026 04:21:56 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm73254255ad.37.2026.07.11.04.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:21:56 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v2] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Sat, 11 Jul 2026 19:21:28 +0800
Message-ID: <20260711112128.971-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_042158_380077_8E3C8F91 
X-CRM114-Status: GOOD (  12.52  )
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

WDMA_RING_TX(0) is required to set MTK_WED_WDMA_RING_TX for WED RX
but on a non-DBDC MT7986 it is never setup because idx is 1.

Setting MTK_WED_WDMA_RING_TX with WDMA_RING_TX(1) is not feasible because
WED still tries to send through WDMA_RING_TX(0). This is verified with
register dump.

Fix this by calling mtk_wed_wdma_tx_ring_setup if wed is v2 and
rx_ring[0] is not allocated and reset tx_wdma[0] if it's already
allocated.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v2:
- Address warm reset concern raised by AI review.
- Return value concern is skipped until further comment from reviewers.
- Added a comment to explain this special case.
- Link to v1: https://lore.kernel.org/netdev/20260630144831.1109-1-hujy652@gmail.com/
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 10d9beaae372..3fd704cac02f 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2334,6 +2334,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 		if (!dev->rx_wdma[i].desc)
 			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
 
+	/*
+	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
+	 * but tx_wdma[0] is also needed for WED to function.
+	 */
+	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
+		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);
+
 	if (dev->wlan.hw_rro) {
 		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
 			u32 addr = MTK_WED_RRO_MSDU_PG_CTRL0(i) +
-- 
2.47.3


