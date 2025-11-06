Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30638CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9EJ31BMFRtngkVvmruU/yNAGPhyHC0PLxcC8cP7CEo=; b=qzfW1IY/8qbiqKxjADVioSl+LM
	HsUolclVp1Ns+2xKgzoY6c158WSyLXVA/jbqwfMdOdmpCkVrq+79lBM7zwvxhrHrYn/IjXA/nKRxv
	4h3Ys+8qP0eY3788zN/z8Z5Kb7Z4TNjnOtuUANgKk96GUDnok+Sn5kG40mVeF3FRVnkXv6IsvPtwP
	vsPSCSzQxA+7LouX4vDSzcxIwUv9K1dVV7hJRuLZE3vILzdJZ5zmmoP0PQHrDSHkXCTG8NQQlepQo
	5SQKQcbTt8Az8o/63qGrxhhCWuDNPQ0C/OhHIasrNOnw8FdMcbMYl3QqHnZExImiMG9KQj55VojrY
	LVONnk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Mr-0000000G9TQ-46ml;
	Thu, 06 Nov 2025 19:09:57 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Mo-0000000G9SJ-41mM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:09:56 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6411f1c4b4fso232178a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456193; x=1763060993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R9EJ31BMFRtngkVvmruU/yNAGPhyHC0PLxcC8cP7CEo=;
        b=xT76xf3BEgmjI2kVBCwKh5lznjG5EoCD7g2rcSXfGpD8PwFse2kcRffcx+asGTCx2i
         S7QBr+hAxY4eXLApjJXCTG1ssomqbE8clLznYRN/qm0wU2DvFgo0VRRi3ni+b2+Y81zl
         j1Z3z/Kqrfp55uKOJqXApJovAe4Fe43rlRlFmoMYKF7nEseLg9KnYhcXwReVMaMZMmZg
         5Q4MaNLyoJ6zIuxmRrfa3hHtP3RXfUY6MiPHK367OTYB7kDinlsgsg0W2AoS0xmq23Q5
         cqpD+TrCBCUFI95q73yTNxRZegl4EJByN07muIeoeof3iTB7VkYBU+4T9Ad59PwTtHZI
         lYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456193; x=1763060993;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9EJ31BMFRtngkVvmruU/yNAGPhyHC0PLxcC8cP7CEo=;
        b=i2CEtTbvbnqpF0qs1hJHNm9DH1mLIq7PDZTUlQAxECgZVMbxHKpaAvVnQsRgJu7H+9
         jhrngOPr4eYau4vR7pURAkSlK2c5ulnOVzUCe3Gt1G/zGXH/cfv3XpJCF9PjwRs1J8qc
         qteTYGopInXuZqENROWphjxvq82T8pRGwqTPwu9LRVSpoFF9kJHwhTteAPu1ROLRPcV8
         Yzn01AQwJIF/SO1/xJF5wxU4j/YMHBzXPTw87dcLiamwwk8QOskz01cMbkUQV2XB03vj
         hOyzONr+sLN5jP2YUTq+hDHNtL27hZ1jDo5+zPObqRZMCz9zZk+ObxTlnPxqd+brlHBK
         koHw==
X-Forwarded-Encrypted: i=1; AJvYcCVo/rqJkSoERhlt1bm7Z2+6Z42zhyw6zfN1ok8sgF0QIaYXH3atlh+0S4XBZTvBNL0tsDObiS8OhzoPgadRzqN5@lists.infradead.org
X-Gm-Message-State: AOJu0YyQhoC1tmR2tEcxL4qNXLt7jWp6OUga/O8WOYoDerwXu5Kx21gA
	c2st21kUnWneejKDViGme0bKGmxXQLE+is19lNj79QNRomJZnMBipARpya7S3fJrZ3Y=
X-Gm-Gg: ASbGncuJ351UIAwQgnOFfT5yp4PRKnB1abkFJD8Dd+5beSH+26E8dMWXX8zPobZXxCN
	+t1hgh4705sBc2r3an5qzYrkKAk/8ujb3E8PwsdXksb0tHlTzPHnju2xIYDD4eNo44yEF4ZvVl9
	T5iFwvgVcH0iqWAUYVwvW3neIbFoQjAaknJNI6ZwdMbQ7c29WKsUxurPPoLMKDUsu7uUEIMbm6C
	3n+dv6Bjl7DD7RmMd8p5ifFpenDHdidcNgwaLRh/SFcAVqofidgE15qJ6kwYz5yB6XsxhhWIsuG
	Ar4Kcz1nD+ST2/YxcE0JqlCxxf8Z96Bn0soCzsuajLIg97tLVPQ7hrqm0FkiTv+9PJ6/1PcUvBa
	On2+8BspNvop2mx8Rza9liuDNzlOR0iTuM+dm2UvBhW2pRYdq3h926bSsNmTnoztN3Wt/7Nj2Hn
	K6WpmXeznWT8BXEH3LvaD4
X-Google-Smtp-Source: AGHT+IFLScIgFbO18qAgFVJ4C/yYi8kKG+DOMbXda6TV5rCC9yt4KlAUStwtjX1SD2b25R5SQ9YR2Q==
X-Received: by 2002:a05:6402:2110:b0:640:ed50:c1e4 with SMTP id 4fb4d7f45d1cf-6413f0efb7cmr263574a12.3.1762456193188;
        Thu, 06 Nov 2025 11:09:53 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813e9fsm2419923a12.16.2025.11.06.11.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 11:09:51 -0800 (PST)
Message-ID: <d17ad0cf-eea1-4d72-8b02-2f8172ece8c6@linaro.org>
Date: Thu, 6 Nov 2025 20:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] crypto: artpec6 - Simplify with
 of_device_get_match_data()
To: Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, "David S. Miller"
 <davem@davemloft.net>, Tom Lendacky <thomas.lendacky@amd.com>,
 John Allen <john.allen@amd.com>, Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com
References: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
 <20251106-crypto-of-match-v1-3-36b26cd35cff@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251106-crypto-of-match-v1-3-36b26cd35cff@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110955_023773_A75A4771 
X-CRM114-Status: GOOD (  10.79  )
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

On 06/11/2025 17:31, Krzysztof Kozlowski wrote:
>  	struct device *dev = &pdev->dev;
> @@ -2853,12 +2852,10 @@ static int artpec6_crypto_probe(struct platform_device *pdev)
>  	if (artpec6_crypto_dev)
>  		return -ENODEV;
>  
> -	match = of_match_node(artpec6_crypto_of_match, dev->of_node);
> -	if (!match)
> +	variant = of_device_get_match_data(dev);

This needs cast for 32-bit builds like it was before. I will send v2.

> +	if (!variant)
>  		return -EINVAL;
>  
> -	variant = (enum artpec6_crypto_variant)match->data;



Best regards,
Krzysztof

