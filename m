Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840BDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 11:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRdSg+ES8rqgc/LyI/xNmB9YhTxqTSjvA2Sa1o6EE/k=; b=OYxvN31MJNuaQ48FBB7ivVfkal
	zNgwrxSfhCf+MN0ZhfIyVZ6+kshN42JHl5d4D3recj8xnuOxoQvYgHRKwQbQtj7J7XIP0hfmd2MkJ
	6lskoHaJLNEOZ1ko7IU++9ub7PtecPj+3+rmfPY0fgc66b0wfTo/tkWN2y/jwC4aXlJZ6SV2NT1i6
	OsMGL+aCviYSg50aRozxf+h/J32Q5ef/1JuDvhM68pulUNSubBdyS9HEi9QECztTtzpNfvT5LpswT
	zuwEOEZTvHSINWYQT2DmqA9yijvpnPb/T/+zioVG8tZKmhuxSrV1KDEdG9hZJ9zBGHKCxOo6HocrB
	OGRFQtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEtl-0000000CyGZ-0nQG;
	Wed, 28 May 2025 11:24:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKErc-0000000Cy2G-2g4n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 11:22:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a4ebfaa623so67025f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748431347; x=1749036147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tRdSg+ES8rqgc/LyI/xNmB9YhTxqTSjvA2Sa1o6EE/k=;
        b=apDL5JeQAJqqAWZc6lP4KFgwY031cC5KOOFAFI0kqr9FRw+4EPVrAtmF49XhnKSKUK
         AyXMLd9xOghhcGe7enoU9VOXIHY9RGUS1bCcSADljP8HeoeuhHR6V/T84tP0hHJW5Abw
         fuZxF46R4sFNK7vqDXRTXv02easam16ewqOL8EbNsp+CtP362whjVOulN5+fHPEmR06I
         MhP5ljJBzhqfBBjYea6foB0lAwtIIJX04qHUFDYwKbPd1tK16lYuF++EIqPYxvsgPhF9
         yNgvHsSkg3NLkY9aYW0vbqIqnoakavJ/J1+D6Jp6I2WLPuw+lIMh5oe5r5fbi+6Qk5Y3
         xOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431347; x=1749036147;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRdSg+ES8rqgc/LyI/xNmB9YhTxqTSjvA2Sa1o6EE/k=;
        b=vyMERL85r07+80dZHONfiFE/hgt9Ld6k5/4jNtdhNA6jau+Rn6EXqJGmxSTCcFV3iK
         ZtOcUdcjh1oDa3AamL/38hIcgBp0mJ94CKQSJN7cDj3WdTwthnRLazlR6qVsaOCtaNCH
         k/UpJwr+fWG6cVs/DXScPMxjIGaAQcV2f97AffLQDFw0hFYIgLz+hyAA03Z51TACY1e/
         0at9eb/R9KnAxsQHsnojcOG3HJ51d6EvEoI4fY9ldTYP15J1GHPifDYwSv9SjLRgOeYh
         Mu0M6WNnTdgU8Iuhpb4y68y/qM79ugvkgeYFU1AEYAfcadQFGCqnnkDWpfHJsaDOKriq
         xuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr0KlV/rl5t05Q2ZzXFGGVCLC1KOkIx/Jzm4UPbgA2MkF3uOcjSqEyFIesLAg6vbu0C0NM3E+zcHZS84YdY4bf@lists.infradead.org
X-Gm-Message-State: AOJu0YwZVFuWE28T3na11X1mkpFm+DOv8aFpHGP+j1AoFTFKXV6LH9ej
	+m6OtYXUsHjYaZtvxg1hLjnJrBHoDbWrPd3W0SXgsp1EPhbK1kLnuXlBbokOInmfn7s=
X-Gm-Gg: ASbGncvhN4UDAaSLIfWJ12wOv0aWsjO9MjZUbGcdXc1sgGzx9IFWGVPCOQBvJYjgTzr
	7oFoxXPoRqxQtiw3Lwb+tkgP044PXbogY1tGvwQ0LiaLzmTOQxqPeMSEQVi9/cddeisHOzvVpol
	bfY3SyWrIMnhMYItMSIWBcK0IzNgyAU6okL5rbBw2/zh3YHvCpPhWeMO4ZbDb+15ShhJQsBsSP4
	CgVq+f0BNYfkqBW7Da6mPAwVw3Vf5BPCZnC5EqBc1sKHz3R27Gyi75t8NMo/pgEMLNqpEb8Jzpr
	o0UgIPasjb6Wf/wo/OME7xqQomUm8AEuP9twZjUlZZb209ANQV6RTO/t9xZRmFqn3qej4Pw=
X-Google-Smtp-Source: AGHT+IF10Djn/+417XqgzjwYR53SwB6YsQXDnUYQvUgzphkE8hm7GNKdlPw/JrJhOZ3z/6T2T6Nnmg==
X-Received: by 2002:a05:600c:1d0d:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-44c934e5f3cmr49189875e9.1.1748431347165;
        Wed, 28 May 2025 04:22:27 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4509a0452f4sm13604245e9.28.2025.05.28.04.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 04:22:26 -0700 (PDT)
Message-ID: <71db5dad-de6f-4573-b764-cba5c28e271d@linaro.org>
Date: Wed, 28 May 2025 13:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/9] arm64: defconfig: Enable BST SoC
To: Albert Yang <yangzh0906@thundersoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <lumag@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Taniya Das <quic_tdas@quicinc.com>, Eric Biggers <ebiggers@google.com>,
 Ross Burton <ross.burton@arm.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ge Gordon <gordon.ge@bst.ai>
References: <20250528085459.481424-1-yangzh0906@thundersoft.com>
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
In-Reply-To: <20250528085459.481424-1-yangzh0906@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_042228_695431_9C09AEED 
X-CRM114-Status: UNSURE (   7.68  )
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

On 28/05/2025 10:54, Albert Yang wrote:
> Enable BST C1200 SoC support at ARM64 defconfig
> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
Squash with previous.

Best regards,
Krzysztof

