Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8740C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 06:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eNKAivlhYK/Cu/pylX8q3elPjNK9c05jTkbRbwu1MU=; b=mqS8F/vT3LkBp7pudoIFEA/GoI
	Bvaf4CmuJ0wbJ3An819ZmXonpTUjk63ntmNFktjdNSaipk3MA8K4Fo5y2r/ULP5o8QshMZ+tY9w6j
	W23ngrtYrCjBZjbp+WQdw1MxSh3dd4po/GhA4hjIq4nLFTMPUMDWsG6dNxBEz7alqZoJmwvgncJn0
	FgjerxkD6AWU8u/ggFFPWTWrGSBxnxBA2TvAV9RS+EcmHrlI2dIxo2s5tEKICJevtgwG4aOMeHmu5
	/iBvIhhek7UqrrgWPNFX58lrMPJYaZmZWCL+venEfxOpwHNx822gBXVb+HuF/EIPM2ln5KxF/jPv9
	4yfe63jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Bp-0000000FUVe-2Uox;
	Wed, 12 Aug 2026 06:11:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Bl-0000000FUUw-3F62
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 06:11:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE9851596;
	Tue, 11 Aug 2026 23:11:37 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 319F63F86F;
	Tue, 11 Aug 2026 23:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786515101; bh=5pJ46N6gX1WykQLkyViYxnhpRc5yocTt11xclEC3eg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dtoyCxWbiPyCzkXwodRmMBQ1gLxOk7yoIp8TwKgi8W+GO560K7SI6FOswfvAHoQUZ
	 Mfgabkkv9Ht4W/GMwL4DT54BXXgBrU5CbBb2GpMQEa4iPhNqlFZwXFZXcFk9RdciK5
	 D2GBE6SUg9kWh2/DW04fc7HKWgzAzSJlNtLSOPH4=
Message-ID: <8c5e523a-b0ab-4cde-a80d-8f89fa9e5450@arm.com>
Date: Wed, 12 Aug 2026 07:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: fix stream_data leak on
 open error
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Simek <michal.simek@amd.com>,
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260811185140.27149-1-rosenp@gmail.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260811185140.27149-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_231145_913846_663BEBF6 
X-CRM114-Status: GOOD (  20.63  )
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



On 11/08/2026 19:51, Rosen Penev wrote:
> In xlnx_formatter_pcm_open(), stream_data is allocated and
> adata->play_stream or adata->capture_stream is assigned early.  If a
> later step, such as snd_pcm_hw_constraint_step() or
> snd_pcm_hw_constraint_integer(), fails, the function returns the error
> immediately.  ALSA does not call the close callback when open fails, so
> stream_data is leaked and the stream pointer is left dangling, pointing
> to a substream that ALSA frees.  A later interrupt would then call
> snd_pcm_period_elapsed() on the freed substream.
> 
> Free stream_data and clear the stream pointer on the error paths.
> 
> Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Michal Simek <michal.simek@amd.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  v2: change goto label from err to error.
>  sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index b50306b0fc06..3d6f1e4046d8 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -383,7 +383,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>  	if (err) {
>  		dev_err(component->dev,
>  			"Unable to set constraint on period bytes\n");
> -		return err;
> +		goto error;
>  	}
>  
>  	/* Resize the buffer bytes as divisible by 64 */
> @@ -393,7 +393,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>  	if (err) {
>  		dev_err(component->dev,
>  			"Unable to set constraint on buffer bytes\n");
> -		return err;
> +		goto error;
>  	}
>  
>  	/* Set periods as integer multiple */
> @@ -402,7 +402,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>  	if (err < 0) {
>  		dev_err(component->dev,
>  			"Unable to set constraint on periods to be integer\n");
> -		return err;
> +		goto error;
>  	}
>  
>  	/* enable DMA IOC irq */
> @@ -411,6 +411,14 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>  	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
>  
>  	return 0;
> +
> +error:
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		adata->play_stream = NULL;
> +	else
> +		adata->capture_stream = NULL;
> +	kfree(stream_data);
> +	return err;
>  }
>  
>  static int xlnx_formatter_pcm_close(struct snd_soc_component *component,

-- 
Regards,
Vincenzo


