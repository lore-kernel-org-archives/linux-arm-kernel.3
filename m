Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6898CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftbjBXQ4HXQ8pJsgEsmhz+TvwinUzZhPiZFB0jwt4RI=; b=quqpX32g6Yb2tqkYKno3ij8XCT
	aVbhnl6BPio00NYCnXvvpA8gCmSl4fYc01kZZGr9o2dxlYVWbp5ba8La11C84XiBmB5OMdM8bHru9
	y4aHd0NQ8Vf0YMEjpeOSiHi+VfRbHPVjJNDNJv2aweoOg0PEXyQ8jNBWoMpAQAPtmoJxh/Z0/Xcho
	uyJSL4BTLjgit4/IKFqLPLgL/YYzuwP8CxpQp/ObiM4ERoCJq/tS213sl3PQciXMzLdWDCjlaOUGz
	BCFHSo2gS3JwQcOM7kDwOrWfp6q7f2obYc8SB/yJMEWzOMxQKel01eLV2rmSAylPTe4Zfximdm+UV
	5OGH6eXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFbm-0000000FZSJ-47MX;
	Fri, 10 Jan 2025 14:03:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFUS-0000000FXuy-3fvW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 13:55:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1161170f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 05:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736517355; x=1737122155; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftbjBXQ4HXQ8pJsgEsmhz+TvwinUzZhPiZFB0jwt4RI=;
        b=p5q70HjeOmlzcL3o/EFc7n/xoW9jz1kFGRGASEStkJdfvZg6c6tSHFEngrmFY0l3cy
         szMpD8+pvhjvfYDkHIXDc1OdoRboyWhSPNLghfdrmjVcOTksyX7sjjWsrwGCVprAdP4m
         KMeLG5RgMaoMtdl8yZUX0XX9mnwvgnFzrp8ewsdo/KMGDnHNj9pFTTSdnvpgfcvX5Zkg
         E47RvaMbflSFW6SKN5et+wIbAaAoLZNo3WXa0PsahX4kYIe9/7iq2k0EEfutnVvKSYZK
         xfonYvRuWCC3t0luRpRVRkEtzEdgSjn/xg+zhcQ5+Qlx49nTM0u7cTOLfcruos2EZKHf
         bPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736517355; x=1737122155;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftbjBXQ4HXQ8pJsgEsmhz+TvwinUzZhPiZFB0jwt4RI=;
        b=etV1vBjoVETT6XIH6/gpp4po2k6Px+f5oNkz228bFpPsvzDFPKvBkj2BZp/pIKB3N6
         GhRZKVx894NwUgXr8HfcrHYNRt+wCVrPdl2DYXcJgsKsQPvIFpbimHCiB+mlixaUUTqJ
         Tc0UxRmIxVhYInjGQvAZMzRsWuTkMSnofrJqzsZxqCYf57JIA7QtESIXDfIZNPHjPiCL
         RJDurEi2sQlb5ArnMxDds7hNJQp/AkjfUp03ya2TAnzZeAiKmbgiQE3rZXtZsCuCXtv8
         WtwyZWoVQlMaz1ouMsq2LuJxJ6asXqon6mbN4QvWgm57V/7nUXEILg1P+Tui5WpEzS3Q
         H4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjf0ywud+J7+30iM8YqLNKZ00LdAo5G2qUcVOFAcPuEYnLF3C4bxWa5FHzAxhCzlc+VfjdHPE6X6tTsy1wwrbP@lists.infradead.org
X-Gm-Message-State: AOJu0YxAE+smWH2n5wwxUAmJXPDfcIhTkSJw8PRbvUJVvEhMfg9SWxqk
	/gXriLBhwieYDYekR1gRv5LGb3mrLP8kQA84AXyJjScpTsEF3S93ZhAjIoCz8PI=
X-Gm-Gg: ASbGncu4Ja8j2W6mWvINMC0xsqrCv/CG+CDwBiDK26F3ZmtiZOJxYGbBV6h42oi3zgh
	uk8Kt/Gwr8c6OHgpgtYfnyEu37nF6n1WeyvVf7/dagiey2ar+ArZ4lwtjtIL+JiU1oXvO0Seesd
	LG7hxr5t3VrBwV7j/I83BCdjLG3fboKBHK9wXFb2nRKyjAv3yZpo+77NtzjrBVa79DSRVVAdG9T
	Ex2aybLy2QwM7SI0lfqx3ESSW+s66yxJ8P1q6bbVD0btU2MkUw/0k8=
X-Google-Smtp-Source: AGHT+IE7F/hOS3FiocAfogciKCV+3xyyaiDnwQ7vSAvCcesLhCG99vmIp4Cuk/PUHH6FVgF+FANyPg==
X-Received: by 2002:a05:6000:401e:b0:386:366d:5d03 with SMTP id ffacd0b85a97d-38a872da868mr10354026f8f.16.1736517355167;
        Fri, 10 Jan 2025 05:55:55 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f3f7:a818:65b5:3db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80besm4527997f8f.83.2025.01.10.05.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:55:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
