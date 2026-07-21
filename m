Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88570C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJYszYNZpB6+D7pDZToiKE09TTgTGymFuxDbH25RBnc=; b=mXbgAP7H3JGzPh10NzJT2BXdIt
	KVz5CabY/8dpgikxjKhBFkfqBAGTymukZ+umeXwkcQVM+vBGV7Ak2ruS4p9NyEnTjEoqjmqSYQFJD
	+dk6nlGIkIx3QvC5NPIKddEw/Vkmnwe4OOtk6g5Kf7pk2LvGqcrLviQw126gN1aKLMtpTPgSiJy9S
	2k3GxTACFGfBm9WAMcSqLkcpWAbFM6NvSjsSO8dNvBPjX6p5Aqab8Ck8p0knxIbsgNhnYDTfNs2B+
	GeH8x+QcusRBnPzpr7i8ReOiJuzZf2rhUG3xA4KCyKKSPtm0j0OS6FQ8REUyW6eeVB96uXEAMBww+
	Dh3fkfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm50g-00000008f36-0Slw;
	Tue, 21 Jul 2026 07:35:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm50c-00000008f2J-1eox
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:35:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso16003095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784619320; x=1785224120; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pJYszYNZpB6+D7pDZToiKE09TTgTGymFuxDbH25RBnc=;
        b=SU8ArOOXAgwE5X5lRntgMYeYLnO64zIZr9XSsPMWhy7y1fYDn9YxL//NqrpTAeqbju
         dlS2wGiSJVh93V/zqwWp7uoPJjyOtTPhpHs6/tYHgmuFL4U8KRFN06LyWvCm5sUp4h+u
         ai10Pfjj+X6+YU8pYWAlwJX8no4gfQ0nojevhCuOpQEo3pXJDt7JrS/VZIpxtAi4iUlo
         02fFA+7lBX87Fq4nCf+WLpKri0bZUrkWnHDNCm4ge9Or1P7il+PUscmzQsTnz37Sav1G
         BCcHzHM/7a10r05TrWqBgmCN/SGpQbpZUuJqfgdhlt1dyXAePW8MkeXC8/wGfHKbVh2+
         VZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619320; x=1785224120;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pJYszYNZpB6+D7pDZToiKE09TTgTGymFuxDbH25RBnc=;
        b=i12gTWlYaIm44gaFpGDL46CLSZx7xmVMDRxf+H6IdN9V4B7+H2B5YnhWN+HCPIEsPL
         VFl5aMkQ5CGZ/lPYNeahqrKAzzLaSVEz5wT0vMUcj5R1tKa+ouCmYCJxtm/Ilv28EHCY
         G1/XiU2rK0vAYCD99y2XTN1X3i9T8NbY3y9OubGKIZTKm4ZCTULxC6Pgt3ayk+QzE0SN
         zMfhCvlQ34KOW0iX6cSXkYAGnthEyFV7T3O1XkOpg1lwjIhbBzcFxY3UM6V6AutiPvWe
         9MuBrOdIQs30Qq0MG1PgWUpH5M5zDuHRx8Rfboyi8pVNoC7dagYg6okcoynpAziJuFu5
         kHIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3n/O3ajHknhLomeSjnadk4FHH2SCd76qiKTa/V0b+BGa83oJ/jntI4QtXrWthRpJce6ad1QQWxyOudu14Su3f@lists.infradead.org
X-Gm-Message-State: AOJu0YxhVpIebHeM519HH6NEI0HGQgy9DbrnsgRpKGG9LERJ3YLtMvWL
	f/Msp01ec9ynx8P6EbDkY/ojHBSddNcSPIGnp95zwPD54Ph/w6/Z2ck67rSorTpd0gw=
