Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD4AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmEs8ouBliGOCMobju3l9AIdN9DwWGs50L/Ux0bkJ98=; b=r/fgE5nDx6nlU4fh6P75sc5RFg
	xVMzru3Z5XqyLi5CMg9pfgWGOHSoGS8UdDQk2ATKLAAKG8AOFaTSngP0NDERNj7H0C1RuHyrAtfkw
	g+yP5OzXHGpzSxuJJuW9Oag9fKuJfKyGiWq4ivRTMtoW3zenyrjKtg3w40UrAhPMGL6XrxhLLWL4f
	mD4o1BXfyGcdCry+Yr0ky2pwBLdF21zC+PVRu0FvM63ExQess1zjUUOvCVtoC4UXNCNnipPkpC4hs
	SGDAI5HOBVzsAADHfjHEFCH6+3d4s4DEG88e+AxV5KueuHUc5iPY89EMWFYP/6ccEz/M8JMhhbcsL
	IzZj3WPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titgj-0000000EdfB-0X0e;
	Fri, 14 Feb 2025 11:16:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titfA-0000000EdLb-3jpQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:15:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4396794c044so6375245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739531715; x=1740136515; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmEs8ouBliGOCMobju3l9AIdN9DwWGs50L/Ux0bkJ98=;
        b=DqFrHOwHBJoer6ueIWTG4esJrgEU/kunxr8u6lLHorfOGtvxzIkbGXbALT/rxZJOPz
         bJaZgSo9lpEHn1o1LBLqWIFBZkT+/PGZoxcpfKa+fOaFe6XEmYa5JJ0mfJdjyG5sW6wY
         ar50Wcpv159S2PBRo/7T1JPCuk+d2gCPplDywhKt4ETWtJbAyVfev9NHWjo40enxBAf6
         rfh4IZSzCYMzWbxErBNChlJs7Cdpa/S/t9tXr4DNVLc7lNQT+mbJXcyRylSTqwA1v8b/
         DrQOEXCXowm7idq0Lq/+AxwB7ROdzIeRAWUN5Vjyv91B+O+8UZHPLhpVq2FUMo/2jev+
         bcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531715; x=1740136515;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QmEs8ouBliGOCMobju3l9AIdN9DwWGs50L/Ux0bkJ98=;
        b=vGirJc0Rchrq8zGK3pnMcJRPbtzMVn7/g/mKNXkFA3lYJwFxFVjzYSaC7GfJXDAv+k
         Kz6fxV9BgqeaiQWGYsAZpqQ96y/Kzd5Ry/oQMPaPR/QaYvDBtPZvD+qss4AiIEB/hYtt
         epdoFgFW1OdxOV1SjHvodYLnX6nLOFSypDpY1LNZs9i1DMUbxl5f/0v+cF2ov7OdLorB
         wee0x6VkxGw9M7InRTqSbrpY4QuAppWFma7W3HRPEcuaaTy8WUdSA1H2Gm8+Ey6ByQUJ
         qz4Ry6ud4GX2SWz2khUvg92hLLbzsGLahmLKZBTSbz8URgcFtdAV9H1g1WCa2SmqDLX5
         RryQ==
X-Forwarded-Encrypted: i=1; AJvYcCU05gSpKEhPP4+H0JEDW+5Vsyi0UZqxgD//L2mRmWg3gWNOFZY9hJmTuzHwgN+lVOpkxVeqcP1WQG71TMdWh9pq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9CB2dCdMSuofLBNlGA9/t92ruuiMnmGCbj0dooBMtEiov9TJf
	LKhld3AiBiWWNYbJxDYUsHXRHTX9MGeq6itHw8hxBv6wHQd22cww5yHMecgb2kY=
