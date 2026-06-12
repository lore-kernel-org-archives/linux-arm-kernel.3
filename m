Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBB3CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=; b=TfJE+n6P4/3mm+f4IdA47ZGSS9
	zGIHc9bGplfRi00hb6AMsmwQRhOc+zu7EBnSDrbc2jnkBom2rOS2DlQSbf7Bb4woZcYWOzJSX+VeU
	5ZFqdrEThPXudE5eWwOT4yrfodA8ZddJ+CRTtMF6OqDpvgbxeWoTjuqUIZftwQEpEaeaDa/uu5sl/
	AYzrWHaNSEGsDSkIFmEN2N9C/k8g07+oS9CaLPN7gc+YaRLDZdp1fmQJ/CiViH6Su7rDIeNcov3bD
	QZHnUTkQW6QIECtRZC9PovxkpgNrbal81iuZby7lzoDtg+iwKGm7KfGtZwkkt5ZSNB0Ke7wArHuit
	MMoClttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1un-0000000Ay4V-1GjV;
	Fri, 12 Jun 2026 13:27:17 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ul-0000000Ay38-1HMD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:16 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-304c520fe9aso2114093eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270835; x=1781875635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=a3mNP6a7dM2lnV60yTqfivkCFbDN5ggAEwLth9d7p1nH2hSyBJp4EUDuPGiSoeWUV/
         vgdStX/tWcNBMfHne22xBdWgtgBRZHm+8sWn3a74IjtUKx5AdegSLTAvtiSNh3xTlLAy
         nLMtcWOPJVxWCX3BjxXYiiOBtKa6jLJS0Ip0QZS+PLk87OKOWAPieK+hHziF7MUxV1QQ
         huAbYAC6pSTDN4inDaxUdjNmKZ7b1S3ubRwZLCG0fqWPaQxdEg5QG2yKuQXhpaaSDy8/
         5atrWaiWxAqix+DvJwXyPcuusgh2YPB8MUTG18hUI/BEey6rrM1Dj74K9jEjuCV0F+Wc
         eG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270835; x=1781875635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=ZeOzfKjNAvu9BEhXEP5w6hKIORYsaPGYy92q8jbH0nhVxtuPF5Lx2k4nFl4orO+FQc
         Xj6KHNmZvnM2ZRo+h6Lg5mv0ug8gxmE+lPepG42gbDsALpBOmxo375V0UGlevz2Yn4sF
         jxB68KF8tosJi8vo4kFt8d8K5ahmR8BgCi7kwVmfFGNr8LzWge4NbCTjVFXv4gUvFHFS
         mGVhIj0n9dpF6cR/bNKBPTzUN9yf4ZyUv/T7ki6JpsEGb7GaEgtyGWYv3AB+M0AhJsHi
         hq7Om7d/FW8pBjil4JEhLnp/cbYGm5wKHUL/Vss5q9OXHrGM+vS58YNqEr9R3pkbw4Bq
         SnDg==
X-Forwarded-Encrypted: i=1; AFNElJ/7hqrBFgRtNx7M3MKWARubPAp8epyIPrvpyDmeZLrqfXL+8a8cnOK3GBVZWyTdLrQNgvUMkf9aqSaRFd6RCHCE@lists.infradead.org
X-Gm-Message-State: AOJu0YzcmkbY0MHGXhDwfAH1dEPjZ89q6mSAmY2LbyAidVzZqB0ls09U
	efx0uM7ormoXICZhjcrQArls/PMKVqfBeUCgTh9A8ICWLohWNBrDoair
X-Gm-Gg: Acq92OEoh2Md0Q0uoJSfJDPlTo1MIx5TxD3vekfM5fIPIV8GwLiGOkevHlBqINUDd3a
	cHbvLwd/yRsRRsBQj6f4BHb5YkYtx3Tkak1vGBA14/S8XmRxe+s2i6ro/DljwM/BVT65wyBPz47
	HAg9IqyD2LtW5ZJqA+AL1dWdquQ3b+cV+ZffiDA7ajGR9uq5kO8+mQVVL9qpg2DcUXYi9DI7KfO
	pJfvupREQijg2JzBHLEXLuYKyxkXUQMC/wz2gg3F+F/W3VbICN7tM9KAPBCGTn5p5JG6//30fLo
	LwjjA32VrclfIbKRjEpUr0u7c20ySU5xPYifFcpbmksTrI3G6wv/Z7CGFGsyYb0ULqsPv3MJW+p
	/fAkV26+CwOPjHGbOBdpKoJRjN++W3v3EAKDJhWPwHS6rOOatiaJB8cydD/OIT/hlKRJvzLFUy8
	pNR2s3yRpJAjSiZKGHE8m82JFzLmTY/BomBoK6vXt8e21iToEzjYzOFrKsM/FRap+EiDR9
X-Received: by 2002:a05:7300:ec09:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-3082021fa5fmr1811315eec.35.1781270834683;
        Fri, 12 Jun 2026 06:27:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:14 -0700 (PDT)
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
Subject: [PATCH 03/11] ASoC: fsl_easrc: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:31 +0700
Message-ID: <20260612132639.78086-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062715_362327_27DCF61A 
X-CRM114-Status: GOOD (  15.06  )
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


