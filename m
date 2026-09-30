Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392EFCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs9QTXyZYNRiUfQ+wZvKCopWk12AffrP+uIc+6uA/NY=; b=rB4elRKh/2u38NcBEY9mRk7Ki9
	pGB34RF1FmTZeh6p0yZChZiyAWrWpnNJLvS0OeKorA4d31x5kABphueGN+Oy86FmGuxNrFmTuhMlu
	eCyy+UAgmvYIbOznjFw3P21j0rLtP6O/wbXRnH2aJ/gOZdaiyx4YcHlAw/IJ3D3wRttk3w1GG7f5y
	MG7t12MHuOKBs7ggaGeTDffAdBiJKYVeaiR48QEaretLp9bWkY9jiiNvq1B7AZMezGCps0A3Ii9AX
	y23iKbFlonqzwvJE3CXQ4D+UXmdCa/HQttpw0M2DPVv1AQeYbsi6Je1CNKugjUDTVfj++NNiCBNKy
	TOQJNOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBut2-00000006DHE-0Ah7;
	Wed, 30 Sep 2026 14:02:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuso-00000006DF4-30Rj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=qs9QTXyZYNRiUfQ+wZvKCopWk12AffrP+uIc+6uA/NY=; b=REP2XVrYMCdRTP4vDvT8X5ObOr
	haBBj2DYlQEtcnPUMW8qfDkelHIhhjPZcSaGSjR3lj3Dw9654bMIffvqKuW/oJXfslXho9IKbBCp6
	Sc5c3W/B6BlF/xSTfR9QrlGCXPWc7P+mTjqfg+Z0W/3ODHtlgWZ7scBs9QY6HcZYTiDDvcSz0Uj4U
	NA4PmeJonyMfpRSVnAPav3Jf/Vg5WIi1D/Dl9zAvfBNVVVM6e43vZPv2DIHu6Cl5NPlo5RIjZxgPY
	j6dSl2F1I1PXjpD3onYqVnNw6FNc3dsZU0RSO0aeMrQDj+GyfF3JxZCAIwRczEUaiKg4cpGtFuNxE
	sYuIznyw==;
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBusl-00000003sbQ-0qKy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:02:05 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66e4aa8d881so5700591d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790776921; x=1791381721; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qs9QTXyZYNRiUfQ+wZvKCopWk12AffrP+uIc+6uA/NY=;
        b=LQvjck0L3BxVtZsLM3JxGxMauZmVFa0QSGA/qnUhL2WTOa8i53Cv8Z9OEJMrJNfwYi
         iQgYbipyrh9gAppCs9alxBkrejElr9Oe3/0v8/EXYmCBLxg3gKH3anOo1OP2vWrAZ8PH
         CrIgoePNa9w8DsXvQAnH+pgdRzzu66mG/6YekLMe0Be0Z08KUiu9JPRHhaD1fMC2mpTU
         wHWa6KflH/OD/bPVFex+YsHHddvLm2ObFzzWoE9e00xE8Z9DGtzPx0j8zC2rjPb2yWhS
         G5B3YCxX2bdSJJCvKD3QOZgBjBLSBGludIS8nGyxsFk9hTH/jr1IQa8ETIh3MbXchihH
         jclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776921; x=1791381721;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qs9QTXyZYNRiUfQ+wZvKCopWk12AffrP+uIc+6uA/NY=;
        b=N+2xLiWPUqygfLDSm3u6OgMlrK895QQKuYecKtNwtua3EzJ0KfmdJTUmCKf4kHJv/5
         cIZfzKOEchs6EEEyF5yju7y0usSiterAfOA8jfZA995cv8QlP7OdmRjMCsvrQWriZG1p
         9hhU18EHl84UUsA+7YDapLFOvYwdhlqdvCd5V0Xtsex9WZUMbsmzQ8eoY0iSdYLHUmHs
         S6EMbg3Aum5wTAkWibEA5URkWeotmwANJMJYNZOddecdVYnIYX+EEntp5NzLdPB1T+PO
         rUzVrTwlvbLKBKtux7R+ZvXdIRerDGY4iLvrT1Fj3OBFBYXkVHnumqJMwB+e++ZVrkfX
         LSHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIh+tC0byG7q9ucfNxATNpyCkzQqzCnzbEnmLWIw05N5ujti5jtTueWKLuhfL8H+bK3roqyI6ZtrWzM2fZwoy3@lists.infradead.org
X-Gm-Message-State: AFq9FYKoy6czjTJNttVYCIPqzfSFeX41urpeXRhCLmlbYJhomaUmkcbB
	53qu2LnrM/8HX/DyFARph2fgkU9Lza1keKX6VXjXUUOyCvEpqAYhgvIpDQgGDr/T2eQ=
