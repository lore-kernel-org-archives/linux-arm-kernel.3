Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22665C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kz8ImsjTzQwn1N8Ij2upDTZWTKNnifZbmmG0Mufm0RQ=; b=VBS/CCMkPWGhiUGfTBcVzNJTzc
	ZIqmTbjNujUzR3/2gGiJyVd0UYi6uLeiydn7iMyXY3y92xl9kPu3NckSauGbRNB1btkzF0YpzOnXi
	hS4jjBLhtmXtMpszrBEbeq7vfGa92Mm5HSXTGcMIl8niv3w/iV2ZWwOtonw7QbQb6oze7SHuGKjLL
	oGkJ8xgoOeuNYENgjbp+PggDknRsiIjsQf47/9x+pplbR2d63at7Vt/BNC7g9F4CHOAmuSdKqs048
	H/8rPzy6cLlLOU8hXrgX5e+8m4KmXf8wVfJqv7+bC/2eRFcT0R46BRdAh/1cn0eIuAHdAKcGJdXk3
	hoqKojzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66jW-00000003lYs-1Zlx;
	Mon, 14 Sep 2026 13:28:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66jT-00000003lWS-3bSt;
	Mon, 14 Sep 2026 13:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392505;
	bh=+j5uJ/paHPgKfTYlvJPjdKLR3qhSH1k8kbNnhD7XBTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YugA27sGvRUNH5aTiXpX2t9yIBHy651sJsM53vhworyOFppqlH0VeNtxu7TUYm8/p
	 iQ7FEhZUxn79GRC/6Tk2QTheXdfp7F9CIM/fNbEdpEkOo3w0C03RkqJc4KoazHEWha
	 L52KEKY6xh6IASeYSlsII0hRxOLdO6Wspkp+6HplXWOn2fvIDvm5DfcvchdHQS2LHn
	 Bn+FxdxGAske9sfDaSlU920Cw+8vtzibS+bd9fKQIAzKS8z9AB2zkz5gJBppx6+jYZ
	 EsOzb3fLPtbgTdD7F6qf53MxjGjPAnAYpz1kEoDGhpA0rgdcXmeVEDKEg23e3bxD6Y
	 guhZ9rkOheGNw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 594EA17E031C;
	Mon, 14 Sep 2026 15:28:25 +0200 (CEST)
Message-ID: <d6ef72b3-f928-42ad-9317-5fe1e44b9f31@collabora.com>
Date: Mon, 14 Sep 2026 15:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
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
 <20260914072842.24420-11-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062828_182251_09D2F873 
X-CRM114-Status: GOOD (  15.14  )
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
> mtk_mclk_en_event() currently ignores errors returned by the MCK
> enable and disable functions.
> 
> Propagate these errors.
> 
> Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> index 4826ee250d70..f20dbb410223 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> @@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
>   	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
>   	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
>   	struct mtk_afe_i2s_priv *i2s_priv;
> +	int ret = 0;

int ret;

>   
>   	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
>   		__func__, w->name, event);
> @@ -529,17 +530,17 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
>   
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
> -		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
> +		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
>   		break;
>   	case SND_SOC_DAPM_POST_PMD:
>   		i2s_priv->mclk_rate = 0;
> -		mt8189_mck_disable(afe, i2s_priv->mclk_id);
> +		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
>   		break;
>   	default:

ret = 0;

>   		break;
>   	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {

...after which:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

