Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD19ECD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4NAL+Ax67W1fnPekopS276z3NNPB/KQWk3jQSVarPU=; b=1Dt1VuPvHr3v4WCc/w369b6QYk
	H9qQcNx5CA0OykKzoXDyD9smLZYRxP5Vkb2eo74HBuT5yyfVJeLWVBGw9wyNz0aCP/up7R8juu01c
	esJEUst7UO9MUEgxA1VyIJA9fpNfoP7AYLvdEV+p5+CvIabr4iouXDb0QgyqSzQQqT9Hq7+RdL7P7
	HBiq2u2QXIUuQvKaqUIPUfMtxW/VHRo6+eEcWPEftzl+4cEKa0jZpBiFCtVrVZ00UKn9fouCirjvd
	6ht3ML9c/v9DFzBu0jUd+65O1ljEHoJ8N2IEsvDPB5R/KRZTfqMQXNGNiJnOryoK6XSjebvnXij6B
	fcQPy8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngm-0000000H92h-3M0t;
	Wed, 17 Jun 2026 10:40:08 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZngk-0000000H90C-1ATu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:40:08 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30bcf74e617so1421411eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692806; x=1782297606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4NAL+Ax67W1fnPekopS276z3NNPB/KQWk3jQSVarPU=;
        b=fyMcjcdQ7253Vl9zGecZhi/SiyF20crq5vXgyJU9m6lHpEyehSz+d3I8MkFOlMrEcd
         5p/X1mctU6RUSoWd7Zbh+RUB3AGu3sypM8rBFXf1UerPxrosbpEHm4/uSZAQoseTMPRo
         yHix7gddL3y7ONGfNd2+UQMIHVLnK89aUlSnlBczAMv0dMgIWA5oj81d+k9uhVHjLy4b
         ahcRyW4qakDxyo3DqpqD3q63J36iO1PG28LVhA1te5DGZkgr3/+xNRvWE095e77mLiVn
         GjwPAqlhc1yHzXT54qAEChgDAKjVMbKX1sOmzLRI7tJjRs2+7J7GMnuoSx+lJyY0Hgoi
         PWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692806; x=1782297606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4NAL+Ax67W1fnPekopS276z3NNPB/KQWk3jQSVarPU=;
        b=fFa3MaEMMxWWUHu/KpsN2RbuH+/dBLrbgItC88yaBAiiX8dfDgtgeKNYCEaFtzmxXn
         /zndpR/t4cBebmUhbliFCksASV5eXUYFPh4Or5DwsQ9yFAe0LwubG8gmrXaJAOhg2uYP
         Lz+oESplvEKeClBMAJ7hveuodCUYcKL8LwnpfBNoybjZ0ZlnDzC1UCD7zExj3S8AQHbv
         3xuRuA/BCIUpXXgBgj1quOjzwzIME/vEhN2be55B2PetwvqwBufe05XwBZPbRowKvXoS
         ew9RA/2OQMqZGrJKUutjkkyS60zYXx16c+vtCRUoM2ItgxN45MFqgxEvTP1rZeGyLspL
         LE7A==
X-Forwarded-Encrypted: i=1; AFNElJ/vHqcnlHAzrQy1h9xJ8AngdYnL6BdlU+ASzLY2X3zVccJzbJnJoDxJhAmOz4pVVQFlSAUjhKc45g0JuILF0hnj@lists.infradead.org
X-Gm-Message-State: AOJu0YxnmOzeDj0MSqTa2ccCm5z0xqiqfZlUFS39s6iIdUn2Bo4CAW7Z
	xF4Ol/xMkUteR6dbnTo2AqmvEC4D6jecPJSUgOH4wd2+VWt4Uo8XeYgq
X-Gm-Gg: AfdE7cnqcpBXdsInsG1DynCO4/pWsDqfcJjI2TXV8E7oIkgMD5RauXcRXcyYEtEPsPG
	b6yDMNVTHY6Ahzd966F7rlDGSXDfMg9Yne4HI2bary6WOYLbj19sbIPuPnenOLznoTOcW5VCQ5E
	WLTXtcOKAR1cX23//FbnXxr3do8OfUK+Qv2yc+gMxkSBaBq8eYeZy+1LXotNO0f9gkH47USkb6S
	d5xV50/blarNxVDfjF/x0FR+eW8hLzBMhFa1p0kMZNanDod5GALuvKcyya8E1DlZc/K/IaQKTNb
	SuIXCb2HnNqBMuCtjivSEUPu5AeuZfOvkWn57o0xkImPmQf52jnPsQpY1EA1sEmKYlqwrILkCYZ
	Ve9YXu4mAyw/QzS3x4GKnxgaOaPBK6D4AldI5XvVVyjJz77/xey5/hTmuW+/cIKgsFipBzTSWDj
	Bwg0O7jA8MVqOYspSZP4Va2vhdInjbppJyxxRZUY512GxY6y8=
