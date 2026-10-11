Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D19FCA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXZ1UsR/jsdDknoGUcyYR4VW8gmQlVsH7nZcsEdE/Yo=; b=WyjJd+RSjxrDAzQWQDcCrdvJNo
	pEMcFTbQX5w7DANAdN34MRTNTxuDdIb0UPB6NgByHx//1DfKj87HYTNwyBmkAntwH72R4O/v3+gZC
	kmiULOz949p1Rah9uqo47PvenxpD3qpxn0jGMr8EHu6ObyNWLAb77gEwdeV3LQZat3YBG9SQFd3zo
	FjpqzotIbRwNDuUtLl4Uif4mX3qagkeVhx92P0q3LqU3tCisnLwS0O1AJhJtdYv+ahs9nXZR7oDOL
	xYXQrNlHarp3rnmbw9pbbqTl878BHfMVgm8j1p/J1tnCl2wqmTAa8DKOHgcRWxqH+INanZW6ppcGe
	8TeAvCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wU-00000009SI0-3F54;
	Sun, 11 Oct 2026 22:22:54 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wO-00000009SCK-1pHf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 22:22:50 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-53582498790so17497281cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 15:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757367; x=1792362167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OXZ1UsR/jsdDknoGUcyYR4VW8gmQlVsH7nZcsEdE/Yo=;
        b=K61oPN8NSiVGjEepnUNDoNLtFPypfws/Nr62ERTZbZTcgetJ/iFK7xCHl4BdzTmou4
         w0GqWjFSztkOhzI2FKk+/EqWnPZ7OQ5buaQHTFWOHMrxAyLROOtH/ovKKBODRMiqFom7
         JYFxy6zURJyrqbnB7v3pypBlzUUFdiTXPKCjz8ah4HXpMtAAeJuQvbijmEddyP2soTzd
         Tf+Sfp9GJMvfx2dx0IrzPuB/zUePIRxubBuStj6tGS0nDcawLMyQnnoJQhx2adBNOWye
         0aelqJUQDnZdYQ1bSo8LBbUNaT9AQCKnPsd7zmaE5yjRa/zDod92m45+ghlEnO+uvV6X
         Sd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757367; x=1792362167;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXZ1UsR/jsdDknoGUcyYR4VW8gmQlVsH7nZcsEdE/Yo=;
        b=rPMjvr7DFM21sGxAfDb0R7VSV2/yTjqrGbHOv/XvfmRtT5Ivlvvo8AHymnY8+Nj72K
         HEZ1jgtQrqld15BJlOAGZCfQ3vrJZkamIek2bUMC4blt5+zFjRUPynCEZjcTmScUgeX/
         GFHjkBLwUckBm1HSlOY+WJgrLS+D6huUEHkvzM9JSd4OkCB0bMG80RkNfdc9RT5/3Djt
         qRWGdub9wAYFU4mP2OXCxBI7K14yRHsUL1TnSHcdD5qccgLDLzb9aE7MXDgvDOupMAsW
         yv38bIcRE6wU2S1mXQ+5YRhjkbKxD4Yz6rQjWCZtxfz2z1GlDzw+1srIScLeZJIreX8m
         vlzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc02rEBMgTL8n0GkN1ieERM0cIbCpy1BA7pmqT1IEUR4vZgyBSJl6WH++Np3oKxo1UchTS5D2l0guqO3AVRjAv@lists.infradead.org
X-Gm-Message-State: AFq9FYIFA2ih+G1osejqcjr1Paml2J7xr2TSElQ/agiRpZDHVzN+fxhH
	45twO7r+SnOAco/X5gh0tSrc7672WUJaNykJZnG+eSS7pAl2h6ICwjA=
X-Gm-Gg: AYBFou1TWesGcOYljRP7XuDM/LgKsJ3n3MP4vt5+9+La0M8K1f5JA74STo0GdOK/qUN
	eDjDI8e6hjtaEk/riYu6aGBKhFYVI/egDljTudmrvSsK4ThJzN2i5XmA/doxl/Yq8wOREmX5Ocv
	fAffw9TUMrgtr4RWHHKJMGbh/Mv78V5ShrXgcHsWLhaSTHq1ErgfYE34LnWHPi0L9y8HXxcl6X0
	L2uy7WDU0kbx3QDcLtqgzcCa7GSCMvXhaI3p2LX+YKY1Ec+cljn/Yr3EB3eFV4CUknXsLCbqx+m
	JpPdfAQ3h58vs86bFmSrGvkc5dvk6fFTEn4NjrtIncPceF2rV/HajmFuXNcGDRK4jsU6xNnCKix
	JVxLPEGAzqHaoHYc3GlBSGuKuzwtfj0ZByRGVG/8LKQLv6XAooKz4dnYK+1UvTVIuryhWo7kYUW
	0n9Iiq0Rsa4QHc1zjGrH2uQVA/FA8KyQHn8qfMS4Y+eudjNGK3rwlHpUxDpYhWwNbFyrgo/PJgJ
	O+PGb8ULKU+cSn7LSzVwX7LbKSgsYGxdJFNyQLlWYsvQq9/r+wOs5XX8ihHeYyJ6n9eVlOz6nlN
	7a1Ll/0Zg78XV5dcg0yEuklgDsr06c+TO5yZ5Vc=
X-Received: by 2002:a05:622a:260b:b0:533:32f3:1db9 with SMTP id d75a77b69052e-5359f46f5ccmr130647001cf.11.1791757367164;
        Sun, 11 Oct 2026 15:22:47 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
Date: Sun, 11 Oct 2026 18:22:34 -0400
Message-ID: <20261011222234.2098904-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_152248_497548_B0599438 
X-CRM114-Status: GOOD (  18.28  )
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

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before joining the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

This issue was found by static analysis.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64).

 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-common.h b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
index 4951a6f32abb..ce5d586721db 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-common.h
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
@@ -186,6 +186,7 @@ struct clk;
 struct mtk_base_afe;
 
 struct mt8196_afe_private {
+	int irq_id;
 	struct clk **clk;
 	/* dai */
 	void *dai_priv[MT8196_DAI_NUM];
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index a1ae8322d8b6..39d9103bd5e7 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2393,12 +2393,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return dev_err_probe(dev, irq_id, "no irq found");
-
-	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2453,6 +2448,14 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		goto err_pm_put;
+	}
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2482,8 +2485,11 @@ err_pm_put:
 static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8196_afe_runtime_suspend(dev);
 

