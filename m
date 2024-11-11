Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43175D3ABF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+UNXPvFiJYKdozi2bLmtL/MfRUPw96dDHh4Di4Qg/E=; b=ySk34P5g7/RZ3aPbpG+FoSWuqK
	PXZU/W7E8rfr3Xi7bv1rt++zaj0Zk6UaT8H28souosA5oLEl3oeBfmfKTcRcvjluH9akCgGEkfIa+
	U6mJJjN3IafFIY9kb7fLbkfBtE/N5oc9uipy6Cg10XtI1lhMu37Oqu1J1t/eRVBWxGdA62zZnTxWr
	czBP4Qrgp23CcWuHsLIhMa+jxBh5/eOTFFU4H7m+TvYIoi2KuvE3BqV8q08cDCI2Beo42bzzBveNr
	oi5CRepKIbFPr6JIdO689AfXkpzy4QNOLSElwqYPAw8EcSe7d2C2menKQdVIyOUB40bwoZdpELN78
	WT5fKd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaQd-000000016X4-49aJ;
	Mon, 11 Nov 2024 19:50:27 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaMK-000000015sg-0kor
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:46:01 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-288a90e4394so2134728fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 11:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731354358; x=1731959158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+UNXPvFiJYKdozi2bLmtL/MfRUPw96dDHh4Di4Qg/E=;
        b=cpRmxDNDmhT91DCW3SPpQWeRZYa2Mc7dmlo+G1lkJJBf33sqrIv2g/nAz40OANZnER
         mepuzh7GpmlQzWr7ZbtrHRxtTV7tGGqHVZV+f303pdMRp5sI5gcgqeoF4eOAa9Oyv9iY
         TFC42VNZqrfSDPUakEgqzBrlC6mj8x+IV3PgxlUONji2QPWO+aEwsXEHpK4W+TaU3T0y
         sPdsG+DpKhNQMeNozE2daYquRomhbouyXYVGu74Qfc01VH341DvAZZbfqIwvrRCpMWB7
         VTgYHd9j5nzYHFa76PsJS4C5ryU92gTkovxJU5dYtCcBNlbM+cKIuSVqNcfOcQ9GvaNd
         813A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731354358; x=1731959158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M+UNXPvFiJYKdozi2bLmtL/MfRUPw96dDHh4Di4Qg/E=;
        b=mOTBAp/EefdWpOznfN9accKtWxCscDZXpJcW2Rg+UTeII9oysiav1qY2sy2mo2Hh3h
         jzyKK13E7qJnARSsMqvvkiQo2xqZKarYxHDAdnGRjs0rFJElON4Av1As5N66pkljruvS
         f2R2vC3WQ6asc3lDOhfGuPe+/RvpLcs+JMLW27vnMIao+KsqyAask8FR1KzbgzHQt6Vl
         26Cw1hjmONWL3gg2ouzKfiohAkB/Rv/ZpS3i1hSQ6tNnaBqQun6mxBjO7bevXEViQcCS
         SplJA8UFbLY9jky9iY2Ug1iroqzFwEO56VFuMgBxMkiIi7atd4yQOz+BmH9NbC7ywXId
         VLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6nPdI7z0j9wQ6dp8AT2WjkHDbHRitDtOhDRra4kne1UUFi+79Isagg5BurOG/HHO0gX7lx/sAQl5EFjjm75CM@lists.infradead.org
X-Gm-Message-State: AOJu0YypVNu7mQtLIIjYFE807FtJO8XDwW0wwAgFUX25yU9utvyRmvGl
	EH5weSZ+lSJT8dnA0sbK6oKlKaZdBh6GwK0atCe2GoJw/BbYrgChZNhy+VQSi68=
X-Google-Smtp-Source: AGHT+IHzI2fm85aOJIz0hLFIb1FeDMozEBMTSyyRvlCuXW4txD+zMA10To4egPzgrYsuvVd5NCladQ==
X-Received: by 2002:a05:6870:7010:b0:287:b9:349 with SMTP id 586e51a60fabf-295cd38c966mr165947fac.36.1731354358195;
        Mon, 11 Nov 2024 11:45:58 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29546c8eb0fsm2940001fac.14.2024.11.11.11.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 11:45:56 -0800 (PST)
Message-ID: <8505aa28-5f88-4fcd-b3bc-cb5db89d2a08@baylibre.com>
Date: Mon, 11 Nov 2024 13:45:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iio: trigger: stm32-timer-trigger: Add check for
 clk_enable()
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>, jic23@kernel.org
Cc: lars@metafoo.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 u.kleine-koenig@baylibre.com, tgamblin@baylibre.com, fabrice.gasnier@st.com,
 benjamin.gaignard@linaro.org, lee@kernel.org, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_114600_255524_1D77649B 
X-CRM114-Status: GOOD (  15.07  )
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

On 11/11/24 1:19 PM, Jiasheng Jiang wrote:
> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
> Changelog:
> 
> v2 -> v3:
> 
> 1. Simplify code with cleanup helpers.
> 
> v1 -> v2:
> 
> 1. Remove unsuitable dev_err_probe().
> ---

...

> @@ -492,21 +495,25 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  		return -EINVAL;
>  
>  	case IIO_CHAN_INFO_ENABLE:
> -		mutex_lock(&priv->lock);
> -		if (val) {
> -			if (!priv->enabled) {
> -				priv->enabled = true;
> -				clk_enable(priv->clk);
> -			}
> -			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> -		} else {
> -			regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> -			if (priv->enabled) {
> -				priv->enabled = false;
> -				clk_disable(priv->clk);
> +
> +		scoped_guard(mutex, &priv->lock) {
> +			if (val) {
> +				if (!priv->enabled) {
> +					priv->enabled = true;
> +					ret = clk_enable(priv->clk);
> +					if (ret)
> +						return ret;
> +				}
> +				regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> +			} else {
> +				regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
> +				if (priv->enabled) {
> +					priv->enabled = false;
> +					clk_disable(priv->clk);
> +				}
>  			}
>  		}
> -		mutex_unlock(&priv->lock);
> +		
>  		return 0;
>  	}


Another way to do this that avoids changing the indent
so much is placing braces around the case body like this.
This also avoids the compile error from using guard after
case directly.


 	case IIO_CHAN_INFO_ENABLE: {
		guard(mutex)(&priv->lock);

		if (val) {
			if (!priv->enabled) {
				priv->enabled = true;
				ret = clk_enable(priv->clk);
				if (ret)
					return ret;
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


