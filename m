Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6226BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WywIvLAv4IB9b6g8T96e6Qsk8BIfajnf2gbyC1P4AZo=; b=A+e9dlMqiNtVnb5QuLiZriuStV
	levvYgs30RxtZyYCyMwqaq3qziHP1+q+v+gl29gxypvdMTRG73jzywBvLHlT6Q4Su8vyBdRANdxRn
	x0HemlD9SlyllIx8CIbUh7w/jPnaRp6j1V8qWutAe9XM+8Bsp4qKtTj5aY/xfyUK6hMO8zIsRgteM
	dH8QKcu8MMHZvJ9k+4HnBIyVaTKQhQQHfagTbvCUz0PYC9XBa+kidzOG5Rcy7mrDzSbHdwCF9d3UO
	v62SPif8Fc+SNr+63x4qso8tAotX3tb7xt6BD70R2x63Y49ks7N0jMop43q4AEOTDU+Ar1tqHln88
	/OVjiEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAvt-0000000ETo6-0z9F;
	Fri, 11 Jul 2025 10:24:45 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaACA-0000000EKsO-0xYP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:37:31 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so1222072f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752226648; x=1752831448; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WywIvLAv4IB9b6g8T96e6Qsk8BIfajnf2gbyC1P4AZo=;
        b=QGI149DwziaSW29vBE42sUlzWiFAXRPfJ3SUiv+JUdo5pSRXzrtVARoLjRkoOH0VmW
         B4wIeKw/mNcjA6Ffu+K+QOwdA5hHNsgsEnm9OZKxPeYYndDiX5BkfY2PyXdwqxr81+qJ
         Vua2PZuXz0gXl7/UTt8zPuaOFOmfmStZn43ZYaBNiXHMys3jE3THhyhN7Oe35B8S09J9
         dpfOK5Q0DusPj8E0PpUXhEimwHM9Pvh+m+nrVrZL+xAomnLnWUPtqUB1pqf9FbBEQUIb
         kptiWNj6GY4SCKamS7oMDBw4KVDqXO5X/Lo0ntrDCnZju+l1YBs7gM6CPWIe1ys5n9Xv
         67AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226648; x=1752831448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WywIvLAv4IB9b6g8T96e6Qsk8BIfajnf2gbyC1P4AZo=;
        b=RCvEzv2TkIt0sZbZq38VFzRIkGfWNa+mu3ZLFN8jIJwHstT8/FX6Mko+ttxcPlCBi0
         MKTX+mbVGpBsNIWWXSANfHLDVjkm5/hBTuKpIkJy5DUXXWYBpFnQqCEyNTz83CjHqoZM
         vREyqt13nxP9QIZKnE+Dy/ir0RzFu7fT3xVIIEBW/x5w+LPkUlR0430ZdFxmHc36uX2B
         SXujreYvtfdWQDHKAG+iL/HJlhRBvpOQPx4SUh9jeX1/i+vt81JheSEEqLlxHEFCSaeh
         /B0eWEgbQULe3v97MuhCCX7goBsUnLIH/E6wKacQbFEXUqJGYHMPC7eXa+PAjR48hQic
         KYjw==
X-Forwarded-Encrypted: i=1; AJvYcCU1TpZCy5jDztU1nak/RsgBDNU8aSQKa35TuIn1KB8QwyPWK7NYIC2bJOAHzm3tcRJevm7LzBPGzxPSwxnKXkmW@lists.infradead.org
X-Gm-Message-State: AOJu0YxIMFe1dgVeawGTZTyzZdOlqiGIegwunwbDGAk+rJln+byu3YKZ
	Heq5PaB26f2pCOiihZJF2chmPvKyATMAYoWnSZoevuZU/8YUu4gRW3uAXUdJvOKLG4Egv8SuPxJ
	vBVfOGAtGkzmAlIxQYg==
X-Google-Smtp-Source: AGHT+IEmEE9dNv4iiepa6OEju/MJzJFG2hiRPgxw7iu3SiyhF7OruOUvPAPmCsUrMtbUZ8nFQRE0HzcU37l0TXw=
X-Received: from wmbea14.prod.google.com ([2002:a05:600c:674e:b0:43d:9035:df36])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:18a3:b0:3a8:6262:6ef5 with SMTP id ffacd0b85a97d-3b5f2db15bemr1466223f8f.10.1752226648115;
 Fri, 11 Jul 2025 02:37:28 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:36:29 +0100
In-Reply-To: <20250711093636.28204-1-verhaegen@google.com>
Mime-Version: 1.0
References: <20250711093636.28204-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711093636.28204-4-verhaegen@google.com>
Subject: [PATCH v2 3/4] ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
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
X-CRM114-CacheID: sfid-20250711_023730_260794_D345D78C 
X-CRM114-Status: GOOD (  18.86  )
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

Previous patches introduced ioctl for fetching a 64-bit timestamp via
SNDRV_COMPRESS_TSTAMP64. To provide a consistent API, a 64-bit
version of SNDRV_COMPRESS_AVAIL ioctl is required.

Define a new struct snd_compr_avail64, which embeds the 64-bit
timestamp struct, and define the corresponding SNDRV_COMPRESS_AVAIL64
ioctl command in the UAPI header.

