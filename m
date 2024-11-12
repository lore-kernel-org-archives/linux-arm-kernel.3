Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82761D41D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpOmmhEgCIw/0RfkRHrc8gag9KJhea6HQz3Fc6gj8mk=; b=IVWXMcyuMum4CQj92vzBdMVIlj
	jI8XcwVMlVuwN0jy9Tbx3cLNdxyUtkPtWAm0P8lZvUoQUVcg9S96b3GJO1pXARipXk166EbewR1MS
	N5lwSfdnHeaeKZdjPBilOQU5mJRYqnbjl3q7kSSK5fnnVbtwmglZyK5LM4L/3mh0+e3r0KEwuOdga
	/YkrS08uaWGhkLfkjdHRUViXtG8gnISfOqssh/hfk/vOv9iTcm3g1cGSlkrDRlgz91CSs7F5f6vex
	OmamkF+65z5pvS+8plINktWDTCxYldbYV9PoMnWlaok4c3V94zuFkx512xGWouroa6zo1076IbNi4
	unFT+Txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmMK-00000002eS4-36sx;
	Tue, 12 Nov 2024 08:34:48 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmKW-00000002eC1-3AKZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:32:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e13375d3so6178528e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400374; x=1732005174; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MpOmmhEgCIw/0RfkRHrc8gag9KJhea6HQz3Fc6gj8mk=;
        b=w/BkrmGIJ7RXQBVZeQnff6+gVCJf+GoT2cu3sqzL7CNzxV201zvB/C2HmhzN20yUDg
         A+d13v3594KdEQn3gvzqizw0h1H7/HQhb18tHNrNqYM3/Esmf566sVTdYR+UDfIzR2k3
         IYgtrc5DoGjg+Y6KM3SkHFUBALrl/ksXko0F8HniCngGqfb674nxrLnolD0JxQwYwJy9
         QHTTq+Za1mwA7oUDEUsshzEZQa2xONx9GLaPB9l8k9flYje0KHJvZD9spTIfgWXksi+n
         CGguHXTx21h1o0Y05175C6TfigzpKY/uKdrgBwD16Ud3F+7/XhhTUIdyO43Qsc30inj3
         908Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400374; x=1732005174;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpOmmhEgCIw/0RfkRHrc8gag9KJhea6HQz3Fc6gj8mk=;
        b=NfRAYupbCRmsIdDC1Ta0xlsvDurcx+E6V2pzI9uXrWqqIdIMQih7AChcOrDzCmdw0Z
         V0WKvwkAGsfuUjD5W3arQiCwSBHUx7H65QZ20wSfp6Q8+9ignmhVl9fLSzSbnHvaxHt3
         ZEFaKq0nq8EzZLdpumcX8joPnNpNKFhswNnGbjnxRSp8gdwUjYJGChB0a7VhVE/xX4aD
         x4hzfVfxJyIAn65l5dKwen3elYfVk21/61/b+xdQtIrq4Rfk0V5ncgVLMnA/yuBls9gD
         nAwgPoD61yjPztQZmsgnbgceLdgPu5L9ZHDtsS1u3SbCHgzpIvNotwEnc1i9bm+W5RsC
         g2Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWL2bYTUIxjieyXcDqZxGWCVJx1ivLbgc0DTvhatm56CtHZUuiQIi8R5gk7TRDSjhy9qIp9xYMx5CGbubhonKUU@lists.infradead.org
X-Gm-Message-State: AOJu0YxxpvgW5dYqVE2zeFmDjVFypffbbtxA9veb90QrsKOrOQeTgW/j
	7EMWk9LMGYlLuX5+n/p+1md1hWrjtL3gnun/LGHxiCui8CwdXAVt1iOCxyMShHc=
X-Google-Smtp-Source: AGHT+IFDkMH3817tueatY05ODRpjlMk98rQ1z0j0irToOsmILa1mIIxBQeYG9cqGFBBCc961D8pddw==
X-Received: by 2002:a05:6512:2393:b0:53b:4bc0:72aa with SMTP id 2adb3069b0e04-53d862431b0mr7092845e87.34.1731400374216;
        Tue, 12 Nov 2024 00:32:54 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b053047dsm200262155e9.3.2024.11.12.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:32:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: meson: Fix failure of glitch-free mux
 switching
