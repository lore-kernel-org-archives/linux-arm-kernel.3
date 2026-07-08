Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA729C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=; b=brzL2hFfZcYFQbRx0m6RNHPeYW
	lTrKLjIT/nRxPCebXW3zpuTluBCDiNfPyPQ5TwzqmDJ9eZKctk9p+2eom3At9KZneShn2DNgbL17X
	RNESS7s0eZCEUb7JhItnKlXPnPJNK92TkLuED5SJJku4sUyuVTnuz73yNiA18hA8JQ+lHX1jJp9nh
	xZOL5o/GjeAOWjODCFcDoPt9z6RhiqFQwTw9CH3RCPn1PKTTKqItrTksaTQXSdAQhHtZrSbbnupib
	tdjAG/JUw7t6SrBcS51EK1VHZf9qQ6rGH9uaPVOU1MVQboj+3BKAQy3FIhcPOFjp1PBnwEy1u8fVg
	7Cqxmaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7r-0000000HGW0-25K0;
	Wed, 08 Jul 2026 14:19:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7n-0000000HGSN-3O5E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cad4170e8eso10170975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520383; x=1784125183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=FSpEFIDeZCB0tHG68tx5jEQIy2Y7T03S2N3LwMGxX/TLxxgeavUvTM6gKbrOmaOyM3
         cQ+lAR5gmFhsSh4TK/wHUz4huCbNsVnTJIGad/Q3s70xSKy3IYi5F3HHsxnmIflkselv
         c9SKNEulDM4jKLIS7DdPdLOgrphA9pTB84mVoSn5vH+vK+PTNVd+sLAiDTw1xL/pwT+L
         v8wvFnQgYYwDt+H5RR4k4iXESKJOg7luokv/MVqiR6s8nQ+xI7inWfPXQtLW64rIVouB
         L58Re/O+eWqYW1uDOiSAePEVTdaLa9o97ouYut0Mhz2fHPCZoA2a9rSkWIGIIgVPSy5F
         gMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520383; x=1784125183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=jKKNJ5CXsCyA4hKPja8Wto2nf0ocTcO4aUREP/4Gf0G/CiHoBj3SdJK8dRLs+fV9mp
         j+A5ILXnvBy7+c+GaiKUI+g5Whr6/lhQz29UEf7UVIxWKoIZS3HX41T1W2DBfzUpbrxl
         leBLUuQakp+FkXw5qr+BO0wAaI3v3aT+JPDmOlgEM2UhGHVwXHapCPpX/KofsQ68qj05
         SmYXEhnJpUcBdjcZPiC2/KediDVLwP5xQ/rcHWstVLcR3iN3XQRg35/sgq9fUeWpYKqZ
         b3/zYxwAbqiGvsLgOxNfDarmRlNAwm6yC7NIpWnjigLyS4GI6szHsAnVXJtBEITDXqWp
         vU1g==
X-Forwarded-Encrypted: i=1; AHgh+Rq0BNNFsuwYHqzBMhXsRQHs0kYHo5LZsMPMR75aik8d5hxBTVpNjEuwAVTIkNgzUDqCk3vkXz+CThw9GBJwNBJD@lists.infradead.org
X-Gm-Message-State: AOJu0YxYcFCqkaMsBwrXPOZjVmXsXhqz6OvW1xgIcbCFvc8hQnaR4aov
	h417vZqWUUuV3C/aodkNnviQ4l3CNAdlS/O2ZaBLpWD7XhQkaoAtoW8X
X-Gm-Gg: AfdE7cn6+4zc+kjjWlyK2b+zmp4MPo33w+mQ/xT55clac7/fk8XaCsTFHAszII/tUtJ
	Q/WE/zW7QZ7usjxScqHp4xPS9kihLHCtLdNJrylMQ5VxZ+VGrkxqeyXLJ3VpLdqjw8uJQioaG3+
	UexQIgzH96cDXWJBeqsoFgwgcwHYI3sGmX17LDg/GlwMdB535rR0ohnijyTAmg/LFJGZmrmuMu8
	apkXkzya3+IRnWo0/yUvXBR5quK7GL7Xuskrx0wWIKFZykyCKNAjR9vFDECTlsCvI+qtKaz2L2x
	6Vpr7PKdlZEk7lbmu1ud3AYnukcCvHxUqFf22cB34Xm/1NvwgJoZIgwqeSuG8ZMtnrrCtvyX+JK
	6S3T1Vv+sk9u9WO3b7nW9KRzaZh+AumG3iBqBMByB4E5D5QK3sQK5Q6TDUDD2wLt/I1jan6e4CW
	LXO+HJLtgNnFB2quOXzQY04qeeJdj1g7A2X/xBbYuEf8OYRBwQKY0oEG/6cA==
X-Received: by 2002:a17:90b:57ee:b0:380:a5a9:7586 with SMTP id 98e67ed59e1d1-3893f693819mr3074655a91.6.1783520382800;
        Wed, 08 Jul 2026 07:19:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 05/27] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:12 +0700
Message-ID: <20260708141734.578926-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071943_848755_2BFBE4CB 
X-CRM114-Status: GOOD (  13.88  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 8db81d574624..8ef9e70a9316 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -501,16 +502,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps0 : ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				     SDW_SDCA_CTL(func, pde_entity,
+						  ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				     ps ? ps3 : ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps3 : ps0);
+		} else {
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__,
+				ps ? ps0 : ps3);
+		}
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -1092,9 +1096,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0