In-Reply-To: <20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
	(Chuan Liu via's message of "Fri, 10 Jan 2025 19:47:11 +0800")
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
	<20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 14:55:54 +0100
Message-ID: <1j34hqai39.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055556_910467_D2217E30 
X-CRM114-Status: GOOD (  19.01  )
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

On Fri 10 Jan 2025 at 19:47, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> The PLL can only stably lock within a limited frequency range.
>
> Due to timing constraints, the maximum frequency of the peripheral clock
> cannot exceed the design specifications.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/c3-peripherals.c | 21 +++++++++++++++++++++
>  drivers/clk/meson/c3-pll.c         |  4 ++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index 7dcbf4ebee07..9f0a3990f0d6 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -568,6 +568,7 @@ static const struct clk_parent_data pwm_parent_data[] = {
>  		.ops = &clk_regmap_gate_ops,			\
>  		.parent_names = (const char *[]) { #_name "_div" },\
>  		.num_parents = 1,				\
> +		.max_rate = 200000000,				\
>  		.flags = CLK_SET_RATE_PARENT,			\
>  	},							\
>  }
> @@ -724,6 +725,7 @@ static struct clk_regmap spicc_a = {
>  			&spicc_a_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 500000000,

I'm sorry but the whole thing is completly wrong.

All the clocks I'm seeing here are gates. This type of HW hardly cares
what rates it handles. Same goes from mux, dividers, etc ...

All you are doing here is trying enforce some made up "safety" / use-case
defined limits that do not belong in the clock controller.

The only piece of HW where limits could possibly make sense are PLL DCO,
and even there, you've got multiplier range which is way better as an
abstraction.

So it's a nack on the series.

If devices are have particular requirement on rate range, have the
related driver set it.


>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -771,6 +773,7 @@ static struct clk_regmap spicc_b = {
>  			&spicc_b_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 500000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -829,6 +832,7 @@ static struct clk_regmap spifc = {
>  			&spifc_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 167000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -887,6 +891,7 @@ static struct clk_regmap sd_emmc_a = {
>  			&sd_emmc_a_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 250000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -934,6 +939,7 @@ static struct clk_regmap sd_emmc_b = {
>  			&sd_emmc_b_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 250000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -981,6 +987,7 @@ static struct clk_regmap sd_emmc_c = {
>  			&sd_emmc_c_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 1200000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1074,6 +1081,7 @@ static struct clk_regmap eth_rmii = {
>  			&eth_rmii_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 50000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1132,6 +1140,7 @@ static struct clk_regmap mipi_dsi_meas = {
>  			&mipi_dsi_meas_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 200000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1190,6 +1199,7 @@ static struct clk_regmap dsi_phy = {
>  			&dsi_phy_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 1500000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1248,6 +1258,7 @@ static struct clk_regmap vout_mclk = {
>  			&vout_mclk_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 334000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1306,6 +1317,7 @@ static struct clk_regmap vout_enc = {
>  			&vout_enc_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 200000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1431,6 +1443,7 @@ static struct clk_regmap hcodec = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_data = hcodec_parent_data,
>  		.num_parents = ARRAY_SIZE(hcodec_parent_data),
> +		.max_rate = 667000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1489,6 +1502,7 @@ static struct clk_regmap vc9000e_aclk = {
>  			&vc9000e_aclk_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 667000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1536,6 +1550,7 @@ static struct clk_regmap vc9000e_core = {
>  			&vc9000e_core_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 400000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1594,6 +1609,7 @@ static struct clk_regmap csi_phy0 = {
>  			&csi_phy0_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 200000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1652,6 +1668,7 @@ static struct clk_regmap dewarpa = {
>  			&dewarpa_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 800000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1710,6 +1727,7 @@ static struct clk_regmap isp0 = {
>  			&isp0_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 400000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1768,6 +1786,7 @@ static struct clk_regmap nna_core = {
>  			&nna_core_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 800000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1826,6 +1845,7 @@ static struct clk_regmap ge2d = {
>  			&ge2d_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 667000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1884,6 +1904,7 @@ static struct clk_regmap vapb = {
>  			&vapb_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 400000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
> index 35fda31a19e2..d80d6ee2409d 100644
> --- a/drivers/clk/meson/c3-pll.c
> +++ b/drivers/clk/meson/c3-pll.c
> @@ -286,6 +286,8 @@ static struct clk_regmap gp0_pll_dco = {
>  			.fw_name = "top",
>  		},
>  		.num_parents = 1,
> +		.min_rate = 3000000000,
> +		.max_rate = 6000000000,
>  	},
>  };
>  
> @@ -370,6 +372,8 @@ static struct clk_regmap hifi_pll_dco = {
>  			.fw_name = "top",
>  		},
>  		.num_parents = 1,
> +		.min_rate = 3000000000,
> +		.max_rate = 6000000000,
>  	},
>  };

-- 
Jerome

