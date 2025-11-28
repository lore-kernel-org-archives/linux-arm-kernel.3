Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AB4D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lSM32csH2X23xXw6xgAstXFSe1ZcOlrmsYctqKwHp88=; b=xH+y0Xlf/Ri7xL5t1CTQTR9Hh7
	B/pibuhdSiwd8aSpejmheXmrXVsuqfUGdUDhBN7YU6rRBraCHnwVtsHwBPpnaiosRrdfCGe4rWuMA
	XwE1/htWv7vR3+aEGrP5wPbExcmyx4WiNw3TjjQoxqtakbwkCR9BSHQ7cN9QI9u51pd3333oC62wJ
	y0iZnjRU1781fsRmKblbNcROD2a8JvDhshy2c6CxmcyMOnKHueZnUMiGBuuaYbSS1eBO23MVP/Mtl
	R5ODGZBXs/zaywhFGdgdhzu4Ce85ssXTgswv8ChWzR0WeB5kslQ8fMhddaHQy7yfJCwIu9oERN+p1
	LXZjP66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2XB-00000000kBX-1atv;
	Fri, 28 Nov 2025 17:45:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2X8-00000000kAl-2hZ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:45:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so23639015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764351924; x=1764956724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lSM32csH2X23xXw6xgAstXFSe1ZcOlrmsYctqKwHp88=;
        b=ht0ZTrKAlFvkMp20Vvb0D0JI8IEp5mjQtLC7VHsLgrgneiAdDOY9NN8eUBXhq10Gmo
         IaOaK0q12P60Art1rdmMBIqtV1p0UOTOTGs+nO3nlguV5LESTDTPaiOPhHQu2WnJ5pB0
         EPQQc8yHQS+DjEyE6xG+p2v51xJvT5uI3Bceg0KaEuM6UNacRZTbnO2ZrWem5eJsCawV
         eaOgsrbLq+6Bo66W7HPiziBAIWp+73cYFpX/gNc2azY/CGAo1mGVOtazYOLgB3ln6t0K
         BbVAUQgvekexOZ9ZovpVZsEtYCFf+C9lu5Mrkuz6WYgYO8u9tHAv9TXMnOCggJNZDZHH
         LbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764351924; x=1764956724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSM32csH2X23xXw6xgAstXFSe1ZcOlrmsYctqKwHp88=;
        b=ZqLKLGDVyUu/qhPCTmbhPp6HVffalB3ECrV1V87QEPEsCliqnHQXWy9A3ZITnWa9zD
         67t9mxwI/X6rsk2SxTQfr4ux9CXOzMg76panJMDTz2fChMPwf+jt4HTS/TuL35ecevOQ
         WJvSDhos/TJpK32+pMDcLg/BlEpANddSME1OFQR2R1+OcoaXRu9m+4jSUokpQrDnEshe
         fsUc/piz7wpyGkst3gjkT4BiYRFmgqv095VL+VTpy50b5iKATuWJe5VyFu39wFWHdIZG
         1lT7gbHN4JhjvDDBKdzLwl6jfQkYOeZxOR8D5G3nku6WJCUzMZtctHjb0dK+H47iTbQC
         SeNw==
X-Forwarded-Encrypted: i=1; AJvYcCVsU1FqQtN6fP3Zxbrap8K9EgU+ZBQLnuspVsSI71KZM3+bLpjKgq3KniEFufkoPfoqIWbiv3U41MeM0oi0spKr@lists.infradead.org
X-Gm-Message-State: AOJu0YxzGAa0cagnQr9rDjNF4lLfUGFQx/u2rTK/hhXWLEi3NQhDVTkF
	gIRvuLKrXy1tiKiOLIZpDUdfR79vQLPdu1n/K4huMi3IyiWpCtImjeLC
X-Gm-Gg: ASbGncssuEH+sr1ENIfudjSr3qr65uCZS5gCLfcl9e57OO+Zg3yGDk9EWgO67u7/4Pa
	ok/v36moEVG1TZwPFt6E0ULVH5A3xcsjct/3W1lKKSwHaBuuQwbb2CSEfUxUJqp8gyuHJoNtWoD
	sRQ6zl92se66gpKoBdtMx47ldOap34cXF2cj6fJMai8Ujr1yC0lS0E/fIbIIVHvzbezIBjZxx1T
	CP9AVCfkNELRdlWkU+1OkjsN6x1qxcdrBf4asJ8NZXbXCadDkhvdFJ9ffDEb6x3qtSWjrSlir5R
	gZdLD4dypDBDG68XP6Aj34g60gORy/wCw95tZOH+Yy28Qm/GKxZikCqFxs+AGKuP/FHNEEuDnha
	SKgHeD4RFfX+e3S33bb6Tqz+8aSQ7JqAWas8vMV/BOWCJLczmj1cc4JhXDfLzhbEY1L2tX5Qppg
	/38f+kX4DVYwywnqh9SRfz
X-Google-Smtp-Source: AGHT+IGr8jf1cEOxcEb6EeKeJchwsXTCgWnn9x2mUsKIoWiq9E4Ha2G7avXXtjB+xtyEdcahgOM1nA==
X-Received: by 2002:a05:600c:46d2:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-47904b1afcemr162142095e9.21.1764351924189;
        Fri, 28 Nov 2025 09:45:24 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5c3c8csm13452898f8f.2.2025.11.28.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:45:23 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: mt7996: Fix spelling mistake "retriving" -> "retrieving"
Date: Fri, 28 Nov 2025 17:44:30 +0000
Message-ID: <20251128174430.318838-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_094526_702222_A967E6B6 
X-CRM114-Status: UNSURE (   9.73  )
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

There are a handful of spelling mistakes in various warning messages.
Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index 29bb735da4cb..1422533e59c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -120,7 +120,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring0 addr\n");
+			 "failed retrieving NPU wlan rx ring0 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND0].regs->desc_base);
@@ -129,7 +129,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring1 addr\n");
+			 "failed retrieving NPU wlan rx ring1 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND1].regs->desc_base);
@@ -138,7 +138,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rxdmad_c ring addr\n");
+			 "failed retrieving NPU wlan rxdmad_c ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_RXDMAD_C].regs->desc_base);
@@ -159,7 +159,7 @@ static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 				       &val, GFP_KERNEL);
 		if (err) {
 			dev_warn(dev->mt76.dev,
-				 "failed retriving NPU wlan tx ring addr\n");
+				 "failed retrieving NPU wlan tx ring addr\n");
 			return err;
 		}
 		writel(val, &dev->mt76.phys[i]->q_tx[0]->regs->desc_base);
-- 
2.51.0