X-Gm-Gg: ASbGncvzdVTOO1MLEcpjlLMulKRYgbSO9nAMavTKH6fU8Oybw0hRyCUH7aVrZ5/ica6
	Wym6HKGr1ra9nwA7hRRw6Kv9LCErHyOIQh7IcUOy4AyOtwbPqCTXFrbB1NUeyQIKniyu290MyJU
	Kk7pj6UWuFLfvXRsaVg7lQaj1EmMfMpecfpsitr80QdVrDZ0u+aw8wmuTMuS2NPkuzEHrqfVELw
	oCj/Ju+REC091bHVPuJJaZG5MnfUKUVWPAtQ7hH9+IRjjY1QS44ul9HYPhj3XGXM09NJ70BCXh0
	w4BZxdGYKpRlObqQxy9Equ6A+B8GpdD6zPIHYD6x5aBnfeVuimHbu0ngEufBoAs=
X-Google-Smtp-Source: AGHT+IH5QDoLnhR0CwlUWQfd6my7FcGNb6CjS78uJgkB/lJP1TtFLz/ksqBTEmg2Q8Mj2ObQDYbmrg==
X-Received: by 2002:a05:600c:783:b0:439:654e:ddf6 with SMTP id 5b1f17b1804b1-439654ede03mr61452765e9.9.1739531714673;
        Fri, 14 Feb 2025 03:15:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1506:c298:390c:8a? ([2a01:e0a:982:cbb0:1506:c298:390c:8a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617da91asm42409885e9.2.2025.02.14.03.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 03:15:14 -0800 (PST)
Message-ID: <d0ec285d-6a27-4f28-b622-6048a9dcb6e8@linaro.org>
Date: Fri, 14 Feb 2025 12:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: meson: g12a: Fix kernel warnings when no display
 attached
To: Martijn van Deventer <linux@martijnvandeventer.nl>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250213221702.606-1-linux@martijnvandeventer.nl>
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
In-Reply-To: <20250213221702.606-1-linux@martijnvandeventer.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_031516_941588_6648DF6B 
X-CRM114-Status: GOOD (  16.97  )
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

On 13/02/2025 23:17, Martijn van Deventer wrote:
> When booting SM1 or G12A boards without a dislay attached to HDMI,
> the kernel shows the following warning:
> 
> [CRTC:46:meson_crtc] vblank wait timed out
> WARNING: CPU: 2 PID: 265 at drivers/gpu/drm/drm_atomic_helper.c:1682 drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> CPU: 2 UID: 0 PID: 265 Comm: setfont Tainted: G         C
> Tainted: [C]=CRAP
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> lr : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> Call trace:
>   drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>   drm_atomic_helper_commit_tail_rpm+0x84/0xa0
>   commit_tail+0xa4/0x18c
>   drm_atomic_helper_commit+0x164/0x178
>   drm_atomic_commit+0xb4/0xec
>   drm_client_modeset_commit_atomic+0x210/0x270
>   drm_client_modeset_commit_locked+0x5c/0x188
>   drm_fb_helper_pan_display+0xb8/0x1d4
>   fb_pan_display+0x7c/0x120
>   bit_update_start+0x20/0x48
>   fbcon_switch+0x418/0x54c
>   el0t_64_sync+0x194/0x198
> 
> This happens when the kernel disables the unused clocks.
> Sometimes this causes the boot to hang.
> 
> By (re)adding the flag CLK_IGNORE_UNUSED to the VCLK2 clocks, these
> clocks will not be disabled.
> 
> This partially reverts commit b70cb1a21a54 ("clk: meson: g12a:
> make VCLK2 and ENCL clock path configurable by CCF").
> 
> Fixes: b70cb1a21a54 ("clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF").
> Signed-off-by: Martijn van Deventer <linux@martijnvandeventer.nl>
> ---
>   drivers/clk/meson/g12a.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index cfffd434e998..1651898658f5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -3234,7 +3234,7 @@ static struct clk_regmap g12a_vclk2_div = {
>   			&g12a_vclk2_input.hw
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_GATE,
> +		.flags = CLK_SET_RATE_GATE | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3270,7 +3270,7 @@ static struct clk_regmap g12a_vclk2 = {
>   		.ops = &meson_vclk_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3354,7 +3354,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>   		.ops = &clk_regmap_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3368,7 +3368,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>   		.ops = &clk_regmap_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3382,7 +3382,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>   		.ops = &clk_regmap_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   
> @@ -3396,7 +3396,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>   		.ops = &clk_regmap_gate_ops,
>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>   	},
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

