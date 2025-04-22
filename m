Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CCFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xd3/3q1AYSo/JYqDVTQPa8vVX/K5QL5ZbX5wE8VPDqY=; b=QtPiHJKr4yoib4L4RQNUh/3K/H
	nB4iT/H7OKjAY7mHuo3bx2WC9kps9Zf46bNWxNEAEq1aKYL9+QoOXqmXexs/VhNKB9HDp1ccEw0vL
	IErMKj6DRnFYDwY+uNl6vUzSNXCyjHu3xXU/mBrMDO0VOn/L7Jpme3YcbtYfcXhi5prB74+l6rwZr
	4+p4xsEFrdz8WKIghZpA4sOor6iQP8m8JsmOuilG4NDWgZ84yelLoXlEOnUIzCW7uKfLSykXMlAOI
	hsCoCMhQGO4YEgfWHK5CiCLzhy7ZP3K0BcpYHtPUUlNJgxVSpXwhgoF5YIWLC5/DOrb8yhgI9D/cN
	+udtMIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78D3-000000069RS-0vWH;
	Tue, 22 Apr 2025 07:38:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77ar-000000062z6-3IZe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:58:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2788840f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745305135; x=1745909935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xd3/3q1AYSo/JYqDVTQPa8vVX/K5QL5ZbX5wE8VPDqY=;
        b=gky7qy5w1WHFZjCiCglkA+oTiDvmTqLIUw+pajNT8CI7sbXT5PvjAgTrsjEklLBOLy
         EfGpgqfe/+C3uIjPeiNA+ZfmllEQ9zdL1E0HoBm8Talgb2kR5kgN2xtWhMLtZVC3UH5Y
         FrkT3UNa45tKIRSyHuo/W9AeXOp6WCanCTNI29RojKOOcj/FtmPGe7xqZP2hkKrRW7Op
         FvDR4SbEGmq4Whjq1keHquHK8wMR60cP158Z4rZWS3XfZk6r/jW2Nkbje4vVYPc4pVYL
         WN5zgjLOWn2Xtpu4d4ct+2b6cXrbp7qY/ZOtvrR1Cec4KgJemLf4H1gziWASMuqsPa7l
         JlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305135; x=1745909935;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xd3/3q1AYSo/JYqDVTQPa8vVX/K5QL5ZbX5wE8VPDqY=;
        b=aDJIfzkRRyK0fH5kE6n4dqvmgDJ/VIIRR9cerBc+FU4hPBGMbMS3JLmJv0w6u0ZC+C
         QfZZG2JBkgNGa5xcQpH/6WISk2KfVXqBZoVNrmZXifIFq5eZOld/wQQRn8JrSfkwBaIv
         yMRpR7UVsrMu+l677kkGxjXo/w3NMgZUnPJ1g/5wESjkbeUDay+JUOFHP1OxN32Djw4k
         oiY0KPp4LrOM42dAWBeWr4sQNwAkjOab1846+PIej2I+HHtMgtRQC9rSSZ+d5ddyw2NU
         903FtpR03/HSiaKmnDj1wjf3xiZjYRJnE8j7vwM7FeSw2oHM5rh8uBt1Vog6NG9912cj
         APRg==
X-Forwarded-Encrypted: i=1; AJvYcCVKmgJZb6f7SuSxa/I0oWCBZVIa3QUJLvM63NlK9vinq+oDqbRXK+z+Vmleu1hoGy2LLX8zTc3VberZSxiUCUKT@lists.infradead.org
X-Gm-Message-State: AOJu0YwHeUm4+3VHvNaEO/FNqmNy2zOYaHJvph5rUsr+gx8FOkj2cBvl
	8E+lE7MP9qL6mrWx/q+/fEbSeaO2e/GMzeaqDjI5P5Jrf1bTrPE4tEGdDL6K9rY=
