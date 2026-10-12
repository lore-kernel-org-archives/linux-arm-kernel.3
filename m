Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D90CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O90jitIO3s38c8EG4VvKygaj1zarOwk0tQIHj8nVOYg=; b=QzFl87gqICHgcsPbCuocvp/TtO
	2JFGFHxTa78bOGH4YBcYzyKaUjKnKThUaGz6qhxSVuXgq7HXuAaYeqOI3tlFJIc79G7bhRTqbWapb
	z7BgbIyOvfjlwyDYVsZZ4yvIwbjNecOATxze/SNUoPGIF2B5V2YGsdlnvMHiluMZVadTRGRFXxwwf
	u4PGMa3cc0euwArrXJgNGjoOUoV5JdK6I5qAkgDdeAdDJNTKYz9PDqK9pwBc+z85YyfT+y78/azeZ
	+uawer9njr7u71D2v/CGm0a1kesxgkGO1A71fYfXRUHx6E9dRK86mmowgKPRpEDwfcBQ0e/wBG3DZ
	7GWr32sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHjB-0000000AmTM-4BSY;
	Mon, 12 Oct 2026 15:14:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHj9-0000000AmSU-1AkO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:14:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso1540696f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791818049; x=1792422849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O90jitIO3s38c8EG4VvKygaj1zarOwk0tQIHj8nVOYg=;
        b=Y6edLW1VKbrPuw1iRz+buBfkMqymlcPQ4as3k1w1V1jfusJmB1Upsao+uUcWUoaHiB
         nf7t1BbR09xLWRvK+WSmiLA88SDJy9zUzs2hgrh6M441QrQJ+qGdJVqa1zHwEpMyLH5l
         WR2OsvHChUZE/v2lWPO2M9QFUfDN+c1Fu5Uqtj0nIT2wqMs3ucXC2sYDEazS4SBwlD9E
         8GT2T9YWj22T9jstFmm1bg3L5PpL0LlB4p2syOvMv1+lDeeDliNsV4GsbxYrrc7O1wyV
         +VuXR1FBWxuEyiqOGeU/SMu2YosqCwECv3xJr7dBQLEBbA3gdtELu7nSvn92uu6nzeBj
         iMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818049; x=1792422849;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O90jitIO3s38c8EG4VvKygaj1zarOwk0tQIHj8nVOYg=;
        b=euKpabQE8xi6RQ0OplQ1nrfeB88WAHOw2c7GXKu6D+mGRm6L97LmG4+S2LlLkdrMC4
         IufVkVTGMhqCVZcIwpU0xGFQyQSAfpUeuqUs+xLMf8NLskEAI4dHKvEY6T7J/rE2+f4k
         KSqVJQkGkKlArN8HmiPX4AizAmlb1PlcyMdFGGh/HGTsqf5Uut6IbDpofwoA35ZtojKX
         +yW4bFaG/vi1GFJg6yORFrbFZav6hTTBP5C97M/RPRQlWkgIGHSczEHxBdv3aNfD3Yyi
         yfS42OzTcZb8hMGR+apTCia33sInJjrHV6yQlMqSoObzwFLZAqEys6hkzcN4mGVOovdA
         nxiA==
X-Forwarded-Encrypted: i=1; AKwUvByC6bkryuM1wb91BPdXTCJ4vA6/uTWO9d7aUaTbUNWIt4zvdDm8zizJvYan+bnGJXH6L6rCvN07c9LHw0P+HwZ/@lists.infradead.org
X-Gm-Message-State: AFq9FYKJ6HMQmmzmA5QLsqd3ZViBwIC0rpok2hjux70Q4XgRTZATgzL1
	/REnuhCyo26vUsOc1WPanDT3eEZCJxTI9VKyiSrm6I6CP65JX4l3oOQv+YbKXk3DdHA=
