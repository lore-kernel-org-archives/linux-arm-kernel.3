Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E27CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=; b=wQ5uEmXjebZZW1GewGtETgxXWm
	AZIlvCBYxfB2d2slXCCNsP6BPCE4hFkyPP6N2nYZuiUJ/GrynvzoBVq3uKDfRC733asjHaNjw9QRr
	xU8pqn40Nk4Yws6lwTXJVFqwvpJ2IarMJwzoJCU/pt48kMpLygEr9ltIUY5oT+Ff90beXPJ51+RIx
	4bH2gsHL/Bv2dttsnnQ3lWVqzoFyLg/kaGQaWYBHD70c3nOmWJAZFjQfUmgjtH8jGKsMKj/RCQS4x
	JiJMbcV+V3ZYeCA6+eil7i55kEMcyGd5+4JGy8uRZ59BBhAiO9LJRtZ9KksUJvUbo/66SQ8dsRYTA
	zvEEih6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3a-00000007NAy-2T0D;
	Wed, 10 Jun 2026 10:21:10 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3W-00000007N6o-3ynn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c0aa420401so50756785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086866; x=1781691666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=;
        b=r5xfFTTMMUZHxnHYq9/BAcnaE6TadVyzSVC08O7Q00fPzjWmupn05W8Wb9DHOwLF4r
         zt9pUNHee/seEK1UKnBjwXgbmm3vehMjANRPPf2GG0/FCNzSpwmumuM2+MGvyeHH419E
         vG4h2Yl+TpJNwaKJDtQ4StLb4O2HzZaPLzwFPqzBrtGj3rFrdpnm1tE4ZGwq0jpwY0xG
         4H+E9Zrzx/fV1kwusEujtnVRtEb3DgmgOJzVAPuxXIDtgFYxH46N+pChBbCPhoy9eo9B
         NlwoD9eXFmVLA2ErMUpyOG+sMfZpmDe6Jg1JUu7ipgp5QyMlpBUY/ERb80oc+0zyHS0G
         Tahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086866; x=1781691666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=;
        b=qZuwII0l/hZyBglRK9xeCWlxDmAkaUnHmubWVPhlA48pIYu0k6YiDFu3B6eL+Bi1af
         mDY37Em5JkuHSZp8l2Z4Hw6cdOS+IE7gNrnr8Bp4oX9RY7gLXur+geNjBbrY06KBQT4o
         M4K7lev8nQYt13Dabbji/NtiD4HmMkV2BqZ1CraNo3sgL5D6xO3oEpt0d1We4joWPpXr
         Nr/8DqaLrkxh5ZN0PlI8ROTax6KBrm0fQxCRYqsFi8VmKQorVPSK1yKXUzwMia3rcgrV
         k/7MiQB+rNF81sBhM1D6S21VsLWEJBpvK38s3EHTL+Vy1+7SIIl5Et4YeVCFL/QtZtMY
         3N3g==
X-Forwarded-Encrypted: i=1; AFNElJ+O5fKOA3nC8CDRDTG61Cuyl7+FfTBlzZeH0iUAloAWXgfuR+71ZAkNhc1BnPVtf/3Uxrc5xup0tOpCrM3dSgD7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4AgPkcgUVeAL0Kq6Cx2sqS9urRFwkn/CSaGsF1DHOqbAx+aQ4
	WvneO0VoLHuR1nsD/643z3WHiE2qh3eGN7SH5PK1ZO4y59oXwnsfcY/t
X-Gm-Gg: Acq92OFnj/M7576FgA8Kun0aiHlrgvl967tcaCQPaQNy+J3XwYNEnzCXywp1TSTZiv4
	t2kFeAu7hTwuF76e+zv6Nu4Fa+D0GdB4RW5Ho7K1/F/OOYFwmi/aFz7uS1V3ADH1FCEB/k0RJAO
	q8b1zmeLsdVHt4gAORMKus+/+GsPqdHXAVRlitxRcpZmZGk+4SIVTrV/U0y1jQr6RzQ+l9dbOJr
	UY7Y9QKsYgp/2dSus0MWGEGfWXgiaXeRTD1k3UTnIr2uEhSNhWnIUh4xIvB4aVFgsXYyirpMa3M
	cSDT8+T03ZVjvI/LczK6aqP4wXTEby+USDUdx10uhfo4Xadr7s1rHBXQJshQA41Opp+spbxBPID
	DgFDyNs8i/7DOf9W6SmDr5pD9exCSCxOFH7/iU//hy9vk7NkOS656H/pxbQ9bSVbkrrJdH0VJ8e
	AKd5PK2v8ATKJwHUh8sf26fF3Khh6eXHBlGnUZEN2XWzDlj5vk41mnjVoGNSdkTL3h0O8+xNBcK
	bRLjw8=
X-Received: by 2002:a17:903:1209:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c1e810b983mr265633925ad.19.1781086866069;
        Wed, 10 Jun 2026 03:21:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/10] ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:17 +0700
Message-ID: <20260610102021.83273-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032106_997760_74C9C121 
X-CRM114-Status: GOOD (  13.22  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 42 ++++++++++------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index f35318ae0739..618d8400913a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -283,7 +283,6 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 					unsigned int id)
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
@@ -297,16 +296,14 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
-	cfg->ref_cnt++;
-	if (cfg->ref_cnt == 1)
-		regmap_update_bits(afe->regmap,
-				   cfg->tuner_en_reg,
-				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
-				   1 << cfg->tuner_en_shift);
-
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+	scoped_guard(spinlock_irqsave, &cfg->ctrl_lock) {
+		cfg->ref_cnt++;
+		if (cfg->ref_cnt == 1)
+			regmap_update_bits(afe->regmap,
+					   cfg->tuner_en_reg,
+					   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+					   1 << cfg->tuner_en_shift);
+	}
 
 	return 0;
 }
@@ -315,24 +312,21 @@ static int mt8195_afe_disable_apll_tuner(struct mtk_base_afe *afe,
 					 unsigned int id)
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
 		return -EINVAL;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
-	cfg->ref_cnt--;
-	if (cfg->ref_cnt == 0)
-		regmap_update_bits(afe->regmap,
-				   cfg->tuner_en_reg,
-				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
-				   0 << cfg->tuner_en_shift);
-	else if (cfg->ref_cnt < 0)
-		cfg->ref_cnt = 0;
-
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+	scoped_guard(spinlock_irqsave, &cfg->ctrl_lock) {
+		cfg->ref_cnt--;
+		if (cfg->ref_cnt == 0)
+			regmap_update_bits(afe->regmap,
+					   cfg->tuner_en_reg,
+					   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+					   0 << cfg->tuner_en_shift);
+		else if (cfg->ref_cnt < 0)
+			cfg->ref_cnt = 0;
+	}
 
 	ret = mt8195_afe_disable_tuner_clk(afe, id);
 	if (ret)
-- 
2.43.0


