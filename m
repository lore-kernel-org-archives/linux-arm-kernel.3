Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88FCC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yn5SGXWGzU7jg3uvtllcPlKx+PMxc5UfNcEyZfO4D+0=; b=pMtVys3zR9A5mhWPHICQGNfFBV
	rYoBjTfnmzb5tSOoQHAZgO1CFIepp507cfRbz07wNzpbHLj/HBQfQtDW3mZIYjEWepphX2iyLtCeX
	y66QVtLJzgodiQGpftv8hCcn4ykpUZcVKwPe/5ueGq67UCFuXX7RtVEr1ecLY2VyoUKqyIvdobhdm
	LlhMJ0cSqw+sXUk6QKQTW0CWAblwFZMvN0os6ENjCG5sqH2d5e5pqUA43duNesm8WbbcP7CrzPR1C
	i0RkiYWDlS0zAgKblnn2ZaQyTv/simZqNaoyM/oj6FieT8LCCx2szsGenqP6VujIxXn6KZdfUm7VP
	DbPUHOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgyX-0000000Bu4p-47Z4;
	Fri, 31 Jul 2026 06:44:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgyB-0000000Bttp-0BHW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 06:43:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so699057f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 23:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480225; x=1786085025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yn5SGXWGzU7jg3uvtllcPlKx+PMxc5UfNcEyZfO4D+0=;
        b=PI6ewGxDO95c41bR4am01odurS8z+zSCfLTXVobGF6b92vnEOd0K1uKQCWTtudmOKU
         2zK+/l6hZL+eOTs1qsLV1/3UrYA1OHFratFQSJufFTd7QHgxj9IcwVeEAWlWSd7xTx89
         gscNvndInc6cU3ez9AhLE5QaEsEqqzgQlkw2dQbJvQ/pAzsPoZ8FcwavqDW0dyOIlTYy
         wS2SuWyvYGdQgEo0HXNBHwptC6jrkqh5UVYTIlzU53Q8GUVHMEX8J8v4yknNGMkbEnpV
         4rS0/GIWNWWlgadNk2pPZX33B6rLrjPKiywS/Dq0zTjuXyZU7DKN+qfu0rKkG7SvyTlq
         v7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480225; x=1786085025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yn5SGXWGzU7jg3uvtllcPlKx+PMxc5UfNcEyZfO4D+0=;
        b=ndzwT03iSyeL0WdtCJFksviVoxBoHZwukR5TGmieyWMQ61nUuPDuzw+8IEXHSP7c96
         Il6BiXOsU/xaKrUzN6MZQd82vQ7NmYYSTGENbVyBwIm6WQPXWDB1+TiqoOfxeo0Fxhsp
         he+IZfeKBtfS/juPPDU1hfwjxDo4PXu03T+/0nZGt/+Zc0pCrY+7w0o0B2jyCfIb5pGY
         uvp0m4j06em0iUuDHoOPzz3pD9uiT8MJBME7qrthH8YqdLkGf2PJZZ8iOCR3oBKxXggl
         mDDbeNILgSLANymWoGmZi07+s9t5k3G3EjM0hAwr3NAq3ZegRBPCVlcqUjqNvsKPFZmS
         c24A==
X-Forwarded-Encrypted: i=1; AHgh+Rr32AAJpa6TRpHzX61NiDJfdFEhTdcWz6HU1sDoVY8H5kIxZcKIv7w6uAgj0vaQe4ftEN7DTd75B0r5OWmnUp5w@lists.infradead.org
X-Gm-Message-State: AOJu0YzG8MUttSN2beKDo1si1Al7E42Yv52xcyIg6+PAbmARUieL/hip
	m0lIx5v5RlD1QJflOLzVVKnGGI1ieaEgAs6xgwXCM3sOmRAaMLoM78g8
X-Gm-Gg: AR+sD12ogVIjNzRWCY0oL/KW65Z4yn9AXO3FadLNl4tXsMiv/YdZRttpBkdUhHUHeaD
	06NlUAex9/PFZO/Grs74hjEp0P32QHe8p00oahJomJ3Wk1Z7t9j7L/d/TY3gsDv0h3m4bhSKljv
	0UwRd30eB1zxjTTIrwT8SktBBvZF01JNNi8BAs+/rJboZ5DqIpx+e1EjWZrDgiL7YlS88I+WfJg
	tY5oAB6VRjhA7BXW235iJYhSpXqPLhw83LzISLiEcYzzV+yd1QvUfd6TcaGbDr31KljabYYIbBM
	m+huOj41Y1ZNi01oSGb2QWjkZQYxphDFhDJm28Q5huE1B6crDWbcyUhTEad4ooYaMBwW/qqvUBU
	Jfh/Z9cpeiZt75yJ+OeYb6rb5M+XyJu6xYG8kF5d8DXqfY9vq05lWsOLiRE2oob7wDyap9yJBYs
	QDOVcI20aP/y3SGYXZJSDYnhZdZV7gLZC3YuvPDIUX7vyTV8FQF/hfY725VaGS2QMXVAAbYfgNc
	BuicG3/DfubqLCUbAr4Yqmm6IBh3dCxfrhdE6gA1EHiMVM1pjFZow==
X-Received: by 2002:a05:6000:2504:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fd2adcf89mr1876494f8f.24.1785480225025;
        Thu, 30 Jul 2026 23:43:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/4] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Fri, 31 Jul 2026 08:43:23 +0200
Message-ID: <20260731064326.2284228-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731064326.2284228-1-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_234347_125205_D7EF21C2 
X-CRM114-Status: GOOD (  16.38  )
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

Some SoC might require dedicated regmap to configure some specific IRQ
register.

Add an extra entry in the base_afe_irq struct and use the specific regmap if
defined.

If not defined then the global AFE regmap is used instead.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 +++++++++-----
 sound/soc/mediatek/common/mtk-base-afe.h   |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 2a20fa5dba49..948f606cbaf2 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -204,11 +204,15 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
 	unsigned int counter = runtime->period_size;
+	struct regmap *regmap = afe->regmap;
 	int fs;
 	int ret;
 
 	dev_dbg(afe->dev, "%s %s cmd=%d\n", __func__, memif->data->name, cmd);
 
+	if (irqs->regmap)
+		regmap = irqs->regmap;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -220,7 +224,7 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* set irq counter */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_cnt_reg,
 				       irq_data->irq_cnt_maskbit, counter,
 				       irq_data->irq_cnt_shift);
 
@@ -230,12 +234,12 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (fs < 0)
 			return -EINVAL;
 
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_fs_reg,
 				       irq_data->irq_fs_maskbit, fs,
 				       irq_data->irq_fs_shift);
 
 		/* enable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 1, irq_data->irq_en_shift);
 
 		return 0;
@@ -248,10 +252,10 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* disable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 0, irq_data->irq_en_shift);
 		/* and clear pending IRQ */
-		mtk_regmap_write(afe->regmap, irq_data->irq_clr_reg,
+		mtk_regmap_write(regmap, irq_data->irq_clr_reg,
 				 1 << irq_data->irq_clr_shift);
 		return ret;
 	default:
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index a406f2e3e7a8..b5300c9ed415 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -153,6 +153,8 @@ struct mtk_base_afe_memif {
 struct mtk_base_afe_irq {
 	const struct mtk_base_irq_data *irq_data;
 	int irq_occupyed;
+
+	struct regmap *regmap;
 };
 
 struct mtk_base_afe_dai {
-- 
2.53.0


