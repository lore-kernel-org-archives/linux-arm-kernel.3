Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85EACA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHcqKszk+BLOaoNOEO2+3FAWySZdw8cPx3mMZwkgNqk=; b=mrUKTRmmaVwYj8r6G6CF4CmrD6
	oOcXi9pObEIVQnGp7bMz8o546RBCfV3Dpn5qvMMsSXna79J8tHYAgGhE+WgJd5IA7Wdm4ZDFl7wJC
	2AWI0+g6ueuZSIj5QvIt1NqrXv2D0qF4sKi/XN68WATwFAb3PfNT+kciJyOs7Gq6c3ghM+SaAh+R/
	AabBMpWGEc28VP9AThllRjZgOfaueydmhSFz/zh191UKaBEdokNBjaJBF8DG38X6k5yrkcVfCp1uG
	MWHByegy8piSSbIGyT0Acd0cF17LZ/DJ/mJ+/IiiP/fw94re4d7RHvUJdezs1k1sVinyzfs/ty+PH
	XHBgyV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBudW-00000006Aqu-49Jc;
	Wed, 30 Sep 2026 13:46:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBudU-00000006AqM-1ib4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 13:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=CHcqKszk+BLOaoNOEO2+3FAWySZdw8cPx3mMZwkgNqk=; b=fkGf+5HiFcZPV0ZQq+6p78x70v
	URDT8bAca+5tM1vG2zm5NAzXI24SgvARLIe6TOpgBsZ/k+NPWiKC24Og2z42U//WrsPULNSLLXhsL
	S6hxoI8nxyD65CtQk5lL1Oth3gCLydcYwsQjyaItWkbXsCYmJzNy4QYep4NMLETbYoal7W4/38CoT
	u4HA4N1Js0iTk/yPGZhhSuSXNxEu35bm+25QeGlxPbVpkUUyEwqVulcimtSikSGoJSRTFSuVjt0LD
	jd/BRmfyrJycKjiuofwrO1vtyOn3GhqsJkCTaliiYYlC4DybFekCCgwEyI5C3dSo7oJjmoy81jPg6
	F8K9ucrg==;
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBudR-00000003rma-2HYJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:46:15 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-488811c9ebaso2739252f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790775972; x=1791380772; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHcqKszk+BLOaoNOEO2+3FAWySZdw8cPx3mMZwkgNqk=;
        b=enAXSGA/fOyAMcVCnrrQubgHxpNtcRBApPNzDd47rBMWFzo4a0o3tdPwnEDjsp/VF4
         5H5znipJhrcQ2VLmflPvZ7UesE/5Z4Xf4ntN5j6WyqKHcJkWeq0a7jE2lwC4L6eeuvp6
         VkJYyvEMmTX5KDEPQ9hEZ4TcmNFac3d/psDr3qCFNJ2qXP87FPnMB9Lokh/CakpCfoMl
         6iGJoJzoFtsQXrbl1O8vLUlgm9l7E8TcmtAjkOuGf8ETWjhdkXoWkYPSdpJIOkqCAo7v
         aRWNFxeefad4E8RyLDWJqUnRqqmtW2u3+LtV0LKMFctGDbb12Fz6LcHBoNGl27FwOSFi
         nIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775972; x=1791380772;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHcqKszk+BLOaoNOEO2+3FAWySZdw8cPx3mMZwkgNqk=;
        b=ifQ5DhOsJB3hDYQaeMnBYViuZCEsAFodwlwuI21NwD1CudTQZjkrLZXduElfu4MrfH
         jq4/wbrEqVtpZZwYbz+gBJxfB2fzfNmFy5uSoJklKrGMAuP79d+d+YIVlzcfJVZqzbQl
         nkTu339axppUlYxCoefgwcxjhZDIpzRLK0fDQULoCOgn5fupDWuJz7u946WXaB0lVTeI
         Nsh3OTKLL9k7TrDQNacDDLZr2FEmaj/dVokXoFjrJMOK0rabytzVh8WgDum6gjh6rhr9
         qKKT5VoUcRERrZuonOvbDtHGSGgOohGqiL2eU6r7l5eJtJZRezUAgJ5JEEqrGX0534Jg
         uVUA==
X-Forwarded-Encrypted: i=1; AKwUvByFxMpPoMgMb4tBEB6KDSarOBdCyUJKuRsoGo1ewBizCeHkwmTuMQv5z/rvg4ihulS8pyLeOY8u4wQaIqtgvIlW@lists.infradead.org
X-Gm-Message-State: AFq9FYKDY0n+kI1idu75iky76mSaCNDvojPfQnUZCcApEHTYHPIibyRi
	JAzC7bGDGSk1YB9+il6DHzukHZ07EUi4Aq4kwYuguQQjBifdu47c3EgciPgJ8XHTDlM=
