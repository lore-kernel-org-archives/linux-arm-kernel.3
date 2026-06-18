Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DC0CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iT7a5mYt4EuRjvnoC6cJH0e8+Ysv0zetvEmuOypZ5E=; b=s1ANwDxpp9RZuY8rzNglvHud9E
	Hbp6+uL3lx4IkfKktcXR+WZp3ZE55l59s0vdNa0sshCyt7EuAO3Ma9CA0YoAnXDrwxfCAhca1w5oU
	FgiSJGZXDxsWIsrSyF5JFaw75zQ0LdcMMJs2ZuvOeJ9akO43Vh/s05ifYJiVYDHwmFdPpdFjxbr3I
	LrR2L5UewEfX2V9kzkdt6AL2CLAvGUlmVGKwgD1ASyS3RjUs3h9JYImQnvzO8msxA1NngOuo+etS5
	QCIS8pVIfCRQiOXQG/+Kzj+lqe2Yjy9/WYoeER0xtWnkLd+VPa6uf4E9qACqnLW2287MZBqU3srkJ
	Z0zLzeyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAez-00000001B1T-1yKC;
	Thu, 18 Jun 2026 11:11:49 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAew-00000001Az9-3rFk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so503333a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781106; x=1782385906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iT7a5mYt4EuRjvnoC6cJH0e8+Ysv0zetvEmuOypZ5E=;
        b=WRPkh7OH2qnBQ/3CRs3Sk2qh9iEjByaUJaomRs4nYW5NB4Zzy5elsOfCgbhjciCzC1
         h7uigHlRCZ1/NGSddvHGJl9PkRL+DmNPVw29dauv4Oy8rLQzncHkWh5IPrtjBhOc++21
         Um0sEoIbPCqPr4eDN971wtggN4C+oYU6dKiGs290kc4n8uB7TXOK4uSsdSbtV2cuMi+o
         /IWeRE+dZS/yOM/9Rsjt6lZ6JJKJ4tEJV3Ad1U+t1q19wlbLx32sFC6WrIS+sVL3fcCw
         NeqDPLNcMKFkYDCvm5XBSleYV80iktAFYdmCru9MF6k8TXDJxrbkIrkV5uCLrnvUzsGq
         B4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781106; x=1782385906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0iT7a5mYt4EuRjvnoC6cJH0e8+Ysv0zetvEmuOypZ5E=;
        b=azyqex1gvNkiTVEQDq/9poreMt3QhGrMmFpWkacvbZ3uam2Odq+8y3Go1SlTcFKzDK
         IXv6Fq/hOevxVJ+DgQwAoZ/m6b7lIAWTTe1WLZv1lYqpEaoijXUocK2mL+0mrJT/jv9h
         K/LBPeY06k7lD6kZmfrl9cWOJJKwzlAeQ/aT+b8r3FW58nH5C9JktNfWjWa7scwDuG2h
         ATqrjUAu19YmtdZX9mbkJZ+NtU+YCJiJvvrt4kAuBTtd0UjMuo0cgHAcFVxA/6/SHyck
         9jgMwrRUFMx4cgUg1rT6fgufiYFkEDdnRboDbpcVcgpuHQ/ZpxWYZq4nMxeaD1igY8FJ
         +xoA==
X-Forwarded-Encrypted: i=1; AFNElJ/yOig7oJ756+9CjtjQPUzOf3jHlrpZo5+wKshD3ywZaloSLJ8Zrvx9IbqM0uJV74E8WVHUfzko+xTQEqPYzwLG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6+NlfJcOqBfw8RhNYraqWuVy3RppDp0bBDvmnfoTZkhYU+YXf
	FcCczfiL8ME2c7kAFKMpKnIwL9DlE4VR8Sj8wdFIPzHSCOWHeT7fTzGCCL5L7g==
