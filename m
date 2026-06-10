Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E93ECD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rJRzCL8/vGU1Cnds6wAoa9R/cBJXeGAkkZCjOz43G0=; b=ylwi/3a4efvh1dC3jYVSSpTePp
	+Rc8wYDIRe7AoZAv/ciTmzMEYi9N0i8DSQn3jx0rpfLyyq7BNuByYkmOhn86Hn+BjAicUBYxzSk5t
	XKPt1dMz3GsPHrpAelBuAVxVs24OftZlml0vIm7blCBCb7IlCKnyW5oChYXF65UVfk/Sfi4zQEhRb
	bTKULmUdayEhSJi+5SvYDXTasBVZTVE8hr6M+aRAxOBaPjFEjWc+ap3hEIFehXZCreUoqDfI0dxKj
	c/vnVKmhr4IxF7zM+I9dzrfrh1qMxPHwntTA+NKEKTVvuEbX5d7Os4RZkinyTZWtnvUrXgBZlb9w3
	Rw4ibtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3i-00000007NLE-08Fp;
	Wed, 10 Jun 2026 10:21:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3f-00000007NHh-1PMS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf1f074a12so67209945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086875; x=1781691675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rJRzCL8/vGU1Cnds6wAoa9R/cBJXeGAkkZCjOz43G0=;
        b=o9ArvtDcjScFkOvsC+hvxhxe0hw+nKFk4S3o08sn3EDBH3cj5WNTmqSXruqgvtV5Jx
         ynqF4kAYwxrLt0aTlyoShn30Lh21uWngT0CbqShfijSCV2d7B96Um5prAv6IbtMQNtRp
         LE0+S+29zlCk/6YzZYNCV0CissBEDZhV0W+iyU9yhFVDLxhe7djgl4bYVvqDKnsdGhX7
         o9kh+JasUz8Y56AmBBuPGsUU2YrFcyDq5DUE4uxRhEtT78kSUBbItZA8+udEo9f+AqNf
         DpE4Sb5JuRP7wdP7Pb1BA4oaWvE1TNXhwqltOvOt1FyoCtwpG/0ludzzVbeLjAqxC5FT
         RG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086875; x=1781691675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8rJRzCL8/vGU1Cnds6wAoa9R/cBJXeGAkkZCjOz43G0=;
        b=JbB1hrPs8B/azDggAUqrWpYKYNXI6OZNz8DyvRDgh6uVNfNPC26lV3RxNiG7Xw3rvP
         /3x4ayGYa+u5JQgTpDktz7ldRKKf8A0vaBVRbVAdFGpUP9dPIWgxg7D8fei8No7zzoIs
         KoXGjpVQHJNJGq75tvDOw5awNUAk6FnkcFYbtD3XjydV6+KFgZX+PAEASKnba7zL/NK5
         tzGGEkUNSY8gIUCgMkwlfAswhPfBTibFbj1CQ56YZTqsF7/xKCLsvtC/mN34jGJCg6ou
         7Q2JVTkHiIXzG4EkQaiPptI1I37ncOffNFqKXCXzqwqIoU6hr2gGisW1I3AbQOamzylw
         KdjA==
X-Forwarded-Encrypted: i=1; AFNElJ/QnhbtbvfvKbNs8ek+p8X0Y+SO72u7ezBIYNYwxL75rwQ73GAclKUjpK5/YP1VPg39p81JQQPFPfRLwRgJoYRb@lists.infradead.org
X-Gm-Message-State: AOJu0YwkbA3EcZjt44dOrws5h/jHAsbhYfV8otXxTDFekur2t04mB6hM
	PYQe08bqkyepEKZxlJPcJaarfnn3h08gNLjovIa/zECgE9WjQE53cyGb
