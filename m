Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEA4C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2BE4IFNraf2nwb+gMN6BrLPdvxjK4GMRcC/zeJ//7Y=; b=XEAHQNDgcreAQEiW1fkITcJIQi
	W2tQwoPTyHAw0VJn07cVtPmqSYTYftAsZi5WvuqwR7ken73I5V2RP2Ho+JxkJEWXMEdQ+G0IxosMy
	Z/k6ma09lJHMZo4gfP3yKbI7wT9GTbqnsnIZD6njiyvsqLXzJk7ip0x9krXuY2tjUXzl7In/bqbd3
	YeRTca43/q84a0sDx4IgvHX8y35VuC9P4/lnAVXHkqrpol4I2mI370jt+sb1oElRGRsCELYMcXlwh
	W/71pIgzYWbdfbT2LK3zjFInCoCrDE6dbwaF5QZokpMrZ/zmZTkkxQBo/k7EoQjcxevT8LqY3ORI8
	xaJucfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KpH-00000005dF5-2pu9;
	Mon, 28 Apr 2025 09:30:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jbt-00000005N2Q-13Tt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:13:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c14016868so4336043f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745827983; x=1746432783; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2BE4IFNraf2nwb+gMN6BrLPdvxjK4GMRcC/zeJ//7Y=;
        b=dIhRSR176g03jzVNRI+iOGeVgGYZBJQDURVonyJIGqtjtxle/4BYKAqN4WCjSpHorq
         p3Ty6Si1z6O0hQR3c5CXSDWHw9EoaKvx2aDQM3AjPX5YW1sNsQ2t/8q69LuEwoT8QNBU
         l7mcEvCri/iYiilLcesINvEnatAoX5CHembKmtLXQjZp+378NzghUZ3Y4XGzrREjut1v
         ErjUSLwc6JfBPDiZkjgK6ogwG3sdIWuex57xofuNT/QvYjVQWL0+h9gW41Pxcplo06so
         SaLwWcekpEFmUbnnW1UxYDpr7+GqPyy6OEa5ejv6bT2ZyexcWzuzaOlzixnEPkGWN+S2
         85hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745827983; x=1746432783;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A2BE4IFNraf2nwb+gMN6BrLPdvxjK4GMRcC/zeJ//7Y=;
        b=bOTF/EdZXyw+7YnyNZHwYc0zACayYzHjHYzR3fif2EdvPmihJUJpXNg6FJSJiqtuQ8
         jS/VP6ldtqWzFtporitDVKdzYqymAFnvXqA9VNgVI5WHa701XUvaTdBS6K+OLEN7v80X
         vITJvnqblUHRzZ+0Nc7678/lGI7r67/gdLYkTSNq59oiaqldRiv5HANB+qbMcEwYF/fQ
         qI3Mha+eQ5wYxJkC4mmzuyCdDEPLCx/O4uFvawRYGQt6+DqXPplxgyLXFMMkD0o5v5yj
         3eJNfmuVDRbCILlaZCR3HmG5Ja8NqMEhkDdmVxvUUEmBnD61FD0p9x/57/dkn35lyWKS
         lezw==
X-Forwarded-Encrypted: i=1; AJvYcCXI7SQpk+ooBe3f2gUrk87xMmKJWark5zjGbwibDuR8VaRyL1hFaBPuFo7jF9RhvMgv2le8G+2U+3Wh7hEsM7TM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz158G+ilh6zhHG732F41OvHb8bb0hSphjn0SRh4wuxEKZP7X89
	yjodYFb9mR6pPT7SGmQA267ByKGtvzuDejFFPeTmEbZoaE3B2IgQJwtTWcADNs4=
X-Gm-Gg: ASbGnctW9O7ug3ArNH0eRqRH3XW+Oiwqp30LoabjkiomvIZQD3uCUvAgyFGTKf4y/kK
	eNxUH+zF0/lfk6mjasK49o3+zu8Y2nmvFb6vsXsg7IJoULIWitVwzrxJhNJurUzqOdzTdrUW+RH
	Fan3qGb8nV55kGHRkVRcs5scXY9JLm09BNsI9SYJOvt0kiWdnbnMG24470w5PB6Ad1d7yuWnk44
	l2MmurRrEUZ0+OVxtIV++KKcAfVeDkcqU6c39hwAprVQ+bhhFPZ3RijMFvtb1qX+tUbm57+Yh9q
	ceoZBJoWDkJIkuns3ZP4GP0cr9okX7JVEt7jbddf2pvfNi93spNhIVaHB7Fd8LxnveviFVegdcd
	K+zzZaxgkVAWNB8+x5g==
