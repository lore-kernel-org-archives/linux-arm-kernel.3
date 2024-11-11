Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0E3D3ABCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 22:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKvPigbrA0Z/Q/kUzViZAw8L2iJnfB5YOIybKqYcsY8=; b=s9FGpedcxbMr0GevV55JnH/vcO
	KNzp1rtdsN/2mZBXmMckpaMvrQW83oIhTsz8n6uu97YCKQt+rbWVVtJauERA2E5/bpe91wTiKeJ2A
	PH8BZySSeQCL+xp/OaxC614U7Mc3p74YlFkByhL1OPeY2Q6W2jVsNmcoXoKdfEKhbqMSr40cgMMgW
	1W8GzpWoMLapox96FkkyGJP5ROQfIweUnmsWcsCaUCL2JogiMuBigIhl1p17XbLUT1lUT1LdVZhmR
	8MVMduZbZvqH8oATMF5hDq3GqRS1LKFrrdnMTocEekAhgqZKh32jfMFT9arUsSGUnQzuWvtj7n2Ne
	xkXez9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcvs-00000001Vrc-2lkp;
	Mon, 11 Nov 2024 22:30:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbkb-00000001Luz-3eXy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 Nov 2024 21:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HKvPigbrA0Z/Q/kUzViZAw8L2iJnfB5YOIybKqYcsY8=; b=UT7Fsycpfoi3MdNQP7VcHYBYsi
	Lk2zeEG0ZKhNaXLVPvdzHAPTJe8cU7Y60BBQr6bpcfUDFeywU9Ccuej+WZjOKEuNzP2/clJQROj6F
	koA7jybbZ4lh/mZsnsB+J1RDHHLAsCL7w9SGj2T+0o3P6Ny72q4VO/MMjS13w+XEXjwKI7GeHLsAP
	L6CssDFMYEp2ppL8+kfLGsKHOAgN+S9DmAXw4gpbgTNWErE+ypvH3IUK7FGi0WNRKCyN3KwXyFDXq
	8uxoIazAtbFia3fjh3uirvIytY0PasGM6v1zjv70XHfgkTewaq8+Ky8bJKK5XrwM7rXLTrqE7pZuM
	Dp/8q8aQ==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbkW-0000000CuRx-3All
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 21:15:08 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5eb73ec1e1aso2419740eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 13:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731359701; x=1731964501; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKvPigbrA0Z/Q/kUzViZAw8L2iJnfB5YOIybKqYcsY8=;
        b=ubFsKwFPktES1CD529sQxBz9673IlgzLA3uaPcny9R6oKbhzij5GVFYWggR0vGD/zv
         8sTTYlfxIFt4IfuEDwZkTQ/o9AiQUyqAvX3nIdhr/uVQtMtw5Xe5mh8yzq7urYoUo41P
         rNvSFduWl2AvV4OmmfWXI3t3HnCqXxmDfck5m9F6Ws6igHY9BESnKdcIZsYAveS/9wzX
         KB3Jq8Q1KrQvuYcdHy2sNk9E9alN/I4iiXWiMJ8HOdDRGUFluSlomv6BIoN/WuBRlvKU
         6ml8cjHSPh00M/Y4q4Cn+cCXw6zjZU9DeYyAK7QWvS9L//LSQI1m62iZoeQmzZK48wHm
         6quQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731359701; x=1731964501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKvPigbrA0Z/Q/kUzViZAw8L2iJnfB5YOIybKqYcsY8=;
        b=YVCcmRX3+0DYjGMUBQIlaeqlVQjVxgExhkkR7jN0QjWny4YBIneJpoI5sUOTDej1+o
         JxIqbhPHn6nUUnvh8GJoJAqW1iBdujCGUFh8DFpwS2mZ3USOg+lbrVFqFCY9gdm2eZta
         7j9/vVy6gSr4hfJm5kD+PlvpsSAgxSUrpKKmMVqR94QKDdr9E+FiHFpF38Xh6VTYIZub
         zH071+IlsacIW49jvBNnbC517una0c6rsx5mJao83YFiuzEH/C2jEphxxeDHtWOTD1oT
         VrQeNOl8Em/9eEg2hfmIGyNZ7/Ak7S541nCYtgx4MQbeenFe/hkWJTzhRS9rEfSGG3br
         CNkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOk/LEJfi2FyN7m/8v0RpvfDrlkUJVTZJbHtDT8zVEu6TEtl/LgMOdT4PFUoGwUn07m613hROwfhny2s+6M8na@lists.infradead.org
X-Gm-Message-State: AOJu0YzyRGioz1xokMgxHjv+1gOU6oj5Ixdtbro1u+GxY8eNX83J1Qn6
	qhPETWdsa68GZe25CNd/jgPTReLvNFB/m6dnH1/IWji1rBNswRLhQ3M2eYgs1e4=
X-Google-Smtp-Source: AGHT+IGnDhH00NIUNGxRkfa8oULGq+weqFX/R55G+H4lngweXnOIQ7C2jE6iYgJfdqCvn2ECiusFDA==
X-Received: by 2002:a05:6820:1f08:b0:5eb:d1ac:21c4 with SMTP id 006d021491bc7-5ee57d2887amr9655428eaf.8.1731359700898;
        Mon, 11 Nov 2024 13:15:00 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ee494fb095sm2064551eaf.6.2024.11.11.13.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 13:14:59 -0800 (PST)
