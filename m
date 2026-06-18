Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F3CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 04:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCE4R2BOhT+27QO4acZRvKfk/kBv2Crz43/hbhSMkK8=; b=Fro5O5pEkB6cJma8SQqss1QH+S
	PHmbCPLvKUJBg75h3y1OZ8Osbq4fXZo4oFIE+gGx7uXhAZDzT/oPHOIrJY5AU22ib6oL4YxCt09JB
	PcNpKX0TQ+LShVsKjo/E+zsx3/4VmYSzM80UcRfMvK5hJ6Lw9LRUmJ9kAuI52C5zWAQu03jMn6rvo
	8UZIqP53A6df0cVV9nqIS1S1IY/7ZMFjKd4fw9NBY51pLaNT2y+6pjS1bw5OcZpLI5PGypItE/D88
	wTx5uFw3ODtIWsiw0y6nrt+jAjqCe7DYOCaeJKGZcC6fOEsYHH1iDHoixCSBJN/vehridalQzbOpm
	1fSQZkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4mu-00000000cxk-0V7s;
	Thu, 18 Jun 2026 04:55:36 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4mq-00000000cwz-2lNR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 04:55:34 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8453a67659fso234166b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 21:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758532; x=1782363332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCE4R2BOhT+27QO4acZRvKfk/kBv2Crz43/hbhSMkK8=;
        b=ob6IMTX+7g4D72UZ8enMY3miKvKRfIU19at0LUwDQhNEyvSb4EMOszTC59wZ8ddu6W
         b/xbhpMj1n8v3UXvv0of5/TgV0lwUKh+E2gc/vWolBK6FUwnDL7wocyi8ccvagERxnA6
         UGoiOrM8t03qMJQE+US44trokIGdVq+nypqImyBw7tq5CNj9Lz9s28K4rgdC98x/xe/T
         AZLsQVYEuJtzL4ZI9gDKlrD+C0Ea+tBqCXoAgSoJN6r6LSIl1lOCHMgscyP0hzNi97hA
         auR+S5PYcawL7WoE6VkAr6Ixq/iFNrbPeHm+yLXFQR0Ad2V+mIOhEt6mgFEIjeptoGSq
         LyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758532; x=1782363332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCE4R2BOhT+27QO4acZRvKfk/kBv2Crz43/hbhSMkK8=;
        b=YPGmLOjxSOwvDYqd3sGQCAufe+aYnZWtZjJnhk8FTx86csJDFWIeFcSn5VFrv64ZGb
         uY2T9l8iTtoYpYP0/2xpFXcJc3+7RKZlCZIVIjSdrke/6csMbtmdcYpHPGrfZF6Dgzqh
         IoiqSTRRk4L/wcjAhJdnR6ox6II7YW7fQGU3FYS7DGHcDPQKTBRNDV0TlWAcby15x5vT
         sJrO4iz2ciAYt2oe7eOKotGuCJi/LCsIO/Eed3cilymwsoMf/ur+Sp8hfSX+QpU4HZI2
         XK9H4YipoLpGw2R+R/nloNCXBz7ozOEN6WveK/STqcaVmwlgndQm7BQZRdscYxMbAj0a
         afyA==
X-Forwarded-Encrypted: i=1; AFNElJ+1lNOwptgguR985vL7F1ywGmNpHF7oi6oIkqRs1EF81PU5ohTxwEPzSgtLWME6sWglBWq7pI2diWS5bRMp8JVZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr/E1gSMKfXrUndBlXv8XCtvrWtsVoRm9YGpQll06471zg2Ikx
	e9RJ4Ao1OvAvrqtK/5qgXGDDJtM5lMqPOuPG0CTbgQlNCmi9zuiFd5Vz
X-Gm-Gg: AfdE7cnP6OwOiSypK8Yxtib8oqB3FWzVykX4vt2VVOOi1Z6XfKMr85v98W3RJFiNBKc
	A4tEb1a5f1t+WtlBaKEZrV1vtuZgcuosCgknvfBuyAFGiLabbWYDFxVWR0SOnDsvOM4aDFvo2o6
	OH4GwbqvA3HmMao2yLK2J83PsisHJ7ihWWn1r4JCnvFPBmZq0NMWIMz5C7LTPApo7vwCSYirbgB
	TFcI0RqWppiSkQwIAO/6ls4NAvX3C5zhSbkiMqlI6qIfa6ZoNxWlJZXT9PwYqAFP8K2dBHLgi6I
	izcKj6lm18p7Vx0wQTijItrosEaR+rRVZh28MLE28z05erQ9aV4Md9639y8camRQb8sErRURq5r
	ds5EpE/QZqQeIrcsL+a5XFZmRle+H8KdmV8teTg7tg+jhefkAh853SgF+4BAT523zX8ZVF6Rcol
	9JEL02v6zknVqiEmgwkmLhHH73Q4cH/4dGAgfm22jD01elxlY=
