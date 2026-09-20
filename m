Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A789BC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 02:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjvmYyCc6sVH2RWH/PPf9bwAMgPY9Arl3SG7xhOPHXY=; b=SaVMFB/ekjnV2LBS7uubox1SMX
	HV+Er8zxvwamZ8Le2m9Jun3i+M5XbroEmso5BSsQEgQHIYkTz8ueBLtdnU2rRUEUfWzpgwmyCbFYA
	3DeKEc2T1frRjjSdkMeKYOgojngIi87SyLhWcYwg7pSm1LUu3lsDJcJF5TrT9z5iuLI62gqmhzBIn
	RxmLmt3VJDOGp2gRqqAd7If5z7CVt9ZTzzA1HX0ueBaZohLkHr5j8SBXgW+4HPnIJQCDOTv9oW2Sq
	jlz9j8MIyeyD6hvBpjgPH7IEYVlqYeEGRN4U2vUZcd7XPu+Nlp/ACT5DZ8LWPOdI0IZuVFqO4OJ4v
	K04XNTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x87bX-0000000Gm0g-1ZxM;
	Sun, 20 Sep 2026 02:48:35 +0000
Received: from mail-oa2-x0b.google.com ([2607:f8b0:4864:30::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x87bU-0000000Glzu-0qzt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 02:48:33 +0000
Received: by mail-oa2-x0b.google.com with SMTP id 586e51a60fabf-462dec1c4c5so830429fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 19:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789872510; x=1790477310; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjvmYyCc6sVH2RWH/PPf9bwAMgPY9Arl3SG7xhOPHXY=;
        b=GHWKi4LG+Hs0fVqxnszzO8+uPh6gTh02z4QcEK9n7zIpZjznTtHiFRkIBPM+KM38hf
         PP7vxWgWaqmNhIjNNjVpGq7YkHkFLoT7hUAYvv38px0cMIfztKROsA6Ne/dyuvaLgAXg
         n3DbDrnIJuHJ+I/anJ4TVnL5VmwEuofjdiaHMRMxw7OkCfooiXZtWunXXZ212u0eYL4k
         4zdCI/HKARWUMEQthm7DduGvK0QkHoSCXUaK3tv3pgzueoTYVG3kWRcQ6qOvtZA3DM7q
         NDBK2Yc7jPAqI9DJsIRasFx4GAfOnKQYZie33JZp8yhycc33559gjn5QW5CdxkvGGBkm
         6QPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789872510; x=1790477310;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjvmYyCc6sVH2RWH/PPf9bwAMgPY9Arl3SG7xhOPHXY=;
        b=2EuQ+eRlmYx5Xx4mGNW5lz6gF+elnqZ2XbWOgM0rY47/1gKBLSXS/2mUunP+rn1dMV
         ILtJpW4ECjAmJ2geAMzzysLGfr0SEm6P6M0+1DiRBt61tAjEjtCD+lGGByiv4Q1s0F1E
         lA716BlpheyRf4ZhvHp10SC21e4E9LysxHKqiklcrnN+rP8pLsvacJJFOoMBwxMLme4v
         LHV/KVgqRgteiNpeMbquL72tAwTTy76wgEHIKClMGqyVUTsOSr5Yb28oDH0IesQXDk0Q
         KZTzclYxm5Z/MsNmBagjHlFMmFis/p9o+td/EVnJfHBgy1BImbKZKAAOEDfBByws/++D
         OyLQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/9Fe6SvVq6snGZWmrZNo3U75wE30RMfFsb8s8g6mt3bUcMMRmauoJWMl3QKKTQtpNvcpwb7ZZe/+CHJXbsGxZ@lists.infradead.org
X-Gm-Message-State: AFuF++nfmH+zSc2eMcy8ADX0+LuYCdOdWMLx8/kiYj6RLP6Z4xVw+XlY
	6EO6yQt1g2V/05/bqZ2MFG4YE0rWXxSZf+8d2ncWyDiQDgZZDKLgapJP
X-Gm-Gg: AYBFou2KlQmKynEN3molOD0zBV7F2iL3wmraNgcX4X95IGlRslJcJaxZ70NM/7sr3+p
	KRe6/L1sGpLAMvejAkWwVCx7oYiQe1lwvfq/TpHXkFBeUThP8nM8JEdNQ/v3d+WuRIvPTe0BrTD
	/7pp/64DAbFGu9n9VGCX0rwwi/hFQxLOoFnQHNI2D8DocBsrLtBY0HlSjZIImBS8oaxkpFJEx48
	43Xh1OvbypyDORl9GXdLo+YMemCNQt0YLcKzHLfIIo2gF3dwtXH6+dm/JI6rIfCEo/FdDiiWiTV
	8yhYC6vEMqGFkb1+/APLdAtRmhrC8htM1/BsW7V+3pjU4Ct8FcdSZ0EtPbiLOdb+zPJM68qGzqB
	VB+tm/ulpyA59NEFV+D3OGhxDyOetFKaCZja4i4T6k/6vwbh2c+Ig87+Hl1Mn1qpEcI4mG/QKU6
	YQn6iJf9wa0gjUnJLP3Pu9aaHah4h5ym5HhtIiLdjg8cuvd6HOOIlTohk556RhOZ5vuZuUq3ycs
	c93IGVb86K8Ev1/ogSv2qJ+tg==
X-Received: by 2002:a05:6870:d24c:b0:43b:bb18:affd with SMTP id 586e51a60fabf-486e554a334mr7101333fac.8.1789872509696;
        Sat, 19 Sep 2026 19:48:29 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d519fsm4188565fac.2.2026.09.19.19.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 19:48:28 -0700 (PDT)
Message-ID: <7f1ab011-c90f-42fc-bc4c-836a1ef9febc@gmail.com>
Date: Sat, 19 Sep 2026 21:48:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: Re: [PATCH v2 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-2-db35882a6080@gmail.com>
 <aqzo2vqeGEGCLFIP@ashevche-desk.local>
Content-Language: en-US
In-Reply-To: <aqzo2vqeGEGCLFIP@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_194832_281664_9146584F 
X-CRM114-Status: GOOD (  45.32  )
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

On 9/18/26 2:31 AM, Andy Shevchenko wrote:
> The below should be part of the comment block, no commit message needs to
> be polluted with this.
>
>> A new driver was created here, instead of modifying an existing driver
>> such as mt6323-auxadc or mt6359-auxadc, for the following reasons:
>>
>>   - Both mt6323-auxadc and mt6359-auxadc select channels through a request
>>     register (1 bit per channel), while mt6397 uses a 4-bit numeric field
>>     CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0).
>>
>>   - For mt6323-auxadc, which is the closest I could find to the mt6397
>>     (CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14).
>>     It uses CON22 for its request register, and reads the result value
>>     from the same register as the ready bit. We don't do that - the mt6397
>>     has a factory calibrated value for each channel at 0x16 higher than the
>>     raw value. mt6323 also has a 1800 mV / 15 bit scale / resolution while
>>     we have 1200 mV / 10 bits. We also have some per-channel preparation
>>     that we have to do before the burst, that the mt6323 doesn't have to
>>     do.
>>
>>   - For mt6359-auxadc, it has a more generic framework for describing the
>>     AUXADC, but it assumes requests are channel-per-bit, and so we would
>>     have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.
>>
>>   - We also have our own software sampling, which the vendor does too
>>     (Amazon Fire OS based on Linux 3.18). We'd have to have our own
>>     sampling callback to do it.
>>
>> Assisted-by: LLM
>> Signed-off-by: Ryan Brue<ryanbrue.dev@gmail.com>
>> ---
> ...here is the comment block...
Done in v3.
>> +static int mt6397_auxadc_read_once(struct mt6397_auxadc *adc,
>> +				   const struct iio_chan_spec *chan, int *val)
>> +{
>> +	struct regmap *map = adc->regmap;
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(map, MT6397_AUXADC_CON1,
>> +				 MT6397_AUXADC_CON1_CHSEL,
>> +				 FIELD_PREP(MT6397_AUXADC_CON1_CHSEL,
>> +					    chan->address));
> Make it two a bit long lines rather than four.
Done in v3.
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* START is edge triggered: it has to be lowered before being raised. */
>> +	ret = regmap_clear_bits(map, MT6397_AUXADC_CON1, MT6397_AUXADC_CON1_START);
>> +	if (ret)
>> +		return ret;
> Does it need any settling timeout (in case it was set before)?
I don't think so. The ready bit gets cleared when START gets raised, not 
when it gets lowered, so a missed edge wouldn't surface as an error. The 
poll would match the previous conversion's ready bit and a stale value 
would be averaged into the burst, so I forced one by suppressing the 
clear on START.

With the clear suppressed the set finds START already high, so regmap 
doesn't issue a write at all and no edge happens. All 40 reads still 
succeeded, but each one returns sixteen identical conversions instead of 
the usual spread, and nothing shows up in dmesg.

It also let me calibrate the probe, which I wanted before trusting a 
zero out of it. Probing the result register just after the rise, it 
counts the injected stale bits exactly: 93.75% with the clear 
suppressed, which is 15 of 16 because in the first conversion of a burst 
START is already low and still makes an edge, and 43.79% against 43.75% 
predicted when seven of sixteen are made stale. In normal operation 
everything it sees is conversions that have already finished, and once I 
subtract those out, what's left at 30 us -- which is where the poll 
first looks -- is -5.1e-3 +/- 2.9e-3 over 96000 conversions.

The two writes are never back to back anyway, since each one is its own 
transaction on an uncached regmap over the PMIC wrapper and the set 
alone takes at least 7.3 us. I also tried inserting a gap of 30 and 300 
us, and it moves the reading by under 0.06 LSB, with no poll timing out 
across about a million conversions.

Even though the vendor isn't necessarily what we care about, it also 
writes START 0 then 1 with nothing in between.

I don't have a datasheet figure for a minimum low time, this is all 
measured, so if you end up wanting a wait there let me know, v3 has a 
bit more context in the comment.

>> +static int mt6397_auxadc_battemp_bias(struct mt6397_auxadc *adc, bool on)
> There is nothing common between on==false and on==true cases. Make it two
> distinct functions and drop bool parameter. It's actually a recommended
> pattern.
Done in v3.
>> +{
>> +	struct regmap *map = adc->regmap;
>> +	int ret, err;
>> +
>> +	if (on) {
>> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
>> +				      MT6397_AUXADC_CON0_BUF_PWD_ON);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
>> +				      MT6397_AUXADC_CON0_BUF_PWD_B);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = regmap_set_bits(map, MT6397_CHR_CON7,
>> +				      MT6397_CHR_CON7_BATON_TDET_EN);
>> +	} else {
>> +		/*
>> +		 * Every step of the teardown is attempted even if an earlier
>> +		 * one failed, so that one failing write cannot leave the bias
>> +		 * or the input buffer powered. The first error is reported.
>> +		 */
>> +		ret = regmap_clear_bits(map, MT6397_CHR_CON7,
>> +					MT6397_CHR_CON7_BATON_TDET_EN);
>> +
>> +		err = regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +					MT6397_AUXADC_CON0_BUF_PWD_B);
>> +		if (!ret)
>> +			ret = err;
>> +
>> +		err = regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +					MT6397_AUXADC_CON0_BUF_PWD_ON);
>> +		if (!ret)
>> +			ret = err;
> These 'if (!ret)' bug me. What can we do if the ret == 0 and err != 0
> on the caller's level? In other words, what can caller do in such a case?
Nothing, and in v2 it didn't do anything -- read_channel() discarded the 
teardown's return anyways, so the value wasn't even used. v3 hands it to 
dev_err() instead, as mt6323-auxadc.c does on its own release path, and 
the accumulators are gone.

The 'if (!ret)' left in read_channel() are sequencing the next step 
rather than merging an error into it, and the teardown below it is 
unconditional, but if you don't want 'if (!ret)' at all, let me know.
>> +	if (!ret)
>> +		ret = err;
>> +
>> +	return ret;
> This can be written as
>
> 	if (ret)
> 		return ret;
>
> 	return err;
>
>
> But the same Q as per above remains.
I took it a step further and made both teardowns return on the first 
failure rather than attempting the rest. mt6323_auxadc_release() does 
the same, and so do twelve others in drivers/iio that I could find. One 
does continue after a failed write -- ltr390_powerdown(), but it's a 
void devm cleanup callback that logs each error as it comes, so it has 
nothing to return.

With this change, a failed write can leave the later bits set. The read 
still returns its value with the failure logged, and the teardown runs 
at the end of every read, so the next read of that channel clears them.
>> +	/* Held across the whole burst: the channel select is shared state. */
> Unneeded comment. It's obvious that guard()() takes the whole scope.
Done in v3.
>> +	guard(mutex)(&adc->lock);
>> +
>> +	/*
>> +	 * Once any part of the per-channel setup has been written, the
>> +	 * teardown has to run, so every exit below goes through it.
>> +	 */
>> +	if (isense) {
>> +		ret = mt6397_auxadc_isense_enable(adc);
>> +		if (ret)
>> +			goto out_teardown;
> Have you compiled this?
Yes, with clang on arm64 and gcc on x86_64 allmodconfig, W=1 clean at 
every patch in the series, and the codegen was correct: one mutex_lock, 
one mutex_unlock and a single ret in read_raw() with read_channel() 
inlined into it, and no path that takes the lock reaches that ret 
without passing the unlock. The only two branches ahead of the lock are 
the SCALE and default cases, and neither takes it. Still, I missed that 
cleanup.h wants goto and cleanup helpers to not mix, and I shouldn't 
have mixed them. v3 puts the sample loop into its own function, so 
read_channel() becomes setup, then a conditional burst and an 
unconditional teardown, with no label.
>> +		fsleep(MT6397_AUXADC_ISENSE_SETTLE_US);
>> +	} else {
>> +		ret = mt6397_auxadc_battemp_bias(adc, true);
>> +		if (ret)
>> +			goto out_teardown;
>> +		fsleep(MT6397_AUXADC_BATTEMP_SETTLE_US);
>> +	}
>> +
>> +	for (unsigned int i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
>> +		ret = mt6397_auxadc_read_once(adc, chan, &sample);
>> +		if (ret)
>> +			goto out_teardown;
>> +
>> +		sum += sample;
>> +	}
>> +
>> +	*val = DIV_ROUND_CLOSEST(sum, MT6397_AUXADC_SAMPLES);
>> +
>> +out_teardown:
>> +	/* Lower START so the converter is not left armed between reads. */
>> +	regmap_clear_bits(adc->regmap, MT6397_AUXADC_CON1,
>> +			  MT6397_AUXADC_CON1_START);
>> +
>> +	if (isense)
>> +		mt6397_auxadc_isense_disable(adc);
>> +	else
>> +		mt6397_auxadc_battemp_bias(adc, false);
>> +
>> +	return ret;
>> +}
> So, this function has to refactored. And please, compile and test the code
> *each* time you update it.
Ack. Admittedly I hadn't tested the 'goto out_teardown' path prior to 
sending out the v2, so I apologize. I have now tested it by injecting a 
failure into each of the helpers read_channel() calls. All five paths 
return the helper's errno, the teardown runs, and leaves every bit the 
partial setup wrote clear again, and guard() releases the mutex.

I also stubbed out the teardown as a negative control, and the same 
faults do leave the bits set in that situation, so the check can fail. 
The restructure is in v3.
> ...
>
>> +static int mt6397_auxadc_read_raw(struct iio_dev *indio_dev,
>> +				  const struct iio_chan_spec *chan,
>> +				  int *val, int *val2, long mask)
>> +{
>> +	struct mt6397_auxadc *adc = iio_priv(indio_dev);
>> +	int ret;
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_RAW:
>> +		ret = mt6397_auxadc_read_channel(adc, chan, val);
>> +		if (ret)
>> +			return ret;
>> +
>> +		return IIO_VAL_INT;
>> +
>> +	case IIO_CHAN_INFO_SCALE:
>> +		/* 1200 mV full range with 10-bit resolution. */
>> +		*val = 1200;
>> +		if (chan->channel == MT6397_AUXADC_ISENSE)
>> +			*val *= MT6397_AUXADC_ISENSE_DIVIDER;
> Make it if-else.
Done in v3.
>> +		*val2 = 10;
>> +
>> +		return IIO_VAL_FRACTIONAL_LOG2;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
Thanks Andy!

Best regards,
Ryan

