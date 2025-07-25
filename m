Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB44C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fs4WIMRpWwIcuHXQawsP7PuMKJnOQxUvgvwqbySpiXk=; b=UNWsJPTnrWHLjLNXptYEA/nAiY
	XuKGmPtK7vz4hWw4+uilYFsyKeNm4o0f0YNAO3qz8619wY1v3RO1N7UAmT4N4ZtE3oXtG6cFIDsAx
	Jt2M0BS5rGg0x9pb+vtXsefuMax+XPEMjxkQO/OkDaePScXgqZ7qUkj7jqCnoFM5LPdozSn5SolNi
	wtrIrKXRLQg+xHaht0i2GJIU26Sle4fHTnE2BjbpFuvbri+8efVsUfySaEL4DKDtvn75dFbiY/+qo
	XXIhb7GWjMqy0X9Ez+jo1Ku3zxmluCzNE8UC80esmvx3i5hJQDRWpufuP+7MHlzxkAWYnnmc2VK2v
	uDSaKhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHBF-00000009mdL-2qyB;
	Fri, 25 Jul 2025 12:05:41 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGpJ-00000009jz4-2iZ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:43:02 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a579058758so893804f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 04:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753443779; x=1754048579; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fs4WIMRpWwIcuHXQawsP7PuMKJnOQxUvgvwqbySpiXk=;
        b=fwVstauqVrM22Om8w7jsoVyr5BF/q5qfhuuHUedFZ47DphIKxnwKQgP+LPk5nPhqRT
         9Ra0ZYVg8RonmcU2Jm6udJ4nM1syFkO8Ei0mXsGMbOoNjqPUC7dDjx9G18mnKQcBtAXD
         hftCqfHBfL3yap/viNBrYE4DjtzG8o7scSM+EHv24ccCoWaoas6E7mS65wkfslR8Qiey
         phSEOGydnDtPTN5kIs3xzne9Xdu+bTFNJ/aZMDz859aN9R3yPsx3E2K1BfogYvjJ2d0f
         fEKa0aE/UWy3iKduE3iIqQRjezNM+KoXNhUbkRkMEAQfEXVy1pTWpY/rXyVm4nsIwh8O
         kbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443779; x=1754048579;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fs4WIMRpWwIcuHXQawsP7PuMKJnOQxUvgvwqbySpiXk=;
        b=MJ7wFGlhCn8PLTmzKMVC9SvuZEfb36btb5TPTr7jTU7QxtmrJF166xaQjEcUbxMT7V
         5yaJ93PnazFnUoEu/a3TzGGRDQ+DLce7TQePZ+ntvisCACpgnokfNtAbhjQKNtcRl6K/
         VVxCIU2t6XRlgoLQDp92RqdA828LDqDoso+lJoQs8N3GzN4J04RdiBb/l5G7jUHM7ZO+
         XV5G1oMVW+eXCA3Z8AkgS+8D4uEOat4sHMpI1kUkNgPqM9FFp+IhfhFVUuS/gJ/dWpFF
         pUW8C+pzkVCJ/FBrW8k5uFFunugGTUJVGzjssj+f5F+mqY8tN+WC/yPFL0mS2lGISKUB
         wv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXS57Qx7fJm70t4AANqZeVRrr2Zql9l92KNQedLVbzyA486iiGi3uFLJPTeZkhLOh6wERzG7ilB2BmjU76p3g7o@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/iQSmUMpRYF+XpIocS19n7O57ib9iWcr8K/yjIZ258JhbMJQ
	6wDiR8rh8ssiq1iG0x7MXp1EfeGK22maYzcl3t/fHgIRFen4ybphALWS+pg/03RJ3xemAQpiPVs
	27eXzjWpjC2PrC8aqnQ==
X-Google-Smtp-Source: AGHT+IEVYehtHEprrhiAHZ95g+2gC92ze98k0Qt+xZ5aG3XGkuNcSUyzwUUV+kZ0DY9YfP8j0y302pUuBMzx3Ko=
X-Received: from wrs26.prod.google.com ([2002:a05:6000:65a:b0:3a4:eecf:ec38])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2905:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3b776688508mr1531386f8f.56.1753443779538;
 Fri, 25 Jul 2025 04:42:59 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:42:42 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250725114249.2086974-1-verhaegen@google.com>
Subject: [PATCH v3 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
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
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_044301_691069_B08A3D10 
X-CRM114-Status: GOOD (  14.93  )
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

The current compress offload timestamping API relies on struct
snd_compr_tstamp, whose cumulative counters like copied_total are
defined as __u32. On long-running high-resolution audio streams, these
32-bit counters can overflow, causing incorrect availability
calculations.

This patch series transitions to a 64-bit safe API to solve the problem
while maintaining perfect backward compatibility with the existing UAPI.
The pointer operation is reworked to use a new timestamp struct with
64-bit fields for the cumulative counters, named snd_compr_tstamp64.
ASoC drivers are updated to use the 64-bit structures. Corresponding
ioctls are added to expose them to user-space.

The series is structured as follows:

Patch 1: Updates the pointer op, refactors the core logic and ASoC
drivers to use it, and defines the new UAPI structs.

Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.

Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.

This series has been tested on a Pixel 9 device. All compress offload
use cases, including long-running playback, were verified to work
correctly with the new 64-bit API.

Thanks,
Joris (George) Verhaegen

Signed-off-by: Joris Verhaegen <verhaegen@google.com>

---
Changes in v2:
  - Corrected author and Signed-off-by to be consistent (Mark Brown).
Changes in v3:
  - Rework pointer op to return 64-bit timestamp, rather than adding a
    parallel pointer64 op (Charles Keepax, Takashi Iwai, Vinod Koul)
  - Bump the protocol version for ABI change (Takashi Iwai)
  -Fix linker error on Intel Atom (lkp@intel.com)
  -Rebase on latest for-next sound tree (Takashi Iwai)
  -Avoid changing return error code for ioctl (internal)
  -ASoC: Replace u64 % u32 by do_div(u64, u32) (internal)
  -ASoC: sprd: change current_data_offset to u64 (internal)

Joris Verhaegen (3):
  ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
  ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
  ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl

 include/sound/compress_driver.h               |   2 +-
 include/sound/soc-component.h                 |   4 +-
 include/sound/soc-dai.h                       |   7 +-
 include/uapi/sound/compress_offload.h         |  35 +++++-
 sound/core/compress_offload.c                 | 100 ++++++++++++------
 sound/soc/codecs/wm_adsp.c                    |   4 +-
 sound/soc/codecs/wm_adsp.h                    |   2 +-
 .../intel/atom/sst-mfld-platform-compress.c   |  12 ++-
 sound/soc/intel/atom/sst-mfld-platform.h      |   2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c  |   9 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  26 +++--
 sound/soc/qcom/qdsp6/q6asm-dai.c              |  26 +++--
 sound/soc/soc-component.c                     |   2 +-
 sound/soc/soc-compress.c                      |   2 +-
 sound/soc/soc-dai.c                           |   2 +-
 sound/soc/sof/compress.c                      |   2 +-
 sound/soc/sprd/sprd-pcm-compress.c            |   6 +-
 sound/soc/sprd/sprd-pcm-dma.h                 |   4 +-
 sound/soc/uniphier/aio-compress.c             |   2 +-
 19 files changed, 167 insertions(+), 82 deletions(-)

-- 
2.50.1.470.g6ba607880d-goog


