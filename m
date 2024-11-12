Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EDED41D6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlQtebEgB86dVhqxQ00g8xwqSY7KjW1J9erC3DabT68=; b=bwcSTlICrUksHWvzffjDaX5Qgq
	RGOK6VH8rO4EW8/sViKwDB3iam/vmsIIAyzU3d5KpxckLLw5YyCcn1YrqEwHXitV1tlIFOSzB/BB5
	ZeTFcZiI2EwUwuymm5g6+Y8kvEnsl0xztC3VfyhTdDVBxHUaublgG+LAjPgb2NE6b4qpPFVi6LF4p
	Ji2CgSiE7RhaXYutXEL8oJGXPB8GqGrHja1Gu1ZRkqJ3bd+rkNGpGec95jwI3fFHBliyJhDwX1/xE
	GbH4YkmPVhCiPYQAJICvL5C2lQQ0MJeCi/9x3CzVC2+FClQ8ulT46pDoTEk3RCcS5amoiPB5gVgh5
	SPDCbDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmY8-00000002h8W-1SCb;
	Tue, 12 Nov 2024 08:47:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmOd-00000002euP-2UL9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:37:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso42304955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400630; x=1732005430; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlQtebEgB86dVhqxQ00g8xwqSY7KjW1J9erC3DabT68=;
        b=boR05mbStryJQ7HnhTYL6L9an2ywrmAvsiSHH/+OzVwa3cLl/IK3b3Q4BftmGCoTvL
         A1fW8JCpzJZ308xbzz9gNnSyW2OHESmNmqDnQuObCgvBHaKyPO5k8oAGDnmuoXuUTpku
         Or1jz4V3KoE3vQa3FO7Z9fzRk3JOh16CNF/2ywjVgBKyqDMdSjZzDD9vNUybo23HNHhL
         eNDgYzbsX12WqLyOPCW9HX1FDHCApRsiVvqc/kNnPuiJHrVFhBHkzJDU3Wd1JIZYh2MN
         51poa/uF+lydU9boIZQ7wI5urIX+QyLimk2OGSvEW9VAfuWFL1d9B9cUfY+g35jHTJtw
         c4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400630; x=1732005430;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlQtebEgB86dVhqxQ00g8xwqSY7KjW1J9erC3DabT68=;
        b=mjoXd2C6dQ4+iJ2Ck1OrU3TjB5iINewQLt9fwiysDQxAwId7HpvV/r0q1qP3les2tf
         IEUZQpY2LYT34tmjuC22GDYu7/b2sUgefgdyvSpvWby2ztCmg4tmWhiUXaYxiKclcHjp
         UYWU3+QosdGw6cNXDyufel7w0YHVcmqGC7mHvWEVi1QB3ZRmt0V/0UQbJXdxQ2qrbfAP
         gYB6yFR2VaMMZ2Yh7uMyn+5N+mocDqKjTF2FPm+i9Fqk0Iqe+FvXDp5+DFDCmIfPnI/1
         0FllOrAfYjJsHjyVOZAN9qulb6it2d6z5Fb/hwgxC7E59cG08uGWV9P5y50jxEJDfpiB
         d+QA==
X-Forwarded-Encrypted: i=1; AJvYcCW2ARgntCOtZBfWIDP0hTJv3S+9P5O9LifFMKWViGTKUm2nNZQsitM8ieMYrowqnYKpid+7rZgUXpQQ8ARESqUl@lists.infradead.org
X-Gm-Message-State: AOJu0YziMS2+WirNuFa6ePeAd05N8pz6uaQjX1Tohhz3fK9uNh6Rn3Ca
	J0eY6qS40NUom/sten4enUxFWYk1WEw/0XWIZwwLusqTu4/ieWTbfo5YK8CoYE8=
X-Google-Smtp-Source: AGHT+IFzDHkJMsiPY/G7pxE8S7GTZggldEzwx+YMOP/7/uY3NLuy5dZgZ2YEbvlJHaRdqr51oMUYZw==
X-Received: by 2002:a05:600c:3b82:b0:431:50fa:89c4 with SMTP id 5b1f17b1804b1-432b74fdef5mr135892675e9.3.1731400629260;
        Tue, 12 Nov 2024 00:37:09 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa73a2d8sm232645355e9.41.2024.11.12.00.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:37:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: meson: Fix glitch occurs when setting up
 glitch-free mux
