Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CACDC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ndI1o0tF4rBbBQihF/KpyjTjK7B3nvas+X0LJj+FFg=; b=Y4QQrhIws5yGYpgHNjs1ejOKD9
	cpbmtFFnyyJvt5AFq+ILjo52Nq4ojwOcZXxKL0PL2opz2SPcmW1cYDbRscdrnwJ2ExTW/WSC9H6gj
	o3DtdLMnpHB2zeQMYp9VrSUcir8qi6DE1I3K1cpxHrxq/pYAGYb2jxSCLYe4Hb3Y/4GfLUJKNZOJ4
	Ef9uSD/UQ9QId64TGNljlWz7PmdGjTzb3cHIHhRKLqoj9Q8/KXspO7LaLiNr4pxptHbTaLzx4RC6t
	30sxGWxlu4ebk7iB8oFivCUJk3F6fnOpS4cbjmtNdnZ6V6dgEe/P0zNwwcCc0QNlFY5kQXg5lWU/8
	ukGm54jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4etI-0000000EThI-0tEe;
	Thu, 10 Sep 2026 13:32:36 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4etE-0000000ETeH-0fkQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:32:34 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f705536so289616766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789047150; x=1789651950; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ndI1o0tF4rBbBQihF/KpyjTjK7B3nvas+X0LJj+FFg=;
        b=it3ga0la+xdnGRVIzv443xdbDVkBDg/jneDHrOilWLkGGnQEH6p50M4jT8oF9qgWju
         9j+zB3NoEmb3RidC/NhFgASPWvcNFvQMiX1Mu2eq2xFFSvsuS81yj3uUa+pwa1O0wbT9
         BqW2lu/PBSRKsnFCy31SNnFs89w4Wu587/d9dCm7ROMPlEJAOSwU7qK5N6OAST1ZDegZ
         rGaxCg97VvN+Rdp+FuGE6Vqr7rJsaTa2SRCoB4d7a/Jwpm/MIpgm3Z2CeWBTtIWjrKan
         CAR/JEOg3tq1kHpyvRPWzWAQh4J9a3SBSSIMIVo5oa2icIJUrjXk6VI9ceaWzIgb5JuJ
         v8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047150; x=1789651950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ndI1o0tF4rBbBQihF/KpyjTjK7B3nvas+X0LJj+FFg=;
        b=SaDeWW5ZLNxcbM34jF3hpPGVUeFkdn/tKeTRoI+J/FydnGGTkGgLb++QrACvTFtXDr
         lbGYu7Mub6Q3UG802HTwfskHnnH6J0s7gJbv61KvEafCqG0lEIUxrXEUa3OgwBDEMT6U
         VXcTqIgTvlmgV/JFfV0LQAMzj8AU3oOcKANwfCvcwsHAZliDuL1bI3OMYXk2bU5kR7UT
         FK5JnuoyqremrNAhqnmDSj/fbhCPWKs1YvaA97y/1dE00GOZrpqsJR2tNAlqFXkQ29wv
         VEwukPpQ/KuqQGI8RMo03ELr51g1/MoJgEdbbLNJ08iQ4EmDJZazTNCkHa0831SOXmxU
         maFA==
X-Forwarded-Encrypted: i=1; AKwUvBwZdvi+vyF0jJpdIh5cIwTHV/Dh2z/0nkjL9Eufr1BXEqZ352tKo42g9Tq7FoVZTPbm846T9vJGCZYA/+2VD9Oh@lists.infradead.org
X-Gm-Message-State: AFuF++mbwEf0RWdjhjP3tE06HvZqolk5j1LAppjP0LLFnezWf5PA+Qmm
	FePqpvx9s3t+UNkFossH4J0LNvr5IMeThzwD8/zC+1ptFtwhdGGe3p4q
X-Gm-Gg: AYBFou3lcvPb4Pgxg7Zif13j17Y4T41R0U0Xmo4wXEaLgM317Pmj8Mxdt37B9yMdSKk
	7YPkAH/e2Z8z82kBWP+Mean92S9hnpCsq/xk9kdZZBWp8tLB7dnmoeWlrFMnBl0ExrkyeBN/mZX
	gEQl6YBGxDy3sQf723hoivLyzw64Sa49CJPEX18gH3VhBhb6K8/FMbHEqpa5asuKRIm4fw5zzso
	PH+1ko16clTRS6hY1RXPya7ll61yo3mHHqAcs1ue0TNCJ+cLcLeiaihzv42H9d7gwBAbK3lwcOk
	iHkdObTjV9vYfzgT7itfUptZ5vwFt0e1SzQJuZh4ZkCqT4tSh2vSfjzYFRUIl5CuOSKsfxhHZWT
	g28jxJXFDCUtBhebb1btxb1EgE2gWwJztF3lakC9cDif4elacM3MfBeGBzdt/6cbs5VuVFCkqII
	wthgasI5qMXi8772ybeOAsDoULtQQlJOv54zSvAUEoXdkwohtIvhjTZb2EID79lIGTLOM=
X-Received: by 2002:a17:906:99cb:b0:c25:62db:772b with SMTP id a640c23a62f3a-c2941868ad6mr336284266b.7.1789047149946;
        Thu, 10 Sep 2026 06:32:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d581f51sm945616266b.42.2026.09.10.06.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:32:29 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:32:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
Message-ID: <aqKxadkfX9Tqx8JR@stanley.mountain>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-3-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910125742.150902-3-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063232_236520_3DC57F1F 
X-CRM114-Status: GOOD (  18.61  )
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

On Thu, Sep 10, 2026 at 07:57:31PM +0700, phucduc.bui@gmail.com wrote:
>  sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
>  1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> index 63e03a40dbbe..a901be97e75f 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> @@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
>  
>  	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
>  	if (ret)
> -		return ret;
> +		goto err_apll1_ck;

I shouldn't complain about this, but I am going to...  I don't like
ComeFrom label names at all.  Imagine if we named functions that
way, there would be a thousand functions named called_from_probe().
We already are looking at the goto so we know where the goto is, but
what we want to know is what the goto does.

Better to name it err_clear_mux_setting or something.

>  
>  	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
>  	if (ret)
> -		return ret;
> +		goto err_apll_tuner1;
>  
>  	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
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

Since you can't test it, it's a bit risky to start caring about
errors.

regards,
dan carpener


