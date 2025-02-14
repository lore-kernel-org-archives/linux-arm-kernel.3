Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D63DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRBZ9LnljeKdyPrMlrMbswWuQjbGiHO54rQVeWsI8fs=; b=yP00bsh3qJmO7wcQTCu6BCWetz
	YPe1BGpYGDVqOyOAA0qSqXkIc7fmoBhptV1Q/g0GmerVuhvYbE4v85+UEsh6aI0agVK5AwKh0eJrp
	/D19fuBmQfNOuXB/pt9NZxUcpt6hQ92WAik9X6isglZ3zQCbhdiYJ/c3PIJzsu6V8wwq+CzcXUWT9
	1VSZ60Y3f6RRXyhR3r7pXgf8zTDoNqCm8V0fXlpfYblzjLWDTbIlH6842IgwPUJ/yvkXqKCfzkxn5
	QbMtVDkocnmyuIIIpqlwHpiVlYCHWHGVemWkryQK0pnJumamWCvul1tM2aXtDxA3ReqwFsJJ60fTh
	uuAbUNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirhq-0000000EFwh-0qNu;
	Fri, 14 Feb 2025 09:09:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirgN-0000000EFRY-3Y86
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:08:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f1e8efe84so659681f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 01:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739524102; x=1740128902; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FRBZ9LnljeKdyPrMlrMbswWuQjbGiHO54rQVeWsI8fs=;
        b=nb7uVmKAujYsRglX+d78hr+hfPRnkONM5blA+TTeevlX+09lp5bgsMzseumPk84VnL
         dIWgtw0kPZxJqap8AaOxy1S88lbEFRnmedZ+C+c1Q0u98pHAbY2tSwcr09MYePSEjoBL
         jj4sD1y4vBgF/14lJdlL/9iOIaphHcPh24DQ0fB5Mlv6ssimu1zxHElA3jdS520XR/b8
         mU93E6nUPpRPQ9CWSzDvfVDeDuSVzI4WKEeTf1+d5cN29rHvyY/nZPmCK6EYDUOSLX4n
         PWUXwEj+OJISTgQbWSIijvLpyL2ueLEYRqvEGiaxv9qBkeBYtAbhaKGzcySQDCVcv2l/
         oaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524102; x=1740128902;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRBZ9LnljeKdyPrMlrMbswWuQjbGiHO54rQVeWsI8fs=;
        b=gb1VNB499ycZJpY2s9jk0blGu4xvvAncte4m70Gv555+xm8MDi6WuTcVNTZZtVgpWj
         iQBl+uq2x0lRCnqDmMptNF50EoR4OEDP6TbFQKqaLUqFH8HoLTS2AY8D8j2aArneZGKx
         e1wYVZFPxqvJHY7+wYFMku+ZrF8zeOUQ4zkeP5odYCFLVg7wKrRR2zdHaf7Z6XcOeC6N
         k4tfG5uXOdjFH19lFl5tFwM/aqOA6bIID0twWay6SmQ4V93TC+db0v2GO9HU32XHFbmG
         LQhZHRde6aX0dDu6Dds6gksBoO5CtUP2pxmTv1Qe/PDIt31LfR2Cid4so69gjHCKkrqn
         XVvw==
X-Forwarded-Encrypted: i=1; AJvYcCXeKPzvAuuUDGu+AHFxEif2EJXszHj7fsJ6yv/6XLpiVkrBmjlJM5Jsd/as2FPYGUmpqQkvf5SrK0VGOUBmKfpX@lists.infradead.org
X-Gm-Message-State: AOJu0YxQkFurV1WZZOofOkZUZYdWk1fnfuMi7ETJRAGV7E52Pk1tsc8M
	ZHUmVali1c6GMhDTE3QX4a2zXwPdGqEXsb5oUF3iVvgBaBnyUm9P4cTiDvQVRYc=
