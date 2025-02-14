Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF3DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9dgqwf+R3nWbafF3RGqzyDVVvVaWFczMtV2C/3/bQM=; b=FIY0BC20B2fRmbntzScBHWs6LJ
	AH8X+OYJxIt5JQlEqbzDjlg27om4NoqLtTUEZKOuRFbtH2G9DrkhAWjw/9KaTT6edfKi2k+2LaItA
	akjLnhVwLmFI5Qn8kYIZfwvuxUEi3l1HL69N72Sx0ROVpHbZUPehMFg9NM3OGdXYB7Gs7tfUHxtZk
	A0jQ7QvnbCa3sbW5m6eMS7VhQCt4pmTSMKN1f90cWz+e+w6GHsDHBYCIxzVG/Nc17icZi6+C4CFYE
	tGKmuOREjtu4+Zc6Jjjo7/MVqIiifonxZQ/7a931UD12XY7MQ0rdS+7Y6F0m5DFQzZa9pxuuG13Xg
	wU3AC+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisVi-0000000EQI3-2mFH;
	Fri, 14 Feb 2025 10:01:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisMO-0000000EOY8-40Qg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:51:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4395578be70so19146905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 01:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739526707; x=1740131507; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9dgqwf+R3nWbafF3RGqzyDVVvVaWFczMtV2C/3/bQM=;
        b=NW/ciGRxASTEppJGI4SDCdmZgtZoQDjpyxXrfhvH3CA/pHNiEbBNxrhxG2iZvpAtXI
         5l6hRg4ujZwT3wHncsGOVybbfF6f98iKiXa2bbFxItL88gNtQjSUhCY+O+s9JRYI48dP
         4DH7AHz57ZtjNYeliGWSP5o+YbWw1PbQspztT+ZWluZomMf9/x3PzGvTbK2IPzvFm8Jc
         Pnpl0tp/IlEMgHwKCnKcRHOjvxcT7l4QlcclFomLY+mCUjOtH8d/epe7ttcM63HtZG/p
         Yf/tE6fndHVRMLSbb0WHN+8naDvu8cI0zkfx8j0ijIdzDuOaE9ZyVoOgCzR513VodLE7
         djAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739526707; x=1740131507;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9dgqwf+R3nWbafF3RGqzyDVVvVaWFczMtV2C/3/bQM=;
        b=c8f0HNnkA1PKgf7MlqzEKST/Vox/XglOZw0j2cKUqkWRfcIHG/vSOnEPRmTl371PM3
         HPGjbcy6XgMhYxyEaOEv5plMx+bMV2DegavXETvLdk0+JHk/bO2XBen418pPNTwfxB9g
         zSq5unH2RPw63f8LBrPOes3QIGsJQha0eZ6SnVbtEclUl4q6AY1NFbxQ03ABnMFQ1CXW
         uAJ7BF4+ymMhjmvcfncioVADULlxXV/2HtFQyizS1vHVfQtH1QUdtvByBlJEbz3Mn3gR
         8SdCatrRzkEpUk1odx3yXoqOAiom/bG4wS8JDvX0uRVzYJFc/L7VQiA1n0/4LT21mCrN
         4O5w==
X-Forwarded-Encrypted: i=1; AJvYcCWiSQ8PRt6leNNm55NpI47n/HdtzBos2WgCnBDwwVhDFP2KVTzf+uor+6D/zdOgUNE6d74ASGxafIpiWkNXGd3e@lists.infradead.org
X-Gm-Message-State: AOJu0YxXr1CWPuCuqLLa+N1V0+6omp5uP7E+573eMIWdHmyaAjapGFvF
	Xjv7xm0GxzorvMYkgjnCfIhzneIzWk+D09lSRitSUOsE9JjgnoQFbOYAPEicvms=
X-Gm-Gg: ASbGnctxlxICUGatGY5CAYo4aKLfXwQUDbdWeetzsGXwQRd3cimcYXv3P0p2W9QCbY6
	j1MkD1sjOS1yH0QMAnnGQtol9FhnjUaBEMUAu7LYcH6y2bGymi266weZRuoql4d2k35B8qtSdNZ
	pA2If0XCy+gQk2YSWo/d1B0cYedKvsgigQQihnavo9eTG2O+NkePxQZhhxKw4Oh42TUYkPB5EBi
	DB+HbCvs/wgAZIGRWfp506GdgzqkZ0g8rEUkh8qKMQN2RHZA8gXc2QoRNhk7IipseeO8uuDnGv1
	oiHa1vg4ZSPfZ9M=
