Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E11E6ADE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 15:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQUWP1BeA1laPQDDGr7PsNh/4ceCQ+9h8540Cju7Eys=; b=UVhsq3vj75VGFTKm1SMl28DlvN
	WDapymxNyXWtXsCdStJs4tQjs6tC768adfWmCc2CalJqpdkrHtR7bxJ3yT0fsBOJ15GMr1HmU/jPV
	gPmn+7YFqnvDV/aZeHrObHryqqdQwNBrX9KcvE5YMRTb/GrOa6v+Qk8BmikTirmzlaT83UCxIEGTD
	W5ZUf2H6byMRdk3ReBqAgKgGX9UW/E3rMpgXCDkhMd+QkiGlWVXOwZ5abklGNkfNoYVzT6b1hR+EM
	V/vdFlNjowp2782scfgo25hED8YGLIIyjjk/P/jch7LGSP46ojd004LRI7BJc6JMd8S+DsV7Oaisc
	HigY8N/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tErl7-00000004UE4-06MM;
	Sat, 23 Nov 2024 15:09:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tErkA-00000004U8n-1N0k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 15:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3CE55C48EF;
	Sat, 23 Nov 2024 15:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548DFC4CECD;
	Sat, 23 Nov 2024 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732374496;
	bh=mV0DYgkf1CnqnfVd7iq3ygJgMJskcY+V1ypQ6J1wbnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kbSj3ip+kaRWJybPm0YerFXgRKWPbUxyNOlWqPF9hZucBq4TIwJ1pJODwn42DZBAQ
	 kTUbAWtjGmM3e270KmKubkZ0b4a9JH6G+OEp8AKzbxeszA/zdjM4BKNqhALK5EzhUp
	 /SpKx9XRX3e7ll2dFaIbyzx91/fs2BBy5u5p8MPR2ANlYnAvyljVsHP91nAYoAZOKK
	 0SzQEYwyUKxMXGPMtzLtfMclJ+MYQcKh58QSZYfVOLthrvFWdahA2+eCXLpZOuJt8K
	 3oSOkbKWFsoWWnpyteSqBaajD7mI9SFOC1GhoodDzggAsqQLG6hOoys32PtkqI3eJr
	 gNCxUFVt5qjSA==
Date: Sat, 23 Nov 2024 15:08:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: dlechner@baylibre.com, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tgamblin@baylibre.com, fabrice.gasnier@st.com,
 benjamin.gaignard@linaro.org, lee@kernel.org, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iio: trigger: stm32-timer-trigger: Add check for
 clk_enable()
Message-ID: <20241123150808.1426c6f8@jic23-huawei>
In-Reply-To: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
References: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_070818_412220_5C022B8E 
X-CRM114-Status: GOOD (  18.11  )
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

On Mon, 11 Nov 2024 22:23:10 +0000
Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:

> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Hi Jiasheng,


Should definitely mention the changes to use guard() to simplify
the resulting code.

One minor comment on the code inline. Otherwise looks good to me.

Thanks,

Jonathan

> ---
> Changelog:
> 
> v3 -> v4:
> 
> 1. Place braces around the case body.
> 
> v2 -> v3:
> 
> 1. Simplify code with cleanup helpers.
> 
> v1 -> v2:
> 
> 1. Remove unsuitable dev_err_probe().

> @@ -482,6 +484,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  				   int val, int val2, long mask)
>  {
>  	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
> +	int ret;
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
> @@ -491,12 +494,14 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  		/* fixed scale */
>  		return -EINVAL;
>  
> -	case IIO_CHAN_INFO_ENABLE:
> -		mutex_lock(&priv->lock);
> +	case IIO_CHAN_INFO_ENABLE: {
> +		guard(mutex)(&priv->lock);
>  		if (val) {
>  			if (!priv->enabled) {
>  				priv->enabled = true;
> -				clk_enable(priv->clk);
> +				ret = clk_enable(priv->clk);
> +				if (ret)
> +					return ret;
>  			}
>  			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
>  		} else {
> @@ -506,9 +511,10 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>  				clk_disable(priv->clk);
>  			}
>  		}
> -		mutex_unlock(&priv->lock);
> +
>  		return 0;
>  	}
Add a default for reasons David mentioned and it also makes it visually clear
that we expect to get in here for other cases but they are all errors.
	default:
		return -EINVAL;
> +	}
>  
And drop this return as unreachable.

>  	return -EINVAL;
>  }

