Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F7DCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8UQiiW/gzilrgvSzhDTIjzX+BX5W1JZdipDo+7xtF0=; b=2CFQPXa+sTGzldsdgpaEAP0J1+
	GizaBIli+K3EPHxgWsZWKIPXQyQpfXKAZUCq6+Uo2GFnY7VgTbh3Dig1JuG+YQ+I5e3NTpS8uw9MQ
	QcF4hGVJZbPVPCx8uXMFEh/NkBuvaaWmDNUrr41sVOQzGEa5B+O7ye3suq6sy5q/qqYkI09JViCJp
	RsojQkQljv1qxr3w2iJoUw6FRPZOYve4Zu/os9qNoGHR8Zw7TvOMsqGoZw02jmLwZD+AdnidfWSHR
	rPy2taRzMbbQ1tI5i8kZBHoF3dJIh/8V4ctvihxrSAL1uYTM5TIy7yD1/BB3e/fzl+MizbfD+VCsT
	9gAbSKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOBJ-0000000Ezl4-18ok;
	Sun, 04 Oct 2026 15:31:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOBA-0000000Ezjp-3uqM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 15:31:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso190275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791127867; x=1791732667; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8UQiiW/gzilrgvSzhDTIjzX+BX5W1JZdipDo+7xtF0=;
        b=ve/u1JEEBQa0Zx6eCDuLPhD9uQsrYBUGq9qlIFBntcgPpG/Jemz+RsscNDsA+v7pIX
         hvNPkGY9elAEtcGnBBm8c9Z/tJRAFn/0YjR6wLSFUdGVVSgrlHRSCi1TCzOo2e2A0nso
         p99ortwUAnULTOafCha2dF6IG35tA0+7Uu0kfVJInb8SVJUWAPnnipGOGSvmwQC1qzvn
         gFPssad+YnLM1kJXNQXYYiHXUaMpexWdD3ssRCd6rkIyRAZo5CTNtgOpFUjrISVI6dUB
         tYoCkneN4sjrp+yT7PKk3P1G1s4jfDB317vo6Xr67hsk/qrmZlhFhzHpgYthfVCQxu0Y
         18kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127867; x=1791732667;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8UQiiW/gzilrgvSzhDTIjzX+BX5W1JZdipDo+7xtF0=;
        b=Hi13DLBtrzE6lECr8oUCDrkS3JDTHKB09X3Ujy5/ZMIWK25ybs1FXfS8Owc1Q+4PdA
         i/OB7OHpZOI5Oy4Q/K6JJFjEhG8Fo3EX9SDx/q7IGoa+OO1ie9jTSM5WsOhroWwmIuYe
         O3iGDTM74X5fV1Hboqkjxzt4NjH4/u/9yxWpN7DhGwuCISnNyajHAQe6KK3OLz4p4HAi
         ucJ3LTRTy97rrOaBiuGAZpSIH+rDxx1dwgtWVP6h1eeg3bWfs2lMkGoIz78XJGafjoL+
         wqWCTrEK6LvCLMCcs6Hb0OGQaP0IQ7XS10EdPZcLz/QzXuisJ9fJngEkF3h3wzf3yAZc
         yGuw==
X-Forwarded-Encrypted: i=1; AKwUvBwKUJ1Q8/USCUEfRZKSLvvQtz9FUb6sjMXhInEVuxvlTFUi0tLbEIZH2Bm0DVUiWyyHc7L0QPX5cpDkLQJGaFQO@lists.infradead.org
X-Gm-Message-State: AFuF++lIjRjGsBguGz8c7CC01p27jYQigQdfxbpwlMODc/LAakPZQMXf
	dsraLfGVhcyX7CNdsthlQN+UARjUClU+tCN3g6/VNatsR5fsjdG0HD3JgVw4MOXcMeY=
X-Gm-Gg: AYBFou0tdkGyDgJjj2QTMSkGXnPqgHnR19DLjn5wnYApwMm8huMxYpdHJcn0h+1iDP/
	xgaQCZkuXIMTQU8vYQ0I0Ov9fAOqJgDexvhXkXVX5MFDTtehgaCBSgMj059ReciNXmLfcK/Fese
	4LIP1s+eeTTrKTfpJou+M1zjf9ToGcU739eNlsdYx8wrxC1JtMqm8OScvkVhTD+9x4cGi8oAOMK
	UMjoymo7absCtDfCtNYl4u3XECf/M0InuNduIUioCus84Jt+8nVmpzWS6qAwocQsMlqury557hM
	vMH3HULbNVsJNZFnQy6KgJiwMyTDu1wxW8Ix/v4QVk6Y8fignGX8UBjNTWxiosbcyl1INHS8brA
	oxU+96nDT9NzTOQA0tZoy1klv5ml0nkkvsE0gJVgmCMXBtx87Bkl9457bF8krXcj4Ch7zXERtDI
	4t3Q69p8pYiSE/JyQHFGYcnCmi+jHf/okcMk5R+3zgqlwOxxHWxRsJkizRoluPdTQdux1x+OHFe
	Uow+CGm
