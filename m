Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4CE606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zql8+L5v;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=olo2HQe5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0Hjc8l32fjqZfSZIiJhNxKSLbC3uFZbj2Kv1jpon6Y=; b=Zql8+L5vWhi+xj3voitzsfxdqd
	gWSZUBKCDx6O17O4wcak8cYI73kwynu7OGF7DwdA8oeOHtSCQHN3X+8fLTNl2PONG/xdUtEyGlwG9
	01kZR6tS3NoafgNti3O+xLockFp58Q6pTFWMBk68cJnl1X18A8mPqAoN/NpArQd8Ge2Mh64oAfWf9
	DoqQLvU6/AUW0BGMB0D+492qx22ZBBaR2vDA0KZ5Q8Q5lFykEe2Tr2yMmgIqneeyp5TB2awa0G3tH
	fuS3W3XTwhrcduAnyQN/evaJusAN0nr5MKHdXhRuk6S3JqUSXlnm4kPHwlmucNjpelEfPZOA6jmj8
	SNn8za2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXvR-0000000CCcU-32lJ;
	Wed, 21 Oct 2026 15:08:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXvP-0000000CCbV-3amE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:08:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso4754415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595298; x=1793200098; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m0Hjc8l32fjqZfSZIiJhNxKSLbC3uFZbj2Kv1jpon6Y=;
        b=olo2HQe5NOoTVr7+NsHeWpF/OYC/mE8558cPVdOlmKzaIbmnLjY5fdTQIGVbgYSSmH
         19X/GF49X1GTYkvUZJnsXg9jS9BkMpmWzAsUD1Kb+Y417Nc/BySZ7qDV3RND34rBGvIx
         YXA1dCfvpjgZd1PzR+mhIlWH/PCzT3AOuvjjeRIN41/AEijOsD9aEyh2FM29fbelMjaq
         A2XEiNmfYsxUSijCyVfOdpfvJZiw3p8gjz3vFX5HM7+pnKScanMoy1iZKV1G3dfXYEiG
         EqzifzhYK3ngcCbkEUK8tNsT9gJqqWpWnWneY3bmIaO3U6P8VCKl5mYx0pV4t8geOQ09
         xGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595298; x=1793200098;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0Hjc8l32fjqZfSZIiJhNxKSLbC3uFZbj2Kv1jpon6Y=;
        b=Fd537IlLyPX+/+0aQE/Rakzpd/+6MXzCmZYlQxxH9ENKXdLiu383j/0fMON/8Y8hYK
         5M1F9db4FIc6kohkqlPqaF4x7Q2k9/MC2a7pkUbpHvlotQvv+4tgzywzhQTkmkvslAXc
         iT0awCGGk2NHYpCMsi7WBMESeyo0x0yL6COtO5Y1+VEghNLz3N8TuGLSy5slpMYwzYQW
         8iQQrbguf0xZ7xXgCfw6utBAL4Zmxhs8I2AE4MtXPX6Q2ABicl9a55b++myhGKE7iOue
         VQEtCOonRiHKQQPkcS2UUhuYC/ZvzqXeePniM8iEM6M6m7VsW8++knx6NAhmw8TKUdzg
         4fOg==
X-Forwarded-Encrypted: i=1; AKwUvBzC1TlhT68VhNz5IcFGv5BiC0VIt7rCE+URmfv+2DhcerMz/2RjA5FeJgiuaNhhj40Bx/+9dqYvfVTp+3yjYhhr@lists.infradead.org
X-Gm-Message-State: AFq9FYJbcSup38xy7cg79zU+1GV2z743s37p3hnShpe8sU06F54Z54CP
	GFG7+QHYoMihLE04eulz+ebAKwYDDblWypPcNLceJNxJVSZbQqqpdlvsgwMHZCNOnqI=
X-Gm-Gg: AYBFou2HYvGj+QK8TeN6oUw+Bu/rzIqyLuyPd+YYAVVmrwdVkUgUjFavlq+7gLXAIAs
	4LuXGut/CHahMnZjjCtAhrffIy8Y14xegnu6h4u3yLA0uZY/MkahbgUk/4BOTqCA5LPcK1D94kt
	sub+N9Nnk6FDXce7Vh1JAyfF1v9O+Vh+PXyAtPFHtkRE/CO5DW5JyCutmdg0fwJF/bn3b5qmirq
	0c0r/e7cua/EE+MsFCghvor0EPhqQUjLK77DieksswligiNRjxifVgA3o0zISOzB5Lvnsl4WuOx
	/XkN/t+kZAFZYlwE7ipu8ZgKTg0zpl2Jmu00zeMNbTVNQhfCWYfE+/Kl2V+UCbzdPgrqYYwvQuL
	70SWM1p//P2v6yG5wd4bnxDfxCtPRoiRX5M0d0B5a7U25XH9+w3WPOXtITTBJPEc4kZvaoNmj7b
	v+Zcqh8ixNy446coKFLjgnhi0o4eFVvICWyc9TBiATILYYGwkut6Q03o5vSx1aAMrm5AJvc3liE
	I/Ei0/eXCG2UlduxQR1MP8PBs3bAwQGOxCy1ufODxL3h1SZuxNrQb6bs4Rc0sol3I2KYHTI9ps=
X-Received: by 2002:a05:600c:6296:b0:4a1:df50:5758 with SMTP id 5b1f17b1804b1-4a1fd8cb920mr50004785e9.1.1792595297894;
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm36794605e9.11.2026.10.21.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec
 driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528986.4070168.179126639869298765.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aT/Bvwr1IC3lec+0KVaFiCrr+0v7baOk1896xqidnfQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsaXnu399Vj82hve2avywriU/6z0t5/K4BMyhdGpI
 sSP9cedjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenANzkp4wMLxVKdWfazw34tVSo
 LJAvcne0rSDrowsXO4PktqyfL6b0h+GvXKuDmBjT5pJZ+eztVi5G+Y/WXk2b/XTul0jV5CObErW
 ZAQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_080819_917656_8B6E30C0 
X-CRM114-Status: GOOD (  17.99  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The S4 requires additional clock control bits to be turn on while enabled.
> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
> Update the widget accordingly.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 49 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 21941ee552c5..9cfed3702354 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -41,6 +41,9 @@
>  #define  CTRL0_BCLK_SEL_LSB		4
>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>  
> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29

Please follow the indentation convention in place (2 spaces)

> +
>  #define TOACODEC_OUT_CHMAX		2
>  
>  struct g12a_toacodec {
> @@ -141,6 +144,16 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
> +			    &g12a_toacodec_out_enable),
> +	SND_SOC_DAPM_SUPPLY("I2S BCLK Gate", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("I2S MCLK Gate", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0, NULL, 0),

BCLK Gate => BCLK EN, same for MCLK

> +
> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -226,6 +239,16 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  	{ "OUT Capture", NULL, "OUT EN" },
>  };
>  
> +static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
> +	{ "SRC", "I2S A", "IN A Playback" },
> +	{ "SRC", "I2S B", "IN B Playback" },
> +	{ "SRC", "I2S C", "IN C Playback" },
> +	{ "OUT EN", "Switch", "SRC" },
> +	{ "OUT Capture", NULL, "OUT EN" },
> +	{ "OUT EN", NULL, "I2S BCLK Gate" },
> +	{ "I2S BCLK Gate", NULL, "I2S MCLK Gate" },

Audio signal does not go through those Gate elements
They should be supply path connected to OUT EN.

-- 
Jerome


