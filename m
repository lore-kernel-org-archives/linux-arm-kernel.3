Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E79CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDPGzsxAKKvH1GDMNj6CwOgMXSMzqp7fsMOzyvpH+nA=; b=n8cCaJa3s53SYCJhoRiECRvvwR
	vuLoUQBszHtQxrHDUfD1kpb7huQey3phpLXgx5w5Kl2z/aP/cts5PYopKtEn+j7EjI+PBK1O/3/bM
	JoXaKyv7/+KdbFniOEaVJlbwF5ZS19oY58pNw0uj4fs/EymbtK5aZ7ZHsZCsDsApVMlUF/1Nzi2oV
	MRWeUO2HkREjyfTvaMIHAjjjhVNWPZDeHAB4kff6JOGcCcQ1NFHBeYi2ht8+VDMwyb2FhFzann59E
	R1zsCfqomMBhJw4BgAKzJ0AtPgqJ77gkyQSGrsqRZDU8KWX8ZI6Zaah3HXqnrn9Z633MacphY/HYJ
	34dhiyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUa-00000002JS4-28AH;
	Fri, 05 Sep 2025 14:32:44 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSVc-00000000eWb-0AqL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:13:29 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3e2055ce94bso1028228f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757063606; x=1757668406; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDPGzsxAKKvH1GDMNj6CwOgMXSMzqp7fsMOzyvpH+nA=;
        b=2Bhq82RkN9KxEqUFH7m8cRPoy5oVxI381uv7fED2+IxsEXPAmNLwRtcUSnXjp6EQ3j
         djp3GJ2devzWxb2c4LALuHNS+9DaY2Fk0ZMwCQnnu8zFP3kyxILtKROdQVRIcs1WoHar
         4v9g2gttk+pRxsueTJ/sK3rNSyuYFcbq3kbvktmJp65D37lzrcn4bS7BGnBIdHbpnqaN
         x51LyZq3PRCblpWe03Z1cYr1J1MO8yzGytWy7TDiLjS9hwamLrtcHpXYrBt1zr1urxJ4
         GTKtYcgYIoGteu1lCUsDtR7IFV2dHoS4GnA+DiCxctwRQHaYJVo7tPtL78FT70Jy0x32
         JHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063606; x=1757668406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDPGzsxAKKvH1GDMNj6CwOgMXSMzqp7fsMOzyvpH+nA=;
        b=DXdgaUJlfS+RCrBI1+7pg1YNWqtnPRMEUTwsB083koAJepM+3LX3azv1cZZCTj9o30
         6K52sLMVv7OCoRyaVPHwC+DGvkXbSz23rS3vkJOHixnbVaFnFoQeOhwN8WBA04gI35NL
         whXlzmXDDwMboaXlxChW7I7EGF+Vn99pBC7jSSXCCzHJAmNiIy5XpYEL9dOKuGe8sZJ2
         knsjyCUq+AschpScT5+I6Bq/RP2eVn4BTvFS9n/D3PGGQOxGIizWUHUL3wAkZEZpd1t9
         PYEnFI+d7bUoT1sBRsFAlAbJOfT/gWF3iFXiK8zi9L0Lt9VF92j4y0nrB2fbWvJepbSu
         HhxA==
X-Forwarded-Encrypted: i=1; AJvYcCVtpOJH5NQ5zY27u8gLsfQOX4OcLzaujNf5/pqgZGvGLcTI2MiMoFOecI2XV54qJKM1vMMgsDO8kLqg7Vbl0zok@lists.infradead.org
X-Gm-Message-State: AOJu0YwbCD2XWvL52dj0AOmZGIo66zdeveApM3l/8iUFVaTTew+peEww
	BaUEFvW32E9fVR8jgOeck4mDwxi5GnJJgyAZG8sGGgA9ter/ZBzbtMneA9Af5h/hcnEWHjSXI/n
	P6Gj028KN7k/Sa+yAAA==
X-Google-Smtp-Source: AGHT+IEyDlexP0RAVrpJVCl0chgZCWyPtv6v1WIav3zbUk2uYgIv0ZwyKau6Sc8ZZDKm6Mlu1EdrYFeaxTOrcP8=
X-Received: from wmby11-n1.prod.google.com ([2002:a05:600c:c04b:10b0:45d:d179:882f])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5849:0:b0:3b7:9929:871c with SMTP id ffacd0b85a97d-3d1de5b09e9mr15575101f8f.37.1757063606306;
 Fri, 05 Sep 2025 02:13:26 -0700 (PDT)
Date: Fri,  5 Sep 2025 10:12:55 +0100
In-Reply-To: <20250905091301.2711705-1-verhaegen@google.com>
Mime-Version: 1.0
References: <20250905091301.2711705-1-verhaegen@google.com>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905091301.2711705-3-verhaegen@google.com>
Subject: [PATCH v5 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
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
X-CRM114-CacheID: sfid-20250905_021328_082299_BDD3A370 
X-CRM114-Status: GOOD (  16.59  )
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

This patch bumps the SNDRV_COMPRESS_VERSION to 0.4.0.

Reviewed-by: Miller Liang <millerliang@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Signed-off-by: Joris Verhaegen <verhaegen@google.com>
---
 include/uapi/sound/compress_offload.h |  5 +++--
 sound/core/compress_offload.c         | 19 +++++++++++++------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index abd0ea3f86ee..70b8921601f9 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -13,8 +13,7 @@
 #include <sound/asound.h>
 #include <sound/compress_params.h>
 
-
-#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
+#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
 /**
  * struct snd_compressed_buffer - compressed buffer
  * @fragment_size: size of buffer fragment in bytes
@@ -208,6 +207,7 @@ struct snd_compr_task_status {
  * Note: only codec params can be changed runtime and stream params cant be
  * SNDRV_COMPRESS_GET_PARAMS: Query codec params
  * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
+ * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
  * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
  * This also queries the tstamp properties
  * SNDRV_COMPRESS_PAUSE: Pause the running stream
@@ -230,6 +230,7 @@ struct snd_compr_task_status {
 						 struct snd_compr_metadata)
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
+#define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index d3164aa07158..445220fdb6a0 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -736,18 +736,23 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 	return retval;
 }
 
-static inline int
-snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
+static inline int snd_compr_tstamp(struct snd_compr_stream *stream,
+				   unsigned long arg, bool is_32bit)
 {
 	struct snd_compr_tstamp64 tstamp64 = { 0 };
 	struct snd_compr_tstamp tstamp32 = { 0 };
+	const void *copy_from = &tstamp64;
+	size_t copy_size = sizeof(tstamp64);
 	int ret;
 
 	ret = snd_compr_update_tstamp(stream, &tstamp64);
 	if (ret == 0) {
-		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
-		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
-				   &tstamp32, sizeof(tstamp32)) ?
+		if (is_32bit) {
+			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
+			copy_from = &tstamp32;
+			copy_size = sizeof(tstamp32);
+		}
+		ret = copy_to_user((void __user *)arg, copy_from, copy_size) ?
 			      -EFAULT :
 			      0;
 	}
@@ -1327,7 +1332,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 
 	switch (cmd) {
 	case SNDRV_COMPRESS_TSTAMP:
-		return snd_compr_tstamp(stream, arg);
+		return snd_compr_tstamp(stream, arg, true);
+	case SNDRV_COMPRESS_TSTAMP64:
+		return snd_compr_tstamp(stream, arg, false);
 	case SNDRV_COMPRESS_AVAIL:
 		return snd_compr_ioctl_avail(stream, arg);
 	case SNDRV_COMPRESS_PAUSE:
-- 
2.51.0.355.g5224444f11-goog


