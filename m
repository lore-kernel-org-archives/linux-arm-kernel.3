Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2237DCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdNmA7Q456iosyYRzPrqg00tebsLAHHTciT1QX6nIpA=; b=Nyr3eiq97CeJ+SsFus8ryrwJZm
	91pup92vcA9/AM8ZJUgmn1+mX+KtUlHKyd69iX782Hzatl7GgymPQ19V9un1oemAol621u4UcH1z6
	jNMecGCr9d5h66dtmKzDjEhpLcOFO2TOYxJ0bO+Zy6h2g7hapicw2FrSSB73zrvBfh5IkIy+tTpV/
	1t782zliz1HQJ5+SgUvyr0hrQ091eFMP5dVDXclragG3U3M1AtG5rYAGb1kKNE8cuPyghLlPWVfyx
	bKGftYpvlJ1VnBVddGFTyMXLmFZDBxjlLhfzbb02EvjhgDB4lG+LKgZXvladVRWUfPOmL3lh342sA
	+4KFMSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIRh-00000007gDJ-3Qyf;
	Wed, 10 Jun 2026 12:54:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIRf-00000007gCK-2xIq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:54:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so58973975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781096050; x=1781700850; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdNmA7Q456iosyYRzPrqg00tebsLAHHTciT1QX6nIpA=;
        b=lHz+l1tFgSvH+cFcfYPsNYb06MT6hnK9j4DAmBcyZgfLEY7qYBauekBz+3oj44Ms3b
         7RgMf354CzHP17zsbpU4nHTF8+6RXVs69FCLZFUao9nP4pfE8jB1gregWDV8e9goyfkY
         Xfs2hi3j3qvP6ADJytVF3mmJrTR/uP4Utm+T9IPvfyREGFCC5YN5ekswuiXVwFgkjDnT
         uRtBPabueVjzPWObz97zd5N5EJha3bKiD2dScoDKbT+tlLtR1sqoXQM8l5b0ZvSTID2U
         XMHmVTj6dPQ6E486ZZhWeMIdwbuhxRErVXjKJ8ZcjHDK8BRpx5olOkmyzqnRxxNPwRz/
         E4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096050; x=1781700850;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OdNmA7Q456iosyYRzPrqg00tebsLAHHTciT1QX6nIpA=;
        b=XL5AzIjU9YUGY6/SBN+8FevME68lB80TDbbiQ3V4f+ZCWF6NKBG8jmwagagEgXazOY
         teRXGgYTKHAebmJW26e0Mrftb1rCfgi3uNuj26TnmUv9UlZDNk4yUUxAoEbl4+5+w3z6
         GHNa2OQN+J/Q5RSARFeN3D8ce0JBWaHX1kzWZwUZb/Qea4nh6WSVpWVm4fD7ySRmly5N
         kvETV992KI9/XdpbdRslz4l9Kw7EgYOxMr87ruvu1eDzK8hm12ltAnJrNwIZVYvVMQcb
         1B5uQAl5kZTRhLCjbX8u4ihNfjDn6HCWpIDqwFW6AHcgM4SpktEtLVcMK2plsE1oYjJa
         iFJA==
X-Forwarded-Encrypted: i=1; AFNElJ864Bzz58+Otn+lc0V581B9wKq7gFeACKIqES+PN9BvDtx0GFvKjW9ygbokqQu/lJYuBSK7foI2NWzmF59hpzFk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh10IDX1x24KKcJuETJ6HrF1RLcCZqTPx9IiE3vgxQsvWFLWuB
	v4Rnp/Nbd4A+t6hNc5svNbUrM+6/h/I2LMKTMV5I1Kcsvp8Em0J7Wd3wYAMoWvnpj+A=
X-Gm-Gg: Acq92OHLd+jpR7ij38cW8ImJI2JmIvM12T/ZnWlT/DExiLIZWujxBghIR/czzN6UiTb
	r2T7fIo2MqxUDjqi0VxlXjMgkoq3jNHyxvy9ie8IXNVMRYcAAUmKGFaKJ0LVfSNaLdWR936Hxdp
	4cqPBcaED8lkoDwHuTEuPUdcgByCO7oGYSoLQ3LMrv/HaWYzAV2JQoHVPyXr7KUD2VlUl7MWwv8
	Xx1x689bO6Uhfimks473HvuAr5jWEuhC0D6I24BPZfZgrp0dd8U+7GgOPbVbGlLlE1XTl58T9SU
	Emf75plf8h97cN+9AdIf2/yJ7JCziNgPRBVoGY6Xt3lHncfLkrCMkQbVbxS/q17CcI0kSXdI16J
	uk/Th40xiUTJG3pax+wvLsqJNZWs8MgQ4cndEdqZwzdGvBbVXB6sOnbl5864aPvICaWuxKG3o5B
	xEFbmhwKk9YJ/rr7MIVZVDMD/gBsXbW5XK
X-Received: by 2002:a05:600c:37c9:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-490c262dcb5mr391675255e9.33.1781096050039;
        Wed, 10 Jun 2026 05:54:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc3fd502sm562365245e9.11.2026.06.10.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:54:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
In-Reply-To: <20260610102153.83367-1-phucduc.bui@gmail.com> (phucduc bui's
	message of "Wed, 10 Jun 2026 17:21:53 +0700")
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 14:54:08 +0200
Message-ID: <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_055411_765531_47B8A6A8 
X-CRM114-Status: GOOD (  21.78  )
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

On mer. 10 juin 2026 at 17:21, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.

I suppose it is OK but it does not seem to really clean anything and
make the code easier to follow in that instance, from my perspective at
least.

If there is policy to systematically use guard() whenever
possible then OK, otherwise it seems unnecessary.

>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/meson/axg-tdm-formatter.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
> index f451e4dce442..a6ba401104d5 100644
> --- a/sound/soc/meson/axg-tdm-formatter.c
> +++ b/sound/soc/meson/axg-tdm-formatter.c
> @@ -157,20 +157,19 @@ static int axg_tdm_formatter_attach(struct axg_tdm_formatter *formatter)
>  	struct axg_tdm_stream *ts = formatter->stream;
>  	int ret = 0;
>  
> -	mutex_lock(&ts->lock);
> +	guard(mutex)(&ts->lock);
>  
>  	/* Catch up if the stream is already running when we attach */
>  	if (ts->ready) {
>  		ret = axg_tdm_formatter_enable(formatter);
>  		if (ret) {
>  			pr_err("failed to enable formatter\n");
> -			goto out;
> +			return ret;
>  		}
>  	}
>  
>  	list_add_tail(&formatter->list, &ts->formatter_list);
> -out:
> -	mutex_unlock(&ts->lock);
> +
>  	return ret;
>  }
>  
> @@ -178,9 +177,8 @@ static void axg_tdm_formatter_dettach(struct axg_tdm_formatter *formatter)
>  {
>  	struct axg_tdm_stream *ts = formatter->stream;
>  
> -	mutex_lock(&ts->lock);
> -	list_del(&formatter->list);
> -	mutex_unlock(&ts->lock);
> +	scoped_guard(mutex, &ts->lock)
> +		list_del(&formatter->list);
>  
>  	axg_tdm_formatter_disable(formatter);
>  }
> @@ -330,7 +328,7 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>  	struct axg_tdm_formatter *formatter;
>  	int ret = 0;
>  
> -	mutex_lock(&ts->lock);
> +	guard(mutex)(&ts->lock);
>  	ts->ready = true;
>  
>  	/* Start all the formatters attached to the stream */
> @@ -338,12 +336,10 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>  		ret = axg_tdm_formatter_enable(formatter);
>  		if (ret) {
>  			pr_err("failed to start tdm stream\n");
> -			goto out;
> +			return ret;
>  		}
>  	}
>  
> -out:
> -	mutex_unlock(&ts->lock);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(axg_tdm_stream_start);
> @@ -352,15 +348,13 @@ void axg_tdm_stream_stop(struct axg_tdm_stream *ts)
>  {
>  	struct axg_tdm_formatter *formatter;
>  
> -	mutex_lock(&ts->lock);
> +	guard(mutex)(&ts->lock);
>  	ts->ready = false;
>  
>  	/* Stop all the formatters attached to the stream */
>  	list_for_each_entry(formatter, &ts->formatter_list, list) {
>  		axg_tdm_formatter_disable(formatter);
>  	}
> -
> -	mutex_unlock(&ts->lock);
>  }
>  EXPORT_SYMBOL_GPL(axg_tdm_stream_stop);

-- 
Jerome

