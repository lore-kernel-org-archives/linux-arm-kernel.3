Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D970C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M96fzSOjd5lMa8AePRbILOLbgS23Y2+wDGZKhoW4JZQ=; b=Zr0zXV8o1GjxWzhJZMlUHZk2CB
	J1jtDE81TSq66yCsXwVmAP74tuZEhZqUqHKqLbOm5YUH/Y5QqULSkNIfo65tUn7mJIDSCW1038YkF
	6tkJb03yg8HX+AiV/OBPV6Zvkr/2l0sTZuM4HRoQFJWgttXYEMVdiZ52Rvuf33QvOldBinKHpvvsw
	cwQlvIV1UUH1efdXW/c0rjeQXVxTEGGmzcnohsDlEtFJE9sZbL/Fz+aFF1pqH84gbMVW24tx8ty3m
	l+WWZsV8aJ8FbCLmggzgI4cNv8TbtT0+qT1km9EtlNOTlXbaZe/cwKZVD68XuX2LuUQ9s6ORBgM5d
	Ya0ml2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhLx-000000038H5-3Loe;
	Mon, 24 Mar 2025 12:56:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhHh-000000035s8-2w9L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 12:52:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf257158fso28744885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820724; x=1743425524; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M96fzSOjd5lMa8AePRbILOLbgS23Y2+wDGZKhoW4JZQ=;
        b=y1MGu3Ff9TMEmOAyoPdIqtT+sDST4hAMNUYlj2i6br3iBBFnRV3AGvPzscsxVP9OfM
         VAQ1ht6BONMRsHAeNeXJWgzCFwYrIHnAqlWI2dsDUsstxkDGmPtkmoExo1jF2/9thnPb
         wWrs4QiyjRTxFHEFO7UPjpQVxTunaj+RZIkzGtVuUiILj5BYOM6+dp++gY8RFSaXHXev
         7aMNzgvCKivScLM2ugfeDDtxOqwW99u9WrWz/Ky+NSybmIi7WHSpr7LeM58j77hNP/K1
         mvc83zJwk9RqOOkqOSrLippePgWTQWH2uFgXxtd5APD3NNSSb5CkYjY/NXKqQm2oi5Aj
         ftFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820724; x=1743425524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M96fzSOjd5lMa8AePRbILOLbgS23Y2+wDGZKhoW4JZQ=;
        b=FvQdnRJkWwLnaiJmBoUgdJSwPqMTp41RsQXFFb645bgNSbGWq0jphE7lpYKzp2aVaY
         GClp6UCMB7eH64NGav9iyXYKE41IfFPDYCZ3jjU/NGZIyw27j5PmsILsynyHQG9LMUdl
         9/R3+yTdbXu6liKjMuVy9mWNg0fzr/iOZNL9VV31k8Ng024ssGtgIOioOyC3+5EE0Npt
         ExkCIsYeMx+uv2ZtRsQ7fDadrxVtcyqnvGDGTpaj8947EfNjHokuGGOy9S1zSHD/5xPP
         fY5ewuYJcwLQlrN1rlcssop7ua5KZoaWUEOLn0RfyTEC3XemNhXdXozuhnSZ7YGOcOMe
         iAiw==
X-Forwarded-Encrypted: i=1; AJvYcCWvSu8oFrLWP0q53UOStXAHFISIYLBXjcOzfaYj3Ytud4CuBic0kMzpwFqx2KxvhtVrRXkARVbRNpO9yAF+Dv2q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3+REKvRnuIUUKztVd2X886odqIGJkHxJxRxg4jTNS63QITBMy
	lD1KBjsK+UTbipRcQthQQZNE9Ou2o/ew0jcJHe+CDSj8MJ4iXfIjjZSsnsAs33Y=
X-Gm-Gg: ASbGncsAlcAL16av107V6/42L6ywzY1NbnlxWc4b4OBJyqwMme6mUMPTTxmqxsI4+cc
	6wlSXj7JpEekl/wDCZaDtDUPR61BQFtv83rl/mKmUKZfPterjAvARJ+ZMV9MiRyyCNcZ3tGkjsp
	hHOIM5jK4gggkyGT0bqyBPK1hALwdgWBkQwQrm/aMCBU8vL5TreHILcg3BVXs9r5eKisLqImSZK
	8COVhUfGnQWbLkwVFxE191TSMsbJc6kD5jr1hN2Er2FgExrrVJHGodwIezVScsU4HdAhEVuQ6Z8
	Bil5ho6OkPWRzsgXwAHup1pVdUPded7w2y9v6HrTl+OAX5AFgX16YKg=
X-Google-Smtp-Source: AGHT+IFUAo3zCdLK5ulVRumGRwS+0X9ngGXDVA3/EPbZr6WWjFqGe5yC9iRs2jeidcq5aHVNS2UrhQ==
X-Received: by 2002:a05:600c:44c6:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-43d5114e467mr93482935e9.11.1742820723929;
        Mon, 24 Mar 2025 05:52:03 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd277d5sm120604745e9.19.2025.03.24.05.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:52:03 -0700 (PDT)
Message-ID: <ed56c2eb-5bd7-49cf-bf2c-5826e3c42077@linaro.org>
Date: Mon, 24 Mar 2025 12:52:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: exynos-acpm: use ktime APIs for timeout
 detection
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
 <20250321-acpm-atomic-v1-1-fb887bde7e61@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250321-acpm-atomic-v1-1-fb887bde7e61@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055205_736574_8C0068AA 
X-CRM114-Status: GOOD (  20.56  )
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



On 3/21/25 4:40 PM, André Draszik wrote:
> acpm_dequeue_by_polling() uses a loop counter and assumes that each
> iteration of the loop takes 20us. It may take longer, though, because
> usleep_range() may sleep a different amount.
> 
> Switch to using ktime_get() / ktime_after() to detect the timeout
> condition more reliably.
> 
> This change also makes the code easier to follow and it allows us to
> adjust the sleep without having to adjust the loop counter exit
> condition. This will come in useful in a follow-up patch that changes
> the delays.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..d7ed6b77a957af5db5beba7deecce13ac7b30fd2 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -32,8 +32,7 @@
>  
>  #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
>  
> -/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
> -#define ACPM_POLL_TIMEOUT		5000
> +#define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US		500000
>  
>  #define ACPM_GS101_INITDATA_BASE	0xa000
> @@ -284,12 +283,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>  				   const struct acpm_xfer *xfer)
>  {
>  	struct device *dev = achan->acpm->dev;
> -	unsigned int cnt_20us = 0;
> +	ktime_t timeout;

#include <linux/ktime.h>

>  	u32 seqnum;
>  	int ret;
>  
>  	seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
>  
> +	timeout = ktime_add_us(ktime_get(), ACPM_POLL_TIMEOUT_US);
>  	do {
>  		ret = acpm_get_rx(achan, xfer);
>  		if (ret)
> @@ -300,11 +300,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>  
>  		/* Determined experimentally. */
>  		usleep_range(20, 30);
> -		cnt_20us++;
> -	} while (cnt_20us < ACPM_POLL_TIMEOUT);
> +	} while (!ktime_after(ktime_get(), timeout));

ktime_before()

With these addressed:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

