Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FF0C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ND/9PBI/YCdvg4euUorct1cNUM5u3eXjAVZKzvHwQM=; b=R2/Rl0KJeLCC79TbJORadZgLOk
	uLYKWPkVAtzI751B6ASapplukgp3Ln9vocNj/kzFxc7kyMUwZZ8yf3K3tJJ9g/T+VWPYstuvpJvbE
	zCha/lJbsSaogMEsZCwtJ5tD4+9QJTlFcJ4slI0WIQLvu16seqynf4o8cmoYasgXmtAPAcTyMn4Pd
	WXb3y/rxI/RY8souGnPjHYM1DQ82w2A9bOtGRdY+dJGxyZYHbUnBO5iswVwF/Pqrf70Of6H/TdQX6
	SZh1yOrqYcWm1pNkNxPhw+TL2BEXMSMTJaagw4kShWcItKSWCj9AEbp5yLXvt9iMc6EJf2wVmUAZu
	l5f6RTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAKX-0000000BPUE-2KtZ;
	Thu, 20 Mar 2025 07:28:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAIJ-0000000BPHW-3ovQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 07:26:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3996683dd7bso61292f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742455582; x=1743060382; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ND/9PBI/YCdvg4euUorct1cNUM5u3eXjAVZKzvHwQM=;
        b=qBns6HtAGaWomGJzW7gWYS6WeonFKdpcyCohy5VboiK/fOkxKOwBXB6Cv6n6dd/e/P
         fAePiqrhGtRieSYI7Mo1szXW2Bdr21b81oyzNJGJEznzLfDC9AQNxB5m9cVTaEWXvhXT
         1yPPdh4I7TaKqyfEDFA/uQB0fwFdEh7wde7+IMsXsL5oKvOcsf6JQN/M276FphMSYKdB
         t/zT9iD5V0aoHmrNAWHKPxpDq7gAmt9JSCHossP+HfWqW+CTBupzjcD3S5baobk05Kzp
         XqN6nMxgXBK0xgSVxRsxUnmK9EpsNIOHWTHl7hsSUrCG4hBmaqBBUZcQKO8PvS+o9ogs
         QAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742455582; x=1743060382;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ND/9PBI/YCdvg4euUorct1cNUM5u3eXjAVZKzvHwQM=;
        b=iwWu0nSjBuwRq1CCmvNv53ZUqP05PpOY8XqFVOs7YjwmeuY7z3f/ljunsQLpqaMD0D
         trxLGwKdbv72qGmSeBQvIM21T5DtOMGAIbe8BzYKCe782zAOQHBxEMvbLiLYS8uI25FH
         KW3bZ5QAd31aTgytreChAFRNbbY2bozQHelUwdxB7tcN3efjFc1afcSP1rGAhk5jHdYq
         ebqolIoiUtlAiKjZSkgjFtJK+oO/BdRJaY5wWmpFC3BR6bDVZss9B9K6IPQ0fHiObTqP
         T3M0iv0RWyosKJ7jNCMNxzbxuKGrKbCAOPzY3ZSM0Cyn2mVneyS6hV9w1jPKV7yxpNx3
         7lTA==
X-Forwarded-Encrypted: i=1; AJvYcCWzrhmGmECn62QW35sbFCqZUMLHUbwpaVvwdbxuNBAP0rKhDu5HFYRsu61y75Sm1nPAu0JQSVpAS8+oC7tA/VB8@lists.infradead.org
X-Gm-Message-State: AOJu0Yya3evhIguq9aKWZ+fvs6JfoBSXvlj0QoSav7WUl+xkhf1gRECX
	0jkIAThD/oJBXKSGiS+63PqVfaeMnNMvhYgIvzwW4qzvqjcdGNoAg++rIbMdp6k=
