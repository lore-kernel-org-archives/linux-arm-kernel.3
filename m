Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCD3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkK06OXmdpQerGRdYcgxg4UxOZ4GGpRC6XzJ6XPJVwE=; b=lqT2LiFE0xHdLvgD8Fqcv+caq6
	SR2Q0kuYMlMn1KNK2YFoKf+bgP5oJwBgOYTM93OtV3el/mgZqL1H4FYtpIX6PFZt04W7ZfPfpOHEY
	fGWWTnVa9Wvr2uRTu9w4rxexQpK9KIU44WFLWd+gyvZu0Iq58irGhJNpRSw2aMyEiHcVGqpCrrg5K
	s8r2Y4CWfCqeVlD/9LLaFVOWA0D5zO+pkFZ3BxoofT+iBhwo6HSQusxr6qgLD1agpvxDHy6jgdaeD
	v5tQQKTQ2EPRgFZLnv2JNNVd3XBHI4s4Kib3cBoHmPaz5G++sWOnYfCU0QcDblrwRvV1GU5lBIYyt
	ygYSUPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GL1-00000007sNE-1zO6;
	Tue, 22 Apr 2025 16:19:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dzy-00000007MvE-3Xgy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:49:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso61189705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745329757; x=1745934557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkK06OXmdpQerGRdYcgxg4UxOZ4GGpRC6XzJ6XPJVwE=;
        b=JyOEVZUPAdoosoJdMnpc/+Gnz+K3YqGKXfIsydJM2gLb0T/ubhX8lPd+TFWp3R2G38
         056B1k8lHSVyTu3FLk0/0s2qTsNmRQpFonMhMFQ6iDBZOCB3NUKHed8fddzCdzmCPBOL
         bqbMwWoAi1BWcod0aKsOG9PZovaeTZ45L0U109XoG5E1MqWtTUIAYE/SVpFKphMdE1LL
         xEyQl31KaULaaI4EWSBhZwhTAbzsf4xwbdJwYr5fmmwvcWPQbBt6bXSsC0cNu8MF1CEM
         NEBfKuPmJzzxKTyhVnhBgHolOiY5Jrj/hJ1sRNmb3YuiAe90+zpNXwZhKsAysLA/Ej0C
         ioYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329757; x=1745934557;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TkK06OXmdpQerGRdYcgxg4UxOZ4GGpRC6XzJ6XPJVwE=;
        b=pbzadc/qe9mt9nhm4EzUnVYIZjF19jM6qujIHWiXDK9if19GaZOTuJL0YxLmEBER96
         yHDxZLTkmmXVwucvllcRwplBSacmtx4B71yDM6GWnt5ACEowe+UqFznTiDpVGESxyVCI
         UooM2EKehTLRlfaAIEym35ZE+xleM1SQNo9YY5ZtHQy9vfhSVhq1ax2PvhgIljMLVLgw
         +6EFj1ZJsuzklDCqxrT6pijrrbdI2ZXGLgOeKe1rjQHBPN53vd3cyKC8/kSwQIUOKtzi
         4YmuiErM/LM9jPCSd+FfbMOncvAxyD7pSxYHvka3NWxNclYfPbOXGvkrLO9hUJ3yuvk/
         Elag==
X-Forwarded-Encrypted: i=1; AJvYcCVaefESPh+FIFIhPsAEATtbBXiHZ90rPuz+TVQRgYqP2hT3izDhhmdmqHZPsbyYj694Dkk9+u8TN2T332DVQBEa@lists.infradead.org
X-Gm-Message-State: AOJu0YwOiVHSMeMMXWqcV8pcQ29yB2jXFixr4AldSUH7+NbcLK0xc3ri
	ySE3hSNj+47fl46a+Nzlgo5Q0yt0d2C9DcRL6btNszlKCBGRcvUcKM3DqHOFw2I=
