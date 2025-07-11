Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B11C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBhpozoKO994tZaJby3EUAdOYCx2fn320yq/NpQfjfg=; b=vKCDXvsuOVKtBBZQHdAFKdwH+Y
	wb/wtcMtAe9/CNdIDcdiClyUVLL44WQSo9iw/d27f13HD/M5xogAkfNiVZnyULfkn/xOwG6W1Xekc
	vCI4CgqaMY4lLK9lUZNS4R7iyPcxQTQiryLN9yKYLa7eVU4e1nOk/iDjVkT506akld4LLqOHbhgpA
	qMw1KuUKwQ3zbnTTO4X3fgEfHY/tlbIp/8dqkQ+6O9C3Txn3h8rXhLMIzO+j6uuJ28+nvM12gDPCb
	RgTqwy4qGfIRwuoG2NCMthEn/6+ZYqcQf0BSZaNZsImcnmciZVWmoE6tqJTR7jce2QvLwRFLx7EZG
	ySyBT/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaArF-0000000ETDP-2Xjj;
	Fri, 11 Jul 2025 10:19:57 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaABv-0000000EKo7-0hrW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:37:16 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6077833ae13so1579397a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 02:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752226633; x=1752831433; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBhpozoKO994tZaJby3EUAdOYCx2fn320yq/NpQfjfg=;
        b=zYHRFfzyXMHeuPTTj21YaPUuZ088N3vK7bCIu6RJe5cn3Bay4OO/miMTNxF4F65rar
         zooOhsx4Mt50e2/NtVxDn7Ftd2cxB+ZCtHvVI6OWP4tP/SyylICN8h451hGfM56RFwo1
         oIiQJefc5CdjRp8ZcyrLANnHr/8PbSeEwa3KetQvKjtCWHTkqRTndagQyYt6n2xA4HUt
         HBfIK9vPOG0t7mgmbW1ysuMKeCIRC0BLf6Si5PTBLxfrJMYw6q2CvwEI4ahiM1HZA/gu
         JsgwGSNFMVFCVaBvs7ICIF98lIAkjgSkb3RAQvLQJo4qdwyq/BEQTH2uenpud4auQp3h
         XnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226633; x=1752831433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBhpozoKO994tZaJby3EUAdOYCx2fn320yq/NpQfjfg=;
        b=fZemA71vuXpKskQk5MNvlKi1bm6C+h2n8mbr+qt3TadpYGvzyc+TawQGz3fFQx6eZ5
         2gz9jRBQV7dMlX4mnhi5BV5HCYcLqldffXPJ4QxgCldHLfXHBhCjarE+K4llbt9acgs2
         LNmmwOUq+6IM6thOE8YgdrGZoITNRbglw8eJBVzl/DXZQ57oZ33sjCI9hdQ8cgA1RHLf
         s0hpxgFC9UQ8LlQs9RwfuU1pEd2W/8aFOGr/0mRZ76a9gujtriFp9PFcWeT/zPuHY7jc
         TJjbbKyUUFexCnJ6Rze2bhW75vVQlElisZQ4kV2p6/PltgSix9dQbfVeaqsJp1wxEvU4
         bm1g==
X-Forwarded-Encrypted: i=1; AJvYcCXzVpgr7sRyCwRbkTs+ycsNqNP+U5oRgTITdYsZtCoZdoEBCqCNZS+YewmbbskioB+tFxXsBflqqjxr58atrxDE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyr5nMlABCRe9RxEoJ4b1ebeQ8dwva38ALKdiIXC3yDsCA0tSq
	RX3eJtf+gPHD/s/5V03Xs78EZIwfJw6tp8wHJE4FQFFRCsRRE5zQCefBzS92hBM90eT7VpzGwsi
	RSoIQq4kcY6Kh538Spw==
