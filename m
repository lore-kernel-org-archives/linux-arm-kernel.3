Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0707ECA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQ/QxsaYA9sPy0Rq4QivZtNIQwREX4bWNN8dGL2Ve94=; b=osnubGMYyhsF7nmTSiad5TpuBK
	CGG0UIWxiOM6+1GpPe7gzZ1PIeaeAbSqU6FjpAEYX4CiEYhoyDnVzC6pOE6MVZERMBqQYK1BRssfi
	TowHxv18RUgBSRgMgG48AaLIAPZAc+O7d1NSFhn/0nPgtSLGMcmBbHhW8WYPqkvR7D7HR46C1Ai1j
	M21WKRQsW2M7iwr46Xyx3c3iYWWEzbxTzQs6jrruyAhHxxkMTm+GbAXdG7I5EAqfXf6Oh3pCQ+4u0
	Ng7jEJu5Z1rTBAKWKfq1XIbrIrL5Q30xhTpGEjui8GBTrE7oeDjQEQ+ef75mZCAMjedOWL+HuRF9U
	wezVFUxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGpw-00000001PYR-0KkJ;
	Mon, 28 Sep 2026 19:16:28 +0000
Received: from mail-vs2-x0d.google.com ([2a00:1450:4864:3a::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGps-00000001PXv-36Hu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:16:26 +0000
Received: by mail-vs2-x0d.google.com with SMTP id 71dfb90a1353d-5c67e529da9so1077515e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790622983; x=1791227783; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQ/QxsaYA9sPy0Rq4QivZtNIQwREX4bWNN8dGL2Ve94=;
        b=tm8N6/RWJAuKXV3Bze8XNwMhKwYYvgkd65mMlvW1LnIPBMZbuWOLMWE1f00EsKWMXb
         pMiRglAbtRbpVLVQPYMSMTm/mf+eC/g43vnffFUfLFH6Je/QMnPjwsCa8gcCo+clWXkV
         QyQ+odkKXoZE3J8tcVBO5ZrbjoZebtkOeoHmwa8X3aFuTXtFKlhGVo5Z4OBF4Wld2XaH
         z0VrHVFwNouYQFbYdTCd7wWn2mI/kDLRvuZWa2/HWPi+Nu1Qrelh1VDAUoyfrTUgK2gW
         0w7i9RNfGyg75oshSLYj8LaCoPJoONUIFm8omhcq+5mZOsFWIwErn7ND3N115HNBVLFl
         DWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622983; x=1791227783;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQ/QxsaYA9sPy0Rq4QivZtNIQwREX4bWNN8dGL2Ve94=;
        b=hAj5xNxZ3lLv2vJKBUk4KR20+Qkcwo4kPxCoWUi5pNW6NYZV/7nbi80asNd3T+manO
         51uoxfNSxVSqpTdC1iAevemG+vrVEs2DXyzY583rS3LJcyTw6T20BZrtlhQNtDwLFBg8
         0uQq2mdbze2umZ2pMwP6gP6skD7EmVlGz6CqMrJjiOzFP0tId4GvWnCAuSdlW992DxjI
         vTR0Bv6zgOCRyYytBjQtyKno1KBdiDHhf74uNf9Sq15NgaKEOgn8PXQxrYTZng5udj+m
         BZ4KM2EAND3HZ0eqqfhmSohQ/NZxA6D+Igmif+6tHgrpVA20Z94PEU4Aa6OjmeeBy5zh
         RThA==
X-Forwarded-Encrypted: i=1; AKwUvBx0VlYkHA7vcBecEFkfCY48ai6JpWQZbveFjml4xZuRYdz3/suoBbbHafOkDUcKofjUZWsUF3Xj1gJoQGHUdbMN@lists.infradead.org
X-Gm-Message-State: AFq9FYJcscZZ3OD29JNIWwWSyI4tKioeBJYsRRw1HSxlCgqzTk3WjrXe
	XKzUu4+NmcjqfUg/yRtbAkxMaEWWEohToN+53N+e4KN7aOFC0CzO3NmT1e4pE9aZ/38=
X-Gm-Gg: AYBFou1TL/Ki9wW4yFn8kv0L6tdt/ACkFzURwjoD02e+mGqszftbrQrBycq7MZRDV8A
	MWjMkhoYX36Th6g2dB525wF1oC55wzoieI5Fm9CeJ6ONsnqEBobCAdWyAoC5iuj2zNvhSuJod/I
	l1dvbHqc8mgT+lZAL2TQxx9T3lvt7Y3t9AcEvtV0/LhF7XzZPyNdVvFkTz7Jao3DRaOrFS/qIMP
	C7p0pKRHAU76E3yuxviCMu5E4GtzeAr4ZU12uVR1atFTk+UoNZN1FHqC/7QUiSoWR0Xg2mNQqqq
	olTX2isWSN7BC1Rs1oz+8hsjrK3mvEkTfRiEi3QHC7vckMoX7xOTKXRTJH+3jH3rgaeE72vjIpg
	spWYXJ9vdzPc85D4/xFz0u9M1Ej3bqV7brZobWSPNfAO+BV+Je6gdCNvg6cEvB6tBau3/PZzisT
	rljhDlD0cbnWFJVyHZJgFhhuBNwxRNYU7Z/rSBTtcqkOSdmvQWnpoak29vB2uiXvtxhq501p4dM
	ar/2D4U19ha0aJa8IgShVxKwiuB/8rDs8hKL6OF0T33fYpBvwihGO7gy4k2x8varNR4OFMC4sIt
	Zo20Xyw=
X-Received: by 2002:a05:6122:1313:b0:5c9:a60b:e5d5 with SMTP id 71dfb90a1353d-5cb0b67e6bbmr5760667e0c.15.1790622982793;
        Mon, 28 Sep 2026 12:16:22 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde4f969b9sm10052205e0c.3.2026.09.28.12.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 12:16:22 -0700 (PDT)
Message-ID: <8fa0c826-9d4a-487c-b7db-5412118364d5@linaro.org>
Date: Mon, 28 Sep 2026 21:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: display: Add panel-mipi-dsi-bpf generic
 panel binding
To: Maxime Ripard <mripard@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
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
 <20260928-drm-mipi-dsi-panel-ebpf-v1-1-5244926aace4@kernel.org>
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
In-Reply-To: <20260928-drm-mipi-dsi-panel-ebpf-v1-1-5244926aace4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_121624_834370_27EA2A54 
X-CRM114-Status: GOOD (  22.32  )
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

On 9/28/26 18:22, Maxime Ripard wrote:
> Most MIPI-DSI panel drivers follow an identical pattern: acquire
> regulators and GPIOs, perform a reset pulse with specific timing,
> send a vendor-supplied sequence of DSI commands, then enable the
> display. The only truly panel-specific part is the init sequence
> and power-on/off timing.
> 
> The panel-mipi-dsi-bpf driver replaces per-panel kernel modules
> with a single generic driver whose panel-specific behavior is
> provided by BPF programs loaded from userspace at runtime,
> following the HID-BPF model. This enables new panel support
> without kernel patches.
> 
> Panel DT nodes use a two-entry compatible with the panel-specific
> string first and "panel-mipi-dsi-bpf" as fallback. The generic
> driver matches on the fallback, while the first compatible is used
> to identify which BPF program to load.
> 
> Six normalized optional regulator supplies cover ~95% of existing
> MIPI-DSI panels: vcc (IC core), iovcc (I/O interface), avdd/avee
> (positive/negative analog), and elvdd/elvss (OLED EL driver).
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   .../bindings/display/panel/panel-mipi-dsi-bpf.yaml | 184 +++++++++++++++++++++
>   1 file changed, 184 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bpf.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bpf.yaml
> new file mode 100644
> index 000000000000..9a20a21cf70e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bpf.yaml
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dsi-bpf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic MIPI-DSI panel with BPF init sequences
> +
> +maintainers:
> +  - Maxime Ripard <mripard@kernel.org>
> +
> +description: |
> +  A generic MIPI-DSI panel driver where the panel-specific power sequencing
> +  and DSI init commands are provided by BPF programs.
> +
> +  Panel DT nodes use a fallback compatible so the generic driver matches on
> +  "panel-mipi-dsi-bpf" while the first compatible identifies the specific
> +  panel for BPF program matching.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - description: Panel-specific compatible string
> +      - const: panel-mipi-dsi-bpf

I don't see how this can be a valid hardware description, bfp is a software
implementation and has nothing to do in the bindings.

Neil