X-Gm-Gg: AfdE7cmhBnQkQjt4U9UU3rKilDLiY3RQNEhyUacFFSJX5I7UXksvuEChBFN+ZW91bel
	ePYeCZMeiGX+Z9i/Tnqx2Kzp67dvIrlkUITVLcItkSuDj3gfY8aBjNRzFHim0DaqP+mc0IHP+Hh
	qhchT1FWOFsnjx9uHf+ye6Q8VYxHe/Lb/1ZuFPRUm/vFUMuMcihkPXP3Fj0FeUNZE4smrS3vNor
	Zlfr0AHZCdYBrDFslH32m3RzsrS76n/f6rKoGi+t7KBvwORq0iLY24BRC6eR2rxlfcChIJ2jPpA
	QjaaF7hRZya95gO9+g6wejx18SVxBU1En71hldtd+b36J+/IQzmCW4VUUB4CpFFnKRKM/K4m/cF
	imH1u1TBXewb/iQwFYGbswiWaGxxumjA0GML7VIB5Q1V+AE3JnJXnZGpneTMf81LWPf4sWrZqnN
	x2H/UuC24n26M=
X-Received: by 2002:a05:600c:1d1e:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4954a3d0cc7mr179740075e9.2.1784619320482;
        Tue, 21 Jul 2026 00:35:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3b11:1fce:47ee:c5bf])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e49500sm38917415f8f.2.2026.07.21.00.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:35:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Takashi Iwai <tiwai@suse.com>,
  linux-arm-kernel@lists.infradead.org,  linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card: use priv instead of card
 on each functions
In-Reply-To: <87se5di0n8.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Tue, 21 Jul 2026 01:36:59 +0000")
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
	<87se5di0n8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 21 Jul 2026 09:35:18 +0200
Message-ID: <1jfr1ceqx5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_003522_593975_8FE59F8D 
X-CRM114-Status: GOOD (  25.15  )
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

On mar. 21 juil. 2026 at 01:36, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> We can get card via priv->card, use priv for function param.
> No functional change, but is preparation for Card capsuling.

