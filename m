Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06138C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L1+KbxtaiQj6sn8lQLye+giidcKEKOPXNRznqTkxqk=; b=gMyhBfzOLurYXYU0QkjqedydbH
	X82nSibpD4vbUYA/RBhXtOiMoZ9X8E5+Higsz68lWEENuZhRWl56CA3NBpnMvFV8ZXqEvZ3/+DFht
	NJI+vbDwTV5awr6Rr3It5IEwHaxvqLMLrhQItVrcLRMXlh60ukQ+oBn0/IB6ful39SSY93lKpPNxg
	xI69tg4K8h8h/ZGH4yYTP/sHjkWnNRzaTKwqkaqna5D/suFl5wSmYfqt8n32ssCfegH9KbL7blKUG
	+3vdQ2F94M02QhzLdJie+/KqlREvZQT/7urCbag/apgjPnldNqt3H6xU3zBdNpTXQH14n/QNr0hgZ
	f86atFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9ww-0000000EHyz-1NP5;
	Fri, 11 Jul 2025 09:21:46 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua94u-0000000E7v6-2Box
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:25:57 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso10560205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752222354; x=1752827154; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8L1+KbxtaiQj6sn8lQLye+giidcKEKOPXNRznqTkxqk=;
        b=A0FQSmJdAF7ceuvhDwTnLSDlwgUqIwy3701QmXF96KhjSlzFQlskXGJ8vj4F/aDYfd
         r5gQ4Rjr3GLgY/d0MPSDz2DUHBqys3GZKgiQACeXfpkWjz+UQJJ1sXbGzIJn5mhDTdpY
         PKbvb2IzELM+zZD54zLmJCPYjlth4PxI3rPraKIkOIeT98+DQ3xKGxTNbVlyxw1h5Qwt
         622MrY++AOTGUx/qnQbPQkYkglB3i1OVOtdDZP1AJKC1PxNndelgf4NjIuPLu4t4MoNC
         aVxMEVmGWaBy58UR961Deo62tfiYdpwRgM+0AV8arlDqr7w9mh3OBfMQP9DumUPVPOGl
         X2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222354; x=1752827154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8L1+KbxtaiQj6sn8lQLye+giidcKEKOPXNRznqTkxqk=;
        b=OI7RtBJL2BJDMEMCBa6+GI+dy7IIGYyAwTbUhVqhtZOdIzgHzBABEcOoiKdbs/P3ig
         JPDJkrE9jNH68hQvfNuU+q8SppjkGFBD98eLYVfrTFoLbnJKHJ4SqSUm+9nmD3Z6hJO0
         PGbGHGKsiYovDB1qV4EVXdzxn5MGvkFYG3YPUtE63fSJLtZeM2Y8bxnRkNjrAjHmmdzx
         ipd9Eh9BodCFEuiwqTqAn1x96qX4N4kDITlcZsloW1/ucjnq0c9rsBcjk1MBsVi4/u3+
         r4olhfU6pInNheBXTZ0F1J1sVrLcbo0Fp/177ejz/Dc8KhyuQvO1R/19jhTZewVWQyd1
         1FYA==
X-Forwarded-Encrypted: i=1; AJvYcCXaFws6SEK/mQwLPSi8wp3bVfkmm6m/aVcd4xgyo6qUz4A2X1V6vx4x3BM+h7g/KcGfTc5n2JAfK56qikKjzSt/@lists.infradead.org
X-Gm-Message-State: AOJu0YzgCpb+D3Iag77GNKyg0jle33zlxl/7bVu/4G8lziu237rjnKoh
	OWr84iByo4+Q6/i6g9qmqmAsNncEJbG7J25Wgkn3oQ9LVKiBNSrlse0EeF/567eP1KkkFPkyr1/
	NqhDpF75yNTF4y+YJxA==
X-Google-Smtp-Source: AGHT+IEhhhO+Ek1toZERYmrZMeqyTAhmBuFzPDQDq9WLvA9pxxXLVvjyXL3kguu3RptTS4+kf0xbW/3oRFlCSYQ=
X-Received: from wmbeq14.prod.google.com ([2002:a05:600c:848e:b0:453:6ee6:e62a])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e83:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-454db8d8d06mr65138905e9.16.1752222354317;
 Fri, 11 Jul 2025 01:25:54 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:24:34 +0100
In-Reply-To: <20250711082441.4193295-1-verhaegen@google.com>
Mime-Version: 1.0
References: <20250711082441.4193295-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711082441.4193295-3-verhaegen@google.com>
Subject: [PATCH v1 2/4] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
From: George Verhaegen <verhaegen@google.com>
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
X-CRM114-CacheID: sfid-20250711_012556_563358_994A49CE 
X-CRM114-Status: GOOD (  17.26  )
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

From: Joris Verhaegen <verhaegen@google.com>

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


