Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF92C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OTgp6kjWgEDWWxpibus58Be09s4GYwLwxPakbsp/HLQ=; b=xNn2CwGPSbvk26r/HUblQ1HXLH
	7QEfA05OR9J3c479elvtLUzUbQacHdev7E92g/UDNCzUJCzyPadoqZux75hxq6HdhpCLWpeuRs5lL
	NZ3nXYtBQ/ahTOXhhjkv8HevRG9b/AvFC8Z3Wy/Xk7LZ9Bj7BpTnzNT8PfldYaJx/b4zH2KXgJ2lc
	OtCkSi8Cyfu+WBy6rsOyKj3EbMS6Rr3iXvm81WnqJYRs+/JCmBgqGryWhgQeYXGYRiPmJSaoQfl8W
	UYTr85U8pXbWySxfLtAN2i3X7tKDB3TulT/aH/DHSnql48UxYr6F5uZwXalq17YEdTDtvITEkFv2I
	yHJQU+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJaD-0000000Gw2Y-2m4m;
	Fri, 24 Jul 2026 17:21:13 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJaA-0000000Gw1j-3he1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 17:21:12 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so660539a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784913669; x=1785518469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTgp6kjWgEDWWxpibus58Be09s4GYwLwxPakbsp/HLQ=;
        b=aL1OVAx5mQDV7IoUb1TB+Gmy/Xnq5Eg8qVNXXb3oIQq868UGC9uU/XUgsv6I8TO753
         7clCZByOKXIQXMxukX4fsWYtrxfK6FcQrjiZbfuv3FTMAbmV+XsKVvn0zsOvZANWtNdl
         7bfhwJsyn8U+HWVotavi3agiDC64F4r84ag7mWzgL2y2ZVhcBuKl+OPfivjmcWHy2ZrX
         gxtTMhLOi05+xFPJmYZnXEq+EYN4fke2Na0uNB9dJqlhs6cR1dXuGKpdgHiQEMnWQKvg
         tOeDmv/oQwFlAVq+hx5ruw6BLcsHNsTeBZYz/Bj8QrwERzkgjbw3lP4PL4QARrU/X3CB
         kLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913669; x=1785518469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTgp6kjWgEDWWxpibus58Be09s4GYwLwxPakbsp/HLQ=;
        b=lnNbgO5u+4ZJjAqrEGHdU/fthATESrbpUS6zWsghPfJvedXzw+7spkL2xLVIeZnsD7
         IaRJSv22DAMqm/iIsTnJKl4Wmi0hkKOJjxrUXx5Ez6MdSHxpOqjycQmUmDKnPZ4GqxSG
         CCQcMrCBBUqvCUCHJCGhEiKO4Kaif2qCGjOVQPaFL8/OUMTUDT3oztKwZyNK0es/wJxs
         T2vbx9tnS1FQviZNFNh/h47A/xeD1BmrO4ZwU0d9IcCliy96ywfSz/GofXvA1TtK0Ega
         TOV6Kb6MOc5B9nOLfGTFpUJhivYfg0IAUxD/mB8/Vt5JziX7QlcG8cnv/qWj/g+UB+Mj
         h9SA==
X-Forwarded-Encrypted: i=1; AHgh+RoVkp1y48YAMqcsTVGQDGriczaN1lsNHnYF4CRNwAqOszHu/c2ljx9okahnK3xpdDN4gxzL0gF2WpbrlDfLk7rw@lists.infradead.org
X-Gm-Message-State: AOJu0YxpCosB40qbMluGpoy3ItaK/GViNrTyJuvUbi8rBb9AzfFJo9Dy
	jA1QAwnj/oEtXdxisWlG0BjtcxZYiPHj2ZQHBGWOhqEjrRT1gAwV4QR/
X-Gm-Gg: AR+sD12bp9PhqjugYKiWM0sYX6ecCaxssMw5a3zRa5b30QTJM24UJQ9AecRLixkRdAt
	IkzE0BTcmJMxZauYca6veeoOqjG/14AKiSOe1m9pC04046edhMMMsmXjqcAWkjeAMjbhvGtUNeT
	Nv/JmBPkpXgpAnD7zJNCgs0yvjwO8oc83gRs1fft2Yytd5oH0SBhYmuI5bhaV0Rs5i5G8x6OVKu
	phV2XrzM2CBtZlz/7ZVutHE+J/upL4SmlaLdtfr2e2LdrxRhpVHMK/R/pS7KKzanjFfzMtAew6w
	/X/pAouiP2aUHSrGRZ0MV9UgQeaYF1kyQnWcuYXkk9z7LmVBRk2ixU75YBHz7FgOqaZ4UC/2v8k
	52Nn9WsDyBGn2d+2VAKVGQP9Rxa9qh5VeLFGeKOy6lzm1JpXyqswYF6ah0GsLC43jxCfoan/x/X
	MaDY+QzctlofgGvrDNYjtcZMuD2JPYaHw+u+6plDdkTUE=
X-Received: by 2002:a17:90b:4c:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-38ec69a9a7amr8004002a91.19.1784913669362;
        Fri, 24 Jul 2026 10:21:09 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041d5f78sm1789907a91.17.2026.07.24.10.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:21:08 -0700 (PDT)
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
Subject: [PATCH net v3 1/2] net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
Date: Sat, 25 Jul 2026 01:20:39 +0800
Message-ID: <20260724172040.1653-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_102110_922349_C174DE4C 
X-CRM114-Status: GOOD (  12.25  )
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

Currently WED v3 tx wdma ring, ring reset happens in a separate code
block unconditionally.

Moreover, v3 has double the size of wdma_desc and has different init
values. mtk_wed_ring_reset doens't deal with that and would corrupt the
wdma_desc.

Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
WED v3.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v3:
- new patch addressing WED v3 ring reset issue raised by Sashiko
- Link to the review: https://lore.kernel.org/netdev/20260630144831.1109-1-hujy652@gmail.com/
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 10d9beaae372..7d2775a97fa0 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
 
-	if (reset)
+	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
 		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
 
 	if (!idx)  {
-- 
2.47.3


