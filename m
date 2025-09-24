Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB5FCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pL2uoqzypHbRpbvTBPNzb3YECUS6GHGmBJvJaUK0ytc=; b=fP3J++Be19snS1u0LJD2YPaWVj
	1YNyrWsuGVOkaXQ50TDZidSMjlfHC0b89hVFxFMOpq6AyorN6M0LD+zbobhW/kCH37EZxjK10gV+m
	4C9V20X8uXoLdhKXuS26ZRpHvsSpvAJkYR/NNHSjgmJP/hWxr01rInOsIsIsMv12WK54yyThtn9EH
	y8Z9Zwl3CxVMNZDCCmVR5cOOzgg6HIbdzT3p+T4nP4IKmWh0zplm3PbvUi/kygc+I9Ofm2m/HEj4c
	f+Z9N5IXB57W4ToXYLwNyPTTKwTFpYNTpPoOytrf5cd9PYEEU7egXdG8TzKFn0jc1akvrzTjLlO0m
	ROVxAzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MYJ-0000000GPuN-3EvK;
	Wed, 24 Sep 2025 10:16:47 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MYH-0000000GPrj-008Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 10:16:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso10716407a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 03:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758709003; x=1759313803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pL2uoqzypHbRpbvTBPNzb3YECUS6GHGmBJvJaUK0ytc=;
        b=W/15yqEz6daAGTu+MfWExEt8vebVciYf1c972GmPtkaysqhrDRMWpXu6z+VZ+s4KlI
         fFiqJ4EdZX64hXxDqwBFMf4GJ5kV7xS9Qnw87S3dLNMy8ymAqx2frcj8rTPodAkuZKNa
         Vqiffi6HhlK8X3i2cjASmAsrNAGUn7mOroSgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709003; x=1759313803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pL2uoqzypHbRpbvTBPNzb3YECUS6GHGmBJvJaUK0ytc=;
        b=E2M6KGGP5891EYftBoiPHIY23mTvkYPZh5B21H+Qez+mOcmEMnF8hmMJpSrKs7yaIK
         6/kfj37ZskRlObs1P/ZBBU/2K8dlkOSWEm6XpLDfVbEZ7nTNaVBJXe0OSZrON33YkzEr
         jDReiEL8V+iyKhPvzqA74+IJcpYlw9Rmfs06aVF345fhWy8xg/VkCDoxM1JEXBJwA/gg
         ci0fN2+foSfIakQSqvUQ1tiV4NJBZ0hLZT9VcZXsHo+Irr81msDjPN6Q72amEeMYJ0il
         +snIMwaZX6zEMFB33fyilANwsR6iCAiWGBSyNv6U5J1SO/woRz0sGreO0uT/aTq3Jya4
         uGQg==
X-Forwarded-Encrypted: i=1; AJvYcCUmhgFZP/h40AKiHlGcXddgBMi9/Qiz7eIVwtx0KS3O+uKS21ehGe0DHZlepUQWXM3QX8nLLvUIfzGkG2VpGEHW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe56HT1+nMi+8NtFZU3w9lNnZNzm/MWubTtquqcJCVMk5efevB
	JZADB20sqx+GKD0bM0lTK8pcSKWKTjsACaBIuhEH/Q1vg9PtnQVy5FqqvzTvBLrNytU=
X-Gm-Gg: ASbGncsr/Njh7oVfxpEVh24eLzcNm/GtTMEq0Sti3Zd4QjjNQQdnDu8XxEXH421y4f/
	EhRvLLR0PrcCNk4XrzSrxvZhAFQrO0yzwDApo/uvnNjrBJ4OO1B3pPAkrLrJe/zSmg7Y13z+IXD
	fXpLWBhQG8QbgcRooc3Rva6Wcj/g6mu59pnoKnG4hd8x97PuKzx/TFUO+hQL3ylyBPyzPcZBb7N
	3Mum9Vf9anFxIi3eMkYENz5rVI0itbBoxBzXXSzuOAJWQWGDHZD9aD6raOrdLFsijrjDJAXFuXO
	JrGd91L5Un+N6OiAgXqAh0FSkV1QpNm4oYT24VuBhxo4q3pTAM9dqJizBkqX0nR2uq9gbLrf1BS
	3hAyg07O3cyhTmzNd4O+CI3v35DdYRYJxprEowXbADL6Rg8kM5mLKRmhlQn37fADAEbVuPjCkLs
	V2HLweICYRzHXEEr9rN1duhLUwCJPoWAP1LW7xeGkm6nhMkw8ORHUvOUrnahjiAQJ/pqMxAA==
X-Google-Smtp-Source: AGHT+IHOIaPIXlWeLkZKenFEtjzYGIM9G3O+kz9aBGgbCcayPpzFvqsW2MirypYhSn7F+tMkSctIcg==
X-Received: by 2002:a17:907:1c10:b0:b2d:d73:de59 with SMTP id a640c23a62f3a-b30263b7c73mr570377266b.9.1758709003021;
        Wed, 24 Sep 2025 03:16:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28d206bd13sm949712766b.31.2025.09.24.03.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:16:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/3] ASoC: mxs-saif: support usage with simple-audio-card
Date: Wed, 24 Sep 2025 12:16:25 +0200
Message-ID: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_031645_246085_6ECE4752 
X-CRM114-Status: GOOD (  22.05  )
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

