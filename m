Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A275CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZB4UkUo4DToHt4/+zjrF9qsPrLf22VKvL6EK3fyUl0=; b=eUXD11CpeVJBorsShjjBumxPv8
	J7Ur3rSK2WA0oM8WT4TK0NHNu/agpP1VmTuvcm/xdTL4RLSADoVboxj3hkJj2R2LtQK1JzxjhOgHV
	QbJ9OOsd/5paf0TU4rHqlXwGXMwL82mrIh4yuEy5gjqXut/HmPmwGOWdZOXVmwfPkmadGaFNY/A3E
	lTAtGroX0GY+QIclOoA3zTaHh30VqDm7HxzhFpryMesdJHT0eFR4bPBO5GQr1VXmgLdH4gahWbDdB
	jT8Z49Q1Pat8+1894mkCSz4DXb+3MRvfB3T8foo/9Qeeth7NetD5GPcxnNqNaopLYMwbVY/2yChaF
	X3vkSGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuVm-000000069WW-2hTV;
	Wed, 30 Sep 2026 13:38:19 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuVe-000000069VU-0SXp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:38:14 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5b8f69a0af6so1815756e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790775488; x=1791380288; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZB4UkUo4DToHt4/+zjrF9qsPrLf22VKvL6EK3fyUl0=;
        b=CHozHfSaAG2o8H5TYTF8ANpU5KeJR3LPoEeYNo639o29XzS7s/iz1fLlKZEVlVYZmh
         BOrhf9xbuItdVy1xiDRlkzutj+lW1mS8vO0hHPrHo1UddkN+goZJ6gNWY/eu81yoZBw5
         jXLQAf7jwmo3t1oSh1mYNUrd888A01gsCsPI8gXTzzklUcXElCFsfWvnLCk1RxNC55bW
         SSNk+49iCbFjE/SyUvRZEyogL9IHvl2AltaltRafwNjhBjMrQ78dGOqYrLRtsJ/fsGzH
         tINy0H0CH5/i/+ZPk4mo80jGICeXsO//ndqalwbapNM5+rIWu7dGOAiN8cGOcE0IJDEr
         GOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775488; x=1791380288;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZB4UkUo4DToHt4/+zjrF9qsPrLf22VKvL6EK3fyUl0=;
        b=0s5Oi0pGjz8IRrs+TAoNgyb3AST4YTzoK9wnZEEQ+OT+kV+b6VAorOIRG6Q8w7klm2
         8LH6ryLtuhZrW7ZmEO0FkYeG8l1y8+m+A9CYjHw7Gl8CK7sV4uhaxpoSfIko4oKtVoJF
         vdAz/7SjZiz+RcDGodF16bClGSPTtCrWN1mh4tAcrHeAIgQVo5QcRb8S/EDu/PMxDF13
         iSHFUiqkpgQ+5vNBOacNX6XJ3kR58lkpBorDvOqqsWKZCdK3pE1wZIjrhf4sp0JQCXnA
         0ZXL0E1nhMRW4TZNJJrzsKl088XJb5nwaBTs67DeutFsbBnDlL/yh35L65JQBbNPFNoY
         4IvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhfez07OYHd1R5f28ZNYW3B0Gf+eeVAjgzbZGiqr60FwXr+gHvQf4Vlap2z2NSAHwoyqSkGCk7bAMmsHQHUXV2@lists.infradead.org
X-Gm-Message-State: AFq9FYIuTG9te5w7e/jRNKg8G6bB2qEuptX/UTGj/JzfRGFyGwOYA8+w
	7MEynBrgboeD/uBXthuNhXR/ayKaghHBMJqFwG9rNTPLs0DQrV/T5rsiRAmHd94aOF4=
