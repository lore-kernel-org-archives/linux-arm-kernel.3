Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178B2C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 07:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4BBxO2Q/J6IMxfz+uEtm4Q1azghcdwE0iVwsVnnKvk=; b=L0XuIVFoHgkb96oimYdjzZAAAu
	+9nb/AyFvnSzSqOZAG6pvj0VBNHIhVnXolzDtw4TjdpVTs56oG1SqcXqOKr1lUBO7J/ewreBRIXyO
	K17KCgGbVl42PqX4VJxFddKt7xGOTOfprf+a446M2zFF+2m+9PCB11ufimFsRbW7aYJ7yzL+8Q7E+
	zaxB4Bp6aWyBG+KiXEbilE9sjmIlwZAj98cORTZc3JABC0SBFUglHiTtFaq4jli+cUcR1i9ZENkB6
	yGTzomjVkY0dd2PGCXbW+mgzRdHw830E0Hi/wx1rv/WSaVmAZPYrk15159I10f63WbAhrlb7zRSC2
	hACBwSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4E52-00000000uMl-3sym;
	Mon, 14 Apr 2025 07:18:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4E3A-00000000u5h-3uPV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 07:16:14 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so2425038f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 00:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744614971; x=1745219771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4BBxO2Q/J6IMxfz+uEtm4Q1azghcdwE0iVwsVnnKvk=;
        b=FzPZaujOFPIqR/IDGIW3TWixzRk80Ja4OFd6KHDGS+wCY6jvyXed8qSOLF9oKTROuS
         JdkDbEP1bp7730Pd6ChrCf4uOEmrR894HWTkKNXP1TsyOcU/9lxWXucG0P81S4ejwxJf
         1jzQ36bC+LShNCNVs0wUZiO3ltn6vlSHgA69QGnMJH4gfqyLFiFPJfEMyLysWXTP9ljq
         5cRKNmb17XauI93F0pOYH02wE5ta3iTRHUHyHLUvx5inCQMTzqEVbhqxyj7Sdz1tpYCS
         BuezD/iHf5P+cyeLAHkKFiMJWHi58fS0jt+R9AJrKWjg14jzBINSibrmpWGJ2Sb1W/ot
         mgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744614971; x=1745219771;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A4BBxO2Q/J6IMxfz+uEtm4Q1azghcdwE0iVwsVnnKvk=;
        b=Y8yAMRHODPMXM/fGkU8DGteBqWvVcfgt+MIsaEglXdUphEfV0HeP5rCB0PsHEr/QB8
         YkB78sQVtPOQzro2FDd56sMUQ3PiOplLPGBxk/hShOIUGOAgk1jGfQbb3xD/aIHlzYOO
         FtNplv1dqyVMCaltUf3xzeM998O8leNyYerY73LF/+HaVuMikAriAflXPr8GXpqsl2jV
         j/k65Uezuz0+moCdF4ND99Yb3dHOlPFDRpHLuVyOvQk4fEzprQVI48vsGhOWrpBNWFHX
         RiWPHSZ5klucmlk2n1cXnI+AJrmZWsZjZqZ+uWrLrDszbVXnlUmyJMNrtWrih2vaL4WC
         r9qw==
X-Forwarded-Encrypted: i=1; AJvYcCXG/UMwknsqKi1qFku21I5P8iQaf2HfIXI+Y/rMcYeXbV10ai/E/H0B04GDPDvjlz1xw8IIdkUSNFbjPFe6QW5U@lists.infradead.org
X-Gm-Message-State: AOJu0YywFVRP92WxDKX85Kz8kvuFadGsKepIpkteuSG005+Ei15kDT3S
	gL+HM2Eg2I83kZdruNMbFBzf6kxdaarp9MPjMatyVY6v6OPOTId+l2o0rZB83o8=
X-Gm-Gg: ASbGncuSkRyGf4bc5TuvE9Fmb6qhcgdxot6VpwjRUNn2L0vl5lcD9MnQ63xi8Ov9wtn
	y4vubOzyHIo0DE0JY1qyCmTz3SiHmpOPOQZoynG5RGVsBEe2Pp6Bxw7bA4f3ztu0+KwwbitOi5W
	hvEqhwPrHPsvovPpNlSMSJ8V3d20cfvPVb2dM6MtKfFMF2P/9JjJONPFAheXYkUl2PVn831RHRN
	uTxCgxcV9YWs0cglbpBJKVIKdgaCqZJRIoX0JiJe+HvdqNAr6Gp3jqDkej9PdO1/SuYJHjVStQA
	k8uitq1ICtnbfhJ0HcciTKzTVkE9bSj/MV+UbK+FUoVE6bQ7YxFiT+n4v8M+Lxgon4udPehdsmN
	L/1Gvdf1i11McyV/qlA==
X-Google-Smtp-Source: AGHT+IFk/4b/d6EUYjjExv4IiKLoJZUz+hd9IYDUnYI9Yd0PRlZMBINesye58HTjAx7nVixJNpR1PA==
X-Received: by 2002:a05:6000:144e:b0:39c:1f11:ead with SMTP id ffacd0b85a97d-39ea5213077mr9016322f8f.26.1744614970477;
        Mon, 14 Apr 2025 00:16:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c614sm10221879f8f.27.2025.04.14.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 00:16:10 -0700 (PDT)
