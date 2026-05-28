Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2D3CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMV6j6rdftMYrCa246/VoP2eFZssccmZihsUZSMoFYw=; b=4rmXMXLKPgS5gpKEqGaCTVHR86
	h5mW7T3bjgk5LMy+YtcFyjfCkm7vOMoIMyoH+l3pRTN1NFu2H8IldmtVnjurP2yEtpfgDAaJrlxDv
	r+gz+wlBnhsAHZBKnDjUnTcrRDuWDtRzP8C6PB0cXmRg+I8YoyZaL90Z2KG5F9ffyQagOkFBAhglS
	gGtOTgS3m9l4BZB812+0yuQToxG5bmEosISoEQbhxPl73wYQkyR7e/ryi4FUHoQb34cy/XRWDpdJW
	f/aMXleCS6jjRKIbN3ThQDNkGkMw9VJsrHOWKiWt0ywIljEuPW7ObNBuFf2Eocfd+330c334TpYlG
	QuMKBB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSV19-00000005FcU-3wal;
	Thu, 28 May 2026 07:18:59 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSV17-00000005Fc8-0D2u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 07:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779952737; x=1811488737;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=ExiRI/IK4e+EYS8oihOPYXzGCoKR9O424u8K93oHFF8=;
  b=lzihApbJG4u6huuI/jrTdLeFp0gIk1slNDrUU+l+ikBUccb6v3CPaSKK
   J3I5yeMtz5xAcdssn/i0Zw4TL3ufityX12nasega/FhQxrVwItPX1sqOB
   dFNxUgNl8yfONoYH4tLzPJDRpyarp+utORIMLMPODCLaxMmOJMsROueLb
   IEACjyrBjTc4WlaEvgLzhX/9Xgf0AYPsnrjg96wfEGa1zIcFq6pT/gimf
   6U4hTVhWJnuE4POUKQ3VEel8wm4p4j3yOpki6Bj3n7o8dV89yYZa6VptD
   YmLc7RUFBw8H3PNs2XKnfovZgH7VuKpGs40jSwp/9aY9w6q43WyYM05AF
   A==;
X-CSE-ConnectionGUID: FIIWwVi3TbCCzWylNFJQVw==
X-CSE-MsgGUID: It4iwXzxSo2z9I/+sSNBlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80515949"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80515949"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 00:18:56 -0700
X-CSE-ConnectionGUID: CQUH3NxETnKiaxkGsE55JQ==
X-CSE-MsgGUID: sAUS0hOlR9C6RNSKPRkAJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="246743665"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.29]) ([10.245.246.29])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 00:18:52 -0700
Message-ID: <5f584713-10fa-4e23-b5ce-a64d9f808665@linux.intel.com>
Date: Thu, 28 May 2026 10:19:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: soc-card: add snd_soc_card_set_topology_name()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org
References: <878q942wce.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <878q942wce.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_001857_134882_35620D49 
X-CRM114-Status: GOOD (  24.53  )
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