Message-ID: <b2f6db15-51a8-498d-ab5b-52f0f6a2e098@baylibre.com>
Date: Mon, 11 Nov 2024 15:14:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iio: trigger: stm32-timer-trigger: Add check for
 clk_enable()
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tgamblin@baylibre.com, fabrice.gasnier@st.com, benjamin.gaignard@linaro.org,
 lee@kernel.org, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
 <8505aa28-5f88-4fcd-b3bc-cb5db89d2a08@baylibre.com>
 <CANeGvZVE6fX5hV-p1xXsGR=Z=pABzDtvV9wY_XBbLwJUWNVtyQ@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CANeGvZVE6fX5hV-p1xXsGR=Z=pABzDtvV9wY_XBbLwJUWNVtyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_211505_139432_A83CC3E5 
X-CRM114-Status: GOOD (  20.99  )
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

On 11/11/24 2:36 PM, Jiasheng Jiang wrote:
> On Mon, Nov 11, 2024 at 2:45 PM David Lechner <dlechner@baylibre.com> wrote:
>>
>> On 11/11/24 1:19 PM, Jiasheng Jiang wrote:
>>> Add check for the return value of clk_enable() in order to catch the
>>> potential exception.
>>>
>>> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
>>> ---
>>> Changelog:
>>>
>>> v2 -> v3:
>>>
>>> 1. Simplify code with cleanup helpers.
>>>
>>> v1 -> v2:
>>>
>>> 1. Remove unsuitable dev_err_probe().
>>> ---
>>
>> ...
>>
>>> @@ -492,21 +495,25 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>>>               return -EINVAL;
>>>
>>>       case IIO_CHAN_INFO_ENABLE:
>>> -             mutex_lock(&priv->lock);
>>> -             if (val) {
>>> -                     if (!priv->enabled) {
>>> -                             priv->enabled = true;
>>> -                             clk_enable(priv->clk);
>>> -                     }
>>> -                     regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>>> -             } else {
>>> -                     regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>>> -                     if (priv->enabled) {
>>> -                             priv->enabled = false;
>>> -                             clk_disable(priv->clk);
>>> +
>>> +             scoped_guard(mutex, &priv->lock) {
>>> +                     if (val) {
>>> +                             if (!priv->enabled) {
>>> +                                     priv->enabled = true;
>>> +                                     ret = clk_enable(priv->clk);
>>> +                                     if (ret)
>>> +                                             return ret;
>>> +                             }
>>> +                             regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>>> +                     } else {
>>> +                             regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>>> +                             if (priv->enabled) {
>>> +                                     priv->enabled = false;
>>> +                                     clk_disable(priv->clk);
>>> +                             }
>>>                       }
>>>               }
>>> -             mutex_unlock(&priv->lock);
>>> +
>>>               return 0;
>>>       }
>>
>>
>> Another way to do this that avoids changing the indent
>> so much is placing braces around the case body like this.
>> This also avoids the compile error from using guard after
>> case directly.
>>
>>
>>         case IIO_CHAN_INFO_ENABLE: {
>>                 guard(mutex)(&priv->lock);
>>
>>                 if (val) {
>>                         if (!priv->enabled) {
>>                                 priv->enabled = true;
>>                                 ret = clk_enable(priv->clk);
>>                                 if (ret)
>>                                         return ret;
>>                         }
>>                         regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>>                 } else {
>>                         regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>>                         if (priv->enabled) {
>>                                 priv->enabled = false;
>>                                 clk_disable(priv->clk);
>>                         }
>>                 }
>>
>>                 return 0;
>>         }
>>
> 
> Looks great.
> But there is no indentation between "switch" and "case".
> As a result, the closing braces of "switch" and "case" will
> be placed in the same column.
> 
> Like this:
> 
> switch(mask) {
> case IIO_CHAN_INFO_ENABLE: {
> 
> }
> }
> 
> -Jiasheng


Usually, there is a default: case as well, so we could move the
final return and make it look like this:

	switch (mask) {
	case IIO_CHAN_INFO_RAW:
		return regmap_write(priv->regmap, TIM_CNT, val);

	case IIO_CHAN_INFO_SCALE:
		/* fixed scale */
		return -EINVAL;

	case IIO_CHAN_INFO_ENABLE: {
		guard(mutex)(&priv->lock);
		if (val) {
			if (!priv->enabled) {
				priv->enabled = true;
				clk_enable(priv->clk);
			}
			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
		} else {
			regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
			if (priv->enabled) {
				priv->enabled = false;
				clk_disable(priv->clk);
			}
		}
		return 0;
	}
		default:
			return -EINVAL;
	}


And it is unusual, but I found kvm_arm_pmu_v3_get_attr() that
also has this double inline brace at the end of a switch statement.

	}
	}

So even if it doesn't look so nice, it does seem to be the
"correct" style.

