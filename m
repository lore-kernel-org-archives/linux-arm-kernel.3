Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9ADC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+a+TqK/s3X4ICiheNo2EUiGxut07xdB8F6iCq61W8U=; b=XXkAIkrQXNfG212jDYHC2nZ0Ei
	tTv2WPETs9hDdor9C/dBMsaHTlLIm3R55B3RnlZcII+2o0RMAmU7418kqgZiz85fkYoHu+PQfVTlX
	rWQlZCo/f3U3BkhJdvPhnmlUEaMV7QazfppuiEwuS1Z71gdaS48e9SPoNueFuINmzxkpsa9ZwY/3R
	zEg7fQSZeBUKZij/7pWXJ/ZIggtAafy1xmpqLZCEEA/RHdRevRa/6twwqEhmHjR3lgemwlH8DQXQU
	50QzwRSrPyQVUKccwN6DEiJfJV0RQ7vykOW2tKvUmAjNntBSdmDBeFQw5M9IHH3vF8/hCKNZXox8j
	C2r7GJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHG7-00000009mwE-10GR;
	Fri, 25 Jul 2025 12:10:43 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGpY-00000009k3E-2ZFD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:43:17 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so859527f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753443794; x=1754048594; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+a+TqK/s3X4ICiheNo2EUiGxut07xdB8F6iCq61W8U=;
        b=jpId1ltirvyEl+7vxnfutmh+SW5rbXF66l7Gvuuwddu8NFBzIVRTfq5rHD28aOXqIw
         37imRZMG9XQs3rhf2tB+T6C64S1toIFL7X0Y0hGtwRFt1sImxLqHYzbL3b+ZnE6ZLeDS
         IZh2vIU3B27Fz+0ZCWUIj0ONpWXxpmJEcAfbhStPIO4gDLTeN/bh+PoSWMrylAcbNx3V
         A9GRMHPS3itTBJtbXXCQXWp0gXgv3e77TqKSt0NWKMBIus3yq8MrhlZllFFzyS1kX20P
         OKw0rRq68FZd2xL82jcFRf6HbnR8vbru9v3XfzgdwlUBwzBh2lqz61HLYk+gY/nmEAy3
         2Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443794; x=1754048594;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c+a+TqK/s3X4ICiheNo2EUiGxut07xdB8F6iCq61W8U=;
        b=PI1zoEtm15JiSIy6DLDIeYZpAkttDx9UoZk/iyreN2R6WXB/Mq/SP7sESxANMUWo32
         dnxaSKxCjUvMvB7MgdvsJiEDnRNMGFgkQPo4WNS3YMUqh9Oh8LIBRCiY6kIx33EXrmM7
         g+2iVP/IsjF2A+zoB6K76y9acJM2S4NtLzYRLhyiM6MdM7MzvDRDN/9HCbwcoLIyBzhA
         MES5PBAkVdYn/zq7C0Uq7/Wq4jJU63AIJytcTIWIaxQCLRoeL8ol24h/NygTVzI/caQ2
         QbNqNlm7F7bAjmBaGWz3EiN+XsuXP5xVfDhiS4Stf0br6Z0BIE0fTBkwbQd4Akm15IIK
         x2sg==
X-Forwarded-Encrypted: i=1; AJvYcCX+FWOGM4gNjKgefF3xOAjkffk+cNOCyb0HEhojVjX4Wk9W3HdIRXuH8wav+KpGthXt+aYl1JOnzsb+ZybwiW10@lists.infradead.org
X-Gm-Message-State: AOJu0YxtyJOiWppDkTNY+oPb4q71RnaOMwUdrFaYc4WoIGwmm5TQWsx8
	J1DWQKb95ZwwWS/EAFsnFefBn0Eir4u02Fk4bhZvOY5GlKRxG707uaaCksOB4kx8yOUtgyEqdU1
	w62vSA2llvDBNUk8JMQ==
X-Google-Smtp-Source: AGHT+IEjxdJR1uJLIOVLqBDV0bDsdc/XTQjcc+CXgCRPq1R1chA9MEbontl1NBvD61YpGImuSVWX6wytCW9/eOc=
X-Received: from wrbee12.prod.google.com ([2002:a05:6000:210c:b0:3b7:6ea1:a86f])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1889:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3b7765e614amr1746678f8f.1.1753443794521;
 Fri, 25 Jul 2025 04:43:14 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:42:44 +0100
In-Reply-To: <20250725114249.2086974-1-verhaegen@google.com>
Mime-Version: 1.0
References: <20250725114249.2086974-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250725114249.2086974-3-verhaegen@google.com>
Subject: [PATCH v3 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
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
X-CRM114-CacheID: sfid-20250725_044316_650958_C33041A0 
X-CRM114-Status: GOOD (  16.45  )
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
2.50.1.470.g6ba607880d-goog


