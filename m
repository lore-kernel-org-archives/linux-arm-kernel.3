Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0E8CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUF1nUSK8JjVFEerCymxn+O2TFW28hvbz/kOFuEnXM4=; b=yCXVDFe8CftQr10suv3VmVgdGV
	1F0ULIZLfiLLHEYzoLYs4+xggz5WzKwCbG6fmzkgXODsGmSKghDWcbkUM5j5qeoCy9u/3MmvMq03c
	ofpSsY0nsIcolXMGiYX7HKzL06UToKL07R3ksNIqsPnJXdAaRuJuJowdjl9jbLLH6cFGGxAD0joY5
	A5IePx7Hjs86hof3bjNTrNwv/y1a08igDR02HMBnY0ASA+tEjhNGXwMbE875LDxvgVTeztExcI48+
	Om8jBoRei6hHqvmcdlYx3ula2kcB1IeQZtCL8kY3Djv+IhegNZxz8zHalymtTdd4evB6jduoATYBm
	BGIFESfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZniA-0000000HADl-18kx;
	Wed, 17 Jun 2026 10:41:34 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZni6-0000000HAB0-3jBH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:41:32 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-137335bc3caso6891538c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692890; x=1782297690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUF1nUSK8JjVFEerCymxn+O2TFW28hvbz/kOFuEnXM4=;
        b=T65F1/nEf3grqtcCDjfyxx9AoArowPGx65CICOfJWnKM1jn8R4wWbNsX1XYCJZOa6P
         5I9Sb5QUjrSdv7Z+5ItZzkz9PqWPDtlQyHHM55PZ6Z1XvkXXQb+V4nct+uBU9GnO3VBY
         qiz6rv+UkHMgTTETbepkZHtJStrMFlXqiNPYb8LltfkzLzEtEXg0fPARRG8AEJkY8SpI
         gSCC7ctRSg0HcrOWidsYI9OqeegLxE8S1NfGGB370Gi84Ku+OwvCTjIKKdXxUXcsRqQe
         iIhlvYWct3pdSlOJc7+DxcCf/UZ83MfrwIpn2NryHQHaX1sVOZT9hb3+xvmGgxg52Dgo
         091g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692890; x=1782297690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUF1nUSK8JjVFEerCymxn+O2TFW28hvbz/kOFuEnXM4=;
        b=s3zzd4Kdc6J1qFHwqkT2RwmOwQpdVycOXx2JFPn6XXfIvDZAfDAVPlQ0qrhWMUBEbh
         YGtNdCCqMBu+yRs1by8OFXSg2WVJN4tPhnYJ87DoMD2nBcUWkpRmItSXDC3uxTCRG2kL
         xQK0o5Z9DNA+lX3kgernM0uy50q0V/O/uPKfP1bNo3jF41k591fqn9EQ5wlQMLSFCfRU
         9e3o4aUmX/GC6WPoSfX/cU0MhEqu3y5zFRMPVdnKSk0fc/yPbW+KHS1jyhUmAgXlsHDu
         NHDd9WaWg8hrk+TyDi8sZN+DezEDqGr7P3UxyAgq+WviYAFT+K3RK6eg8SWRcyYPFsSa
         hSZA==
X-Forwarded-Encrypted: i=1; AFNElJ+BWzdjN/5mzCBeIIDobJwDLWTXW0qFn0P95yrA/8bEVtjdsT31EN5tPeNV32uJ4VGkg/ZlgCUdF8YjPi/8zJC8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw67n12mfqKtf7RCKaXKdaiBEqKkg7fh1BlxjF4HWkHaHWzq6+Q
	uy6X9jd71v5lTg3mdiPE3UGgFUoDTzXW9XalmriFGXhBwnebugLAhvuUPzZMlQ==
X-Gm-Gg: Acq92OFDtE278N+o2loeiNRRXC543cXgoFZM9K40DAtCiwGL8mMrlQV2j10onCKlv2+
	k7N3Phb6iv0jJpZNr069SyxBiE8vYYHSK/mL83XlUHjUt5vr0gaNGM7dmWBZgRUBoh4bRkoDFDd
	aDw3xNODKgJO66TydSZ1GopVz72Ow0ZQ0Kn9Xz2tTDz8GUsqIEWRR+wTuV5dmujd5eQ0PEyMiJe
	9dc0IgjgoP7n9Txfpzs001n0QcVeduUVE3dejNAUPdWPUj7nlhLoBdSDwuZBwN/7Q716E6gGwnL
	kgyXDSumSifyBfah9xiEEVKdAcUbiwP2p8UYHpvTOksyC9vPximEx/8sVJFanx3ijiq1w/xCVX0
	Sb0FHCr7XOL7x0+fq0HoUaeGfipGjYvUQu7RFXMObj7sgGfyPn9F11pS65xQTpOVNVJ1KoqpXgs
	oEy6ufq0i1OUSCJhHlQnvHGDOi88Zl4ZXs7B+3K9FvEY6l3D80btsGYex1yg==
X-Received: by 2002:a05:7022:112:b0:137:edc4:a5e6 with SMTP id a92af1059eb24-1398f6b4762mr1323943c88.29.1781692889954;
        Wed, 17 Jun 2026 03:41:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:29 -0700 (PDT)
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
Subject: [PATCH 55/78] ASoC: codecs: tas2781: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:12 +0700
Message-ID: <20260617103235.449609-56-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034130_931713_0D72CC62 
X-CRM114-Status: GOOD (  14.22  )
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
 sound/soc/codecs/tas2781-comlib-i2c.c |  4 +---
 sound/soc/codecs/tas2781-i2c.c        | 20 ++++++++------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index e24d56a14cfd..85fcb33752a1 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -342,7 +342,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 	/* Codec Lock Hold to ensure that codec_probe and firmware parsing and
 	 * loading do not simultaneously execute.
 	 */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	if (tas_priv->name_prefix)
 		scnprintf(tas_priv->rca_binaryname, 64, "%s-%sRCA%d.bin",
@@ -360,8 +360,6 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
 			ret);
 
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(tascodec_init);
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9e6f0ad5f05d..f2b739780f73 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -843,12 +843,12 @@ static int tasdevice_digital_gain_get(
 	unsigned char data[4];
 	int ret;
 
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
-		goto out;
+		return ret;
 	}
 
 	target = get_unaligned_be32(&data[0]);
@@ -868,8 +868,7 @@ static int tasdevice_digital_gain_get(
 	/* find out the member same as or closer to the current volume */
 	ucontrol->value.integer.value[0] =
 		abs(target - ar_l) <= abs(target - ar_r) ? l : r;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
+
 	return 0;
 }
 
@@ -889,13 +888,13 @@ static int tasdevice_digital_gain_put(
 	unsigned char data[4];
 
 	vol = clamp(vol, 0, max);
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
 		rc = -1;
-		goto out;
+		return rc;
 	}
 
 	volrd = get_unaligned_be32(&data[0]);
@@ -903,7 +902,7 @@ static int tasdevice_digital_gain_put(
 
 	if (volrd == volwr) {
 		rc = 0;
-		goto out;
+		return rc;
 	}
 
 	for (i = 0; i < tas_dev->ndev; i++) {
@@ -919,8 +918,7 @@ static int tasdevice_digital_gain_put(
 
 	if (status)
 		rc = -1;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1766,12 +1764,10 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 	int state = 0;
 
 	/* Codec Lock Hold */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 	if (event == SND_SOC_DAPM_PRE_PMD)
 		state = 1;
 	tasdevice_tuning_switch(tas_priv, state);
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
 }
-- 
2.43.0