X-Gm-Gg: ASbGncsbmjIazD1Norx8oL0Kff+YOPudvH++nSdbmrhpaTF5gvYb57odnN5uHKjW2O8
	+mOYATu2LZwZyK6f+75BFnTVm68Ne9ZQwv9WvHxQpT7VqA226WkPsyXzf+dz5KDv5Swk1juSRzk
	+H7tSFLbpmdUydEJMiqVITVKF+WSf4uSwv2aN0jXuLUBxNDHwMCvKRz8W2tYkZ719vpHj5yxRZ9
	1W8F/RwGhGNbkKXE6jAWm7XDh3GHgKlI6/9IKa9KCPaSKWpfS7qNFqCorZRNzy3vBGHkb74NhWW
	owdQJ7ihmsYU4dF1BED+C/zWYvCQuSzjrFjMxIC1jwBrmT8xqvahtckEpuTibcRlEdzv5KS61lL
	yEbSz1yTr4t6I44aP4A==
X-Google-Smtp-Source: AGHT+IHbDFXF+5+LP6/HjCP1JYYnUemqwmt6GGZ6W0Gq5gWqraVlFDfoGiHhFNvQf1N0siWjoeAirw==
X-Received: by 2002:a05:6000:184f:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39ef9466f36mr12081694f8f.24.1745305135539;
        Mon, 21 Apr 2025 23:58:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d07csm14396780f8f.58.2025.04.21.23.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:58:55 -0700 (PDT)
Message-ID: <5c0e86f4-b40b-4f43-a97d-a166f41737a4@linaro.org>
Date: Tue, 22 Apr 2025 08:58:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/4] dts: amlogic: fix FCLK{3,4} clocks for new PWM
 controller binding
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: jbrunet@baylibre.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_235857_819018_47A56EC8 
X-CRM114-Status: GOOD (  16.20  )
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

On 20/04/2025 18:47, Martin Blumenstingl wrote:
> Christian has reported Bluetooth issues on some of his boards, for
> example on a (GXBB) WeTek Play 2:
>    # dmesg | grep -i blue
>    Bluetooth: Core ver 2.22
>    NET: Registered PF_BLUETOOTH protocol family
>    Bluetooth: HCI device and connection manager initialized
>    Bluetooth: HCI socket layer initialized
>    Bluetooth: L2CAP socket layer initialized
>    Bluetooth: SCO socket layer initialized
>    Bluetooth: HCI UART driver ver 2.3
>    Bluetooth: HCI UART protocol H4 registered
>    Bluetooth: HCI UART protocol Three-wire (H5) registered
>    Bluetooth: HCI UART protocol Broadcom registered
>    Bluetooth: HCI UART protocol QCA registered
>    Bluetooth: HCI UART protocol AML registered
>    Bluetooth: null: hu 0000000023fa9791
>    Bluetooth: hci0: hu 0000000023fa9791
>    Bluetooth: hci0: hu 0000000023fa9791 skb 000000003f7acf2f
>    Bluetooth: hci0: command 0x0c03 tx timeout
>    Bluetooth: hci0: BCM: Reset failed (-110)
>    Bluetooth: hci0: hu 0000000023fa9791
>    Bluetooth: hci0: hu 0000000023fa9791
> 
> It turns out there's a typo in the references to the untested/unknown
> clock input that made it into the already applied series
> "dts: amlogic: switch to the new PWM controller binding" [0]
> 
> The original goal was to skip this input. This can be achieved by
> specifying a clock input as <0> (which this series does). When using
> <> (note the lack of 0) the clock is completely ignored when parsing
> the .dtb, resulting in a shift in index of the FCLK DIV4 / DIV3 inputs.
> This then results in the PWM controller driver calculating the
> frequencies for a different clock compared to what the actual hardware
> uses.
> 
> Neil, please apply this as a fix for the next 6.15-rc.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/
> 
> 
> Martin Blumenstingl (4):
>    ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
>    ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM
>      clock
>    arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
>    arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock
> 
>   arch/arm/boot/dts/amlogic/meson8.dtsi             | 6 +++---
>   arch/arm/boot/dts/amlogic/meson8b.dtsi            | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 6 +++---
>   5 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

