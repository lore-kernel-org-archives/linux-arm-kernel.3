Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BEDC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uPS4unWB2ZcBulBgsbUOEzWl0zbrAuljBCZj9zYhONY=; b=YY912eHOH2dQ2EXNDhiE9XOZmm
	SO9YUA7jwlk81zNjl558r0k7c5i78elMpkd/VTYNQXiTrYsW5UHzn2hmXRb44bAmIQVpFgCBpb0dH
	ndg39NJJ41O65JVnn5Rf0IWYJuY/wr+9bAIuauPG7okPysPdJR17QnFbva0cFbe3oJkQgl2JUaLVn
	PV9vHQ3ZiMq6wE3v8/CDd9gz409EJvYQmYRdh25kX8289KDSomercSQF0HYK452LCiFHA8WVT5lG5
	OWAXIbvQaphbNwZ7vIHdVw2kgvmi/P6UAC5TVK6+6ZKOwutR2bQV3stHzUeOpWTwzriTTrWUkQOxq
	BYoxnnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9sI-0000000EHXJ-3XlK;
	Fri, 11 Jul 2025 09:16:58 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua94W-0000000E7oe-36I4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:25:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45359bfe631so10628525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752222330; x=1752827130; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uPS4unWB2ZcBulBgsbUOEzWl0zbrAuljBCZj9zYhONY=;
        b=lAFfYD2Etb9ZMxJgpu4lCMwtuAB1KaqG3RcDpsdt5EHjYOOzRMi8Hkq9HDFKc2BWfE
         HUDFfizGdkfy1dimSljiLuUP4A7m+HtM1yVRDt0nJMCZyvBub/1Jfq0Xhfn8+H0Po1P5
         vPvCF1smupEkVLeKKxuT+sF/6vEHWDj+PbjJWHWYCT0DIpUNIv4xF9su5WkgbvtbxEp2
         cyLrRaOj1ffZDmNAu6pNJ108RGoz9IJP279C7N0FdWIjpdqaM2C18jQg0BA8TXZsq1o3
         uDWXgHudL9AE7r5xq4Ih4AldlyBQb6nNw1z3Kivv3+3b9dKqKsmPqsNFw4XmZYiX47Dw
         u0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222330; x=1752827130;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPS4unWB2ZcBulBgsbUOEzWl0zbrAuljBCZj9zYhONY=;
        b=vNzBFCYZoNGVL942jvepG44XTcNnoqquq1gpBUyF96fVhB2sVTTcxZNHQq99UIaO3m
         BEWZ0qaQhCfppNNPcal2zy/1INAEyfLbU6F0GkWP0O4XVGf2SoyjSA8kieXDr+daXM5M
         7LAJ+AyAq7lcBcZKf0FdFGdjvSwem5mnTuwZNSFgMlJvCTSxCnvbHCeuQP4CiV7NDE5n
         O9F7Nb6lvBSc574oHPzDHxxMUvSr/gTq2CdcWVqd7n0ryNsnd1EBngZDcOJQtuMxV54g
         40DL2RogESidxGUZ0w0B3V8aTvfT5udIWJvPzawxkdy8jx/toG8aDWE7IUFFdtU5/oHV
         yrzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJaZKaOHZKTybgxijrmdqQ5dDnDd5SwcVKn68V1NEBWSc0SkVCX3CJhqqvD5iuVPuWmHUJzVWqd4i0EFDDVwnv@lists.infradead.org
X-Gm-Message-State: AOJu0YzdHrvH3LMgrFWV/npdWNy61L4ouEln6PItblL8gT/+ZJZzNlti
	vURFZU37lU0zArVPNuXKLk3rRT6/ATG4D2cIvQI+6qlAi7AuxLe+BZKws8nD3S7SLmMal4cthp/
	e/waOhhPStu4tzoG4VQ==
X-Google-Smtp-Source: AGHT+IEnBWvD3yYNtRkBdA6/Yih7Va/FMD2Vu65hycrlK6/K05a3ktnefi7uyOtrMkeRanxj4iTfqvVTmG4Ou5k=
X-Received: from wmbel6.prod.google.com ([2002:a05:600c:3e06:b0:451:edc8:7816])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3491:b0:453:8a62:df34 with SMTP id 5b1f17b1804b1-454fe0f9436mr16161995e9.21.1752222330362;
 Fri, 11 Jul 2025 01:25:30 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:24:32 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711082441.4193295-1-verhaegen@google.com>
Subject: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
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
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_012532_778911_52BB7008 
X-CRM114-Status: GOOD (  12.52  )
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

The current compress offload timestamping API relies on
struct snd_compr_tstamp, whose cumulative counters like
copied_total are defined as __u32. On long-running high-resolution
audio streams, these 32-bit counters can overflow,
causing incorrect availability calculations.

This patch series introduces a parallel, 64-bit safe API to solve
this problem while maintaining perfect backward compatibility with the
existing UAPI. A new pointer64 operation and corresponding ioctls
are added to allow the kernel to track counters using u64 and expose
these full-width values to user-space.

The series is structured as follows:

Patch 1: Introduces the new internal pointer64 op, refactors the
core logic to use it, and defines the new UAPI structs.

Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.

Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.

Patch 4: Implements the new .pointer64 operation in various ASoC
drivers that support compress offload.

This series has been tested on a Pixel 9 device. All compress offload
use cases, including long-running playback, were verified to work
correctly with the new 64-bit API, and no regressions were observed
when using the legacy API.

Thanks,
George (Joris) Verhaegen

Signed-off-by: Joris Verhaegen <verhaegen@google.com>

---

Joris Verhaegen (4):
  ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
  ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
  ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
  ASoC: codecs: Implement 64-bit pointer operation

 include/sound/compress_driver.h               |   3 +
 include/sound/soc-component.h                 |   5 +
 include/sound/soc-dai.h                       |   6 +
 include/uapi/sound/compress_offload.h         |  32 +++
 sound/core/compress_offload.c                 | 210 ++++++++++++++----
 sound/soc/codecs/cs47l15.c                    |   1 +
 sound/soc/codecs/cs47l24.c                    |   1 +
 sound/soc/codecs/cs47l35.c                    |   1 +
 sound/soc/codecs/cs47l85.c                    |   1 +
 sound/soc/codecs/cs47l90.c                    |   1 +
 sound/soc/codecs/cs47l92.c                    |   1 +
 sound/soc/codecs/wm5102.c                     |   1 +
 sound/soc/codecs/wm5110.c                     |   1 +
 sound/soc/codecs/wm_adsp.c                    |  53 ++++-
 sound/soc/codecs/wm_adsp.h                    |   3 +
 .../intel/atom/sst-mfld-platform-compress.c   |  17 +-
 sound/soc/intel/atom/sst-mfld-platform.h      |   2 +
 sound/soc/intel/atom/sst/sst_drv_interface.c  |  43 +++-
 sound/soc/qcom/qdsp6/q6asm-dai.c              |  41 +++-
 sound/soc/soc-component.c                     |  20 ++
 sound/soc/soc-compress.c                      |  21 ++
 sound/soc/soc-dai.c                           |  14 ++
 sound/soc/sof/compress.c                      |  44 +++-
 sound/soc/sprd/sprd-pcm-compress.c            |  28 ++-
 sound/soc/sprd/sprd-pcm-dma.h                 |   2 +-
 sound/soc/uniphier/aio-compress.c             |  40 +++-
 26 files changed, 503 insertions(+), 89 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog


