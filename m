Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829CBE81A23
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUcAGLQZkv/PTBs//eYKKwXahaszOterbl1vVyU8vuo=; b=KAIa4aBAOIh3yiY+pxg8yPuEvc
	zsLetHxcT3ukywgP3WGFA+mTZ1882fyhgJkD2f+SPCxI6nApQucCu8fKV7qxO2XgZAfJkok/vbla9
	3JTLHWVQi2ongCR3SBM90sZgMdCpUSasSMUU8NZz/4rENqBmH7IxULdhqhEaU2Cj2wLx4sZ4I8qFG
	7JBJEDzFHEw7pjUJD7mDrkplyFz/HM36hhQVx08ZgtRK7xE6L7QTKACa6DoeeS8nom5FXQSUwbm+X
	LAtDB2UQWG4TgZHGqKomuiR/5UPbK+zAtlxhZ8R7arbml4BsA/2f+2fPaf0T6ZcJiMgi8tZ8slcyb
	JNvKXaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrz7V-00000006jrA-00Ur;
	Mon, 16 Feb 2026 13:58:37 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrz7S-00000006jqa-1f7i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 13:58:35 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59e60b3ccdfso4485774e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 05:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771250311; x=1771855111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUcAGLQZkv/PTBs//eYKKwXahaszOterbl1vVyU8vuo=;
        b=PA7aAMVPlSYNILcS68pt41Q1ATT7wY7/yqp90rnZiqqhUqQvR0bSr8jvuSnvoUNw1M
         GDRVvBTNVN/8D52MqWVL+P6JQ01ChTzI5Y0rAao5R0UVPm5A/k3CI+JINlXoFw9Cjf4Z
         ZPqTqP6DQB6HPPxtiG4FMo3wrNeshqYkFo62wQ5mu916qWWZBAq87vaAEBUKItiI6A9i
         EFYkFumhobggXVuV7CginzA3UaxUu0QL5aNiagLf0tK/6v3tQh/9VvbitrKgCH6j5qtU
         BqQZmNOcjD3FdcMjGcgC3/h/6Ox+zYVeY5/x1ji4fweb9ZHsM0bgkGqHZ0UzLIg+fxpr
         IFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771250311; x=1771855111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUcAGLQZkv/PTBs//eYKKwXahaszOterbl1vVyU8vuo=;
        b=oOcaS8R/34o1kOHrU9XJGSgmsj3v6TXni88q3pRc7Pl8m+jxa2EhreOsl8pAlL0sxM
         yFoPiSs0yvt4Qti6Ex0vFIJr8VcDotnoZf2YYNYMgBHtV+QcR3nF6X8K+trFGkuYHNxF
         On7DWDzOqIIkri5tgsSpEx77nR6uCybmcwh0de2Ux4/4hZxkV1Y9+7b79dSyLyfqkKPV
         2PJOnZW7xnN7RjUcy+hVLzrq79q9hSKFG+QCq/6+rRAiEb+d/TUc3U4i67CXi/phIJT1
         P+ibzMNeUvzppESYD5CsFVqcK9EEvyVU3u/oP04CYrq8tnwctJHkErfQbS6K6zS/+Q6a
         iG8w==
X-Forwarded-Encrypted: i=1; AJvYcCXYOTxpqREgBZ69sw6rprlkgr/g6j7iNiEiAmdt4Zbx+L54Z3i2G2cuS9Wj56gQ1bNTjaKOHRXwxEUHN1PzIz3R@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2sZ8czhvlUgqXXOQiz7OHCmkrjMSoNYYeeev9kVIbZB39VngH
	E3uGH3aYkUxR78FquFgczdvMUHD0oTlBvjPVy3wtOU4FBhCmM+za/lzE
X-Gm-Gg: AZuq6aKUTaP3cGX6JPhbvJRUcZAOIjBc6sJ7rj5Apl4f641uBR45REaaV8hg4vqqG2B
	WaCDf1kP2h9tSZTER/vB5//tNEeaxEwDMpXvuC/0rmh6m3yR5uIla4AyHX2tICYVrNdgUizv3Vz
	N/732Rxy1oS0L8zmnXuYop7yTgghOCZQzST7997GuVxuka/Ih5Lo4GTRetHs8Lb4xOoVP/ORj1X
	cD2+bEhBsQrxbDw+CrVnL3cGKinW7THVqi/5YlsCiilJmQL5xhbOtxiOyXVNtxZcboAa9LmYEmx
	yE/hM6qy7UEvtXqnyj3JnxPLNm8JynHzl3pIxt+PxQfzwhS2xx20drUPm/Sn8LLwGKqwRJ17WUq
	5T+GZwe1Ns8FfEay9LeOMPS7ZKvaXIaV+IJYRVPFLzpExHaDq+Hg+bKfTnwceUHDyAqy3+7kLIi
	8bhywkeQmwCSb7NMwymTPDAHg786mMcDSgL/XQ8AtEMEI=
X-Received: by 2002:a05:6512:145a:10b0:59f:6db3:1526 with SMTP id 2adb3069b0e04-59f6db316f1mr1715840e87.10.1771250311130;
        Mon, 16 Feb 2026 05:58:31 -0800 (PST)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b2223sm3224103e87.79.2026.02.16.05.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 05:58:30 -0800 (PST)
Message-ID: <5d889f66-7697-4a39-beed-33ace693a1ef@gmail.com>
Date: Mon, 16 Feb 2026 15:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
 <20260214-max77759-charger-v6-4-28c09bda74b4@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260214-max77759-charger-v6-4-28c09bda74b4@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_055834_810390_1649D6FA 
X-CRM114-Status: GOOD (  28.91  )
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

On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add a helper function to find the selector for a given value in a linear
> range array. The selector should be such that the value it represents
> should be higher or equal to the given value.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>   include/linux/linear_range.h |  3 +++
>   lib/linear_ranges.c          | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
> index 2e4f4c3539c0..0f3037f1a94f 100644
> --- a/include/linux/linear_range.h
> +++ b/include/linux/linear_range.h
> @@ -57,5 +57,8 @@ void linear_range_get_selector_within(const struct linear_range *r,
>   int linear_range_get_selector_low_array(const struct linear_range *r,
>   					int ranges, unsigned int val,
>   					unsigned int *selector, bool *found);
> +int linear_range_get_selector_high_array(const struct linear_range *r,
> +					 int ranges, unsigned int val,
> +					 unsigned int *selector, bool *found);
>   
>   #endif
> diff --git a/lib/linear_ranges.c b/lib/linear_ranges.c
> index a1a7dfa881de..c85583678f6b 100644
> --- a/lib/linear_ranges.c
> +++ b/lib/linear_ranges.c
> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const struct linear_range *r,
>   }
>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>   
> +/**
> + * linear_range_get_selector_high_array - return linear range selector for value
> + * @r:		pointer to array of linear ranges where selector is looked from
> + * @ranges:	amount of ranges to scan from array
> + * @val:	value for which the selector is searched
> + * @selector:	address where found selector value is updated
> + * @found:	flag to indicate that given value was in the range
> + *
> + * Scan array of ranges for selector for which range value matches given
> + * input value. Value is matching if it is equal or higher than given value
> + * If given value is found to be in a range scanning is stopped and @found is
> + * set true. If a range with values greater than given value is found
> + * but the range min is being greater than given value, then the range's
> + * lowest selector is updated to @selector and scanning is stopped.

Is there a reason why the scanning is stopped here? What ensures that 
the rest of the ranges wouldn't contain a better match?

The logic is now different from the 
linear_range_get_selector_low_array(), and I would like to understand 
why? It'd be nice if these APIs were 'symmetric' to avoid confusion. 
Hence, I would like to know rationale behind making them different.

> + *
> + * Return: 0 on success, -EINVAL if range array is invalid or does not contain
> + * range with a value greater or equal to given value
> + */
> +int linear_range_get_selector_high_array(const struct linear_range *r,
> +					 int ranges, unsigned int val,
> +					 unsigned int *selector, bool *found)
> +{
> +	int i;
> +	int ret;
> +
> +	for (i = 0; i < ranges; i++) {
> +		ret = linear_range_get_selector_high(&r[i], val, selector,
> +						     found);
> +		if (!ret)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(linear_range_get_selector_high_array);
> +
>   /**
>    * linear_range_get_selector_within - return linear range selector for value
>    * @r:		pointer to linear range where selector is looked from
> 


-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