Add support for enabling MCLK output when using the simple-audio-card
driver. In the sound/soc/mxs/mxs-sgtl5000.c use case, that driver
handles MCLK enable/disable by calling mxs_saif_get_mclk() and
mxs_saif_put_mclk() at probe/remove. This does not happen when the
simple-audio-card driver is used. Extend the mxs-saif driver to enable
MCLK output in that scenario.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 sound/soc/mxs/mxs-saif.c | 123 ++++++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 33 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 3e3a62df3d7e..a01a680ad4d7 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -24,8 +24,79 @@
 #define MXS_SET_ADDR	0x4
 #define MXS_CLR_ADDR	0x8
 
+#define MXS_SAIF_BUSY_TIMEOUT_US 10000
+
 static struct mxs_saif *mxs_saif[2];
 
+/*
+ * Since SAIF may work on EXTMASTER mode, IOW, it's working BITCLK&LRCLK
+ * is provided by other SAIF, we provide a interface here to get its master
+ * from its master_id.
+ * Note that the master could be itself.
+ */
+static inline struct mxs_saif *mxs_saif_get_master(struct mxs_saif *saif)
+{
+	return mxs_saif[saif->master_id];
+}
+
+static int __mxs_saif_put_mclk(struct mxs_saif *saif)
+{
+	u32 stat;
+	int ret;
+
+	ret = readx_poll_timeout(__raw_readl, saif->base + SAIF_STAT, stat,
+				 (stat & BM_SAIF_STAT_BUSY) == 0,
+				 MXS_SAIF_BUSY_TIMEOUT_US,
+				 USEC_PER_SEC);
+	if (ret) {
+		dev_err(saif->dev, "error: busy\n");
+		return -EBUSY;
+	}
+
+	/* disable MCLK output */
+	__raw_writel(BM_SAIF_CTRL_CLKGATE,
+		saif->base + SAIF_CTRL + MXS_SET_ADDR);
+	__raw_writel(BM_SAIF_CTRL_RUN,
+		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
+
+	saif->mclk_in_use = 0;
+
+	return 0;
+}
+
+static int __mxs_saif_get_mclk(struct mxs_saif *saif)
+{
+	u32 stat;
+	struct mxs_saif *master_saif;
+
+	if (!saif)
+		return -EINVAL;
+
+	/* Clear Reset */
+	__raw_writel(BM_SAIF_CTRL_SFTRST,
+		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
+
+	/* FIXME: need clear clk gate for register r/w */
+	__raw_writel(BM_SAIF_CTRL_CLKGATE,
+		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
+
+	master_saif = mxs_saif_get_master(saif);
+	if (saif != master_saif) {
+		dev_err(saif->dev, "can not get mclk from a non-master saif\n");
+		return -EINVAL;
+	}
+
+	stat = __raw_readl(saif->base + SAIF_STAT);
+	if (stat & BM_SAIF_STAT_BUSY) {
+		dev_err(saif->dev, "error: busy\n");
+		return -EBUSY;
+	}
+
+	saif->mclk_in_use = 1;
+
+	return 0;
+}
+
 /*
  * SAIF is a little different with other normal SOC DAIs on clock using.
  *
@@ -48,6 +119,7 @@ static int mxs_saif_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 			int clk_id, unsigned int freq, int dir)
 {
 	struct mxs_saif *saif = snd_soc_dai_get_drvdata(cpu_dai);
+	int ret;
 
 	switch (clk_id) {
 	case MXS_SAIF_MCLK:
@@ -56,18 +128,22 @@ static int mxs_saif_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 	default:
 		return -EINVAL;
 	}
-	return 0;
-}
 
-/*
- * Since SAIF may work on EXTMASTER mode, IOW, it's working BITCLK&LRCLK
- * is provided by other SAIF, we provide a interface here to get its master
- * from its master_id.
- * Note that the master could be itself.
- */
-static inline struct mxs_saif *mxs_saif_get_master(struct mxs_saif * saif)
-{
-	return mxs_saif[saif->master_id];
+	if (!saif->mclk_in_use && freq) {
+		ret = __mxs_saif_get_mclk(saif);
+		if (ret)
+			return ret;
+
+		/* enable MCLK output */
+		__raw_writel(BM_SAIF_CTRL_RUN,
+		saif->base + SAIF_CTRL + MXS_SET_ADDR);
+	} else if (saif->mclk_in_use && freq == 0) {
+		ret = __mxs_saif_put_mclk(saif);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 /*
@@ -238,34 +314,15 @@ int mxs_saif_get_mclk(unsigned int saif_id, unsigned int mclk,
 					unsigned int rate)
 {
 	struct mxs_saif *saif = mxs_saif[saif_id];
-	u32 stat;
 	int ret;
-	struct mxs_saif *master_saif;
 
 	if (!saif)
 		return -EINVAL;
 
-	/* Clear Reset */
-	__raw_writel(BM_SAIF_CTRL_SFTRST,
-		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
-
-	/* FIXME: need clear clk gate for register r/w */
-	__raw_writel(BM_SAIF_CTRL_CLKGATE,
-		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
-
-	master_saif = mxs_saif_get_master(saif);
-	if (saif != master_saif) {
-		dev_err(saif->dev, "can not get mclk from a non-master saif\n");
-		return -EINVAL;
-	}
-
-	stat = __raw_readl(saif->base + SAIF_STAT);
-	if (stat & BM_SAIF_STAT_BUSY) {
-		dev_err(saif->dev, "error: busy\n");
-		return -EBUSY;
-	}
+	ret = __mxs_saif_get_mclk(saif);
+	if (ret)
+		return ret;
 
-	saif->mclk_in_use = 1;
 	ret = mxs_saif_set_clk(saif, mclk, rate);
 	if (ret)
 		return ret;
-- 
2.43.0

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: microgea-rmm-audio

