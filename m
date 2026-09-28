Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB03DCA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wqE0gOeMMpr/nqn1OVJOAEQ+QHtmheZQZYs7E5QFRI=; b=0yv8/D9zP4QXe1QXlPcjAxEXI+
	FIMgjbSgtDMjD5PJ1TH2f2DTwMbSKHlhb/zA+NM7XJ6Z08TOX09j8BBXCOlUALvZczcHbRevH71xL
	fGuY/AwqMj2HD0tOrcSB/Qr9dh/eCL+kII1cTqzeIWmSGfspTfPzPTdMQbPgRGKPkLaBvvOLy6bE6
	gfNjSwLgZXEbE9y4vzZJZQVLWRCUF0noN2+E+m+MqgIswWVRu2vsY3cdKZ1z9N6Akp54yyRV9v6zQ
	EWhW5NJGzDnAwRQfxpUuC5MIFetFBozv6+3JTrz0n5qJGVfEzZ2BAAAhChi3Un1n5sAHohZwxt0jT
	qXjW0kSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBI5K-00000001aBm-2Dww;
	Mon, 28 Sep 2026 20:36:26 +0000
Received: from mail-vs2-x2a.google.com ([2a00:1450:4864:3a::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBI5H-00000001aAJ-1L4p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:36:24 +0000
Received: by mail-vs2-x2a.google.com with SMTP id ada2fe7eead31-7b35eae3076so592396137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 13:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790627782; x=1791232582; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wqE0gOeMMpr/nqn1OVJOAEQ+QHtmheZQZYs7E5QFRI=;
        b=v1EOToucsEexwjuLIXWVbN12IavTYM/XsITwuIlf04BjzMI3I0Sh151l/R2IFJ8JJ5
         L1e8+hFTlE+R1ntrP8LdzWj8i491efotY7yvp92Pxc52xJgqaF2aP8cV6aBEBDPJTRe1
         wpBXlobsfsNxmFQnIAx6IzvsTsYqNWjcxg7ZIdogxAlO/Q2s63GzEO6CstqPubwQHi9E
         tR4u9zQnLf+vfgMWs+z0VGl80FTlugQioHijeOr1sw9LShil3KySXOa72Nz/3kanv36X
         vaFBNoz6KlAxVbENTY77T6aJHu3Q6x5eCsxFmFVP5eaO2LAOK/392NIXRDSYmWTmGZel
         koeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790627782; x=1791232582;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/wqE0gOeMMpr/nqn1OVJOAEQ+QHtmheZQZYs7E5QFRI=;
        b=2Qz0oZdYhgkpict/hsEiuq2y4v8oYJ8aT6b/H6lVzDwpagLZryZNd/MeZrjtvWS4wL
         2aLZdify9R1wS53S03WjxxfGRc2jfZZqobubU6Ninfq2MmyozERIrfXmmjFM8qbbg3GN
         8dDJsBgllg3NK0a8FNYlAcWzhC1GUKmi/VPxp7nD7M1GkRd6hhmYpdT7xoUFPCrEEWnn
         qQF8g5ZwdpVQQDanlfmQXQdBDAWfImI06hZ+r8jAziMPd5b+xvMnsUqpW8jbLKEdUQf/
         BlDv5ZH7AX022Kt5Am5zMK5IyHB/h7aFLSd4CHM25togRrp+qO11gzttoRB+RRrFPWuv
         yxKA==
X-Forwarded-Encrypted: i=1; AKwUvBzdSZYdyke6485hBFcxmoy8Is3d16EufYd5dxsohkjd5JcuovTWyTpcipIeeFyyBDuAQtOsIvHRZBkwdH4M9xoQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKiZjZE7pXoLJdxU6ZHIeVQwrzQl3eRQXMn3AanjyGze3+coBJp
	0SLqYvlorupnDsvmaWXeiwGYD163ys/bi8oKeF+bhEYqdURRJlgVWgA0yn3YWgJpcLw=
X-Gm-Gg: AYBFou1zBCEOKdbpwM1mR8lYsJ5o8qQLnP5SorutPv6Of6S0sTJOOZd1HdBHmV6gZFW
	UYi4fOqZpTJzFu7h/6ItegIIxYtmU9LYUXA5W3ugwG2K9eH7HqDHsv94AiU9uYysxG4j3PjCK7R
	b27OILhlXoZEhgjySvRNA+wGKTxKp01j0ymIIjDRboF5SAzW0gd/naXMTox8m9C3/yNdHdL267o
	x7y/Tc0ExhBjmAHZRcqHSnJdV+MTwvSnlL/o4qr/hB/hFUDoafhNMuIYRLpXf8avpNtHWW0moy+
	78+7Di94YY/m2Oq+jPbhpJXelawIwAax9Nq6qnxVkV8IBM3fO5LeUiIOC3rmZYgtb46s4HzB2vK
	RkGYBEw1mErAinqWX5GzpUNw6L6MB8mvNgXIfeljhYfAzVxHfWCzXdujUkbwzm4xImiuPH761bp
	Oxg+kmDQa3hwFUhFsAVdMdtB0SWdbP/+kK+a/hoDoEx4MbcVLaTuNhgx/QmNgKk7ZbIkRNwBRU/
	CMxdVBCmU+M8W8blKZVQyW+AnJhtNuxOO0f1zSHu6qgTiiW3RKTklzsHXDE8CVVdqhDFJo9Z7Nw
	8ahMb39DjWRAHPfKtA==
X-Received: by 2002:a05:6102:3972:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7b2508e43dcmr1935899137.4.1790627781635;
        Mon, 28 Sep 2026 13:36:21 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889afc5c7csm8438164241.2.2026.09.28.13.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 13:36:21 -0700 (PDT)
Message-ID: <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org>
Date: Mon, 28 Sep 2026 22:36:18 +0200
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
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org> <arrAqg5n87INTHE6@beelink>
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
In-Reply-To: <arrAqg5n87INTHE6@beelink>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_133623_412832_9FB7E0E0 
X-CRM114-Status: GOOD (  51.46  )
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

On 9/28/26 21:48, Benjamin Tissoires wrote:
> On Sep 28 2026, Neil Armstrong wrote:
>> On 9/28/26 19:24, Benjamin Tissoires wrote:
>>> On Sep 28 2026, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 9/28/26 18:22, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> Panels in general, and MIPI-DSI panels in particular, are pretty
>>>>> difficult to support and require pretty much a panel driver for each
>>>>> panel produced. Most of them are pretty simple, and require an opaque
>>>>> initialization sequence that is usually poorly documented.
>>>>>
>>>>> This creates a tension between OEMs and distros because OEMs will
>>>>> typically get a new panel to react to a sourcing issue during
>>>>> production, and thus need some swift turnaround between getting their
>>>>> new panel and it being operational in the OS. Distributions on the other
>>>>> hand can take years to ship a kernel with that new panel driver.
>>>>>
>>>>> To solve this, I followed the example of HID-BPF and wrote a panel
>>>>> driver that will rely on BPF programs to perform the panel
>>>>> initialization. That way, we can ship the programs separately from the
>>>>> kernel, and with a different lifecycle. If this driver is accepted, the
>>>>> plan is to have a userspace component started by udev to identify and
>>>>> load the right BPF program for the panels found on the device.
>>>>
>>>> This is kind of late for serious applications except if we manage to
>>>> solve the bootloader to Linux display engine transition.
>>>>
>>>>>
>>>>> This driver is fully functional and works with both 5" and 7" Touch
>>>>> Display 2 panels for the RaspberryPi. However, it breaks away from the
>>>>> typical panel driver in multiple ways:
>>>>>
>>>>> - BPF programs can only be loaded by userspace. This leaves us with two
>>>>>      choices:
>>>>>
>>>>>      * We prevent the driver from loading until the script itself is
>>>>>        loaded. This has the side effect of preventing any other output to
>>>>>        be used until the initramfs is ran at the earliest, and possibly
>>>>>        ever if the loader isn't installed for example.
>>>>
>>>> This adds a dependency on user-space behavior and if somehow the
>>>> initramfs doesn't load for a reason we won't have a way to display
>>>> an error.
>>>>
>>>>>
>>>>>      * Or we probe the driver all the time, but only report it as connected
>>>>>        once a program has been registered. This is somewhat unconventional,
>>>>>        but allows the other outputs to be functional, *and* allows the user
>>>>>        to force the output if their panel doesn't require any
>>>>>        initialization or during debugging. I chose this solution.
>>>>
>>>> Both options are not really great...
>>>>
>>>>>
>>>>> - It's not a panel driver, but a bridge one, which is also pretty
>>>>>      unconventional. This is required because panel drivers don't have
>>>>>      access to a detect callback that is required for the above, but I also
>>>>>      think that the recent work from Luca blurs the line from panels and
>>>>>      bridges and we'll end up going that road anyway.
>>>>
>>>> On this point, DDIC _are_ bridges, but in the current panel API we blur the line between
>>>> the panel and the DDIC. So being a bridge is fine, but in a general way we lack
>>>> a proper way to describe the display/panel/monitor independently of the DDIC.
>>>>
>>>> At first glance it's a nice driver, but moving the timings into a blob moves something
>>>> into possible proprietary binaries with possible closed licence and distribution
>>>> restriction so it's a downgrade for the same of bringing up a panel faster.
>>>
>>> Quick answer on this, because I had the very same questions regarding
>>> HID-BPF:
>>> - in BPF, you can require (and by default it does) that only GPL
>>> 	compatible BPF programs are loaded, closing the argument of "closed
>>> 	licence and distribution restriction"
>>> - also, a BPF program can be disassembled much easier than a binary
>>> 	blob, and I remember Alexei showing me an example where you get almost
>>> 	the source code from the BPF object in just one pass.
>>
>> Right, it "solve" one of my question, but doesn't really solve the issue
>> of vendors providing "GPL" bpf programs with source available "somewhere".
>>
>> Another big issue is the API, I don't want to keep the current API as-is,
>> we plan to support more advanced panel features and use try to use the
>> atomic states to support rate switching for example, and I'm not confident
>> it's a good idea since there's no "simple" and "forever valid" API
>> to initialize panels...
>>
> 
> That's exactly where BPF shines. The simple rule of thumb is: there is
> no API stability guaranteed. Basically, thanks to the verifier and CORE
> (Compile Once Run Everywhere), you don't need to keep the API stable and
> available forever. There are multiple ways of dealing with it, but the
> gist is that if a BPF is trying to load an "old" API, it will be
> rejected by the verifier.
> 
> Then it's a matter of being nice enough in the kernel and provide ways
> to deal with those.
> 
> To give you a few examples:
> 
> - in HID-BPF, in userspace, we keep old versions of APIs in separate
> 	compiled objects. Each is incremented (by 10 so we have a little bit
> 	of room in the middle). Then the loader tries first
> 	0020-device-with-new-api.bpf.o, and if it fails, it tries
> 	0010-device-with-old-api.bpf.o
> 
> 	I'm not saying we should do the same here, but that's one idea
> 
> - recently, a BPF commit broke the ABI of a function while removing
> 	implicits: bpf_wq_set_callback_impl() was replaced by
> 	bpf_wq_set_callback() with a different number of arguments. I simply
> 	had to add a new function in my header which basically does:
> 
> 	static inline int
> 	hid_bpf_wq_set_callback(struct bpf_wq *wq,
> 	                        int (*callback_fn)(void *, int *, void *),
> 	                        unsigned int flags)
> 	{
>        if (bpf_ksym_exists(bpf_wq_set_callback))
>                return bpf_wq_set_callback(wq, callback_fn, flags);
>        if (bpf_ksym_exists(bpf_wq_set_callback_impl))
>                return bpf_wq_set_callback_impl(wq, callback_fn, flags, NULL);
>    }
> 
>    And then I changed the bpf.c to use hid_bpf_wq_set_callback() and the
>    bpf is compatible with both APIs
> 
> - with CORE, struct fields are relocated on the fly when you load the BPF
>   
>    So for instance, if my BPF only accesses fields .name, .phys and .id
>    in the BPF, I can define:
>    struct hid_device {
>      char                       name[128];
>      char                       phys[64];
>      unsigned int               id;
>    }
> 
>    Then when loading the bpf, the verifier replaces all offset to the
>    ones actually used by the running kernel, and the program loads
>    transparently, even if you add fields before/after or change the
>    fields order in the kernel.
> 
> Changing the mindset is the hardest part of it. But once you are making
> the shift, it's actually much better to work with. It doesn't mean you
> can go yolo. You still need to be careful in your choices knowing the
> impact on your users. But the API at version 0 is not frozen and you
> don't need to maintain it forever, especially if you control the loader
> and the headers used to compile the BPFs.

It's really impressive, but there's no way this would become the de-facto
way to program the panels, and if the motivation is to make it simpler
this implementation requires adding bindings and bpf programs which that
are the same as native panel drivers, but won't be able to work until
user-space starts and will require to be in initramfs or rootfs to
have functional display.

Not sure to understand what are the positive features here
except isolating the panel code in a safe bpf program (is this really needed ?).

I mean the idea is cool and bpf is a nice thing, but I'm really not
convinced about it programming panels.

Neil

> 
> Cheers,
> Benjamin


