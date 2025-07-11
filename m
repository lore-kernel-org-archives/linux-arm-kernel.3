Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A6CC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyMo9zKfU1sUBA0BOjzI2p8EGc7Cd9FXwBdhaBOmmwY=; b=pz+Ab4bT6D6w69ZUNhmlEU+TXN
	oi+kWsNTXFqhZO1IDvY8FoKuBznya5x6zXrq++6+C/HwEkMsMP1Br7ii/+mDOnVNjtN/IpoOsqdTN
	ku+1TX4JLc30K2oUPHbjOqSUlphjHe5WDDO5Ci5xjiAaONPyN5DW2oj1swOWx2FeP7sWNlJONz/uH
	qynsf487oJrxnG185ktrQWBX1C78fcjnm6eI3aMhQY/8b7PBv8ZXbI4izc7kj++bcNzK5i4xHYs17
	roVbOLs21O1qRGEKyvSBEB319Qdx7m/5XIk3tsi8G47m7jUmiA41fWzJn3JZLctlvl9wANG4qp7Hx
	2X3f9yQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAtZ-0000000ETd3-28Y5;
	Fri, 11 Jul 2025 10:22:21 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAC2-0000000EKqr-1v2P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:37:23 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-453817323afso12092965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752226640; x=1752831440; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyMo9zKfU1sUBA0BOjzI2p8EGc7Cd9FXwBdhaBOmmwY=;
        b=G8Zb3EU0M4l/UfoloHBeQUMsW7GqZizZ4hEULjiJ0GhwIWCrXPQP2g+1fdagCIQ7iq
         VtS8JLxk3/pcB/EhWaxFAGmuxk1LipLhjUhaOyTvlz+PvPfMPomXLzqOQDIwcEV9Wvzr
         BOXv0MfX4+Y/J9WFIrBwwm6FAH/6lXaHvrxRObkcuUOEeJ8yzS+zbNsZy0go/l4rNwdw
         JW0FFQL3DAn7Cq/5hyXEsKMu5KEJw90J3wMT7mzqKH6E1n6GPvzEzIMIK67ZjtvehFXF
         kXzSshsVLoLTlSKRAnoa8zMC9jyDSOP4XhKu+GIzY1EK54lSPJvd0bzotsLr00kmFiCJ
         Vfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226640; x=1752831440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyMo9zKfU1sUBA0BOjzI2p8EGc7Cd9FXwBdhaBOmmwY=;
        b=fjeVvSipfKd/cAtTmZUOeULhEFIiVzr+d1kBwq2zDoCinhc0+kgD9iOYPKFTHuLezn
         +4a5zUDIZYBu3fBUTv1i38Q2I01yALJ6EtkEgeQ6k9JOuFV65m2Dvwr/DikFqMpyYKMV
         cEThxA7Tn/E0XJ/ab6bFfkAsv3X+m7Qq98zhGO3t6ONw0ocooWIKBgyqRkhI+zWX/D2r
         bc7Zelhs1qqYK1nDOb3qNtV5BEOt+ZHbMtECKbkp4A46yRUmnkLJxgqCCy701+RzRH19
         l0vwmfXzimgpo7aZfpBvYpwtlLwJRG2i69zeVPgmK3hUB+jKp7pwqplz/ExDyio/RLdy
         PQSA==
X-Forwarded-Encrypted: i=1; AJvYcCVUXjc4+GEXkKBG9dymS7y0gdho6qUA6assgaDAuxOWkV/goz4mfmHrVPTHDVhlkr71yj0O8BzF49PKEXjbwIVb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxu/s+bOqfEddxr/0netV8G5qQ9J/6/2u2FDUuX8j6akKuRJJn
	gpcplyHSK73Zj00n/09ZgnvEwdT0FGBI3HFUl/cTk+SuUCreJI80yP2YY1WGMCpk//hyYoYxnqH
	E/GygSrSvJ0PhXOkCEw==
X-Google-Smtp-Source: AGHT+IGkFa1awjG9LOYkbAB1rrv/t1xS4FURqpEoi3ZhrWLDYJ7bMjZ3iWrbqN63RoLLbaFSUEG6qVEShxpv5T8=
X-Received: from wmth6.prod.google.com ([2002:a05:600c:8b66:b0:442:f4a3:b8f5])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6305:b0:450:cfcb:5c9b with SMTP id 5b1f17b1804b1-454ec15a964mr20354655e9.1.1752226640523;
 Fri, 11 Jul 2025 02:37:20 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:36:28 +0100
In-Reply-To: <20250711093636.28204-1-verhaegen@google.com>
Mime-Version: 1.0
References: <20250711093636.28204-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711093636.28204-3-verhaegen@google.com>
Subject: [PATCH v2 2/4] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
From: Joris Verhaegen <verhaegen@google.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Joris Verhaegen <verhaegen@google.com>, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
	David Li <dvdli@google.com>, Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_023722_490120_421B4E77 
