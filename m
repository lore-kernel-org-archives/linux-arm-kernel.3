Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F5FF43821
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ee7S1C7CW9QXX3hiuXvnlueBA+ocQbUcyBQidGRH/6U=; b=BtDeebpRbTQVpO10buzBDTL2Np
	jVp1psgQE1CNvloJ3HzJb4nRE2oQyXjME2fxBiVra2AC9dXKLwX/9SPZ66p7md3J8qonPhaPcFDR+
	OXQiYk4fayaSsORbzfjlBqKup1VEIr6nt6zU1G2HIsZrgBy0v5Jb0JpwXo3jCu+SXtKzjGKwpJCPU
	zBO265R06oOCJnLR9BDgOUryPd1DsZn8DI01h+QLpCDrMPPpQAmLsLnIBsSZhSnw3vDM5kwZ0GPjA
	MFP33Xg0tLn9BfjcU8ooz4NhXKSzOaxEoJjrwMmRpUp6XOc2VM/sBkBnvvT348MSMJZSHaeDS0cfL
	w9fRhfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Ep-00000001Ele-2sOe;
	Wed, 15 Apr 2026 14:29:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1El-00000001Ekc-1W8H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 14:29:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488c2690057so69459235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776263341; x=1776868141; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ee7S1C7CW9QXX3hiuXvnlueBA+ocQbUcyBQidGRH/6U=;
        b=f9y40bQ+acGFbrE46lJFRR93et6yvcCdygPHtRUoDHPabEAK0Aq3k0uXlrpOQYwKyf
         N3Cmp04xeSzVjhifAy3utcaCZWgNmxLY/Epw9EAfHljAim4QGFmkXi7Q5zc6mrgZHO3Z
         X7BeCZB3RKKXICVrNcDx7tAilvlAMhVGxLKNUEbXuap8Om417KAfID+iP6tkO2876l/p
         NYz3LvPQLeUGr9OR004JyYAAHcxrLrwdLBTtw0flAV5XX2PAu879UQNDjLViYsyyiNNE
         nFpzoNM4VEI6gLpfnaYPnO0D9qW2Ksk7vo6Kkaaq2j1TVcceFJVdjQmF5Ce0vG9mOegD
         CZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776263341; x=1776868141;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ee7S1C7CW9QXX3hiuXvnlueBA+ocQbUcyBQidGRH/6U=;
        b=rYbecp084BZBYgsxMKgIfcWK66SHJdyJFJpQLsuhnhPA6sdIzLWpUJbFcS3uxDLZQQ
         UKb5y+x2lRhvMc1D9DELmAdQmerLC1wOYAn8RVUx1A244mXFfWf5xf8+Pb1tLd2AEfRQ
         TKVa37bkYDVnUNGjfVIwNzY9S9t98Wz4NThruNuR6gTlgY0ENbMIDJB0traZCuYBvEd2
         0+VxiO9yMgSSSiOvS/Cq2qyNhSAcAifAM7tZEiWLiW7XIjwHu8WOgR/hGnsFFT47RaS2
         nTr1ttEf3vBRa97spcDWChqy2UnErSo0kPeMJ+/wRPgoAn/DSRGDD740MX9oQmTwa9tm
         +rKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8q8jr5IEe6IVIrYrX08tvO17WvAukB1eARCH5UPJhyEQBoXqYMnKJcf+jRw4KuSOKFBWpOuJergftEiLobDnQ+@lists.infradead.org
X-Gm-Message-State: AOJu0YwJQek+fK2lA+II96jwL+/Mqy4AlDllHmAUkmI4duHU0PgPRRUV
	Z3kFCFXeZisaKHjW2sQmsNPGZfJTqbcZgUYgGiq5UlUIhwYBm4b088i8ucbAXCOZQy0=