X-Gm-Gg: AYBFou0pNVDQIE69lzrVrMNvAS7o2Bb3Hy506aojFzD4ROuszO9LP4LpUleoyB4PzK8
	Qa8EzdY5K4fX71ltt8loCzMbLxgm9Tht6I97OqsHOPI/dQWdhH1lpJW95SvzIjSJ8FYV3n9t3sL
	dyGUENwsqtZ6vyl6i1NE0h763RnJjG8ddhNhwJ4vDyHa0+fepf1Bs82+DMEMqlvHEQY9Xt0Q0I1
	F11NgMu3zOu7RQbrg2g0t5L4YFRoJAlZGj0Rfx4CZHFkosG/c7Hv9YcXVwqj7RIgjc0S3ul6Gbd
	mo+zy0FqrCvIrhV/kaxUwnYTe/9OSziTD9HUb0ILelljJKDe9cVq7qHV22CQ5s1R5Xv42hms9ie
	6/yfEMIE9uR5rYTBiJ4AfHUA+J6Mh73xgG3oiVn4HPFsGlgiLfdZIfovTdvD4/Y01VLAk+AoJ1d
	te4E/gbyLGiWfRv85wr4tQnDFIJ2bgmVFL4SX3hejXPp1NJeRp2F/dXfV73xPcyLORI8WN5EZK7
	6JkZto2s+XG6bzSBV0CyftkQfcega3d8stIYMCHItqExO/txQWBhbUaPrh7CWXw6ZeyN4O5mZkK
	3BgL19XYeaJB4mUdfQ==
X-Received: by 2002:a05:690e:484d:b0:66f:c238:7657 with SMTP id 956f58d0204a3-67683530372mr445880d50.76.1790776917625;
        Wed, 30 Sep 2026 07:01:57 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67680ac3521sm764290d50.1.2026.09.30.07.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:01:56 -0700 (PDT)
Message-ID: <6c581ae0-2480-47a2-b46e-97afadbc7c1f@linaro.org>
Date: Wed, 30 Sep 2026 16:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
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
 <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
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
In-Reply-To: <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_150203_551667_1A4C42DB 
X-CRM114-Status: GOOD (  29.31  )
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

On 9/29/26 11:03, Jani Nikula wrote:
> On Mon, 28 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
>> Panels in general, and MIPI-DSI panels in particular, are pretty
>> difficult to support and require pretty much a panel driver for each
>> panel produced. Most of them are pretty simple, and require an opaque
>> initialization sequence that is usually poorly documented.
>>
>> This creates a tension between OEMs and distros because OEMs will
>> typically get a new panel to react to a sourcing issue during
>> production, and thus need some swift turnaround between getting their
>> new panel and it being operational in the OS. Distributions on the other
>> hand can take years to ship a kernel with that new panel driver.
>>
>> To solve this, I followed the example of HID-BPF and wrote a panel
>> driver that will rely on BPF programs to perform the panel
>> initialization. That way, we can ship the programs separately from the
>> kernel, and with a different lifecycle. If this driver is accepted, the
>> plan is to have a userspace component started by udev to identify and
>> load the right BPF program for the panels found on the device.
> 
> I'd think for most panels it would suffice to have a declarative
> language describing what to do at what points in time. For example, at
> poweron, enable this GPIO, wait a little, write this set of DSI
> commands, etc. You rarely need actual programming, or even ability to
> read-modify-write something.

Yes we could have a similar panel-simple but with init tables, but
in reality those panels offers much more features we don't handle because
the DDIC vendors and panel integrators just don't care exposing those
features, but they get handled by vendor implementation like for Phones.

> 
> It could be, say, YAML converted to some binary representation. Maybe
> that could be in the DT, or maybe you could override it with the
> firmware loader. And obviously any vendor "blob" could be trivially
> converted back to YAML and upstreamed.

I don't think we want this, downstream vendors does that and we don't want
to go there.

> 
> Where that falls short, you could always have a dedicated driver, or
> extend the declarative stuff.
> 
> Now, the question is, how much more BPF solves over that, without
> requiring a dedicated driver, and is the added complexity worth it?

This is my global question, and this is what I'm evaluating here, and so
far is created more problem that solutions.

> 
> FWIW, on the Intel platforms that support DSI, all of the
> initialization, poweron/poweroff, backlight on/off etc. sequences like
> that are stored in the BIOS, defined by the OEM. A plethora of DSI
> panels, one driver. Don't look at it for examples how to implement it,
> but I think the basic idea is workable.

For _some_ panels, here, as a general solution no because we really
want to have full support for panel features.

Neil

> 
> 
> BR,
> Jani.
> 
> 