X-Google-Smtp-Source: AGHT+IGIdc1uDMfWkRcYXH2QBFFa8MaZ4zaOUnOEybovNZBaLXnRsrqkGYBocqlyoisFxGvLN/JgmGhrEpyjbXY=
X-Received: from ejaw15.prod.google.com ([2002:a17:906:33cf:b0:ae4:a43:f265])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:970f:b0:ae0:da2d:44b9 with SMTP id a640c23a62f3a-ae6fbc2654fmr271916766b.7.1752226632845;
 Fri, 11 Jul 2025 02:37:12 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:36:27 +0100
In-Reply-To: <20250711093636.28204-1-verhaegen@google.com>
Mime-Version: 1.0
References: <20250711093636.28204-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711093636.28204-2-verhaegen@google.com>
Subject: [PATCH v2 1/4] ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
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
X-CRM114-CacheID: sfid-20250711_023715_206377_C6146624 
X-CRM114-Status: GOOD (  25.47  )
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

The copied_total field in struct snd_compr_tstamp is a 32-bit
value that can overflow on long-running high-bitrate streams,
leading to incorrect calculations for buffer availablility.

This patch adds a 64-bit safe timestamping mechanism.
It introduces struct snd_compr_tstamp64 in the UAPI
header which uses __u64 for cumulative counters.

A new .pointer64 operation is added to the relevant ASoC and core
compress ops structures. Corresponding ASoC wrapper functions are also
added.

The core timestamping logic is refactored to use u64 for its
internal total_bytes_transferred counter, fixing the internal
state overflow. The logic now attempts to use the new .pointer64
op first, falling back to the legacy 32-bit path if the new op is
not implemented by a driver.

