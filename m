Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8C5CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=; b=dgwVNGvSidmlyuV8bF9ZprjSG4
	KtPcqsZZWRw7QfDtXrnixRvXhcJtfUEBWLO73cD6qHdsc94EM4z3I+eziP0SAuzztcOeNtptDCGuO
	+Lfr/UN3i8ZHOPToyNVv8gQohrlvdcFK8MdSnQt4n2uUsvwkgxb9R3H5UCEtDA+bsohfK0CadWcED
	bMbasJvmnKTDK5A7yvQp0HM95hl1MZ8jZS2qYescs8UnumGDowI+r/PbkFnVD2zBmgWvB17zSXuIs
	s/+qEnh/CwU9EOUuF7l1IOSuZ6eYoatvLadcFj28S4WWuYpGFg0NnV9ZkW7YVDnXipGcqqltwBy37
	cEnINdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfS-00000008B3J-0I8m;
	Fri, 15 May 2026 11:25:22 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfQ-00000008B2R-1fjm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:25:21 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso3873241a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844320; x=1779449120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
        b=sfVPjrKtMe1SEAbjlUgScdPoXxpdEGWUN/OEBBjHwfhscJqWLwFxDgcX8/fCNUC26w
         LJa+e0HZzLtInCmRM2WyxHdHf5zNGRIzKWJnj6ileKYlXk8aUVoyisZBvnCfGl4UJp9b
         9Fp41XJCxpkHc8yvVFr9QvQt58qiZ/YClIA009/eydpdaNQ3fVdC2YBckTVm4EL8JEgN
         wQACpX/iDxKa/9I2fb8wlb5qc5XIMdB+iNG9OLW41x2owf6MZ+cwTYPrdf+A3Z1k1R2H
         2E5UhNglqvXAqhn9wxzwsRDaqNfvTS7sZqAmgRh3B5adL635/2OcVSU8n3/wH8LEalvI
         HH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844320; x=1779449120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
        b=HPell/I/RZBkilw9EkXFLpQfnXfHX69XS9Pt3jXxsqfpfSr06eAZuAVZHQaYjAIl8V
         DOj4SRG2gMALxDq2HTfk/7zy14q5QO4WtwzF4ulPWdK2YteD5TKM25amJ5nD0ZqVDhIT
         FaCHt0KRQZtPIxrctLPitwd6+wK/56SUff8x/g9+IJzQXAl+chBbQxgtCRmEJbUCXTgt
         VDXePHnwa7Wu9Xk7N46HRVqUEn1YMz0LM2yVu/jzHFZMH4AENF3XsmkZWuCAs3UZ2Hv6
         0YI2WVPxU8t3/OuhgE+UBFBex978vGc8KEv/8QlGe1hiCkdUBH3QnBjZvvoFjuHubAGg
         Fjyw==
X-Forwarded-Encrypted: i=1; AFNElJ9EA2EZnqDZL82KIyguxZTZbDHmWqjbQvKa/ywecBdbta4y8PJlyqG2LQruCt2TghFBORtqa27aR97VNcVt9rGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzkvXAlD6QB6I396KJ/LbFyb54hLXisEt827RYca2eIG2d4b8Xh
	AOMnBCbrC7nA2ybuG2JjxdcU9mTbR1+1QHCTFIrPjq/DyAX3o+VYT8mF
X-Gm-Gg: Acq92OH2a8CObFXK9STpwlsaMyo73aL3PgRGbe/ZIPfCDcnxBxxiXIiLG7u0PDsYyeL
	ohqfNlhW2a0SE/OHeji1wQAOPo4bjx51P9hNz8qEsJXp3KnRrTbriN9Kjmqgh6R3QUl7IIL8I+S
	+dmotEf8Y7Dl6+Gr5FjKZ4Q/lZHaTkdktvQeNAEPeew26FNWCui5e7eepHW3kAPWXNkkioPfAiF
	MqcaY4RDRw3PTsNjwwj/r4ngG0wjMCsgC9ReQq6IiD0kE58VXjbvzpUSwyX2SU241EMqcjCnx7L
	63Stp4pxXLxCoF1JUQVE5uprddjuN3tGkfTpu/FHbUsZ5rlh/pVReS2aYbkpwQQJF1FhvxBcj8I
	VlZtsnk08nI9Yf0PsNnYpj5kQu3pp1SiwGVUBzUMc0VikcQ0Qb3Zgj3DgQ8FduKMt38Ci9A2hxu
	ONY2Fsck2BQX7di850BwMTxjWaMtxT4yqsMRDIw5sggJM6SnTqOjnAJZgjeEko/ZV4ZDPw
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr3533751a91.23.1778844319586;
        Fri, 15 May 2026 04:25:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/4] ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
Date: Fri, 15 May 2026 18:24:55 +0700
Message-ID: <20260515112458.34378-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_042520_440912_5032431F 
X-CRM114-Status: GOOD (  11.51  )
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
 sound/soc/stm/stm32_adfsdm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 0f6d32814c22..a585cb9fc011 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -62,12 +62,11 @@ static void stm32_adfsdm_shutdown(struct snd_pcm_substream *substream,
 {
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
 	}
-	mutex_unlock(&priv->lock);
 }
 
 static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
@@ -76,7 +75,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 	int ret;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
@@ -88,7 +87,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	if (ret < 0) {
 		dev_err(dai->dev, "%s: Failed to set %d sampling rate\n",
 			__func__, substream->runtime->rate);
-		goto out;
+		return ret;
 	}
 
 	if (!priv->iio_active) {
@@ -100,9 +99,6 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 				__func__, ret);
 	}
 
-out:
-	mutex_unlock(&priv->lock);
-
 	return ret;
 }
 
-- 
2.43.0


