Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95100E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfwQCCBu63aZTVhOZ4c/EiZehZjukgRMOTrP7C2cC/8=; b=TfRooBfwyBIyRlGkGQfFlRxQot
	btyAXqhHDy17f/YEe4dwWoal7F9YpzJ/1dpG4XegHIQb6oM0v3YXp/fqw6PBF2P72SQ3rHSe85p+3
	1TygoJEUSkI4dvyWk9dhjSMZoD92CgbU82CI9OQSzExdFhmF7TXUIqwXxI5zbQWx45ApotkCy+0L+
	ol/KpQ/oWKpKTrGDU7DLmEdPOLs1gzgf0e2BtzrhefH60xwwjFb+7o4OH9Vj8zE55LlA79RyNLOyk
	oE80PnHsT7eVZTLM9ka7a1k7GGeVzllMo/0J3iAiV/3XHxklzNQLczisYfd88eJa9vaaUgKUtcrra
	5O7I53Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0Zt-0000000Ennu-2pNR;
	Sat, 04 Jan 2025 09:36:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0Yh-0000000EnfD-3WQn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 09:35:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361f09be37so20176205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735983302; x=1736588102; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tfwQCCBu63aZTVhOZ4c/EiZehZjukgRMOTrP7C2cC/8=;
        b=DOm7bgDPxFzjsli+okTvzMGCD6XoV5cgNg/aUhWdZmndWZfTENOq98iIi/ToWZfepz
         dTi5ZzYRXYxvoCwxidzQwmG9uswMUs0S/zMPJ5iVimWMqnEqnoPZAuTlXmEBrFHnv8SX
         mj4oK2OzRzk5oRUvsKQXqsUP9I1j5jsmGmd+JkRLgh4vRvDuh0+rHXFCJ8ojkdc+cRxU
         o86DXNHl7FbiS/Z4bKguoCXC3+fa7WHqEQ/tdEg8/uJojZSXxCn3rPyKK9UbawiQ2DRu
         FGZAKOMPEu3e4hEtM9+bZ0gMaDFZExQNEfYltLGr+aqR1LYHsgAmn3UQ4cJl2rlFhpKr
         eRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735983302; x=1736588102;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfwQCCBu63aZTVhOZ4c/EiZehZjukgRMOTrP7C2cC/8=;
        b=Sg8qIeX4SlzVeNdJpTdLzdoXaQZ36b0HJ923Lutleb+6zG1aEsa1EWDmbmdlkfu4Q2
         omtTNvA18IsCyeCTQxDWMrG1KtJSq8sc9ycYzlgnA+lP7xKisMKBtRwj954Z+lH4WTyP
         kgnZ8KNNjI9y1PtAl2XyPIBWuUvmvMuXdZWMfpduFSv3AFT4Hr88F3BUkNViEWHFwynf
         zIBDVUvBOI0VZZRbucnp8PbxqBLKI1wHFXU9OxIFnN4r4SSdgpEp5RfT8rpdyZXxYbyc
         LF/gtZiIUc5Ovw2qWqpEDR+v3LscWDKq5t19BlcasMm9/wDhnTOvuXV0vAQS58R2LaeQ
         Y35w==
X-Forwarded-Encrypted: i=1; AJvYcCVtrWnIiSn9lA6n0MCuMHKrtj7LZkwy/28ue9L3MTznt5kQTMIhMOXoc6mdIHzCTxn+SrdpGzWAT6sWRuwcXBNc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2PEz2Ofpi8Bkhy10or0kao1LMuT53qBjb3v8M1Gbymmsclica
	UGU9+d5PPB3RHxPg3gPBE8Uk3MUeizqROWVD3GcjuFXLqROd7xVRLWbgb3tPwMY=
X-Gm-Gg: ASbGncssIUB3jxNqoW/8rbSsct97rNsSapJdkfsgUpJLqjfjTP9TLjzypmmkR218a4c
	mz0TlyqvdGOVTKV97ZqzaR7krIaCMIKA6o3O6wM13ZnU2iQPAjRTFJn/JrV1bONcz8n3g57cZtT
	6UYid+jBXNtKR5yfQQFOeudfJIWEBBeyqdT0PFveQA6/w2qljxXYxRur/uE0DIOb5HChQTxoQx4
	KpcWC2Uy9640ecy/0xD9g+1W3wFWhmeBgrdtctAZMJtUE2WD0WzOF9xBLrOkjk1jZbeOhu7370p
X-Google-Smtp-Source: AGHT+IG3FGlzh0yaJot++IsAzOuMcup0/rVdO0ni0icMoCmRYddvSjFlUUcahxyyoJSviClT6wmdLA==
X-Received: by 2002:a05:600c:3ba8:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-43668b8fd2amr168430765e9.7.1735983301759;
        Sat, 04 Jan 2025 01:35:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612899f0sm508109245e9.38.2025.01.04.01.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 01:35:01 -0800 (PST)
Message-ID: <d34f1e9f-7a27-4a72-b706-12e3175432ac@linaro.org>
Date: Sat, 4 Jan 2025 10:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
 <20250103204523.3779-2-lukas.schmid@netcube.li>
 <pvbpqlejn6r7yjzufdmialyvjlmitusltb3ljhwstxbtoglf6q@7tvjz6neolnp>
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
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
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
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <pvbpqlejn6r7yjzufdmialyvjlmitusltb3ljhwstxbtoglf6q@7tvjz6neolnp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_013503_891574_C3576316 
X-CRM114-Status: GOOD (  11.84  )
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

On 04/01/2025 10:30, Krzysztof Kozlowski wrote:
> On Fri, Jan 03, 2025 at 08:45:17PM +0000, Lukas Schmid wrote:
>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> 
> 
> Repeating again one of my comments:
> 
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also 'scripts/checkpatch.pl --strict' and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.
> 
> Please implement all comments.

My bad, I did not write that hint earlier.

Anyway, your patchset - all four patches - has multiple issues so you
need to fix all of them before posting next version.

Best regards,
Krzysztof


