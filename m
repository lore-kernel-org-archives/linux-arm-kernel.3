Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93336C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvtswLvPiQHbO1nAALeYzwdSCfuCoM47IC0JhG2+bnc=; b=naXeOML5NLVQtdYPKZG3I6ReyS
	F1mGmbTFjUw4oc3Q0H8nEtobDX6JQurCuwVvgIA8nU7Qhh3ijkbA4zj5cn7h/eza95/tLmpNMkj5k
	EI7iDLGoB4URLZmkqOa9tdOfdbqeARh5OzXzFHkJLrtpPgfU31cr4m8/SD/qBxuz97M+qZKPyKQcE
	HSpqXbnQ2ZOFkxnT8pL+tc54t5SOwzgiq1am8f+7fpIZpchkRyM8CY1E7RrcZgq4M1jwhXYT8//E9
	SraHlEZN3E01kIWRFO0KzudZoILDZ2eDM2fQWaOummxWmwZbslvbOAm3Ish4K4/81nCYjlZVMEGyt
	gP/SMHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4enr-0000000EScM-3iIo;
	Thu, 10 Sep 2026 13:26:59 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4enp-0000000ESbs-30jS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:26:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c253425b253so1073822866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789046815; x=1789651615; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvtswLvPiQHbO1nAALeYzwdSCfuCoM47IC0JhG2+bnc=;
        b=iZvmmvd4zIak5JDVw1Y34XPDlSUQFt/o/4w+EfkOgnAWqqhuPw6ACvPtqYtSoMwmIp
         uKlvGjVhTnAguMGM/zs43hMdYD4vc4Ziw9XTTTgv77SM/hmTcx9cxgAdEKAfEzaO0Cf9
         LXe5hfV9eJOwa+liAYZj62/Ya9Phdo3AwBJG/uskQ8vxJ7MxeWMZTDTb9n5JzDM/WoWN
         DzkGQgx/WX+35PBwOuXMvJ5z4nftpYtluVD8MqDAk0QKjt/noh4SQh/HK2VgifZfUzw+
         ABw5wAs1BUxfwHoUap+V/tLKJa7ER6dnpj1TNa/yprwD8W5QrfiTcheqY6HZkvQOnATK
         8GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046815; x=1789651615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvtswLvPiQHbO1nAALeYzwdSCfuCoM47IC0JhG2+bnc=;
        b=c+GoB1EVQY5XB17TAs5Yep8rDMEzXWsp29F+T6dkITsOxdsc8gHepJ7Hw6H9JhM9Ll
         aUbzvhMb02xZvVYFpjA6PHda6Le4H6R4QKvJXpgppkuyysI85FQqQEdMXoSY7pEx4NDY
         EUmwlqhpMKXhQ2ByvAkGPGZ/aq2prZAa1LEaPsh+Dk+1Dgg2Bvio+M3so5ieZG+Skv/N
         OUJLwAex5MfRQbecNypBsNRqtYvu6lAGmLdM7ssjf8u+eWRjHhSdoa+Kmt1frepLMfPa
         SZPfjpSLATCKzsXgkVZMLY77ZO/YWzt7yBEPTwd8DwNW+Ud08BbM85Wv0iKYDiLaQsKf
         /vbA==
X-Forwarded-Encrypted: i=1; AKwUvBys8ylmT2nYSRnYrbhs2vk1xCCNMyl4pzlvuYkxBvT4kdSecBvUj//CICsy/Q9gCDIS/alIL4m6KPe1Gx2RSize@lists.infradead.org
X-Gm-Message-State: AFuF++mdl8P78TyJ5V9dvFdPt2GDX2QYvbCjnYZdgm5Nr8kre7ZSEUYn
	a6ZPXmbLxMtuq3qnZizcH9LgzAZBxYWCmuXtIjHnivAcrXL59bJyNbdQ
X-Gm-Gg: AYBFou14Q+BxAAlXMyK7Z1wFxIGfeHEUBbFM64tXHzgkkHO11bFsw/njEuYhSLrFgHF
	/E+crq1ovX8xbY/uTWi3OxDRtSGvJgQHU1pUSYhHeSf9JlyOSpC664hMy5JEtbt8K/Di6yGe0WU
	GT6NzIXQzU2GhDH/tu1uOYTo208NYK0v1h84sGHRT2Ad4EHOHREHOttl33VkJj3thSLoShYC9xR
	ko4uuvshhp7apN4sGBHKdoUfAEh1yazzMRuSSSaZ8Oavv07Q+8M/O24M5dsDsNNaaiFIcTqjG6d
	2YHNW0YJ/OJKlDKp7UuA6jxnkWBjPLOuSCyRl3wLIgUajk8jsFsz4fBpt9FroRTNDvpEX4fZp4c
	iB5/UDedz25am0+M+En3nG1QpWZObNrWEdywcqDrMTCQaaucbssRaHazK3um7OsBfmywkQ2a0EE
	sZC9AqsgGqT5ztwKtO2a0UB9rH1cDpZZRRkWvTswNJ68dmmrhEfEcDz+pGB+2Fp2/UEOiULXnat
	j7rIb4=
X-Received: by 2002:a17:907:a893:b0:c29:286e:2e3e with SMTP id a640c23a62f3a-c29286e30e9mr574563466b.38.1789046815001;
        Thu, 10 Sep 2026 06:26:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm912526366b.63.2026.09.10.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:26:53 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:26:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Message-ID: <aqKwGQDkB_HruLyQ@stanley.mountain>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-12-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910125742.150902-12-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_062657_793080_8CFC4583 
X-CRM114-Status: GOOD (  17.17  )
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

On Thu, Sep 10, 2026 at 07:57:40PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
                                           ^^^^^^^^^^^^^^^^^^^^
It's unsigned int so it can't be negative.

regards,
dan carpenter

> Reject invalid frequencies before configuring the I2S clock.
> 
> Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> index f20dbb410223..ca7d786cdeff 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> @@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
>  	    dir != SND_SOC_CLOCK_OUT)
>  		return -EINVAL;
>  
> +	if (freq <= 0)
> +		return -EINVAL;
> +
>  	i2s_priv = afe_priv->dai_priv[dai->id];
>  	if (!i2s_priv)
>  		return -EINVAL;
> -- 
> 2.43.0

