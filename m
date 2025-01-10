Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219D2E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qU/YhP9GBvho7wDOYndiW+o3LX+a4ZB1ApDiQFDDSEE=; b=tjc8YyVEuUkmY6NgKVaDv/KJej
	tcHfzWLTetGk337iOfWORi5UsrlujcIadk0oV02fr0K8t5KgEzK7ba88WcI7R3fSjdGe7W9Jug9Q/
	E0SOB/FCk4T4HMbOyNuA4h/w4BnJXwmhWyJFn1So/aAN51TlkMTXliZa6ebE67hr++lTVJIjbrZFr
	eg4nEfaZPLWdUCO4ow9s0+GMKnR0ScYszY0QM4bRrDYcQMQjttgUt7D1yDJBJc1QSc6peDpYtfZel
	+QCm9pYTPoVYWFHj4SXQCoZyDdJdzX+4gS9BPoCstI8jeKJnkaIC9CLJg8adA8DO6qjUIDKPDj2au
	MvXtH6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCCR-0000000Ew86-1Nlf;
	Fri, 10 Jan 2025 10:25:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWByF-0000000EtGM-1NiQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:10:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so14117225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 02:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736503825; x=1737108625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qU/YhP9GBvho7wDOYndiW+o3LX+a4ZB1ApDiQFDDSEE=;
        b=xDa3+9JaOP2y1hOSYLNLG2XfMY13tq5tzq8mwMR4gfak24XJPMjrNH6Kw/+NJFkh6P
         hKvUqoEQ7niOTiSPGTi2i92Y83Ng+0MPg/1IaPgD6hrZ3nTi7er4ZfGW5lmjE0fCj17f
         qCg4S2bh1ZoamqiV0XiMDafpBc8+fOLyeE2W5rqdGdKjONx+jm7klprVdRA2hkFWmerI
         dLYi2TI1qYG1Hx2iY8vn88v6yGKCVQ4qvN/3DmQ2gMZ9FhEu3kHj9jXqee6KY6f0oXZ/
         tK/U8utoK+Ytk61kkgySzaDKe4x7JnWDrlFgr42ortBn5BZIrPjWRTltRj2R5meuqDoB
         NwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503825; x=1737108625;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qU/YhP9GBvho7wDOYndiW+o3LX+a4ZB1ApDiQFDDSEE=;
        b=VY/HbIg1FCxKDUvBVGawGwwfVvgCctQL2y8Rsau+2Ueela9AyER1Zobt6WYEkGL2zv
         nFNDAhgcYhmWz4gRZUclcsbtNiqVNvjjhKMPXw8DXU6SesIx0aYc6X2qvXr1wsrh0mPc
         jtWAzqMGlEZlX/OoVaRhrTZe3gvCE+265q277pL6XcVBd6ggCCmWg9YPN1uqRCGt/EAl
         gWZgpZ0o0odBinXn39ahqX26MGQzhs2rkJomTg/rR244s6i0HD9FcgPiw8MjfcHvon1J
         SQe/c6rYy8H/qG5YxqNArCP88Bu8TIzay9PjStVqgHkWEQ6Vl4Lx76ldZsCEr65taBSK
         w59A==
X-Forwarded-Encrypted: i=1; AJvYcCUId1rAKd8nE9u15HA9bt2FgFHXs5VHvGcN+UM+1n2S2/O8+2fJAjOR3jKbTepog8gQa8S5ecfvoyxXtujyPYWY@lists.infradead.org
X-Gm-Message-State: AOJu0YzZMfdoWeL/WNQm98I1kVri1WhQd0m12/a6qBBoaE8EUr05QxAr
	5BobAk9KVIv3AWqO2H5z4XniljTFVouW8E5yLmmGd871A8R6gY4gY6SjflBIRNg=
X-Gm-Gg: ASbGncsQr8qrK5QLUyWx30djkTK1OIYZIWo5sMFVTOo+Xx37gb+uFOz8DXJFiVXbB/d
	NM/EN5X4UFrBxuZsHvfM9fNMkHgVD8zdjncTi63V1qak+/2/gGWF66Hke5AOxBNc/FZJuCDPwSF
	IzqIUPfDEl0QvVESocOG9I2vi6uj7M+5WA0ksFIH/iD1eVFidR9O3vzBdSnKcICraP2bVMMq5FC
	LelEZpaZHGDfUemwDAp8uHIPu2Wtmos/6TS0DYdptM1zQBRb/kFlKwP+g8pHhQg2cfcP5vob4ra
	Vwll9mKjhb8CSo0dSjyNMYTXDrDv9vKi6Q==
