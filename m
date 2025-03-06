Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE7DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rr6HJYrIFdh0rI3RgJKPVqyOkkzSUwbjgMWnVkXlprE=; b=F+Gu91wKqLbpmZ3dsFIzrlEevY
	6tLclIeB5RItc341wus7Z6Vh0nnfaW6l46MW0HTaS68nRmgnKF0fTsLCSdzJvVhvqsXlyyy5zlBHq
	DkL5U8fcKr0QSm1nRTYbtOf6gjV7ibGKyJtxj7MzOg+IFozVmCtGo25M+ijqDolQOneYTUu4h1a1w
	PmFXBjHagqxdqTU/7PDI0qnYLNk4Zwsxe/eiP7KQMcfHr6HvQyZs7dC0h7IJXlHiDFlHHo4QbDDkQ
	Kt7b8L/iuKJR39aOzwy/OFgU5GGkPayk3fepWAeDzWEMIodqMneRR6akx2sqsz4ViETsEDBLbL9Gk
	Ly4H/i/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDfT-0000000BPBu-2Pkd;
	Thu, 06 Mar 2025 16:01:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDck-0000000BONT-2RcH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:59:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso5560335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741276740; x=1741881540; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rr6HJYrIFdh0rI3RgJKPVqyOkkzSUwbjgMWnVkXlprE=;
        b=QV+EPi8GK4sWahhEAOZTs6MRLKh+cP5zIlD7gAqtvJ1xp/1hN/5hilNJrTtCOCUHh9
         jWU6lnNY0v7YciBo4mp5AG35Ld0kNKF12eGQdMli85FVC5FRoDg/bfIDuG0Yrl54PI0M
         2RshPPVZlVnNiLCdRzrBHtJRbZTQrxQCE/U7Vg+GIE7vehItKFjmm0JkB2Z71tieyEyl
         /YpVZqN83H27OKP4Ly4Ot56aCXm54GtPUEErvo7AohxVZ7kaZQwlS6pvS2q+7zSSq4yn
         t7N3GEBtPLI1bcgpQ07T/QoYsslyU3pNBP+x0Xq8HDvfQdzQwjf/mZvx4EOKshJ7jtBA
         gRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276740; x=1741881540;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr6HJYrIFdh0rI3RgJKPVqyOkkzSUwbjgMWnVkXlprE=;
        b=ZK1iHmu1lHphlbmEnmbEv+t8m/FnJ/2xkwNe8Jpa5K/nKT8X+Qy1OAFUVDMujzRwF8
         rqLEhADVKBekZ/eO0cMGmois16OAOzV9FaRf4kZ+JzKaFseZref3QLHFA1QaQ/4PCxaP
         teCOMD0q5lPBQhkbzGqfrtJVcVm3u4j0F64YSArLjpksoD5zRrl14+14zrTT8QX7rlro
         13lugovtA0OZWk8/Ld0SwEIZeL/gQRxIvEWrRU/YAWPYu8tBPl4M8vFNpG8MPr+H32oB
         cYzeWEYLqXdHgD9xl0/Hkiv/Qqdu13ZsT6Cp1OZoaAY6Wki+pmRahqNMrM+n7PeSX/Fc
         7bbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwBJhz3y4UPjL41HMd6dMuL4umdulnJ45/hc86rVHrYjnVrBwEtv7A0MrFIsWnddvqHVjOnHtjX0YV9egSVt1W@lists.infradead.org
X-Gm-Message-State: AOJu0YwKVqG5qfIaDwW8Fup+kS8Whd/O37e4yRMdeyQs00yTfSjozFS+
	eAQrzScd5id48RxDgTStNbOulipB77mhK4IcNLpRrgJ/ayxSEewrb4uVyrVl6ss=
X-Gm-Gg: ASbGnctnBt5nVMNW8LB3bbBOqXmGLGxEV+XCnO4PCSYydDff5ASOz0HL9V3tCZp8k9L
	zcfny2uOB9vKgZq56ZfIeAE9MxA5FDMN8Alghf+gHyWEcKHiMUxvW4uYb0h+ML82FoK5/UnEx0Z
	b9AN3hGWDcpI29JOEFMy1KMg7WO+8yHTqvd7YXuYwVLhic/Z2snsMLoi2ESP/424DHj1xHAsXwz
	jJ9rc1DdSCCr3jtmyHUT9Ka9lXXIAjA394yYm0DDnxAMmQylSw1tQA3Zr1R0dqQCY9rSjCmakkZ
	ll0D4PfF7Ihxv7dRALBM/o4c70o4wYCcVaz2ZMCsDMM=
X-Google-Smtp-Source: AGHT+IHVG48PQ3PbBxa6Pppm5OOQfY2250cBwz7kifepeP6HNmcBzErFykhRYqq1LVB1ReOFWmHCsg==
X-Received: by 2002:a05:6000:4020:b0:391:2e0f:efec with SMTP id ffacd0b85a97d-3912e0ff334mr1501348f8f.7.1741276740418;
        Thu, 06 Mar 2025 07:59:00 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:29d4:36d9:5043:acd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c103f41sm2391111f8f.85.2025.03.06.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:58:59 -0800 (PST)
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
Subject: Re: [PATCH v3 5/6] ASoC: meson: s4: Add s4 tocodec driver
In-Reply-To: <20250228-audio_drvier-v3-5-dbfd30507e4c@amlogic.com> (jiebing
	chen via's message of "Fri, 28 Feb 2025 16:04:13 +0800")
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
	<20250228-audio_drvier-v3-5-dbfd30507e4c@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 06 Mar 2025 16:58:59 +0100
Message-ID: <1jfrjq5ews.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_075902_898887_F1AFF44A 
X-CRM114-Status: GOOD (  19.86  )
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

On Fri 28 Feb 2025 at 16:04, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> S4 tocodec support 8 lane to input, It need to enable
> bclk and mclk control bit when work
>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3ec4c47814d6a0676d5c62c705da75..41eef9980059285275f0189a06469fc694775955 100644
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
>  static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
>  	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
>  			 &g12a_toacodec_mux),
> @@ -143,6 +150,15 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
> +			    &g12a_toacodec_out_enable),
> +	SND_SOC_DAPM_SWITCH("CLK EN", SND_SOC_NOPM, 0, 0,
> +			    &s4_toacodec_clk_enable),

I don't see a reason for the user to control that.

A user controls if the component is enable or not, and possibly select
the lane ... but that's it

You could have to flipped automatically which dapm when the component is
powered, that would make a lot more sense.

> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -228,6 +244,15 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  	{ "OUT Capture", NULL, "OUT EN" },
>  };
>  
> +static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
> +	{ "SRC", "I2S A", "IN A Playback" },
> +	{ "SRC", "I2S B", "IN B Playback" },
> +	{ "SRC", "I2S C", "IN C Playback" },
> +	{ "OUT EN", "Switch", "SRC" },
> +	{ "CLK EN", "Switch", "OUT EN" },
> +	{ "OUT Capture", NULL, "CLK EN" },
> +};
> +
>  static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
>  };
> @@ -236,6 +261,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
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
> @@ -258,6 +287,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>  	.endianness		= 1,
>  };
>  
> +static const struct snd_soc_component_driver s4_toacodec_component_drv = {
> +	.probe			= sm1_toacodec_component_probe,
> +	.controls		= s4_toacodec_controls,
> +	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
> +	.dapm_widgets		= s4_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
> +	.dapm_routes		= s4_toacodec_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(s4_toacodec_routes),
> +	.endianness		= 1,
> +};
> +
>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -278,6 +318,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
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
> @@ -287,6 +334,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
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

