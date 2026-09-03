Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD06C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=; b=WoRZ7vmQ3ala9shuvIorqxyJfb
	P15/gBzoGkzOziUenru2DTVL0qj6+Z+iebNQVPFN0fs3ldYCcwdoUw6WzWmbnWfTwJlnuo4N6Dl3D
	Iv1xfCWqkeEqTSz7ZyzcekJGtDxrOW/MM0W3Rl9dl2RiGWWmT11zb8faYZYrHvxdP0jJdbQSYNNTJ
	rNt7AEVY4E6d2KALvYO/ii5dEqxINKR/iKxdKYCZqNu9zfE7qCfCp4GSljr26SYD++jO2zXdTH7lg
	1oKrklDApkUCQlqLEiuXibs2fLjNhBx8p4oFPZtYUwp9urOmEm45kcDcxoSeb57OOv25xMBpRcgdJ
	ATUYrTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29bo-000000002Vt-1HzQ;
	Thu, 03 Sep 2026 15:44:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29bm-000000002Uz-2FJX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:44:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so127705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788450249; x=1789055049; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=;
        b=XKWL+v2ZLcGw9LVPNA1/VY7DrFZYj1L4DPGJTDOpW4iPj8xj3BYYfDl40db5crIl+l
         kD8Wb2Kj1wgeUnEd/lx2TFhKPZnFOyIrS1fcL+FQp0ILzUT8rBeos2P1zjp65z29uN7B
         GMdin6/YZsUEIW5yazDA71ZXv8hhLBtcE8UNbXoC6PJN7ita+iEyJT/7bH20Zq9ZwIVD
         /mCOfjCfZv9ZWA94xQgQAAhaKuvsXKTX8m3ZeCVMc8oCP3QMvU7s4jRITZi9VEUKp/yc
         ic/gm++UDpfla/CYgLnFwVrSBoiG53oVW/6fHQYfZjBxY0azApJCLOMJYhZZhoqAvcZ+
         B09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450249; x=1789055049;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=;
        b=L0PfXpjQTi8lT32/GlKaL58Phles+wPzWnE1RgrfFrWLTiG8gM7Hu2qL0USa71dSOe
         tZyT7mFe+yqSRY+L3Qf7dPxOPqJ91x2AtDzaAiVLZOfHn9gC9Z2ZJJjZjWwm0AD47BGL
         P2AbGZgi/wh17VFPaXt6gYL/gL4zj9nNes6LipAcfQmYdN/TrZLtSfwvUfGkba0ZuLxy
         M5npQz/Z05LH4XhnTnIxQf2iPbZ2/5Vf4INra9ywhRMrbVhnRZoOZBM1LiTDmIL4J6g7
         8WQB9gssKXLWWggQaR4tkR3nP1yT9XZgbBQCNjlyY2w5AD+lh+jMXTRDWGJf0v1tDWr8
         OLsA==
X-Forwarded-Encrypted: i=1; AKwUvBwSDGJZ3oxqYi0PZOWUtP/3RmOQ9rfSTgNd+goYgCaRRiETCFNKsI30i7VxP+YEYP/+GAzpT5Ri/MBz19MK++yl@lists.infradead.org
X-Gm-Message-State: AFuF++lRIlx7NiPlxHKM1Bl5cG6mVVCR91Dza+LFBj8vnl5kiVv4qZOV
	mOhAGFI7rz5bE+nzmdhXEwJOjQPe6qmpun5a5bA2HNKx5ugmjooBMFrn
X-Gm-Gg: AYBFou29F1ioQ3Z3idFeEn8okAduzJg8wkLHHEm6BvtLDIa+6e+ngzxZ5XfB5qZizxr
	w4O1FiTOCndc23H0MbVaSwmZpsCM2aHzr41uslpBVyp5n7KXGrn0Pxb2ghbBCkVsWV1QQEACron
	eoazKYLGJe3shbFNF0727e+++iVTyRn1gE6Qe8SzTNtNZNyfYWu7PbsFxSjLVzEyMUyUavciUNR
	FDhZA6pm7eZa8nSv/3amazPkHT4bQXSgOkp3hKS+k9LteNcUbf1k03TjiICqoDkeW5Mz+pUXuYA
	ZVjUiXENTMJdRWAr0fbZbl2swrj5u67PLVL1nj0dIpbdc9BxNSfPIIwj0tyCsytsABUKnXBf8Ex
	No9AWejnp6QcZw/X1GHevwC4/k2/nBmoTo6cBbL9ii5DD6l9ZsYkLBAdt6PtnxyS5nERINunjTF
	cPTVYVENpPfZ7T8F1WSdxnWVsFPB0rZOJ7+Agj6+b5VNfxi1YMME7Acd+pU8Q=
X-Received: by 2002:a05:600c:6c4a:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49cf5baafc7mr14910805e9.6.1788450248541;
        Thu, 03 Sep 2026 08:44:08 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47b9817sm121063135e9.1.2026.09.03.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:44:07 -0700 (PDT)
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
Date: Thu,  3 Sep 2026 16:42:04 +0100
Message-ID: <20260903154204.20872-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_084410_590354_119FE78A 
X-CRM114-Status: GOOD (  10.39  )
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

There are multiple spelling mistakes in dev_warn messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index b8006b8729a1..3fb9f39c2f61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -283,7 +283,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring0 addr\n");
+			 "failed retrieving NPU wlan rx ring0 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND0].regs->desc_base);
@@ -292,7 +292,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring2 addr\n");
+			 "failed retrieving NPU wlan rx ring2 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND2].regs->desc_base);
@@ -302,7 +302,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND0].regs->desc_base);
@@ -311,7 +311,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND1].regs->desc_base);
@@ -320,7 +320,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND2].regs->desc_base);
@@ -330,7 +330,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan ind_cmd ring addr\n");
+			 "failed retrieving NPU wlan ind_cmd ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_IND].regs->desc_base);
-- 
2.55.0