The change is simple but it will make more complex to backport fix an
older kernel once this fix is applied. So again, getting more context to
understand what you are trying to accomplish and why it needs a standard
card variable name would help.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/meson/axg-card.c         | 63 ++++++++++++++++--------------
>  sound/soc/meson/gx-card.c          | 23 +++++------
>  sound/soc/meson/meson-card-utils.c | 58 ++++++++++++++-------------
>  sound/soc/meson/meson-card.h       | 11 +++---
>  4 files changed, 82 insertions(+), 73 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index b4dca80e15e40..3d345dc33cb6f 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -100,28 +100,28 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
>  	return 0;
>  }
>  
> -static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
> +static int axg_card_add_tdm_loopback(struct meson_card *priv,
>  				     int *index)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai_link *pad;
>  	struct snd_soc_dai_link *lb;
>  	struct snd_soc_dai_link_component *dlc;
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
>  	/* extend links */
> -	ret = meson_card_reallocate_links(card, card->num_links + 1);
> +	ret = meson_card_reallocate_links(priv, priv->card.num_links + 1);
>  	if (ret)
>  		return ret;
>  
> -	pad = &card->dai_link[*index];
> -	lb = &card->dai_link[*index + 1];
> +	pad = &priv->card.dai_link[*index];
> +	lb = &priv->card.dai_link[*index + 1];
>  
> -	lb->name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-lb", pad->name);
> +	lb->name = devm_kasprintf(dev, GFP_KERNEL, "%s-lb", pad->name);
>  	if (!lb->name)
>  		return -ENOMEM;
>  
> -	dlc = devm_kzalloc(card->dev, sizeof(*dlc), GFP_KERNEL);
> +	dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
>  	if (!dlc)
>  		return -ENOMEM;
>  
> @@ -153,18 +153,19 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  	return 0;
>  }
>  
> -static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
> +static int axg_card_parse_cpu_tdm_slots(struct meson_card *priv,
>  					struct snd_soc_dai_link *link,
>  					struct device_node *node,
>  					struct axg_dai_link_tdm_data *be)
>  {
> +	struct device *dev = priv->card.dev;
>  	char propname[32];
>  	u32 tx, rx;
>  	int i;
>  
> -	be->tx_mask = devm_kcalloc(card->dev, AXG_TDM_NUM_LANES,
> +	be->tx_mask = devm_kcalloc(dev, AXG_TDM_NUM_LANES,
>  				   sizeof(*be->tx_mask), GFP_KERNEL);
> -	be->rx_mask = devm_kcalloc(card->dev, AXG_TDM_NUM_LANES,
> +	be->rx_mask = devm_kcalloc(dev, AXG_TDM_NUM_LANES,
>  				   sizeof(*be->rx_mask), GFP_KERNEL);
>  	if (!be->tx_mask || !be->rx_mask)
>  		return -ENOMEM;
> @@ -191,7 +192,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* ... but the interface should at least have one direction */
>  	if (!tx && !rx) {
> -		dev_err(card->dev, "tdm link has no cpu slots\n");
> +		dev_err(dev, "tdm link has no cpu slots\n");
>  		return -EINVAL;
>  	}
>  
> @@ -207,7 +208,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  		 * Error if the slots can't accommodate the largest mask or
>  		 * if it is just too big
>  		 */
> -		dev_err(card->dev, "bad slot number\n");
> +		dev_err(dev, "bad slot number\n");
>  		return -EINVAL;
>  	}
>  
> @@ -216,14 +217,15 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  	return 0;
>  }
>  
> -static int axg_card_parse_codecs_masks(struct snd_soc_card *card,
> +static int axg_card_parse_codecs_masks(struct meson_card *priv,
>  				       struct snd_soc_dai_link *link,
>  				       struct device_node *node,
>  				       struct axg_dai_link_tdm_data *be)
>  {
>  	struct axg_dai_link_tdm_mask *codec_mask;
> +	struct device *dev = priv->card.dev;
>  
> -	codec_mask = devm_kcalloc(card->dev, link->num_codecs,
> +	codec_mask = devm_kcalloc(dev, link->num_codecs,
>  				  sizeof(*codec_mask), GFP_KERNEL);
>  	if (!codec_mask)
>  		return -ENOMEM;
> @@ -242,17 +244,17 @@ static int axg_card_parse_codecs_masks(struct snd_soc_card *card,
>  	return 0;
>  }
>  
> -static int axg_card_parse_tdm(struct snd_soc_card *card,
> +static int axg_card_parse_tdm(struct meson_card *priv,
>  			      struct device_node *node,
>  			      int *index)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
> -	struct snd_soc_dai_link *link = &card->dai_link[*index];
> +	struct snd_soc_dai_link *link = &priv->card.dai_link[*index];
>  	struct axg_dai_link_tdm_data *be;
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
>  	/* Allocate tdm link parameters */
> -	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
> +	be = devm_kzalloc(dev, sizeof(*be), GFP_KERNEL);
>  	if (!be)
>  		return -ENOMEM;
>  	priv->link_data[*index] = be;
> @@ -264,19 +266,19 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
>  
>  	of_property_read_u32(node, "mclk-fs", &be->mclk_fs);
>  
> -	ret = axg_card_parse_cpu_tdm_slots(card, link, node, be);
> +	ret = axg_card_parse_cpu_tdm_slots(priv, link, node, be);
>  	if (ret) {
> -		dev_err(card->dev, "error parsing tdm link slots\n");
> +		dev_err(dev, "error parsing tdm link slots\n");
>  		return ret;
>  	}
>  
> -	ret = axg_card_parse_codecs_masks(card, link, node, be);
> +	ret = axg_card_parse_codecs_masks(priv, link, node, be);
>  	if (ret)
>  		return ret;
>  
>  	/* Add loopback if the pad dai has playback */
>  	if (!link->capture_only) {
> -		ret = axg_card_add_tdm_loopback(card, index);
> +		ret = axg_card_add_tdm_loopback(priv, index);
>  		if (ret)
>  			return ret;
>  	}
> @@ -305,14 +307,15 @@ static int axg_card_cpu_is_codec(struct device_node *np)
>  		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
>  }
>  
> -static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
> +static int axg_card_add_link(struct meson_card *priv, struct device_node *np,
>  			     int *index)
>  {
> -	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
> +	struct snd_soc_dai_link *dai_link = &priv->card.dai_link[*index];
>  	struct snd_soc_dai_link_component *cpu;
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
> -	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
> +	cpu = devm_kzalloc(dev, sizeof(*cpu), GFP_KERNEL);
>  	if (!cpu)
>  		return -ENOMEM;
>  
> @@ -320,17 +323,17 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
>  	dai_link->num_cpus = 1;
>  	dai_link->nonatomic = true;
>  
> -	ret = meson_card_parse_dai(card, np, dai_link->cpus);
> +	ret = meson_card_parse_dai(priv, np, dai_link->cpus);
>  	if (ret)
>  		return ret;
>  
>  	if (axg_card_cpu_is_playback_fe(dai_link->cpus->of_node))
> -		return meson_card_set_fe_link(card, dai_link, np, true);
> +		return meson_card_set_fe_link(priv, dai_link, np, true);
>  	else if (axg_card_cpu_is_capture_fe(dai_link->cpus->of_node))
> -		return meson_card_set_fe_link(card, dai_link, np, false);
> +		return meson_card_set_fe_link(priv, dai_link, np, false);
>  
>  
> -	ret = meson_card_set_be_link(card, dai_link, np);
> +	ret = meson_card_set_be_link(priv, dai_link, np);
>  	if (ret)
>  		return ret;
>  
> @@ -340,7 +343,7 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
>  	} else {
>  		dai_link->no_pcm = 1;
>  		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
> -			ret = axg_card_parse_tdm(card, np, index);
> +			ret = axg_card_parse_tdm(priv, np, index);
>  	}
>  
>  	return ret;
> diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
> index b408cc2bbc919..c0cbf31f28db5 100644
> --- a/sound/soc/meson/gx-card.c
> +++ b/sound/soc/meson/gx-card.c
> @@ -41,16 +41,16 @@ static const struct snd_soc_ops gx_card_i2s_be_ops = {
>  	.hw_params = gx_card_i2s_be_hw_params,
>  };
>  
> -static int gx_card_parse_i2s(struct snd_soc_card *card,
> +static int gx_card_parse_i2s(struct meson_card *priv,
>  			     struct device_node *node,
>  			     int *index)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
> -	struct snd_soc_dai_link *link = &card->dai_link[*index];
> +	struct snd_soc_dai_link *link = &priv->card.dai_link[*index];
>  	struct gx_dai_link_i2s_data *be;
> +	struct device *dev = priv->card.dev;
>  
>  	/* Allocate i2s link parameters */
> -	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
> +	be = devm_kzalloc(dev, sizeof(*be), GFP_KERNEL);
>  	if (!be)
>  		return -ENOMEM;
>  	priv->link_data[*index] = be;
> @@ -76,28 +76,29 @@ static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
>  	return 0;
>  }
>  
> -static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
> +static int gx_card_add_link(struct meson_card *priv, struct device_node *np,
>  			    int *index)
>  {
> -	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
> +	struct snd_soc_dai_link *dai_link = &priv->card.dai_link[*index];
>  	struct snd_soc_dai_link_component *cpu;
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
> -	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
> +	cpu = devm_kzalloc(dev, sizeof(*cpu), GFP_KERNEL);
>  	if (!cpu)
>  		return -ENOMEM;
>  
>  	dai_link->cpus = cpu;
>  	dai_link->num_cpus = 1;
>  
> -	ret = meson_card_parse_dai(card, np, dai_link->cpus);
> +	ret = meson_card_parse_dai(priv, np, dai_link->cpus);
>  	if (ret)
>  		return ret;
>  
>  	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
> -		return  meson_card_set_fe_link(card, dai_link, np, true);
> +		return  meson_card_set_fe_link(priv, dai_link, np, true);
>  
> -	ret = meson_card_set_be_link(card, dai_link, np);
> +	ret = meson_card_set_be_link(priv, dai_link, np);
>  	if (ret)
>  		return ret;
>  
> @@ -109,7 +110,7 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
>  		dai_link->no_pcm = 1;
>  		/* Check if the cpu is the i2s encoder and parse i2s data */
>  		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
> -			ret = gx_card_parse_i2s(card, np, index);
> +			ret = gx_card_parse_i2s(priv, np, index);
>  	}
>  
>  	return ret;
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index d144ab79b645b..7329711aefa56 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -39,10 +39,9 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
>  }
>  EXPORT_SYMBOL_GPL(meson_card_i2s_set_sysclk);
>  
> -int meson_card_reallocate_links(struct snd_soc_card *card,
> +int meson_card_reallocate_links(struct meson_card *priv,
>  				unsigned int num_links)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai_link *links;
>  	void **ldata;
>  
> @@ -67,10 +66,11 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>  }
>  EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
>  
> -int meson_card_parse_dai(struct snd_soc_card *card,
> +int meson_card_parse_dai(struct meson_card *priv,
>  			 struct device_node *node,
>  			 struct snd_soc_dai_link_component *dlc)
>  {
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
>  	if (!dlc || !node)
> @@ -78,18 +78,19 @@ int meson_card_parse_dai(struct snd_soc_card *card,
>  
>  	ret = snd_soc_of_get_dlc(node, NULL, dlc, 0);
>  	if (ret)
> -		return dev_err_probe(card->dev, ret, "can't parse dai\n");
> +		return dev_err_probe(dev, ret, "can't parse dai\n");
>  
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(meson_card_parse_dai);
>  
> -static int meson_card_set_link_name(struct snd_soc_card *card,
> +static int meson_card_set_link_name(struct meson_card *priv,
>  				    struct snd_soc_dai_link *link,
>  				    struct device_node *node,
>  				    const char *prefix)
>  {
> -	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
> +	struct device *dev = priv->card.dev;
> +	char *name = devm_kasprintf(dev, GFP_KERNEL, "%s.%s",
>  				    prefix, node->full_name);
>  	if (!name)
>  		return -ENOMEM;
> @@ -127,21 +128,22 @@ unsigned int meson_card_parse_daifmt(struct device_node *node,
>  }
>  EXPORT_SYMBOL_GPL(meson_card_parse_daifmt);
>  
> -int meson_card_set_be_link(struct snd_soc_card *card,
> +int meson_card_set_be_link(struct meson_card *priv,
>  			   struct snd_soc_dai_link *link,
>  			   struct device_node *node)
>  {
>  	struct snd_soc_dai_link_component *codec;
> +	struct device *dev = priv->card.dev;
>  	int ret, num_codecs;
>  
>  	num_codecs = of_get_child_count(node);
>  	if (!num_codecs) {
> -		dev_err(card->dev, "be link %s has no codec\n",
> +		dev_err(dev, "be link %s has no codec\n",
>  			node->full_name);
>  		return -EINVAL;
>  	}
>  
> -	codec = devm_kcalloc(card->dev, num_codecs, sizeof(*codec), GFP_KERNEL);
> +	codec = devm_kcalloc(dev, num_codecs, sizeof(*codec), GFP_KERNEL);
>  	if (!codec)
>  		return -ENOMEM;
>  
> @@ -149,22 +151,22 @@ int meson_card_set_be_link(struct snd_soc_card *card,
>  	link->num_codecs = num_codecs;
>  
>  	for_each_child_of_node_scoped(node, np) {
> -		ret = meson_card_parse_dai(card, np, codec);
> +		ret = meson_card_parse_dai(priv, np, codec);
>  		if (ret)
>  			return ret;
>  
>  		codec++;
>  	}
>  
> -	ret = meson_card_set_link_name(card, link, node, "be");
> +	ret = meson_card_set_link_name(priv, link, node, "be");
>  	if (ret)
> -		dev_err(card->dev, "error setting %pOFn link name\n", node);
> +		dev_err(dev, "error setting %pOFn link name\n", node);
>  
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(meson_card_set_be_link);
>  
> -int meson_card_set_fe_link(struct snd_soc_card *card,
> +int meson_card_set_fe_link(struct meson_card *priv,
>  			   struct snd_soc_dai_link *link,
>  			   struct device_node *node,
>  			   bool is_playback)
> @@ -182,29 +184,29 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
>  	else
>  		link->capture_only = 1;
>  
> -	return meson_card_set_link_name(card, link, node, "fe");
> +	return meson_card_set_link_name(priv, link, node, "fe");
>  }
>  EXPORT_SYMBOL_GPL(meson_card_set_fe_link);
>  
> -static int meson_card_add_links(struct snd_soc_card *card)
> +static int meson_card_add_links(struct meson_card *priv)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
> -	struct device_node *node = card->dev->of_node;
> +	struct device *dev = priv->card.dev;
> +	struct device_node *node = dev->of_node;
>  	int num, i, ret;
>  
>  	num = of_get_child_count(node);
>  	if (!num) {
> -		dev_err(card->dev, "card has no links\n");
> +		dev_err(dev, "card has no links\n");
>  		return -EINVAL;
>  	}
>  
> -	ret = meson_card_reallocate_links(card, num);
> +	ret = meson_card_reallocate_links(priv, num);
>  	if (ret)
>  		return ret;
>  
>  	i = 0;
>  	for_each_child_of_node_scoped(node, np) {
> -		ret = priv->match_data->add_link(card, np, &i);
> +		ret = priv->match_data->add_link(priv, np, &i);
>  		if (ret)
>  			return ret;
>  
> @@ -214,17 +216,19 @@ static int meson_card_add_links(struct snd_soc_card *card)
>  	return 0;
>  }
>  
> -static int meson_card_parse_of_optional(struct snd_soc_card *card,
> +static int meson_card_parse_of_optional(struct meson_card *priv,
>  					const char *propname,
>  					int (*func)(struct snd_soc_card *c,
>  						    const char *p))
>  {
> +	struct device *dev = priv->card.dev;
> +
>  	/* If property is not provided, don't fail ... */
> -	if (!of_property_present(card->dev->of_node, propname))
> +	if (!of_property_present(dev->of_node, propname))
>  		return 0;
>  
>  	/* ... but do fail if it is provided and the parsing fails */
> -	return func(card, propname);
> +	return func(&priv->card, propname);
>  }
>  
>  static void meson_card_clean_references(struct meson_card *priv)
> @@ -282,25 +286,25 @@ int meson_card_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = meson_card_parse_of_optional(&priv->card, "audio-routing",
> +	ret = meson_card_parse_of_optional(priv, "audio-routing",
>  					   snd_soc_of_parse_audio_routing);
>  	if (ret) {
>  		dev_err(dev, "error while parsing routing\n");
>  		return ret;
>  	}
>  
> -	ret = meson_card_parse_of_optional(&priv->card, "audio-widgets",
> +	ret = meson_card_parse_of_optional(priv, "audio-widgets",
>  					   snd_soc_of_parse_audio_simple_widgets);
>  	if (ret) {
>  		dev_err(dev, "error while parsing widgets\n");
>  		return ret;
>  	}
>  
> -	ret = meson_card_add_links(&priv->card);
> +	ret = meson_card_add_links(priv);
>  	if (ret)
>  		goto out_err;
>  
> -	ret = meson_card_parse_of_optional(&priv->card, "audio-aux-devs",
> +	ret = meson_card_parse_of_optional(priv, "audio-aux-devs",
>  					   snd_soc_of_parse_aux_devs);
>  	if (ret)
>  		goto out_err;
> diff --git a/sound/soc/meson/meson-card.h b/sound/soc/meson/meson-card.h
> index a0d693e4f4608..ce8d9042793bb 100644
> --- a/sound/soc/meson/meson-card.h
> +++ b/sound/soc/meson/meson-card.h
> @@ -16,8 +16,9 @@ struct snd_pcm_hw_params;
>  
>  #define DT_PREFIX "amlogic,"
>  
> +struct meson_card;
>  struct meson_card_match_data {
> -	int (*add_link)(struct snd_soc_card *card,
> +	int (*add_link)(struct meson_card *priv,
>  			struct device_node *node,
>  			int *index);
>  };
> @@ -35,15 +36,15 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
>  			      struct snd_pcm_hw_params *params,
>  			      unsigned int mclk_fs);
>  
> -int meson_card_reallocate_links(struct snd_soc_card *card,
> +int meson_card_reallocate_links(struct meson_card *priv,
>  				unsigned int num_links);
> -int meson_card_parse_dai(struct snd_soc_card *card,
> +int meson_card_parse_dai(struct meson_card *priv,
>  			 struct device_node *node,
>  			 struct snd_soc_dai_link_component *dlc);
> -int meson_card_set_be_link(struct snd_soc_card *card,
> +int meson_card_set_be_link(struct meson_card *priv,
>  			   struct snd_soc_dai_link *link,
>  			   struct device_node *node);
> -int meson_card_set_fe_link(struct snd_soc_card *card,
> +int meson_card_set_fe_link(struct meson_card *priv,
>  			   struct snd_soc_dai_link *link,
>  			   struct device_node *node,
>  			   bool is_playback);

-- 
Jerome

