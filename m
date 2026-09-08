Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C250DC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=; b=4ZvsDCuXAIJBiDq/f+gjDRTTGr
	OvpWzLwi3u9h+V7oMAWIU7U7rnOqau/y2pjSw98jJAHjeuVgcuj9kTBANgrHa7Y22eyJ+0ARQNP/s
	W77Q4s0I08/5gtdZ2Zjx1Img43g8xFZceLhaNfbAO4MxZBXB1N6kc8iS8RtGWcQ/qjQy0DnWugcNj
	etD2DQdJPvcx+/U6thZPMM1zJDTX5Dmz+yt+CsSSchP/5FdUgHYmQUb8XXmDNamIPFmfhM5NNNOup
	U5iCjqkSfouycMf826MJBFYTWlzlO92DqPWisPNta71bTw6rJAVEfiJPyN4aYWIGQ2tGgryv5JQgR
	ABzhRD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlN-00000008VEO-13Aj;
	Tue, 08 Sep 2026 09:05:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlK-00000008VBl-1ts0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=; b=FBSxkE5sXZxZS6/8IoqIcjIRFI
	5aX1G/6UxXKVLRsN5FaiwLX7H+YKfPumn6LUjGjUg3o30Q5SUkOVSpkj6NLj0tse6AG/fmmvOhCkN
	s8UocVW7wrDMusWJBDx4D97FDyEi6EL8zmk339Pe8zFEnHQylLUt1yitYAx0NWrsRy2+eFXwfEaQ7
	yiurKiMhoHVbzf0HgIpJE4ALO36WCtonrgVuy6ZOCHrBViTzqkrr9yXIBceNJitSP7XfWQlRiEEDs
	JKttRBiZBI/IPBcEUysSaiCpBJiMOeqCzQvW2R6qHmPhKlnBLcA2P1/iATAF4D2nk57iztk6rqw5n
	t3FQjeyQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3rlH-0000000HAEb-1sXr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:05:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4858303de5dso5400160f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858301; x=1789463101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=cWWD6jIFyfDZY87w9iiIrZj+owbANpHdGx1iyM7hHJSqjbZOHQlsFLoFhXeRMrKx33
         /1cJ5Whl0XxXKmmmZ0ICwXZbLUMbjQqMVWKGyvM2q3DFPydqzWptvElrsyqtCBZ8itql
         LAlOBG8KwSYceZBZccFTwDIyqwOjo2ewv8MNCyRW/5CE87dqd41pUHloj0aUK21zNqtj
         mvSx/m+vWu63YBSynfnTtTS0/FkaRf7Dhvw8gUTwaiDv8Cf+L57U/RBZwQWSlqeBmTxn
         cJ88J04ZoH5mJ3Iph36P9U02JFW1/PydmJP6MrsonMK9GxGJaiQ0kXbwqv0dseAmDs6S
         5Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858301; x=1789463101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=jc8PYErOwdmae3jOZWuFWu7gq8PYwMJ/X+ruaa09ptWVmMOa9+1P6Oe4cNv8uhZnJM
         2cHwEoc66kesq7kcMaEwj/O3OhDM/TsLVN7qk9zgs6s+u6YUnu/D7lLiGLZWsaFb+0dh
         Q1mZjcuaf4eCHM4yKwqRrpvxrggo+1IoK6UwAHvY9lS47bR4G+sjAnn8VAhnRmhluFqm
         +QrHNv+m+lCNrxYFiUZ1W0uYo3ieQWeGJMrR/oTn0dzhBPS6NyXCOUsM3xeHwQhBv2Ar
         A4+KxD8b7m5XI9pd192U2GPk9NIhMucmJL+QT1FEmaMCeAKll6RGKzgFD1CIWZszzl5B
         vX8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzpbbXmtgWGe2K9a+MaYg/3M+Eztra34PBuNBgOyMa8lJITfU5oJqnSkmjnFHnr/JSA0MW+9QCWBt/fhipgWrN+@lists.infradead.org
X-Gm-Message-State: AFuF++lT7BGOmwFNvFjOVv/Fqi67D/u3tP7QjYllVWyuLpsCOKQabKYw
	WjfKowLQ3otNpHZkDOZrl0SH8XWydvjqYnzXoSDC9+FttSwM6l0vXKBj
X-Gm-Gg: AYBFou1Grjdyi1Nm0AfH/JXsdH+U68o0aqOJWVGlidehzq6dSIx4gFoeGGZ+lG0I4NS
	s6jwm8x4NdEEpG7S4jFxx+q9DL1nrCyDZ051x4Ojw7d/SLD9BjXyIJwvuc2R04/3YgxDfYVVZQB
	ByAGSnPYuxSAKfif91z9BIFiuSJdR6SO88XQ48HhPvuhhuLCZpOi/3U+iZ5Isd1/ePybZDFwiqw
	w/mdxQmuetiT3VfnW09vkKYfXoq3D53XVFj5dFaY2XC41CxjOTdw/YurcnqoULvC/Xrpl2Hb5sw
	OVBigKChTZ0CFdSk2oMcSFdxFVRc5FH3d/eNW4heUVVX0hoc4cooZoKT9IhcpgNGIJDbuW1vQDT
	rfbzO9fxDGi6HA5yj5JiDDYSHEeuPCPcuINJU3G7iGX0CKk4oga5d2mYX5I15W6GIiAoDaiI3tx
	Ql1/sVLm8zqG38x2umlFwlB5QqucYIFwl13pmdj1axPeucJCLgKHDFLNfs9MPFzDEbC1l7I/MrU
	rAI2K7rkmXagA54Ng/uSMw7pRTThGinGC1pGPEHo0fdqWwfqWTH
X-Received: by 2002:a05:6000:26d3:b0:484:4146:1422 with SMTP id ffacd0b85a97d-485870934f4mr28074029f8f.21.1788858301380;
        Tue, 08 Sep 2026 02:05:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:05:00 -0700 (PDT)
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
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 3/5] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Tue,  8 Sep 2026 11:04:45 +0200
Message-ID: <20260908090448.3332-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_100503_836826_A873C48E 
X-CRM114-Status: GOOD (  17.08  )
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

Add an extra entry in the base_afe_irq struct and use the specific
regmap if defined.

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