X-Received: by 2002:a05:693c:3109:b0:2c0:c5e4:605f with SMTP id 5a478bee46e88-30bca10ce70mr1641138eec.24.1781692805548;
        Wed, 17 Jun 2026 03:40:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:05 -0700 (PDT)
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
Subject: [PATCH 45/78] ASoC: codecs: rt5677: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:02 +0700
Message-ID: <20260617103235.449609-46-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034006_587177_6B4155D0 
X-CRM114-Status: GOOD (  19.35  )
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
 sound/soc/codecs/rt5677-spi.c | 35 +++++++---------
 sound/soc/codecs/rt5677.c     | 77 ++++++++++++++++-------------------
 2 files changed, 48 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 1bcafd5f4468..f559f7b15bae 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -133,9 +133,8 @@ static int rt5677_spi_hw_params(
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	rt5677_dsp->substream = substream;
-	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return 0;
 }
@@ -147,9 +146,8 @@ static int rt5677_spi_hw_free(
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	rt5677_dsp->substream = NULL;
-	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return 0;
 }
@@ -311,17 +309,17 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 	int ret = 0;
 
 	/* Ensure runtime->dma_area buffer does not go away while copying. */
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	if (!rt5677_dsp->substream) {
 		dev_err(rt5677_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5677_dsp->substream->runtime;
 
 	if (rt5677_spi_mic_write_offset(&mic_write_offset)) {
 		dev_err(rt5677_dsp->dev, "No mic_write_offset\n");
-		goto done;
+		return;
 	}
 
 	/* If this is the first time that we've asked for streaming data after
@@ -355,7 +353,7 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 		ret = rt5677_spi_copy(rt5677_dsp, copy_bytes);
 		if (ret) {
 			dev_err(rt5677_dsp->dev, "Copy failed %d\n", ret);
-			goto done;
+			return;
 		}
 		rt5677_dsp->avail_bytes += copy_bytes;
 		if (rt5677_dsp->avail_bytes >= period_bytes) {
@@ -367,8 +365,6 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 
 	delay = bytes_to_frames(runtime, period_bytes) / runtime->rate;
 	schedule_delayed_work(&rt5677_dsp->copy_work, secs_to_jiffies(delay));
-done:
-	mutex_unlock(&rt5677_dsp->dma_lock);
 }
 
 static int rt5677_spi_pcm_new(struct snd_soc_component *component,
@@ -507,10 +503,8 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 		header[3] = ((addr + offset) & 0x0000ff00) >> 8;
 		header[4] = ((addr + offset) & 0x000000ff) >> 0;
 
-		mutex_lock(&spi_mutex);
-		status |= spi_sync(g_spi, &m);
-		mutex_unlock(&spi_mutex);
-
+		scoped_guard(mutex, &spi_mutex)
+			status |= spi_sync(g_spi, &m);
 
 		/* Copy data back to caller buffer */
 		rt5677_spi_reverse(cb + offset, len - offset, body, t[1].len);
@@ -564,9 +558,8 @@ int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
 		offset += t.len;
 		t.len += RT5677_SPI_HEADER + 1;
 
-		mutex_lock(&spi_mutex);
-		status |= spi_sync(g_spi, &m);
-		mutex_unlock(&spi_mutex);
+		scoped_guard(mutex, &spi_mutex)
+			status |= spi_sync(g_spi, &m);
 	}
 	return status;
 }
@@ -591,10 +584,10 @@ void rt5677_spi_hotword_detected(void)
 		return;
 	}
 
-	mutex_lock(&rt5677_dsp->dma_lock);
-	dev_info(rt5677_dsp->dev, "Hotword detected\n");
-	rt5677_dsp->new_hotword = true;
-	mutex_unlock(&rt5677_dsp->dma_lock);
+	scoped_guard(mutex, &rt5677_dsp->dma_lock) {
+		dev_info(rt5677_dsp->dev, "Hotword detected\n");
+		rt5677_dsp->new_hotword = true;
+	}
 
 	schedule_delayed_work(&rt5677_dsp->copy_work, 0);
 }
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ac084ca008f3..fd060227655e 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -563,46 +563,43 @@ static int rt5677_dsp_mode_i2c_write_addr(struct rt5677_priv *rt5677,
 	struct snd_soc_component *component = rt5677->component;
 	int ret;
 
-	mutex_lock(&rt5677->dsp_cmd_lock);
+	guard(mutex)(&rt5677->dsp_cmd_lock);
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_MSB,
 		addr >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_LSB,
 		addr & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_MSB,
 		value >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set data msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_LSB,
 		value & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set data lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_OP_CODE,
 		opcode);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set op code value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
