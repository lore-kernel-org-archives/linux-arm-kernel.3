Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A16C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJGS5GdAP2jwMN2asFwop/bmwWDSIqO/lnl06Fno7WE=; b=cvK+e3g03KN3HEICq0rVUgtz6K
	XCxmogXWlPznUPJMXkC4XusgQ2L3JdNQ5oqATKRQaZMSpC10V53Hvy6XQWjfo0044sxSHCb8ZDnNN
	IytrKYUzxgrKMqGhdY/I6POZWg12ej2g1bNOS0V0T4uFVyDlzuYvWOM+jf5dWwPGSn7MOcm+ez1LZ
	RnVQ/lXtUosOz23H2j/r99vEjVHHgjnDCBmhnJtnaZPMr7tMfBWGS4rEngzqRlesuIHBq8tzHFeVg
	WZXe+ubzmH4Z9RJIInVEWb2iU1AJu2VgWntzSHsOQlJnGyxmyamFL9xII3svLiwnQoawAkR5Fbj/I
	tMkiAUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAsJ-00000001tFY-2omG;
	Thu, 22 May 2025 18:42:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAmh-00000001sfl-0pUo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 18:36:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a35c339e95so1023570f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747939009; x=1748543809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJGS5GdAP2jwMN2asFwop/bmwWDSIqO/lnl06Fno7WE=;
        b=x2hk9ByyStdYHJXaCJ27btLkcgt6hH55D81+sXDZefkTrigkClqXLQUXhrhbaqz/MG
         dRpR8KQh7rOY7CQiDvHanya3bxKsYUCuDGPnYREPULx7ptVywMY+NpDUJIiSBs/V6nwp
         27P7by0yeuku+lS81HHhw6kpZVrlVwRCc9pY/l3hxC8UzqbNvgyn2nFNYTk5ceYqi1xv
         3VZI8yMb78+ozu4J35u+beUVjOj371Kdw8jNgRJihQqBT2jJvxeTsKl25W3Bed4C3NI3
         bqt2NHSWbhh9Pjl2po8c6AnATo2whszaxK1ffP6XwZSh1qcbvFxeeAjgCAFCc/q8yFoz
         bt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747939009; x=1748543809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJGS5GdAP2jwMN2asFwop/bmwWDSIqO/lnl06Fno7WE=;
        b=oIwZkOCtS3pUSHkrO164MKr0g5F0L/REvmG3UxgGdzVcLc5FT8/8h0UTmqWWZQjyY+
         EyDzbXnmUUJ5SAoLiT9KgYETHk2Dp9WLIwItI7O4muPA+74Lx9WBeXFcePCkA1Lx9xlL
         WaR0fbGBhnmAJGDnqib6hIR0ZQXWWijOwsniNFFqCwSZUTxcCWOLGXbstnIFSF/BjTu5
         M87FvFOeEvy77L75pw+Sy56RXKYp6Fxxr7oDwO1RSdxOGrQkxAcBdo/hFxBJfRHeWeSf
         8WysH/tDnVM5YqX2dg8/ewP+LltUdMogA8EHlpDWzRHouMcHBmHc0cDTU1wc6kkcCsig
         c8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbFC2xzEWYuFcmsdFfrKvKX4X/YJj5lXD0XyPVom6EtCZ/RPURIR3RM5A9iHOsRIvvnlxSdKt7Bj8d5sjK7EI2@lists.infradead.org
X-Gm-Message-State: AOJu0YwDlhCl6TmP+AwDvRiV8D2dq1vB1xy/YxBoMArpL55ZPVy0rAsD
	nj+1pLYfrzoz2hymcw1W22kcTiYy37Q7y04znQGp8yXknBWWPct4vTdhSizzIVLF51k=
X-Gm-Gg: ASbGncuO4i9a3w11AdsYbh1YPmuflxJu1kUee0fLt4yjUmiEV6oRy6DEE/G/PGoJKdw
	ftgQargejhViwJ5rhoSyZ4UuaE0x1O6KmwEU/aEUF8WLY+CwRvDmXc+ucFN1w7fCmrrjVO6zHWk
	koNc9JqN7SOLJhxen1VEgH40JY7KKdAvKr36AIjSc/XyGix6PSa7MojQQ0jQ16l9dUvTljGQDRH
	wgqLZVhOUfhIz6UhCJcwbdm0caImDwhiPKgdp5hoRI+JHrtUnpcYT9T1G/INZ7nqUDB4yDHiE95
	6nGFMv2b9o/lOALxbyF0bznVio1BFIgXjtR+dvu6eXw+P4J4fJoAauM8Tyk9NY6GHXyDTHs=
X-Google-Smtp-Source: AGHT+IHR+WLXCmN0YpGsXVAMyTrf5qwUXOqpxWzDyNHvcgpM8sHVsTuYa3Mt6GIgso9ohbfhoLilLw==
X-Received: by 2002:a5d:5f47:0:b0:3a3:6a3d:163a with SMTP id ffacd0b85a97d-3a36a3d18b3mr7521239f8f.12.1747939009584;
        Thu, 22 May 2025 11:36:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b295fdsm120822505e9.5.2025.05.22.11.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:36:48 -0700 (PDT)
Message-ID: <3cf3f029-f56c-4ea7-a10d-ece09fdbb2b0@linaro.org>
Date: Thu, 22 May 2025 20:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: stm32: Fix wakeup source leaks on device
 unbind
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
 <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
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
In-Reply-To: <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_113651_244082_35FBE1D9 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

On 06/04/2025 23:17, Guenter Roeck wrote:
> On 4/6/25 13:35, Krzysztof Kozlowski wrote:
>> Device can be unbound or probe can fail, so driver must also release
>> memory for the wakeup source.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 


This was almost two months ago, got review but still did not reach
linux-next. What is needed for this patchset?

Best regards,
Krzysztof

