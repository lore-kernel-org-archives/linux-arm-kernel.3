Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ECBE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 10:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcSCzwxqg7VWiur4dwM2dEy5lv+NIQcB10C1LX2/4m4=; b=q6ISW6lHrzs4GeaFjDhSAMlY70
	Wbydn79dSchKAfU9rg5iGcrJ5WoTuHsgTWpe2REhxI2RzyEH03TIprXujGFkjl96zKho+a6tmVdnX
	HC2HhDEHsjaoqTT859eW3u+/sqRTGoDrdjnahnSND5l8FRNVtAzssj+jZJXN+rWo7StWRCe61N8xk
	ZnRJFLTiq/K1LOPJyRTmvqzbz0haF1tRt5qxxZIyNOU5LJj/EQIWf+K7YD7A08JAGowsRNC916qus
	loyUyMwgIYHo3g42pWfBuaz+zclrN2OITmymvq8HV9Z9W4+cilqR8nGnYNfXo7ZmM8ULeYor7Mge5
	H3gnujxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt15C-0000000BDAd-0vk7;
	Thu, 19 Feb 2026 10:16:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt159-0000000BDAB-3HJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 10:16:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43621bf67ceso519136f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771496185; x=1772100985; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcSCzwxqg7VWiur4dwM2dEy5lv+NIQcB10C1LX2/4m4=;
        b=C1A2RPuGy7eqOxQW5j5G3tV2OIzdwFeGokKq+my7XuTDEpdxyp/kED4aybg6Bp+DPW
         DP6+EQhbYIhDwyHnxEWlxAcR0ekvgdwmsRQnSbkwOB9E+ujSvaJf/nI/17jYmYXDge8n
         I8CJ/e549Wvb5Vr/MdEHWLHuMP3brdnQFdCBCX+4Uo1ELXkHEEl3HsHzK9DF38vrap/M
         12M13JQYOf28VzwFIE39/KIteRF+80fIH84akwzotW/8kwVMsBihCjWa91BYJRZ8eWlG
         QpdR8EpMaJpHZN/pxqT6CdapeYW8pRitJbK1FuOgEouHBRfVtkYekEBOTwXSyo8dP1x2
         xAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496185; x=1772100985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcSCzwxqg7VWiur4dwM2dEy5lv+NIQcB10C1LX2/4m4=;
        b=XV83ZiXRoZCOZWopsesq5hiX0LKpeYI37qWSScWEeT8MalmGUsFGAKGt6C0qOnXmQI
         WzOJhdj3yKKsmx7ofcBMDctwGr6HLdPyplDnIN6QdPJor2FA8xbtFJVy9thDfkzoXuB4
         +KZf8vetaypy5QGurYMw3OiCf5o5lDC203l8PstePZb1n5ExRBdXA59Xrbd06KbsOhnn
         eF9st7I4VdA6dBLHTVNJvx0lRPIkc+ISdpX6fxWTH3/p5OHd6nKRs6Ma66O3STJWPJEZ
         8RxJYC9UFtRQaLfyuttifPSTahBnkip6IOHMINUM4CenxEfyP7hRA2OiW5P0Dp2n4ZTi
         qhOg==
X-Forwarded-Encrypted: i=1; AJvYcCWguA17lJDnYx11ag1cCbihu7YETD0CEywKqYUujKwsTODeKiTIcZGnv/a40072LCZoPZFYcXwO2N3a8WLvFiUa@lists.infradead.org
X-Gm-Message-State: AOJu0YwFdQfcbBb1iE2ZUcjO2LyuSCyH1SrhzgHAeh5U8Jl9blhwzbAF
	yeH/juMnZa7ixT+5y52EE61797kGdlIIdZo4S1ORyGNtMdGHuXeE5dVgVts9k29yvgs=
X-Gm-Gg: AZuq6aL7Kj1GynTe6gD5Kabv428UeaxvCxLvF74PCz0CVyR1tcbyA4rzsf2C/cjlkoJ
	b451+zR+D+TvQqNNQv/flf5iNf/iMDCETLZ9LSa8BeimH6Xv9mNNXXvmOa8efvtkInYaKXWfajl
	sep6PDdsZll9XO3V3/Uoyqwq3kZ8ZLd409nhZ7cDZw4BmbK7SHSzOKKEgnjEj8y63M7Oug3XRyj
	RcjFfRvDk7FjGfrJqi4C49cALBH0lUs4QLwvyFXWfaNo2IC9kFzl6m5Q+NKaggJaZOk6MOU82Pi
	Y9CRD1kv2/eTeH+4gMxsyl7HtjtB3uNbDgsVwOmBI1Edy9C1Eubrmy9Xaa12UAJvvXgofyofYQw
	zOWWe6F1AySSeJ6pTDUugmWSkNHkADCW/yF08NRZNeualypfOhV2l+gXFcbJaScR3CsGcYfV/E6
	o9BZ5VD1URVJ4l1zQ/4yb9MDSgcXepE9dv
X-Received: by 2002:a05:6000:4305:b0:437:68d5:f167 with SMTP id ffacd0b85a97d-4379db9859fmr33226037f8f.44.1771496184734;
        Thu, 19 Feb 2026 02:16:24 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439567aad3csm14050703f8f.36.2026.02.19.02.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:16:24 -0800 (PST)
Message-ID: <17020b22-6e80-49a2-8890-b16917586b49@linaro.org>
Date: Thu, 19 Feb 2026 12:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 1/3] firmware: exynos-acpm: Use unsigned int for
 acpm_pmic_linux_errmap index
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
 <20260214-firmare-acpm-counted-v1-1-32af5735470e@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260214-firmare-acpm-counted-v1-1-32af5735470e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_021627_856969_FFE753ED 
X-CRM114-Status: GOOD (  15.89  )
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



On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
> acpm_pmic_to_linux_err() uses an unsigned integer obtained from messages
> as index of array to map them to error codes.  Array index cannot be
> negative, so make that explicit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/firmware/samsung/exynos-acpm-pmic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
> index 961d7599e422..44265db34ae6 100644
> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
> @@ -41,7 +41,7 @@ static const int acpm_pmic_linux_errmap[] = {
>  	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
>  };
>  
> -static int acpm_pmic_to_linux_err(int err)
> +static int acpm_pmic_to_linux_err(unsigned int err)
>  {
>  	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
>  		return acpm_pmic_linux_errmap[err];
> 


