Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D305C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amUCRKAsD4Gxaeqv0xybOj88/Vakw7xMA79ZYbnTllU=; b=G0ap5989Uf4fdCW4UrKZrqHKZL
	eoxycTy48aHF/Ej27bK+Bb/pGQ8BNNqWIDsqSqENmE/OCzYB+HHi64CuTLdq7GjOQQWuxT2oJSNgr
	FlNjs8Sdpe9UQAOKejeWO5yCPk9KdQ3fEpVcjv/cR4ZtV2ZMvcAdypb2+zhqtXwGM3vsdJn4va0OR
	lIh+54opdZTpXyF1PE+IuuujAF/gFYge/xtvuw9OIuYzACXu5MsVJFetRAjY5gHNyCsRH1gJuwG29
	ZiujTWYVLZ0PKyuGYVfrdtOJPvbtNLrSJAAKPKjQ7U4wRr/fPCq/1YbBt4hy4sg1mKLFMUzMDS3XC
	uB4Orxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OV6-00000005c8K-3bD4;
	Tue, 15 Sep 2026 08:26:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OV4-00000005c7s-1Oa0;
	Tue, 15 Sep 2026 08:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789460802;
	bh=Mcxm2eZBaUSab7V2BxURMy56qBJEYr7x6oE4KD5VWB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QSLAnEuwULHu0mfV2zcgoR8yvQQUWiQK2L+deDnun03gaXkSAnr8/04QFcC70z5AM
	 IwXH/ydw/MjUfqWSKSzYjmI/qRPTUkBoj6Lw7heRJNZPk9uSM2sUUjIT3A78DzQuJj
	 rhNQJ9HU/cQd1ettpY8dMzYPslS+qOSVzsBsuDy+WmjMsDXAOjy8YES+DxA5V9XvBT
	 Mb/WX9a6MVvzOcTZMBqGdmw5okTpuW2jqsaPsRDRNP0Q2J9UX4XOSPXwRPHL7EfJpr
	 RpQ6yOss/bCSf9srn4HKEJhkf9sChdoS2f0L2PjQhdAiCnxI4lmsAifgVrP3SfqjpN
	 44gKhJn07n8Hg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29FF217E07DB;
	Tue, 15 Sep 2026 10:26:41 +0200 (CEST)
Message-ID: <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
Date: Tue, 15 Sep 2026 10:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume
 errors
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
 <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
 <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_012646_524616_625C33AC 
X-CRM114-Status: GOOD (  17.00  )
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

On 9/15/26 10:23, Bui Duc Phuc wrote:
> Hi Angelo,
> 
> 
>>>
>>> In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
>>> correctly checked for error as in, if any, probe will fail.
>>>
>>> So... during suspend or resume or anywhere else in this driver really, the regmap
>>> pointer can't be NULL.
>>> The right thing to do here would be to just remove the useless check.
>>>
>>> Mind you, this comment applies to some other commits in this series as well.
>>>
> 
> I found something interesting:
> 
> in mt8189_afe_pcm_dev_probe()
> 
> -------------------------------------
> afe->runtime_resume = mt8189_afe_runtime_resume;
> afe->runtime_suspend = mt8189_afe_runtime_suspend;
> 
> ret = devm_pm_runtime_enable(dev);
> if (ret)
> return ret;
> 
> /*
> * Audio device is part of genpd. Registering it as a syscore device
> * ensure the proper power-on sequence of the AFE device.
> */
> dev_pm_syscore_device(dev, true);
> 
> /* enable clock for regcache get default value from hw */
> ret = pm_runtime_resume_and_get(dev);
> if (ret)
> return dev_err_probe(dev, ret, "failed to resume device\n");
> 
> afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
>     &mt8189_afe_regmap_config);
> if (IS_ERR(afe->regmap)) {
> ret = PTR_ERR(afe->regmap);
> goto err_pm_put;
> }
> -----------------------------------------------
> 
> Here, it looks like mt8189_afe_runtime_resume() gets called
> before devm_regmap_init_mmio().
> 
> So if we remove this part:
> ---------------------
> if (!afe->regmap) {
>          dev_warn(afe->dev, "skip regmap\n");
>          return 0;
>      }
> -----------------------
> from mt8189_afe_runtime_resume(), that could actually trigger the bug
> we were just discussing.
> 
Well, then...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...still, please check the other cases.