X-Gm-Gg: AYBFou32qdtWLlynKdLrc8OfaSFz8SWLsf31xiGXQDRsY9B1re2rrTNUB6UDkPvoBNV
	AGQ6DhXxc48j6g/uJUIUwYlfUdU27e0cRZ1Pdh9EXXCa27NekSmR2gX1Y6IykNWSFDm0X0AicPr
	Yt/DVAxOpT/VNs9wwiHo3kKxOoJe+jVI65yUBQCcRU45Ihit7aZ4tUSnpKVF0ya8AOUIH45+DrI
	CKMiawYisdIru9BUmhXmJZh9unkSIajHqEt0w3mSr5/aTUthqCyVqBgq5S3B2KZnJ1smHeUNW1K
	CoE/Upj3ShLwYc5Bk/vJSTrOD4zEnE7GSEsKC8LR9IrruBOINkvVJneNvbtwETufCrtX2pHbB2T
	j0gGL3cQV67kPkkufjTJeDEfW2juzykXEr7/KQwcr4A57wqIQdx3QJWTYF0N/4PRfbeK7ICXRf3
	/W/HDZ7jW1AzyhfVuIGMdrmaWiX+8FcZKKRDat7kJ2cbdKpYvelTWKc+PXZwwNHYOpwdyW/Y2iH
	Lsxx0aOzKb75kE0/GSsaaW8qjQ0Gbv7Dyal604kSYKZZwDGYG9mvyeA/e65WV+jwO578Vv6LaUd
	QDtELKk=
X-Received: by 2002:a5d:5f81:0:b0:488:84e2:cb0b with SMTP id ffacd0b85a97d-48b02549be8mr3355158f8f.51.1790775971655;
        Wed, 30 Sep 2026 06:46:11 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029e51b8sm3780276f8f.20.2026.09.30.06.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:46:10 -0700 (PDT)
Message-ID: <c75feb5d-055d-403a-8dba-3c187cdb8e7d@linaro.org>
Date: Wed, 30 Sep 2026 15:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
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
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Benjamin Tissoires <bentiss@kernel.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org> <artgrTe6wvKxnUOG@houat>
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
In-Reply-To: <artgrTe6wvKxnUOG@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_144613_762209_5D2184B2 
X-CRM114-Status: GOOD (  46.83  )
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

On 9/29/26 09:13, Maxime Ripard wrote:
> Hi Neil,
> 
> On Mon, Sep 28, 2026 at 06:39:58PM +0200, Neil Armstrong wrote:
>> On 9/28/26 18:22, Maxime Ripard wrote:
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
> 
> Virtually all "generic" distributions are shipping the panel as modules
> today anyway, because anything else is nothing but impractical. But
> maybe you don't consider them serious enough. Also, applications live in
> userspace already, so can be ran after this driver would be initialized
> anyway.

So what would this exactly solve ? keeping out-of-tree BPF driver + bindings
driver forever and never upstreaming then ? Is this what we really want ?

> 
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
> 
> Yes, if an error happens before the DRM driver loads, it won't be shown
> on the screen. This is already the case for any panel driver today on
> any major !embedded distribution. And with built-in drivers, this can
> also happen before or while the DRM driver loads.
> 
> The solution is always the same though: load simpledrm first, move to
> the proper DRM device once it's functional. It still works with this
> solution.

Module != bpf programs, maybe one day it will change.

> 
>>>
>>>     * Or we probe the driver all the time, but only report it as connected
>>>       once a program has been registered. This is somewhat unconventional,
>>>       but allows the other outputs to be functional, *and* allows the user
>>>       to force the output if their panel doesn't require any
>>>       initialization or during debugging. I chose this solution.
>>
>> Both options are not really great...
> 
> Feel free to make any suggestions
> 
>>>
>>> - It's not a panel driver, but a bridge one, which is also pretty
>>>     unconventional. This is required because panel drivers don't have
>>>     access to a detect callback that is required for the above, but I also
>>>     think that the recent work from Luca blurs the line from panels and
>>>     bridges and we'll end up going that road anyway.
>>
>> On this point, DDIC _are_ bridges,
> 
> I have no idea what a DDIC mean.

The DDIC is the Display Driver Interface Controller, basically the
IC which received DSI packets and physically drives the display.

It's basically a bridge to the panel, and this is mainly what we program.

> 
>> but in the current panel API we blur the line between the panel and
>> the DDIC. So being a bridge is fine, but in a general way we lack a
>> proper way to describe the display/panel/monitor independently of the
>> DDIC.
>>
>> At first glance it's a nice driver, but moving the timings into a blob
> 
> Let's not kid ourselves, it's *already* a blob. We just sugar-coated it
> enough that we can be happy and call it GPL.

It's the case for most drivers, but since we don't get proper
documentation we're stuck using registers list and can't
implement advanced features. And moving this to a bpf won't solve
but enhance the problem by a large factor.

> 
>> moves something into possible proprietary binaries with possible
>> closed licence and distribution restriction so it's a downgrade for
>> the same of bringing up a panel faster.
> 
> We can already make a proprietary, out-of-tree, panel driver today. That
> being said, the only license we allow for BPF programs here is GPL, so
> if anything it would be less of a concern for this than it would be for
> regular panels.

So you're on to facilitate keeping panel driver out-of-tree and never
upstream them ? this is awkward TBH.

> 
> Maxime


