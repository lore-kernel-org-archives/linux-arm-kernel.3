Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A68CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMRXJ2DHsf49+ksodME+HxUJ2EZ72gQAXeb1aT9DBGw=; b=uydGq+xyG2jXkLrAR9tbDvkRlo
	e1EPmybXQEZVQdjYV54XIYocDCRqrrbVEHtfn9YQflnV4e961hBUYYiCof0mJ8AfuF33/giTUP4ha
	PYUj8YkZxBQ1fCPZ9gLCMMrnSrGsegtU1JDLQdN+DtFwLrh6was0G84fJDEVP3E0pjRJ0f7+/Q4Zb
	OvzoBKhO8wkaygtYJM0X5/VeHuhYTBjwpD56iBZ5ZDusU+pBo2viBBT5tbZZxTz5DCT2JndIkJjWi
	PWg/ZHFfJl/43GwiWsr9xKFadAnFQkHHnaRHz1E2xFNoRIJH6FJe5VQHYIVIUGAw/xEiIygsGxiU3
	5PhRb1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFlQ-00000000Al2-05TJ;
	Thu, 18 Sep 2025 14:37:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFlN-00000000Ajs-1jiQ;
	Thu, 18 Sep 2025 14:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758206251;
	bh=4hr9rb0pYa4kk0rjOBPob6luIbfpKkRsa9dhKhkV/gg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YCXsqEshUU3oC8vSADi0fwGu7/Qk89HQVbpwmQdk0UYTC4ezWdlIW7ygx8Rj4jDZw
	 /QZMUXuIILEsTyIlC8a74n715k5infeKOhzHwOQEuKQgqSPCmTBZf8ug/X9VhdJ1oL
	 bTgYV7iXzLRZeg8OgSTblUbiRkRdZk8mAQaJJg2iiwAofn6Bl/+GJMrkdGybUibqSe
	 uwEU0e06NgcZQWtgk+XfIV+gG5r+Bf4BX2Y65PCvPQpsppuU7ArjCYUB2AICnGdQ1R
	 krpaRKeV3CqVIwYk1S/D/okrEBDbl2hajRho8jeAfz8KP0xn1aYBaK5Q2XRAJxyI7P
	 3GQFLD6IsO7/A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C65D917E12C4;
	Thu, 18 Sep 2025 16:37:30 +0200 (CEST)
Message-ID: <71f50716-2f8b-432b-970c-9436fa181856@collabora.com>
Date: Thu, 18 Sep 2025 16:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in
 mt8365_afe_suspend()
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20250918140758.3583830-1-lgs201920130244@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250918140758.3583830-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_073733_610532_1F0EB894 
X-CRM114-Status: GOOD (  17.06  )
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

Il 18/09/25 16:07, Guangshuo Li ha scritto:
> devm_kcalloc() may fail. mt8365_afe_suspend() uses afe->reg_back_up
> unconditionally after allocation and writes afe->reg_back_up[i], which
> can lead to a NULL pointer dereference under low-memory conditions.
> 
> Add a NULL check and bail out with -ENOMEM, making sure to disable the
> main clock via the existing error path to keep clock state balanced.
> 
> Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> index 10793bbe9275..9f398d1249ce 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> @@ -1971,22 +1971,26 @@ static int mt8365_afe_suspend(struct device *dev)
>   {
>   	struct mtk_base_afe *afe = dev_get_drvdata(dev);
>   	struct regmap *regmap = afe->regmap;
> -	int i;
> +	int i, ret = 0;
>   
>   	mt8365_afe_enable_main_clk(afe);
>   
> -	if (!afe->reg_back_up)
> -		afe->reg_back_up =
> -			devm_kcalloc(dev, afe->reg_back_up_list_num,
> -				     sizeof(unsigned int), GFP_KERNEL);
> +	if (!afe->reg_back_up) {
> +		afe->reg_back_up = devm_kcalloc(dev, afe->reg_back_up_list_num,
> +						sizeof(unsigned int), GFP_KERNEL);

Nothing else can fail, so using a label here is unnecessary.

		if (!afe->reg_back_up) {
			mt8365_afe_disable_main_clk(afe);
			return -ENOMEM;
		}

This makes you able to avoid adding a `ret` variable, and also the goto.

Cheers,
Angelo



