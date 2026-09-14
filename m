Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C42C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlCqoXDW3o2LvZIWaVrno5EG+N0nzh/qf9rQ2xgjTtw=; b=eq5XNiUVUmBfCf5u0de9wGxZnS
	2V6vXpcAw0ZSqD5jL4n6dtUoCimUJoHQEY0oDzVVLphhcjxtsMC+gfN6U0PCv+GjoQpZyLRyneOcP
	RC5X8PZOU1Fx9g4HQph5NAIjS18eJvM788531VOt90416cHKnErYUFMQVFKABdNBE7BeZngghqO1f
	YhmV/P2akZVDEPqxn4EPEB24go4d+SAOiBssGZMcRpuqzJ3lUZ/JZ52RdTvgXzCLVUWxVnJi7mwNV
	67DEXVxY8t0dJsGEmEMMzsVtGDfWkXbtBEgVvxnROZtm32Zy+YKOMcTNHhQ8AOhZHNrGCn0pYMaKd
	cTFEa6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66i4-00000003kwd-1o7R;
	Mon, 14 Sep 2026 13:27:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66i2-00000003kvb-1dNA;
	Mon, 14 Sep 2026 13:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392416;
	bh=3OQriGhrIrMIubXZFC8YrO8oerOhRvRRfIlDcpLUMAo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DAnx0NH2wBcsJnYGx9ntqPVkBwKJ6/xND0kERYftNf+EJvjhHTV+DjLWcuNeD2NRE
	 yB1492N1Tipj7TXjNWtxbQWHIXotq41UGujqsSQdp1peAhdUtslT+5O4cLVlKwTVg5
	 q+bkwXy27Q3OeRWVuah8ZYzTYHN8SOKDPcP7W3iJSyC1Np77uqGXX8Q8phUacHnezq
	 B6MD1P0DqJDCwqae2VlZ2N3GgsAzWmQXjpwScQdJh150bAe/T0QSTnNh6NXPOhF1TE
	 JFRt4L+RF5yvtxitnEDFK0m9WUYapJ4jRdTAe4URnH0DnXo7GcLyhTHjZzaR0lAR+m
	 5eVZUDDsQx/Lg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC56D17E01D1;
	Mon, 14 Sep 2026 15:26:55 +0200 (CEST)
Message-ID: <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
Date: Mon, 14 Sep 2026 15:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume
 errors
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-8-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-8-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062658_590976_FB859017 
X-CRM114-Status: GOOD (  19.55  )
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

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mt8189_afe_runtime_resume() currently ignores errors from regmap
> operations and mt8189_afe_enable_main_clock().
> 
> Propagate these errors and clean up the state before returning the
> error.
> 
> Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>   - Update the names of the goto labels.
> 
>   sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 36 +++++++++++++++++-----
>   1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
> index 77cf2b604f6c..67fa40afdefa 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
> @@ -2328,24 +2328,46 @@ static int mt8189_afe_runtime_resume(struct device *dev)
>   
>   	if (!afe->regmap) {
>   		dev_warn(afe->dev, "skip regmap\n");

In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
correctly checked for error as in, if any, probe will fail.

So... during suspend or resume or anywhere else in this driver really, the regmap
pointer can't be NULL.
The right thing to do here would be to just remove the useless check.

Mind you, this comment applies to some other commits in this series as well.

Cheers,
Angelo

> -		return 0;
> +		ret = -EINVAL;
> +		goto err_disable_reg_rw_clk;
>   	}
>   
>   	regcache_cache_only(afe->regmap, false);
> -	regcache_sync(afe->regmap);
> +	ret = regcache_sync(afe->regmap);
> +	if (ret)
> +		goto err_set_cache_only;
>   
>   	/* set audio 26M request */
> -	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
> -	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
> +	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
> +	if (ret)
> +		goto err_set_cache_only;
> +
> +	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
> +	if (ret)
> +		goto err_clear_26m_req;
>   
>   	/* force cpu use 8_24 format when writing 32bit data */
> -	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
> -			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
> +	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
> +				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
> +	if (ret)
> +		goto err_clear_26m_req;
>   
>   	/* enable AFE */
> -	mt8189_afe_enable_main_clock(afe);
> +	ret = mt8189_afe_enable_main_clock(afe);
> +	if (ret)
> +		goto err_clear_26m_req;
>   
>   	return 0;
> +
> +err_clear_26m_req:
> +	regmap_update_bits(afe->regmap,
> +			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
> +err_set_cache_only:
> +	regcache_cache_only(afe->regmap, true);
> +err_disable_reg_rw_clk:
> +	mt8189_afe_disable_reg_rw_clk(afe);
> +
> +	return ret;
>   }
>   
>   static int mt8189_afe_component_probe(struct snd_soc_component *component)


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