-err:
-	mutex_unlock(&rt5677->dsp_cmd_lock);
-
 	return ret;
 }
 
@@ -622,36 +619,33 @@ static int rt5677_dsp_mode_i2c_read_addr(
 	int ret;
 	unsigned int msb, lsb;
 
-	mutex_lock(&rt5677->dsp_cmd_lock);
+	guard(mutex)(&rt5677->dsp_cmd_lock);
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_MSB,
 		addr >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_LSB,
 		addr & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_OP_CODE,
 		0x0002);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set op code value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	regmap_read(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_MSB, &msb);
 	regmap_read(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_LSB, &lsb);
 	*value = (msb << 16) | lsb;
 
-err:
-	mutex_unlock(&rt5677->dsp_cmd_lock);
-
 	return ret;
 }
 
@@ -940,21 +934,20 @@ static void rt5677_dsp_work(struct work_struct *work)
 		activity = false;
 
 		/* Don't turn off the DSP while handling irqs */
-		mutex_lock(&rt5677->irq_lock);
-		/* Set DSP CPU to Stop */
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
-			RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
-
-		rt5677_set_dsp_mode(rt5677, false);
+		scoped_guard(mutex, &rt5677->irq_lock) {
+			/* Set DSP CPU to Stop */
+			regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+				RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
 
-		/* Disable and clear VAD interrupt */
-		regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
+			rt5677_set_dsp_mode(rt5677, false);
 
-		/* Set GPIO1 pin back to be IRQ output for jack detect */
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
-			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
+			/* Disable and clear VAD interrupt */
+			regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
 
-		mutex_unlock(&rt5677->irq_lock);
+			/* Set GPIO1 pin back to be IRQ output for jack detect */
+			regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+				RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
+		}
 	}
 }
 
@@ -4980,11 +4973,11 @@ static int rt5677_read(void *context, unsigned int reg, unsigned int *val)
 
 	if (rt5677->is_dsp_mode) {
 		if (reg > 0xff) {
-			mutex_lock(&rt5677->dsp_pri_lock);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
-				reg & 0xff);
-			rt5677_dsp_mode_i2c_read(rt5677, RT5677_PRIV_DATA, val);
-			mutex_unlock(&rt5677->dsp_pri_lock);
+			scoped_guard(mutex, &rt5677->dsp_pri_lock) {
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
+					reg & 0xff);
+				rt5677_dsp_mode_i2c_read(rt5677, RT5677_PRIV_DATA, val);
+			}
 		} else {
 			rt5677_dsp_mode_i2c_read(rt5677, reg, val);
 		}
@@ -5002,12 +4995,12 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
 
 	if (rt5677->is_dsp_mode) {
 		if (reg > 0xff) {
-			mutex_lock(&rt5677->dsp_pri_lock);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
-				reg & 0xff);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_DATA,
-				val);
-			mutex_unlock(&rt5677->dsp_pri_lock);
+			scoped_guard(mutex, &rt5677->dsp_pri_lock) {
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
+					reg & 0xff);
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_DATA,
+					val);
+			}
 		} else {
 			rt5677_dsp_mode_i2c_write(rt5677, reg, val);
 		}
@@ -5313,7 +5306,7 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 	int ret, loop, i, reg_irq, virq;
 	bool irq_fired = false;
 
-	mutex_lock(&rt5677->irq_lock);
+	guard(mutex)(&rt5677->irq_lock);
 
 	/*
 	 * Loop to handle interrupts until the last i2c read shows no pending
@@ -5370,7 +5363,6 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 	}
 exit:
 	WARN_ON_ONCE(loop == 20);
-	mutex_unlock(&rt5677->irq_lock);
 	if (irq_fired)
 		return IRQ_HANDLED;
 	else
@@ -5399,7 +5391,7 @@ static void rt5677_resume_irq_check(struct work_struct *work)
 	 * Without this explicit check, unplug the headset right after suspend
 	 * starts, then after resume the headset is still shown as plugged in.
 	 */
-	mutex_lock(&rt5677->irq_lock);
+	guard(mutex)(&rt5677->irq_lock);
 	for (i = 0; i < RT5677_IRQ_NUM; i++) {
 		if (rt5677->irq_en & rt5677_irq_descs[i].enable_mask) {
 			virq = irq_find_mapping(rt5677->domain, i);
@@ -5407,7 +5399,6 @@ static void rt5677_resume_irq_check(struct work_struct *work)
 				handle_nested_irq(virq);
 		}
 	}
-	mutex_unlock(&rt5677->irq_lock);
 }
 
 static void rt5677_irq_bus_lock(struct irq_data *data)
-- 
2.43.0


