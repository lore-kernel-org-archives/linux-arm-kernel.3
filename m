Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07DEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+N72RreF3X1ulCyF9Eewj5G4ApF4h1mESu3uQOVVQvU=; b=prreHHQgCCWTBYe2xonadwkWqp
	8Sd2Z1vqO8V2+ewkADg/OulHmaj+i9BqVoTMv+4eF5sE0aTeRtev29PCGpQLhfGgpWNO11eanvduu
	jxD62kV1gNTmpl7CwuXnshxoZbKotGs0/0VBpAxvHKbhIVFAZhC79oh7cmPIKMvMfl9lVX8F/YSfr
	qXMfg325AGcx2+QAeWGG+hOlr4RKFslFOvQCXmh9tdet61FlRseCgw8e+GXmu/0/0B47efBFXTwMM
	wTjmEvIDl4To3tutbvv4YQEPiAjI2CthpzH8jEhJXsEtfXBRRQbXdIpPqhWrWc4rGD+T5tQxWYVtq
	lQiQqXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAot-0000000ET0u-3bXN;
	Fri, 11 Jul 2025 10:17:31 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaABn-0000000EKlp-3Wuj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:37:08 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-606ee65164fso1998809a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 02:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752226625; x=1752831425; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+N72RreF3X1ulCyF9Eewj5G4ApF4h1mESu3uQOVVQvU=;
        b=CxgiWwAV2cBQyo/JpKn7AFvP72/WUYbdxSwwZ1Vxb0ArlcCkfv80P4p9BISeYo5IIn
         0vqw1BTXfmgOqw70rOyInqi2+irVZHf2WEsvJ8q8C2PLV/bZxmigRkfSLAzzXVsyqd7t
         urYiswnEDLm8uUflPvbE8g4w8Hf8xyVhIUo44zGrh7GwPY+H1QRPYEaUsLkozmork/1a
         d1zOpuu73yasaTUD6X2BtxO/vDXgLjN9UJA+1pjHFwDeJXe3D7uqZxj5YA2EEKNfgY3w
         Tdmv8PSSos1pWDhRs9bzCxVD6o4iJsv5gxuR4LB6FlryMgdiH2DUg+r9Wd6FfM8sbCLU
         OJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226625; x=1752831425;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+N72RreF3X1ulCyF9Eewj5G4ApF4h1mESu3uQOVVQvU=;
        b=PNkAvO1P+GPX6waw2fBU2tGmHGL+fGNLFybzxOi6C8JGG+eXYVxCd4L6O/Tj0bmp5U
         w/iLftehZnMcYxVaSwKlXVcGbzIEvj2Dl2GdLUdzvcXPnl6rX3e9Df+VmCNdUntNnpbs
         eGnSWLQM7KeR7Sz81tuAx1/LX0DmSjeox9UelF/1oWwHcYDRP2Qm1kmY0QaSh1hBx0U3
         c3p6RFAHC2iKL0Vbp/2ukhku6f+lwo5oQhTLua5r4qkx8ZqvkmgP2sfzXyH96RWmnY9m
         L7dYNXbcBIcIo+ksMwW+tVmuIKMkV3f1ToH+8W+pPZA4lv0UFthF5tlLh5L/8PdMb2VX
         Qz3A==
X-Forwarded-Encrypted: i=1; AJvYcCWA9fhv4ZzkQXWi6mmTFQ3F4Q/aIi++dgJiJnF88WFrtKj93t4TdOeauNIcVbDjfMDbqd9CXbP75yJy9rK1Olh5@lists.infradead.org
X-Gm-Message-State: AOJu0YzGHFmTgoV1ZCRnXGcRlCUbbEbtdXJUT7j7HHNixq7gUIAXmmT8
	v3tFsM7j5QmoA/ikCLXG9xLTL907QCfpS8x7CtnhMNPdRvslnwNhflH4HS8C+EI4D2QpSUqEJDO
	O3d5JzJwciwjPQ1ikoA==
X-Google-Smtp-Source: AGHT+IHFOCtCs6k1iE35uepmQ8fkKxb0JFiQDnymiBd74U3fea8sOfyyLF0qyCnCfl97eLtQmON7Trpt1dqf47g=
X-Received: from edyb7.prod.google.com ([2002:aa7:df87:0:b0:60e:4b0b:3d5d])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1d4e:b0:608:f493:871e with SMTP id 4fb4d7f45d1cf-611e7c0aaf8mr1935764a12.14.1752226625150;
 Fri, 11 Jul 2025 02:37:05 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:36:26 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711093636.28204-1-verhaegen@google.com>
Subject: [PATCH v2 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
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
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_023707_891324_C419B81F 
X-CRM114-Status: GOOD (  13.11  )
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
Joris (George) Verhaegen

Signed-off-by: Joris Verhaegen <verhaegen@google.com>

---
Changes in v2:
  - Corrected author and Signed-off-by to be consistent (Mark Brown).

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