Signed-off-by: Joris Verhaegen <verhaegen@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Reviewed-by: David Li <dvdli@google.com>
Reviewed-by: Miller Liang <millerliang@google.com>
---
 include/uapi/sound/compress_offload.h | 11 ++++
 sound/core/compress_offload.c         | 88 +++++++++++++++++++++------
 2 files changed, 79 insertions(+), 20 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 2758d9ee3d91..48525a87d98f 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -85,6 +85,16 @@ struct snd_compr_avail {
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
@@ -232,6 +242,7 @@ struct snd_compr_task_status {
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
 #define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
+#define SNDRV_COMPRESS_AVAIL64		_IOR('C', 0x23, struct snd_compr_avail64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 40c1e69961b7..78ba86e0d74f 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -257,12 +257,11 @@ static int snd_compr_update_tstamp64(struct snd_compr_stream *stream,
 	return 0;
 }
 
-static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
-		struct snd_compr_avail *avail)
+static size_t snd_compr_calc_avail_internal(struct snd_compr_stream *stream,
+					    struct snd_compr_avail *avail32,
+					    struct snd_compr_avail64 *avail64)
 {
-	memset(avail, 0, sizeof(*avail));
-	snd_compr_update_tstamp32(stream, &avail->tstamp);
-	/* Still need to return avail even if tstamp can't be filled in */
+	u64 avail;
 
 	if (stream->runtime->total_bytes_available == 0 &&
 			stream->runtime->state == SNDRV_PCM_STATE_SETUP &&
@@ -284,33 +283,68 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 		}
 	}
 
-	avail->avail = stream->runtime->total_bytes_available -
-			stream->runtime->total_bytes_transferred;
+	avail = stream->runtime->total_bytes_available -
+		stream->runtime->total_bytes_transferred;
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
-		avail->avail = stream->runtime->buffer_size - avail->avail;
+		avail = stream->runtime->buffer_size - avail;
+
+	if (avail32)
+		avail32->avail = avail;
+	if (avail64)
+		avail64->avail = avail;
+
+	pr_debug("ret avail %llu as %zu\n", avail, (size_t)avail);
+	return avail;
+}
+
+static size_t snd_compr_calc_avail32(struct snd_compr_stream *stream,
+				     struct snd_compr_avail *avail)
+{
+	memset(avail, 0, sizeof(*avail));
+	snd_compr_update_tstamp32(stream, &avail->tstamp);
+	/* Still need to return avail even if tstamp can't be filled in */
 
-	pr_debug("ret avail as %llu\n", avail->avail);
-	return avail->avail;
+	return snd_compr_calc_avail_internal(stream, avail, NULL);
+}
+
+static size_t snd_compr_calc_avail64(struct snd_compr_stream *stream,
+				     struct snd_compr_avail64 *avail)
+{
+	memset(avail, 0, sizeof(*avail));
+	snd_compr_update_tstamp64(stream, &avail->tstamp);
+	/* Still need to return avail even if tstamp can't be filled in */
+
+	return snd_compr_calc_avail_internal(stream, NULL, avail);
 }
 
 static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
 {
 	struct snd_compr_avail avail;
 
-	return snd_compr_calc_avail(stream, &avail);
+	return snd_compr_calc_avail32(stream, &avail);
 }
 
-static int
-snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
+static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
+				 unsigned long arg, bool is_64bit)
 {
-	struct snd_compr_avail ioctl_avail;
-	size_t avail;
+	union {
+		struct snd_compr_avail avail32;
+		struct snd_compr_avail64 avail64;
+	} ioctrl_avail_u;
+	size_t avail, ioctrl_avail_size;
 
 	if (stream->direction == SND_COMPRESS_ACCEL)
 		return -EBADFD;
 
-	avail = snd_compr_calc_avail(stream, &ioctl_avail);
-	ioctl_avail.avail = avail;
+	if (is_64bit) {
+		avail = snd_compr_calc_avail64(stream, &ioctrl_avail_u.avail64);
+		ioctrl_avail_u.avail64.avail = avail;
+		ioctrl_avail_size = sizeof(ioctrl_avail_u.avail64);
+	} else {
+		avail = snd_compr_calc_avail32(stream, &ioctrl_avail_u.avail32);
+		ioctrl_avail_u.avail32.avail = avail;
+		ioctrl_avail_size = sizeof(ioctrl_avail_u.avail32);
+	}
 
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
@@ -321,12 +355,24 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
 		break;
 	}
 
-	if (copy_to_user((__u64 __user *)arg,
-				&ioctl_avail, sizeof(ioctl_avail)))
+	if (copy_to_user((__u64 __user *)arg, &ioctrl_avail_u,
+			 ioctrl_avail_size))
 		return -EFAULT;
 	return 0;
 }
 
+static int snd_compr_ioctl_avail32(struct snd_compr_stream *stream,
+				   unsigned long arg)
+{
+	return snd_compr_ioctl_avail(stream, arg, false);
+}
+
+static int snd_compr_ioctl_avail64(struct snd_compr_stream *stream,
+				   unsigned long arg)
+{
+	return snd_compr_ioctl_avail(stream, arg, true);
+}
+
 static int snd_compr_write_data(struct snd_compr_stream *stream,
 	       const char __user *buf, size_t count)
 {
@@ -1393,7 +1439,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 	case _IOC_NR(SNDRV_COMPRESS_TSTAMP64):
 		return snd_compr_tstamp64(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_AVAIL):
-		return snd_compr_ioctl_avail(stream, arg);
+		return snd_compr_ioctl_avail32(stream, arg);
+	case _IOC_NR(SNDRV_COMPRESS_AVAIL64):
+		return snd_compr_ioctl_avail64(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_PAUSE):
 		return snd_compr_pause(stream);
 	case _IOC_NR(SNDRV_COMPRESS_RESUME):
-- 
2.50.0.727.gbf7dc18ff4-goog


