Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E0DCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=; b=oaGsyuvLC/cKmzFA1EkblrUXfb
	6DOLhT/Mri1qfCjk4VCIZDM4kxrP1O+2NqF9qThI6To+fFxrzWdAPG6sMhKFAlsAon51FmKV+zwhd
	/M69lM1fB8ldKzm9LV/RzCrgeBmAM3cemOaYEPD4jDIGr6rIWBBTiCVZwlhgNDGeGCYjGD/SfsZ1R
	FYRZcsGIdnkFzYYhJAow3H+SqygpxCHB7Ue2E8Oq0+ZvMjljF7TObCo1df9I5gVdjXb5hReFC/hCo
	OLAlVlQUKdYtYNJzW2JPb25t0RqEV32TLTmHGW5I1vxdd9kF49hRMx7kjPxvceyEOoer9hDa4w2DA
	EMe4fQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3nL-0000000Dyi6-23a5;
	Mon, 15 Jun 2026 09:39:51 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3nI-0000000Dygi-3Vs0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:39:50 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36baec934b6so2121489a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516388; x=1782121188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=KcRwsjsUt/xGdSlqROY+/vtCVWAeGq7Z50ZbJVbB7KiqQj8Dr346eG3Xop9U/h7YvP
         7sbR0HeSiEQ++keJoiqvwCBttlFDxl2C2OYryTbdk63TzOwISH8z+4Bl4R/ZRQdWapSM
         tCtYrNQ335jaA3zg9u8fXsnxvNSR7hCbs5icrPAH00MiXADA5YILzQwvPR2jz4M0f49s
         /RkmIaE8kqKppJP9xDfIWpkopPSeAjP5Gn9DMcb6ElI9v+3K+AUclSGyT3BDmn26e3Rd
         Ot3crueUp8K65Kzh2h7QnGiw6M1xWVA2si15x+/l8z06OOShVW3/Sa0oTJrSkM5YfQZb
         3R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516388; x=1782121188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=STyDw/0UM2X9M1CpsXot3Cg0glP5pyVnm6M2erbU660akJf1vH+lCJBN61CyzFeV/1
         L2E4bbHdehu97atQVDf00Zxa1Y0zSS/dqjqZ1zEp0ACmTTpMdPoPIYXUYoCOEUGXjtw6
         deRCd3IcSNHkAKgxluhrfFdGeJXnRIO87BbjizAL6UuVKKHEUHNaffLPKghCDus3QljA
         SeMV7gXHTn+OqyFCFbx/yCM/9eGbyYaMg85/buVxnYOvHmqgzDGxnO3TOphmkSJcEK8Z
         uE7IB+K0BXLILi2cq3ZxzjOlSk0hP2vEW7M7Fb3Jd+JQHyq8kz6iOc0A4HtYsHiqKah0
         mshg==
X-Forwarded-Encrypted: i=1; AFNElJ+zyCzaDNoknm7wlvtw8ktSd67aEEV0m9RPRPKle43JExdOVUEeFehfuxkY60MWcE+xFgSYuyeIeZKUAeNvh24j@lists.infradead.org
X-Gm-Message-State: AOJu0YzzFGR6aezvxLCyFjeWDzx+khCf3p7IqWjzc1z1XZciIyAvwcbs
	zptZtXmnmojfl+dYql9OULNhDbIDQNmXDmHqt5BbaEtmi7sSUGlk3wa+
X-Gm-Gg: Acq92OFSj72/dvKZjexCo/x7Po1DJpyLBd0PGf7ZklVbzar5mCRoccP0bEEqiX4ejFv
	8phtBjrhE2lc8DbfI7TfGMq/rWc3UJumOfV79zSEa3qlCnxhddt84T+TIrorH9n4R47fSeuScXE
	2Gc34YhrLbnuvKxxKTivQjvvRac5rR1h3l2zHoWa6LuZpaag0Ifu5pwIUBdM6PwJcmPAqiSvHa1
	POBd53aUR14I7jfyDMX7r8t9nHsUSSatc2gkfqec5zJwP3K3ARZIM9/+oqbucT/3MlNrUmsPyBV
	oDShjO9E/YZoT4L0o2jtgEZiWItpIQmTpauz+woaBr3EtHsUIb6vxJneA7dLSs7HCTulJOAi+S6
	aMEqnXEfVq4Nsy3oS7SDd9XSsw0cl8jnuutVXl5jaIrl84IvaE7knOJzpHvN6tdj90amNa1EgYE
	HCJUSjW9PAFaaXnYb2YrRWMM6dzgp8hzvMiKn3fYWkehNdNF2oY0pjYS6TBA==
