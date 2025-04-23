Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E84C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB0RCfrpm6KO0azBMBNT3gQRNEul5d5cuD4mn3Ij+n8=; b=lOxQphrnp6ApQDtem0v3DkFLNd
	XRy2zcV0lfgrlyalzdVEb9KbCceVOVD5xs/+VST6BSa1cu+/MjgZItygY3PxzeB8Jq+hKXR3Lg0lg
	eFwhCBn5bNzyGIo9e6Vg10+g1SpL1fhg2iB0e906aZM4OsC7nAVYDirqh/yWGtmtMmT9Z+Crp9Q8Y
	X1vL8HcptNDOKUwTptglNnthzNvc4Mx7V5WMcivyrTRP4U+8+Er6dg00adWQ8hjcX/dMKjK6eXRmK
	DXcwSi4tXiDCCVIg+A7hoSbFP0eFmvo4m6fVVOZzjj3jsdtgx0hPDkP1/utbt2nRecz7vzo+aycg+
	tzFhyl3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Upq-00000009ZNC-09uW;
	Wed, 23 Apr 2025 07:47:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7URw-00000009V8c-0Jsl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:23:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43edb40f357so44628865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745392994; x=1745997794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WB0RCfrpm6KO0azBMBNT3gQRNEul5d5cuD4mn3Ij+n8=;
        b=i4w9ywsr18Czy1D8oOmVTNEkxLjMWtWiU2cUqduQaM8QcD04tuaDNPgJ5W4EM+EHCG
         z+XBmgKAlafXThFeVdyVSk56CmaHSEB0C2c+9kMTK+5j12gRJL0OoHDoN+y9bK71Kdwl
         xydffFxEFqDkhZ1LPtcb/BeFTFiwPwjB8b5RpmW7GRNNqH7gxHvIuCid16KeVJpXp2xH
         eOsrepFe2/81XsZ6HOyj8dA4u2AA2TGttYXm9ddRTnH/TiyR4S2gqC9GKx1RjeJq8xFW
         oiediR+9oi1RrF9a4OzUqrZr9jfkefyYI3cXOTGe8VgsqZ0EdzdYyEJW4QZwklh10oV2
         3WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392994; x=1745997794;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WB0RCfrpm6KO0azBMBNT3gQRNEul5d5cuD4mn3Ij+n8=;
        b=twT+ResfzNrRW5V82nFJ3GZFaCizeMRwZVNq3bI2FJ9x66j3I2wjDjZ67QZRzr4KnV
         PPMQnE7QAH361Ijp4bVcrQcub/sOZ9IHdQBvdxLSqcyHFQGaZrWT0/DDAWp5/cs/IAGj
         6xklOv3UHEfSL+e3z16Mv+HeBEaPImpQsCgfP/wQdOr9yZC/+KCtnhdhoxM6ZaMTBnnQ
         IS8orAgUfdSkM1W9oOEB2pTZIfgLAWRuxZgZWDEmOuEq/0S9zvbiQl0u6jWO86lJXEEE
         H7HFVFFalE70tM6w16N+L+NM16h/JeSjXghFh8PfLvbTjRw1TIsxoQwfAqj7o02mrkH/
         Zs4w==
X-Forwarded-Encrypted: i=1; AJvYcCXgjl+Uj3bC4TrkIzZ24LxsvUc9Uas6/uX4T9T5BvhLMs/W0pacSYJoHRHbl0LZW95ULxbhogIK+qhhx0/kJEwP@lists.infradead.org
X-Gm-Message-State: AOJu0Yycjh/WzTbYyczU6roGuqjaa8mwqIRKKtNoKm55Fs5nVKNYcr2t
	mH7JkcKbTGXACby3/HJusWRXug6KlfD9vwRgYcEzh/LvEqy1L2SVqs99PWKdMQhdq3pdRj1xf4o
	B
X-Gm-Gg: ASbGnctdd/4rqgCk11EBs9xPj1fxEzMdgmfD2YVOeTVNtn6iA9q7/GEVGZOT5dopnVw
	ak73bPegzCW3VTp6qxfLVIYqEQwgeFHYkCh11kll8E6lHlgcdzZpbOhfd/4UEg6ei8H5xnuuveE
	OyxH/IASCvIaYqattBAv1fPPSdEq6YIxN8ieMWgHS9eIf1pTGmUsxHBYiOuJWYTmKLxcuzXLeUB
	tE0LkxxQPAO4jPFDm2CS+kD4EJNjUxiKtS3BSRDF+PP3BBQP/lAzdMPXfz29sW4J84PChXg0DMj
	CYf8lwuJMzoynzIk7LkPxGvH62c4MQ9MaEZphm/CireH6Zzp74k8bstA1R/Y6uRXgpKWHgMIIoZ
	rEBzKWNXpsHhZ3Tw1Hg==
