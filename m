Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAFBCAC580
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sBSpQ8ZRm6jb4tNdcmggvd2P095dWooz1uDNAN/Fzc4=; b=2fa8kl1D5DSpY3wk6m5H5vTl8N
	oGHbVWpoQCddtI7QXZqNBHSMZ2+NtIl7D9eUDl23NbF03gar3bhMSqGrILo7yOAMAQKRbuHcpTbQg
	DfXLLHHgoYBSIe/QxA0WX9k1mLfjnxlOoE/lexd4/KxZr89NEQKM+mwsr4Ep55aQQBdRbKwaR5VH1
	HemueIbdaWTpO+uYoyj6EeQvr3eqWw+/g67EqKBpoi4LsIZLu79mzT8wkLzykBiTjfKNkVmxRXaZv
	f4nC09nRknNnTpioxXUE7LPGX8RQvQ+DHYxvaQFODRi3IvamsWtVGP0hpLP6fURPCmMESFvcwl7jb
	yAvEDNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUY-00000002JPr-3faB;
	Fri, 05 Sep 2025 14:32:42 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSVJ-00000000eM5-0wEG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:13:10 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3dabec38299so1212550f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757063587; x=1757668387; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sBSpQ8ZRm6jb4tNdcmggvd2P095dWooz1uDNAN/Fzc4=;
        b=vmdSZgWMR6gABf4e53WAfZ8gkej/jxnKSgYhJ/L00HYFFZBitkm1Jpa0bTKGF/ROR3
         Afj89Ud3YS1NlmJEy+oMYLxJkNogdoc9vSrrsgrJv6r7tFBQNBymSgWme8yyJ91CAQNo
         RDr0w8svY+I17r8D90ZK/hTazBNV1M3dgX3kY+Wed+jq83g46RH9/N6pEPMYKf0tWEtM
         TsMbzpUeix84ttrJbf4K7xOegXnOww/kG5wZw8OoESRL03pWKMcqpOKbRsLpab+IX7iO
         JeNn7n/UB9QV6gSnCHfFveikIcvYmlw4iB7RaorhB4Y3GTgP2bGCymHj7TylZyu50KDO
         hG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063587; x=1757668387;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBSpQ8ZRm6jb4tNdcmggvd2P095dWooz1uDNAN/Fzc4=;
        b=fgNuqgp2rOYBBf0+FPnhgI//7Zb7iaUTyHYnuoWTQ/PsOrbm8V7K4XV/NtLp659ZlN
         m31fvLfZdE3sFY2wyXLzbJjP3pNLIncGIUJs1xNhFa2kk5FMts3BylxKPcYgwozIEbXH
         ElcUTEJxUliVpnOJfhNfdReE5rgXQkAH3ZVYSL6Tvu/wW58HaiWTcsCijZZR7Q39ROe/
         W6RiWbFkMbyPu2GeLEgoPs/dOIHvTcXFQK8vcYOu3moHS2s1QPgy46LT0yyAZwycLaZ4
         hWLuLx5o3dGHRBCMgdchV8Q9ubAJE0PUUkeBYnD+btSStN3Uctc2fvpIKqw0Vfj4cTz/
         gqAw==
X-Forwarded-Encrypted: i=1; AJvYcCWYJRZ4lmGvnuib4sU38Qt8EJbYtX4luwOjhMtPTw30t3obVyQi6Rkvk3y+QmYjqA7KuwTI4KOZ3SlnXigIuMwo@lists.infradead.org
X-Gm-Message-State: AOJu0YzJdp8iyB5Z7g2t5SKKOJ+9tRlgQ9BeW3Vf6Sn6tmeH3/6CjRDK
	cPilJshdFKNVSjhEOZVCQEMb8JM7n8xE16jeMu/DC9hwofwwqT0v5ckxoL7QhzlV0n6/EGj3weQ
	00R+kIrtPjLFatU4oJQ==
X-Google-Smtp-Source: AGHT+IEwNpYtanMPGC3mKG9+dfs7GkoY0bb6zXivMXVtiUjkjgaYNYh142quSHeIfKG42UCVPz8Dde6RKOCNb/g=
X-Received: from wrjo18.prod.google.com ([2002:adf:cf12:0:b0:3d9:b79f:e8b7])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2486:b0:3e2:804b:bfe9 with SMTP id ffacd0b85a97d-3e2805b0742mr2921328f8f.15.1757063586869;
 Fri, 05 Sep 2025 02:13:06 -0700 (PDT)
Date: Fri,  5 Sep 2025 10:12:53 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905091301.2711705-1-verhaegen@google.com>
Subject: [PATCH v5 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
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
X-CRM114-CacheID: sfid-20250905_021309_265496_D6B38167 
X-CRM114-Status: GOOD (  14.99  )
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
Changes in v4:
  -Fix compiler error on Intel AVS (lkp@intel.com)
Changes in v5:
  -Revert formatting change in compress_offload.c (Vinod Koul)

Joris Verhaegen (3):
  ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
  ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
  ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl

 include/sound/compress_driver.h               |  2 +-
 include/sound/soc-component.h                 |  4 +-
 include/sound/soc-dai.h                       |  7 +-
 include/uapi/sound/compress_offload.h         | 35 ++++++-
 sound/core/compress_offload.c                 | 98 +++++++++++++------
 sound/soc/codecs/wm_adsp.c                    |  4 +-
 sound/soc/codecs/wm_adsp.h                    |  2 +-
 .../intel/atom/sst-mfld-platform-compress.c   | 12 ++-
 sound/soc/intel/atom/sst-mfld-platform.h      |  2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c  |  9 +-
 sound/soc/intel/avs/probes.c                  |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 26 +++--
 sound/soc/qcom/qdsp6/q6asm-dai.c              | 26 +++--
 sound/soc/soc-component.c                     |  2 +-
 sound/soc/soc-compress.c                      |  2 +-
 sound/soc/soc-dai.c                           |  2 +-
 sound/soc/sof/amd/acp-probes.c                |  2 +-
 sound/soc/sof/compress.c                      |  2 +-
 sound/soc/sof/intel/hda-probes.c              |  2 +-
 sound/soc/sof/sof-client-probes.c             |  2 +-
 sound/soc/sof/sof-client-probes.h             |  4 +-
 sound/soc/sprd/sprd-pcm-compress.c            |  6 +-
 sound/soc/sprd/sprd-pcm-dma.h                 |  4 +-
 sound/soc/uniphier/aio-compress.c             |  2 +-
 24 files changed, 172 insertions(+), 87 deletions(-)

-- 
2.51.0.355.g5224444f11-goog