X-Gm-Gg: AfdE7cn43oOmzSYhHdIdS5voNk2bW/FoJIBOWyn0lV8e4fhJB1hpzG8Y7j6r9n1YKHr
	qAPmVGsI+m1V+GKaYez5UUvkHixN/rpTtYvhJ0kHgkgoGL81lSTfb3bFOUScVvfIX80FGiZbKpv
	aKAH/Dq9ujzcyQM/vY2PsNW9UHlLqYrJpRce9i/8A3bEhLfxJFzCviTyNrNO+tEOvmB6fjwKVvY
	lh+6uQ+jkUrCb31PwXBd9FePPtzhvEl2REp43T9gEjXAeUDiGK6KOoNUjvq8FqIABBImLsa06dZ
	KWPcgMSjzOpzriuTdfROhwcOv2LoQlwKXmHJLCCWKxdrta3O7iFm30Hs6/M4dbDMRFfZLm2GY79
	IxE5tte5GQpo/+ydfvL3GjqE6zCzkLFeD5fhqp9+J+BqDCx5+H5UoDfT82PIFAGAqhqD5+USf32
	8HFk8Z5jM/283ti8wPRNxLRAhzkHjvug6j84Fe+T82z3RfNz7haoK7oFhL5Q==
X-Received: by 2002:a17:903:2cb:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c6bc23c319mr84718925ad.31.1781781105826;
        Thu, 18 Jun 2026 04:11:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:45 -0700 (PDT)
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
Subject: [PATCH 77/78] ASoC: codecs: wm_adsp: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:26 +0700
Message-ID: <20260618110827.232983-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041146_965607_6284F8FE 
X-CRM114-Status: GOOD (  16.30  )
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
 sound/soc/codecs/wm_adsp.c | 87 +++++++++++---------------------------
 1 file changed, 25 insertions(+), 62 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index baa75e7ff53b..816e7e0d60c7 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -356,15 +356,13 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.enumerated.item[0] >= WM_ADSP_NUM_FW)
 		return -EINVAL;
 
-	mutex_lock(&dsp[e->shift_l].cs_dsp.pwr_lock);
+	guard(mutex)(&dsp[e->shift_l].cs_dsp.pwr_lock);
 
 	if (dsp[e->shift_l].cs_dsp.booted || !list_empty(&dsp[e->shift_l].compr_list))
 		ret = -EBUSY;
 	else
 		dsp[e->shift_l].fw = ucontrol->value.enumerated.item[0];
 
-	mutex_unlock(&dsp[e->shift_l].cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_fw_put);
@@ -450,15 +448,11 @@ static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
 	if (val == 0)
 		return 0;	/* 0 means no event */
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
-
 	if (cs_ctl->enabled)
 		ret = cs_dsp_coeff_write_acked_control(cs_ctl, val);
 	else
 		ret = -EPERM;
 
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -486,15 +480,13 @@ static int wm_coeff_tlv_get(struct snd_kcontrol *kctl,
 	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	int ret = 0;
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
+	guard(mutex)(&cs_ctl->dsp->pwr_lock);
 
 	ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, cs_ctl->cache, size);
 
 	if (!ret && copy_to_user(bytes, cs_ctl->cache, size))
 		ret = -EFAULT;
 
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
-
 	return ret;
 }
 
@@ -694,10 +686,9 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	struct cs_dsp_coeff_ctl *cs_ctl;
 	int ret;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 	cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
 
 	if (ret < 0)
 		return ret;
@@ -709,14 +700,10 @@ EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
 int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 		     unsigned int alg, void *buf, size_t len)
 {
-	int ret;
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
-	ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
+	return cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
 				     0, buf, len);
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
@@ -1270,38 +1257,32 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 {
 	struct wm_adsp_compr *compr, *tmp;
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
-	int ret = 0;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	if (wm_adsp_fw[dsp->fw].num_caps == 0) {
 		adsp_err(dsp, "%s: Firmware does not support compressed API\n",
 			 snd_soc_rtd_to_codec(rtd, 0)->name);
-		ret = -ENXIO;
-		goto out;
+		return -ENXIO;
 	}
 
 	if (wm_adsp_fw[dsp->fw].compr_direction != stream->direction) {
 		adsp_err(dsp, "%s: Firmware does not support stream direction\n",
 			 snd_soc_rtd_to_codec(rtd, 0)->name);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	list_for_each_entry(tmp, &dsp->compr_list, list) {
 		if (!strcmp(tmp->name, snd_soc_rtd_to_codec(rtd, 0)->name)) {
 			adsp_err(dsp, "%s: Only a single stream supported per dai\n",
 				 snd_soc_rtd_to_codec(rtd, 0)->name);
-			ret = -EBUSY;
-			goto out;
+			return -EBUSY;
 		}
 	}
 
 	compr = kzalloc_obj(*compr);
-	if (!compr) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!compr)
+		return -ENOMEM;
 
 	compr->dsp = dsp;
 	compr->stream = stream;
@@ -1311,10 +1292,7 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	stream->runtime->private_data = compr;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_open);
 
