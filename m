Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FA4C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bu3FAa+z6N3hVnON67ovhY2EugPyrb49rIyQZVspucI=; b=U4T8ayWkJTJyArnUWuqSszMQPJ
	qgVPIeSkNImREOrm+JU88mvVhsdJjSX+vSTUSCY2hAPy1m9D6Aya4gl5yxi/zHXzx8lQaEeRnwHHi
	hz1YlGxJi+AmD3UbCQvyJKEnvIy94B0u02h2kmknoZThMiCKyVW20D4g9c8XwlCbntwHJYxnVsx0G
	ITa+0V1JHFqjsbf24PHIu59z5o44AAa76wsXYaO+xOgBE3v/YbUrHHHzXFgT17mt8SL18bbnie3QR
	M1uZySnljmyw7al1//vsvssZtBEN6+9zSXdlc9tBDV2yqIAB2yJan5bUSc4Tshndwx2MMw1cPmNbk
	LMxR2egA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaD5R-0000000ElkL-39aj;
	Fri, 11 Jul 2025 12:42:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCx6-0000000Ekty-0LPM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:34:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EAD344E9E;
	Fri, 11 Jul 2025 12:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D88C4CEED;
	Fri, 11 Jul 2025 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752237247;
	bh=OaM04B/jvmRCFs9Pga6hG/UcJ4uI5yYpfmWIbmK2Zyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTLAhLTCRZXAC4B/2QKacwHAUGAi6WddnWYmmBZEgz/U07KVHiwt0PANdevA2fmRW
	 gWM2pmMus+RFmABeOsW5pGonIvo+KiacmI3KBi8rnrjRN94re/ZOvPYIzGBYXeRvzT
	 3269c/hfw6YgxKqV/Awqvy4tCE9NZwhyGtcY82Ee5wUEIiRFf63Vw4UcSpGevnYBeF
	 RuN1yBG0+m2E2XfP+2Nnf3S5jG/ZJpo0fFxVK8AIi6RgJiIbBHP41De+ubmZGo0oVx
	 br3pXXJLxUgerpY8f1BoD4YWU63zHnTMWLq4RxQi9r2mnnkoUlVHMRRlKd/PT1wHO8
	 sYlGlN6t2JKdQ==
Date: Fri, 11 Jul 2025 18:04:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: George Verhaegen <verhaegen@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aHEEu1eSSGRhITmW@vaman>
References: <20250711082441.4193295-1-verhaegen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711082441.4193295-1-verhaegen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_053408_162620_516486A5 
X-CRM114-Status: GOOD (  19.17  )
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

On 11-07-25, 09:24, George Verhaegen wrote:
> From: Joris Verhaegen <verhaegen@google.com>
> 
> The current compress offload timestamping API relies on
> struct snd_compr_tstamp, whose cumulative counters like
> copied_total are defined as __u32. On long-running high-resolution
> audio streams, these 32-bit counters can overflow,
> causing incorrect availability calculations.

In your testing when did you observe the overflow condition?

> This patch series introduces a parallel, 64-bit safe API to solve
> this problem while maintaining perfect backward compatibility with the
> existing UAPI. A new pointer64 operation and corresponding ioctls
> are added to allow the kernel to track counters using u64 and expose
> these full-width values to user-space.

Please share patches for tinycompress support too, we need those to test
this

> The series is structured as follows:
> 
> Patch 1: Introduces the new internal pointer64 op, refactors the
> core logic to use it, and defines the new UAPI structs.
> 
> Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> 
> Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> 
> Patch 4: Implements the new .pointer64 operation in various ASoC
> drivers that support compress offload.
> 
> This series has been tested on a Pixel 9 device. All compress offload
> use cases, including long-running playback, were verified to work
> correctly with the new 64-bit API, and no regressions were observed
> when using the legacy API.
> 
> Thanks,
> George (Joris) Verhaegen
> 
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> 
> ---
> 
> Joris Verhaegen (4):
>   ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
>   ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
>   ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
>   ASoC: codecs: Implement 64-bit pointer operation
> 
>  include/sound/compress_driver.h               |   3 +
>  include/sound/soc-component.h                 |   5 +
>  include/sound/soc-dai.h                       |   6 +
>  include/uapi/sound/compress_offload.h         |  32 +++
>  sound/core/compress_offload.c                 | 210 ++++++++++++++----
>  sound/soc/codecs/cs47l15.c                    |   1 +
>  sound/soc/codecs/cs47l24.c                    |   1 +
>  sound/soc/codecs/cs47l35.c                    |   1 +
>  sound/soc/codecs/cs47l85.c                    |   1 +
>  sound/soc/codecs/cs47l90.c                    |   1 +
>  sound/soc/codecs/cs47l92.c                    |   1 +
>  sound/soc/codecs/wm5102.c                     |   1 +
>  sound/soc/codecs/wm5110.c                     |   1 +
>  sound/soc/codecs/wm_adsp.c                    |  53 ++++-
>  sound/soc/codecs/wm_adsp.h                    |   3 +
>  .../intel/atom/sst-mfld-platform-compress.c   |  17 +-
>  sound/soc/intel/atom/sst-mfld-platform.h      |   2 +
>  sound/soc/intel/atom/sst/sst_drv_interface.c  |  43 +++-
>  sound/soc/qcom/qdsp6/q6asm-dai.c              |  41 +++-
>  sound/soc/soc-component.c                     |  20 ++
>  sound/soc/soc-compress.c                      |  21 ++
>  sound/soc/soc-dai.c                           |  14 ++
>  sound/soc/sof/compress.c                      |  44 +++-
>  sound/soc/sprd/sprd-pcm-compress.c            |  28 ++-
>  sound/soc/sprd/sprd-pcm-dma.h                 |   2 +-
>  sound/soc/uniphier/aio-compress.c             |  40 +++-
>  26 files changed, 503 insertions(+), 89 deletions(-)
> 
> -- 
> 2.50.0.727.gbf7dc18ff4-goog

-- 
~Vinod

