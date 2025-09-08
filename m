Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10465CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 05:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQgewxOwQlVJkV06gQC/AqaYb6lZIuRmv0IHqd57520=; b=VY87RDdPR9CJNZjmqAXCOY8mvw
	gmNqfG+oCxRtPg36mcF20WhGkYbD7OYFUdeg4x3+TcVZIEEXQPoDENC+0CA72OcWsnFQAU40lJr5p
	tvD4ty5tKqhvWwy1RyMPKRuaRgRw4IS+bls33V1CR0XQ/XqmKeHmlRiNOpwj+pZWYpKLkodHvwEgF
	j1OYsjFGuTn/Ck4JX1Ojn5sKRjQO17RxX1Y7DWOvXpd5KJLNtFw3k6DgDTSCAhdCNIa7p0HF8+nHl
	GCHQPEhy7s6mADvs36JuFj5Wl9Wz5OAASce+Pf7MlSAcnOls9y0vFUxIGQtCWo6D3dSqhhIy5X0hQ
	jpkPJNBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUlY-0000000EnXP-0iT7;
	Mon, 08 Sep 2025 05:50:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUij-0000000Empu-0hqf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 05:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96AFC60007;
	Mon,  8 Sep 2025 05:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681CAC4CEF5;
	Mon,  8 Sep 2025 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757310436;
	bh=+DHv5K7x5Zki24ku10wUAB+lb3qUxD+Z6s1puPCmfY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwPmLzhwd1dzRc6PwRyjdCCDbb225leQScVwdBe702q/6RYoAkLXW3g9ZA+8ZXJaH
	 HL6u6rZJwtonfy4K5YPBpK2MBANo4YKJN39xR82lLhStYUtdtgSiAUgEhygmdSqPJo
	 4D9Iynm+o279EbEXJwdslmSRGJrEwfb8mKm6vucWF3YTbPG/cSrmEfGfKCuT53LNOU
	 vl8Rl2pD7jItxhYWqiPjfbhWDXOsf27du7tzOe+I0gs5WII4E9vXbFTC+NMHZFpE+6
	 6Y91c5g6IhHZDyKyIWKpTRVcL4XPM1ZQlfdJv4LhCMorOkcntLoNM2DY8ArJ0VqIZ1
	 7LRlL4OC1L69A==
Date: Mon, 8 Sep 2025 11:17:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
Subject: Re: [PATCH v5 0/3] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aL5t33Ztwse6HoQP@vaman>
References: <20250905091301.2711705-1-verhaegen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905091301.2711705-1-verhaegen@google.com>
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

On 05-09-25, 10:12, Joris Verhaegen wrote:
> The current compress offload timestamping API relies on struct
> snd_compr_tstamp, whose cumulative counters like copied_total are
> defined as __u32. On long-running high-resolution audio streams, these
> 32-bit counters can overflow, causing incorrect availability
> calculations.
> 
> This patch series transitions to a 64-bit safe API to solve the problem
> while maintaining perfect backward compatibility with the existing UAPI.
> The pointer operation is reworked to use a new timestamp struct with
> 64-bit fields for the cumulative counters, named snd_compr_tstamp64.
> ASoC drivers are updated to use the 64-bit structures. Corresponding
> ioctls are added to expose them to user-space.
> 
> The series is structured as follows:
> 
> Patch 1: Updates the pointer op, refactors the core logic and ASoC
> drivers to use it, and defines the new UAPI structs.
> 
> Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> 
> Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> 
> This series has been tested on a Pixel 9 device. All compress offload
> use cases, including long-running playback, were verified to work
> correctly with the new 64-bit API.

Acked-by: Vinod Koul <vkoul@kernel.org>

Please updated tinycompress changes with this once this is picked up by
Takashi-san

-- 
~Vinod