X-Gm-Gg: Acq92OHMjfB/7rGwzHGjEuv84/iQPZESC8005nLIr2hQ8ATEAS/Fi0Am3ToK7qzu38J
	k3wyTlJukkjO9RKOlL3DPVIsgHUalA9wxGkxcijr2EsKPEnxhytTr4jaEBFR/XIo46aEM0/thT/
	Gq+aW1hJlAWi+n4cBVts2xwnmOArIi9pxmqXeQ3c58aTpb/nz6fhMhuIV23Ei8JxX6gr4ooEWuq
	/Kdgr9eJphwt8BVbX0YywAbYTZNCHObswHSBs4jYIRXeiLrFRBtoEoM2p7oHAimt63lBiyFmRK1
	xywj7Hxg0xwZE/5PDBZMXruQp0nztXsR0SjEngWHzWRvUM/yylwonaHBlYv0KSO9zpr1BTuQ5wt
	TvTA/ObYqIXnQxKA9w8XrQEL8oArFsEKLGUD6AScY4gIoYqIogFWkZhhm+KuC/X5x6tRWJKhRY8
	xRweZM2Qx+DuT3i744TVJ/uXQxagRrlu2JVHf3fBx6jMmRE2G2V4PhhFbJuhHRbU5IKE3Q
X-Received: by 2002:a17:903:2a84:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2c1e85c5022mr288228085ad.31.1781086874701;
        Wed, 10 Jun 2026 03:21:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:14 -0700 (PDT)
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
Subject: [PATCH 08/10] ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin locks
Date: Wed, 10 Jun 2026 17:20:19 +0700
Message-ID: <20260610102021.83273-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032115_389699_0A94238D 
X-CRM114-Status: GOOD (  12.46  )
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

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c | 30 +++++-----------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
index 7078c01ba19b..af96aa446fe2 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
@@ -194,16 +194,13 @@ int mt8365_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
 	unsigned int reg = get_top_cg_reg(cg_type);
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_on_val(cg_type);
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->top_cg_ref_cnt[cg_type]++;
 	if (afe_priv->top_cg_ref_cnt[cg_type] == 1)
 		regmap_update_bits(afe->regmap, reg, mask, val);
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
@@ -213,9 +210,8 @@ int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
 	unsigned int reg = get_top_cg_reg(cg_type);
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_off_val(cg_type);
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->top_cg_ref_cnt[cg_type]--;
 	if (afe_priv->top_cg_ref_cnt[cg_type] == 0)
@@ -223,8 +219,6 @@ int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
 	else if (afe_priv->top_cg_ref_cnt[cg_type] < 0)
 		afe_priv->top_cg_ref_cnt[cg_type] = 0;
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
@@ -263,25 +257,21 @@ int mt8365_afe_emi_clk_off(struct mtk_base_afe *afe)
 int mt8365_afe_enable_afe_on(struct mtk_base_afe *afe)
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->afe_on_ref_cnt++;
 	if (afe_priv->afe_on_ref_cnt == 1)
 		regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
 int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->afe_on_ref_cnt--;
 	if (afe_priv->afe_on_ref_cnt == 0)
@@ -289,8 +279,6 @@ int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
 	else if (afe_priv->afe_on_ref_cnt < 0)
 		afe_priv->afe_on_ref_cnt = 0;
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
@@ -322,13 +310,11 @@ int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	mutex_lock(&afe_priv->afe_clk_mutex);
+	guard(mutex)(&afe_priv->afe_clk_mutex);
 
 	afe_priv->apll_tuner_ref_cnt[apll]++;
-	if (afe_priv->apll_tuner_ref_cnt[apll] != 1) {
-		mutex_unlock(&afe_priv->afe_clk_mutex);
+	if (afe_priv->apll_tuner_ref_cnt[apll] != 1)
 		return 0;
-	}
 
 	if (apll == MT8365_AFE_APLL1) {
 		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
@@ -342,7 +328,6 @@ int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll
 				   AFE_APLL_TUNER_CFG1_EN_MASK, 0x1);
 	}
 
-	mutex_unlock(&afe_priv->afe_clk_mutex);
 	return 0;
 }
 
@@ -350,7 +335,7 @@ int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apl
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	mutex_lock(&afe_priv->afe_clk_mutex);
+	guard(mutex)(&afe_priv->afe_clk_mutex);
 
 	afe_priv->apll_tuner_ref_cnt[apll]--;
 	if (afe_priv->apll_tuner_ref_cnt[apll] == 0) {
@@ -365,7 +350,6 @@ int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apl
 		afe_priv->apll_tuner_ref_cnt[apll] = 0;
 	}
 
-	mutex_unlock(&afe_priv->afe_clk_mutex);
 	return 0;
 }
 
-- 
2.43.0


