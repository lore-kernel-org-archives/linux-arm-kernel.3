Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039CBE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8Jn2gNV/Wj9FZiOzKXMf/S74gi71+RRKXPGCP6+gaA=; b=YmOnJHfGUGcnu408o7IfPLR5Mp
	aZX7pzOL2QzH9UGfhwe9LGKM6z+fz0SJpIq4PdN8MVl6GMwZ8dtaQiPunhxH4eqDtTyPMWrvo21ci
	i4130cIEfjMOiUtfUEMVVMhL0TwOpKAeEx/TCWPAHeHtXOwfS0seed4mUpNlOR467vpRVF6uhMuJi
	WyV5nHVjgYydfEl4Q9ptyXpTjm3tkJbiPXAEWyyJB9Fln5aqAR+4wxZaiCqHEzbTbsCrPtNB298OL
	ATsh74W95qIYl+BuObjw5jpbFqyCow7Bwwghd5vPuErfxAI5y4SHI7FDvxDRZiFn1WHNtoQ+7iHEj
	wflAjO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOENO-00000001cOZ-2OEl;
	Thu, 19 Dec 2024 11:07:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEMH-00000001c5U-1235;
	Thu, 19 Dec 2024 11:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734606379;
	bh=zwsUAHNP7mrQdPFLP5AhvVLR+6YT1CQM3OFvTb1Ql8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fggRZSnGMRdhrKMfWIMQE1xL+eTQ5Ut26nb6qBErlYM/PuCcIM4qbmaQVhWqqecX2
	 Jzu+P1PAMYCNnFP1f9EASn5uBv/FvzZOUB2owHyAtQZXJ4wZuICaM3pT9k1t+eIj+L
	 0PpXbITs8y2KKL+4h21+yNiY2YJ1EZf0yOy7XOYMjKyv/0cTWAjAGnwOCYkfIV6ha8
	 VliONy4DMO2VUvl0hKjDjNTB29oCUvrHmUfkgG4VaAwmiDXf3J8EBFnRz0vx7ZsHvM
	 EvIlxjkskCdF6ADLbQ0hlcwCVvGx5qW8kJ63/y5d9G/V8y22+/3PqkrZ/eXb2cgNO6
	 CLriejP/R12Pg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0308F17E3614;
	Thu, 19 Dec 2024 12:06:18 +0100 (CET)
Message-ID: <e208a265-cd4a-4781-82a6-a7f4f2c47448@collabora.com>
Date: Thu, 19 Dec 2024 12:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: disable buffer pre-allocation
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 treapking@chromium.org, yuanhsinte@chromium.org
References: <20241219105303.548437-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241219105303.548437-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_030621_447074_24CC7690 
X-CRM114-Status: GOOD (  24.15  )
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

Il 19/12/24 11:53, Chen-Yu Tsai ha scritto:
> On Chromebooks based on Mediatek MT8195 or MT8188, the audio frontend
> (AFE) is limited to accessing a very small window (1 MiB) of memory,
> which is described as a reserved memory region in the device tree.
> 
> On these two platforms, the maximum buffer size is given as 512 KiB.
> The MediaTek common code uses the same value for preallocations. This
> means that only the first two PCM substreams get preallocations, and
> then the whole space is exhausted, barring any other substreams from
> working. Since the substreams used are not always the first two, this
> means audio won't work correctly.
> 
> This is observed on the MT8188 Geralt Chromebooks, on which the
> "mediatek,dai-link" property was dropped when it was upstreamed. That
> property causes the driver to only register the PCM substreams listed
> in the property, and in the order given.
> 
> Instead of trying to compute an optimal value and figuring out which
> streams are used, simply disable preallocation. The PCM buffers are
> managed by the core and are allocated and released on the fly. There
> should be no impact to any of the other MediaTek platforms.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

No there's no impact on the older ones, it's fine and I agree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> index 9b72b2a7ae91..6b6330583941 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> @@ -120,8 +120,8 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
>   	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
>   
>   	size = afe->mtk_afe_hardware->buffer_bytes_max;
> -	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> -				       afe->dev, size, size);
> +	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);