X-Gm-Gg: ASbGncuglnwSBCQN8m1Ik0CLR6aAWTKDRzV7Yf3OP8iX+tyJBhSAQK9JZ9qwtJBoaXR
	N6dyry6ZAYjUy5VDYFlJktU5rtnG1fMl/Bv6Mwf3T9FurEp5y3AwmjMr1DdWMY+Btrb5CHvjfuP
	ql8/uUS6KQiYonMdwVTF2G6ugfVESQAalOvtBdwIWLwfGwE0KK7wzy2lQQArVbOMBFXoNA9TMD0
	uPQVnMw0LlIhSJGJ7tZKeffX1LaJHNrv19Bu+0WTD9Z57C2XC9mhDIt1itud4LyxP4kva0yZldn
	S5DOF88b+5ufOzbaHJfbMdJJbCeC6BhVFzHr3JOHog5GnfNBKKVkulG0BYsm0FJCcS+n7GiKSw=
	=
X-Google-Smtp-Source: AGHT+IGb95vY8nBsA1JEFRE5a+DX/wv5efFdVsN0XNBo8btgTlnU2mKcx2lqxAoydFeAQGEw8xmFGw==
X-Received: by 2002:a05:600c:1c88:b0:439:9909:c785 with SMTP id 5b1f17b1804b1-43d46f6afbcmr16886635e9.7.1742455581881;
        Thu, 20 Mar 2025 00:26:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3978f185c6esm18862073f8f.94.2025.03.20.00.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:26:20 -0700 (PDT)
Message-ID: <e41292ab-3911-4031-bb91-ad458cdc5691@linaro.org>
Date: Thu, 20 Mar 2025 08:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.15
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
 arm <arm@kernel.org>, soc@kernel.org,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>, Pengyu Luo <mitltlatltl@gmail.com>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Danila Tikhonov <danila@jiaxyga.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
 Nikita Travkin <nikita@trvn.ru>, Praveenkumar I <quic_ipkumar@quicinc.com>,
 Tingguo Cheng <quic_tingguoc@quicinc.com>,
 Cheng Jiang <quic_chejiang@quicinc.com>,
 Janaki Ramaiah Thota <quic_janathot@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Lijuan Gao
 <quic_lijuang@quicinc.com>, Luca Weiss <luca.weiss@fairphone.com>,
 Mark Kettenis <kettenis@openbsd.org>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Rakesh Kota <quic_kotarake@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Wojciech Slenska <wojciech.slenska@gmail.com>
References: <20250317215921.2031880-1-andersson@kernel.org>
 <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
 <fe56b19d-6ec0-4b0e-a47d-9e4dc8d798a5@oss.qualcomm.com>
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
In-Reply-To: <fe56b19d-6ec0-4b0e-a47d-9e4dc8d798a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_002623_954813_2148D8D5 
X-CRM114-Status: GOOD (  13.90  )
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

On 20/03/2025 01:27, Jeff Johnson wrote:
> On 3/19/2025 2:10 PM, Arnd Bergmann wrote:
>> On Mon, Mar 17, 2025, at 22:59, Bjorn Andersson wrote:
>>>
>>> Krzysztof Kozlowski (17):
>>>       arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: 
>>> sa8775p: add QCrypto nodes"
>>>       arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: 
>>> qcs8300: add QCrypto nodes"
>>>       arm64: dts: qcom: x1e80100-slim7x: Drop incorrect 
>>> qcom,ath12k-calibration-variant
>>>       arm64: dts: qcom: msm8998: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sc7180: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sdm845: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sm6115: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sm8150-hdk: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: qcm6490: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sa8775p-ride: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sc8280xp: Switch to undeprecated 
>>> qcom,calibration-variant
>>>       arm64: dts: qcom: sm8250-elish: Switch to undeprecated 
>>> qcom,calibration-variant
>>
>> This seeems to remove the properties that the drivers expect
>> even in 6.14-rc7, so the branch is currently broken and I'll
>> skip it for 6.15. Let's see how we should handle this properly
>> in the next cycle, since it's too late now to fix it.
>>
>>       Arnd
>>
> 
> The driver changes are in wireless-next.
> +Johannes will you issue a wireless-next => net-next PR this week?
> 
> Seems like there should be a way to orchestrate these into v6.15.

It does not matter, it would not make history bisectable. Just like I
explained in this patchset, it should wait for next cycle.

Best regards,
Krzysztof

