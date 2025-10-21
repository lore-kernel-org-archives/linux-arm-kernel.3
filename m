Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF34CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwpb9YyyFZUXF8WyxeHegw4tIbT3loiYYpCo1rIiT3U=; b=IvWJlcpKzM9hMpzm5GwK80SCZq
	xqXUCHbQd9CCKtH1jhfidw5Y7KP02nL1hXYQBDSbT1xfWC0HKGFzEzhEcYgrZfOXIdotbMgnkkcpe
	U/YtdbihcZEmpu9jI7rbjaYfXmfvU0bwpjbpxY/pm273omZYRExw7wEz9QRT7nzb6WO5gorKZlurr
	vrV0D5mgeUXsvBvK4RLr7EehnzWk39qe7egqreP3nt+OOcVgrItrfZpvq6i8yi4lykWchQsoNst+j
	44FLDtxIGHulfAEAuw81HkdWu74rQqZ2+fwTWYsgRnti466mk+MbPtYnHAK14d+qWA8PblY4PHafl
	gkx6umzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBPE-0000000GxJT-31nN;
	Tue, 21 Oct 2025 12:24:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBPB-0000000GxI5-3090
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:23:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so3242232f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049435; x=1761654235; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwpb9YyyFZUXF8WyxeHegw4tIbT3loiYYpCo1rIiT3U=;
        b=Niurf5eFh++jFACAmvi4huH1fbO7wc9axsJJGpg4dqaDCszmwSMD+W8rhbf3xKCTyj
         9FFFmdYKuq79EhngTD9el/d45aEV0gw6N4ANO9aciQj+z4sRxXTznoOFLtxiDJqYsYUV
         zWs5J+eTd4/HaCWiK5ueHiGTLZYdq60rgmCBnicwm7mfawgmDQPM5W8ptfGFke301PRj
         BWNFf965Eo/JdU6nu7f+h+h4+evCfoqwKSU+hhVbrz6douBnxcIQ98ZCvcwASoZ4l3Na
         DsLlXiZRdax+5hKb1u3GNmh5hQSTyS+B9Iriyog0lTJvVDPywlpYYgM+81Gm9lMv4O7M
         L+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049435; x=1761654235;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iwpb9YyyFZUXF8WyxeHegw4tIbT3loiYYpCo1rIiT3U=;
        b=GUY7mX1cQSUoaz8WG45GjOyArNEfIhCMphUbQdvGLSFp++snI+ZxayCslkO2+qGyUD
         2ZLp/xMraQfeew1r4WbZ+VyP+2x5nPZQh6sY62WHgBG8Xa7PKdpFSS7NVjuzlS4qTQyb
         EHFEbj2H1EopoVGu2bg+t7NavdqoKfQPx6ZXYjOiLxyO+0wxU8H3hpcMc98YnYUjjkiT
         VegqsDbENPDzAGtkBvwKeXkXN2UcUAr9/SdW6MWw97GvWTqS8tJb7b3OMslrhYUrAfFa
         3xanYg4hIKbNtaK19JDYK8Oc2qhMdIK1UwsXr4wtWWJn/2Zq9FHz9r4f76lyYlda0jBh
         cxfg==
X-Forwarded-Encrypted: i=1; AJvYcCUtTOhKbuC/dA3RXgwuxUjS6olFGk7vvrtonQyxbPHjiKWMXpKKccV0ijcAulvL96XzT2kDUdLjiFh2WXpbno9F@lists.infradead.org
X-Gm-Message-State: AOJu0YymHlJeKkADPXnyWQkTtTuFdNAUZfa34EtobWxcTZSiROB1Pgnr
	pHE7yD8llMbciRhM9zX0k002r7EJs/MhpxBVXZ512FlJyNQNOxpCRDVbuBmGC7QKMQQ=
X-Gm-Gg: ASbGncts9laUqaBoxzP7dlTq3c46PKAZgiS8Q5zC4kN773WrHZ0PUTDpbnptvCdAXJN
	QElaWQORDMMdKzYiihGJWvSWEJyZWgxxfiij1AFDRCV2XzBuOTFl1a9qCxcEKq9BhOnM1hcipAr
	+CFFi+FjOeFS/mTBe4dwyKlcuhWZmx0oI7KuhgwPNCW1nrr5n9HANs2mke/l7SDU/87QqOOoTeB
	uDwYvbQTxz1d3zxYBC4houw5SF4ibYd+EiJNiqRPU/OJhzCLJIRJAuG9lYM5vNHUnG7zounstbp
	Q+/QEH0GLT2akXEd//UR3al7iSCs6M11vNbZf9jZLt2+EJX3Yys3V9kyNZ/TnDggFGaJ9wWqGLp
	GgazdhWtmOVtxwCl/3UKccS8jjD3j4zLtpIK9rX9zwvQd4+0iqlP8/eaUyPNOMK4auch0E9Flwx
	EJxFOcy23/7MLx7aaMsoWTjl+oku800mrmFHhENizuGbC2To1QUR5PbhI3km9jCjA=
