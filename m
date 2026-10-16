Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87998CCA48B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/o83MrjUD3Eacil49PDH6LIS7qqkykZOJ1j61n2I+M=; b=rthwBXNfmebVq5mJDJegQojh1m
	6rNPA0KCMBpvLlnBqQpMpFIPDVYFtEb6mIcx4x5IzqTZnM2wQldnKQIl7EKw1/14m1MSt7kSUiiUn
	2mipTfCdweBB2Tv/1uIrFv2AyTeK2B4CF1ONpkI/GMrA8tK19QgBj/3ZddCs0jVQG5gm8SuFU/BFk
	i/qokD5KGm+xRj7TwIhYXds1tWn3Am4ELpCeXIYu9tgwLif6vTcN3WnZqJnCJEx4+/whLWG9A0P22
	IXvUPvp7pNslaLgbzQUc3MhlzbwFZJfYutOkbk8r2hFW6m/x/Phr5z8DOatl2XPnJhk3+kSzitLx5
	QPnlyPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe01-00000002RUJ-1qUI;
	Fri, 16 Oct 2026 09:13:13 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzz-00000002RR5-0qDI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3421779a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141990; x=1792746790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/o83MrjUD3Eacil49PDH6LIS7qqkykZOJ1j61n2I+M=;
        b=Zs+67r+ysgtdQcrZIDlU8VXXju/u9CqmGXROSAR82irMQ9wOCnRzxrhBNNgTaf0UMI
         afQ5/8ipVQRtgYNB6kacNUcWUEqXofpHTTnXTbfjnClfXR21xYJ4SkdwnQf1Aq9eo4+Y
         3KrV5kRdmc++KQhr3I+h3wjyihFKpSrUN/TbyE23GHPdQdMnoNZWf33iBJ1QbI5cW/av
         WKZfQKjXfFQOv3T+9Sf5qrmdXFoGmmcuSwXuF5H/fH7tZEQ5Yjur2+6F19NshJ/TrqU3
         H4z/6UfRS+LSKk9AFqUiJPkUGZCIQy0dM+D6fjeinDzxA8KVlF6DdhAH6sZGG78KFS2z
         s5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141990; x=1792746790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/o83MrjUD3Eacil49PDH6LIS7qqkykZOJ1j61n2I+M=;
        b=UT5UiZsBIOqLTwGiKJYtUbcCKWwAlMKhj4PX6Bu05wgyzXa0rKXSxuCPy9IPG2qXdt
         Sut1Md1Fg5fkBUkrWNc8vQc10Cvcd9itbS1ZE/QhuRW0QC63WQp2ZFA2APx61PmvEolZ
         IWAtUFi10NQqNJX2sxQlFtHVy7ucs+hMBXYVnYEzXWl+TKvMib4KPEVeD4p43RYfxAE/
         Bh/hhdsCM7lyEt9g1xy5Tz+0MUauSpIWbX5EGcgfnP3lfdUKlvOwogaTGMjrKY13V7Gl
         fj2S2N/CrUEKqjKCm2c/Pk4Y+nlwRUng1o5/zA+RLsRTHAQkBwjT209wgp4vG1A1UeKn
         QOcQ==
X-Forwarded-Encrypted: i=1; AKwUvByzXaaudggKHzo8el76iHotUum8QByjhc4yeTn9IqFD1epCJ12eXcSqfmbOJkU/AuAf9AM0IwfPTXt83Sd5UNbt@lists.infradead.org
X-Gm-Message-State: AFq9FYJPYnYTVB996YVmhEJY4YX0XQycULwRA1HcBABBj3iiETU83V6u
	m/0qeqiTjS53Uve0qcenJVRTt5TVwqzIYO1KAWTUUCcR0Sbxnv8xwmJo
X-Gm-Gg: AYBFou017BGxH7HBO8BCgpzlKBSs3pUtIHEPwIBKsBWULlEAQ9V4GwMesgGOVaom24X
	8Vch/a78xrF6HxyAPa1TFvIeg55AXU5VMArj0pEupmSceab5R6XILyPeLgx0yB4DETAgqgBM+op
	l1v57Gtdr5qMPMDOdjTx2gWbY6P4xU8nnzYU4u7itAx2CiORD+g0CzBSJLd0getDecYBVuQ/Idi
	Ja86dAprcnAwTnvrCSEOcSyyYj/sjlhvtkRAzwWob+V1rriZ7k/Xjsn3AbbnsS6wPWTANY/XgWx
	cOW90QGhYz/LAOiQ7NlGcIzfvRMy6m3L4TPpsOEwhlX7RlTDH004XQHvdR6PtDtAqqR/DAK532a
	m5C1gNsvxaFLeBOPjg0i2ArQ9YMvBiUsK6FaYd0D240zAcU0ZjIMSvk/Eqw09Zmu1z3wd53q4WK
	fc7XN1b4gL0BEP3Bs/ew/GDWzTwm4G+Optz6oy8i+4AS2uDcd4GSPedvmawp7s99yKK1cH/PT5O
	7snpRcvh0qQog1/m0I8G8qpS6rYCpsFTwPYGRBMAH1nQtHxjA==
X-Received: by 2002:a17:90b:4d88:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3ab3a952849mr18771119a91.12.1792141990180;
        Fri, 16 Oct 2026 02:13:10 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:09 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:36 +0800
Subject: [PATCH net v5 4/5] net: ethernet: mtk_wed: setup WDMA_RING_TX(0)
 for non-DBDC MT7986
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-4-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141974; l=1493;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=rUJYQSuI+MzYXfpzfZnBP1kIyuFVh0MGSn+0u0Ma/Pk=;
 b=L0as7tLnYzXS+Bqtr1fz9FPvuHKDSa9tmnSYahzb18gVgM0Oe4uBm+MqAIXLmIL6GfYKXrcr0
 5E3tQHHvbQZC3w3g8mnFEM6uuaJT56L7ZPMaub/Q74s526GTmqiIVyJ
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_021311_247872_BE2595EA 
X-CRM114-Status: GOOD (  12.81  )
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
 drivers/net/ethernet/mediatek/mtk_wed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index b8264435acbe..3a7c2bb33691 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2355,6 +2355,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
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