X-Received: by 2002:a05:6a00:238c:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8453b3a65e0mr2118875b3a.42.1781758531503;
        Wed, 17 Jun 2026 21:55:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acfd7ecsm18024767b3a.25.2026.06.17.21.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 21:55:31 -0700 (PDT)
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
Subject: [PATCH 56/78] ASoC: codecs: tas2783: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 11:54:45 +0700
Message-ID: <20260618045507.21339-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_215532_731510_0BC8951F 
X-CRM114-Status: GOOD (  15.76  )
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
 sound/soc/codecs/tas2783-sdw.c | 89 ++++++++++++++++------------------
 1 file changed, 43 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 7d70e7e3f24f..763663daf3e1 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -691,12 +691,12 @@ static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
 		return 0;
 	}
 
-	mutex_lock(&tas_dev->calib_lock);
-	ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
-					 tas_dev->cali_data.read_sz);
-	if (!ret)
-		tas2783_set_calib_params_to_device(tas_dev, tmp_val);
-	mutex_unlock(&tas_dev->calib_lock);
+	scoped_guard(mutex, &tas_dev->calib_lock) {
+		ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
+						 tas_dev->cali_data.read_sz);
+		if (!ret)
+			tas2783_set_calib_params_to_device(tas_dev, tmp_val);
+	}
 
 	return ret;
 }
@@ -764,27 +764,27 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
-	mutex_lock(&tas_dev->pde_lock);
-	while (offset < (img_sz - FW_FL_HDR)) {
-		offset += tas_fw_get_next_file(&buf[offset], file);
-		dev_dbg(tas_dev->dev,
-			"v=%d, fid=%d, ver=%d, len=%d, daddr=0x%x, fw=%p",
-			file->vendor_id, file->file_id,
-			file->version, file->length,
-			file->dest_addr, file->fw_data);
-
-		ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
-				       file->dest_addr,
-				       file->length,
-				       file->fw_data);
-		if (ret < 0) {
-			dev_err(tas_dev->dev,
-				"FW download failed: %d", ret);
-			break;
+	scoped_guard(mutex, &tas_dev->pde_lock) {
+		while (offset < (img_sz - FW_FL_HDR)) {
+			offset += tas_fw_get_next_file(&buf[offset], file);
+			dev_dbg(tas_dev->dev,
+				"v=%d, fid=%d, ver=%d, len=%d, daddr=0x%x, fw=%p",
+				file->vendor_id, file->file_id,
+				file->version, file->length,
+				file->dest_addr, file->fw_data);
+
+			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
+					       file->dest_addr,
+					       file->length,
+					       file->fw_data);
+			if (ret < 0) {
+				dev_err(tas_dev->dev,
+					"FW download failed: %d", ret);
+				break;
+			}
+			cur_file++;
 		}
-		cur_file++;
 	}
-	mutex_unlock(&tas_dev->pde_lock);
 
 	if (cur_file == 0) {
 		dev_err(tas_dev->dev, "fw with no files");
@@ -917,22 +917,22 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 		dev_err(tas_dev->dev,
 			"clear latch failed, err=%d", ret);
 
-	mutex_lock(&tas_dev->pde_lock);
-	/*
-	 * Sometimes, there is error returned during power on.
-	 * So added retry logic to ensure power on so that
-	 * port prepare succeeds
-	 */
-	do {
-		ret = regmap_write(tas_dev->regmap,
-				   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
-						TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
-						TAS2783_SDCA_POW_STATE_ON);
-		if (!ret)
-			break;
-		usleep_range(2000, 2200);
-	} while (retry--);
-	mutex_unlock(&tas_dev->pde_lock);
+	scoped_guard(mutex, &tas_dev->pde_lock) {
+		/*
+		 * Sometimes, there is error returned during power on.
+		 * So added retry logic to ensure power on so that
+		 * port prepare succeeds
+		 */
+		do {
+			ret = regmap_write(tas_dev->regmap,
+					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+							TAS2783_SDCA_POW_STATE_ON);
+			if (!ret)
+				break;
+			usleep_range(2000, 2200);
+		} while (retry--);
+	}
 	if (ret)
 		return ret;
 
@@ -965,14 +965,11 @@ static s32 tas_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 
 	sdw_stream_remove_slave(tas_dev->sdw_peripheral, sdw_stream);
 
-	mutex_lock(&tas_dev->pde_lock);
-	ret = regmap_write(tas_dev->regmap,
+	guard(mutex)(&tas_dev->pde_lock);
+	return regmap_write(tas_dev->regmap,
 			   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
 					TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
 			   TAS2783_SDCA_POW_STATE_OFF);
-	mutex_unlock(&tas_dev->pde_lock);
-
-	return ret;
 }
 
 static const struct snd_soc_dai_ops tas_dai_ops = {
-- 
2.43.0