X-Google-Smtp-Source: AGHT+IH+sxpnkLZQx2UY8a+tMUtrwojgYLt+R+m3HuNuphzhfmWFPfEEp9s+PBMwuOVBfiUzYVVAPg==
X-Received: by 2002:a05:600c:1c91:b0:438:c18c:5ad8 with SMTP id 5b1f17b1804b1-439581cab45mr126116575e9.31.1739526707420;
        Fri, 14 Feb 2025 01:51:47 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4395a1aa7e8sm71465665e9.26.2025.02.14.01.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:51:47 -0800 (PST)
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
Subject: Re: [PATCH v2 4/5] ASoC: meson: s4:support audio tocodec
In-Reply-To: <20250214-audio_drvier-v2-4-37881fa37c9e@amlogic.com> (jiebing
	chen via's message of "Fri, 14 Feb 2025 10:13:43 +0800")
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
	<20250214-audio_drvier-v2-4-37881fa37c9e@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 10:51:46 +0100
Message-ID: <1j34ggzwel.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_015148_999523_609D7E03 
X-CRM114-Status: GOOD (  26.80  )
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

On Fri 14 Feb 2025 at 10:13, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> Add the audio tocodec for s4, add the 8 lane support,
> add the mclk and sclk enable event when start data enable auto switch

Again, incomplete description and mixing things together.

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/axg-card.c      |  3 +-
>  sound/soc/meson/g12a-toacodec.c | 64 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index a2dfccb7990f3a53f508fc6724b21de53b4494d8..5cef069c3370257d4aaf24d7270482651babcfe1 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -303,7 +303,8 @@ static int axg_card_cpu_is_tdm_iface(struct device_node *np)
>  static int axg_card_cpu_is_codec(struct device_node *np)
>  {
>  	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx") ||
> -		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
> +		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec") ||
> +		of_device_is_compatible(np, DT_PREFIX "s4-toacodec");

There is no need to extend that indefinitely, use fall-back

>  }
>  
>  static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3ec4c47814d6a0676d5c62c705da75..a93a91136e8ea00e856c3981b9c1e7e08d927a3b 100644
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
> @@ -107,6 +110,33 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
>  	return 1;
>  }
>  
> +static int tocodec_clk_enable(struct snd_soc_dapm_widget *w,
> +			      struct snd_kcontrol *control,
> +			      int event)
> +{
> +	int ret = 0;
> +	unsigned int mask = 0, val = 0;
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +

Over complicated for no reason

> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
> +		val = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
> +		ret = snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);

All this could be done in one line and be actually readable if you
properly used the BIT() macro.

> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
> +		val = 0 << CTRL0_MCLK_ENABLE_SHIFT | 0 << CTRL0_BCLK_ENABLE_SHIFT;
> +		ret = snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);
> +		break;
> +	default:
> +		dev_err(component->dev, "Unexpected event %d\n", event);
> +		return -EINVAL;
> +	}

... and nothing explains what is being done and why ...

> +
> +	return ret;
> +}
> +
>  static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
>  			    CTRL0_DAT_SEL_LSB,
>  			    g12a_toacodec_mux_texts);
> @@ -143,6 +173,14 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH_E("OUT EN", SND_SOC_NOPM, 0, 0,
> +			      &g12a_toacodec_out_enable, tocodec_clk_enable,
> +			      (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),

Drops the .autodisable without a even comment 

AFAICT, could be done like the other SoC with SOC_SINGLE_AUTODISABLE()
with properly chosen values.

> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -236,6 +274,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>  };
>
> +static const struct snd_kcontrol_new s4_toacodec_controls[] = {
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
> +};
> +

No. there is no reason to add that for s4 and not for sm1 which has 8
line HW support too. That clearly shows up with #define used.

If you must do that, please do it correctly without leaving the other
platforms behind.

>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.probe			= g12a_toacodec_component_probe,
>  	.controls		= g12a_toacodec_controls,
> @@ -258,6 +300,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
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
> @@ -278,6 +331,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
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
> @@ -287,6 +347,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
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

