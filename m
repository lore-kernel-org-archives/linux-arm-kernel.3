Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B5BCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ1CB1xaItZwOeJMb8jfEb8OFmetyjBrvgHBbV+tv7c=; b=x4GE6YT690OOBQYI+P6HnOKk2g
	gtcBF6Rifmhl5tDWersahGkMQZfsJaRKzAy2Jn8MrT2V6O+MTq0vGJEQDpSekarSOCBAqxXlrCiz6
	bK2WIEd1OLDz1v2WZbtgbO0adqaZkVaFPyLtzYnSSrPyFCOuumMGEdrKCiD2X/5n7gjx9i3xPmpkL
	/YEcHE0OwN1OSvN4C8oFX8RrCeHWP/5NbyFVhYDcdEBgK7YIGKb1U7H8kF/pfWyMa5rBYIbQ0H+mS
	lU7BwIeG5Q/ytx/CisUjp0vuYi1WBWa7Ey/nSCqcajUkDNI52DKlsKA+X0h8wRKmaorHTmRm4kZfl
	l3/7mNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3R-00000007N0f-09jR;
	Wed, 10 Jun 2026 10:21:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3N-00000007Mxq-3ILW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:20:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so55306985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086857; x=1781691657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQ1CB1xaItZwOeJMb8jfEb8OFmetyjBrvgHBbV+tv7c=;
        b=aJVFAc3yhiwP42JCms0UVDsrbvOCYGOrnU2JmlapdxQJpcoa36MgdXiAxRbmuz0A96
         d8mAXL4pXll0pUS50HrLQkgLhSDL9wQN/FmEwhiQw9KbLHO1JeQVgJDxz1IV5Y1+YoCQ
         aoKK5h6twy/272qjk5UQIfw28Lu//rEdMrOwM3UW4DAHVuIBKM7J47YiUgFduEbd2Wtr
         dpunZN/d429DD3LJwZYepXri18l7EckL98gBfizVJhLMm6GE2ccHzPzGHNQL17YnfeGU
         Doi+TWAF4IoY6io4lTqsxY+3c9K49Ym5ZhxjGmW+YcAHjaTTjU4+TDttDByJKK7udAFi
         fXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086857; x=1781691657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQ1CB1xaItZwOeJMb8jfEb8OFmetyjBrvgHBbV+tv7c=;
        b=N10aNGzJ1TIO9plxJFinzQ+gLvAHgCxjriEjONWf9Q124Ko57O3ZUXwAeFJ7oLX0DQ
         218YFZcKwyGWP7gR0iRvGVKAm/kOLfDTcpSVKe34s4Iyvq/Gr47yi4I1rFOPG0rMUQMb
         BV7oHkbXV8HDWP6zzByGkdUNJy6nHcc2zGCB/ZYZUETl+mh315eDfVZx+W4t8qIW+VXU
         oBGdLmJpx8fTbdbX/JySlI08YOKTDiQJz8+uiTDrvZnG7dKThFjgvCn4A+5h8tx2I4pi
         oC+xUrtUiJUr+pEbx9VF/cNkMd76CFaDMWwlxtDIeY2T4P+GkK3ULQjppuo5kGUWgAy9
         Vnqw==
X-Forwarded-Encrypted: i=1; AFNElJ8vsVXBqpUOISSRTm6CH0ja8oiimClI/zd7RE4qMhk/LJuyy5UtGvMK+ZamcoUxKfhFdxsr0v545sUzTtW9QBkO@lists.infradead.org
X-Gm-Message-State: AOJu0YwNyEdzVMOTGAQWUJk8noL8l89ESgr0WxSsnOHV5qFfa+o5W6OV
	0jLwhfAmG5/ktUizloEOBuTTvpzxedvzPIg6ir2ov+fSSfwcJyC2tRoJ
X-Gm-Gg: Acq92OG+40fG9JOTMMlmMexm9SOjySWfPg5P4EcIyl8YGIRYManGGMDZsH9siVQ35oA
	kFWnSY1mtkblnm6Wezlh54qRd0Y31XC184+yfVNuAjFgYm5ds316a0aUQnWQ3MkyJq1zylYq9KS
	mxgzaa+XWQR3j6PmPYubuXk0jqaSapkjeroOtX3pYq0JzvTKXcK0aiPY3l8UKi/feIs5S8qfAee
	9s6rDgf4X2BVQBnoM2GAPyWn9tAcgf1tadP36K4FBZt7zPEL8mOOzggwvfplasPO50bNNFMVpX2
	Z8oEfbp2Adl2znRSrT6NKmodYn0ZuNAox3hlEWi2aiNNW7ROFjibBSlTVL1s2rM4wYfjG2Bie5R
	THpjtWsttb23nys1N9SqMiIprtGLfEyS5bp0Yzzqry/DCu4KH2zBTLzOB/83KI+hZ7UFBuv7RLQ
	J95ZbHLWSZMiBnmp09a/6ngizriP3SVF5LW6NExhChwALGF/BvnK6LqxeR8pFjmgxYE6GU
X-Received: by 2002:a17:902:c40f:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c2bd0d3f54mr41954845ad.11.1781086857182;
        Wed, 10 Jun 2026 03:20:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:56 -0700 (PDT)
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
Subject: [PATCH 04/10] ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:15 +0700
Message-ID: <20260610102021.83273-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032057_836372_03FD02F6 
X-CRM114-Status: GOOD (  13.36  )
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
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 29 ++++++++--------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 7f411b857782..fc6cb3f0469e 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -301,7 +301,6 @@ static int mt8188_afe_disable_tuner_clk(struct mtk_base_afe *afe,
 static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int id)
 {
 	struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
@@ -315,8 +314,7 @@ static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int i
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
+	guard(spinlock_irqsave)(&cfg->ctrl_lock);
 	cfg->ref_cnt++;
 	if (cfg->ref_cnt == 1)
 		regmap_update_bits(afe->regmap,
@@ -324,32 +322,27 @@ static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int i
 				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
 				   BIT(cfg->tuner_en_shift));
 
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
-
 	return 0;
 }
 
 static int mt8188_afe_disable_apll_tuner(struct mtk_base_afe *afe, unsigned int id)
 {
 	struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
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
 
 	ret = mt8188_afe_disable_tuner_clk(afe, id);
 	if (ret)
-- 
2.43.0


