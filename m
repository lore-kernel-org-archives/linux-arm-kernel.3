Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41361D44C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYvocclPNzuO2Xle2lrVn+hLTZXEdchNTRgU0mDAfI4=; b=AC38DzuuY7msYOF667cr4iDZRp
	n4OQofRhICBplycSbnteF0kyTvfxRrzmfaTQk9vGhq4STtY1lkR6hzwe4ZjgEeet2JVKgxTSG+RqW
	5h2+PoizbjuSDUySNpD8r6VuKl+KS2LMdDxlp5TR4ivPT1Z7U9nBrsxPBMSiUSNFSgc3pGCgloRsd
	SKUxQeCIAq9Gdo1QFvkpMgCOx+6WdD6OT5OsAUGaCpSSeF7xXsnKuNl6kgDUbZpf2H+OkHMUIkw+x
	SQM/4eb3i9//Wj3QFv3EbdEAiGo7vMhPUD3mtaEBoFoAvuSK9vFd+ZDtz6Vxot4xq8cIxlyDDR65M
	+VF81G0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNyq-0000000CSGm-0tB6;
	Thu, 15 Jan 2026 14:05:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNyn-0000000CSG4-0ZQC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:05:42 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-42fbc305882so449032f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768485939; x=1769090739; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYvocclPNzuO2Xle2lrVn+hLTZXEdchNTRgU0mDAfI4=;
        b=fKucQr2lwFtEBefao2rT8YBf4ryAp0tDUFq/j6f+oioBy4avnaqjEYVAGpeHluzKOf
         rapwr9NG1laOlCMZtq6/NWnf3DITGFa3agLbJnUTPi+vp5Ep3SKluBwo4g3hAsHu3n9F
         jJiD4nba3mZ9AIFoobxxCN0FP5SRNJJMl86yNHUd4NK6tbYOX4nYOuqXdKQq65VjXcVy
         8VaaEyh5x1UdQt4rleRH//otB/KPVb3LFhfwVz7dZDAi0Ih0V9e9wNOyjOCvP6xckKW3
         JS9wowT3dlw7HJfe+Gxq1qikMLrNeflTCiYLI3grz8zg3ADxF3qL2+Tau4Wo5hCvHPRg
         TsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485939; x=1769090739;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYvocclPNzuO2Xle2lrVn+hLTZXEdchNTRgU0mDAfI4=;
        b=tFWZ3HTbde2+/d4erb4Vj9XtWNrWItvJ3h9kVB099cPkP8ah0tQ7AisXWkzGsRdXLa
         RAOCEZfF3sOcAf7smdGgmwMWy3QMnE9FyaO5iyL2nYBMlTOmwhacJqoIVPwvz2PeoMjS
         nSWSnMYsC4gM19recdD69Ks8gznstaRQ3tlkBQGFCpMLNmX/3MX7QGRO1+uTa+XzplCn
         1wZrfUKKrPc6QrCSVgITtqEcF8Ll5WA6W3N2Kv8NT4L+t8sLX0rs2HTiIgAFSESxDZS7
         V5mSEtaIPuBlu6OQd6XPdRWoJhYYusAPquiRJgVRDtWzuovJDPmkBSxZFVzSRzxODOY+
         dNCg==
X-Forwarded-Encrypted: i=1; AJvYcCV3iwvURISnUr0gZ2aoyQityKHnOLNElq+zgw0bLsW4ZdIWqKWYI0q4lTF0/6d+gn+Z+Pu3yqPu2wjkaCwXvfK8@lists.infradead.org
X-Gm-Message-State: AOJu0YzfMx2iXKWEaDZwcHA0A/17Nxo2gK6E2pYv4PU3Us2oRn+Kq7pI
	wbEM550EG8LHBcg7qZOJamR75/mXLVmI/PEjPkVhujvoEnKyCWvxQZtVdxLa/LXBIeU=
