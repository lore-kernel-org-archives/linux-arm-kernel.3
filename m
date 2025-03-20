Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91739C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbavaFaCey5fCxqHihEAYJAARNaKmfsH3h/ywBVxX1c=; b=mjKpN104sJrhC6j+iaFO0nJpAU
	6xDuWAnbDxp23oibnBelmm46HOWhMezJnykWOOfos8ZgjNzXxXV8AWJp707KNtsFGlbk2lqAKaO70
	5ZUnhpG7POHxNO84p1PcFaLT3x5kJMsIvRNT+YOZooc+cbfpC29GyMYzUkGttZW2D+BMrgl77xMp/
	m9ub+WaZ1WocxbOZdh/3ff7qmEXCM1bzZTshlvgLvRGbSijQi30d18Z037v1GiFIkknIMLirzKHhJ
	qh9donyA3A43bWVXZqik9X0CARyQKIBMAtBuTGJyCOP3yw1/MUrCIPvcaIev5MASsiKmTZJ/OXiFM
	4i0gVchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAir-0000000BSro-3MSy;
	Thu, 20 Mar 2025 07:53:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAhA-0000000BSgT-2mDi;
	Thu, 20 Mar 2025 07:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A9925C1971;
	Thu, 20 Mar 2025 07:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BF1C4CEDD;
	Thu, 20 Mar 2025 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742457123;
	bh=LpoG0RMzz7fNHCibF4J26zt4F7k2qKpDYABHIjcJWbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1EsmT+ZyuwER8PWWk+8VDDwn8MyxNR6/58Yh9KcqoPWHygFa/vTkGMHxde8NiRUb
	 UEgLZha98wOIWOlHM1c9b0JfY8TjZJxHZdVb/vcOtv4/lqWhFwtPJ4lW+E2C5YNFRz
	 WwrnZs00mOeqq3tzeFe8b/MbnKPCw2IjHvm75OB+AHk8YyCADbVzMRANLeZC0sTUOF
	 M7NElBp8F+z6n+H62jVYZ5bWrgl9cajxXzcFkjVEK+rdbM+NaL35GkbP4s8XbEjotz
	 GyTHa9bfjgoG7m+Oe46opYoDUPX1LuQ14MAxukVc7/urZ5SA+Dr55j/CYVpCjUhE6W
	 twqrKspucBoUQ==
Date: Thu, 20 Mar 2025 08:52:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "hailong.fan" <hailong.fan@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Jjian.Zhou@mediatek.com, Xiangzhi.Tang@mediatek.com
Subject: Re: [PATCH 1/2] ASoC: SOF: MediaTek: Add mt8196 hardware support
Message-ID: <20250320-cocky-adventurous-rooster-be2abd@krzk-bin>
References: <20250320031753.13669-1-hailong.fan@mediatek.com>
 <20250320031753.13669-2-hailong.fan@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320031753.13669-2-hailong.fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_005204_785991_9872E9F2 
X-CRM114-Status: GOOD (  17.43  )
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

On Thu, Mar 20, 2025 at 11:17:24AM +0800, hailong.fan wrote:
> +
> +void mt8196_sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
> +{
> +	/* set RUNSTALL to stop core */
> +	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_RUNSTALL,
> +				RUNSTALL, RUNSTALL);
> +
> +	/* assert core reset */
> +	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_CFGREG_SW_RSTN,
> +				SW_RSTN_C0 | SW_DBG_RSTN_C0,
> +				SW_RSTN_C0 | SW_DBG_RSTN_C0);
> +}
> +

Drop stray blank line.

> diff --git a/sound/soc/sof/mediatek/mt8196/mt8196.c b/sound/soc/sof/mediatek/mt8196/mt8196.c
> new file mode 100644
> index 000000000000..364069ce9954
> --- /dev/null
> +++ b/sound/soc/sof/mediatek/mt8196/mt8196.c
> @@ -0,0 +1,650 @@
> +// SPDX-License-Identifier: GPL-2.0

Look here

> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Hailong Fan <hailong.fan@mediatek.com>
> + */

...

> +
> +static const struct of_device_id sof_of_mt8196_ids[] = {
> +	{ .compatible = "mediatek,mt8196-dsp", .data = &sof_of_mt8196_desc},

Bindings are before users.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sof_of_mt8196_ids);
> +
> +/* DT driver definition */
> +static struct platform_driver snd_sof_of_mt8196_driver = {
> +	.probe = sof_of_probe,
> +	.remove = sof_of_remove,
> +	.shutdown = sof_of_shutdown,
> +	.driver = {
> +	.name = "sof-audio-of-mt8196",
> +		.pm = &sof_of_pm,
> +		.of_match_table = sof_of_mt8196_ids,
> +	},
> +};
> +module_platform_driver(snd_sof_of_mt8196_driver);
> +
> +MODULE_LICENSE("Dual BSD/GPL");

And here Hm? Don't fake the licensing.

> +MODULE_DESCRIPTION("SOF support for MT8196 platforms");
> +MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");

Is this correct?


Best regards,
Krzysztof


