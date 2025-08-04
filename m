Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7C7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifdQYtMoMbUhaDaLztKpCS+6vqQS+9SK4PGyB6S6f3U=; b=WAEKNFFT3B5Rlp7BktjLn8i7lG
	kcp44ErGWiaWJ43vDQyoSAJqA/3sJwXAmea7zusNZf+T1KslN3XXRH7WgoP0/epjnZVlfohH/soaF
	HFjZPu7NQRn3pxXFvfoY6H9w/u2TtBIfeg3zEoeBLzhsBJxWYR7kDO2Qah7VeDplHdKElKLF/VdIz
	6AhwP/VtUmvYn5HhnqfoIA2K7upPa5xqrdJKrgJI8rItHGjucrLXR6znQNUKCK7UeT1Lpmz4RUYXl
	8wqO+ppzIg7ofx0RX2QNe+IJqNJIeiashkSRevdEZRSuPnCn36swrnZ+ItRSdYk5SBTbanjCUZ0bq
	KozN9vng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixRi-0000000AsX8-357s;
	Mon, 04 Aug 2025 15:49:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwvE-0000000AlIw-3ur1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:16:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b7910123a0so4543928f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754320579; x=1754925379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifdQYtMoMbUhaDaLztKpCS+6vqQS+9SK4PGyB6S6f3U=;
        b=ObRtLnxpVzM2IlW/wnW8D6ebCwr2hguitiI2k6Vv3RhNk6ioHkUCnLa3sSdzM39Qsx
         BmT/5DmagrSlJHT6iIrD/V+/XIqmalrapaWCzM/7QJ9i3pUOM7t8A+j+1yZmnnuzkJGI
         QPaWWUzX5rvr+aS8xzGCW4GhgH7vVel6QytcGZsYfj+e46UCTYe+1ceSZdY//BFh+FOV
         fWkYY99yL/jx8Zbep8PS0d3wtDeog6tVTJT5X4djT/1FWPBpxMsatOJ72pEeV8Mpfgoh
         wavAY41/8YKEqEdQYezZRwvTvJ2SGBAnDrIyakrd03Kz6viMzb0kg8mfO6tGWsr7tQ2D
         LehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754320579; x=1754925379;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ifdQYtMoMbUhaDaLztKpCS+6vqQS+9SK4PGyB6S6f3U=;
        b=UZTzfwykdjtlVsxwmjf/0lk/aG4EuoWw81toZD08zB1XwZrXfFz6trjUwd4eRm3QDA
         0uy2O9WlVkOOBH3NAX0JXQ5j1Kh4d02TW940I2m0MxW6ZkaKdHPDh+D2a+hapwvtTLNG
         br/LHbLVLwDXerpmqzyD4Hzch0foUKTD5bp917QJ2OZ3KzftgR6QtAbY1b8qtvY2baT4
         oY5ApmWM4k2nRpL9CDM9j8w+83DVL82tGf3zY6zq65hVrnKG8cOsvBvglzfSwmOsxAhy
         cKnqX85NEmjZj/6ysANaiV6Z7ctn1NpyhNnEmTEPTkGx34zXCIC2MpJxkDoYP4ff3CQO
         t5YA==
X-Forwarded-Encrypted: i=1; AJvYcCUncDNCgsTsQvQLFDhsmZCeO+/OE7kTW6Vh8oxzWTYwaCviLPSXWyGjwjpFbt9FYZms1FltB5izFsP8HhQYDanM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd2PMOir1Kwtq1lb6T2ovOxsOwW/LLJOsCYNRwLTbvwGGVPPCa
	+QWymMYyBn9YxHQoPeeojrfi0KQ1O2KZxXj1zgP7aN5LUF8uSJOjrmob9dFpuBFKh1Y=
X-Gm-Gg: ASbGncvvx1t2bx78id8crdNNtuhvMKQVpFCp+wPvihGpZYArud6bxksSZggWDo5li+F
	jn6wD8eAeDCn5mYAvdkFo2Oau6s2sUtLMV2S+8zBk61DA56EiNuDOY6DjAvoUUjjvB4Cwx2iXZR
	5LNiHlVls78Loy2gWlj54fwzuVI54GxiAcnnz9EGnlEgUmdiL/TrgVuUZ2laIXX5LsmNArEJuuK
	6Fpz6n6Nwe4fic49rsBSTgiezsNaLeDS1RZVMRIQX6tDW3d2CDtiYM0h9LxPxGQhqn/AA8Zu9Jg
	rWfnKlNvqr2idrPyILfZI8BLl9WuYjh1n8b2Qun/gDPsf2GDk4R81oaFUixwrxgBsM0elp1fdMw
	fsLeKpnKztHNh758kA8d1ef44HH0/AMuO6Lq+We6l5LAsyOru9MD344DVfaI8GMMvovZPjs0B49
	o=
X-Google-Smtp-Source: AGHT+IHPPDD9D0qxXu9jHrNySpU2UAtNfOEP8mZOWyrtTy6JCiloSri0pkmDPr9668JfOlIhW9A5cA==
X-Received: by 2002:a05:6000:2881:b0:3b7:8146:4642 with SMTP id ffacd0b85a97d-3b8d9472439mr6472193f8f.20.1754320579282;
        Mon, 04 Aug 2025 08:16:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f? ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b73868a4sm99448145e9.11.2025.08.04.08.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 08:16:18 -0700 (PDT)
