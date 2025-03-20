Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823A6C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3QH3qUlNH/gqSM8rGalO1GesljsIqna87D8tGVSkJw=; b=UmhKMm92cXZ6i6X/eDZfZqbaZ2
	nz1q1OPmcxr2dHWZyP2BBWyF/6ki3Enlt/QuG2LGmvLsxvl4BisnXKiZNAXzIRe6ZStOnU9CmBTEx
	WJWwD8pOKNO4yhUgCQALPOy4hONCr08QWVavllVwcTCbVdsSx1fWVjGFgvT19iJ+A3BA3WyO87OOH
	0KNgEZWhE4v9ZGlaC2LngUp5gTO27S3qLxJG/E9HI9wsf7bomtdcvQjXQq0c59SdT1S9gxt2nF2ou
	wGNEhm7Y5JOOH/Y5fl727KuL6COWKkD8HU1AFTfQDwi4uwXRSGWr338PRXd8oZJHQhS6XIHOg+qDs
	Q50PCFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBZf-0000000Baem-3Tsd;
	Thu, 20 Mar 2025 08:48:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBXy-0000000BaMF-1KpZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:46:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso3048155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460397; x=1743065197; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3QH3qUlNH/gqSM8rGalO1GesljsIqna87D8tGVSkJw=;
        b=J707qcSDMUMMz1eaWWC1z3CJyY2YQ6CIeJZ901jDlpssMHpO3R1hTwxRYcBme5Kir3
         VnnK6/CFRakTuu0NzzxfS5SSC10OvquFILcOeDdLRtpUzxPhS8FZhXxKz8STW+ENxOoL
         4GhrklT1mS7Q8UhiODJjAcGcUOFIEP34YS2VqgFOarPT8hePjtGcs7iBpqOX7K81jkE6
         M7RkVG8JUtLeOPE5J+ZAd8EyNsyccOgkENzvbqyWZc0BFnIh3pDIp5DlgJBbUW2xnOb5
         tTRrYIge0KoCbXX7GSupwJbsoqj4frttAc1dOLWgzStxpcE/G4aCave3+XJ6HGxFnDrN
         y+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460397; x=1743065197;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3QH3qUlNH/gqSM8rGalO1GesljsIqna87D8tGVSkJw=;
        b=pTnvcF/hgJMVmRBLLCb9ICuvT4lgvv7NyI8KgUSyJFIVecrI6X5RYfzOcyRA4rjORw
         MCLC13Uh7FtbQf7OtKsxzNcq6djLKqRqCKq8ZmoZGu+inHzYDeuNVXi2Fgd4JxD/iK8/
         DmiJdI1dJunZyCJHIdznRRLTzbmvx1vw6s7BASGAqpBbiohSp5OKcKsq6hKjLwNo1tqA
         skkCh4mBReuCit9U5pPHYOEZ/yw4MOLNCQt1ONhUpkCkcccLG7KVQJUFJyVYeIPAr0RZ
         yw8EuR9eeaJCYif5qxLbo+MfArZiNogzQv7u4hPq6avIn8R9et5Tc8P8niXMEbzLlk79
         y1LA==
X-Forwarded-Encrypted: i=1; AJvYcCVEL+CFT3lFWSkNmzlyOZwMQalNCOgysVY5M6NAvYv3JiyYjCEomC9oBXUDOi/cjDWtBSFCIxb4/+eu0sDlwxX7@lists.infradead.org
X-Gm-Message-State: AOJu0YzVABSyYxIVGEHCJYarz+PMTH8KEd2Q26+nWEmGnwv4XiCBNbSG
	hMiw2hruUyPwCiSZQDSjk1H26cGblVU3vpfY4h2i1H+BzziyK0U6Y1qA4ICusYY=
X-Gm-Gg: ASbGncslYEABODn9LSXPgXmDeDQDU9jK/3KM5iQznE0Fi5Qe91TdugGQ0X59nWRyIJf
	aKZusEluADBUn5I+GH+pjacCl8BRIr+Mvf6sV053pjoBaN5Us8vQGxSlQStJci/EWdq8ZXrF0Bk
	A3DPBLC6isII0PcMbPuaDX/pNS4iMy6Q7qz/1gamllf9KOEn4wOwhlmWO9eae4Zrvu7K6TDt0c8
	i6lIGajulcmslnk0ytGjaeg60ZDnySe68vUzqhp7JJVflXlWhlwj1N/jkvIRUJfaSk4rT/o9yAd
	o9D6l2jSGcq8evwAiE2tUGJ0l1fhcFd24es9/rrbh4JW
