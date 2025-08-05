Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17D0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 04:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSiSJhAWfiAbzSiuuDOoDC1y//lJzXGPsNhqlmku/1Q=; b=XXbkVyczXcfVzE6iCeupKQRcpe
	+wyA2WKN+FP7MWkcrnwsA2/kX5pqCl+LUmQxKy175efVC0asPSQ3K1S8Iwtpu3/jvdtSEB3midii/
	m3yKY6buU2jlWhB9bAooIRR8IXRLpn/8D8HzwAWiPgy0pmDVtm8ypvY4iTUN54B42jy/JxEuaid4q
	jHE9Q6zEX5D4sm7kfhW/NLNYsuF8IWHnhuPcoY0tVJLev4zfgAZzAf81IjtL5n4hkiiCBiD4a8LDu
	Gu1FKsFn/j+OTSxutLfPi6ezgF9qaiMFiK4KC/a0VbgB0q+1B3nSVH9kxG0hEbPEuuiFllg5Nus+e
	Fm4NZqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9ez-0000000BlyV-2oO0;
	Tue, 05 Aug 2025 04:52:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9ao-0000000BlZl-28DB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 04:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01EEB45349;
	Tue,  5 Aug 2025 04:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D26AC4CEF4;
	Tue,  5 Aug 2025 04:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754369283;
	bh=LoCncB0T59vM/YkkVlcIhEh0yb/IFkNXHSj+2ArsmPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJMyP2nVjI/Ojpw0jHVvM/d0xQcdh27oI035+1DsLhGY/TKIo32vUwNMs4ckKFHc4
	 axcsxLeAv1bXze6etwdJ4n1hWERU64YNBZjPSK4RjpRLHi8snQOIaUITjlfPWWTYbr
	 p4TicsKIwuOPmfSsgbcCioAdOEVvzDjKREzufyx7LRuaBbczue4ZMejrKlnmJkyL2a
	 v2SFWE/b8yvpjsSqQNzz2/gA/ArQxTIL+cD2nutLf/7cHWWJm5u1v1Gfg25SMyYpQA
	 qfE/TbBlQmYuEd5VmJSDV9BN9vfFctr+aV4yq5XpbisNCX59O06ylNJFbt4DRHhYEz
	 uSKUrKmO2twSw==
Date: Tue, 5 Aug 2025 10:17:59 +0530
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
	linux-arm-kernel@lists.infradead.org,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add
 SNDRV_COMPRESS_TSTAMP64 ioctl
Message-ID: <aJGM2zXS6hOLDFm1@vaman>
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801092720.1845282-3-verhaegen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_214806_718093_96C9823D 
X-CRM114-Status: GOOD (  25.69  )
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

On 01-08-25, 10:27, Joris Verhaegen wrote:
> The previous patch introduced the internal infrastructure for handling
> 64-bit timestamps. This patch exposes this capability to user-space.
> 
> Define the new ioctl command SNDRV_COMPRESS_TSTAMP64, which allows
> applications to fetch the overflow-safe struct snd_compr_tstamp64.
> 
> The ioctl dispatch table is updated to handle the new command by
> calling a new snd_compr_tstamp64 handler, while the legacy path is
> renamed to snd_compr_tstamp32 for clarity.
> 
> This patch bumps the SNDRV_COMPRESS_VERSION to 0.4.0.
> 
> Reviewed-by: Miller Liang <millerliang@google.com>
> Tested-by: Joris Verhaegen <verhaegen@google.com>
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> ---
>  include/uapi/sound/compress_offload.h |  5 +++--
>  sound/core/compress_offload.c         | 19 +++++++++++++------
>  2 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> index abd0ea3f86ee..70b8921601f9 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -13,8 +13,7 @@
>  #include <sound/asound.h>
>  #include <sound/compress_params.h>
>  
> -
> -#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
> +#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
>  /**
>   * struct snd_compressed_buffer - compressed buffer
>   * @fragment_size: size of buffer fragment in bytes
> @@ -208,6 +207,7 @@ struct snd_compr_task_status {
>   * Note: only codec params can be changed runtime and stream params cant be
>   * SNDRV_COMPRESS_GET_PARAMS: Query codec params
>   * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
> + * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
>   * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
>   * This also queries the tstamp properties
>   * SNDRV_COMPRESS_PAUSE: Pause the running stream
> @@ -230,6 +230,7 @@ struct snd_compr_task_status {
>  						 struct snd_compr_metadata)
>  #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
>  #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
> +#define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
>  #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
>  #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
>  #define SNDRV_COMPRESS_START		_IO('C', 0x32)
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index d3164aa07158..445220fdb6a0 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -736,18 +736,23 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
>  	return retval;
>  }
>  
> -static inline int
> -snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
> +static inline int snd_compr_tstamp(struct snd_compr_stream *stream,
> +				   unsigned long arg, bool is_32bit)
>  {
>  	struct snd_compr_tstamp64 tstamp64 = { 0 };
>  	struct snd_compr_tstamp tstamp32 = { 0 };
> +	const void *copy_from = &tstamp64;
> +	size_t copy_size = sizeof(tstamp64);
>  	int ret;
>  
>  	ret = snd_compr_update_tstamp(stream, &tstamp64);
>  	if (ret == 0) {
> -		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> -		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
> -				   &tstamp32, sizeof(tstamp32)) ?
> +		if (is_32bit) {
> +			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> +			copy_from = &tstamp32;
> +			copy_size = sizeof(tstamp32);
> +		}

Most of the applications and people would be 32bit right now and we
expect this to progressively change, but then this imposes a penalty as
default path is 64 bit, since we expect this ioctl to be called very
frequently, should we do this optimization for 64bit here?

> +		ret = copy_to_user((void __user *)arg, copy_from, copy_size) ?
>  			      -EFAULT :
>  			      0;
>  	}
> @@ -1327,7 +1332,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
>  
>  	switch (cmd) {
>  	case SNDRV_COMPRESS_TSTAMP:
> -		return snd_compr_tstamp(stream, arg);
> +		return snd_compr_tstamp(stream, arg, true);
> +	case SNDRV_COMPRESS_TSTAMP64:
> +		return snd_compr_tstamp(stream, arg, false);
>  	case SNDRV_COMPRESS_AVAIL:
>  		return snd_compr_ioctl_avail(stream, arg);
>  	case SNDRV_COMPRESS_PAUSE:
> -- 
> 2.50.1.565.gc32cd1483b-goog

-- 
~Vinod

