Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3C6CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 01:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oXHtsnBY1AjSAv+HlUFo/FYDsuTcP65qwKVLI9BrKvM=; b=HWPFBPW7gPF1N4B+5rOjH0e4q2
	porZlUvDEDSKvEAXX/vHa+QI1ynZC/ZplXdMf/TS2jBUNjs3baurlweyUqG2/blHMn053ZiQB4Y/r
	Df+T3GmtdfxCRdBv/bWB5oZ3LVP4Iwr9kvY86POHzXuw0hf5B3m+Y5yLp3dJ4yJ182LWHrxSaxZ4d
	JqKuJ/x43ohveCUrgbi63FJ9755PYnZfWPcqa9+a6/pmSxa2qCv9pfRbx8YY2wQws5+pV32fMUds9
	qZidyjQZL9oRUl2pbOnsFyrJYvt4yYBx47gv84GdMFacP7yxKBeqDlzZy8rgAjPpJ3KR6on0jPfzK
	YjmIMLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8st-0000000HJnA-0OGN;
	Tue, 19 May 2026 01:04:35 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8sq-0000000HJmL-1NOP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 01:04:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36974221f93so1341626a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 18:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152671; x=1779757471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXHtsnBY1AjSAv+HlUFo/FYDsuTcP65qwKVLI9BrKvM=;
        b=X0ceMouUvIFgcqs68Exy9vY25ThTUd4MExwKsbj3R4WrseTAI1iNPBeU3Dqo9dJJGk
         1YeV11RA2F6c8fhhO3Z4gXIWIsJf61J7DQQx70omTn7lr44Q4W3diRs5Dqiybs7yx/vv
         a+5VP9EfF9f45JEdZ/CsPVgm+wfO74hsgHMQaHHKmF2/KH/tRdvR7C+yVNLfgNVfFota
         w8o7jFB7eyxxjWI+ajjJ/XHUx/2DPirEh2m2cwx2F4G5BsgRz/erzfSlVsPyUCUKq9Oj
         8LsFbo5Jr+O/QFO9+vpfju/5VUn6JzEeLSCd3TZYQM0q/mApI9Ih4hu+FMrSvlnhrQjI
         M9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152671; x=1779757471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXHtsnBY1AjSAv+HlUFo/FYDsuTcP65qwKVLI9BrKvM=;
        b=kreEHJPpgDjYPLsLGUizhxDfBB2DHUXuQ/0ZSAIScAcAll+bSBFp240h/Dd9W8SQ3w
         mAtF091m6byUxnH5HK27MvXbeYaiNCU3vVmiayaYgdqggcrjX0eAQvuM8/XRwtJ4sXgd
         DH4+dDKmcog247htSxA9MOqDQ6Y68ODgslFnRHBdSmPK+bHdCywJPlvjukmw7vp6DADD
         TCzMI5x+pRRnam2xQsDgKmXs9PMzw6WAeBISvdlsEzO+j5FC2fwDTjQ9I5hAM8YXNHXV
         MWtl5AHB39cDnxqZDZREn04HxpalMhloimL3Wf0iZJ+9tGlLVCSTDy8HuvkjdewjOpYg
         EtaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8b2BkI9PbJrmXMxZi2h9ySWwUmIIfzV+IT3EQeOG2GTzvAR04Ld8JmpRvX8PfcA0ka6a5S+0ZRWw4ljz+cmfXP@lists.infradead.org
X-Gm-Message-State: AOJu0YxnG4TavwlMosm9TebXBJLPaGGBs52SCCCNjQ1/6DPKqIX4w8WS
	87aW8JS/yLzZqiD67t3NtJpwAcPcbn56AZ0XlzVR0/ZGiuGc0YBzPIMwd+j9CIPW