In-Reply-To: <20241111-fix_glitch_free-v2-3-0099fd9ad3e5@amlogic.com> (Chuan
	Liu via's message of "Mon, 11 Nov 2024 11:37:03 +0800")
References: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
	<20241111-fix_glitch_free-v2-3-0099fd9ad3e5@amlogic.com>
Date: Tue, 12 Nov 2024 09:37:08 +0100
Message-ID: <1jzfm426h7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_003711_689740_C1037365 
X-CRM114-Status: GOOD (  20.09  )
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
> the same configuration. When the frequency needs to be changed, the two
> channels ping-pong to ensure clock continuity and suppress glitch.
>
> The glitch-free mux configuration with CLK_SET_RATE_GATE enables the mux
> to perform ping-pong switching to suppress glitches.
>
> Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock
> controller driver")
> Fixes: 14ebb3154b8f ("clk: meson: axg: add Video Clocks")
> Fixes: f06ac3ed04e8 ("clk: meson: c3: add c3 clock peripherals controller
> driver")
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Fixes: fac9a55b66c9 ("clk: meson-gxbb: Add MALI clocks")
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC
> peripheral clock controller")

Same remarks.

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/a1-peripherals.c |  8 ++++----
>  drivers/clk/meson/axg.c            | 12 ++++++++----
>  drivers/clk/meson/c3-peripherals.c |  4 ++--
>  drivers/clk/meson/g12a.c           | 12 ++++++++----
>  drivers/clk/meson/gxbb.c           | 12 ++++++++----
>  drivers/clk/meson/s4-peripherals.c | 20 ++++++++++----------
>  6 files changed, 40 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 4b9686916b17..7f515e002adb 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -423,7 +423,7 @@ static struct clk_regmap dspa_a = {
>  			&dspa_a_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -471,7 +471,7 @@ static struct clk_regmap dspa_b = {
>  			&dspa_b_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -569,7 +569,7 @@ static struct clk_regmap dspb_a = {
>  			&dspb_a_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -617,7 +617,7 @@ static struct clk_regmap dspb_b = {
>  			&dspb_b_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index a1217dff40fa..e2d3266f4b45 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -1077,7 +1077,8 @@ static struct clk_regmap axg_vpu_0 = {
>  		 * We want to avoid CCF to disable the VPU clock if
>  		 * display has been set by Bootloader
>  		 */
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1126,7 +1127,8 @@ static struct clk_regmap axg_vpu_1 = {
>  		 * We want to avoid CCF to disable the VPU clock if
>  		 * display has been set by Bootloader
>  		 */
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1194,7 +1196,8 @@ static struct clk_regmap axg_vapb_0 = {
>  			&axg_vapb_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1242,7 +1245,8 @@ static struct clk_regmap axg_vapb_1 = {
>  			&axg_vapb_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index 4566c2aeeb19..27343a73a521 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -1364,7 +1364,7 @@ static struct clk_regmap hcodec_0 = {
>  			&hcodec_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1411,7 +1411,7 @@ static struct clk_regmap hcodec_1 = {
>  			&hcodec_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4d3b064d09fc..21a25001e904 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -2746,7 +2746,8 @@ static struct clk_regmap g12a_vpu_0 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vpu_0_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -2790,7 +2791,8 @@ static struct clk_regmap g12a_vpu_1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vpu_1_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -3035,7 +3037,8 @@ static struct clk_regmap g12a_vapb_0 = {
>  			&g12a_vapb_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -3083,7 +3086,8 @@ static struct clk_regmap g12a_vapb_1 = {
>  			&g12a_vapb_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index dfa9ffc61b41..812b3e20c366 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1543,7 +1543,8 @@ static struct clk_regmap gxbb_vpu_0 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &gxbb_vpu_0_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1591,7 +1592,8 @@ static struct clk_regmap gxbb_vpu_1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &gxbb_vpu_1_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1674,7 +1676,8 @@ static struct clk_regmap gxbb_vapb_0 = {
>  			&gxbb_vapb_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1726,7 +1729,8 @@ static struct clk_regmap gxbb_vapb_1 = {
>  			&gxbb_vapb_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
> +			 CLK_SET_RATE_GATE,
>  	},
>  };
>  
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 79e0240d58e6..cf10be40141d 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -1466,7 +1466,7 @@ static struct clk_regmap s4_vdec_p0 = {
>  			&s4_vdec_p0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1516,7 +1516,7 @@ static struct clk_regmap s4_vdec_p1 = {
>  			&s4_vdec_p1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1586,7 +1586,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>  			&s4_hevcf_p0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1636,7 +1636,7 @@ static struct clk_regmap s4_hevcf_p1 = {
>  			&s4_hevcf_p1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1712,7 +1712,7 @@ static struct clk_regmap s4_vpu_0 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &s4_vpu_0_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1756,7 +1756,7 @@ static struct clk_regmap s4_vpu_1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &s4_vpu_1_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1921,7 +1921,7 @@ static struct clk_regmap s4_vpu_clkc_p0 = {
>  			&s4_vpu_clkc_p0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -1969,7 +1969,7 @@ static struct clk_regmap s4_vpu_clkc_p1 = {
>  			&s4_vpu_clkc_p1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -2049,7 +2049,7 @@ static struct clk_regmap s4_vapb_0 = {
>  			&s4_vapb_0_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -2097,7 +2097,7 @@ static struct clk_regmap s4_vapb_1 = {
>  			&s4_vapb_1_div.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };

-- 
Jerome

