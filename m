Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC58AC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NknbF6999qcnMNlc+k3ZiS7mVV/PW7NWn8+4+CTjJJ8=; b=jhlCLQ/U6TWw3WldAqqmdM2DzD
	G6Iyqa/df55rwEz5bEgryA/IuAOmZXBu5vwR2wAAD06zeATTKJep1khy5XmouGhvxob5wOedlI9i3
	5cfoeV+KPE9F8kIBh9fIFe4GIV5NzRVNh+We3pX2+nZk/RoGcJVFv7mtr6z1a202KDOE+bpqvzAPo
	Cde25VZvNLMgnYmgfgrDaB/Z+JAn9L1pCVkDEBD2oeL3nQwCqAaLXSh4vNNCT+H99/3SHy4kaLWao
	K4zN/mofPEvOpl9beFnGWjeOF0Yva7ts2iCVN2LdmU5rWmAbAsQVthP/Llvgs+HgJ8e9cQBErfwyF
	0qEUUW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66de-00000003jyE-3XBh;
	Mon, 14 Sep 2026 13:22:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66dc-00000003jxJ-0WLD;
	Mon, 14 Sep 2026 13:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392142;
	bh=g+NHV6fMPvMB7g7ePyJrULSs0z4hTzYaFjSbJMYyRe8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VPD5O4Ipjn6V7JnsslWeosPZd2xLD6c8kLbVWbDVFLeG08VSS81NgTqRNi6R8cML5
	 XVOFUhrXVQUezVJZeSFZ62/24mhg411q2gc0GP+cXxrKQPxLUki1qOCYxrBhY0BeJG
	 XhcihTsgEU3bsl6iRXQT+lFvqrFoeTUZIykhkfNveVuwYxu59f9auZNZaKAQPniq/g
	 Q02tLWHFC7Ho58afsIZ+zs+oPF4UTr2Y+6LVyWE+Nh3W1J580b8BvItH5pwo8gkMxo
	 5iR4ACRQEZwtltaDD9aZsqQgZMGAdywaaFrj3cswe7N3WZS9WAbRRhai7zXAiUdD44
	 3uu2t4aLwxIfw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 762BA17E0074;
	Mon, 14 Sep 2026 15:22:21 +0200 (CEST)
Message-ID: <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
Date: Mon, 14 Sep 2026 15:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
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
 <20260914072842.24420-3-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062224_318520_9255FC87 
X-CRM114-Status: GOOD (  16.25  )
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
> mt8189_apll1_enable() and mt8189_apll2_enable() currently ignore
> errors from regmap_update_bits() and do not clean up resources when
> clock enable operations fail.
> 
> Propagate these errors and roll back the clocks and tuner state on
> errors.
> 
> Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>   - Update the names of the goto labels.
> 
>   sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
>   1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> index 63e03a40dbbe..aaf4f7921363 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> @@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
>   
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
>   	if (ret)
> -		return ret;
> +		goto err_clear_mux_setting;
>   
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
>   	if (ret)
> -		return ret;
> +		goto err_disable_apll1_ck;
>   
>   	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
> -	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> -			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> -			   UPPER_BOUND_MASK_SFT,
> -			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> -			   (3 << UPPER_BOUND_SFT));
> +	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> +				 UPPER_BOUND_MASK_SFT,
> +				 (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> +				 (3 << UPPER_BOUND_SFT));
> +	if (ret)
> +		goto err_disable_apll_tuner1;
>   
>   	/* apll1 freq tuner enable */
> -	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> -			   FREQ_TUNER_EN_MASK_SFT,
> -			   0x1 << FREQ_TUNER_EN_SFT);
> +	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +				 FREQ_TUNER_EN_MASK_SFT,
> +				 0x1 << FREQ_TUNER_EN_SFT);
> +	if (ret)
> +		goto err_disable_apll_tuner1;
>   
>   	/* audio apll1 on */
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
>   	if (ret)
> -		return ret;
> +		goto err_clear_freq_tuner_en;
>   
>   	return 0;
> +
> +err_clear_freq_tuner_en:
> +	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +			   FREQ_TUNER_EN_MASK_SFT,
> +			   0x0);
> +err_disable_apll_tuner1:
> +	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
> +err_disable_apll1_ck:
> +	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
> +err_clear_mux_setting:
> +	apll1_mux_setting(afe, false);
> +
> +	return ret;
>   }
>   
>   void mt8189_apll1_disable(struct mtk_base_afe *afe)
> @@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
>   
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
>   	if (ret)
> -		return ret;
> +		goto err_clear_mux_setting;
>   
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
>   	if (ret)
> -		return ret;
> +		goto err_disable_apll2_ck;
>   
>   	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
> -	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> -			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> -			   UPPER_BOUND_MASK_SFT,
> -			   (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> -			   (3 << UPPER_BOUND_SFT));
> +	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,

Well, this is a bit of defensive programming here.

The regmap pointer is already checked by the previous function call, and this is
a regmap over MMIO... and MMIO writes can't fail.

> +				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> +				 UPPER_BOUND_MASK_SFT,
> +				 (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> +				 (3 << UPPER_BOUND_SFT));
> +	if (ret)
> +		goto err_disable_apll_tuner2;
>   
>   	/* apll2 freq tuner enable */
> -	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> -			   FREQ_TUNER_EN_MASK_SFT,
> -			   0x1 << FREQ_TUNER_EN_SFT);
> +	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> +				 FREQ_TUNER_EN_MASK_SFT,
> +				 0x1 << FREQ_TUNER_EN_SFT);
> +	if (ret)
> +		goto err_disable_apll_tuner2;

Same here.
...and it's the same in some other commits of this series.

Though, good job about fixing the failure paths, that's good stuff.

Cheers,
Angelo


