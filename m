Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08062CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 21:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hybfEz1ih63ikoPDM1Ar1esaLuaGhNzZj34A72ctWSg=; b=2Mir0ZmpIesdP6Xft7QND384me
	GqO4FFLMcF/jQtLxCxJ8us6jCTn43haoUVpujxlul3ExwANLp7ZmTLE3qgSEULOe19F1X5sfXmaau
	orm4BIPtM0dMlBAt33FCGKLHyW0/CS/ScMf38mq6uHFMr9vWwOHIvuHapvZdymrowExRuraJdYwkE
	PmT6kLc30+G29YVWDA8mrPwr5Nod5n62JPg0rGQ92fJVmOFuix7/aHAUOt5GMzjnw7f7ALF6XfSFx
	jjameN3LAi+afR6DgZMihlHYwtPyqOHxMdESaFmFOIZQaloYNEEvfP+reK0pctcE9FgdPrhaWKy3b
	1D4Ydx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTSn-0000000BboQ-2Noj;
	Tue, 19 Aug 2025 21:01:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNLv-0000000AlBv-49XZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 14:30:21 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-afcb7ab87ffso84555666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755613818; x=1756218618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hybfEz1ih63ikoPDM1Ar1esaLuaGhNzZj34A72ctWSg=;
        b=aLHM3cOBMVIndiXw1KAj/b/F9dK/g/K35X7sdoZg+c9J7ctU/kWeEL81SxPnHCUy3G
         PatZaVCAXSsNltAPmGZb/4pChe8tMjM04IeIVEx3saTGtmUHh2iMM4bnUw4IMlYoygi8
         yyv63lFScvLNGJdvI0maUw2fBo2YX0qZqcVF0ujKagBYHxVJX0bGreJiDiX3ebPjQQB7
         R8sGa/7+KWNFwYTimyUv6PfGKguFsWZynbzw/XNfDYnPYquLwt+tZNOsi0NJEI+nDTSt
         ufpZNIULxoTSoNtouJC2GQKZrpYDT1dOMBgF/t8uRPf0pmrzuURHo3VGgwiaZ18o8FJ/
         NuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755613818; x=1756218618;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hybfEz1ih63ikoPDM1Ar1esaLuaGhNzZj34A72ctWSg=;
        b=fz4MU4dgnoeiwAXUIsmnMl2mMqhs8+JvcAEPXG2YZ2qvwZA8gdowsuq3X+RHkd2VVY
         afoR/12gmTTBrHJErR5RRiWYIW72iggId1SDKahv1YT3AdqcwIiG/fwVyu9FMSEKV4N1
         f3Md2oECAxws3DzRjDyOTMgNWbyp9gVL2agHoJDZEFljx71vp6HeddXRQtQPuAgOUPAg
         p+v1aSu2ZwdCAOozxNJZHURCBxstXnECngybs40rp9OGBAGg3L6tC7+KzYDmgoskxhO7
         3VHTXVL97gCaFk3TOauGFUL+v3TzQ2MznIwNNeh0LUTLihprqotKuHm+ZIMSGSrwJVLV
         jbdw==
X-Forwarded-Encrypted: i=1; AJvYcCXoeZZNQrinCr/JbUg0Aqa9t9fwqbmaIXyGpU5AJVhCntN/OIprQEWR6R/XaVXuwRC+nzm2wFukNUSxgsbAMV0h@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq6k8ee796pgcZgOeogu/YNK4boL+SImxRXdAQjUO3gZBzGQoc
	l2x/ylZBSisdtVA1gfxfkI8SFZPdL+NlJ952DZv0g5mz0xnlykX5uJiAOU2+5K+ctlk=
X-Gm-Gg: ASbGncv9QISXA8n7gAvKXqux8IZJYQJSCPdin04IoEgoYooPgDGVxtz+MCMS4i9BCQF
	jEShDRSkfjdv/ik/EGJlhZ1ufW7jLDUrt3f5UrrHEPruJ1JURAmVePKypF9JBtwsDfVxrz1si01
	GmMaUQ7BMqRjGx9OcMzTv+fpfSx4UvKczqfOay3s/+aBNThmpZKP/z4Z6FZzXPesV8udZYdTTOt
	/j2YmmiHGwTqVwllO+uD0zHk6yQp5wYyftCvAHkHT2eoIT5/xWGOkPMrI4u84rfcyh8K7PMGS2W
	JuVhtuQkMq0/7kB/9UgVM6godvuHCzFHP3f5djx1nQYZKB8AX7WrTvK0rLZ9T5IKX9Rs1FWGOHr
	XGKDSaIfUJEEFPMCinRsSTboRgKufGbx3RDoYPRohYBw=
X-Google-Smtp-Source: AGHT+IGKPmRaGgK8HMhsDrZZpgNZ2uaUF2T2I9/ycTbkOOLbzeT+kBHZXU5Q5tFNqRz/MeyRprIvDw==
X-Received: by 2002:a17:907:3d03:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-afddcb63ca0mr111993566b.2.1755613818281;
        Tue, 19 Aug 2025 07:30:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1031580566b.35.2025.08.19.07.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 07:30:17 -0700 (PDT)
Message-ID: <b4d322d8-b55f-4345-8d9b-8efa4e9b76d7@linaro.org>
Date: Tue, 19 Aug 2025 16:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Minor whitespace cleanup
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
 <20250819131800.86990-4-krzysztof.kozlowski@linaro.org>
 <aKSKIkUTyc391CYS@lizhi-Precision-Tower-5810>
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
In-Reply-To: <aKSKIkUTyc391CYS@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_073020_043333_FDAE4F9E 
X-CRM114-Status: UNSURE (   9.83  )
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

On 19/08/2025 16:28, Frank Li wrote:
> On Tue, Aug 19, 2025 at 03:18:02PM +0200, Krzysztof Kozlowski wrote:
>> The DTS code coding style expects exactly one space around '=' or '{'
>> characters.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Please kindly trim the replies from unnecessary context. It makes it
much easier to find new content.

Best regards,
Krzysztof

