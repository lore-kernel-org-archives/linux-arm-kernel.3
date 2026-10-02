Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF65CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk49vmsIM+yCxOu67mrioHkagQNao6fvAH0GFEMFZCU=; b=pJAjahyr1N34A2uU0gl8cZYLJ6
	lTXwDCazBms6OEz8lyKgB3+FwCdDHjZq3rizpzbX190cHgAX9xshIpX93MPPvVorap4vTFbqNyOlD
	UQKcuHoX0Hdxrxyec/pvvdwFH1YHtBpcR0EHCGdFQt36vTr17fBQAROnGQfjJLEYQiwS/z2f1bWbb
	rALSKxoKG0FV8sjhu/ymYh7Cy30hkmiYjwBNYxN+by2UZZ+bDgo5tVrsv7KMaClaKu39mwWQWlztg
	n1328p9flDtC9h8sT0+fygW2HbaPRG59B7J59ojX0RNM+tCob2Vn+hTdaxiGM3nIDwSY0br4Hzwiu
	XlKnM/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXii-0000000ApOK-2H30;
	Fri, 02 Oct 2026 07:30:16 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXig-0000000ApNK-1Nic
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:30:15 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a00713639cso40860515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790926212; x=1791531012; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pk49vmsIM+yCxOu67mrioHkagQNao6fvAH0GFEMFZCU=;
        b=M5xFamAExzicV+G011Xh/vLNe9Shdot5IC4k1ysFT3/wNl3ShI2TlDdxrVXdezyN6y
         M5selK1q+0YHKQoS3JDjMcCd6isAddWINVJq4pzUozzyrkeYY45TCiIrBDJEfyXXbxAB
         sng7cJLOF8CCelTKiuC1FMpWsJISkxEpaC1sdq6AKXeS39fivej2pThh1WmXYg0ePra+
         Js1g5V3lepJgtkV/Jm54pNkxQGNK93XeJ/2hU6Sn1JhnyxfFg7xA/9KHCqklQrJKwbXt
         CM0mZIn89M6LabAV4U+68gtTK5oQVbqpk1O5OHHllxicfo9I7s1+3+XJ4j6JetMmQdLj
         JtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926212; x=1791531012;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pk49vmsIM+yCxOu67mrioHkagQNao6fvAH0GFEMFZCU=;
        b=j5ugtWMHZVpdMwMDbwf9QMc2MiR3+RP4rct/F+O9WjNsb2GT+YAhfNOcre4VaMYqsv
         zEArM0H/AT/9MvDPDISRQcOr/UfEyjxJDBgBZJRuUZ1pz8XusmmdjUw0nthXzfNlhPKS
         JqtxdzkxY8+Ibd4h2ljCOdWkNjp6AaVvLIem1F0uw4n++TVxflDkt4ThItqFQYqwYPOU
         3SYY07e9s3N5dwfij6i8CjEQ3i8ezTYV9aOklfwOiTjZh1k2xlap9H1rxsZzo052xpof
         MhhcsneIy3KypcuLCue/ErqlpmohGUu+3wqmnxvQLKA/U+fJj0NKpDgycriMMFaJkIml
         ENGA==
X-Forwarded-Encrypted: i=1; AKwUvBwbu282PC+gxd3UROJgGqoDsDuwfjPuQDTszh3nvfOxRndcB/PrGlDPVl/mDbJYIYqJF1Xj7iW/JgUC/W3lzPzK@lists.infradead.org
X-Gm-Message-State: AFuF++m4ptr+MTc/Wb2RaNCbN8Ziq391qlczQIrEDb73PV6XIVtFj3S+
	VXc9kDDMGeF/d0dxUci+6+AI8Goa1gID6qEjxk33/h6Fk3xCE5yUSvHR7pWIDZ9yB+Q=
