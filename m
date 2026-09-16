Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DDAC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oifjO2FRqSI1P+f2ZcUoFrwoF0E599KhTMFfFuhSdvI=; b=xyDfcKDRHVvMxG+rGOl/u/CJ4N
	1kPi3aVawoZtO7v5qc3Inj2IQNIR+7O40UmiEggZTXmxYQkm99So03V0t26dz8579Yn4vKINxTb0j
	NV/qRWVHeAJ4iFPA218AkBor+L4Cww8h46rQQ9TqzOizUa4jhQxTDop8bk6gRxIvhzh0daOEK2qZK
	AO3O4//WOylI3FHLLiOGcH7eRDPy8o6bKcVCTko3e7FI3R7G+H9SHIfNncaDBKsZyhd1+uqlWSIBW
	MDVCqaw2taH8V7s3B+FkfzC/XdRMIksfR28Ub6tzzBTXLMWqgqS4gxEkSq5HN3Zv39bJjnZIUy5ER
	Ua5ORvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mkG-00000008xKZ-3hbc;
	Wed, 16 Sep 2026 10:20:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mkD-00000008xJa-48fB;
	Wed, 16 Sep 2026 10:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789553998;
	bh=ZdiiynkTSEzixqoDULJaTjJ2JCfd9M9hNholTnj5GQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mSIn0NIG7emGT1WDtVPOGhV9vO5/hD739A2wU0lUdlnlJ41tHMC0YYehbWqSPjDW/
	 BKKJg5d4OVpSEsvqIbRt7c2DlxJ90fxG09yH6/OqQBobMrbLh7OwxhUCOSEBY/zkvG
	 /UFoRyGIc4zvqn9/6YvV4hEgFqAdUKHla2Yx0UbqIqJjBqh8rtwPVjUaFt9LQGQblx
	 d+oebwWbgh8eYTHB1kx3h+UOy+45/ex9QtheyI+CSWJz08SIzYMMA1eONeNbLqutNX
	 6F2kd72D2QJD5KHhRjMQ9ciHXyiqjek7+nXguzHMgLPE7u5ierx9Ircz9sWpHi3l+0
	 KicQ1/YeeHGjQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC5AF17E0420;
	Wed, 16 Sep 2026 12:19:57 +0200 (CEST)
Message-ID: <c8fb208f-c9a8-45ae-93f2-161279f2ba37@collabora.com>
Date: Wed, 16 Sep 2026 12:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] ASoC: mediatek: mt8189: Improve error handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_032002_229862_FB2D470D 
X-CRM114-Status: GOOD (  17.47  )
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

On 9/16/26 07:00, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series addresses part of the error handling in the MT8189 AFE driver.
> 
> It propagates errors from clock operations and runtime resume, validates
> clock parameters, and removes redundant error messages.
> 
> In v2, there was discussion about checking the return value of
> regmap_update_bits(). While opinions differed, the existing driver already
> checks it in mt8189_afe_enable_top_cg(), which is used by
> mt8189_apll1_enable() and mt8189_apll2_enable() touched by this series.
> 
> Therefore, I keep these checks and add the corresponding error paths for
> consistency.
> 
> Compile-tested only.

Series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> 
> Link v1 :
> https://lore.kernel.org/all/20260910125742.150902-1-phucduc.bui@gmail.com/
> Link v2:
> https://lore.kernel.org/all/20260914072842.24420-1-phucduc.bui@gmail.com/
> 
> Changes in v2:
>   - Update the names of the goto labels.
>   - Check for zero frequency since freq is unsigned.
> Changes in v3:
>   - Add Angelo's Reviewed-by tag.
>   - Restore the existing afe->regmap checks,
>     making the separate patch for missing regmap unnecessary.
>   - Do not pre-initialize ret; set ret = 0 in the default case throughout
>     the series.
> 
> Best regards,
> Phuc
> 
> bui duc phuc (12):
>    ASoC: mediatek: mt8189: Propagate APLL enable errors
>    ASoC: mediatek: mt8189: Propagate MCK enable errors
>    ASoC: mediatek: mt8189: Validate MCK ID
>    ASoC: mediatek: mt8189: Propagate reg_rw clock errors
>    ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
>    ASoC: mediatek: mt8189: Propagate runtime resume errors
>    ASoC: mediatek: mt8189: Remove redundant error message
>    ASoC: mediatek: mt8189: Propagate APLL errors
>    ASoC: mediatek: mt8189: Propagate MCLK errors
>    ASoC: mediatek: mt8189: Validate sysclk frequency
>    ASoC: mediatek: mt8189: Propagate TDM clock errors
>    ASoC: mediatek: mt8189: Validate TDM MCLK frequency
> 
>   sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 134 +++++++++++++++------
>   sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  45 ++++---
>   sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  18 ++-
>   sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  19 ++-
>   4 files changed, 154 insertions(+), 62 deletions(-)
> 

