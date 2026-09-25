Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8406C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=; b=TQipPfJ4QYV0dB1OcJQjohDQPP
	496vgf4zasiuAvZ0wmYHBgLGezaQmuDAcOC5F7b08QUrgsJ/e2JX/G6rEbiPARnppn7dHUr6f0QNU
	z2H3M1AySYur9RIrfrIxg213WsjquMwMdj0F+WXqlGjZkneuyXTkQDeGJ1MJL0QCfqo7YN+2VCK5g
	4oCCCcQrcfG1choErKGY2yaz3EoM6o9Le4u1nW8gYphM+RdSM1eD4WAGG2fBqaM4hs0+cubPHClfM
	GQc1v4BT7P+igS4YefeUJ+wYNk2SR9ECqoavjnjXsWnZoRF/Rxd4yLBtV1jzHk4VLtYk3VaUtuCA9
	/95pHiWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1aM-0000000CvRo-3QHm;
	Fri, 25 Sep 2026 08:47:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1aL-0000000CvRW-2689
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Sep 2026 08:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=; b=S0tq1ws/iSJgLBRa7+0JrW7wLL
	unERD9eFTfuSCEdfLe/XGHKzdTEUJNs8+hZUukHCGNJSMG9SEa99RFxr8SDwOi7ZaY0EuldUR7QcL
	HbKeuLHfenV2PDjpak+5d9jH6E1eF1/V1Pc/bGWRgDDqTUT1D7CmTFMsDmXDerbPcF6cIuBvCoIPk
	r8Pg79AGlh6Z8ujHhOfzeshEHCLUCc5dDGjucTIsHa86k9MafjZCLaZVIsCkl7LfC1X01l95eF8ht
	4eehAY761Ck/MSHN/wMmWyBCvJn0ZmmtrK7FeTOF73eWdJv6b0x3M5iW6rypG5ly5Di35AG2YqKUr
	/kgR2piw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA1aE-0000000Gk05-3ZEy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:47:12 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d097b4939so3848685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790326025; x=1790930825; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=;
        b=cEa7N8aNVVMrFEubCtvXx3EfE99YdIh3I6DsiMBYfRtVcNPEy97FVH4o8t01TqsRcQ
         DmwyfYjo1qbRHnwpUyrTfqhoUpolAix0+uyl0RNdUkrOxLT7tM+5/S4duBeZK/Sz3b1v
         0juOUGUxAQoYNsDmfqufVqaYbpv5B5GPFQ1atNlGXD1lrbgoNG9zkgyZq7KPO4WOUQC4
         9rGPVbUE5IMsA7Uc1xexkE7NPgUvCj4b/t51rvcPNz3QBKsvfvuUZSLCAjISveHaSLYN
         G4r92wte9txH1j+4uIn42LG3XnUbSs6/0eMv+Y7gJI5+6lW1i6Sbh7Lc0IJYeEV4FCSC
         V1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326025; x=1790930825;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=;
        b=EBXJPA81b7H4ezcNIUZcHirqlJJuA+jHkvFxBqvAMYxHC0CB480H7VRp5cMWjaYK1H
         QvxyQbicBGlaWxdEO23tu39sP1xJG38U6SyNP3h+k+rW/EPcAb+FXQ94RmVdAW8hwfKK
         ZvRf9jxsS4/oUeGTUvvX5XqPTqddl425JRmm2ppsmHd4DMpYLjYLU+xzfIbvj0N1Gsxc
         TvVbxIAEL6EWMCAg4a24MdIK6vtYrtnqHgOi7dnHrMQ2F3Q8KmSt5ISz+ctGyoByqOrQ
         WsQUI/jzk8CIBn1UUo6r7SiYOVmY/Blz2hZnws2eFt6/TwJsTBqeRAzEeBJYDh0bCdcS
         rDMg==
X-Forwarded-Encrypted: i=1; AKwUvBwEa8+yaE6gQT32cKbOiF2d+uUkg99hWIhamxmUNdPWmBXq/wL3SzS60UhcdB2u59HUyvNLYmVxQNMaA1fCZ9Wj@lists.infradead.org
X-Gm-Message-State: AFuF++lbV8wblyBZsB4aHU6GkhaQ7YvnZ8bVCF1VDoIq455yr+7ovnEm
	HJZBFRKeEL3fwVgJjygav5nXy8UXv04UqRPyPhqrL/Q4um/mCG0RYMwbpXnuNc3qY1hP8NuAt5M
	Qg8KAp68bTg==
X-Gm-Gg: AYBFou1wPa0wHZGJ9t+5kWZ4INuG8IcEdbDfAaQ3key4YX5yg32l0sbQRt+OaFhvH/p
	/TywmPJvTpGOMKsfIRFnPMUui7cntDy4RkLDd7dPc92DpZ75lfYql/YbKhYh6AtaeK19lxebnCQ
	montbvoVadKk2La/I9X7KTd1dvsKrQJFBC2putYxdoDeqc0LqOREI0UHr/+sfkCsZ9Sx6XCPpe4
	3HXW2xKAzDAYAziNVrz5hBocFv400ssIo2tdy4MFkQRAdzXgSmqEd6Nh9yf34Z6nP4pPvD7JoMy
	lUS7QsXSUcMLc6Vc9mAJ/U2VGbxHxeXntAPOHXyi2vNxYa0zrfs4QSLj3+I0Q8Awfxy6Q/7Mn4x
	f1H/XngFw+l689fqjIqckWDGLfp7MHFum83zdi5L46jvS8PEWnygqvtt010SNwkdXv9zBUx+Msa
	rXeFW/JS+YkSCM2u8iV00H+F23MjgiVpzpIM4F8itKw3wAysIXYe0U2MjXWSq8eWaGNG/NUzVBX
	Xw5NF0v8IqmjGG0AEOllTbKK5QpkEJQtdQaln4Dog/BXs5NVnRyxqM=
X-Received: by 2002:a05:600c:4689:b0:49f:bc8a:b103 with SMTP id 5b1f17b1804b1-49fe66841f8mr87493745e9.0.1790326024865;
        Fri, 25 Sep 2026 01:47:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3151:fc9b:d41c:770b? ([2a01:e0a:106d:1080:3151:fc9b:d41c:770b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff04440e2sm41053585e9.0.2026.09.25.01.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:47:04 -0700 (PDT)
Message-ID: <6399bb18-f463-4d6c-80e1-0efca5e7768d@linaro.org>
Date: Fri, 25 Sep 2026 10:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
 <20260924-qcom-novatek-nt51021-panels-v5-3-f5eaf5685c9c@mainlining.org>
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
In-Reply-To: <20260924-qcom-novatek-nt51021-panels-v5-3-f5eaf5685c9c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_094708_747235_4D760CFA 
X-CRM114-Status: GOOD (  13.04  )
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

On 9/24/26 17:08, Nickolay Goppen wrote:
> Add a maintainer entry for the new NT51021 panel driver
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7291238bc09f..743c785b4558 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8354,6 +8354,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>   F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
>   
> +DRM DRIVER FOR NOVATEK NT51021 PANELS
> +M:	Ryan Brue <ryanbrue.dev@gmail.com>
> +M:	Nickolay Goppen <setotau@mainlining.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> +F:	drivers/gpu/drm/panel/panel-novatek-nt51021.c
> +
>   DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>   M:	Lyude Paul <lyude@redhat.com>
>   M:	Danilo Krummrich <dakr@kernel.org>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