X-Google-Smtp-Source: AGHT+IHQm6xIAgW16c9rSJQfuwSOkpxhl2OJe1D/zAy21xgweiekDmWGRfU5wzJOyEV/LHZraSbP0g==
X-Received: by 2002:a05:600c:3b20:b0:43c:fd1b:d6d6 with SMTP id 5b1f17b1804b1-43d43842e8bmr48409055e9.31.1742460396893;
        Thu, 20 Mar 2025 01:46:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e0ba:db2b:7cf4:d967])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb318afbsm23804353f8f.72.2025.03.20.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:46:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v4 4/6] ASoC: meson: g12a-toacodec: Add s4 tocodec driver
In-Reply-To: <20250319-audio_drvier-v4-4-686867fad719@amlogic.com> (jiebing
	chen via's message of "Wed, 19 Mar 2025 15:04:47 +0800")
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
	<20250319-audio_drvier-v4-4-686867fad719@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 20 Mar 2025 09:46:36 +0100
Message-ID: <1jfrj82ioj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_014638_368995_6252F481 
X-CRM114-Status: GOOD (  19.51  )
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

On Wed 19 Mar 2025 at 15:04, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> S4 tocodec support 8 lane to input, It need to enable
> bclk and mclk control bit when work
>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 46 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3ec4c47814d6a0676d5c62c705da75..88f9adabb3b5d7d8881fa110f1d0d51e9ac9c60e 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -41,6 +41,9 @@
>  #define  CTRL0_BCLK_SEL_LSB		4
>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>  
> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29
> +
>  #define TOACODEC_OUT_CHMAX		2
>  
>  struct g12a_toacodec {
> @@ -129,6 +132,10 @@ static const struct snd_kcontrol_new g12a_toacodec_out_enable =
>  	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>  				    CTRL0_ENABLE_SHIFT, 1, 0);
>  
> +static const struct snd_kcontrol_new s4_toacodec_clk_enable =
> +	SOC_DAPM_DOUBLE("Switch", TOACODEC_CTRL0,
> +			CTRL0_BCLK_ENABLE_SHIFT, CTRL0_MCLK_ENABLE_SHIFT, 1, 0);
> +

I think I remember commenting on this already.

>  static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
>  	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
>  			 &g12a_toacodec_mux),
> @@ -143,6 +150,19 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +/*
> + * FIXME:
> + * On this soc, tocodec need enable mclk and bclk control
> + * just enable it when dapm power widget power on.
> + */
> +
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0,
> +			    &g12a_toacodec_out_enable),
> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -236,6 +256,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>  };
>  
> +static const struct snd_kcontrol_new s4_toacodec_controls[] = {
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
> +};
> +
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.probe			= g12a_toacodec_component_probe,
>  	.controls		= g12a_toacodec_controls,
> @@ -258,6 +282,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>  	.endianness		= 1,
>  };
>  
> +static const struct snd_soc_component_driver s4_toacodec_component_drv = {
> +	.probe			= sm1_toacodec_component_probe,
> +	.controls		= s4_toacodec_controls,
> +	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
> +	.dapm_widgets		= s4_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
> +	.dapm_routes		= g12a_toacodec_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
> +	.endianness		= 1,
> +};
> +
>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -278,6 +313,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>  	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
>  };
>  
> +static const struct g12a_toacodec_match_data s4_toacodec_match_data = {
> +	.component_drv	= &s4_toacodec_component_drv,
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 19, 20),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
> +};
> +
>  static const struct of_device_id g12a_toacodec_of_match[] = {
>  	{
>  		.compatible = "amlogic,g12a-toacodec",
> @@ -287,6 +329,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
>  		.compatible = "amlogic,sm1-toacodec",
>  		.data = &sm1_toacodec_match_data,
>  	},
> +	{
> +		.compatible = "amlogic,s4-toacodec",
> +		.data = &s4_toacodec_match_data,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);

-- 
Jerome