Message-ID: <a8c59d2c-4c4f-4eb8-a371-03c1169c479e@linaro.org>
Date: Mon, 4 Aug 2025 17:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 03/13] drm/panel: ilitek-ili9881c: convert (un-)prepare to
 mipi_dsi_multi_context
To: Heiko Stuebner <heiko@sntech.de>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, andyshrk@163.com, nicolas.frattaroli@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-4-heiko@sntech.de>
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
In-Reply-To: <20250707164906.1445288-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_081620_979850_DC95D714 
X-CRM114-Status: GOOD (  21.61  )
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

On 07/07/2025 18:48, Heiko Stuebner wrote:
> This saves some lines for error handling.
> 
> For the address mode change, that value is always an u8, so switching
> to dcs_write_buffer function should be appropriate.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 66 ++++++-------------
>   1 file changed, 21 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index a20b52181ea0..154eea5f4d77 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1239,33 +1239,24 @@ static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
>    * So before any attempt at sending a command or data, we have to be
>    * sure if we're in the right page or not.
>    */
> -static int ili9881c_switch_page(struct ili9881c *ctx, u8 page)
> +static void ili9881c_switch_page(struct mipi_dsi_multi_context *mctx, u8 page)
>   {
>   	u8 buf[4] = { 0xff, 0x98, 0x81, page };
> -	int ret;
> -
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, buf, sizeof(buf));
> -	if (ret < 0)
> -		return ret;
>   
> -	return 0;
> +	mipi_dsi_dcs_write_buffer_multi(mctx, buf, sizeof(buf));
>   }
>   
> -static int ili9881c_send_cmd_data(struct ili9881c *ctx, u8 cmd, u8 data)
> +static void ili9881c_send_cmd_data(struct mipi_dsi_multi_context *mctx, u8 cmd, u8 data)
>   {
>   	u8 buf[2] = { cmd, data };
> -	int ret;
>   
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, buf, sizeof(buf));
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> +	mipi_dsi_dcs_write_buffer_multi(mctx, buf, sizeof(buf));
>   }
>   
>   static int ili9881c_prepare(struct drm_panel *panel)
>   {
>   	struct ili9881c *ctx = panel_to_ili9881c(panel);
> +	struct mipi_dsi_multi_context mctx = { .dsi = ctx->dsi };
>   	unsigned int i;
>   	int ret;
>   
> @@ -1286,54 +1277,39 @@ static int ili9881c_prepare(struct drm_panel *panel)
>   		const struct ili9881c_instr *instr = &ctx->desc->init[i];
>   
>   		if (instr->op == ILI9881C_SWITCH_PAGE)
> -			ret = ili9881c_switch_page(ctx, instr->arg.page);
> +			ili9881c_switch_page(&mctx, instr->arg.page);
>   		else if (instr->op == ILI9881C_COMMAND)
> -			ret = ili9881c_send_cmd_data(ctx, instr->arg.cmd.cmd,
> -						      instr->arg.cmd.data);
> -
> -		if (ret)
> -			goto disable_power;
> -	}
> -
> -	ret = ili9881c_switch_page(ctx, 0);
> -	if (ret)
> -		return ret;
> -
> -	if (ctx->address_mode) {
> -		ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_ADDRESS_MODE,
> -					 &ctx->address_mode,
> -					 sizeof(ctx->address_mode));
> -		if (ret < 0)
> -			goto disable_power;
> +			ili9881c_send_cmd_data(&mctx, instr->arg.cmd.cmd,
> +					       instr->arg.cmd.data);
>   	}
>   
> -	ret = mipi_dsi_dcs_set_tear_on(ctx->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -	if (ret)
> -		goto disable_power;
> -
> -	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
> -	if (ret)
> -		goto disable_power;
> +	ili9881c_switch_page(&mctx, 0);
>   
> -	msleep(120);
> +	if (ctx->address_mode)
> +		ili9881c_send_cmd_data(&mctx, MIPI_DCS_SET_ADDRESS_MODE,
> +				       ctx->address_mode);
>   
> -	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
> -	if (ret)
> +	mipi_dsi_dcs_set_tear_on_multi(&mctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&mctx);
> +	mipi_dsi_msleep(&mctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&mctx);
> +	if (mctx.accum_err)
>   		goto disable_power;
>   
>   	return 0;
>   
>   disable_power:
>   	regulator_disable(ctx->power);
> -	return ret;
> +	return mctx.accum_err;
>   }
>   
>   static int ili9881c_unprepare(struct drm_panel *panel)
>   {
>   	struct ili9881c *ctx = panel_to_ili9881c(panel);
> +	struct mipi_dsi_multi_context mctx = { .dsi = ctx->dsi };
>   
> -	mipi_dsi_dcs_set_display_off(ctx->dsi);
> -	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
> +	mipi_dsi_dcs_set_display_off_multi(&mctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&mctx);
>   	regulator_disable(ctx->power);
>   	gpiod_set_value_cansleep(ctx->reset, 1);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