X-Google-Smtp-Source: AGHT+IEAfZxwOFx6sDD+ACgYzTQU4qG7OfE8myEixibPdomib11nsV0CbsCQwQeJsvXZ0TfyY9GBNA==
X-Received: by 2002:a05:6000:4913:b0:385:fbb7:672d with SMTP id ffacd0b85a97d-38a8735638dmr8832262f8f.52.1736503825258;
        Fri, 10 Jan 2025 02:10:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8? ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc51sm47902305e9.7.2025.01.10.02.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:10:24 -0800 (PST)
Message-ID: <2967a475-9fbe-4d20-a27c-04676c74d03c@linaro.org>
Date: Fri, 10 Jan 2025 11:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: ao.xu@amlogic.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
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
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_021027_384013_FA20A0C9 
X-CRM114-Status: GOOD (  19.09  )
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

On 10/01/2025 06:39, Ao Xu via B4 Relay wrote:
> This patch series adds DRM support for the Amlogic S4-series SoCs.
> Compared to the Amlogic G12-series, the S4-series introduces the following changes:
> 
> 1 The S4-series splits the HIU into three separate components: `sys_ctrl`, `pwr_ctrl`, and `clk_ctrl`.
>    As a result, VENC and VCLK drivers are updated with S4-specific compatible strings to accommodate these changes.
> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>    requiring modifications to the driver to handle this new access method.
> 3 The register addresses for the video1 and video2 planes have been updated in the S4 hardware,
>    and the DRM driver has been adapted accordingly.
> 4 The OSD, VIU, and VPP components remain unchanged and are consistent with the G12-series.

Thanks a lot for this high quality changeset, happy to see DRM support for a new SoC !

I'll review it carefully next week.

Neil

> 
> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
> ---
> Ao Xu (11):
>        dt-bindings: display: meson-dw-hdmi: Add compatible for S4 HDMI controller
>        dt-bindings: display: meson-vpu: Add compatible for S4 display controller
>        drm: meson: add S4 compatible for DRM driver
>        drm: meson: add primary and overlay plane support for S4
>        drm: meson: update VIU and VPP support for S4
>        drm: meson: add meson_dw_hdmi support for S4
>        drm: meson: change api call parameter
>        drm: meson: add hdmitx vmode timing support for S4
>        drm: meson: add vpu clk setting for S4
>        drm: meson: add CVBS support for S4
>        arm64: dts: amlogic: s4: add DRM support [1/1]
> 
>   .../bindings/display/amlogic,meson-dw-hdmi.yaml    |    1 +
>   .../bindings/display/amlogic,meson-vpu.yaml        |   48 +-
>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |   39 +
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  121 +++
>   drivers/gpu/drm/meson/meson_crtc.c                 |   90 +-
>   drivers/gpu/drm/meson/meson_drv.c                  |  127 ++-
>   drivers/gpu/drm/meson/meson_drv.h                  |    6 +
>   drivers/gpu/drm/meson/meson_dw_hdmi.c              |  244 ++++-
>   drivers/gpu/drm/meson/meson_dw_hdmi.h              |  126 +++
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   10 +
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   19 +-
>   drivers/gpu/drm/meson/meson_overlay.c              |    7 +-
>   drivers/gpu/drm/meson/meson_plane.c                |   24 +-
>   drivers/gpu/drm/meson/meson_registers.h            |   17 +
>   drivers/gpu/drm/meson/meson_vclk.c                 | 1018 ++++++++++++++------
>   drivers/gpu/drm/meson/meson_venc.c                 |  346 ++++++-
>   drivers/gpu/drm/meson/meson_venc.h                 |    4 +-
>   drivers/gpu/drm/meson/meson_viu.c                  |    9 +-
>   drivers/gpu/drm/meson/meson_vpp.c                  |   12 +-
>   19 files changed, 1865 insertions(+), 403 deletions(-)
> ---
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> change-id: 20250110-drm-s4-c96c88be52e4
> 
> Best regards,


