Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CFCF557EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLnCEsB+3cyR3qH2JjhamBV7BLsMpYEpO4JBV6nYKEw=; b=NO03Wxfix+4wfStng5Un02PBP8
	sE6ceThCmildCEItgzqMgZ6fzUK/8omClQHnFudviLyGDUTbf0Si6CUllNCeKvuJTdUVcJArOuBay
	QofCaJHvbGDgAe2iJa5TG/yiC95DIkvO4RI9xQX46ttyPDTbmRPiuUvWjc4HaeRoFhNvPVLTrf/na
	kM62zs7MStAELBknwMhpqLYEsJ4CO55N0KAmlU8j4uvD41GA7t84zNx2MpYkV6+KJqd0KIqsfpupY
	EwQzP4i8GpOcdzcXZJhoA5CZ1wB/jowazhgo49mKlN+EkvYiFKvVfbYoCxYUqIfvGai0lOfaYU8u5
	G7Rwmm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkK7-00000006dC7-33SL;
	Mon, 20 Apr 2026 08:49:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkK5-00000006dBJ-2hwm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:49:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so18646195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776674980; x=1777279780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLnCEsB+3cyR3qH2JjhamBV7BLsMpYEpO4JBV6nYKEw=;
        b=C5eHp2C7pvAgFNvCOXzAlc2FI9+aALObPjZxDZ11R8MzfJXY/UJdwRW4oxDnuojDfT
         kTVd5MSC4kt/aBYRB3ELJ3Vv8QzzghpyT9B8Ch/SQspGeATmo8aaqpy4eRq2TrmHwoN2
         8Prt9BtwpKliykgorahbtMavUccwGjz4nTJMOyA7RmWY/NzpvuVybrXC1wstxLZwOEDG
         prEfHrYq1TKuhad1YMOG6CP988mg5FCGiSESiJ+ypgTU94qTxBob1axTCDBZs328naWn
         CYGa+sNgA6Ws4tUgMg9Y4X0npNnrgTwF0DJNChauMvrUwXKpwZPO4vrL8/xp8ypoJzPr
         O/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674980; x=1777279780;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLnCEsB+3cyR3qH2JjhamBV7BLsMpYEpO4JBV6nYKEw=;
        b=Hb0zxNe5IUtF6GaTdir7zUP/czvXdFvrI/9TENO0jSfQFlJ7mbTdtiV9czB8SX3xo1
         1YJAGiTI9lKJ9fWBo9UMRDBOGVwDgxCVdzpENmvvDfENF9b4gbprOkgyWjLAhGVL+Q7C
         UqERxTmsCICmms3DhvHASC677jq2ccazzMA3A4AfA/Sj3o+Mx1GPSRS/VVZAMtmcHw+J
         9T9sL8Qmi9zsIVfGq4XWxxbM6rXxVw/enONJpGe6Ol07T/D8OpbYz0OeKNIDefO4YVmp
         jGXJtSgv9VRaw/RSI0H4n/P+mVrYZBG7nL6FV1BEZral/VTZnZRZXGgMcgfgAWAxsuQf
         Dy1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+/E9UEdEcU11V7xzkYkqY1Z6YUHd99YRQwrJx0Tj4lNyvx2gZxQ/rruS12eRSOmGZZMfUt6IXtgMX5JJlOc1Pe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4AoQwdHIDLCY++p8w7nqFRUgBvjXbiSY37PQytStREoSsPoK6
	PE/l1spED4bSv621bkvePW68y2jx9/kFhcXdRucS6NGdbBncbGTdQ49KAH9E8LxJhB8=