On 28/05/2026 03:48, Kuninori Morimoto wrote:
> Some drivers want to use topology name, but currently each drivers are
> setting it by own method.
> This patch adds new snd_soc_card_set_topology_name() and do it by
> same method.
> 
> Almost all driver doesn't set topology name, let's remove fixed name
> array, and use devm_kasprintf() instead.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 	- snd_soc_card_set_topology_name() checks prefix, too
> 
>  include/sound/soc-card.h                        |  2 ++
>  include/sound/soc.h                             |  3 +--
>  .../soc/mediatek/common/mtk-soundcard-driver.c  |  7 ++-----
>  sound/soc/soc-card.c                            | 13 +++++++++++++
>  sound/soc/soc-core.c                            | 17 +----------------
>  sound/soc/sof/nocodec.c                         |  4 ++--
>  6 files changed, 21 insertions(+), 25 deletions(-)
> 
> diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
> index ecc02e955279f..1f1e7d45f5533 100644
> --- a/include/sound/soc-card.h
> +++ b/include/sound/soc-card.h
> @@ -47,6 +47,8 @@ int snd_soc_card_late_probe(struct snd_soc_card *card);
>  void snd_soc_card_fixup_controls(struct snd_soc_card *card);
>  int snd_soc_card_remove(struct snd_soc_card *card);
>  
> +void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
> +
>  int snd_soc_card_set_bias_level(struct snd_soc_card *card,
>  				struct snd_soc_dapm_context *dapm,
>  				enum snd_soc_bias_level level);
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 8681dd3f4252f..10ad80f930c2e 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -987,7 +987,7 @@ struct snd_soc_card {
>  	bool pci_subsystem_set;
>  #endif /* CONFIG_PCI */
>  
> -	char topology_shortname[32];
> +	char *topology_shortname;
>  
>  	struct device *dev;
>  	struct snd_card *snd_card;
> @@ -1084,7 +1084,6 @@ struct snd_soc_card {
>  #endif
>  	/* bit field */
>  	unsigned int instantiated:1;
> -	unsigned int topology_shortname_created:1;
>  	unsigned int fully_routed:1;
>  	unsigned int probed:1;
>  	unsigned int component_chaining:1;
> diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> index a2a30a87a359f..cdff7322426a9 100644
> --- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
> +++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> @@ -289,11 +289,8 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
>  		soc_card_data->sof_priv = pdata->sof_priv;
>  		card->probe = mtk_sof_card_probe;
>  		card->late_probe = mtk_sof_card_late_probe;
> -		if (!card->topology_shortname_created) {
> -			snprintf(card->topology_shortname, 32, "sof-%s", card->name);
> -			card->topology_shortname_created = true;
> -		}
> -		card->name = card->topology_shortname;
> +
> +		snd_soc_card_set_topology_name(card, "sof");
>  	}
>  
>  	/*
> diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
> index 235427d690617..282d666dae9ec 100644
> --- a/sound/soc/soc-card.c
> +++ b/sound/soc/soc-card.c
> @@ -246,3 +246,16 @@ void snd_soc_card_remove_dai_link(struct snd_soc_card *card,
>  		card->remove_dai_link(card, dai_link);
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_card_remove_dai_link);
> +
> +void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *prefix)
> +{
> +	if (!prefix || !card->name)
> +		return;
> +
> +	if (!card->topology_shortname)
> +		card->topology_shortname = devm_kasprintf(card->dev, GFP_KERNEL,
> +							  "%s-%s", prefix, card->name);
> +
> +	card->name = card->topology_shortname;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_card_set_topology_name);
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 55130eea04544..e96dd4a3f46c7 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1990,7 +1990,6 @@ static inline int snd_soc_set_dmi_name(struct snd_soc_card *card)
>  static void soc_check_tplg_fes(struct snd_soc_card *card)
>  {
>  	struct snd_soc_component *component;
> -	const struct snd_soc_component_driver *comp_drv;
>  	struct snd_soc_dai_link *dai_link;
>  	int i;
>  
> @@ -2051,21 +2050,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
>  		}
>  
>  		/* Inform userspace we are using alternate topology */
> -		if (component->driver->topology_name_prefix) {
> -
> -			/* topology shortname created? */
> -			if (!card->topology_shortname_created) {
> -				comp_drv = component->driver;
> -
> -				snprintf(card->topology_shortname, 32, "%s-%s",
> -					 comp_drv->topology_name_prefix,
> -					 card->name);
> -				card->topology_shortname_created = true;
> -			}
> -
> -			/* use topology shortname */
> -			card->name = card->topology_shortname;
> -		}
> +		snd_soc_card_set_topology_name(card, component->driver->topology_name_prefix);
>  	}
>  }
>  
> diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
> index c0c906a78ebae..11a95dba3c9cf 100644
> --- a/sound/soc/sof/nocodec.c
> +++ b/sound/soc/sof/nocodec.c
> @@ -15,7 +15,6 @@
>  
>  static struct snd_soc_card sof_nocodec_card = {
>  	.name = "nocodec", /* the sof- prefix is added by the core */
> -	.topology_shortname = "sof-nocodec",
>  	.owner = THIS_MODULE
>  };
>  
> @@ -89,9 +88,10 @@ static int sof_nocodec_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	card->dev = &pdev->dev;
> -	card->topology_shortname_created = true;
>  	mach = pdev->dev.platform_data;
>  
> +	snd_soc_card_set_topology_name(card, "sof");
> +
>  	ret = sof_nocodec_setup(card->dev, mach->mach_params.num_dai_drivers,
>  				mach->mach_params.dai_drivers);
>  	if (ret < 0)

-- 
Péter