X-Received: by 2002:a05:600c:3103:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a1680fd804mr74504535e9.30.1791127866831;
        Sun, 04 Oct 2026 08:31:06 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm262949745e9.14.2026.10.04.08.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:31:05 -0700 (PDT)
Message-ID: <022f5372-7963-41b1-ba76-2d89c51aa8c6@linaro.org>
Date: Sun, 4 Oct 2026 17:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: encoder_dsi: load ENCL gamma table while ENCL
 is disabled
To: y-asai.0816@docomonet.jp,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, John Williams <porschemad911@gmail.com>
References: <20261004-meson-gamma-v1-1-6347558e2bb3@docomonet.jp>
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
In-Reply-To: <20261004-meson-gamma-v1-1-6347558e2bb3@docomonet.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_083109_015508_5AA300BC 
X-CRM114-Status: GOOD (  22.69  )
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

On 10/4/26 16:50, Shigeaki Asai via B4 Relay wrote:
> From: Shigeaki Asai <y-asai.0816@docomonet.jp>
> 
> meson_encoder_dsi_atomic_enable() programmed the ENCL gamma LUT right
> after meson_venc_mipi_dsi_mode_set(), i.e. while the ENCL timing
> generator was already running (ENCL_VIDEO_EN=1). Writing the LUT
> during active video stalls the hardware: L_GAMMA_CNTL_PORT
> WR_RDY/ADR_RDY deassert and the ENCL line counter (ENCL_INFO_READ)
> freezes, so every remaining write times out (~8s total at boot) and
> the panel ends up with a corrupted gamma table (wrong colors).
> 
> Instrumented boots on the ODROID-GO Ultra (S922X) show:
> 
>    failing:  start: VIDEO_EN=1 INFO 0000001a->002d0000 GAMMA_CNTL=00000030
>              stall: INFO 002d0000->002d0000 GAMMA_CNTL=00000000
>              (VID_CLK_CNTL2 / VIID_CLK_CNTL / VIID_CLK_DIV unchanged,
>               i.e. the ENCL clock is still running)
>    fixed:    start: VIDEO_EN=0 INFO 00000000->00000000 GAMMA_CNTL=00000030
>              no stall, no timeout
> 
> Whether it failed depended only on timing, which is why enabling
> lock debugging (LOCKDEP etc.) appeared to "fix" it most of the time.
> It happens regardless of the bootloader (mainline or Hardkernel vendor
> U-Boot).
> 
> The function already writes ENCL_VIDEO_EN=0 right afterwards before
> re-enabling the encoder, so simply move meson_encl_load_gamma() after
> that write. This matches the order used by the vendor U-Boot's own LCD
> driver, which never times out.
> 
> Tested on the ODROID-GO Ultra with mainline U-Boot: 5 cold boots +
> 3 warm reboots, no timeouts, correct colors, LOCKDEP disabled.
> 
> Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
> Cc: stable@vger.kernel.org
> Tested-by: John Williams <porschemad911@gmail.com>
> Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
> ---
> This was found on the ODROID-GO Ultra while bringing it up on
> Lakka / ROCKNIX. Happy to test any alternative approach.
> ---
>   drivers/gpu/drm/meson/meson_encoder_dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index faa309cb97a6..912cd676bbe2 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -65,9 +65,9 @@ static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
>   	/* ENCL clock setup is handled by CCF */
>   
>   	meson_venc_mipi_dsi_mode_set(priv, &crtc_state->adjusted_mode);
> -	meson_encl_load_gamma(priv);
>   
>   	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
> +	meson_encl_load_gamma(priv);
>   
>   	writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
>   			    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
> 
> ---
> base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
> change-id: 20261004-meson-gamma-3306257c0d28
> 
> Best regards,
> --
> Shigeaki Asai <y-asai.0816@docomonet.jp>

Thanks for figuring this out !

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

