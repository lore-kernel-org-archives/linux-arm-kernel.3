Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBF6C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CxrX6ndLjkzVoOvx8ReLw2F27C6sP51HDWvrcv3raA=; b=4EbpP6mbfrgUnWLXeL1CWAM2ny
	s7QM7QmZm+2SJ54guftRzZNJdd9XDTJNa64bbUhs8ntGs/OQz0Jw/Uznqjzb9HyOOAessEYngSgKp
	BEiuRf1fCYtTLDxpjdsaEbX/JEpvO+ZmN9yvYHdp2M3NG6bo2SiT71J/9DAgpMQwg9V06oYBJ14RP
	4WbcPMiKIRYR512Y4JTbKTkviVt4UL42k3coKIqjJAmdEZ3wIOGb5ndtEeryxGbcvq3uy5oke6zx6
	XG+xnjCcJ6dap+cLMlBRuPNXS0FdBrpcVxQKME0dfmTyC6h8m4z0p1H3IJ9VnB2At1ACfHXbWF0yd
	N6aWNn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJaK-0000000Gw5l-43sJ;
	Fri, 24 Jul 2026 17:21:20 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJaE-0000000Gw34-3PKQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 17:21:16 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso665926a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784913674; x=1785518474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CxrX6ndLjkzVoOvx8ReLw2F27C6sP51HDWvrcv3raA=;
        b=ZdxhmTpw8VkSqOfdN4ml1IEL1xAXoKFaGX4QpfdfVYkQ7n5xrlQ9QXZMF1jw0KWypR
         En6ZMpJcjsrWTjZG5o/2hvnrSF2vAOhTQq4Jdo98QkcTjOLFh4QoabJQvI7/HiXsa36Z
         KFCfzMEyaqtekLlflPsob6CZi03D6i3Nm8RK45uR6GuqdMgM6KhcscBoY9byJhb6Q3Wv
         u41O6UkArjzuM+TcXpNxErMGupNtKlpfiWFumk/WXkBaorMBFzCSauuP5PMgJEwXj1H2
         wE/3O2ktzXu21afqtKsdqXZ82luBdSNMluoZtwVLJiBEZHIIH1m7uwLY8AIdqimpkTur
         BVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913674; x=1785518474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8CxrX6ndLjkzVoOvx8ReLw2F27C6sP51HDWvrcv3raA=;
        b=Hse4ul/PuqJZBd3p9mLFgFtuOMorKuC+oD/d+QYjCxiOVH1OrA/wOd2FPDmIl4zx78
         qOP0Dd1ND8+TsQ1n3wcRgczzttD2RiKRWXkGYJ/RlL33Xi0kWwIF/G/gQVYLVOpGrdOM
         x9OfXmHEQ9rWUXKBHLArV7NKaZNXPv8WoC9KhNPWDVQ4Yjm3INE78uRRciOywhFIy8a6
         HIw8adEZ84cKK+Rn3KcY6S6rr/FWBPvLpMjWzZ4ONJOaVdDtMaAF5mcBEMVcWMFafl7v
         2+1HuMG/E3uhm1z8pUm+8wmAq6Lad/CSD8/HK3XxLIG8hurU5lapyfhZnlvn1bLi8AtV
         8z5g==
X-Forwarded-Encrypted: i=1; AHgh+RoRa5cmRdBmjT+C5aFe5mlymsbMgDpGBUyNPARx5nw+xcXeThbFus0mBX3qhielXV46ahfvKDk1yKjYhaiFnAse@lists.infradead.org
X-Gm-Message-State: AOJu0YxbNe8yRjAmwcDD+/4DNZsN5e5cFmvmjYzYZiToNoeRwxtyyjGY
	df8eTXZbRZqMWLcCcorh2kdYt/YpQZYnvxH8UH2kalAgZVjjTIMWBd6b
X-Gm-Gg: AR+sD10Hak2fcoBzeM1lsy0PQubafNLLVnZdLqpg4slK/vJDFeNUxtzS1PPci1o4tWh
	9Ky1jfvzS7jW6thHuNLH6M9dgOFw9Hkk5ih8h9tR/rpzzpPIMB4EbsFp9gB950Q/bm4GrBtjkcz
	+QK3tb3RlccPeT9D7JZJiphT/7LM/ueVGFrk0fx1cgSaUHR9r+DwRLRTjpc/Zl1clv7UEgvdZ8N
	Y/TtdbOy6rmUsRcCENlBCfgpT6KlfnFJXjfViu94eiOqVIsZwnhclOK8jZQ/YbfLBYM6ZJkLxET
	lLZl3ifVrCw8qyG7uNd5720oBWALWFJ+tC/bBEJUwupexRwH9Su8+G6vzazNAtoF+L7RgwJDk9a
	tbf1B5HwiaOa1XIPyGYeAm1u/oGdXCl9Gqil7qLGFMx+Hgco17Atj293iLQIybIIXR3y+nSiKao
	ahBeodTuaHaZ+2x2NjFlcHZ+M6RZAzvgpzN/fHiKopi6I=
X-Received: by 2002:a17:90b:55c7:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-38f1f9406damr954371a91.2.1784913673756;
        Fri, 24 Jul 2026 10:21:13 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041d5f78sm1789907a91.17.2026.07.24.10.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:21:13 -0700 (PDT)
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
Subject: [PATCH net v3 2/2] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Sat, 25 Jul 2026 01:20:40 +0800
Message-ID: <20260724172040.1653-2-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724172040.1653-1-hujy652@gmail.com>
References: <20260724172040.1653-1-hujy652@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_102114_852439_E2624B14 
X-CRM114-Status: GOOD (  13.48  )
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
index 7d2775a97fa0..b48abad995d7 100644
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