X-Gm-Gg: AYBFou1/PTvaemJJxak9SsqzleyFzGp6UMMwQzjQDwyw5AI+J9VrbmAbEdQaemux+4I
	R/yOgnwdfypYaARJ+LXMVzqDZq97oyfWf18LErDZdoEyztVt4oUpZIYCj2QtVIi0VmJc/zuQT17
	xBGLUeQGSegUvkq6Y0RvZ6twH8ys2JP5k5DkhiX76j8Tl68+Gc9ee2goi6EXw+eW9u++dJ6JEy/
	hMcq4JTsSYmVNeZh9l8jCAD0p6K3jqNiNlSoJvSPwSJC1jM2hv6CYXvG0nme71WHX+/QxFBk7ky
	wBcld9NE+gGuymjxtRevo0P7eZkwBRXYnZctTyGO7DxlCzGPkJq9qNTiZ6vAg8kG7wWBvVV5USt
	2qTXbTuFz42zWdMtXzgOtczrFU0XxihXOtx7FfUXXpCM1lMTdwk6X3xStpwQ92PrcDvgQPsBvLr
	EBqEsQNgVfQwW6PMH2tx4tDzqwLLWRhdDQgcb4t05ImvTqoiliZvE8LNh5yJnxlDyFkIMSki1ge
	g==
X-Received: by 2002:a5d:6f17:0:b0:485:a394:58ef with SMTP id ffacd0b85a97d-48dbaaed22bmr16768322f8f.30.1791818048717;
        Mon, 12 Oct 2026 08:14:08 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm3653f8f.16.2026.10.12.08.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:14:08 -0700 (PDT)
Message-ID: <d90324be-c43d-4d28-9f1a-e28e437031e8@baylibre.com>
Date: Mon, 12 Oct 2026 17:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-3-2476646118b5@baylibre.com>
 <1j5wzdzyqm.fsf@starbuckisacylon.baylibre.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <1j5wzdzyqm.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_081411_356664_DA77DE25 
X-CRM114-Status: GOOD (  23.20  )
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

Hi, thanks for the feedback and sorry for the late reply.

>> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
>> index 58dce9f08c9d..70ea39c77b32 100644
>> --- a/sound/soc/meson/aiu-encoder-i2s.c
>> +++ b/sound/soc/meson/aiu-encoder-i2s.c
>> @@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>>   				   struct snd_soc_dai *dai)
>>   {
>>   	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>> +	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);
> 
> Not sure about peeking on the other path like this :/

Yeah, I know this is perhaps not the nicest approach, but it's the same 
one I used for the bs-quirk handling (see the "startup()" and 
"hw_params()" callbacks). Since there can only be the playback and the 
capture stream, checking the other stream's "clk_enabled" is equivalent 
to a user counter in "gx_iface", without adding a second piece of state 
that has to be kept in sync with it.
Is that acceptable to you?

>>   	struct snd_soc_component *component = dai->component;
>>   
>> -	/*
>> -	 * If this is the last substream being closed then disable the i2s
>> -	 * clock divider.
>> -	 */
>> -	if (snd_soc_dai_active(dai) <= 1)
>> -		aiu_encoder_i2s_divider_enable(component, 0);
>> -
>>   	if (ts->clk_enabled) {
>> +		/* Disable the clk divider only if also the other stream is not using it */
>> +		if (!other || !other->clk_enabled)
>> +			aiu_encoder_i2s_divider_enable(component, false);
>> +
> 
> Looks like a race condition is possible here if one stream closes while
> the other one starts.
> 
> I think you need a common structure between the 2 paths (with a counter
> possibly) and it needs to be protected by a lock.
> 

I might be wrong, but I'm not sure a race condition can happen while 
managing these 2 clocks. Here's what I found:
- "iface->mclk" and "i2s_divider" are enabled/disabled on 
"prepare()"/"hw_free()" respectively.
- when "prepare()"/"hw_free()" are called the framework holds the 
"card->pcm_mutex".

So when one stream performs one operation, either "prepare()" or 
"hw_free()", it can read and modify (if needed) "ts->clk_enabled" both 
for itself and for the other stream safely.

Am I missing something?

-- 
Valerio