X-Google-Smtp-Source: AGHT+IEX51mJgBcn/f0BCgcwHrkOSIPklu9sgYsPDZKLHpXaY6DgRpO964Q9+hSG2bVdYmcIHMByWw==
X-Received: by 2002:a05:6000:2287:b0:426:ff4f:39d7 with SMTP id ffacd0b85a97d-42704d9447dmr10933793f8f.34.1761049435321;
        Tue, 21 Oct 2025 05:23:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f3bd:d8ee:df79:53d5? ([2a01:e0a:3d9:2080:f3bd:d8ee:df79:53d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5bab52sm19901012f8f.22.2025.10.21.05.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:23:54 -0700 (PDT)
Message-ID: <263b86c9-61da-4d5e-af3d-4b9105112d82@linaro.org>
Date: Tue, 21 Oct 2025 14:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] dts: arm64: amlogic: add a5 pinctrl node
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
 <20250403-a5-pinctrl-v3-2-a8c067e22295@amlogic.com>
 <6ebddeb4-b33f-4392-b5da-56501b38fd6d@amlogic.com>
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
In-Reply-To: <6ebddeb4-b33f-4392-b5da-56501b38fd6d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_052357_801436_62AFBB56 
X-CRM114-Status: GOOD (  13.92  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,


On 9/5/25 05:19, Xianwei Zhao wrote:
> Hi Neil,
>     Could you please take some time to review this submission?

Could you rebase on v6.18-rc1 ?

Thanks,
Neil

> 
> On 2025/4/3 16:33, Xianwei Zhao via B4 Relay wrote:
>> [ EXTERNAL EMAIL ]
>>
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add pinctrl device to support Amlogic A5.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 90 +++++++++++++++++++++++++++++
>>   1 file changed, 90 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
>> index 32ed1776891b..844302db2133 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
>> @@ -4,6 +4,7 @@
>>    */
>>
>>   #include "amlogic-a4-common.dtsi"
>> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>>   #include <dt-bindings/power/amlogic,a5-pwrc.h>
>>   / {
>>          cpus {
>> @@ -50,6 +51,95 @@ pwrc: power-controller {
>>   };
>>
>>   &apb {
>> +       periphs_pinctrl: pinctrl@4000 {
>> +               compatible = "amlogic,pinctrl-a5",
>> +                            "amlogic,pinctrl-a4";
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges = <0x0 0x0 0x0 0x4000 0x0 0x300>;
>> +
>> +               gpioz: gpio@c0 {
>> +                       reg = <0x0 0xc0 0x0 0x40>,
>> +                             <0x0 0x18 0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 16>;
>> +               };
>> +
>> +               gpiox: gpio@100 {
>> +                       reg = <0x0 0x100 0x0 0x40>,
>> +                             <0x0 0xc   0x0 0xc>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 20>;
>> +               };
>> +
>> +               gpiot: gpio@140 {
>> +                       reg = <0x0 0x140 0x0 0x40>,
>> +                             <0x0 0x2c  0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 14>;
>> +               };
>> +
>> +               gpiod: gpio@180 {
>> +                       reg = <0x0 0x180 0x0 0x40>,
>> +                             <0x0 0x40  0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
>> +               };
>> +
>> +               gpioe: gpio@1c0 {
>> +                       reg = <0x0 0x1c0 0x0 0x40>,
>> +                             <0x0 0x48  0x0 0x4>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
>> +               };
>> +
>> +               gpioc: gpio@200 {
>> +                       reg = <0x0 0x200 0x0 0x40>,
>> +                             <0x0 0x24  0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_C<<8) 11>;
>> +               };
>> +
>> +               gpiob: gpio@240 {
>> +                       reg = <0x0 0x240 0x0 0x40>,
>> +                             <0x0 0x0   0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
>> +               };
>> +
>> +               gpioh: gpio@280 {
>> +                       reg = <0x0 0x280 0x0 0x40>,
>> +                             <0x0 0x4c  0x0 0x4>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 5>;
>> +               };
>> +
>> +               gpio_test_n: gpio@2c0 {
>> +                       reg = <0x0 0x2c0 0x0 0x40>,
>> +                             <0x0 0x3c  0x0 0x4>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>> +               };
>> +       };
>> +
>>          gpio_intc: interrupt-controller@4080 {
>>                  compatible = "amlogic,a5-gpio-intc",
>>                               "amlogic,meson-gpio-intc";
>>
>> -- 
>> 2.37.1
>>
>>


