Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3566EC7114B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFS+tzU1PTBVNIbgbt33HlW9jxX0q+T17o5SHXqVTL0=; b=zUob+pU1C8UsLSMzfCIxP/DzkY
	G836GWXaeC/kBAK8dQSaV8KLQOayCoc9v9v/l0G+JnSHiHQUvZrhNEPLcWI+JDsj4SIcXJF8rxvRN
	xJylls4MsgbhBGJO32Ak3WMjIabfNOFLMnabWejArSi6Y3kHb13DDGscoLZpZXqdxzwEHGb66rw2G
	RhtOYUbMqu9YyVNnyB3TpvWnr/yTciz3E8tBZhON9/XEBsDuuMEjkk94o/fsFiOZqHvRU9D3LAQv5
	kVRTK0pqFXizkWdTpXYy//CUiNT3dh+z7fLedNcyeuhjrtNxPgqM18/oATC5uS4HSkQhWGaZB33VQ
	sCwnIwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowR-0000000EXJB-28uG;
	Thu, 12 Jun 2025 20:54:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPiFZ-0000000DVQ4-4C0Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:45:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a524caf77eso142633f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735948; x=1750340748; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FFS+tzU1PTBVNIbgbt33HlW9jxX0q+T17o5SHXqVTL0=;
        b=JriGkDcG7+TNpiSm+tV9aE0OEjXhz8NGrFVsvx3XWkw8n5AgjVr6XXfhaR6dUiBCJu
         0MuCuzsvJvbJ84eSzdxkcibG2/TIFBpER+t+TXH7iARXF4SdnnBixlVpGS2K/XgGQbFv
         DwXVEhWso4QYVxp/nyUG8mHT+nrrBozYAhXVCdQZD0pGvJljw+6v/V9IiBoJVFaz0lXG
         vE+lNBgjafpeZJXCEKvAVC3UmADy1jROr7ZxQd962GqsrwGx2XWUDqnDccy595C4NHfJ
         cVpMjVyl+M6lIW3kaufkgV/pbjRar6Wj83JgVdcSUOxMgdp+/eV9sKI42LT182UX/pAZ
         NZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735948; x=1750340748;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFS+tzU1PTBVNIbgbt33HlW9jxX0q+T17o5SHXqVTL0=;
        b=LE92BSP5xAOt65e6xi43G62R2kKOLNo/JCWrWxR7nJcUetCOe3HyMuCGaWgkWL9ACR
         8C/hDmy9GICMA4HOVZg0s8rjBxBegIo78ffBBR2JqbXYbTS6r9yOkn44kYZsD2u8mjTZ
         9rFHNOV0iW/vYFL1eloo0Lz9doeSOj2EzgRr2KY0Bh9amtqDSZrDFlWsyD7XoJr8+2xL
         mC0nIXPgEajjIKkfP0voBiRxzuoQMxEr4tFJbebOvxcQtB9Rk+mferpeMAcy6A5eP1b1
         kSGFPJmpMVtc/bKR40j3tPOW6d1tTFI6gr4BMybFwOrCPZXGItsaOWOJQnJNPMfMQ8ag
         /f9w==
X-Forwarded-Encrypted: i=1; AJvYcCW/Waqovh0Db9TS2PF/6gkKeq7RZyZEAMac/1G/lqdvtlRBM+vSi5yR9ie7vN+HbFuUoU1RumZ4UHKM11w/e9qM@lists.infradead.org
X-Gm-Message-State: AOJu0YwrzFljQnFhXJ7z9IsxJG7j94JExhngKFJE6hOr56YbLK+ITE5/
	eDWRKAvPSTAkedm/Q7rttvazdnKCMtGAwctMOEkjj5opoP8cBdaMiJpySfnLC1GjLZU=
X-Gm-Gg: ASbGncuESPRmvb9Eymqy4HhInLfyW4BV+sguokvNWkLdMAwzG+684E8GxJHyQElqxYY
	hY88BFZR9PRtwZKLCnpkwYTc65OUyDw+6CfALNjOc8MVsSW934AkLB1t8znFdzdiIwC1G1VuYv/
	Z+WNJDdpVoAivhP+swYgtTIWJuZq2tIR5uXwSbgYiORIxI0wDGCXXbRi+qYbUWoHueD2qe6EyCg
	G8/CSS2pDUEtC3uOWFLSxWAq6bTSbwQ/4t/7K70RP7atNiTz58RyBnfkluRD/hLQD9y9/+vVwuC
	kQz+7DAWx7jCo6kcZWpRBQKQaXzWe+tdCJLwy9k7HLXHUvHhoHb/WjE//icbVxf/9Hl6DUCfpOh
	DvM9p9k4=
X-Google-Smtp-Source: AGHT+IH4t/UQaGFpHnjGNvxWJ6BkPEz48jvJdMiP4Iqu7ZDfUHh58OSY9dXNCy83MVYJ4nUOMm6V5Q==
X-Received: by 2002:a05:6000:2303:b0:3a3:61ab:86c2 with SMTP id ffacd0b85a97d-3a5586cba07mr2265575f8f.7.1749735948418;
        Thu, 12 Jun 2025 06:45:48 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5619ab86dsm2022108f8f.44.2025.06.12.06.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:45:47 -0700 (PDT)
Message-ID: <a92820a9-50f9-4127-96f4-47fb5715f441@linaro.org>
Date: Thu, 12 Jun 2025 15:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
To: krzk@kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 asahi@lists.linux.dev, linux-samsung-soc@vger.kernel.org
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_064550_042257_087BB18E 
X-CRM114-Status: UNSURE (   7.86  )
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

On 12/06/2025 15:44, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
> 
>   vmlinux: 152864 kB -> 154528 kB
Opposite...

Best regards,
Krzysztof

