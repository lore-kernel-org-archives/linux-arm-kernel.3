Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16CECA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elEJPdcRzf4AoHzJ3HTFysx+7CDqgMfvBfQYC/vrwSs=; b=0R3JhEZURmpL1b/TJPd72RSAOc
	N7UbhHts4bWnlsDGHzbWZ6MI8016lZGEsbVCyj9fUveN9kRM5BkNqUEsuu8k8CmA8I+zM5SFvX7No
	fcFQ9VyQwkOZKLVWfEBv3r68hPQ8e0zl1GNrNsCNDY7KqqaNLpPt1ASRPS4SLglKYUjQiWslAC1Xq
	L0MlTS4q//c1cjg7OazsgZfVqiRh/OGn5jVcCDdtrftUcy6ElOPtUgZPgtTgirNLW5EKHiwrBi+Wd
	DXL4G4NzPQsY2xJ0Acyundv88J0zgcBO62AR17JTJFOpG4Uvc/3yTRjnvLymaI9+zoMmzhvb9Df3u
	PfvVks1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03H-00000007Tzm-2Eeb;
	Mon, 18 Aug 2025 13:37:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuuz-00000006ug0-2HnB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:08:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b916fda762so2295514f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 01:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755504516; x=1756109316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elEJPdcRzf4AoHzJ3HTFysx+7CDqgMfvBfQYC/vrwSs=;
        b=Y8vsanV28mKurlCP8Aw8ljyOQpa0IChGrEbY8pxV4WGkACpGUms5kiaFdxKwHo6euf
         YuNQ4sKsgC3Hyuzt/26P0UiZHUQdSj+Y6vLTSo368UI+vbHA6gtOWTL/OWtuEupdYDrI
         G5l+G5mJReyNucZL11/TIFrQATib/XZdLYB0wXTA3AVnxq/7t4OtTCpX0q2xBqw2Ee8I
         Jmw9TMxqljDgMXG09uPBfbAo/50Xwd5Y3AWlsVjwKYG/fZp5sgvfuKsczH60peT2bXDU
         d8cAt2Z02GtOYgFNAyHcz6DYW+2UWTNXNqNtinfkDKwbyx8AQna3FvApX6qG0TsaYmWe
         jV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504516; x=1756109316;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=elEJPdcRzf4AoHzJ3HTFysx+7CDqgMfvBfQYC/vrwSs=;
        b=Vn5XDa9ABvq8X8+VG0kJbNpb2vfMZlOIyDdnEt6BPQWxS71UrMwNVcO5EMi8aVaIAU
         Voac8ry727qVt8hS2VfNxho3oRo+ITrUlQBYWXE4WMyll+OQBDJO5mEFLa3EViK5Vm2N
         AYifRuTz5d5Jkw6dKDh1A1UzOgN42/9+Yz4xDpMUf4EICE330vNPntpkxCFeqBFRT35w
         r5cSkEpUpQ053Rwq7WNOahTHAhZzlqiUAtv7Rpzd2OOu7Sdxv5Kd6GACfBvcd4BnJFLj
         khdjiv10j+xTuBLcclgtQn7S5dUecZZlh1PSw7eUNowmQmrkrGvaPTvpYEIvRp6Horls
         ztXw==
X-Forwarded-Encrypted: i=1; AJvYcCVH/lw9ziKFAZDpy74ntASsjfbVF3BHqhW98sD9FPsoSTp0m/QHIDIrJFKuNNkKnd50BEjr3JOKEZWAaqI5AFHA@lists.infradead.org
X-Gm-Message-State: AOJu0YzHMDiHkz5I2j27MKl+z+d1olb1pMHr+e/2S9G/UanPSHnpQ8WB
	+tUBnRzx2mj7g3fMWV0VxGkk3qKCVIr2eD25mxgaxIqiW3h2WzYWxqmJ0knw+knOdq8=
X-Gm-Gg: ASbGnct9+6cY58mFjGma02aNo2SVtdfwyiA56ttj5t6WroFcY8PO/0EKyFqcqr1Hr16
	EMePmQpMaHbP2OOCpP6KRobujAw10/VTimbY8ZX5zdgGLM1ebOX/NpSip1UJTcYAgIaKiM+YVuk
	69M2MPB1n3+xIp9N1xr/ZQOvqoOuxNjDr9vM6a+QOS1guCKRLADYpI643mJZuOxUYmpoJPiB7p+
	/pNVqeouOUaxChZmRAvoDrouBGnmmvNplgwb4UmF+AMkJVCMoZqfvDFWG1AOF+5zabCIuXwEEJB
	enJt7aoyPMdZ2YPackF6VqZnFHJvOVKeStesm36i3hngZzaDRzErIHdzgzCmSBp4uCfTJw0aDUW
	zf2qY09G5Ij8nEFGKQS6NMM1mZkeE2pAAAfPsCMdHmJ0DGrNEAJrp3Zyl2MSKEzvsbmfqcBfd