X-Google-Smtp-Source: AGHT+IFirYO+R6cxa4E/PxDKxv2Eoalg7DNOh3n5z36BXYljdt+Ef5dXthwTwXbfPkkn6KEjfC0prQ==
X-Received: by 2002:a05:6000:1ac5:b0:390:f0ff:2c11 with SMTP id ffacd0b85a97d-3a074e146c6mr6922171f8f.2.1745827983497;
        Mon, 28 Apr 2025 01:13:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442? ([2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d264sm10609868f8f.95.2025.04.28.01.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:13:03 -0700 (PDT)
Message-ID: <449cc46e-fab8-401a-b887-51d621695a1c@linaro.org>
Date: Mon, 28 Apr 2025 10:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] Baisc devicetree support for Amlogic S6 S7 and S7D
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
 <a175ed1d-9e57-4150-af8f-7ca785203108@amlogic.com>
 <e3229c42-b322-447a-ad1e-86c6f20dd54e@linaro.org>
 <be8b7874-1251-4ba8-9243-a615517861ab@amlogic.com>
 <eb1c3442-6b86-42e9-a672-eaba7de8b375@linaro.org>
 <32473413-b2fb-471b-b2d5-b4fd7914b57f@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <32473413-b2fb-471b-b2d5-b4fd7914b57f@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_011305_307700_19AB6437 
X-CRM114-Status: GOOD (  16.40  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 28/04/2025 09:57, Xianwei Zhao wrote:
> Hi Neil,
>     Thanks for your reply.
> 
> On 2025/4/23 15:23, neil.armstrong@linaro.org wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hi,
>>
>> On 23/04/2025 08:15, Xianwei Zhao wrote:
>>> Hi Neil,
>>>     Thanks for your reply.
>>>
>>> On 2025/4/22 21:49, Neil Armstrong wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> Hi,
>>>>
>>>> On 22/04/2025 13:45, Xianwei Zhao wrote:
>>>>> Hi Neil,
>>>>>     A gentle ping, thanks.
>>>>
>>>> I'll apply them this week except patch 4,
>>>>
>>>> so can you send patch 4 separately since it goes via the tty tree ?
>>>>
>>>
>>> I will send patch 4 separately.
>>> The following patches(5 6 7) can be not included for now. Without the patch 4, the command "make ARCH=arm64 dtbs_check W=1" will fail to execute.
>>
>> I know, but since it's reviewed, Greg KH will pick it for the next release so it's fine.
>>
> 
> I have already sent patch 4 separately. From Rob's reply, do you think it can be picked up together?
> 
> https://lore.kernel.org/all/CAL_JsqKD=yespd0WM90VBr_XWdppimzDzecmwNfGMV+hNSHuRA@mail.gmail.com/


Greg KH picked it already.

Neil

> 
>> Neil
>>
>>>
>>>> Thanks,
>>>> Neil
>>>>
>>>>>
>>>>> On 2025/3/17 15:16, Xianwei Zhao via B4 Relay wrote:
>>>>>> [ EXTERNAL EMAIL ]
>>>>>>
>>>>>> Amlogic S6 S7 and S7D are application processors designed for
>>>>>> hybrid OTT/IP Set Top Box and high-end media box applications.
>>>>>>
>>>>>> Add the new S6 SoC/board device tree bindings.
>>>>>> Add the new S7 SoC/board device tree bindings.
>>>>>> Add the new S7D SoC/board device tree bindings.
>>>>>>
>>>>>> Add basic support for the S6 based Amlogic BL209 board, which describes
>>>>>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>>>>>> booting up into the serial console.
>>>>>>
>>>>>> Add basic support for the S7 based Amlogic BP201 board, which describes
>>>>>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>>>>>> booting up into the serial console.
>>>>>>
>>>>>> Add basic support for the S7D based Amlogic BM202 board, which describes
>>>>>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>>>>>> booting up into the serial console.
>>>>>>
>>>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>> ---
>>>>>> Xianwei Zhao (7):
>>>>>>        dt-bindings: arm: amlogic: add S6 support
>>>>>>        dt-bindings: arm: amlogic: add S7 support
>>>>>>        dt-bindings: arm: amlogic: add S7D support
>>>>>>        dt-bindings: serial: amlogic,meson-uart: Add compatible string for S6/S7/S7D
>>>>>>        arm64: dts: add support for S6 based Amlogic BL209
>>>>>>        arm64: dts: add support for S7 based Amlogic BP201
>>>>>>        arm64: dts: add support for S7D based Amlogic BM202
>>>>>>
>>>>>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 18 ++++
>>>>>>   .../bindings/serial/amlogic,meson-uart.yaml        |  3 +
>>>>>>   arch/arm64/boot/dts/amlogic/Makefile               |  3 +
>>>>>>   .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   | 42 +++++++++
>>>>>>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 +++++++++++++++++++++
>>>>>>   .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   | 41 +++++++++
>>>>>>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 99 ++++++++++++++++++++++
>>>>>>   .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts | 41 +++++++++
>>>>>>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 99 ++++++++++++++++++++++
>>>>>>   9 files changed, 443 insertions(+)
>>>>>> ---
>>>>>> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
>>>>>> change-id: 20250221-s6-s7-basic-f300c30877e6
>>>>>>
>>>>>> Best regards,
>>>>>> -- 
>>>>>> Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>
>>>>>>
>>>>
>>


