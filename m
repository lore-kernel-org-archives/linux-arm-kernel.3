Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C869FCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EOtyWnpj6H2JKh2l6IAWizW9Kgj+njv8aMgbCxIvr4=; b=t6n57HHrAuflFukFUeGpyhY4kT
	NI7Y6zS/XpwSGOHCSbY+kVHLsdRMVNYLkO7BOK/kHveCTQFLm6zZAW8RjoEAZz9N6umVBYvOvLdqJ
	F72M904DUKhUWywbdXD5IL377HQHqYM8DTQqQFtHrdik0C6of85FT5MmNMZsvcduedusaEZJIdjMp
	jfKwVRTtkO6qESFVKd6Nj+sTADPrKA0veUsEKiXeUOc6wFecWz0u5P5ZV3T7pTv9iTZNEq7e93/Vw
	PuCrYUoal0CzGNbqh9L6IKKmsSkhrVe/7Kv1QYXwin8mosPwu4j53vnebWVrcDqzMZUKgwFZt7EJt
	ObRb9SNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGtf-00000001Pw6-0RPt;
	Mon, 28 Sep 2026 19:20:19 +0000
Received: from mail-ua2-x0f.google.com ([2a00:1450:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGtc-00000001PvO-3W9w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:20:18 +0000
Received: by mail-ua2-x0f.google.com with SMTP id a1e0cc1a2514c-9832c759198so1800547241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790623215; x=1791228015; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EOtyWnpj6H2JKh2l6IAWizW9Kgj+njv8aMgbCxIvr4=;
        b=sgS2XBmOSiBfSjH9MJ+D0ytDZeRn5533wu5F4gpWYvVT7kBkecA5MiYL/z+3kRPSh6
         +Skol83Okh87d/AUM42/hLVlDRBYrS1/Ts3UD1BDj1l4FDbDN1GiywQ1X4q9W7dsJL5F
         t13cIeW4fk5Myc+XjiXNdZUmSDIBqvuEg1e0tgPdprrBuC/Ct88x+N+KYoBwMVrVPqwT
         K9VxcYP7VNvtxKbMi5iX3gUmyLjjgYeMeRKZBaOVm3qXOttnCYfzFR6Z+3rVecWTLQpC
         1uMoOYr9LtB5YjJeWAvKPCBIjbQ/sZoDp8nQypuDLdnDPhtOkoTwX5tOBhAmjFCQQaIo
         sliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623215; x=1791228015;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3EOtyWnpj6H2JKh2l6IAWizW9Kgj+njv8aMgbCxIvr4=;
        b=XRcNy3Vv1FkbNjic28/DTmOw80M7tFcsyguZ+E8iFWEXCXQQGa9Nll2xBR0uDhUTRP
         qUkx/H/YVWOxJ3WmupIh6Im/W+LWHo1Pmf6kC00fKDYJq0nUhb2wnU/wTe5yCDJPQawM
         Idb1+xGU2pOZ07Yf50YrDeO1QEUuQ+Om+FkWj/RfTkmoF5mdHwaJSN4Odc6NG+CW4TDw
         TVmv166r0Xbx5H5gyWGUKDm5KrU/5SyrTF/C9j+vbzhsg3o/HTuL7c638Wo8PpHxKy9g
         1kTprainIkXm8KLxEzK2UJSwfbXWq7C3wsWvT39FWLE163YiTZ6IeuWhRFJsHWkX2RS8
         ElVA==
X-Forwarded-Encrypted: i=1; AKwUvBzBdEFdKiLSTxnP7CUSTLGTk4B82b2DaER1IAltNW2GrAp6B3ZSCmqDh94Tj+HWZ5KzY0FAeI1E1VsgD3Ekg8ii@lists.infradead.org
X-Gm-Message-State: AFq9FYJMd/wky1WU4ln7ETu7ouVEF5PXbKRG7OOZf1ddBgMiRswg0qs9
	EAi0OAu5Y04THxpsM2GCVkSJOI2Odxa41doR5iWNt3eRFEa3GO2jYTEkXXrfAMHCKkA=
X-Gm-Gg: AYBFou0wcOg0NY1J/UZi52HzeQvpyxgEcgIJZLNFTCK4LWLE+UwkqkHozHE8GAQzjQw
	SUf7ypw7UqK31y1gogTq7VfzFdkRJnrbKc6J/GrsCOyJWp6dpij3OkvlSheAfvGWWd3FqnDLN0V
	QtWBgmH9ergRtEXrqB9hdhAUyt9qZgZSHjT/ECig0Js24unTdbdWi5x5bwxOL4XPy/ql2dYJAmC
	m5z4pmQaMOqwbICBD5GLNpV9VsrVF3SZCTzja0cHkYUDMWanpEAlin0XdEufgUAEyP/PBVnsREh
	sYc2MSuK0X4wssUMu/mU95QBcbFeJBC36ebHihJFoTcFPQeifwL9KBH8pCPd2xo5dbDediYX6F8
	dJxupqIbWtS3tQ0CmRfS2HeMl1MEX+3AuPAaw3xyoIG6X9l6Mp4AGnAx0soI7otchgUnOhOf9bm
	sp7y6OBtXs0xhWjqTg/0+NVVaCd8iAfB5CAWdRy3YjEPiFIKOsCe8dh69Pwm10qVfg3dfE2ZLSL
	Arw+fNosQ+VUbNSYFtGQ2Et/1ce4bUWzW3ameFdIyS5LGdGNFsiK1BAJEfRRC+H8DgffvWiZTxs
	7d86Ii4hqXtHqk4phA==
X-Received: by 2002:a05:6102:3f8b:b0:7a6:bc69:5a32 with SMTP id ada2fe7eead31-7af1e6f3640mr5363208137.23.1790623214949;
        Mon, 28 Sep 2026 12:20:14 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889afc5c7csm8124301241.2.2026.09.28.12.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 12:20:14 -0700 (PDT)
Message-ID: <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
Date: Mon, 28 Sep 2026 21:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
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
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org> <arqhwHiVf00j94J7@beelink>
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
In-Reply-To: <arqhwHiVf00j94J7@beelink>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_122016_915382_EC31C40E 
X-CRM114-Status: GOOD (  31.97  )
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

On 9/28/26 19:24, Benjamin Tissoires wrote:
> On Sep 28 2026, Neil Armstrong wrote:
>> Hi,
>>
>> On 9/28/26 18:22, Maxime Ripard wrote:
>>> Hi,
>>>
>>> Panels in general, and MIPI-DSI panels in particular, are pretty
>>> difficult to support and require pretty much a panel driver for each
>>> panel produced. Most of them are pretty simple, and require an opaque
>>> initialization sequence that is usually poorly documented.
>>>
>>> This creates a tension between OEMs and distros because OEMs will
>>> typically get a new panel to react to a sourcing issue during
>>> production, and thus need some swift turnaround between getting their
>>> new panel and it being operational in the OS. Distributions on the other
>>> hand can take years to ship a kernel with that new panel driver.
>>>
>>> To solve this, I followed the example of HID-BPF and wrote a panel
>>> driver that will rely on BPF programs to perform the panel
>>> initialization. That way, we can ship the programs separately from the
>>> kernel, and with a different lifecycle. If this driver is accepted, the
>>> plan is to have a userspace component started by udev to identify and
>>> load the right BPF program for the panels found on the device.
>>
>> This is kind of late for serious applications except if we manage to
>> solve the bootloader to Linux display engine transition.
>>
>>>
>>> This driver is fully functional and works with both 5" and 7" Touch
>>> Display 2 panels for the RaspberryPi. However, it breaks away from the
>>> typical panel driver in multiple ways:
>>>
>>> - BPF programs can only be loaded by userspace. This leaves us with two
>>>     choices:
>>>
>>>     * We prevent the driver from loading until the script itself is
>>>       loaded. This has the side effect of preventing any other output to
>>>       be used until the initramfs is ran at the earliest, and possibly
>>>       ever if the loader isn't installed for example.
>>
>> This adds a dependency on user-space behavior and if somehow the
>> initramfs doesn't load for a reason we won't have a way to display
>> an error.
>>
>>>
>>>     * Or we probe the driver all the time, but only report it as connected
>>>       once a program has been registered. This is somewhat unconventional,
>>>       but allows the other outputs to be functional, *and* allows the user
>>>       to force the output if their panel doesn't require any
>>>       initialization or during debugging. I chose this solution.
>>
>> Both options are not really great...
>>
>>>
>>> - It's not a panel driver, but a bridge one, which is also pretty
>>>     unconventional. This is required because panel drivers don't have
>>>     access to a detect callback that is required for the above, but I also
>>>     think that the recent work from Luca blurs the line from panels and
>>>     bridges and we'll end up going that road anyway.
>>
>> On this point, DDIC _are_ bridges, but in the current panel API we blur the line between
>> the panel and the DDIC. So being a bridge is fine, but in a general way we lack
>> a proper way to describe the display/panel/monitor independently of the DDIC.
>>
>> At first glance it's a nice driver, but moving the timings into a blob moves something
>> into possible proprietary binaries with possible closed licence and distribution
>> restriction so it's a downgrade for the same of bringing up a panel faster.
> 
> Quick answer on this, because I had the very same questions regarding
> HID-BPF:
> - in BPF, you can require (and by default it does) that only GPL
> 	compatible BPF programs are loaded, closing the argument of "closed
> 	licence and distribution restriction"
> - also, a BPF program can be disassembled much easier than a binary
> 	blob, and I remember Alexei showing me an example where you get almost
> 	the source code from the BPF object in just one pass.

Right, it "solve" one of my question, but doesn't really solve the issue
of vendors providing "GPL" bpf programs with source available "somewhere".

Another big issue is the API, I don't want to keep the current API as-is,
we plan to support more advanced panel features and use try to use the
atomic states to support rate switching for example, and I'm not confident
it's a good idea since there's no "simple" and "forever valid" API
to initialize panels...

Neil

> 
> Cheers,
> Benjamin