X-Gm-Gg: ASbGncvNzKP7IhQ/1eQXHsp6uPXS8go4MiAEBnLGb6hex7AkcEV2b+ZvBgxJxDDgOQo
	m3h66K4BW0PWS2Ymr395Vk9owd0FvQz7FuIsPFirNWOULmyxQdOR2u0ta5jM9GQgtEUKkH0m+YT
	lU5gK7zUzOVEOvNNVTN9MIQYT2CzxiTCYMx9HRm8mOVkB9A4e6Fl0aYbJCEFGo5BlkdG7An/EvE
	t2uJhT1nrtYrbfDjiL+INcjGxUuNTMt9Gwuy79Lwxh0Agi3zkT61E7EHg8KgFMVDyuQtpeML5bH
	UYHcy0olce2JQyYVy/N4WpGquDBQ9MuNNtaPgQ1d4VNXoJHihYaxa2/m6l9ATDAfHQGhig/Gacr
	Qaxlyn3pY27p0fTqr4Q==
X-Google-Smtp-Source: AGHT+IHdFpY2t7FI/be0EqJz9t7HFlCCvc06lK5PIsjhFFst91bNUJ0oXsSvGUrxZ85zoDSQF25lnA==
X-Received: by 2002:a05:600c:1d06:b0:43d:aed:f7de with SMTP id 5b1f17b1804b1-44075dd6aedmr71755055e9.21.1745329757107;
        Tue, 22 Apr 2025 06:49:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433429sm15455640f8f.37.2025.04.22.06.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:49:16 -0700 (PDT)
Message-ID: <e3229c42-b322-447a-ad1e-86c6f20dd54e@linaro.org>
Date: Tue, 22 Apr 2025 15:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <a175ed1d-9e57-4150-af8f-7ca785203108@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_064918_899377_6D91EADB 
X-CRM114-Status: GOOD (  12.73  )
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

Hi,

On 22/04/2025 13:45, Xianwei Zhao wrote:
> Hi Neil,
>     A gentle ping, thanks.

I'll apply them this week except patch 4,

so can you send patch 4 separately since it goes via the tty tree ?

Thanks,
Neil

> 
> On 2025/3/17 15:16, Xianwei Zhao via B4 Relay wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Amlogic S6 S7 and S7D are application processors designed for
>> hybrid OTT/IP Set Top Box and high-end media box applications.
>>
>> Add the new S6 SoC/board device tree bindings.
>> Add the new S7 SoC/board device tree bindings.
>> Add the new S7D SoC/board device tree bindings.
>>
>> Add basic support for the S6 based Amlogic BL209 board, which describes
>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>> booting up into the serial console.
>>
>> Add basic support for the S7 based Amlogic BP201 board, which describes
>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>> booting up into the serial console.
>>
>> Add basic support for the S7D based Amlogic BM202 board, which describes
>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>> booting up into the serial console.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>> Xianwei Zhao (7):
>>        dt-bindings: arm: amlogic: add S6 support
>>        dt-bindings: arm: amlogic: add S7 support
>>        dt-bindings: arm: amlogic: add S7D support
>>        dt-bindings: serial: amlogic,meson-uart: Add compatible string for S6/S7/S7D
>>        arm64: dts: add support for S6 based Amlogic BL209
>>        arm64: dts: add support for S7 based Amlogic BP201
>>        arm64: dts: add support for S7D based Amlogic BM202
>>
>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 18 ++++
>>   .../bindings/serial/amlogic,meson-uart.yaml        |  3 +
>>   arch/arm64/boot/dts/amlogic/Makefile               |  3 +
>>   .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   | 42 +++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 +++++++++++++++++++++
>>   .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   | 41 +++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 99 ++++++++++++++++++++++
>>   .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts | 41 +++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 99 ++++++++++++++++++++++
>>   9 files changed, 443 insertions(+)
>> ---
>> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
>> change-id: 20250221-s6-s7-basic-f300c30877e6
>>
>> Best regards,
>> -- 
>> Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>>


