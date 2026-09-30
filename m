Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0745FCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00vEEH7L1j3RTeCAPOrHPZHBxJBgpO2ITSxaC+oPgZQ=; b=PKfsOLPZuV+Gtn2XkkUx1V7bnG
	75sEhnamoWUX7eOevVisyohh+mx95N4pdwe2dHyqioUwhYCffnVN9TKY9WOzR2Pq6SXuei17PkCNX
	gAB8QQjxad3KoWwbLN6OIAfhy6CdBCrymAHUNPJiJgxWl4NdePKDTksZ1Ij2LpPC4X0kmDexeFZRM
	/bruC40wWo8e4o8OjKc35JH3NuiYwY3QzMGiGLQzoWidlNZRC6piwcTVKqktLjVF+BMGdlx9DdGbQ
	2+tl5/P0pskQdBzisIr2HNnXb9lyRNZApk0pt0SDVW7UXvV7whim6ykBJmfUEz6Wd4IcfRfSFqT3D
	ArIrRJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuQE-000000068n7-0zQb;
	Wed, 30 Sep 2026 13:32:34 +0000
Received: from mail-lf2-f13.google.com ([74.125.229.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuQ9-000000068mI-0LHw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:32:32 +0000
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so5225233e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790775146; x=1791379946; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00vEEH7L1j3RTeCAPOrHPZHBxJBgpO2ITSxaC+oPgZQ=;
        b=s+sT4ayNDnHluOOW1ABmFF485QK/KBnYOtZ1YCFDUFZJAO+G/XFRPzu+ee7DRCkMQE
         DYYdwa+yvmpUJ8vNYyQaxrYCwqmrsJBdMHHrjL6RqEUMMgoE+rF2qE8Yh43VHN3rOY4F
         g0y24Zn+nkMTlMtNPZE0DMkQXYx1uX0FCHkjCY2U3OcbY3F4AOjs7JFuVXHezG5BTmj2
         yQ80xim8lQR9SmLogHuD78y5Jz6f1MlLI8x49G7OXXx2nClqaTvXDTWo/Y+aaYq8rKvm
         6fMXANfSfsItZh5Szw2PBfM0f5WcVq8wAJf8S7QlyOsydDbCpB5Q9hhZTxM8OvWZcLoY
         gCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775146; x=1791379946;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=00vEEH7L1j3RTeCAPOrHPZHBxJBgpO2ITSxaC+oPgZQ=;
        b=utVcR+7Lq8C6vu/HGmWVh9CT6s2aZsH75THsspkuZMtSPZQPB00OnHY6ZLV9r6Mdr6
         NDrU7/7MZTmnqG4MAU2A0reEPI2MflI3EYVN2oxu+aKjZCeusdTM8unFQaIRM+zKx1+v
         PdNQHqLhEKfFW6G6F6cZlfbrPFWYVmDWJAgE52rEsgnVT8FpCQEE2VHlfxKAx8OnHPqw
         eooyUhTapEtZXHr1uul6cCVZ52VbbpxtRJFJvNc/z/VTymgSbmTIjLnL93GXVpPkWmWc
         2ZH4tK5qhZbLBxCpiuL7j8XHbBi+MaZRWg1TnaGVoBOf8YAhuevei7pKRYH4RM/yc4M0
         z9yw==
X-Forwarded-Encrypted: i=1; AKwUvBxrcjgIUJL8bHlLI6Oo+fJ/Lmiyl/eBKTCfFziTKaJuBtUA1Sx+8cSWGpyNXNpctkV5R9+1WDtMNPYBS89rd9ac@lists.infradead.org
X-Gm-Message-State: AFq9FYLKpRytsM7jgF6+TMp1tj/N+HSB8itM3I8ty7uA968GrFaLGEFy
	sCNZv+fFrnYDEQvKKQ82sZNr5LXOm4tx6EdQv16ICQH9s5TQNCsjjOHN7GaiGRUdNjw=
X-Gm-Gg: AYBFou1qE/brjTOIuXuPqx5+BE29Ml3fMLuZVvQC4VJ5IZbzybsirH0hlNZUwUHSLMY
	Jh3cLKv5AwcfscgkAWpm2tWutggf1ac+TwGIug+nN8L0xrZC6HzHzYK2aaprrl69sSz7iT1HXXT
	+qRCl47JZKfL78TUTZCV48u/+B4H7urxRlUZ8Iu8hyN14OVlB5sd/6fTBKIZD5Cgz3gwKY7PUDw
	8RZpeo+vTPGeIlNh6Ua9mVrb0MOotCcvCe6Y/Tzjf7cDn/j+6lrYSE2JaHmSxxY+Xv4S0r4q60d
	G3LRKTQGZByKYFAW904Bi5To9rTQy9Rs8kDyEJJ/D0mQugkVq/dM9rciTiLke/jKDgCalAiG5LD
	yKSiBH7cCYZv3oKxyP3XYcPC5o9MLbVgRXluXfq5vN3KBqwVvDP6gRs0O6z3iUkH2B4P2ZuHVGV
	oK6QJ3wuVHqFydxjyfim3IL994Kk+VX0/2cL+s78YwDqxuR9BKcHb0H2JB6Ytat4sj3W+wo56qK
	RmFALemmpiE6bFLjWrddYDiKPSGRoH9S/9C1UJtBfxTdm29cahcTaVd3axjaQ7nJw0RjPbjelMS
	zY7QAHU=
X-Received: by 2002:a05:6512:290b:b0:5b8:ea1d:ce0f with SMTP id 2adb3069b0e04-5ba40600866mr515249e87.67.1790775146114;
        Wed, 30 Sep 2026 06:32:26 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbbc003sm357173e87.12.2026.09.30.06.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:32:25 -0700 (PDT)
Message-ID: <742d5bab-51cc-49f0-825a-f299a055bb1e@linaro.org>
Date: Wed, 30 Sep 2026 15:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: display: Add panel-mipi-dsi-bpf generic
 panel binding
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
 <20260928-drm-mipi-dsi-panel-ebpf-v1-1-5244926aace4@kernel.org>
 <20260928204059.GA515872-robh@kernel.org> <artyl8fD3zzng8Uh@houat>
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
In-Reply-To: <artyl8fD3zzng8Uh@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_063230_334311_841924B0 
X-CRM114-Status: GOOD (  18.71  )
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

On 9/29/26 10:39, Maxime Ripard wrote:
> Hi,
> 
>
<snip>

> 
> panel-mipi-dsi-spi is a generic panel that will load a firmware, and
> quite similar to this one. google,android-pipe and qcom,fastrpc don't
> attach to anything and will just open a tunnel to userspace, which is
> somewhat equivalent but more dramatic than what this driver is doing.
> simple-card or its variations will just instantiate a kernel driver from
> the DT and is used pretty much everywhere.
> 
> I reused the binding from panel-mipi-dsi-spi for this. It was reviewed
> by rob, and acked by a panel maintainer, and 4 years ago, so we're way
> past the "oh but we didn't know what we were doing back then" argument.
> 
> So, let's phrase this differently: what's different about the
> description than panel-mipi-dsi-spi, or any other binding already in
> tree?

The panel-mipi-dsi-spi still describes a class of H/W control interface,
not a pure software driver implementation type.

"panel-mipi-dsi-bpf" or "panel-mipi-dsi-rust" or "panel-mipi-dsi-cplusplus"
would be the same problem.

> 
> If it's the BPF part, BPF is not Linux-only, and there's hardware with
> direct BPF support these days, so it can be considered OS-agnostic and
> not an implementation detail.

If somehow panels used a standardized MIPI firmware we could define this
in DT, but here we're basically inventing our own type of firmware from
thin air.

Neil

> 
> Maxime