X-CRM114-Status: GOOD (  18.13  )
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

The previous patch introduced the internal infrastructure for handling
64-bit timestamps. This patch exposes this capability to user-space.

Define the new ioctl command SNDRV_COMPRESS_TSTAMP64, which allows
applications to fetch the overflow-safe struct snd_compr_tstamp64.

The ioctl dispatch table is updated to handle the new command by
calling a new snd_compr_tstamp64 handler, while the legacy path is
renamed to snd_compr_tstamp32 for clarity.

Signed-off-by: Joris Verhaegen <verhaegen@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Reviewed-by: David Li <dvdli@google.com>
Reviewed-by: Miller Liang <millerliang@google.com>
---
 include/uapi/sound/compress_offload.h |  2 ++
 sound/core/compress_offload.c         | 50 +++++++++++++++++++++++----
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index abd0ea3f86ee..2758d9ee3d91 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -208,6 +208,7 @@ struct snd_compr_task_status {
  * Note: only codec params can be changed runtime and stream params cant be
  * SNDRV_COMPRESS_GET_PARAMS: Query codec params
  * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
+ * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
  * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
  * This also queries the tstamp properties
  * SNDRV_COMPRESS_PAUSE: Pause the running stream
@@ -230,6 +231,7 @@ struct snd_compr_task_status {
 						 struct snd_compr_metadata)
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
+#define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 6a8873bd62ae..40c1e69961b7 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -211,8 +211,8 @@ snd_compr_tstamp32_from_64(struct snd_compr_tstamp *tstamp32,
 	tstamp32->sampling_rate = tstamp64->sampling_rate;
 }
 
-static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
-		struct snd_compr_tstamp *tstamp)
+static int snd_compr_update_tstamp32(struct snd_compr_stream *stream,
+				     struct snd_compr_tstamp *tstamp)
 {
 	u64 copied_total64;
 	struct snd_compr_tstamp64 tstamp64;
@@ -238,11 +238,30 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 	return 0;
 }
 
+static int snd_compr_update_tstamp64(struct snd_compr_stream *stream,
+				     struct snd_compr_tstamp64 *tstamp)
+{
+	int retval = snd_compr_get_tstamp64(stream, tstamp);
+
+	if (retval != 0)
+		return retval;
+
+	pr_debug("dsp consumed till %u total %llu bytes\n", tstamp->byte_offset,
+		 tstamp->copied_total);
+
+	if (stream->direction == SND_COMPRESS_PLAYBACK)
+		stream->runtime->total_bytes_transferred = tstamp->copied_total;
+	else
+		stream->runtime->total_bytes_available = tstamp->copied_total;
+
+	return 0;
+}
+
 static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 		struct snd_compr_avail *avail)
 {
 	memset(avail, 0, sizeof(*avail));
-	snd_compr_update_tstamp(stream, &avail->tstamp);
+	snd_compr_update_tstamp32(stream, &avail->tstamp);
 	/* Still need to return avail even if tstamp can't be filled in */
 
 	if (stream->runtime->total_bytes_available == 0 &&
@@ -769,19 +788,34 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 	return retval;
 }
 
-static inline int
-snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
+static inline int snd_compr_tstamp32(struct snd_compr_stream *stream,
+				     unsigned long arg)
 {
 	struct snd_compr_tstamp tstamp = {0};
 	int ret;
 
-	ret = snd_compr_update_tstamp(stream, &tstamp);
+	ret = snd_compr_update_tstamp32(stream, &tstamp);
 	if (ret == 0)
 		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
 			&tstamp, sizeof(tstamp)) ? -EFAULT : 0;
 	return ret;
 }
 
+static inline int snd_compr_tstamp64(struct snd_compr_stream *stream,
+				     unsigned long arg)
+{
+	struct snd_compr_tstamp64 tstamp = { 0 };
+	int ret;
+
+	ret = snd_compr_update_tstamp64(stream, &tstamp);
+	if (ret == 0)
+		ret = copy_to_user((struct snd_compr_tstamp64 __user *)arg,
+				   &tstamp, sizeof(tstamp)) ?
+			      -EFAULT :
+			      0;
+	return ret;
+}
+
 static int snd_compr_pause(struct snd_compr_stream *stream)
 {
 	int retval;
@@ -1355,7 +1389,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 
 	switch (_IOC_NR(cmd)) {
 	case _IOC_NR(SNDRV_COMPRESS_TSTAMP):
-		return snd_compr_tstamp(stream, arg);
+		return snd_compr_tstamp32(stream, arg);
+	case _IOC_NR(SNDRV_COMPRESS_TSTAMP64):
+		return snd_compr_tstamp64(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_AVAIL):
 		return snd_compr_ioctl_avail(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_PAUSE):
-- 
2.50.0.727.gbf7dc18ff4-goog


