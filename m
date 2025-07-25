Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C79C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqRJeB3ZOhOyNMpaxrCuy+vXcmCv+FI9NJwY2DwIw1Q=; b=4kd+1si6qkAiGyXshIHtc1vqSE
	Y6BoPWDh5by9eNbzFr+kYpFqW0oS/PDH2UUdQu5vhScQG0Xu2q38Ph4x4lrpsIgmPNs8zfSVKpNFf
	JlbqVtlBzIerwcVV6joP7BfACUlEEqlUeJlrjZStquFS060V0anVX1d4YFEYYeqXHdBLDBaEpX0jX
	u+oFqhUomjP8oIFKmS4GuNwfqu90WRgS8rBUu1ZbqxmH3C2jJQ3A2sfxLHwpSGRhYymPDpNR/hn7s
	WAgPQlNxnQiiyY/llROFTEHzej5DlOMDkTd5CWN08SUKG5ZA8nN5o+NDyM9KFtO4QX2TQBdTwzIoM
	YJJ7ijWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHIZ-00000009nDh-01dp;
	Fri, 25 Jul 2025 12:13:15 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGpf-00000009k5w-3SkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:43:24 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so1339733f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753443802; x=1754048602; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aqRJeB3ZOhOyNMpaxrCuy+vXcmCv+FI9NJwY2DwIw1Q=;
        b=W96b6BKT6Bq6Cs5PDwguaLfdtIAVhFmG3xwRIu2vxXOyE9GCBVZKLnPZo6ZKY5yjqq
         XALivNkDiE4PNUlZxdYMbHpRQd2U7z9vcj/eU+3XgmXRoBTEEf6+Gash1/Qjoi9LemQ2
         +vjOqiH1XSPrRd01gCGIokIjWwk1dIbWQqzBd9/U2asp9lEpenRdinvc2X2/egFV2w2C
         D9j6gN0GpJiWvY3Xh40qD9XUHDFuK2YfVsuamgP9sP+2a1sXjWuXAoBSfC/Uqd3K7pcf
         QhFioktW9nWXD+EHxihlbcta2uQQBpjXiZSQstA5za21eJiYlcNnUhHTMS0jmndeh0HY
         hvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443802; x=1754048602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqRJeB3ZOhOyNMpaxrCuy+vXcmCv+FI9NJwY2DwIw1Q=;
        b=GQRjDW4/mmrCU+XrFJp/iE9MaV/mpDjpIr8nK60NNJvLPtmdjWcNeJlCIEhzmF2bWC
         +W/C5O1+FGE5uVaRSLSqvtY++nTMei0+8h8D15q70Y+YzAiBN+LmmB46pxLYknkFZAtK
         Xe5UjbnYf6qqqMOrwv7wjiYer6xc9dCzBbho7dBTYR4OGrPuP1c2ce1TYX0i3jw5qnqx
         emykgUxjrraog3hjVHZvNwGOpyewB4dgyS1R2C+vtDsx3RXkCZCwNnOTSOAz7zVgY8zz
         3ljce2cekYrVX1qKZ8H9hc0jTQQ+sXztse4UVPcq93NfysW46eT1KXl5rAzgnd5gNr9u
         DYug==
X-Forwarded-Encrypted: i=1; AJvYcCXMdkiIolNLPpAo2gVOmWNXKAbZQtf3xoZH6EjEOlfE2BUAQ714VvRBCmxZQUk9dQ/ClO1wvBnAjsh6aVGMwys/@lists.infradead.org
X-Gm-Message-State: AOJu0YytTLs6OO+sW8Rqvmfs+z9Wj0qheyY2cc/VIWN1e5l7X4BMnhjN
	AoENTaKrzmJV/NJoDht+Um1fB1o2LOFI03xJLnshh926QzLS7BTF577AratTEr0/W5/igKGhbN+
	szTYyfKugzL6wyQJyfg==
X-Google-Smtp-Source: AGHT+IHGAUF8Q7Gd9qDiczST6gVfYuJvOxlipqHbB5s/ofwidCkWtf8SPhwLkjVb4BeR2JNZtpLO8MRs4iHGYDE=
X-Received: from wmbjn21.prod.google.com ([2002:a05:600c:6b15:b0:456:12af:6677])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4022:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b77675db6amr1168191f8f.37.1753443802095;
 Fri, 25 Jul 2025 04:43:22 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:42:45 +0100
In-Reply-To: <20250725114249.2086974-1-verhaegen@google.com>
Mime-Version: 1.0
References: <20250725114249.2086974-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250725114249.2086974-4-verhaegen@google.com>
Subject: [PATCH v3 3/3] ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
From: Joris Verhaegen <verhaegen@google.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
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
	Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_044323_868712_DC81B313 
X-CRM114-Status: GOOD (  19.09  )
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

The previous patch introduced a 64-bit timestamp ioctl
(SNDRV_COMPRESS_TSTAMP64). To provide a consistent API, this patch
adds a corresponding 64-bit version of the SNDRV_COMPRESS_AVAIL ioctl.

