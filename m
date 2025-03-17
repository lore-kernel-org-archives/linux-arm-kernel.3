Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371F9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Haj3M88Nl0rzn14OKdsEl3OoTWkoQ15fDIQ4CoHcds=; b=H3gWZI8mtjjACS6rwENT1wXzvq
	9xHgaPk6z7DgrVK0qV5gcbhreAb5Ui6ounhcskUzZou5iLRcYtYoZMlYUebGtVAJJBsYX/04eARhH
	jLGRat+AyFKWLKJnEV94pAPjG1UC+isV4S37czZqYVwF5A7BDBq9aJXL23n+dn2njKAg7dB/HOu7E
	hPJYXiMwepHlfvebU5aLL+oaXIlo0RyjgVf5sPN0ShuifALuYp7EIsu1par7U/JrRAZzb/HPAxftK
	tYF+41rfqAA+GG8nJ1Davw4QVlgwSkMJ/k2asODQXAIJdULwr8yubewuw436zGSR3y0+QtbzxCCw/
	JHaQymEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu51Z-00000001bSM-2qZU;
	Mon, 17 Mar 2025 07:36:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4zs-00000001bDg-2Vmf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 07:34:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d0782d787so11595735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742196890; x=1742801690; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Haj3M88Nl0rzn14OKdsEl3OoTWkoQ15fDIQ4CoHcds=;
        b=sZlXY9X5y5i1WQF4KEQnRy0laohp5hjmFMEl6YmP3jmt1hWnrPJWpY0jp/GOWiAqaY
         qAe+L5npZYlWf5b4COaBwIHH+vYTEdK9GzvpxdW7hfA1GfBEhaQpivPVauIOaI82y4uQ
         +pqH7Pg9iP8/cthcPWf0HYkldz65IFZYEC4+sspLCccOSt9yPBElbe6BRCCfibuS+Lyy
         G+KP/vFrQhky2cCRDKDWZy22lGvmNEdPoabhaw71Nm0D7bDApwpuj/YBMko8OKoLAaiQ
         WuY8+w4uMRKQGpMI6AsgQGIFPmk37Vk58jx6fiiX2to4qKYbpl8GOOZZy5Gka35b+JiP
         +31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742196890; x=1742801690;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Haj3M88Nl0rzn14OKdsEl3OoTWkoQ15fDIQ4CoHcds=;
        b=Xut0Ck53QRCufu4tFDWbpzfjVHYwAnT0Y5Bf9PK5h0Z2UKnQkG+uxufvHkEs9ZVaac
         ZtIA3IOd+ua1V4Kp842+7aZf2V3vQaSj73GQVFhGgJwoY/ScXFz8S9Yurz12hsUV3cmp
         se0N/tUDjTYpAaMrrpesE9thbFMAQ4yogIq+IC7SJL3CIqpS1JNdjZd+9tLwAWx7eiBD
         nR0Iyav+KEBFgHtjqhjhyIBbRwH5/XhymsCsDgCgDhB7bn8RuYfzmNqmre8Cf3B98ybq
         rpH2l2GJMUFFR95zR4hcYrFQxSk6IFI0FyEVvND4XVCKoah7r7Lvuat4ge11MKO3QjF6
         Dotw==
X-Forwarded-Encrypted: i=1; AJvYcCV4iyjnMLkCSi4LJppDgM8wHI4VchcyYZ9YdEGfgJpcz+0IJqRXab+OmfxXmgidZe+yM4IMrbN8+sr2t6ZVRahz@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ73xBAgcBSTGonbPDXLecKlpvbmMY/54+eD/BbVG5s60zelHO
	dS/e13LXY2+ZzLV2BhAb8vk/apgnkFUHztwARxLwsO+tFmBcSNT67raq/FveDq0=
X-Gm-Gg: ASbGncujzDdAB+6tEZ2WqHJ/aXKUQ40ofBYEZhtlNT8wVDvRPEQ9p2cFhavj8QPL/bu
	yhdPTAp4knMu4IjbcJ4MsyLamag1YScd64FY+cCT6jsiNOba2L8BL72JR0J/Gbpxt1xEAc+VUlx
	Jxjzl5pfaDy7R+iTRiGEE/b0SaT7lMN6j/P309g7OhP5QIGdIKuuvn7YBbLDU1Lvn8IhH20ArOO
	5DVRWIAF4MNRq+KVt+K6C3Me6rQUiYShbLQvs8jpYCXnU3HPPLFbcGb8aPW67T9EOuY6b4tV+k7
	W+m4IawFN6B5+Z6cz/a0Yc2xzccAg9rOIteJsR0J3qojRPQBGrqQO99S6oPq0d1QvDUor4gf9tu
	NZK2SB3kWVngMpA8WJksDXQ==
X-Google-Smtp-Source: AGHT+IGrBhLQhXsdfvh9nApPbVNi+jq+YpAEku3HrbDi2HyjFAxIR3MMl+TF+6gCIe/X+4ph6WyQwQ==
X-Received: by 2002:a5d:47cc:0:b0:391:3f4f:a17f with SMTP id ffacd0b85a97d-3971ee43fc3mr13277286f8f.42.1742196890499;
        Mon, 17 Mar 2025 00:34:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8dca:521b:10f9:91e4? ([2a01:e0a:3d9:2080:8dca:521b:10f9:91e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ec14bsm14053515f8f.100.2025.03.17.00.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 00:34:50 -0700 (PDT)
Message-ID: <0475a736-92bc-4cf8-be89-d8161fed5075@linaro.org>
Date: Mon, 17 Mar 2025 08:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/4] Add GPIO interrupt support for Amlogic A4 and A5
 SoCs
To: Thomas Gleixner <tglx@linutronix.de>,
 Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
References: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
 <87h64022hz.ffs@tglx>
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
In-Reply-To: <87h64022hz.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_003452_627921_D20C8A2E 
X-CRM114-Status: GOOD (  12.51  )
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

On 10/03/2025 18:56, Thomas Gleixner wrote:
> On Fri, Mar 07 2025 at 16:49, Xianwei Zhao via wrote:
>> Xianwei Zhao (4):
>>        dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
>>        irqchip: Add support for Amlogic A4 and A5 SoCs
>>        arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
>>        arm64: dts: Add gpio_intc node for Amlogic A5 SoCs
>>
>>   .../amlogic,meson-gpio-intc.yaml                   | 19 ++++++++-
>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 19 +++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 ++++++
>>   drivers/irqchip/irq-meson-gpio.c                   | 45 +++++++++++++++++-----
> 
> I can't take that through the irqchip tree as the amlogic dtsi files are
> new and in Neil's for-next branch.
> 
> Neil, feel free to pick the lot up, I don't have conflicting changes for
> that driver sitting in my tree. I'll reply to the irqchip patch seperately.

Ack, I'll pick the whole serie in my tree.

Thx,
Neil

> 
> Thanks,
> 
>          tglx