X-Gm-Gg: ASbGncubEeeKqouPl0BcITA1YiuO2TZCF1Evvo3gnRnUkwwPaMlZmjCKO/x4TBJz+Gj
	qCls6rYCTT1xmjCx2AUflUDj7FvGDu7Yyctz+B/N+S2cP5CSlfKKGXpvQcLXysI4qpcgLiyxl+/
	XcJtU//THg+Ue7dg38nshiKRR4mBQHkwev+09yBxUbkldX8t8qJfGzesWZH8xYCbRntQ54ppb+b
	7pbwwaXUrCwz97JHrq64Pf/coFfE2/vIiwpFWyZQIpifvdkQzWcuB4+ci/Rguc0yCzNgsWejbHU
	asoHPy4z2b8W3ag=
X-Google-Smtp-Source: AGHT+IE0/rSxXHcT0d8T4npVkX/xeGrYvHZ7lAWe+eAfluyBR05NqZXCHJQG0OjEOL1oPVBXgPrHSg==
X-Received: by 2002:a05:6000:18a4:b0:38f:3009:61d7 with SMTP id ffacd0b85a97d-38f30096396mr623237f8f.4.1739524100676;
        Fri, 14 Feb 2025 01:08:20 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259d8dd6sm4117993f8f.62.2025.02.14.01.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:08:20 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martijn van Deventer <linux@martijnvandeventer.nl>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: g12a: Fix kernel warnings when no display
 attached
In-Reply-To: <20250213221702.606-1-linux@martijnvandeventer.nl> (Martijn van
	Deventer's message of "Thu, 13 Feb 2025 23:17:01 +0100")
References: <20250213221702.606-1-linux@martijnvandeventer.nl>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 10:08:19 +0100
Message-ID: <1jpljkzyf0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_010823_877737_B0D0654F 
X-CRM114-Status: GOOD (  20.76  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu 13 Feb 2025 at 23:17, Martijn van Deventer <linux@martijnvandeventer.nl> wrote:

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
>  drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>  drm_atomic_helper_commit_tail_rpm+0x84/0xa0
>  commit_tail+0xa4/0x18c
>  drm_atomic_helper_commit+0x164/0x178
>  drm_atomic_commit+0xb4/0xec
>  drm_client_modeset_commit_atomic+0x210/0x270
>  drm_client_modeset_commit_locked+0x5c/0x188
>  drm_fb_helper_pan_display+0xb8/0x1d4
>  fb_pan_display+0x7c/0x120
>  bit_update_start+0x20/0x48
>  fbcon_switch+0x418/0x54c
>  el0t_64_sync+0x194/0x198
>
> This happens when the kernel disables the unused clocks.
> Sometimes this causes the boot to hang.
>
> By (re)adding the flag CLK_IGNORE_UNUSED to the VCLK2 clocks, these
> clocks will not be disabled.
>
> This partially reverts commit b70cb1a21a54 ("clk: meson: g12a:
> make VCLK2 and ENCL clock path configurable by CCF").

It looks like DRM needs those clock enabled regardless of connection
status on HDMI. Even with this change applied, you would get the same
problem again if the bootloader does not take of turning the clock on,
which is not a given.

CLK_IGNORE_UNUSED gives not guarantee a clock will be enabled or stay
enabled at any point.

A proper fix to this issue should be done in DRM, IMO.

>
> Fixes: b70cb1a21a54 ("clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF").
> Signed-off-by: Martijn van Deventer <linux@martijnvandeventer.nl>
> ---
>  drivers/clk/meson/g12a.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index cfffd434e998..1651898658f5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -3234,7 +3234,7 @@ static struct clk_regmap g12a_vclk2_div = {
>  			&g12a_vclk2_input.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_GATE,
> +		.flags = CLK_SET_RATE_GATE | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3270,7 +3270,7 @@ static struct clk_regmap g12a_vclk2 = {
>  		.ops = &meson_vclk_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3354,7 +3354,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3368,7 +3368,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3382,7 +3382,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };
>  
> @@ -3396,7 +3396,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>  	},
>  };

-- 
Jerome