X-Gm-Gg: AYBFou1TdOror9DglibQOlTUo6YorfXKdUUFv4Ho1R0Au7Uhk1F0O6SLoHiaE7vyevy
	qq/vSdPxDNyDwqnA19zM9s/fJOmoeX8KpJRqvEW2Wwf8ER8RqQZAw5AdJJMLAy/JM2Tk9CVILC2
	BUmN1ea7Ps42WZMuBCOTZ0Rq5cYoev6uNYa/cjLVhPC/MGLqhebKfLi6xT3CH3m1fYQlpIYAPCt
	7qNr8T8/Cxd6SxzCHwWUAYV9RXP9A1xIvQTe1GGtsXQZMIT1udPSsZvc13uh5+8sE4kHH9hqjhR
	hRcgA8bbKz6bN1kudj4pU+uBowO1+HakP5tFuKQZoD/4w5Tg7Z5jZt1PYU3H42UiE2UHr0e+6Ga
	hEj6d3RpYpoV/bUknGkrq7PE4nauIN7stbyVCPr7jUFpaXt0C+h/AxUjtslv+RAG0ceApmeJGVr
	hQkEzbg9+xUjlzi0PvZc8bTBn5LM6XgyNu/QCVLOL/j2DIEroPGc2aYe/XLOgxxRxgqKuLWHqN4
	G0ipsCK3orJ3EbcjoG9T3fCUfteuNE9RB/J1sdMBnbmULeSefXu
X-Received: by 2002:a05:600c:1911:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a0275657a1mr32220045e9.22.1790926211263;
        Fri, 02 Oct 2026 00:30:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3611058f8f.31.2026.10.02.00.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 00:30:10 -0700 (PDT)
Message-ID: <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
Date: Fri, 2 Oct 2026 09:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
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
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
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
In-Reply-To: <ar4CRTMQGs5_nGKY@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_003014_417967_B49DBDAA 
X-CRM114-Status: GOOD (  21.60  )
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

On 10/1/26 08:50, Maxime Ripard wrote:
> On Wed, Sep 30, 2026 at 03:37:58PM +0200, Neil Armstrong wrote:
>> On 9/29/26 09:55, Javier Martinez Canillas wrote:
>>> Maxime Ripard <mripard@kernel.org> writes:
>>>
>>>> On Mon, Sep 28, 2026 at 10:36:18PM +0200, Neil Armstrong wrote:
>>>>> On 9/28/26 21:48, Benjamin Tissoires wrote:
>>>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>>>> On 9/28/26 19:24, Benjamin Tissoires wrote:
>>>>>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 9/28/26 18:22, Maxime Ripard wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> Panels in general, and MIPI-DSI panels in particular, are pretty
>>>>>>>>>> difficult to support and require pretty much a panel driver for each
>>>>>>>>>> panel produced. Most of them are pretty simple, and require an opaque
>>>>>>>>>> initialization sequence that is usually poorly documented.
>>>>>>>>>>
>>>>>>>>>> This creates a tension between OEMs and distros because OEMs will
>>>>>>>>>> typically get a new panel to react to a sourcing issue during
>>>>>>>>>> production, and thus need some swift turnaround between getting their
>>>>>>>>>> new panel and it being operational in the OS. Distributions on the other
>>>>>>>>>> hand can take years to ship a kernel with that new panel driver.
>>>>>>>>>>
>>>>>>>>>> To solve this, I followed the example of HID-BPF and wrote a panel
>>>>>>>>>> driver that will rely on BPF programs to perform the panel
>>>>>>>>>> initialization. That way, we can ship the programs separately from the
>>>>>>>>>> kernel, and with a different lifecycle. If this driver is accepted, the
>>>>>>>>>> plan is to have a userspace component started by udev to identify and
>>>>>>>>>> load the right BPF program for the panels found on the device.
>>>>>>>>>
>>>>>>>>> This is kind of late for serious applications except if we manage to
>>>>>>>>> solve the bootloader to Linux display engine transition.
>>>>>>>>>
>>>
>>> Besides what Maxime already mentioned (that most general purpose Linux distributions
>>> built the drivers as modules anyways), it doesn't have to be mutually exclusive.
>>>
>>> A simple panel could be supported using this BPF-based driver and then a panel driver
>>> added to the kernel, if is found that some applications need to have it built-in and
>>> earlier in the boot path.
>>>
>>> I don't see why this would be any different than HDI-BPF or other BPF-based infra,
>>> such as sched_ext.
>>
>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>> technology which has serious drawbacks and dependencies on user-space even if looks
>> really cool.
> 
> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
> you can have a built-in panel driver that works without user-space
> intervention. So this is not a topic of discussion anymore.

It will still have users-space dependency, meaning the BPF files will need to
exist in the fs when drivers probes.

Neil

> 
> Maxime
> 
> 
> will work


