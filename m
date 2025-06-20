Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3635AC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 05:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59PVKiZdXIvx7Cm+uTcu8gotYU98Sb4nyV+OyfABkNo=; b=kkIBbiNH2T65X29mn58XBN2FUV
	7V0EtsRKgHnRb8z7IxSfbOk7o5fFBiEYjJ/zuOUOeBjubFGLvsGx5qehjR55SupJFq0KsFoQ3J38L
	hR3v3Js8megClxW8/rgySFCv8y+zBwUl08h+GO8mwVTQZ9bf8i6ixg+pmXZwNAI4U5R+MXpkMWBCc
	FXTMZv/l3I46Wy5MLy3cs87lsFggBaFN/r/LY/u9AzhxZKOBXsJMu27PepfNI62ffOkIqSbdfSrKQ
	WTRgK8BIYdfpeXhPI+CmgjI6JCnLc/O7uD5T8HYGRO1rwI+5LlAM8xsCzr2lLbHgW6TXMdfB8pvO0
	j+EtU0/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSUly-0000000EpHf-45qZ;
	Fri, 20 Jun 2025 05:58:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSUhy-0000000Eomr-2ems
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 05:54:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a524caf77eso242230f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 22:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750398877; x=1751003677; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=59PVKiZdXIvx7Cm+uTcu8gotYU98Sb4nyV+OyfABkNo=;
        b=fCPbCoeq3aZKsr1nzw1vLKko3kUL0xnGmsqunPpHcu+NBuv8U9l9KeLkOVLAIgrO5g
         v6X+70RKE7mGV4a27me9c4P8PnFNwE9EWHwbUrBlWsD0G2HIWNJv/bqgvVuLBQGGaZRC
         euNqecN936s6mViNxsHFKq6yqZhyPWmj2zlAr2025LBQO0qs26VdvkbnzltLsHxctf1m
         xYmrWKXBOWTFzs5NZCAtiyn2eOH9BCj/KITBHU9CCbHFRbY1p4Pl5kd5XdCkMqOGMlXV
         9acUteEEj31v8swXMG/A0C51Xbo0frow8hfTOFCqWsCdEoBPOoahv1TFcVd08g33M68p
         mAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750398877; x=1751003677;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59PVKiZdXIvx7Cm+uTcu8gotYU98Sb4nyV+OyfABkNo=;
        b=CEyzyP9NyOmUz0zqL/mP27fXyjn46C0/MAapRYTIvjoCI2ErRW1ewpJrmaXvXbjTw7
         Jti1Yk6S1Y/Ndp+xNmT587ZfVpaRksmwdtdXI6gdrKqiUranHza9V8uN0RtO8VzqjkGv
         vdqfhaLFQZGkHRorgfwVrmUTSKf6sP2Ms0kIikMCF5e16N2nnT4rowbibX8PhEyXcQck
         0vQCril0a959wygitZEBv7bybFEX779ripVitpxCfw8oHrc8ZzB7Pv05Lu0CYPWmLss0
         PEa+mOvaE0tr2gxb7fdtMrXqx/QIpdxbMk3CPMWEK3u3wuwCBG9j9jTmopk8skRkTJ4K
         MyVg==
X-Forwarded-Encrypted: i=1; AJvYcCVU5y87zGqhN1Rgc51yhKwvVoNxffdk1MPi5LfNOpEUSCZYFXLtSLc/sS/NEqlEOWbadRcI/NFpUXh7SdHi8Enw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9K2CrEQKSDqEC91VheNHnsO1zwFsaFoKeFg4cWIc6mVU3bxA4
	B3H7xgpaM6UrVGvDiKrUtYefF6RONW5RP8T5empQXl/P+0FGaeQrfjxcxDJrziXbvZQ=
X-Gm-Gg: ASbGncvQXti+4nclfglIMgbr4abSm1Uir5bKhQOi6Haouqt2FKURICHngz+x3i3dK3V
	wzb0arXb0HFT2ERCRhPkVCJZqE+t7TKvP4iofZA3P5q2FTtqPEwyQDe1dd8p6m4sxtHo/J0481p
	/V22Kj8yMslQrXKIQmqy2hev1ekMKscvcSh0N4vsu6TI4e936P/P0taS++qM8dUm9K98/enT7CQ
	Vxj0ka8FeF8B0Q1pfaHxuuxobyRQebgdKWp3jBkUZSVy8XqTpWiXZn+EuRlMGDyqOGTCUSOtOv/
	8+Mpq09/GEQdfLmc/CGJDsKcyWuM+v1YNeorYKB9MS4G9F40xtMCUtX5qSLsmDGcmolVADR0GHo
	qepPmR470pxD7ZamlvQ==
X-Google-Smtp-Source: AGHT+IFcQ9MmxABcUgAA17Z5yhG8GD3yrVleUWb+QLqjuwBXbS596eXv/4SkhKPfSkMOcNjj8ogtDQ==
X-Received: by 2002:a05:6000:2dc3:b0:3a6:d30e:6fd3 with SMTP id ffacd0b85a97d-3a6d30e73bamr180338f8f.10.1750398876754;
        Thu, 19 Jun 2025 22:54:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1057esm1135424f8f.10.2025.06.19.22.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 22:54:35 -0700 (PDT)
Message-ID: <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
Date: Fri, 20 Jun 2025 07:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ming.qian@nxp.com
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-1-Frank.Li@nxp.com>
 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
 <aFORokzx/sImgDtA@dragon>
 <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
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
In-Reply-To: <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_225438_676357_98C10CE4 
X-CRM114-Status: GOOD (  11.14  )
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

On 19/06/2025 19:16, Nicolas Dufresne wrote:
> Le jeudi 19 juin 2025 à 12:27 +0800, Shawn Guo a écrit :
>> On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
>>> Hi,
>>>
>>> Le mercredi 21 mai 2025 à 13:34 -0400, Frank Li a écrit :
>>>> Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
>>>> are backward compatible with "nxp,imx8qxp-jpgdec" and
>>>> "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
>>>> wrap and all slots together. Reduce minItems of power-domains to 1 for
>>>> i.MX95 and keep the same restriction for others.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>
>>> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>
>>> Krzysztof, will you take this one once the DTS part is ready ?
>>
>> dt-bindings is the prerequisite of DTS.  DTS patch looks good to me
>> and I'm waiting for dt-bindings part to be applied first.
> 
> I was waiting for sign of life on the DTS part, we usually get some ack,
> which is good sign we can take the bindings.

Such process never happens. DT bindings are the prerequisite here and
platform maintainers wait for bindings to be accepted before taking DTS
or even sometimes reviewing DTS. Why even bother to review DTS if it
follows entirely incorrect binding?

Best regards,
Krzysztof