@@ -1324,7 +1302,7 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	struct wm_adsp_compr *compr = stream->runtime->private_data;
 	struct wm_adsp *dsp = compr->dsp;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	wm_adsp_compr_detach(compr);
 	list_del(&compr->list);
@@ -1332,8 +1310,6 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	kfree(compr->raw_buf);
 	kfree(compr);
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_free);
@@ -1741,7 +1717,7 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 
 	compr_dbg(compr, "Trigger: %d\n", cmd);
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -1777,8 +1753,6 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_trigger);
@@ -1839,12 +1813,10 @@ int wm_adsp_compr_handle_irq(struct wm_adsp *dsp)
 	struct wm_adsp_compr *compr;
 	int ret = 0;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
-	if (list_empty(&dsp->buffer_list)) {
-		ret = -ENODEV;
-		goto out;
-	}
+	if (list_empty(&dsp->buffer_list))
+		return -ENODEV;
 
 	adsp_dbg(dsp, "Handling buffer IRQ\n");
 
@@ -1859,13 +1831,13 @@ int wm_adsp_compr_handle_irq(struct wm_adsp *dsp)
 					  &buf->irq_count);
 		if (ret < 0) {
 			compr_err(buf, "Failed to get irq_count: %d\n", ret);
-			goto out;
+			return ret;
 		}
 
 		ret = wm_adsp_buffer_update_avail(buf);
 		if (ret < 0) {
 			compr_err(buf, "Error reading avail: %d\n", ret);
-			goto out;
+			return ret;
 		}
 
 		if (wm_adsp_fw[dsp->fw].voice_trigger && buf->irq_count == 2)
@@ -1876,9 +1848,6 @@ int wm_adsp_compr_handle_irq(struct wm_adsp *dsp)
 			snd_compr_fragment_elapsed(compr->stream);
 	}
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_handle_irq);
@@ -1907,21 +1876,20 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 
 	compr_dbg(compr, "Pointer request\n");
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	buf = compr->buf;
 
 	if (dsp->fatal_error || !buf || buf->error) {
 		snd_compr_stop_error(stream, SNDRV_PCM_STATE_XRUN);
-		ret = -EIO;
-		goto out;
+		return -EIO;
 	}
 
 	if (buf->avail < wm_adsp_compr_frag_words(compr)) {
 		ret = wm_adsp_buffer_update_avail(buf);
 		if (ret < 0) {
 			compr_err(compr, "Error reading avail: %d\n", ret);
-			goto out;
+			return ret;
 		}
 
 		/*
@@ -1934,14 +1902,14 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 				if (buf->error)
 					snd_compr_stop_error(stream,
 							SNDRV_PCM_STATE_XRUN);
-				goto out;
+				return ret;
 			}
 
 			ret = wm_adsp_buffer_reenable_irq(buf);
 			if (ret < 0) {
 				compr_err(compr, "Failed to re-enable buffer IRQ: %d\n",
 					  ret);
-				goto out;
+				return ret;
 			}
 		}
 	}
@@ -1950,9 +1918,6 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 	tstamp->copied_total += buf->avail * CS_DSP_DATA_WORD_SIZE;
 	tstamp->sampling_rate = compr->sample_rate;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_pointer);
@@ -2063,15 +2028,13 @@ int wm_adsp_compr_copy(struct snd_soc_component *component,
 	struct wm_adsp *dsp = compr->dsp;
 	int ret;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	if (stream->direction == SND_COMPRESS_CAPTURE)
 		ret = wm_adsp_compr_read(compr, buf, count);
 	else
 		ret = -ENOTSUPP;
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_copy);
-- 
2.43.0


