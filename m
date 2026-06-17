Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CB4CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=; b=T5AlR60n0klZZQN83g9x2cj/+9
	MWFx5SqTn2G7oMPy+pTSzP7iNpTGTs7GzsnCsq/STcJ+NzP6Hewd2zdfTjAMBLWVYCUoiMk9mDye3
	+GYeHyoJRe2MPoe1ycN9fRsUaXEWrtxKm4s3xwUyOldEQVl2iry1dnfTQ1MedOSgFG2I5ICJq6yQR
	scxxW6XHmrB1kSSc7rnWj09ijzG4d+RGHCrIeBGV6cubEz511MHD3ANk56EEIDSGlET2+OjjD581J
	Im9pVf4o0n26xeu8lxfcSIFOvmKP/qT0Uu9jmDMjFhNBL9/EzGQo7LqzLxF+zXthAhUwZszIkddTW
	mFDxEotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbZ-0000000H4ih-38kU;
	Wed, 17 Jun 2026 10:34:45 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbW-0000000H4fa-1sxB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:34:44 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-307d0405e07so8456634eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692482; x=1782297282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=bs/f+x/OSQ3ovw5Y/XlzNfoU0NRm/nPbuINTKuLajlg/41flRNWubucyOM+Ibo7BV9
         YAAjIQiDVZJlcK99Ua5eayVfOjHyC5W/eQvdfyVGQRghViLMRoLmk7o+I+3lsP8fJm7j
         CCBv0iZddqcuH57mIw83tZWAvBKFKKUkP/fE/9rvRQklQ4PGWeNjhKIBq/mP2MYdWgit
         SUHXqeUZegN0oOkUko8h+UOQXzSsmSQQ6iri0SXtiIEGorch0/udxboqacnMNf/bWwJX
         jJYNHAoIgLRA3cQfXraXUIJl8kiTZLyiz9Mg4jXvIQNJUMwO97CZGTvgmb0vTrfbiLHq
         254g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692482; x=1782297282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=XHyDVJ6BOdl9Kb6wKTxT6WFjGZAy7pnGuaCRcXTyzARA8HXcXdS7SJoc/rQj7Zhi7f
         5cVPd2TUNiHSbCbVwWgYRX9Kd2/lsjQc0boG74bMrwXnUtuZ20L4pA6jA6QkKoBiFajb
         daACTGIRvWACS87coSo8Id9FJCQpJfpPR1ORLnQlpft4jAf0ZRc70RcJ8p4ECfI29e7q
         nRV3b3S6Bdi+ZEDU3Sr8XrVufREohtiw9T3JUImMS58eQ0bbUt8TO757G9CA+0O91+XP
         3Ll2sZ+W0yiZfewEKi+3jVdgyGThkRii7ArSw0tuUUqLP1XM+pwttSLLiN4Ffj/dMYlX
         DvwA==
X-Forwarded-Encrypted: i=1; AFNElJ9G3LJpg4c56Yr4leQVlVUcnaI/gQemxgGlhjN7jbOWulxLmKTcbcN5rYilWZssneQGs/XyVPhG3fsBUN1/kEIL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+FEM0Ptl/yh2j3jW42LVBS0Nx2XkjATBZ58iJagaiV0EOwTRu
	wQRfBJAdLC0iy5B2NaG4yRYPO7EZHZuzFm9M6ObjZVrGZAPgtBU6R3Ol
X-Gm-Gg: AfdE7cnbtCdDWT2ig6V5CT9ZmdFVvOlCRQ5Q2a8X8I+lQQ0Sff0pWV7Tb5sGhc7nnFA
	fpu7bzZlnKnKxRqr2CnSVsQSAqyHLXOy9tQoaoa4rBXbnPGWnjlDcVBSxNzN72ls/H6BuAV0y6n
	YFabB5lIAA+qdiDA+l6gJg2EjzuXJduvWTWzVMkjjxoTwVjq/EWs/PRdA8HHFa5SmN/TxYR7aFy
	1XlfCQyhG6h94rrnJ7BO/IbeCfVP1lbc+vi7sDn/ITCuoZjVzNBglSQ0XVZKuZm5s7xfLx8Pzgm
	LlOs1TL2diu4TbY4U4npoD5NtYOIGtXeY6M5u3tqAhA66V/E52ECuNdC4BX+p8rWTnupn4YAbWb
	Hg9zqkKwh8yZPg5d7CiZ761sEYyv0LUKa18WXs+COXT8Zjbpt8JYrwfICLJifiskTvV+qYsLua7
	hOOcClNeHQHMPguyEtdNj8AjJ8H5fcIEC9lmZWJsqERUcr01s=
X-Received: by 2002:a05:7300:6d15:b0:2ed:b131:240e with SMTP id 5a478bee46e88-30bca0dabccmr1625180eec.23.1781692481713;
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:28 +0700
Message-ID: <20260617103235.449609-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033442_494166_971788B2 
X-CRM114-Status: GOOD (  11.17  )
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
 sound/soc/codecs/cros_ec_codec.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7dc5a7c3ca96..c522bacf06de 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -608,10 +608,10 @@ static void wov_copy_work(struct work_struct *w)
 		container_of(w, struct cros_ec_codec_priv, wov_copy_work.work);
 	int ret;
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	if (!priv->wov_substream) {
 		dev_warn(priv->dev, "no pcm substream\n");
-		goto leave;
+		return;
 	}
 
 	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_AUDIO_SHM))
@@ -624,8 +624,6 @@ static void wov_copy_work(struct work_struct *w)
 				      msecs_to_jiffies(10));
 	else if (ret)
 		dev_err(priv->dev, "failed to read audio data\n");
-leave:
-	mutex_unlock(&priv->wov_dma_lock);
 }
 
 static int wov_enable_get(struct snd_kcontrol *kcontrol,
@@ -895,12 +893,11 @@ static int wov_pcm_hw_params(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	priv->wov_substream = substream;
 	priv->wov_rp = priv->wov_wp = 0;
 	priv->wov_dma_offset = 0;
 	priv->wov_burst_read = true;
-	mutex_unlock(&priv->wov_dma_lock);
 
 	return 0;
 }
@@ -911,10 +908,10 @@ static int wov_pcm_hw_free(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
-	wov_queue_dequeue(priv, wov_queue_size(priv));
-	priv->wov_substream = NULL;
-	mutex_unlock(&priv->wov_dma_lock);
+	scoped_guard(mutex, &priv->wov_dma_lock) {
+		wov_queue_dequeue(priv, wov_queue_size(priv));
+		priv->wov_substream = NULL;
+	}
 
 	cancel_delayed_work_sync(&priv->wov_copy_work);
 
-- 
2.43.0