X-Gm-Gg: AYBFou2J6B8CLyFugIhaMAhO2E0uaXg3NHZ1EMkVmCgGNOrZGvk39UcTndh6wq+8tsk
	boHdDJi5G5ath0Pb6/bJ2y9npx2jH0wuYSNTvtbRjEaXrVBCGbMdxFIfNMNdbvs1RaS8nRLZjeG
	I8/V4UlAXAcHA/3YugshS7YYkU20c4C4LGdu8SlLJn/H6xjAw70pjwXea1hzRYEDrTvxZPmBQtS
	uPhecMaRd7Ymt1UwwIyS+UKpu2JSLetVO6b6Ofj0LsG+9NPPrH5LPykrvZvL1x2sPOzgcIfS6GQ
	qq0Rd6uEA9Diceiaeyg4xHYT2IqW6zJTruQxFkCSgTm1Dema3vgFxdv3jXbVUvBM46LAZc6PVXu
	C6K564r4Ju5iMROmqxxCW1z/OzUWj91I32aP0Zyh0w3o8Cu+HH8thQ8FJOiqpMSlvBSqjNi8pgH
	9xlaBUxxlFP8ADCnxDxGPVwUJpBgpGxR/1S+E3LbmrnYp9a8pjyjy0KFSpbmzB+Cd4KLyu5Y6ES
	FYcIygaMfIaPorppa4SK2m3pB+FKb+WVS9sqc5UD9zZe+UflweypUXYTa3CLAdKfGqHVWSvq/lQ
	AJVNoLLK
X-Received: by 2002:a05:6512:39ce:b0:5b8:f9ae:1816 with SMTP id 2adb3069b0e04-5ba405f319dmr575166e87.17.1790775487315;
        Wed, 30 Sep 2026 06:38:07 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fc02f2esm360270e87.77.2026.09.30.06.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:38:06 -0700 (PDT)
Message-ID: <828c9108-2db1-45a6-9301-19159a094301@linaro.org>
Date: Wed, 30 Sep 2026 15:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve
 <aesteve@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org> <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org> <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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
In-Reply-To: <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_063812_701225_79BDD211 
X-CRM114-Status: GOOD (  20.57  )
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

On 9/29/26 09:55, Javier Martinez Canillas wrote:
> Maxime Ripard <mripard@kernel.org> writes:
> 
>> On Mon, Sep 28, 2026 at 10:36:18PM +0200, Neil Armstrong wrote:
>>> On 9/28/26 21:48, Benjamin Tissoires wrote:
>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>> On 9/28/26 19:24, Benjamin Tissoires wrote:
>>>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 9/28/26 18:22, Maxime Ripard wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Panels in general, and MIPI-DSI panels in particular, are pretty
>>>>>>>> difficult to support and require pretty much a panel driver for each
>>>>>>>> panel produced. Most of them are pretty simple, and require an opaque
>>>>>>>> initialization sequence that is usually poorly documented.
>>>>>>>>
>>>>>>>> This creates a tension between OEMs and distros because OEMs will
>>>>>>>> typically get a new panel to react to a sourcing issue during
>>>>>>>> production, and thus need some swift turnaround between getting their
>>>>>>>> new panel and it being operational in the OS. Distributions on the other
>>>>>>>> hand can take years to ship a kernel with that new panel driver.
>>>>>>>>
>>>>>>>> To solve this, I followed the example of HID-BPF and wrote a panel
>>>>>>>> driver that will rely on BPF programs to perform the panel
>>>>>>>> initialization. That way, we can ship the programs separately from the
>>>>>>>> kernel, and with a different lifecycle. If this driver is accepted, the
>>>>>>>> plan is to have a userspace component started by udev to identify and
>>>>>>>> load the right BPF program for the panels found on the device.
>>>>>>>
>>>>>>> This is kind of late for serious applications except if we manage to
>>>>>>> solve the bootloader to Linux display engine transition.
>>>>>>>
> 
> Besides what Maxime already mentioned (that most general purpose Linux distributions
> built the drivers as modules anyways), it doesn't have to be mutually exclusive.
> 
> A simple panel could be supported using this BPF-based driver and then a panel driver
> added to the kernel, if is found that some applications need to have it built-in and
> earlier in the boot path.
> 
> I don't see why this would be any different than HDI-BPF or other BPF-based infra,
> such as sched_ext.
> 

I don't want to add a supplementary maintenance burden for the sake of using a cool
technology which has serious drawbacks and dependencies on user-space even if looks
really cool.

Neil

