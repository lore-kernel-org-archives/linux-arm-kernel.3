Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2279CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90iZe+Vt3FO3EhRu8PaahonsZT35J6uAqMQ+RMLFCOI=; b=HvUJKhyB0rHTcnymxm/sz+dwge
	cwTMVQWA7WCtvyk0IstYyNZHxyxqNmn/coze02GsLgHCNaw+zPKg/VerMtM7TeGTOsCXo7CZ6huSi
	7RLWM7OtfvqkMdkPsm/W2wQgGgfWDg57vozmS44Gna/0EBcOSgSMVt9yqLMLq6Ma5vL5ykxOAls5P
	fXav6xVfG8gS+GhhAO3hu3hW9zsxc8pOAtaMRPe8uMTC/AIab0PJTpjPi5f2l9bKzfXpor5HTdw1z
	gNvpO4jXVhRYFeYCeUn9a942yTJPfqHM51DBqdzGrWh6YwTD1jIO+B13kJnKxmvewNEYXb/TSgB6d
	nX/m2ILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqr-000000068Dr-3gBy;
	Thu, 28 May 2026 17:49:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqn-0000000689S-1wMy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:48:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so85090315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990536; x=1780595336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90iZe+Vt3FO3EhRu8PaahonsZT35J6uAqMQ+RMLFCOI=;
        b=Jw8WqUZZGSXMhR2FSVAD47NoZKaNrcePARgIQf/mxKuV13OZYi2wMbqLhcOcuKpDmB
         Nv0ULycKP/op9UgD1ttp4XKUC8b8GAP0G7XbGemmXD33H/VSkVL4btHg1zkVedHsFADH
         jCLVDgo6ziBghtN1CVcJEz8rdfKq7+sm8OaliAo0G+JSENck1I4D1w+Idi2v5a1mIPzc
         Yo7fTQ8SIjTkaD+fidzyhaM+7V+Vei3DOUjEwR3ysrjWRyKzXbKFjH+dg4k4JR8B2/nf
         qIjxpCiNR2Lm9DNFUUyzk1G4XA6qZwhYrb1bjil+OauUAxprqjZuG0RoSRLXa3V/R5DQ
         dqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990536; x=1780595336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=90iZe+Vt3FO3EhRu8PaahonsZT35J6uAqMQ+RMLFCOI=;
        b=jG1ZLxJvIFjEsgV0AvQNEsEOwzlJxIpiWfRImpcp9qXZvJSEDbyGtnjaJHwPRV3xfO
         3oeFjlFOPCWU6Fo/PDYJG3Y2xldNQo3BI3wwe3xgRVyQPc33RArH2YNm74KjT8e7MDTh
         yFVrYwxyxP01eAcKgYV7wcRXvzqAL8lLBwf97/KNJ19pvzLWueBiiyZQL5MbiKo08vhI
         Q+9HR4oEAO1i8WifngzGY/0TIEAIJz8bSL1VJ7bHfbzru2jhwdzS3Kd1RM8EHulOEHdn
         st91qYQWZnym4BVJEP+cBSQ8JRIyUqveqTs4LWYSrPYivhYe6C6zf+0aHUdh4tkGgW8k
         rymw==
X-Forwarded-Encrypted: i=1; AFNElJ+Q0Dz9bFWSNjis1OKO5gpc0hwg734vb9oNUDCnWuq9JcXuGJm+opvPVFSPcFLG+H5jwL9gSV5nY3NNAPZ7aKJx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc8+ekO8QN91B2xbussrpDcR/OAuatCox+BhTzDTAT1h0BZaX4
	z/s04x50FhDu81YLJSk8kejiYT4ZLDRTOTXPzShs6npHAfu3+Mo637mD
X-Gm-Gg: Acq92OFLSQsmAEXIyynAI16pbUoPppR9VnE4KXblYHXh7wKr4ZPP9yvFrdmYB2+eQz+
	ScEzxjKStaxcKosABWH6ZleQsm4jRHT4uAVwzkW6dQwy2drLOvm0703JZ5EhLyubzIJevmqSYKn
	Q1FBcWVJ1J/MBKOdSxKD7D15jvqKrQvFmIv5dZecaxLfXJx/bKlVJmxl4tXfaM1ILpFpfVPJU5k
	IurUHQ1Nog0LlqmGrJKsiooEU19YZ7My7FvLiq7NriDaJjtNunDFi/ONXsAyZHt69kfmV5G7GBb
	Cvx6UDJCeAHwPg6DSlqveVaV57GFLsQpCCu0Ndat11pEhOhphPLK6N9b+d17sKzN3z9SUq2UlGc
	nHTljfCTRs6xJQaLHNzo97gucYwn8j+aY6KjDAmuGm6tTBUQKWfmVlKHyTKYpzTlD9t9zUxw8ip
	i9Jyk7fN5CegtrtYL0c/sGFioAS8sfwYcw77J99OpA7aclUwaEH6CV/5uOzpwVTsDNhIWMkkNa1
	H/f8N4=
X-Received: by 2002:a05:600c:8692:b0:490:3fa2:1b93 with SMTP id 5b1f17b1804b1-490424b0e35mr303367145e9.13.1779990535640;
        Thu, 28 May 2026 10:48:55 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:55 -0700 (PDT)
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/4] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Thu, 28 May 2026 19:48:31 +0200
Message-ID: <20260528174840.28644-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528174840.28644-1-ansuelsmth@gmail.com>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_104857_591623_0B080C02 
X-CRM114-Status: GOOD (  16.14  )
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

Add an extra entry in the irq_data struct and use the specific regmap if
defined.

If not defined then the global AFE regmap is used instead.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 +++++++++-----
 sound/soc/mediatek/common/mtk-base-afe.h   |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..a8f4e70c8213 100644
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
 
+	if (irq_data->regmap)
+		regmap = irq_data->regmap;
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
index a406f2e3e7a8..76d010f853f4 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -87,6 +87,8 @@ struct mtk_base_irq_data {
 	int irq_clr_reg;
 	int irq_clr_shift;
 	int irq_status_shift;
+
+	struct regmap *regmap;
 };
 
 struct device;
-- 
2.53.0