In-Reply-To: <20241111-fix_glitch_free-v2-2-0099fd9ad3e5@amlogic.com> (Chuan
	Liu via's message of "Mon, 11 Nov 2024 11:37:02 +0800")
References: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
	<20241111-fix_glitch_free-v2-2-0099fd9ad3e5@amlogic.com>
Date: Tue, 12 Nov 2024 09:32:53 +0100
Message-ID: <1j8qto3l8q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_003257_018489_316D144A 
X-CRM114-Status: GOOD (  26.88  )
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

On Mon 11 Nov 2024 at 11:37, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> glitch-free mux has two clock channels (channel 0 and channel 1) with
> the same configuration.Channel 0 of glitch-free mux is not only the
> clock source for the mux, but also the working clock for glitch free
> mux. Therefore, when glitch-free mux switches, it is necessary to ensure
> that channel 0 has a clock input, otherwise glitch free mux will not
> work and cannot switch to the target channel. So adding flag
> CLK_OPS_PARENT_ENABLE ensures that both channels 0 and 1 are enabled
> when mux switches.
>
> In fact, we just need to make sure that channel 0 is enabled. The
> purpose of CLK_OPS_PARENT_ENABLE may not be to solve our situation, but
> adding this flag does solve our current problem.
>
> Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock
> controller driver")

Fix your mailer please

> Fixes: 14ebb3154b8f ("clk: meson: axg: add Video Clocks")
> Fixes: f06ac3ed04e8 ("clk: meson: c3: add c3 clock peripherals controller
> driver")
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Fixes: fac9a55b66c9 ("clk: meson-gxbb: Add MALI clocks")
> Fixes: 74e1f2521f16 ("clk: meson: meson8b: add the GPU clock tree")
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC
> peripheral clock controller")

There is no reason to mix up so many things together.

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/a1-peripherals.c |  4 ++--
>  drivers/clk/meson/axg.c            |  4 ++--
>  drivers/clk/meson/c3-peripherals.c |  2 +-
>  drivers/clk/meson/g12a.c           |  6 +++---
>  drivers/clk/meson/gxbb.c           |  6 +++---
>  drivers/clk/meson/meson8b.c        | 21 ++++++++++++++++++---
>  drivers/clk/meson/s4-peripherals.c | 12 ++++++------
>  7 files changed, 35 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 7aa6abb2eb1f..4b9686916b17 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -489,7 +489,7 @@ static struct clk_regmap dspa_sel = {
>  			&dspa_b.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -635,7 +635,7 @@ static struct clk_regmap dspb_sel = {
>  			&dspb_b.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 1b08daf579b2..a1217dff40fa 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -1144,7 +1144,7 @@ static struct clk_regmap axg_vpu = {
>  			&axg_vpu_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1260,7 +1260,7 @@ static struct clk_regmap axg_vapb_sel = {
>  			&axg_vapb_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index 7dcbf4ebee07..4566c2aeeb19 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -1431,7 +1431,7 @@ static struct clk_regmap hcodec = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_data = hcodec_parent_data,
>  		.num_parents = ARRAY_SIZE(hcodec_parent_data),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d3539fe9f7af..4d3b064d09fc 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -2812,7 +2812,7 @@ static struct clk_regmap g12a_vpu = {
>  			&g12a_vpu_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -3105,7 +3105,7 @@ static struct clk_regmap g12a_vapb_sel = {
>  			&g12a_vapb_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -4039,7 +4039,7 @@ static struct clk_regmap g12a_mali = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = g12a_mali_parent_hws,
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 262c318edbd5..dfa9ffc61b41 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1132,7 +1132,7 @@ static struct clk_regmap gxbb_mali = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = gxbb_mali_parent_hws,
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1613,7 +1613,7 @@ static struct clk_regmap gxbb_vpu = {
>  			&gxbb_vpu_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1748,7 +1748,7 @@ static struct clk_regmap gxbb_vapb_sel = {
>  			&gxbb_vapb_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index e4b474c5f86c..0af76b527e5b 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1997,7 +1997,22 @@ static struct clk_regmap meson8b_mali = {
>  			&meson8b_mali_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		/*
> +		 * glitch-free mux has two clock channels (channel 0 and
> +		 * channel 1) with the same configuration.Channel 0 of
> +		 * glitch-free mux is not only the clock source for the mux,
> +		 * but also the working clock for glitch free mux. Therefore,
> +		 * when glitch-free mux switches, it is necessary to ensure that
> +		 * channel 0 has a clock input, otherwise glitch free mux will
> +		 * not work and cannot switch to the target channel. So adding
> +		 * flag CLK_OPS_PARENT_ENABLE ensures that both channels 0 and 1
> +		 * are enabled when mux switches.
> +		 *
> +		 * In fact, we just need to make sure that channel 0 is enabled.
> +		 * The purpose of CLK_OPS_PARENT_ENABLE may not be to solve our
> +		 * situation, but adding this flag does solve our current problem.
> +		 */
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -2252,7 +2267,7 @@ static struct clk_regmap meson8b_vpu = {
>  			&meson8b_vpu_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -2364,7 +2379,7 @@ static struct clk_regmap meson8b_vdec_1 = {
>  			&meson8b_vdec_1_2.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index c930cf0614a0..79e0240d58e6 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -1404,7 +1404,7 @@ static struct clk_regmap s4_mali_mux = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = s4_mali_parent_hws,
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1536,7 +1536,7 @@ static struct clk_regmap s4_vdec_mux = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = s4_vdec_mux_parent_hws,
>  		.num_parents = ARRAY_SIZE(s4_vdec_mux_parent_hws),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1656,7 +1656,7 @@ static struct clk_regmap s4_hevcf_mux = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = s4_hevcf_mux_parent_hws,
>  		.num_parents = ARRAY_SIZE(s4_hevcf_mux_parent_hws),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1774,7 +1774,7 @@ static struct clk_regmap s4_vpu = {
>  			&s4_vpu_1.hw,
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -1989,7 +1989,7 @@ static struct clk_regmap s4_vpu_clkc_mux = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = s4_vpu_mux_parent_hws,
>  		.num_parents = ARRAY_SIZE(s4_vpu_mux_parent_hws),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
> @@ -2115,7 +2115,7 @@ static struct clk_regmap s4_vapb = {
>  			&s4_vapb_1.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  	},
>  };

-- 
Jerome