Message-ID: <576f0726-d238-4c37-8dc2-481df67f8fec@linaro.org>
Date: Mon, 14 Apr 2025 09:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] spi: meson-spicc: add DMA support
To: Da Xue <da@lessconfused.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sunny Luo <sunny.luo@amlogic.com>
References: <20250408-spi-dma-v1-1-3c38be62c09c@amlogic.com>
 <c29a8c28-996c-4e94-b0a1-0e4a37f0bebb@linaro.org>
 <aebccc51-14a2-40be-8d9e-20a55ce94459@amlogic.com>
 <d9d81cb4-12b4-4db3-becb-4578548986b2@linaro.org>
 <c9f0ca5f-17c4-474f-8370-fc0c83ac9093@amlogic.com>
 <CACdvmAg5px00er9TUd6_Nhr1GoSf=6LK6vSWOB-YcC1Ve0NRQQ@mail.gmail.com>
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
In-Reply-To: <CACdvmAg5px00er9TUd6_Nhr1GoSf=6LK6vSWOB-YcC1Ve0NRQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_001612_989355_109CAC81 
X-CRM114-Status: GOOD (  20.42  )
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

On 14/04/2025 05:56, Da Xue wrote:
> On Sun, Apr 13, 2025 at 11:14 PM Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>
>> Hi Neil,
>>      Thanks for your reply.
>>
>> On 2025/4/9 20:35, neil.armstrong@linaro.org wrote:
>>>
>>> Hi,
>>>
>>> On 09/04/2025 03:49, Xianwei Zhao wrote:
>>>> Hi Neil,
>>>>      Thanks for your reply.
>>>>
>>>> On 2025/4/8 15:41, Neil Armstrong wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 08/04/2025 09:04, Xianwei Zhao via B4 Relay wrote:
>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>
>>>>>> Add DMA support for spicc driver.
>>>>>>
>>>>>> DMA works if the transfer meets the following conditions:
>>>>>> 1. 64 bits per word;
>>>>>> 2. The transfer length must be multiples of the dma_burst_len,
>>>>>>      and the dma_burst_len should be one of 8,7...2,
>>>>>>      otherwise, it will be split into several SPI bursts.
>>>>>>
>>>>>> Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
>>>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>> ---
>>>>>>    drivers/spi/spi-meson-spicc.c | 243
>>>>>> ++++++++++++++++++++++++++++++++++++++++--
>>>>>>    1 file changed, 232 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/spi/spi-meson-spicc.c
>>>>>> b/drivers/spi/spi-meson-spicc.c
>>>>>> index df74ad5060f8..81e263bceba9 100644
>>>>>> --- a/drivers/spi/spi-meson-spicc.c
>>>>>> +++ b/drivers/spi/spi-meson-spicc.c
>>>>>> @@ -21,6 +21,7 @@
>>>>>>    #include <linux/interrupt.h>
>>>>>>    #include <linux/reset.h>
>>>>>>    #include <linux/pinctrl/consumer.h>
>>>>>> +#include <linux/dma-mapping.h>
>>>>>>
>>>>>>    /*
>>>>>>     * The Meson SPICC controller could support DMA based transfers,
>>>>>> but is not
>>>>>> @@ -33,6 +34,20 @@
>>>>>>     * - CS management is dumb, and goes UP between every burst, so is
>>>>>> really a
>>>>>>     *   "Data Valid" signal than a Chip Select, GPIO link should be
>>>>>> used instead
>>>>>>     *   to have a CS go down over the full transfer
>>>>>> + *
>>>>>> + * DMA achieves a transfer with one or more SPI bursts, each SPI
>>>>>> burst is made
>>>>>> + * up of one or more DMA bursts. The DMA burst implementation
>>>>>> mechanism is,
>>>>>> + * For TX, when the number of words in TXFIFO is less than the preset
>>>>>> + * reading threshold, SPICC starts a reading DMA burst, which reads
>>>>>> the preset
>>>>>> + * number of words from TX buffer, then writes them into TXFIFO.
>>>>>> + * For RX, when the number of words in RXFIFO is greater than the
>>>>>> preset
>>>>>> + * writing threshold, SPICC starts a writing request burst, which
>>>>>> reads the
>>>>>> + * preset number of words from RXFIFO, then write them into RX buffer.
>>>>>> + * DMA works if the transfer meets the following conditions,
>>>>>> + * - 64 bits per word
>>>>>> + * - The transfer length in word must be multiples of the
>>>>>> dma_burst_len, and
>>>>>> + *   the dma_burst_len should be one of 8,7...2, otherwise, it will
>>>>>> be split
>>>>>> + *   into several SPI bursts by this driver
>>>>>
>>>>> Fine, but then also rephrase the previous paragraph since you're
>>>>> adding DMA.
>>>>>
>>>> Will do.
>>>>
>>>>> Could you precise on which platform you tested the DMA ?
>>>>>
>>>>
>>>> aq222(S4)
>>>
>>> Will you be able to test on other platforms ?
>>>
>>
>> I tested it on other platforms over the last few days. G12A and C3 and
>> T7(T7 CLOCK use local source).
>>
>> My board SPI does not connect peripherals and is tested through a
>> hardware loop.
> 
> I can test it on GXL and SM1 in the next two weeks against a SPI
> display and some WS2812B LCDs.

Would be great, thx !

Neil

> 
>> cmd:
>> spi_test -D /dev/spidev0.0 -v -s 5000000 -b 64 -l
>>
>>>>
>>>>>>     */
>>>>>>
<snip>


