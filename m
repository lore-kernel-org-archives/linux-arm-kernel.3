Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FF9CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URK5hJaiby1L1KtEXv2HgCyxpcy+Et12hnj8ni1/g3I=; b=bxaRBcIIBnc347XOAtGZzvzup7
	54/BrGkrUoK6QhVma64fg9Mkm+PC1dFdk1CBz6thBHoTbZ7eFzk7tkn3iE9NWfQzJoINjzt843tyz
	Ci659JocpwdTPPryS0+BWGrLdClnxPcAF+SmY2IJUhzMFDcz4CGPJ4iYna/OJrceEbI+ePqW/Bf4x
	I9CqOHSemKB0YfJWK8Nll2xTSAu2RpfPHvdQMa0EzVdpLMYi4LqgF245wLY19gdXQFbbpehYxtS/o
	tKhywsmDBDHKEIDldkzK0C0iwUqFWlqfwV72plxzUdm0nQn4kCyBMjesq5wf7J6tWRYsAXNpgzNG1
	o2Bz1fXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY4y-0000000AuoX-2Jcg;
	Fri, 02 Oct 2026 07:53:16 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY4u-0000000AunY-1Mh3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:53:14 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b05fdb2f9so1717036f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790927590; x=1791532390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URK5hJaiby1L1KtEXv2HgCyxpcy+Et12hnj8ni1/g3I=;
        b=nWsqCEgKzT/9W1qGwpvPIFfyqWbw2Vq0WWPBBUx5Q6J5ETDyNG3zoE/qkx55TirrD0
         AnOstK2cMxAdWyD45bsmrmOkyjLC8lb6fPVuaQiZg5XN5ptKSJGg10bYRz3b5cQBly+K
         9lCngSLSECGg1rUpFdOQ7/fZQPmY26zzvu4zoNbG82v1Q+hl15Id8dqSYu+kMFCh9w+q
         g2umcUy6Emmuh802vOTDpUvJMRP42WcZGzdToG69SU6nRB7314R4sYdCtI2cB0W5yDYG
         +rcL2qAxIFeu+5ZiqnKFJbidbRmPeE/Kook6UC2jnEe4+NFow8+sfdWrjiPR9BoUNHmY
         8MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927590; x=1791532390;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=URK5hJaiby1L1KtEXv2HgCyxpcy+Et12hnj8ni1/g3I=;
        b=gynhLc6Up92nfYZS2tZeYkUIJy/Q4kZ1/6fHqqKFWg+3hLZc+8IIAMJIWtyOh5UMNZ
         aWvMbh6JEt0ukaq2FEUiUauvJJQdabzycQJQ7dn6XoGzsH3mnLARBVx0b/S78AVWFd0V
         1neEDwaZUqu5hm4KHU7Jc+aHTzNb0C25JKzumnt3RZC6b7csX3HaXm7pUdQaprfj6ap8
         UxMKEUs4CNJcWNCwBNhXxE7l2IpnW26OupY4MtTUsBrFxKdBvRSVZzwhtBvwBFOXqonV
         UcBNZzFb/IapeFDu+N5/11kGUDF0xMGh2YWShR+qNDlXQL6sKIuWnDVMId+b6eZ8MYhx
         AXxg==
X-Forwarded-Encrypted: i=1; AKwUvBzz7TdlXyimeCUI8NEwIsvW3N0GhWbvO4aAn5QTcl2yv8S3O7aqQCTv15xwQ5nv3StROpHyx8HeWg5nVkeQvy0P@lists.infradead.org
X-Gm-Message-State: AFq9FYL4IuXP30WWPIwC7OwB54+Bs3b3l72pnP8AEEYf6WjmtoCkhIlK
	BsOZuAp3kjwqA37r7fd2eLSpdA2ewPOFZawZ2FTphV7C6Xru2ggbDu9NFGbM9OwLJWk=
X-Gm-Gg: AYBFou0zX+SKthFbiiCZIVbBpZSuzVre5MOsji9m/YJJYReaJJPHJiqMnNV7KC1a9Bf
	RZipCcn/9ygspz6xeGvwNaj0ZP8lcSUQz1NLYl3i6jM920LOoHk/HE0LgEBj16Vvnoh3z6W2sui
	1eijfMrjjYuTzOtB3KXKc91fkzaAefh7EWn3ba87JIJaKnTas1TNRlZ35mi+HEgOjFUTMxrF+d/
	EPGNMt+kvZqU2sChDARYnF+CZ/ZLb+SnAZ2U7ePE1VfkUSmBrCQn2JBCOyEMKtZocjrwcivI6tv
	L62p35//O58TEx/oeeADdgc4LS2Hzq3wt6wPgzDizpmKLWqDXjvKBpypSa2SjNcWSgOlFDvKqpg
	VHWM7aT4Xix2tBl31wo5CAYjBJJgIdEKiItyuD++QwXsdT5NOy/zlo16slODbE/ZKg2tZCHOs7w
	eFZn1ILPqvpv4wfCqllvc/5mLP6ZroFOlckJjOfhHcfhV9OlRk3H8fYhEEBD8i7cbkz7V4ZuQpf
	OyXDpzgBAoiD9yqSjIrCjpl4/JnhAf3lYNyipQrpLOkGR5M1SF2
X-Received: by 2002:a05:6000:46da:b0:48b:68:592e with SMTP id ffacd0b85a97d-48b126c2526mr2669376f8f.4.1790927590269;
        Fri, 02 Oct 2026 00:53:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0ab7sm3840821f8f.7.2026.10.02.00.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 00:53:09 -0700 (PDT)
Message-ID: <a92aa0bb-d50f-4b67-a645-942090d4fe79@linaro.org>
Date: Fri, 2 Oct 2026 09:53:07 +0200
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
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
 <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
 <xlv1cxtsft8e.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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
In-Reply-To: <xlv1cxtsft8e.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_005312_409788_2D821B80 
X-CRM114-Status: GOOD (  18.87  )
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

On 10/2/26 09:37, Javier Martinez Canillas wrote:
> Neil Armstrong <neil.armstrong@linaro.org> writes:
> 
> Hello Neil,
> 
>> On 10/1/26 08:50, Maxime Ripard wrote:
> 
> [...]
> 
>>>>
>>>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>>>> technology which has serious drawbacks and dependencies on user-space even if looks
>>>> really cool.
>>>
>>> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
>>> you can have a built-in panel driver that works without user-space
>>> intervention. So this is not a topic of discussion anymore.
>>
>> It will still have users-space dependency, meaning the BPF files will need to
>> exist in the fs when drivers probes.
>>
> 
> It doesn't have to AFAIU. The BPF programs could be built into the kernel
> image, just like firmware binaries could be built-in as well.

Right so my main question still is: what does it solve exactly ?

All the descriptions I saw so far is that it simply moves
the panel C code to a BPF code with no other additions.

I still don't have a clear view of what is precisely solves.

It adds some complexity to load those BPF driver, adds some
maintenance complexities since with every API change we will
need validate BPF still works in addition to C (and maybe one day Rust).

As the maintainer of the panels, merging a bunch of new panels at each
releases and helping migrating to newer and modern way to interact
with panels, I think I have the right to express my interrogations.

I'm clearly not the oldest kernel contributor & maintainer around here,
but the main interrogation I have when submitting, reviewing and
merging is : does it really solve something efficiently.

I don't want people to be frustrated by my review and question,
but I feel I'm allowed to say I'm not convinced about this solution.

Neil

> 
>> Neil
>>
> 