X-Gm-Gg: AeBDievNMs1n4zORjZZCJQ3tJuM8HzRhJiuLOEso7Iy0QRkT+MyYNLUCWalnT0iPOIq
	oa/sHvtFVEsfwg12ljHxJQgQ2Beq+9RX4nPKe9kVysfRrGdR7POZJRcq2YdiUlU7tXLajT+sTwZ
	lEWGEElSIsaznf88+5ObXKTayi1elW5AAKL9SOZLXQddfNPNbe1GDbag9vbI9B8kmT/yFFvhBWW
	JmpRt3bDKZ7N1tjnABCofwrXTw3ERY/5aPFYheKg4bU6U4FozDalLFulvYhvJAdI+2BlYeIX8M3
	hhr1FjGvel6Jkn879dMerG/yDgDNqlTjKm2zF/LPmJtXnN42UZbvmAj2eem3PN81U02qgfFSisz
	9oHl3usszh21BZyRoYCSimn5ADWX//n7mAY8ckfZ31UMvRNWcwp1CtU1DvQn2LAZrGhyr+Ml0Qn
	9SXEv5lBie3Z3dKRYxergN9x1CTCnXhQKH+mQPjBfZ9L+eORAJbe0v7q2m+G0paIlvKp/h3pfe+
	TS/HV2jfQxIBdqtTg==
X-Received: by 2002:a05:600c:48a1:b0:489:a4:e58a with SMTP id 5b1f17b1804b1-48900a4e881mr79737885e9.19.1776674979729;
        Mon, 20 Apr 2026 01:49:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm27593264f8f.9.2026.04.20.01.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:49:39 -0700 (PDT)
Message-ID: <267bb934-b7ab-4b94-a99e-c09b78d00337@linaro.org>
Date: Mon, 20 Apr 2026 10:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] soc: amlogic: clk-measure: Add A1 and T7 support
To: jian.hu@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-2-02b6314427e6@amlogic.com>
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
In-Reply-To: <20260415-clkmsr_a1_t7-v2-2-02b6314427e6@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014941_754812_0AE0DAEB 
X-CRM114-Status: GOOD (  14.53  )
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

