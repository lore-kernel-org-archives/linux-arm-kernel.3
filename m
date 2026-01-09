Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C98CD167FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=; b=4StG4AlYMCmuU2bcOxLEEoAtHi
	AkeTVGN63nFMzNw87B7fEQ4qjat8I+DdEhYF+rN7zU164a5l6KR21td5U2jdMp4gdWucl6q17N2RZ
	XYhI6NDPK+e+Dmhv0JufsLM1j7z0czdLLpg9Pl6PpJjX+urSF+2LQaE7JEVhOxIVnBS3qZ8WRXiq9
	YorRTvTDKk/6A0sBuIwdRMmOcB/IHAPyEB/6A3Hzrv2frXPSuMg1w752TDFekUnI6khC7m0mqwx81
	O+SxExKywQbER2yWFpehkH0nAJck4GOKUq51A6T2k7uKLbeDcMyYuQmszWsLDyb6APHWIpJ48Zzl8
	rtzGzJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Ur-000000026ep-0tQF;
	Fri, 09 Jan 2026 10:13:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Uo-000000026dT-0Er9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:13:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so3244747f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767953607; x=1768558407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=;
        b=dK92hhUSBpk1eTdTeovHqDPx80bXn/D3xQX8ashm6kWIdwYm7hdsB3pfFpV0LzJ1p5
         qchyUtmvi+U6LsHR0N+z7FVoKzIZpQzAX6jEnOsaF/3IqdheVHQZ/5bQP7diO8UHbXop
         WFvp1K3OB4Ao7Dlm4KT2fjECJLn93yQW2jbbzoLDeSGjmxZzQsVg7va6fEKlFdnlsoxq
         Gi5Yaq9nD6rpkIW05jzrNoyR2beD6A4LApBE189IgFgG9deqs0m6TjOOqwnbcNuHkLq7
         P58vAoP+Q3lhFB4Z2nvoCiu0QqrFomxsHQ2rVa/I5kygoEBvBeJ2sikbJzB7tNWq7fQ4
         SV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953607; x=1768558407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=;
        b=BmKL3tssVyeUcuswe/oceVaDLoDIs6edPm9VYvdRxmki2hWuYkclq+pHRKBmQ4rTqc
         o+oiHuqVW1kQeMvJkhEtbouhEUxXN8QjX/xZRa+sEoGxOqyeKDce7qjvZfBP4cSTibFI
         McC3s/PPIDWD5W7l3DZNb51ZisFJ9L4fJaVpVABpfyi0C+WzuMwCs6McIUG+qyi+9Jnt
         96hLSSxmXJda/7eRxydrDTrBb2lRLu5AXFDxmNV9k3XzUdCQDVxo4g3UBmGu2tW5xAky
         hv7YuN6XIUzRmf5Jm9WDQkPtuCb96FnHOxfrf/VPsnqjT2HfS1rtH2HT9+zmsOaWRdFu
         3N6A==
X-Forwarded-Encrypted: i=1; AJvYcCVBuxUbKPMNONTYKfc0fllELBc8FXVVofCkt6rLPYluwtMDu0OZ/6xBcwx9vb4glOqy008nomOBelgMrir+C6VP@lists.infradead.org
X-Gm-Message-State: AOJu0YzOpUDPw6gsDZN42OpsTpdgYcGGykvtaoAc8BAe3m48fN1po9Gr
	hgKbAs0XPEA/cXsmDhsDNdr4kdK8wgd186AqpkmWmS7TUr/2G8cBy1B2NYm0g/3jTVM=
X-Gm-Gg: AY/fxX46d3YkXWpb6mU48Ud4v6h2tkguzl12hqElh8UjcaY1i9zOud4+IOhv1e/Wmfe
	1Xp4Qehbt9nGhv2IX11/OT7oXsf6b1xgrhnab2GbADMaQ7bGdLzbfQtarqkiGY94ONGsdfO/22O
	ayScVXcj+vd96CLDdureZxgaN6c1bvuNaFg5Q+hZYtxbw/i/NJXLrZCCKHC712tHowq0ICBYigG
	10YYsWnqO1rXdMcCAAlHis705FFqc231mGjdyPKw12rgIcYyk4kdPU6CMJ5R5N1WZ8at+QJNTrS
	1x7hfXneMjkNQyFdiNJw8SuE8NzIAxlx6NXWCs7aaQFsJ+1NcFKTnfXyLoqoHtqo1cGG4+zW985
	YF/LB6OUSgNSukc/dbHMcb4Ntdve6fWXjV86lVwRqQ6srRlhIEWMfDG5F/Y0s9yu5BbiLLtW4Bu
	UCP3O6bAclWRgtPYxXoUkSihbbnnsCr2Nq7j9oe9OW/p3yhih20/q0dZkg3mjykkA=
X-Google-Smtp-Source: AGHT+IFCikJ03J/WgyrsSQPwxIM5AkWewsU7YWY0NL1QPgGkyLNv66hXXYzshWOTAsB92VRUvv8j1A==
X-Received: by 2002:a5d:5f94:0:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-432c37c87e4mr11007824f8f.39.1767953607247;
        Fri, 09 Jan 2026 02:13:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e175csm21370007f8f.14.2026.01.09.02.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:13:26 -0800 (PST)
Message-ID: <ef2c22a0-3335-456c-9281-e54085c849d2@linaro.org>
Date: Fri, 9 Jan 2026 11:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
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
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_021330_114490_815C2385 
X-CRM114-Status: GOOD (  18.83  )
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

On 1/9/26 11:02, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
> 
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
> avoid potential use-after-free ensure the irq is freed before putting the
> dw_hdmi->bridge reference.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 0d7c68b29dff..fef1702acb14 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -778,7 +778,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	if (IS_ERR(meson_dw_hdmi->hdmi))
>   		return PTR_ERR(meson_dw_hdmi->hdmi);
>   
> -	meson_dw_hdmi->bridge = of_drm_find_bridge(pdev->dev.of_node);
> +	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(pdev->dev.of_node);
>   
>   	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>   
> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
>   				   void *data)
>   {
>   	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
> +	struct platform_device *pdev = to_platform_device(dev);
> +	int irq = platform_get_irq(pdev, 0);
>   
> +	devm_free_irq(dev, irq, meson_dw_hdmi);
>   	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
> +	drm_bridge_put(meson_dw_hdmi->bridge);
>   }
>   
>   static const struct component_ops meson_dw_hdmi_ops = {
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