A new struct snd_compr_avail64 is added to the UAPI, which includes
the 64-bit timestamp. The existing ioctl implementation is refactored
to handle both the 32-bit and 64-bit variants.

Reviewed-by: Miller Liang <millerliang@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Signed-off-by: Joris Verhaegen <verhaegen@google.com>
---
 include/uapi/sound/compress_offload.h | 11 +++++++
 sound/core/compress_offload.c         | 45 +++++++++++++++++----------
 2 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 70b8921601f9..26f756cc2e62 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -84,6 +84,16 @@ struct snd_compr_avail {
 	struct snd_compr_tstamp tstamp;
 } __attribute__((packed, aligned(4)));
 
+/**
+ * struct snd_compr_avail64 - avail descriptor with tstamp in 64 bit format
+ * @avail: Number of bytes available in ring buffer for writing/reading
+ * @tstamp: timestamp information
+ */
+struct snd_compr_avail64 {
+	__u64 avail;
+	struct snd_compr_tstamp64 tstamp;
+} __attribute__((packed, aligned(4)));
+
 enum snd_compr_direction {
 	SND_COMPRESS_PLAYBACK = 0,
 	SND_COMPRESS_CAPTURE,
@@ -231,6 +241,7 @@ struct snd_compr_task_status {
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
 #define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
+#define SNDRV_COMPRESS_AVAIL64		_IOR('C', 0x23, struct snd_compr_avail64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 445220fdb6a0..4d3cf49c0c47 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -203,13 +203,10 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 }
 
 static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
-		struct snd_compr_avail *avail)
+				   struct snd_compr_avail64 *avail)
 {
-	struct snd_compr_tstamp64 tstamp64 = { 0 };
-
 	memset(avail, 0, sizeof(*avail));
-	snd_compr_update_tstamp(stream, &tstamp64);
-	snd_compr_tstamp32_from_64(&avail->tstamp, &tstamp64);
+	snd_compr_update_tstamp(stream, &avail->tstamp);
 	/* Still need to return avail even if tstamp can't be filled in */
 
 	if (stream->runtime->total_bytes_available == 0 &&
@@ -233,32 +230,47 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 	}
 
 	avail->avail = stream->runtime->total_bytes_available -
-			stream->runtime->total_bytes_transferred;
+		       stream->runtime->total_bytes_transferred;
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
 		avail->avail = stream->runtime->buffer_size - avail->avail;
 
-	pr_debug("ret avail as %llu\n", avail->avail);
+	pr_debug("ret avail as %zu\n", (size_t)avail->avail);
 	return avail->avail;
 }
 
 static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
 {
-	struct snd_compr_avail avail;
+	struct snd_compr_avail64 avail;
 
 	return snd_compr_calc_avail(stream, &avail);
 }
 
-static int
-snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
+static void snd_compr_avail32_from_64(struct snd_compr_avail *avail32,
+				      const struct snd_compr_avail64 *avail64)
 {
-	struct snd_compr_avail ioctl_avail;
+	avail32->avail = avail64->avail;
+	snd_compr_tstamp32_from_64(&avail32->tstamp, &avail64->tstamp);
+}
+
+static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
+				 unsigned long arg, bool is_32bit)
+{
+	struct snd_compr_avail64 ioctl_avail64;
+	struct snd_compr_avail ioctl_avail32;
 	size_t avail;
+	const void *copy_from = &ioctl_avail64;
+	size_t copy_size = sizeof(ioctl_avail64);
 
 	if (stream->direction == SND_COMPRESS_ACCEL)
 		return -EBADFD;
 
-	avail = snd_compr_calc_avail(stream, &ioctl_avail);
-	ioctl_avail.avail = avail;
+	avail = snd_compr_calc_avail(stream, &ioctl_avail64);
+	ioctl_avail64.avail = avail;
+	if (is_32bit) {
+		snd_compr_avail32_from_64(&ioctl_avail32, &ioctl_avail64);
+		copy_from = &ioctl_avail32;
+		copy_size = sizeof(ioctl_avail32);
+	}
 
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
@@ -269,8 +281,7 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
 		break;
 	}
 
-	if (copy_to_user((__u64 __user *)arg,
-				&ioctl_avail, sizeof(ioctl_avail)))
+	if (copy_to_user((__u64 __user *)arg, copy_from, copy_size))
 		return -EFAULT;
 	return 0;
 }
@@ -1336,7 +1347,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 	case SNDRV_COMPRESS_TSTAMP64:
 		return snd_compr_tstamp(stream, arg, false);
 	case SNDRV_COMPRESS_AVAIL:
-		return snd_compr_ioctl_avail(stream, arg);
+		return snd_compr_ioctl_avail(stream, arg, true);
+	case SNDRV_COMPRESS_AVAIL64:
+		return snd_compr_ioctl_avail(stream, arg, false);
 	case SNDRV_COMPRESS_PAUSE:
 		return snd_compr_pause(stream);
 	case SNDRV_COMPRESS_RESUME:
-- 
2.50.1.470.g6ba607880d-goog


