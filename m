Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EBAC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4aPNtQuaiA+2t73z2Ob/AKAru2eGb/yyU8jK4Q9iWQ=; b=R0SHYOPozWleQ1H5epY4OzVgQC
	YAFlvwwWURWf/X+1oWxI3lblIm2lemmoUYircmXfm1gfSMDbQ0wRYhesa+EA4dYm6i0QbYdtjOWQ6
	VwbrlvgmiBVnNbbdh9L+EkIHsuFBDOcdCVCkNSnaCnT3FN83JKFyOZf4tX05f1p+kdcy6h1kmzCep
	uPcRj2SigddI6am9bFoW/0API7KeCZySFtT/cLgLvoBcmNBJQtU8TVd/HKDuEN6cUOSMDn/mXZIKN
	bxjIUzIN07oPgZXxO5x3wdkw4NJ/OSzoCN5VGzx6VC8/JjI4YRmqJAtmqF3FHtlJ1VFn4w0xgKvHH
	4nHOV6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLZ-0000000BZlz-1QCB;
	Thu, 17 Sep 2026 14:44:21 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLU-0000000BZjo-2wpi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:44:18 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469a34907so1062312b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656256; x=1790261056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4aPNtQuaiA+2t73z2Ob/AKAru2eGb/yyU8jK4Q9iWQ=;
        b=B+iRE8xuDqaeFzhcPYnxMs79FJigTMsZX1ux0WeFN2j0xbXriiZ8p1wjuSTExLCzG0
         Hn99KzX5t4Vz20ewvZW1/kmG0/XCdPhGYnuehM2sDX8zzV43zu5zMV8JNlECaOESFpNa
         g8VETP/8cIPfcYzsUdBuChh5/+92skoij+xSBLAq7VK7nBDy1fNv07eCa8NBSi3sOWMW
         Xwj/6vwaAmgmpSSG4HVAotk9j1EjbT+SEMt5+Wv8NPjD8Lb8pDY/7HYF98uY66LXadcu
         e87p8at/9mMjJqoJm7unVkfzy4ARJL1E8sv/rj1leAcOaGc6VrSzGN7Lfchazd/qX9wW
         t/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656256; x=1790261056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4aPNtQuaiA+2t73z2Ob/AKAru2eGb/yyU8jK4Q9iWQ=;
        b=eI/4soSJf6/Is2xXrQRfHwngcy07hWkuh5dscsmpEZoa2BKslwLL+Bvwc3C4EIUIiY
         BIpjb7Zm5tTUIty1MnLjXpF4c2x+ee+CEog3rPTugAh/4n/ZqvKs71RQG0KQ+MxVd4LF
         d3BnHRc4jrVpqORdPwOyLGf++W/ajk9dSlWPLW/zRFt5l0JG05SeH44lvonvZc5RJgM6
         E4mskW+MbChg93sGoOCg0p/abfGwNgyCxvzO92F6twBC3RRwiP98jn4kZ0B79Z2y8x3J
         wfdVXA9/PLq4j/C5y56qk/NsW89jebPytdgr54sjg1m8APauZ2nxT8sUaZoHpfkN5CF5
         kJsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/K7B8Co3TjYbRHuqgSPmJRV7N/YCnTqzk7jOeA98bdp9liN5dPc18XBtDcW668Tvr3Chw7jliX8u+RB8EpfYm@lists.infradead.org
X-Gm-Message-State: AFuF++n4qSZAYh+epCGIyDqHUXmNU5cKXmhrJeinErzbAhdi1WJgL/yk
	tssrcXbUWE7T5DLEbuRAd1hNMBXpN+w0iVvEaIYmKngbd3dxJQZxsWYJ
X-Gm-Gg: AYBFou1E8q4yi16/Y/F6lVa9SJjVsq+uNEF5wfdJ0FF1EHN9x0cN1CJN8hTFVxPdL3k
	uRBO9sHhb9d74nwG/3U8FifCYHqdsj5OAp4I1AeKWFK+MVq/n28cSBrmgPEwQ8cLrfnAI+GgUw5
	sCrjGIU/ZmXyd1TMVmaTjQS165Gow1kmVqBdcF+veqYtBFNHQupucks7XIY3zP2J8MJWjlHzMQE
	qGm4+LzaHMbeDcXQ74wNVB9QIR30y5TZmYVLLP5w91BT/ypJgelUCfmQ4FIN5r/QG66nRXV2oD+
	zEidhnmR6JGevvV22J63OtZsrNQ3mBxAhj8miudjZqacO6nguJIS4dfnXFDV01v80DHPY6DQwoj
	Aq/U5Jzzotq9i97IrtFzjOnwvEGuCWyVUB039ullK4itFLfPHRrmGpmg2RGgIntvbVR0bMSsdvj
	nRzX6JXTd57iMhLR+yEroC4V9oE6eJoc6iPcL1/rf9xaraKR17AgLp4dZPtja0FkHhMX8R/Wvrs
	cHKKP/a5TL5klBwoH/cqQ96R5fzGA4YonMSdGKI9G7O6CP5p+A0
X-Received: by 2002:a05:6a00:1d14:b0:874:708d:b626 with SMTP id d2e1a72fcca58-874708db89cmr1110819b3a.27.1789656255590;
        Thu, 17 Sep 2026 07:44:15 -0700 (PDT)
Received: from localhost.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm2962034b3a.51.2026.09.17.07.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:44:15 -0700 (PDT)
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
	Rex.Lu@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v4 3/3] net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Thu, 17 Sep 2026 22:43:35 +0800
Message-ID: <20260917144335.19466-3-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917144335.19466-1-hujy652@gmail.com>
References: <20260917144335.19466-1-hujy652@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_074416_748293_6E32DDA5 
X-CRM114-Status: GOOD (  14.45  )
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
Changes in v4:
- no change
- Link to v3: https://lore.kernel.org/all/20260724172040.1653-2-hujy652@gmail.com/
- Still waiting for comment from maintainers for the return value concern
  raised by Sashiko and it would be a much bigger change because it
  involves mt7915 and mt7996.
Changes in v3:
- no change
- Link to v2: https://lore.kernel.org/r/20260711112128.971-1-hujy652@gmail.com
Changes in v2:
- Address warm reset concern raised by AI review.
- Return value concern is skipped until further comment from reviewers.
- Added a comment to explain this special case.
- Link to v1: https://lore.kernel.org/r/20260630144831.1109-1-hujy652@gmail.com
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3f0be70c3f14..3800e602d3c4 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2339,6 +2339,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
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