X-Google-Smtp-Source: AGHT+IF7iRgKZdIR7ImIaoLwdAL0qVsjtbiBOb3c9EZ1TcpXaE3Utdm6WozDnJe6gph5La9PzewJlg==
X-Received: by 2002:a05:600c:350a:b0:440:66c5:26f4 with SMTP id 5b1f17b1804b1-4406ab703b8mr160055435e9.1.1745392993806;
        Wed, 23 Apr 2025 00:23:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd? ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d1709esm15163115e9.7.2025.04.23.00.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 00:23:13 -0700 (PDT)
Message-ID: <eb1c3442-6b86-42e9-a672-eaba7de8b375@linaro.org>
Date: Wed, 23 Apr 2025 09:23:12 +0200
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
In-Reply-To: <be8b7874-1251-4ba8-9243-a615517861ab@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_002316_109559_BEF34EC6 
X-CRM114-Status: GOOD (  14.93  )
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

On 23/04/2025 08:15, Xianwei Zhao wrote:
> Hi Neil,
>     Thanks for your reply.
> 
> On 2025/4/22 21:49, Neil Armstrong wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hi,
>>
>> On 22/04/2025 13:45, Xianwei Zhao wrote:
>>> Hi Neil,
>>>     A gentle ping, thanks.
>>
>> I'll apply them this week except patch 4,
>>
>> so can you send patch 4 separately since it goes via the tty tree ?
>>
> 
> I will send patch 4 separately.
> The following patches(5 6 7) can be not included for now. Without the patch 4, the command "make ARCH=arm64 dtbs_check W=1" will fail to execute.

I know, but since it's reviewed, Greg KH will pick it for the next release so it's fine.

Neil

> 
>> Thanks,
>> Neil
>>
>>>
>>> On 2025/3/17 15:16, Xianwei Zhao via B4 Relay wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> Amlogic S6 S7 and S7D are application processors designed for
>>>> hybrid OTT/IP Set Top Box and high-end media box applications.
>>>>
>>>> Add the new S6 SoC/board device tree bindings.
>>>> Add the new S7 SoC/board device tree bindings.
>>>> Add the new S7D SoC/board device tree bindings.
>>>>
>>>> Add basic support for the S6 based Amlogic BL209 board, which describes
>>>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>>>> booting up into the serial console.
>>>>
>>>> Add basic support for the S7 based Amlogic BP201 board, which describes
>>>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>>>> booting up into the serial console.
>>>>
>>>> Add basic support for the S7D based Amlogic BM202 board, which describes
>>>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>>>> booting up into the serial console.
>>>>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> ---
>>>> Xianwei Zhao (7):
>>>>        dt-bindings: arm: amlogic: add S6 support
>>>>        dt-bindings: arm: amlogic: add S7 support
>>>>        dt-bindings: arm: amlogic: add S7D support
>>>>        dt-bindings: serial: amlogic,meson-uart: Add compatible string for S6/S7/S7D
>>>>        arm64: dts: add support for S6 based Amlogic BL209
>>>>        arm64: dts: add support for S7 based Amlogic BP201
>>>>        arm64: dts: add support for S7D based Amlogic BM202
>>>>
>>>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 18 ++++
>>>>   .../bindings/serial/amlogic,meson-uart.yaml        |  3 +
>>>>   arch/arm64/boot/dts/amlogic/Makefile               |  3 +
>>>>   .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   | 42 +++++++++
>>>>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 +++++++++++++++++++++
>>>>   .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   | 41 +++++++++
>>>>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 99 ++++++++++++++++++++++
>>>>   .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts | 41 +++++++++
>>>>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 99 ++++++++++++++++++++++
>>>>   9 files changed, 443 insertions(+)
>>>> ---
>>>> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
>>>> change-id: 20250221-s6-s7-basic-f300c30877e6
>>>>
>>>> Best regards,
>>>> -- 
>>>> Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>
>>>>
>>