X-Gm-Gg: AeBDietFdT6ueuzbi5IWQTgqjI7H2u8I8Af4MaQZthF2csi+MiQReP0+Du/Oiv+otMF
	YDqoZeUTUeATHF3DBtlIndIhYEyyCrRv9Aj7DcW1IoLEKaZx34BF3DIiz4nsxBYkle5AwwUacFW
	raw1yK24UCJRBmXc6v74rY1ALjL7LAWHKMyX+VLO5U5fMddxpBhzQkGGZUt6pdkMXX8eKfPixWd
	LoFD8yO8s5+XYgDdWS+1iOZ13GLCZf5Stqd0GISoWNJspQXFeyIfn4gkOxCrEblGwlKzIGp5Gfw
	CZHEp48FjwToJXOPBbDojund6ltloIXdfsXbDPiMlCxmYV75O3ZhKBWkn9WwkZGkkOWqx2sWvDY
	DYoGD4xsQCzRBlsuGipzBE1exUMo9rvRVousMVr3fkIm28tA5zU/D3bwgSbC2nROqEv/meB0JR9
	FHTkaqBPiM06+XY1aT0N8QGE9swEQs2Qdq
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488d68057cdmr284525805e9.1.1776263341086;
        Wed, 15 Apr 2026 07:29:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e64b:985d:5292:5ef5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488f096d110sm28244435e9.11.2026.04.15.07.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:29:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Valerio Setti <vsetti@baylibre.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 02/11] ASoC: meson: aiu-encoder-i2s: use gx_iface
 and gx_stream structures
In-Reply-To: <58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk> (Mark
	Brown's message of "Tue, 14 Apr 2026 17:13:48 +0100")
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
	<20260411-audin-rfc-v2-2-4c8a6ec5fcab@baylibre.com>
	<58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 15 Apr 2026 16:28:58 +0200
Message-ID: <1jy0ios3f9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_072903_557886_25285CB8 
X-CRM114-Status: GOOD (  17.34  )
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

On mar. 14 avril 2026 at 17:13, Mark Brown <broonie@kernel.org> wrote:

> On Sat, Apr 11, 2026 at 04:57:27PM +0200, Valerio Setti wrote:
>
>> @@ -200,13 +200,17 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>
>> -	aiu_encoder_i2s_divider_enable(component, true);
>> +	ret = gx_stream_set_cont_clocks(ts, iface->fmt);
>> +	if (ret)
>> +		dev_err(dai->dev, "failed to apply continuous clock setting\n");
>> +
>> +	aiu_encoder_i2s_divider_enable(component, 1);
>
> If we're checking the error here we should probably return it as well.
> Including the error code in the log message is also generally helpful.
>
>> @@ -214,16 +218,20 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>>  static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>>  				   struct snd_soc_dai *dai)
>>  {
>> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>>  	struct snd_soc_component *component = dai->component;
>>  
>> -	aiu_encoder_i2s_divider_enable(component, false);
>> -
>> -	return 0;
>> +	/* This is the last substream open and that is going to be closed. */
>> +	if (snd_soc_dai_active(dai) <= 1)
>> +		aiu_encoder_i2s_divider_enable(component, 0);
>> +	return gx_stream_set_cont_clocks(ts, 0);
>>  }
>
> Note that we only hw_free() if we preprared, but we enable in
> hw_params().

Huh interresting, I had not thought of that. Valerio and I discussed the
clock part a lot for this rework. It is the crux since since the
interface and clock setting lives in the AIU subsys but serves both the
AIU and AUDIN subsys.

Valerio maybe you could keep function above just to set the rate, but
enabling the clocks through a DAPM supply widget ? This is kind of what
the AXG is doing.

what do you think ?

(actually in the AXG the each formatter widget call CCF
clk_prepare_enable() but a supply widget poking the register would do
the same thing)

>
>> @@ -284,6 +295,8 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>>  	if (ret)
>>  		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
>>  
>> +	aiu->i2s.iface.mclk_rate = freq;
>> +
>>  	return ret;
>>  }
>
> This means we store the new rate even if the set above failed.

-- 
Jerome