X-Received: by 2002:a17:90b:1d8a:b0:36d:86a5:5b8 with SMTP id 98e67ed59e1d1-37a20016cf1mr10407905a91.11.1781516388272;
        Mon, 15 Jun 2026 02:39:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 03/11] ASoC: fsl_easrc: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:16 +0700
Message-ID: <20260615093824.115751-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_023949_416222_84CFFC1D 
X-CRM114-Status: GOOD (  15.47  )
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
 sound/soc/fsl/fsl_easrc.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 114a6c0b6b73..edfd943197a0 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1025,7 +1025,6 @@ static int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct fsl_asrc_pair *ctx;
 	struct device *dev;
-	unsigned long lock_flags;
 	int ret;
 
 	if (!easrc)
@@ -1053,9 +1052,8 @@ static int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
-	ret = fsl_easrc_config_slot(easrc, ctx->index);
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+	scoped_guard(spinlock_irqsave, &easrc->lock)
+		ret = fsl_easrc_config_slot(easrc, ctx->index);
 	if (ret)
 		return ret;
 
@@ -1301,13 +1299,12 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *easrc = ctx->asrc;
 	struct device *dev;
-	unsigned long lock_flags;
 	int ret = 0;
 	int i;
 
 	dev = &easrc->pdev->dev;
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&easrc->lock);
 
 	for (i = ASRC_PAIR_A; i < EASRC_CTX_MAX_NUM; i++) {
 		if (easrc->pair[i])
@@ -1331,8 +1328,6 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
 		easrc->channel_avail -= channels;
 	}
 
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
-
 	return ret;
 }
 
@@ -1343,7 +1338,6 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
  */
 static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 {
-	unsigned long lock_flags;
 	struct fsl_asrc *easrc;
 
 	if (!ctx)
@@ -1351,14 +1345,12 @@ static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 
 	easrc = ctx->asrc;
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&easrc->lock);
 
 	fsl_easrc_release_slot(easrc, ctx->index);
 
 	easrc->channel_avail += ctx->channels;
 	easrc->pair[ctx->index] = NULL;
-
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
 }
 
 /*
@@ -2292,15 +2284,13 @@ static int fsl_easrc_runtime_suspend(struct device *dev)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(dev);
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
-	unsigned long lock_flags;
 
 	regcache_cache_only(easrc->regmap, true);
 
 	clk_disable_unprepare(easrc->mem_clk);
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
-	easrc_priv->firmware_loaded = 0;
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+	scoped_guard(spinlock_irqsave, &easrc->lock)
+		easrc_priv->firmware_loaded = 0;
 
 	return 0;
 }
@@ -2311,7 +2301,6 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct fsl_asrc_pair *ctx;
-	unsigned long lock_flags;
 	int ret;
 	int i;
 
@@ -2323,13 +2312,11 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	regcache_mark_dirty(easrc->regmap);
 	regcache_sync(easrc->regmap);
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
-	if (easrc_priv->firmware_loaded) {
-		spin_unlock_irqrestore(&easrc->lock, lock_flags);
-		goto skip_load;
+	scoped_guard(spinlock_irqsave, &easrc->lock) {
+		if (easrc_priv->firmware_loaded)
+			return 0;
+		easrc_priv->firmware_loaded = 1;
 	}
-	easrc_priv->firmware_loaded = 1;
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
 
 	ret = fsl_easrc_get_firmware(easrc);
 	if (ret) {
@@ -2377,9 +2364,6 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 			goto disable_mem_clk;
 	}
 
-skip_load:
-	return 0;
-
 disable_mem_clk:
 	clk_disable_unprepare(easrc->mem_clk);
 	return ret;
-- 
2.43.0