X-Gm-Gg: Acq92OFpGud9ERcxUQInPBB85p3WuDT/fIBIPkCqwRZSKg6C47IZfVB1MbUTVkLXZDr
	SiFQzLlY2Rv5UTnYrNS2Pd/1TqZ89Ci9zbnvoIWVoLvVnw4R7XQNIAV/r+ICcZqXYxnuaFMBG0r
	dVnGe47VIQPxzMnrMAkkGwHe4ohW307FPAjcOxCwKy+DyfzNrQxZaCNSEWbO0r+ZtQRJY14Ek8q
	jrO6IxjkrPOcsSwWHtD82igqibbopLJGypD79FKYu1T/RwvlsBDFi+7krPMIdbhTgvGp4FY3KJd
	SGrzDix3KdpU+5LpjJ6JGyJGeQVGkfLR177KwNQdBess8lpAxUtZrLxBG7fjgBP1YUyPe/4RVQb
	t8YHCmKFYAgNMI3wQzULKKl1pnAmbsLCPO8uRlxOyeYRyBqZS4s3pZ4E1e4LS2ahBF5+e2T0Zj8
	Xf/2NrdA/T8xJwca8efAp+xEC8w6oVCO9osC3nRSGrrG3siRcb+Wm02elsWAnfWULfCopuLyiWg
	G2+41di7p35Q01sP94Kbe+VZlPP/gOWisyk3kuwT7e9fQ==
X-Received: by 2002:a17:90b:4a:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-369519feb17mr16805439a91.7.1779152671266;
        Mon, 18 May 2026 18:04:31 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951278e7fsm12177196a91.8.2026.05.18.18.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:04:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] ASoC: mediatek: mt2701: allocate i2s_path with priv
Date: Mon, 18 May 2026 18:04:13 -0700
Message-ID: <20260519010413.629214-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_180432_373098_BE9F645F 
X-CRM114-Status: GOOD (  14.98  )
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

Use a flexible array member to combine allocations.

Clean up surrounding code and allocate based on afe_priv and not
platform_priv which is a void pointer. struct_size needs a properly
typed pointer to work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-common.h |  2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 21 ++++++++-----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-common.h b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
index 8b6f3a200048..c9477bc24ee9 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-common.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
@@ -89,7 +89,6 @@ struct mt2701_soc_variants {
 };
 
 struct mt2701_afe_private {
-	struct mt2701_i2s_path *i2s_path;
 	struct clk *base_ck[MT2701_BASE_CLK_NUM];
 	struct clk *mrgif_ck;
 	struct clk *hadds2pll_ck;
@@ -99,6 +98,7 @@ struct mt2701_afe_private {
 	bool mrg_enable[MTK_STREAM_NUM];
 
 	const struct mt2701_soc_variants *soc;
+	struct mt2701_i2s_path i2s_path[];
 };
 
 #endif
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index bb459faa6e05..d56b498e8c0c 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1593,6 +1593,7 @@ static int mt2701_afe_runtime_resume(struct device *dev)
 
 static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 {
+	const struct mt2701_soc_variants *soc;
 	struct mtk_base_afe *afe;
 	struct mt2701_afe_private *afe_priv;
 	struct device *dev;
@@ -1602,23 +1603,19 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (!afe)
 		return -ENOMEM;
 
-	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
-					  GFP_KERNEL);
-	if (!afe->platform_priv)
+	soc = of_device_get_match_data(&pdev->dev);
+	afe_priv = devm_kzalloc(&pdev->dev,
+			struct_size(afe_priv, i2s_path, soc->i2s_num),
+			GFP_KERNEL);
+	if (!afe_priv)
 		return -ENOMEM;
 
-	afe_priv = afe->platform_priv;
-	afe_priv->soc = of_device_get_match_data(&pdev->dev);
+	afe_priv->soc = soc;
+
+	afe->platform_priv = afe_priv;
 	afe->dev = &pdev->dev;
 	dev = afe->dev;
 
-	afe_priv->i2s_path = devm_kcalloc(dev,
-					  afe_priv->soc->i2s_num,
-					  sizeof(struct mt2701_i2s_path),
-					  GFP_KERNEL);
-	if (!afe_priv->i2s_path)
-		return -ENOMEM;
-
 	irq_id = platform_get_irq_byname(pdev, "asys");
 	if (irq_id < 0)
 		return irq_id;
-- 
2.54.0