X-Gm-Gg: AY/fxX6KeTymP8quoXw4KzLdbIadE+5Y6u9kcSmUHLx08Nklaif2lTVgbF/4tALAuDJ
	hWJ/7f/VoJOqonaFNHPGRi0774ac6RGqzkhDXapuepYpT5N177r2ZV7Cay8wQ9fpEEdlDDrRlzJ
	O7Fh8b8K2VOTcc6qSDQVKM+40sLAL/0vvO7T0aQbW+s07bPWfjygYu8O09O9j5Nz7LPYswZ7Qyv
	UybZR3k58i9XMvM+qC7g39QZYOIMHmnZkzCvKj4fP6bL6nqiQYxHHgU1SF+u+s08+B65HRpIxbY
	QmTfiUHL2O6d/lu2MxQP9n7xAM/mWB1wiixOLmlqwhtypwBL5NjdEHc63816eEiOM1eI2jfBAkG
	hOAeTT7NXYvmiuWkO0sGy8Di9ETaqiZfBKDytS2E/u7n1YgsIY0JhZokU0kpAFwv/ZHHkoPE5Ln
	RpV0gwDjdUG5Aiv4+FbTLjB4c/JMonq6ojobuZxWhjyHQ+fWzXW250+0hMs168XDo=
X-Received: by 2002:a5d:5f52:0:b0:431:8f8:7f17 with SMTP id ffacd0b85a97d-4342d59bf78mr7749285f8f.10.1768485938970;
        Thu, 15 Jan 2026 06:05:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6fc8dcsm6215675f8f.40.2026.01.15.06.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 06:05:38 -0800 (PST)
Message-ID: <89634869-7858-45b7-bc2c-81436e028b83@linaro.org>
Date: Thu, 15 Jan 2026 15:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add the type-c controller on
 Radxa Zero 2
To: Ricardo Pardini <ricardo@pardini.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
 <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-2-8b5cdf328fde@pardini.net>
 <aeaee3b5-5f08-4abe-b646-a45ab79a35ab@linaro.org>
 <1f256bf2-2739-4785-88fd-25101df9dad9@pardini.net>
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
In-Reply-To: <1f256bf2-2739-4785-88fd-25101df9dad9@pardini.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_060541_214826_13FBB075 
X-CRM114-Status: GOOD (  18.28  )
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

On 1/15/26 14:59, Ricardo Pardini wrote:
> Hi Neil,
> 
> On 15/01/2026 14:00, Neil Armstrong wrote:
> 
>>> The Radxa Zero2 has an FUSB302 controller on i2c3 at address 0x22 and
>>> INT# wired to GPIOA-13.
>>>
>>> +        interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
>>
>> OK it seems I did read too fast, this should be 74 !
>>
>> S922X Datasheet (same as A311D for this)
>>
>> Table 6-32 GPIO Interrupt Sources
>>
>> ---------------------------------------------
>> | Input Mux Location    |    Description |
>> ---------------------------------------------
>> | [76:61]        |    gpioA[15:0] |
>> ---------------------------------------------
>>
>> So gpioA13 ==> 74
> 
> Indeed. Sorry for this.
> 
>>> +
>>> +        vbus-supply = <&ao_5v>;
>>> +
>>> +        status = "okay";
>>
>> And I get:
>>
>>    DTC [C] arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: fusb302@22 (fcs,fusb302): 'connector' is a required property
>>          from schema $id: http://devicetree.org/schemas/usb/ fcs,fusb302.yaml#
>>
>> Please add a minimal connector, like:
>>
>> +               connector {
>> +                       compatible = "usb-c-connector";
>> +                       label = "USB-C";
>> +                       data-role = "host";
>> +                       power-role = "source";
>> +                       source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
>> +               };
>>
>> I'll drop this change from my tree.
> 
> Again, my bad. My intention here was a "minimal" description, mostly to reserve 0x22 so end-users can run `i2cdetect` or such on the 40-pin exposed i2c3 and not be surprised. Guess I didn't run dtbs_check hard enough and missed the required connector.
> 
>>
>> And you may also add support for the superspeed mux to switch the USB3 polarity.
>>
>> I have a prototype at https://gitlab.com/superna9999/linux/-/tree/topic/ amlogic/radxa-zero2/fusb302?ref_type=heads
> 
> I'll try your prototype. I had no idea it actually had those capabilities.
> 
> Do you think it is worth to resend this with just the fixed 74 pin & the minimal connector as you suggested? Now that I've seen your work, a "add FUSB302" that does nothing (while being capable) feels frivolous and confusing.

Yes please resent with the interrupt fix and minimal connector, I'll rebase my work on top. It still needs some testing, but I'll be happy if you test it on your side aswell.

Neil

> 
> Thanks,
> Ricardo
> 
> 
> 