On 4/15/26 10:33, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add support for the A1 and T7 SoC family in amlogic clk measure.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 272 ++++++++++++++++++++++++++++++++
>   1 file changed, 272 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index d862e30a244e..8c4f3cc8c8ab 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -787,6 +787,258 @@ static const struct meson_msr_id clk_msr_s4[] = {
>   
>   };
>   
> +static const struct meson_msr_id clk_msr_a1[] = {
> +	CLK_MSR_ID(0, "tdmout_b_sclk"),
> +	CLK_MSR_ID(1, "tdmout_a_sclk"),
> +	CLK_MSR_ID(2, "tdmin_lb_sclk"),
> +	CLK_MSR_ID(3, "tdmin_b_sclk"),
> +	CLK_MSR_ID(4, "tdmin_a_sclk"),
> +	CLK_MSR_ID(5, "vad"),
> +	CLK_MSR_ID(6, "resamplea"),
> +	CLK_MSR_ID(7, "pdm_sysclk"),
> +	CLK_MSR_ID(8, "pdm_dclk"),
> +	CLK_MSR_ID(9, "locker_out"),
> +	CLK_MSR_ID(10, "locker_in"),
> +	CLK_MSR_ID(11, "spdifin"),
> +	CLK_MSR_ID(12, "tdmin_vad"),
> +	CLK_MSR_ID(13, "au_adc"),
> +	CLK_MSR_ID(14, "au_dac"),
> +	CLK_MSR_ID(16, "spicc_a"),
> +	CLK_MSR_ID(17, "spifc"),
> +	CLK_MSR_ID(18, "sd_emmc_a"),
> +	CLK_MSR_ID(19, "dmcx4"),
> +	CLK_MSR_ID(20, "dmc"),
> +	CLK_MSR_ID(21, "psram"),
> +	CLK_MSR_ID(22, "cecb"),
> +	CLK_MSR_ID(23, "ceca"),
> +	CLK_MSR_ID(24, "ts"),
> +	CLK_MSR_ID(25, "pwm_f"),
> +	CLK_MSR_ID(26, "pwm_e"),
> +	CLK_MSR_ID(27, "pwm_d"),
> +	CLK_MSR_ID(28, "pwm_c"),
> +	CLK_MSR_ID(29, "pwm_b"),
> +	CLK_MSR_ID(30, "pwm_a"),
> +	CLK_MSR_ID(31, "saradc"),
> +	CLK_MSR_ID(32, "usb_bus"),
> +	CLK_MSR_ID(33, "dsp_b"),
> +	CLK_MSR_ID(34, "dsp_a"),
> +	CLK_MSR_ID(35, "axi"),
> +	CLK_MSR_ID(36, "sys"),
> +	CLK_MSR_ID(40, "rng_ring_osc0"),
> +	CLK_MSR_ID(41, "rng_ring_osc1"),
> +	CLK_MSR_ID(42, "rng_ring_osc2"),
> +	CLK_MSR_ID(43, "rng_ring_osc3"),
> +	CLK_MSR_ID(44, "dds_out"),
> +	CLK_MSR_ID(45, "cpu_clk_div16"),
> +	CLK_MSR_ID(46, "gpio_msr"),
> +	CLK_MSR_ID(50, "osc_ring_cpu0"),
> +	CLK_MSR_ID(51, "osc_ring_cpu1"),
> +	CLK_MSR_ID(54, "osc_ring_top0"),
> +	CLK_MSR_ID(55, "osc_ring_top1"),
> +	CLK_MSR_ID(56, "osc_ring_ddr"),
> +	CLK_MSR_ID(57, "osc_ring_dmc"),
> +	CLK_MSR_ID(58, "osc_ring_dspa"),
> +	CLK_MSR_ID(59, "osc_ring_dspb"),
> +	CLK_MSR_ID(60, "osc_ring_rama"),
> +	CLK_MSR_ID(61, "osc_ring_ramb"),
> +};
> +
> +static const struct meson_msr_id clk_msr_t7[] = {
> +	CLK_MSR_ID(0, "sys"),
> +	CLK_MSR_ID(1, "axi"),
> +	CLK_MSR_ID(2, "rtc"),
> +	CLK_MSR_ID(3, "dspa"),
> +	CLK_MSR_ID(4, "dspb"),
> +	CLK_MSR_ID(5, "mali"),
> +	CLK_MSR_ID(6, "sys_cpu_clk_div16"),
> +	CLK_MSR_ID(7, "ceca"),
> +	CLK_MSR_ID(8, "cecb"),
> +	CLK_MSR_ID(10, "fclk_div5"),
> +	CLK_MSR_ID(11, "mpll0"),
> +	CLK_MSR_ID(12, "mpll1"),
> +	CLK_MSR_ID(13, "mpll2"),
> +	CLK_MSR_ID(14, "mpll3"),
> +	CLK_MSR_ID(15, "mpll_50m"),
> +	CLK_MSR_ID(16, "pcie_inp"),
> +	CLK_MSR_ID(17, "pcie_inn"),
> +	CLK_MSR_ID(18, "mpll_test_out"),
> +	CLK_MSR_ID(19, "hifi_pll"),
> +	CLK_MSR_ID(20, "gp0_pll"),
> +	CLK_MSR_ID(21, "gp1_pll"),
> +	CLK_MSR_ID(22, "eth_mppll_50m"),
> +	CLK_MSR_ID(23, "sys_pll_div16"),
> +	CLK_MSR_ID(24, "ddr_dpll_pt"),
> +	CLK_MSR_ID(25, "earcrx_pll"),
> +	CLK_MSR_ID(26, "paie1_clk_inp"),
> +	CLK_MSR_ID(27, "paie1_clk_inn"),
> +	CLK_MSR_ID(28, "amlgdc"),
> +	CLK_MSR_ID(29, "gdc"),
> +	CLK_MSR_ID(30, "mod_eth_phy_ref"),
> +	CLK_MSR_ID(31, "mod_eth_tx"),
> +	CLK_MSR_ID(32, "eth_clk125Mhz"),
> +	CLK_MSR_ID(33, "eth_clk_rmii"),
> +	CLK_MSR_ID(34, "co_clkin_to_mac"),
> +	CLK_MSR_ID(35, "mod_eth_rx_clk_rmii"),
> +	CLK_MSR_ID(36, "co_rx"),
> +	CLK_MSR_ID(37, "co_tx"),
> +	CLK_MSR_ID(38, "eth_phy_rxclk"),
> +	CLK_MSR_ID(39, "eth_phy_plltxclk"),
> +	CLK_MSR_ID(40, "ephy_test"),
> +	CLK_MSR_ID(41, "dsi_b_meas"),
> +	CLK_MSR_ID(42, "hdmirx_apl"),
> +	CLK_MSR_ID(43, "hdmirx_tmds"),
> +	CLK_MSR_ID(44, "hdmirx_cable"),
> +	CLK_MSR_ID(45, "hdmirx_apll_clk_audio"),
> +	CLK_MSR_ID(46, "hdmirx_5m"),
> +	CLK_MSR_ID(47, "hdmirx_2m"),
> +	CLK_MSR_ID(48, "hdmirx_cfg"),
> +	CLK_MSR_ID(49, "hdmirx_hdcp2x_eclk"),
> +	CLK_MSR_ID(50, "vid_pll0_div"),
> +	CLK_MSR_ID(51, "hdmi_vid_pll"),
> +	CLK_MSR_ID(54, "vdac_clk"),
> +	CLK_MSR_ID(55, "vpu_clk_buf"),
> +	CLK_MSR_ID(56, "mod_tcon_clko"),
> +	CLK_MSR_ID(57, "lcd_an_clk_ph2"),
> +	CLK_MSR_ID(58, "lcd_an_clk_ph3"),
> +	CLK_MSR_ID(59, "hdmi_tx_pixel"),
> +	CLK_MSR_ID(60, "vdin_meas"),
> +	CLK_MSR_ID(61, "vpu_clk"),
> +	CLK_MSR_ID(62, "vpu_clkb"),
> +	CLK_MSR_ID(63, "vpu_clkb_tmp"),
> +	CLK_MSR_ID(64, "vpu_clkc"),
> +	CLK_MSR_ID(65, "vid_lock"),
> +	CLK_MSR_ID(66, "vapbclk"),
> +	CLK_MSR_ID(67, "ge2d"),
> +	CLK_MSR_ID(68, "aud_pll"),
> +	CLK_MSR_ID(69, "aud_sck"),
> +	CLK_MSR_ID(70, "dsi_a_meas"),
> +	CLK_MSR_ID(72, "mipi_csi_phy"),
> +	CLK_MSR_ID(73, "mipi_isp"),
> +	CLK_MSR_ID(76, "hdmitx_tmds"),
> +	CLK_MSR_ID(77, "hdmitx_sys"),
> +	CLK_MSR_ID(78, "hdmitx_fe"),
> +	CLK_MSR_ID(80, "hdmitx_prif"),
> +	CLK_MSR_ID(81, "hdmitx_200m"),
> +	CLK_MSR_ID(82, "hdmitx_aud"),
> +	CLK_MSR_ID(83, "hdmitx_pnx"),
> +	CLK_MSR_ID(84, "spicc5"),
> +	CLK_MSR_ID(85, "spicc4"),
> +	CLK_MSR_ID(86, "spicc3"),
> +	CLK_MSR_ID(87, "spicc2"),
> +	CLK_MSR_ID(93, "vdec"),
> +	CLK_MSR_ID(94, "wave521_aclk"),
> +	CLK_MSR_ID(95, "wave521_cclk"),
> +	CLK_MSR_ID(96, "wave521_bclk"),
> +	CLK_MSR_ID(97, "hcodec"),
> +	CLK_MSR_ID(98, "hevcb"),
> +	CLK_MSR_ID(99, "hevcf"),
> +	CLK_MSR_ID(100, "hdmi_aud_pll"),
> +	CLK_MSR_ID(101, "hdmi_acr_ref"),
> +	CLK_MSR_ID(102, "hdmi_meter"),
> +	CLK_MSR_ID(103, "hdmi_vid"),
> +	CLK_MSR_ID(104, "hdmi_aud"),
> +	CLK_MSR_ID(105, "hdmi_dsd"),
> +	CLK_MSR_ID(108, "dsi1_phy"),
> +	CLK_MSR_ID(109, "dsi0_phy"),
> +	CLK_MSR_ID(110, "smartcard"),
> +	CLK_MSR_ID(111, "sar_adc"),
> +	CLK_MSR_ID(113, "sd_emmc_c"),
> +	CLK_MSR_ID(114, "sd_emmc_b"),
> +	CLK_MSR_ID(115, "sd_emmc_a"),
> +	CLK_MSR_ID(116, "gpio_msr"),
> +	CLK_MSR_ID(117, "spicc1"),
> +	CLK_MSR_ID(118, "spicc0"),
> +	CLK_MSR_ID(119, "anakin"),
> +	CLK_MSR_ID(121, "ts_clk(temp sensor)"),
> +	CLK_MSR_ID(122, "ts_a73"),
> +	CLK_MSR_ID(123, "ts_a53"),
> +	CLK_MSR_ID(124, "ts_nna"),
> +	CLK_MSR_ID(130, "audio_vad"),
> +	CLK_MSR_ID(131, "acodec_dac_clk_x128"),
> +	CLK_MSR_ID(132, "audio_locker_in"),
> +	CLK_MSR_ID(133, "audio_locker_out"),
> +	CLK_MSR_ID(134, "audio_tdmout_c_sclk"),
> +	CLK_MSR_ID(135, "audio_tdmout_b_sclk"),
> +	CLK_MSR_ID(136, "audio_tdmout_a_sclk"),
> +	CLK_MSR_ID(137, "audio_tdmin_lb_sclk"),
> +	CLK_MSR_ID(138, "audio_tdmin_c_sclk"),
> +	CLK_MSR_ID(139, "audio_tdmin_b_sclk"),
> +	CLK_MSR_ID(140, "audio_tdmin_a_sclk"),
> +	CLK_MSR_ID(141, "audio_resamplea"),
> +	CLK_MSR_ID(142, "audio_pdm_sysclk"),
> +	CLK_MSR_ID(143, "audio_spdifoutb_mst"),
> +	CLK_MSR_ID(144, "audio_spdifout_mst"),
> +	CLK_MSR_ID(145, "audio_spdifin_mst"),
> +	CLK_MSR_ID(146, "audio_pdm_dclk"),
> +	CLK_MSR_ID(147, "audio_resampleb"),
> +	CLK_MSR_ID(148, "earcrx_pll_dmac"),
> +	CLK_MSR_ID(156, "pwm_ao_h"),
> +	CLK_MSR_ID(157, "pwm_ao_g"),
> +	CLK_MSR_ID(158, "pwm_ao_f"),
> +	CLK_MSR_ID(159, "pwm_ao_e"),
> +	CLK_MSR_ID(160, "pwm_ao_d"),
> +	CLK_MSR_ID(161, "pwm_ao_c"),
> +	CLK_MSR_ID(162, "pwm_ao_b"),
> +	CLK_MSR_ID(163, "pwm_ao_a"),
> +	CLK_MSR_ID(164, "pwm_f"),
> +	CLK_MSR_ID(165, "pwm_e"),
> +	CLK_MSR_ID(166, "pwm_d"),
> +	CLK_MSR_ID(167, "pwm_c"),
> +	CLK_MSR_ID(168, "pwm_b"),
> +	CLK_MSR_ID(169, "pwm_a"),
> +	CLK_MSR_ID(170, "aclkm"),
> +	CLK_MSR_ID(171, "mclk_pll"),
> +	CLK_MSR_ID(172, "a73_sys_pll_div16"),
> +	CLK_MSR_ID(173, "a73_cpu_clk_div16"),
> +	CLK_MSR_ID(176, "rng_ring_0"),
> +	CLK_MSR_ID(177, "rng_ring_1"),
> +	CLK_MSR_ID(178, "rng_ring_2"),
> +	CLK_MSR_ID(179, "rng_ring_3"),
> +	CLK_MSR_ID(180, "am_ring_out0"),
> +	CLK_MSR_ID(181, "am_ring_out1"),
> +	CLK_MSR_ID(182, "am_ring_out2"),
> +	CLK_MSR_ID(183, "am_ring_out3"),
> +	CLK_MSR_ID(184, "am_ring_out4"),
> +	CLK_MSR_ID(185, "am_ring_out5"),
> +	CLK_MSR_ID(186, "am_ring_out6"),
> +	CLK_MSR_ID(187, "am_ring_out7"),
> +	CLK_MSR_ID(188, "am_ring_out8"),
> +	CLK_MSR_ID(189, "am_ring_out9"),
> +	CLK_MSR_ID(190, "am_ring_out10"),
> +	CLK_MSR_ID(191, "am_ring_out11"),
> +	CLK_MSR_ID(192, "am_ring_out12"),
> +	CLK_MSR_ID(193, "am_ring_out13"),
> +	CLK_MSR_ID(194, "am_ring_out14"),
> +	CLK_MSR_ID(195, "am_ring_out15"),
> +	CLK_MSR_ID(196, "am_ring_out16"),
> +	CLK_MSR_ID(197, "am_ring_out17"),
> +	CLK_MSR_ID(198, "am_ring_out18"),
> +	CLK_MSR_ID(199, "am_ring_out19"),
> +	CLK_MSR_ID(200, "mipi_csi_phy0"),
> +	CLK_MSR_ID(201, "mipi_csi_phy1"),
> +	CLK_MSR_ID(202, "mipi_csi_phy2"),
> +	CLK_MSR_ID(203, "mipi_csi_phy3"),
> +	CLK_MSR_ID(204, "vid_pll1_div"),
> +	CLK_MSR_ID(205, "vid_pll2_div"),
> +	CLK_MSR_ID(206, "am_ring_out20"),
> +	CLK_MSR_ID(207, "am_ring_out21"),
> +	CLK_MSR_ID(208, "am_ring_out22"),
> +	CLK_MSR_ID(209, "am_ring_out23"),
> +	CLK_MSR_ID(210, "am_ring_out24"),
> +	CLK_MSR_ID(211, "am_ring_out25"),
> +	CLK_MSR_ID(212, "am_ring_out26"),
> +	CLK_MSR_ID(213, "am_ring_out27"),
> +	CLK_MSR_ID(214, "am_ring_out28"),
> +	CLK_MSR_ID(215, "am_ring_out29"),
> +	CLK_MSR_ID(216, "am_ring_out30"),
> +	CLK_MSR_ID(217, "am_ring_out31"),
> +	CLK_MSR_ID(218, "am_ring_out32"),
> +	CLK_MSR_ID(219, "enc0_if"),
> +	CLK_MSR_ID(220, "enc2"),
> +	CLK_MSR_ID(221, "enc1"),
> +	CLK_MSR_ID(222, "enc0")
> +};
> +
>   static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   			    unsigned int duration)
>   {
> @@ -1026,6 +1278,18 @@ static const struct meson_msr_data clk_msr_s4_data = {
>   	.reg = &msr_reg_offset_v2,
>   };
>   
> +static const struct meson_msr_data clk_msr_a1_data = {
> +	.msr_table = (void *)clk_msr_a1,
> +	.msr_count = ARRAY_SIZE(clk_msr_a1),
> +	.reg = &msr_reg_offset_v2,
> +};
> +
> +static const struct meson_msr_data clk_msr_t7_data = {
> +	.msr_table = (void *)clk_msr_t7,
> +	.msr_count = ARRAY_SIZE(clk_msr_t7),
> +	.reg = &msr_reg_offset_v2,
> +};
> +
>   static const struct of_device_id meson_msr_match_table[] = {
>   	{
>   		.compatible = "amlogic,meson-gx-clk-measure",
> @@ -1059,6 +1323,14 @@ static const struct of_device_id meson_msr_match_table[] = {
>   		.compatible = "amlogic,s4-clk-measure",
>   		.data = &clk_msr_s4_data,
>   	},
> +	{
> +		.compatible = "amlogic,a1-clk-measure",
> +		.data = &clk_msr_a1_data,
> +	},
> +	{
> +		.compatible = "amlogic,t7-clk-measure",
> +		.data = &clk_msr_t7_data,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, meson_msr_match_table);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

