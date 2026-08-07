Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FDBC5AC9F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=; b=nSI+SjOO0A/PKFRdeHyVAHgTnu
	tl6APMJfujTCbVpfEkBeqPY9Pzmd4oYnJ6N2Yzk8jhnGWBOINsEwIZp2Iy871U7ZrvJukWmelxu6t
	QBa1lvpMa1IAVd4w+xeeFN2gOveVTyo63iqJHUWIWaTj4rPmBH+PJzAawboTMKdS86cspxWB3JtyU
	5JeVXAszC4NdaOYaSOsgmqk89Fc95LhFRVm1pTIjKIYCnLfaysmP6afFCwVpUEdTHoUfttNUf4+Qd
	Bsh1JgB+Z4No38YPLJnyhCgrtvxCH7beONTDg3GYmZOnf4zRzMGyHmmSwuFLdYoOzKg46WOR3xGge
	lBLuRN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQtA-00000008hOM-2A9u;
	Fri, 07 Aug 2026 20:09:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt6-00000008hIW-004b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 20:09:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49553515a8bso56593305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133390; x=1786738190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=GsRa5mckw4hDDYWP+WAyBy6RL/6rYBvdvenbZT6JvvwVlpqquuo4M17qSAxp0cBXBs
         INvMh/D8vjTq39fSgXJw0OipL8y8Kfbc25e+Umi989HPuXX0C5muJoa4+VK647yChwC3
         jfwDkb1X3TY9EcTK9OhFldFvRhxVpCvwtKJds54Xpj9I2/OvOYehOtUWtyVR/5IUVSn0
         xlrJh2oWfUwz2hYY3eujtfkBXyYr287mBBvh12NryZiDW6GcbXhBvvgP6/LTNm7XDiFY
         WCM0w25lMAqjb3YvTJGUxYwFf0FWaAj+Xpw0x4VLUzRs7h14PfahnmTxCpmijaRgDrmR
         C2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133390; x=1786738190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=KUFl8TIGb4MN13BoDiHOBOUVijmo0a3wZuce5XfcX4iMCK/s26GXhZ3qUNlKYKwzfy
         exdmww//VaQI34cyDmuDypuiMxeyVK+O10j+Dh7CJ7ItUjaDdFR6T7GtXAJi52ywKRp4
         kijGfPRrOYPgAkYFfg8zr2uEqodPamMKYFp8Se0dhSKQ54tqJgUbbsgEaVXSLjIWW9gy
         knpH6keB1PJ7veFJJWzUKvyewA5j4cyKyEXki8suNfhtiDP+rNFHxwUvO45YX0aTtUPU
         bu3s6D+ov3LONkM4fGE37TGbx+LVQPNbwApwcwcQskFhQiJ9gX2LAqTZGOLKQiWtZJ2r
         ob6A==
X-Forwarded-Encrypted: i=1; AHgh+RoMu6cZ4+TkuMqH2kxvhUT/YNMOgy1xLClfGX6VYXVaC1QAq5d8As+N29vZCKI+D6w6llTEr/lxZUmuVrTxsMNz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6UHwLPswpVsFAoSodEo23RV319CVgt7EWf9Ae/eMwPUCm8QwL
	0Tda2artXW7y40pv2OkV9wPh3A/Bvz3kwkHUzNhvKhOOExC4lEszuWYv
X-Gm-Gg: AR+sD10iqt4QMtPmtC3TYQ+4rDhWqK28pYOYzSQl72GaifJCmICnCqfQWuZprLYM8RO
	NJM6a4Jd0GKnhnvTSWDurU0EwD3k6KMusTthU5EPzhdC5bX9TjNxgxNcdj8A1+2lGo8+bGUgSsu
	ViNYFRhxqkR36AmzWAdlVNJ+UhjWIsEkZzxRvLl1NCC+BKd/30+dhoSntkYBTPNPtSX5XpNuoua
	oB8zAJrxChLHM5pyb+5dO9D/VBYrsBwrjrAm3vC8fO+Vu7HTGY3Lgs7qri2ip9XwZ8+harvOc5p
	B9FroNPLwBBQEb4RLpOCCsS81u0oqtvVsPo8mhyfcKhgZmjnC3U2nkj1zEp9MsknnR+PHPv0iP5
	lbmwEOMXRUvk0JnxGufbtTgQP9S0kGVeM1uGlsEuFOqvIbquOXlthtwstcdfnxg998anXd7vPFW
	jNlS/Dxa7IMUk3NR0Fenw2Y5a4ztDX424FMj9j/vz6aivekg66Oyo4H/1P2o2u+/m/YfRpBPhL+
	EumROcDM03ZyDWamLTpBMXudM2q+/eSQe/ZXuCdIDlfRG4NkSUn1neZQvZzXHkJMQ==
X-Received: by 2002:a05:600c:4f82:b0:499:518d:ebd6 with SMTP id 5b1f17b1804b1-49959e3c714mr148437735e9.17.1786133389992;
        Fri, 07 Aug 2026 13:09:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:49 -0700 (PDT)
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
Subject: [PATCH v5 3/4] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Fri,  7 Aug 2026 22:09:33 +0200
Message-ID: <20260807200936.201827-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_130952_068768_C7D060B2 
X-CRM114-Status: GOOD (  16.20  )
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