Signed-off-by: Joris Verhaegen <verhaegen@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Reviewed-by: David Li <dvdli@google.com>
Reviewed-by: Miller Liang <millerliang@google.com>
---
 include/sound/compress_driver.h       |  3 ++
 include/sound/soc-component.h         |  5 ++
 include/sound/soc-dai.h               |  6 +++
 include/uapi/sound/compress_offload.h | 19 +++++++
 sound/core/compress_offload.c         | 78 +++++++++++++++++++++------
 sound/soc/soc-component.c             | 20 +++++++
 sound/soc/soc-compress.c              | 21 ++++++++
 sound/soc/soc-dai.c                   | 14 +++++
 8 files changed, 150 insertions(+), 16 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index b55c9eeb2b54..a047ff14a420 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -136,6 +136,7 @@ struct snd_compr_stream {
  * @trigger: Trigger operations like start, pause, resume, drain, stop.
  * This callback is mandatory
  * @pointer: Retrieve current h/w pointer information. Mandatory
+ * @pointer64: Retrieve current h/w pointer information in 64 bit. Optional
  * @copy: Copy the compressed data to/from userspace, Optional
  * Can't be implemented if DSP supports mmap
  * @mmap: DSP mmap method to mmap DSP memory
@@ -162,6 +163,8 @@ struct snd_compr_ops {
 	int (*trigger)(struct snd_compr_stream *stream, int cmd);
 	int (*pointer)(struct snd_compr_stream *stream,
 			struct snd_compr_tstamp *tstamp);
+	int (*pointer64)(struct snd_compr_stream *stream,
+			 struct snd_compr_tstamp64 *tstamp);
 	int (*copy)(struct snd_compr_stream *stream, char __user *buf,
 		       size_t count);
 	int (*mmap)(struct snd_compr_stream *stream,
diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 61534ac0edd1..07d9f0ff7b1c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -48,6 +48,9 @@ struct snd_compress_ops {
 	int (*pointer)(struct snd_soc_component *component,
 		       struct snd_compr_stream *stream,
 		       struct snd_compr_tstamp *tstamp);
+	int (*pointer64)(struct snd_soc_component *component,
+			 struct snd_compr_stream *stream,
+			 struct snd_compr_tstamp64 *tstamp);
 	int (*copy)(struct snd_soc_component *component,
 		    struct snd_compr_stream *stream, char __user *buf,
 		    size_t count);
@@ -500,6 +503,8 @@ int snd_soc_component_compr_get_codec_caps(struct snd_compr_stream *cstream,
 int snd_soc_component_compr_ack(struct snd_compr_stream *cstream, size_t bytes);
 int snd_soc_component_compr_pointer(struct snd_compr_stream *cstream,
 				    struct snd_compr_tstamp *tstamp);
+int snd_soc_component_compr_pointer64(struct snd_compr_stream *cstream,
+				      struct snd_compr_tstamp64 *tstamp);
 int snd_soc_component_compr_copy(struct snd_compr_stream *cstream,
 				 char __user *buf, size_t count);
 int snd_soc_component_compr_set_metadata(struct snd_compr_stream *cstream,
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index d19ab5572d2b..8ecfa966e28a 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -257,6 +257,9 @@ int snd_soc_dai_compr_ack(struct snd_soc_dai *dai,
 int snd_soc_dai_compr_pointer(struct snd_soc_dai *dai,
 			      struct snd_compr_stream *cstream,
 			      struct snd_compr_tstamp *tstamp);
+int snd_soc_dai_compr_pointer64(struct snd_soc_dai *dai,
+				struct snd_compr_stream *cstream,
+				struct snd_compr_tstamp64 *tstamp);
 int snd_soc_dai_compr_set_metadata(struct snd_soc_dai *dai,
 				   struct snd_compr_stream *cstream,
 				   struct snd_compr_metadata *metadata);
@@ -385,6 +388,9 @@ struct snd_soc_cdai_ops {
 			struct snd_soc_dai *);
 	int (*pointer)(struct snd_compr_stream *,
 			struct snd_compr_tstamp *, struct snd_soc_dai *);
+	int (*pointer64)(struct snd_compr_stream *cstream,
+			 struct snd_compr_tstamp64 *tstamp,
+			 struct snd_soc_dai *dai);
 	int (*ack)(struct snd_compr_stream *, size_t,
 			struct snd_soc_dai *);
 };
diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index d62eb93af0ed..abd0ea3f86ee 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -56,6 +56,25 @@ struct snd_compr_tstamp {
 	__u32 sampling_rate;
 } __attribute__((packed, aligned(4)));
 
+/**
+ * struct snd_compr_tstamp64 - timestamp descriptor with fields in 64 bit
+ * @byte_offset: Byte offset in ring buffer to DSP
+ * @copied_total: Total number of bytes copied from/to ring buffer to/by DSP
+ * @pcm_frames: Frames decoded or encoded by DSP. This field will evolve by
+ *	large steps and should only be used to monitor encoding/decoding
+ *	progress. It shall not be used for timing estimates.
+ * @pcm_io_frames: Frames rendered or received by DSP into a mixer or an audio
+ * output/input. This field should be used for A/V sync or time estimates.
+ * @sampling_rate: sampling rate of audio
+ */
+struct snd_compr_tstamp64 {
+	__u32 byte_offset;
+	__u64 copied_total;
+	__u64 pcm_frames;
+	__u64 pcm_io_frames;
+	__u32 sampling_rate;
+} __attribute__((packed, aligned(4)));
+
 /**
  * struct snd_compr_avail - avail descriptor
  * @avail: Number of bytes available in ring buffer for writing/reading
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 840bb9cfe789..6a8873bd62ae 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -176,18 +176,65 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 	return 0;
 }
 
+static int snd_compr_get_tstamp64(struct snd_compr_stream *stream,
+				  struct snd_compr_tstamp64 *tstamp)
+{
+	struct snd_compr_tstamp64 tstamp64_zero;
+
+	memset(tstamp, 0, sizeof(*tstamp));
+	memset(&tstamp64_zero, 0, sizeof(tstamp64_zero));
+
+	if (!stream->ops->pointer64)
+		return -EOPNOTSUPP;
+	stream->ops->pointer64(stream, tstamp);
+
+	/**
+	 * Even if pointer64 is non-null, the driver call may not have been implemented
+	 * (due to indirection in soc-component.c).
+	 * Check that the call was successful by verifying that tstamp is not all zero.
+	 */
+	if (memcmp(tstamp, &tstamp64_zero, sizeof(*tstamp)) == 0) {
+		pr_debug("no tstamp returned from pointer64\n");
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static void
+snd_compr_tstamp32_from_64(struct snd_compr_tstamp *tstamp32,
+			   const struct snd_compr_tstamp64 *tstamp64)
+{
+	tstamp32->byte_offset = tstamp64->byte_offset;
+	tstamp32->copied_total = (u32)tstamp64->copied_total;
+	tstamp32->pcm_frames = (u32)tstamp64->pcm_frames;
+	tstamp32->pcm_io_frames = (u32)tstamp64->pcm_io_frames;
+	tstamp32->sampling_rate = tstamp64->sampling_rate;
+}
+
 static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 		struct snd_compr_tstamp *tstamp)
 {
-	if (!stream->ops->pointer)
-		return -ENOTSUPP;
-	stream->ops->pointer(stream, tstamp);
-	pr_debug("dsp consumed till %d total %d bytes\n",
-		tstamp->byte_offset, tstamp->copied_total);
+	u64 copied_total64;
+	struct snd_compr_tstamp64 tstamp64;
+
+	/* Get 64 bit values if available. Otherwise, fallback to 32 bit. */
+	if (snd_compr_get_tstamp64(stream, &tstamp64) == 0) {
+		copied_total64 = tstamp64.copied_total;
+		snd_compr_tstamp32_from_64(tstamp, &tstamp64);
+	} else {
+		if (!stream->ops->pointer)
+			return -EOPNOTSUPP;
+		stream->ops->pointer(stream, tstamp);
+		copied_total64 = tstamp->copied_total;
+	}
+
+	pr_debug("dsp consumed till %u total %llu bytes\n", tstamp->byte_offset,
+		 copied_total64);
+
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
-		stream->runtime->total_bytes_transferred = tstamp->copied_total;
+		stream->runtime->total_bytes_transferred = copied_total64;
 	else
-		stream->runtime->total_bytes_available = tstamp->copied_total;
+		stream->runtime->total_bytes_available = copied_total64;
 	return 0;
 }
 
@@ -204,9 +251,9 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 		pr_debug("detected init and someone forgot to do a write\n");
 		return stream->runtime->buffer_size;
 	}
-	pr_debug("app wrote %lld, DSP consumed %lld\n",
-			stream->runtime->total_bytes_available,
-			stream->runtime->total_bytes_transferred);
+	pr_debug("app wrote %llu, DSP consumed %llu\n",
+		 stream->runtime->total_bytes_available,
+		 stream->runtime->total_bytes_transferred);
 	if (stream->runtime->total_bytes_available ==
 				stream->runtime->total_bytes_transferred) {
 		if (stream->direction == SND_COMPRESS_PLAYBACK) {
@@ -223,7 +270,7 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
 		avail->avail = stream->runtime->buffer_size - avail->avail;
 
-	pr_debug("ret avail as %lld\n", avail->avail);
+	pr_debug("ret avail as %llu\n", avail->avail);
 	return avail->avail;
 }
 
@@ -274,8 +321,7 @@ static int snd_compr_write_data(struct snd_compr_stream *stream,
 		      (app_pointer * runtime->buffer_size);
 
 	dstn = runtime->buffer + app_pointer;
-	pr_debug("copying %ld at %lld\n",
-			(unsigned long)count, app_pointer);
+	pr_debug("copying %lu at %llu\n", (unsigned long)count, app_pointer);
 	if (count < runtime->buffer_size - app_pointer) {
 		if (copy_from_user(dstn, buf, count))
 			return -EFAULT;
@@ -318,7 +364,7 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 	}
 
 	avail = snd_compr_get_avail(stream);
-	pr_debug("avail returned %ld\n", (unsigned long)avail);
+	pr_debug("avail returned %lu\n", (unsigned long)avail);
 	/* calculate how much we can write to buffer */
 	if (avail > count)
 		avail = count;
@@ -374,7 +420,7 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 	}
 
 	avail = snd_compr_get_avail(stream);
-	pr_debug("avail returned %ld\n", (unsigned long)avail);
+	pr_debug("avail returned %lu\n", (unsigned long)avail);
 	/* calculate how much we can read from buffer */
 	if (avail > count)
 		avail = count;
@@ -443,7 +489,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 #endif
 
 	avail = snd_compr_get_avail(stream);
-	pr_debug("avail is %ld\n", (unsigned long)avail);
+	pr_debug("avail is %lu\n", (unsigned long)avail);
 	/* check if we have at least one fragment to fill */
 	switch (runtime->state) {
 	case SNDRV_PCM_STATE_DRAINING:
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 25f5e543ae8d..7751f9fc2f1d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -656,6 +656,26 @@ int snd_soc_component_compr_pointer(struct snd_compr_stream *cstream,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_compr_pointer);
 
+int snd_soc_component_compr_pointer64(struct snd_compr_stream *cstream,
+				      struct snd_compr_tstamp64 *tstamp)
+{
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_soc_component *component;
+	int i, ret;
+
+	for_each_rtd_components(rtd, i, component) {
+		if (component->driver->compress_ops &&
+		    component->driver->compress_ops->pointer64) {
+			ret = component->driver->compress_ops->pointer64(
+				component, cstream, tstamp);
+			return soc_component_ret(component, ret);
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_compr_pointer64);
+
 int snd_soc_component_compr_copy(struct snd_compr_stream *cstream,
 				 char __user *buf, size_t count)
 {
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 01d1d6bee28c..29a385d327be 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -475,6 +475,25 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 	return ret;
 }
 
+static int soc_compr_pointer64(struct snd_compr_stream *cstream,
+			       struct snd_compr_tstamp64 *tstamp)
+{
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	int ret;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	snd_soc_dpcm_mutex_lock(rtd);
+
+	ret = snd_soc_dai_compr_pointer64(cpu_dai, cstream, tstamp);
+	if (ret < 0)
+		goto out;
+
+	ret = snd_soc_component_compr_pointer64(cstream, tstamp);
+out:
+	snd_soc_dpcm_mutex_unlock(rtd);
+	return ret;
+}
+
 static int soc_compr_set_metadata(struct snd_compr_stream *cstream,
 				  struct snd_compr_metadata *metadata)
 {
@@ -513,6 +532,7 @@ static struct snd_compr_ops soc_compr_ops = {
 	.get_params	= soc_compr_get_params,
 	.trigger	= soc_compr_trigger,
 	.pointer	= soc_compr_pointer,
+	.pointer64	= soc_compr_pointer64,
 	.ack		= soc_compr_ack,
 	.get_caps	= snd_soc_component_compr_get_caps,
 	.get_codec_caps = snd_soc_component_compr_get_codec_caps,
@@ -528,6 +548,7 @@ static struct snd_compr_ops soc_compr_dyn_ops = {
 	.get_metadata	= soc_compr_get_metadata,
 	.trigger	= soc_compr_trigger_fe,
 	.pointer	= soc_compr_pointer,
+	.pointer64	= soc_compr_pointer64,
 	.ack		= soc_compr_ack,
 	.get_caps	= snd_soc_component_compr_get_caps,
 	.get_codec_caps = snd_soc_component_compr_get_codec_caps,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a210089747d0..5aadf661b65d 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -784,6 +784,20 @@ int snd_soc_dai_compr_pointer(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_compr_pointer);
 
+int snd_soc_dai_compr_pointer64(struct snd_soc_dai *dai,
+				struct snd_compr_stream *cstream,
+				struct snd_compr_tstamp64 *tstamp)
+{
+	int ret = 0;
+
+	if (dai->driver->cops &&
+	    dai->driver->cops->pointer64)
+		ret = dai->driver->cops->pointer64(cstream, tstamp, dai);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_compr_pointer64);
+
 int snd_soc_dai_compr_set_metadata(struct snd_soc_dai *dai,
 				   struct snd_compr_stream *cstream,
 				   struct snd_compr_metadata *metadata)
-- 
2.50.0.727.gbf7dc18ff4-goog