X-Google-Smtp-Source: AGHT+IEV/tKPxIV4CiXdCsoRwjIQw7DcU75vVWJ0k+TKlA/cHd3fxVCK+aTUSCDUGfTKr01x0FeBPw==
X-Received: by 2002:a05:6000:18ab:b0:3a5:5130:1c71 with SMTP id ffacd0b85a97d-3bb46fc7df9mr8247891f8f.0.1755504515600;
        Mon, 18 Aug 2025 01:08:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:70d:8646:e014:cc6e? ([2a01:e0a:3d9:2080:70d:8646:e014:cc6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676ca37fsm11744214f8f.41.2025.08.18.01.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 01:08:34 -0700 (PDT)
Message-ID: <e173b1b3-ad91-46ad-b293-c52948bb32a1@linaro.org>
Date: Mon, 18 Aug 2025 10:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 2/2] drm/bridge: lontium-lt9611uxc: switch to HDMI
 audio helpers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
 <20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com>
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
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_010837_597617_E8EBA69A 
X-CRM114-Status: GOOD (  27.73  )
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

On 03/08/2025 13:53, Dmitry Baryshkov wrote:
> While LT9611UXC is a DSI-to-HDMI bridge, it implements all HDMI-related
> functions internally, in the firmware, thus it doesn't make sense to
> implement DRM_BRIDGE_OP_HDMI. However it is possible to implement
> DRM_BRIDGE_OP_HDMI_AUDIO, streamlining HDMI audio plumbing (which
> includes plugged notifications and ELD handling).
> 
> Implement corresponding callbacks and trigger EDID read /
> drm_connector_hdmi_audio_plugged_notify() from the hpd_notify callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 125 +++++++++++------------------
>   1 file changed, 49 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 38fb8776c0f441ae433c60a7680aaa6501a8956e..11aab07d88df646a54fea287030a183eb823b26d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -17,8 +17,6 @@
>   #include <linux/wait.h>
>   #include <linux/workqueue.h>
>   
> -#include <sound/hdmi-codec.h>
> -
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_edid.h>
> @@ -27,6 +25,8 @@
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   
> +#include <drm/display/drm_hdmi_audio_helper.h>
> +
>   #define EDID_BLOCK_SIZE	128
>   #define EDID_NUM_BLOCKS	2
>   
> @@ -48,7 +48,6 @@ struct lt9611uxc {
>   	struct device_node *dsi1_node;
>   	struct mipi_dsi_device *dsi0;
>   	struct mipi_dsi_device *dsi1;
> -	struct platform_device *audio_pdev;
>   
>   	struct gpio_desc *reset_gpio;
>   	struct gpio_desc *enable_gpio;
> @@ -429,12 +428,52 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
>   	return drm_edid_read_custom(connector, lt9611uxc_get_edid_block, lt9611uxc);
>   }
>   
> +static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
> +					struct drm_connector *connector,
> +					enum drm_connector_status status)
> +{
> +	const struct drm_edid *drm_edid;
> +
> +	if (status == connector_status_disconnected) {
> +		drm_connector_hdmi_audio_plugged_notify(connector, false);
> +		drm_edid_connector_update(connector, NULL);
> +		return;
> +	}
> +
> +	drm_edid = lt9611uxc_bridge_edid_read(bridge, connector);
> +	drm_edid_connector_update(connector, drm_edid);
> +	drm_edid_free(drm_edid);
> +
> +	if (status == connector_status_connected)
> +		drm_connector_hdmi_audio_plugged_notify(connector, true);
> +}
> +
> +static int lt9611uxc_hdmi_audio_prepare(struct drm_bridge *bridge,
> +					struct drm_connector *connector,
> +					struct hdmi_codec_daifmt *fmt,
> +					struct hdmi_codec_params *hparms)
> +{
> +	/*
> +	 * LT9611UXC will automatically detect rate and sample size, so no need
> +	 * to setup anything here.
> +	 */
> +	return 0;
> +}
> +
> +static void lt9611uxc_hdmi_audio_shutdown(struct drm_bridge *bridge,
> +					  struct drm_connector *connector)
> +{
> +}
> +
>   static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
>   	.attach = lt9611uxc_bridge_attach,
>   	.mode_valid = lt9611uxc_bridge_mode_valid,
>   	.mode_set = lt9611uxc_bridge_mode_set,
>   	.detect = lt9611uxc_bridge_detect,
>   	.edid_read = lt9611uxc_bridge_edid_read,
> +	.hpd_notify = lt9611uxc_bridge_hpd_notify,
> +	.hdmi_audio_prepare = lt9611uxc_hdmi_audio_prepare,
> +	.hdmi_audio_shutdown = lt9611uxc_hdmi_audio_shutdown,
>   };
>   
>   static int lt9611uxc_parse_dt(struct device *dev,
> @@ -508,73 +547,6 @@ static int lt9611uxc_read_version(struct lt9611uxc *lt9611uxc)
>   	return ret < 0 ? ret : rev;
>   }
>   
> -static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
> -				    struct hdmi_codec_daifmt *fmt,
> -				    struct hdmi_codec_params *hparms)
> -{
> -	/*
> -	 * LT9611UXC will automatically detect rate and sample size, so no need
> -	 * to setup anything here.
> -	 */
> -	return 0;
> -}
> -
> -static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
> -{
> -}
> -
> -static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
> -					 struct device_node *endpoint,
> -					 void *data)
> -{
> -	struct of_endpoint of_ep;
> -	int ret;
> -
> -	ret = of_graph_parse_endpoint(endpoint, &of_ep);
> -	if (ret < 0)
> -		return ret;
> -
> -	/*
> -	 * HDMI sound should be located as reg = <2>
> -	 * Then, it is sound port 0
> -	 */
> -	if (of_ep.port == 2)
> -		return 0;
> -
> -	return -EINVAL;
> -}
> -
> -static const struct hdmi_codec_ops lt9611uxc_codec_ops = {
> -	.hw_params	= lt9611uxc_hdmi_hw_params,
> -	.audio_shutdown = lt9611uxc_audio_shutdown,
> -	.get_dai_id	= lt9611uxc_hdmi_i2s_get_dai_id,
> -};
> -
> -static int lt9611uxc_audio_init(struct device *dev, struct lt9611uxc *lt9611uxc)
> -{
> -	struct hdmi_codec_pdata codec_data = {
> -		.ops = &lt9611uxc_codec_ops,
> -		.max_i2s_channels = 2,
> -		.i2s = 1,
> -		.data = lt9611uxc,
> -	};
> -
> -	lt9611uxc->audio_pdev =
> -		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
> -					      PLATFORM_DEVID_AUTO,
> -					      &codec_data, sizeof(codec_data));
> -
> -	return PTR_ERR_OR_ZERO(lt9611uxc->audio_pdev);
> -}
> -
> -static void lt9611uxc_audio_exit(struct lt9611uxc *lt9611uxc)
> -{
> -	if (lt9611uxc->audio_pdev) {
> -		platform_device_unregister(lt9611uxc->audio_pdev);
> -		lt9611uxc->audio_pdev = NULL;
> -	}
> -}
> -
>   #define LT9611UXC_FW_PAGE_SIZE 32
>   static void lt9611uxc_firmware_write_page(struct lt9611uxc *lt9611uxc, u16 addr, const u8 *buf)
>   {
> @@ -858,11 +830,17 @@ static int lt9611uxc_probe(struct i2c_client *client)
>   	i2c_set_clientdata(client, lt9611uxc);
>   
>   	lt9611uxc->bridge.of_node = client->dev.of_node;
> -	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> +	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT |
> +		DRM_BRIDGE_OP_EDID |
> +		DRM_BRIDGE_OP_HDMI_AUDIO;
>   	if (lt9611uxc->hpd_supported)
>   		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
>   	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>   
> +	lt9611uxc->bridge.hdmi_audio_dev = dev;
> +	lt9611uxc->bridge.hdmi_audio_max_i2s_playback_channels = 2;
> +	lt9611uxc->bridge.hdmi_audio_dai_port = 2;
> +
>   	drm_bridge_add(&lt9611uxc->bridge);
>   
>   	/* Attach primary DSI */
> @@ -881,10 +859,6 @@ static int lt9611uxc_probe(struct i2c_client *client)
>   		}
>   	}
>   
> -	ret = lt9611uxc_audio_init(dev, lt9611uxc);
> -	if (ret)
> -		goto err_remove_bridge;
> -
>   	return 0;
>   
>   err_remove_bridge:
> @@ -908,7 +882,6 @@ static void lt9611uxc_remove(struct i2c_client *client)
>   
>   	free_irq(client->irq, lt9611uxc);
>   	cancel_work_sync(&lt9611uxc->work);
> -	lt9611uxc_audio_exit(lt9611uxc);
>   	drm_bridge_remove(&lt9611uxc->bridge);
>   
>   	mutex_destroy(&lt9611uxc->ocm_lock);
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

