Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A414EC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9smT7sBPETaaqvwcBN7SNinTOkarRObQ6BBW1XBQU+I=; b=wZYhv7kp5qh98/uuYuuRYCPB41
	a35vPUSPLbzFzncgx2FpTM8h7kXVdFJ5032dvmr1ZcPJl4KmW43a0fmFPayyLv8L2/nY4K/ro6Ldy
	hg+dwUmH0POzv+AV/UCE93U1+hgK/MRPvcp6Z8cBvzrq3a/GgUddexx07uto61timsJED0cAvonE0
	TVAF/115zlyPqg2BCr1ezkCCCz8WFj0Ri3aaN5CfgDvxFcExC8s6aH87gBlAh2uDZLBhWrsBZU1ix
	Vitkqu74HflHIvR4HtFJBQ1j3b8EEvWRXsZHXVvVroE9Cl+vbvUUTkd5sdywS+u30vUCxuxXKq9CD
	2C45LMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HJf-00000001bJO-0OAM;
	Mon, 14 Apr 2025 10:45:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GxK-00000001Uvp-0AQI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:22:23 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so2559579f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744626140; x=1745230940; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9smT7sBPETaaqvwcBN7SNinTOkarRObQ6BBW1XBQU+I=;
        b=l1sbjqzj0ZJ0d2BtbrNnoPu/xazsfk4dKryV04zZ0AzOuLl8Qm2NswIupFrGJTO5N9
         e56+Alt7HEOzVCtE8W3HxM28dH6AixkyPl6YVZHdnWP0KRXiIw9KZmui+OJo/FAbzF4h
         xPhLQXtoU2tFgDEDs0jKwKsXsV8rKoxnON2m5jjheevjMGQ3DDDzrX/KDQwx9ONc5AWf
         KjdLW4pRiGMeYxkA6wgk02rp81KMj9LdI4pOsowIEgI+/+fS8RNvE8eV7V9DufW3NrE9
         KWFVv8Bx2SfnMH3CsuKqh48po61JV8RvcGGbmQRGwRlxn1AfuzA4TFEk/Vu+VtdIvsB0
         BedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626140; x=1745230940;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9smT7sBPETaaqvwcBN7SNinTOkarRObQ6BBW1XBQU+I=;
        b=T4pjy/rfVQkXxdRvk4JkLr5jQ/52az0iOHelqB6Imoxboal1lwd7m92IXLBCBIhOZT
         K2a+tHtOkqmtfGebJ+QxbTiPYtY6CdV6JV+acJfeORvNPDQZ6kv+RkGCcXsg2SExuNHY
         97wOcSP4S6I1armUiEJkJffORpSZENPsOpzTAy80PIAZisYXh3MA+tOAiJ3qgtM/VRcP
         2n0PjN85O4mYiwLxV60RgVx73ttUCBIz19c25zQCf1PDx3TdlFy9u/GbfH1ilxNo4S/u
         ZNbhPXvjyuqCZF4yDfA/7XrCd4NKnQHEKT4xWrFECjlizb6jUG37tOUMgxOy2i9uf2VW
         nPtA==
X-Gm-Message-State: AOJu0Yxyb85b9dzaGRJkMqqGA+oiDd7b72n7iaq7qQpbzV6r6SFY5W6s
	yqcuK9bCmAkNhLgeHgWRAI9n8/qckiDNWTkv1QdnfQBvYciUysAH8/z7SgkG51k=
X-Gm-Gg: ASbGncu9pd/O4jLUmy7oQ/aFldewolQ/TSBN1un0qbPJcNJZ/6GSgYYyzto0dgvWUsh
	ddez0zLBCA1C9o7N62p7tleA1F1s/WPl6yPD+7ApxsJwJN6fDEs7Yuc10/jQTAvW++9dlPYekjD
	BtlSr24SrmV50geKfMRrvNxuVfMDfMJx+nLYxlIhqkwTEr4/4snuO7Pn1zZuvHz4KzzAOsmB35c
	JjQthkQ30yviHTMnl4CLEy7YPmRLlt9sajHn2QXdNInhfeR6XArRyCVPsiGfa80MM2XxEsR6O7k
	ZcvrpwzaAkckKHUNj9+PMUdHTztWvNm99dmWediJuEVEp6YHhFXGderAYX8Ua7buTvspZba+EyN
	Odddt1v9DrWbLBiDUbw==
X-Google-Smtp-Source: AGHT+IH3BmfwVZhtxUYWyXGeGlJrsKlthGN75wJUBLid7EQkWqFdc2rchiXl0cf97W0RtasEKlyfxA==
X-Received: by 2002:a5d:64c4:0:b0:391:319c:1950 with SMTP id ffacd0b85a97d-39ea51d3669mr8369177f8f.8.1744626140093;
        Mon, 14 Apr 2025 03:22:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cd17sm10606786f8f.78.2025.04.14.03.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:22:19 -0700 (PDT)
Message-ID: <d5f75892-4dd9-453a-b02d-33f1df26a13e@linaro.org>
Date: Mon, 14 Apr 2025 12:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/7] soc: amlogic: clk-measure: Add support for S4
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-5-65077690053a@amlogic.com>
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
In-Reply-To: <20250414-clk-measure-v2-5-65077690053a@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_032222_073044_B49CD577 
X-CRM114-Status: GOOD (  15.08  )
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

On 14/04/2025 12:12, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add the clk-measurer clocks IDs for the Amlogic S4 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 163 ++++++++++++++++++++++++++++++++
>   1 file changed, 163 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 810454ac4119..f2fca59a6fc4 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -634,6 +634,159 @@ static const struct meson_msr_id clk_msr_c3[] = {
>   
>   };
>   
> +static const struct meson_msr_id clk_msr_s4[] = {
> +	CLK_MSR_ID(0, "sys_clk"),
> +	CLK_MSR_ID(1, "axi_clk"),
> +	CLK_MSR_ID(2, "rtc_clk"),
> +	CLK_MSR_ID(5, "mali"),
> +	CLK_MSR_ID(6, "cpu_clk_div16"),
> +	CLK_MSR_ID(7, "ceca_clk"),
> +	CLK_MSR_ID(8, "cecb_clk"),
> +	CLK_MSR_ID(10, "fclk_div5"),
> +	CLK_MSR_ID(11, "mpll0"),
> +	CLK_MSR_ID(12, "mpll1"),
> +	CLK_MSR_ID(13, "mpll2"),
> +	CLK_MSR_ID(14, "mpll3"),
> +	CLK_MSR_ID(15, "fclk_50m"),
> +	CLK_MSR_ID(16, "pcie_clk_inp"),
> +	CLK_MSR_ID(17, "pcie_clk_inn"),
> +	CLK_MSR_ID(18, "mpll_clk_test_out"),
> +	CLK_MSR_ID(19, "hifi_pll"),
> +	CLK_MSR_ID(20, "gp0_pll"),
> +	CLK_MSR_ID(21, "gp1_pll"),
> +	CLK_MSR_ID(22, "eth_mppll_50m_ckout"),
> +	CLK_MSR_ID(23, "sys_pll_div16"),
> +	CLK_MSR_ID(24, "ddr_dpll_pt_clk"),
> +	CLK_MSR_ID(30, "mod_eth_phy_ref_clk"),
> +	CLK_MSR_ID(31, "mod_eth_tx_clk"),
> +	CLK_MSR_ID(32, "eth_125m"),
> +	CLK_MSR_ID(33, "eth_rmii"),
> +	CLK_MSR_ID(34, "co_clkin_to_mac"),
> +	CLK_MSR_ID(35, "mod_eth_rx_clk_rmii"),
> +	CLK_MSR_ID(36, "co_rx_clk"),
> +	CLK_MSR_ID(37, "co_tx_clk"),
> +	CLK_MSR_ID(38, "eth_phy_rxclk"),
> +	CLK_MSR_ID(39, "eth_phy_plltxclk"),
> +	CLK_MSR_ID(40, "ephy_test_clk"),
> +	CLK_MSR_ID(50, "vid_pll_div_clk_out"),
> +	CLK_MSR_ID(51, "enci"),
> +	CLK_MSR_ID(52, "encp"),
> +	CLK_MSR_ID(53, "encl"),
> +	CLK_MSR_ID(54, "vdac"),
> +	CLK_MSR_ID(55, "cdac_clk_c"),
> +	CLK_MSR_ID(56, "mod_tcon_clko"),
> +	CLK_MSR_ID(57, "lcd_an_clk_ph2"),
> +	CLK_MSR_ID(58, "lcd_an_clk_ph3"),
> +	CLK_MSR_ID(59, "hdmitx_pixel"),
> +	CLK_MSR_ID(60, "vdin_meas"),
> +	CLK_MSR_ID(61, "vpu"),
> +	CLK_MSR_ID(62, "vpu_clkb"),
> +	CLK_MSR_ID(63, "vpu_clkb_tmp"),
> +	CLK_MSR_ID(64, "vpu_clkc"),
> +	CLK_MSR_ID(65, "vid_lock"),
> +	CLK_MSR_ID(66, "vapb"),
> +	CLK_MSR_ID(67, "ge2d"),
> +	CLK_MSR_ID(68, "cts_hdcp22_esmclk"),
> +	CLK_MSR_ID(69, "cts_hdcp22_skpclk"),
> +	CLK_MSR_ID(76, "hdmitx_tmds"),
> +	CLK_MSR_ID(77, "hdmitx_sys_clk"),
> +	CLK_MSR_ID(78, "hdmitx_fe_clk"),
> +	CLK_MSR_ID(79, "rama"),
> +	CLK_MSR_ID(93, "vdec"),
> +	CLK_MSR_ID(99, "hevcf"),
> +	CLK_MSR_ID(100, "demod_core"),
> +	CLK_MSR_ID(101, "adc_extclk_in"),
> +	CLK_MSR_ID(102, "cts_demod_core_t2_clk"),
> +	CLK_MSR_ID(103, "adc_dpll_intclk"),
> +	CLK_MSR_ID(104, "adc_dpll_clk_b3"),
> +	CLK_MSR_ID(105, "s2_adc_clk"),
> +	CLK_MSR_ID(106, "deskew_pll_clk_div32_out"),
> +	CLK_MSR_ID(110, "sc"),
> +	CLK_MSR_ID(111, "sar_adc"),
> +	CLK_MSR_ID(113, "sd_emmc_c"),
> +	CLK_MSR_ID(114, "sd_emmc_b"),
> +	CLK_MSR_ID(115, "sd_emmc_a"),
> +	CLK_MSR_ID(116, "gpio_msr_clk"),
> +	CLK_MSR_ID(118, "spicc0"),
> +	CLK_MSR_ID(121, "ts"),
> +	CLK_MSR_ID(130, "audio_vad_clk"),
> +	CLK_MSR_ID(131, "acodec_dac_clk_x128"),
> +	CLK_MSR_ID(132, "audio_locker_in_clk"),
> +	CLK_MSR_ID(133, "audio_locker_out_clk"),
> +	CLK_MSR_ID(134, "audio_tdmout_c_sclk"),
> +	CLK_MSR_ID(135, "audio_tdmout_b_sclk"),
> +	CLK_MSR_ID(136, "audio_tdmout_a_sclk"),
> +	CLK_MSR_ID(137, "audio_tdmin_lb_sclk"),
> +	CLK_MSR_ID(138, "audio_tdmin_c_sclk"),
> +	CLK_MSR_ID(139, "audio_tdmin_b_sclk"),
> +	CLK_MSR_ID(140, "audio_tdmin_a_sclk"),
> +	CLK_MSR_ID(141, "audio_resamplea_clk"),
> +	CLK_MSR_ID(142, "audio_pdm_sysclk"),
> +	CLK_MSR_ID(143, "audio_spdifout_b_mst_clk"),
> +	CLK_MSR_ID(144, "audio_spdifout_mst_clk"),
> +	CLK_MSR_ID(145, "audio_spdifin_mst_clk"),
> +	CLK_MSR_ID(146, "audio_pdm_dclk"),
> +	CLK_MSR_ID(147, "audio_resampleb_clk"),
> +	CLK_MSR_ID(160, "pwm_j"),
> +	CLK_MSR_ID(161, "pwm_i"),
> +	CLK_MSR_ID(162, "pwm_h"),
> +	CLK_MSR_ID(163, "pwm_g"),
> +	CLK_MSR_ID(164, "pwm_f"),
> +	CLK_MSR_ID(165, "pwm_e"),
> +	CLK_MSR_ID(166, "pwm_d"),
> +	CLK_MSR_ID(167, "pwm_c"),
> +	CLK_MSR_ID(168, "pwm_b"),
> +	CLK_MSR_ID(169, "pwm_a"),
> +	CLK_MSR_ID(176, "rng_ring_0"),
> +	CLK_MSR_ID(177, "rng_ring_1"),
> +	CLK_MSR_ID(178, "rng_ring_2"),
> +	CLK_MSR_ID(179, "rng_ring_3"),
> +	CLK_MSR_ID(180, "dmc_osc_ring(LVT16)"),
> +	CLK_MSR_ID(181, "gpu_osc_ring0(LVT16)"),
> +	CLK_MSR_ID(182, "gpu_osc_ring1(ULVT16)"),
> +	CLK_MSR_ID(183, "gpu_osc_ring2(SLVT16)"),
> +	CLK_MSR_ID(184, "vpu_osc_ring0(SVT24)"),
> +	CLK_MSR_ID(185, "vpu_osc_ring1(LVT20)"),
> +	CLK_MSR_ID(186, "vpu_osc_ring2(LVT16)"),
> +	CLK_MSR_ID(187, "dos_osc_ring0(SVT24)"),
> +	CLK_MSR_ID(188, "dos_osc_ring1(SVT16)"),
> +	CLK_MSR_ID(189, "dos_osc_ring2(LVT16)"),
> +	CLK_MSR_ID(190, "dos_osc_ring3(ULVT20)"),
> +	CLK_MSR_ID(192, "axi_sram_osc_ring(SVT16)"),
> +	CLK_MSR_ID(193, "demod_osc_ring0"),
> +	CLK_MSR_ID(194, "demod_osc_ring1"),
> +	CLK_MSR_ID(195, "sar_osc_ring"),
> +	CLK_MSR_ID(196, "sys_cpu_osc_ring0"),
> +	CLK_MSR_ID(197, "sys_cpu_osc_ring1"),
> +	CLK_MSR_ID(198, "sys_cpu_osc_ring2"),
> +	CLK_MSR_ID(199, "sys_cpu_osc_ring3"),
> +	CLK_MSR_ID(200, "sys_cpu_osc_ring4"),
> +	CLK_MSR_ID(201, "sys_cpu_osc_ring5"),
> +	CLK_MSR_ID(202, "sys_cpu_osc_ring6"),
> +	CLK_MSR_ID(203, "sys_cpu_osc_ring7"),
> +	CLK_MSR_ID(204, "sys_cpu_osc_ring8"),
> +	CLK_MSR_ID(205, "sys_cpu_osc_ring9"),
> +	CLK_MSR_ID(206, "sys_cpu_osc_ring10"),
> +	CLK_MSR_ID(207, "sys_cpu_osc_ring11"),
> +	CLK_MSR_ID(208, "sys_cpu_osc_ring12"),
> +	CLK_MSR_ID(209, "sys_cpu_osc_ring13"),
> +	CLK_MSR_ID(210, "sys_cpu_osc_ring14"),
> +	CLK_MSR_ID(211, "sys_cpu_osc_ring15"),
> +	CLK_MSR_ID(212, "sys_cpu_osc_ring16"),
> +	CLK_MSR_ID(213, "sys_cpu_osc_ring17"),
> +	CLK_MSR_ID(214, "sys_cpu_osc_ring18"),
> +	CLK_MSR_ID(215, "sys_cpu_osc_ring19"),
> +	CLK_MSR_ID(216, "sys_cpu_osc_ring20"),
> +	CLK_MSR_ID(217, "sys_cpu_osc_ring21"),
> +	CLK_MSR_ID(218, "sys_cpu_osc_ring22"),
> +	CLK_MSR_ID(219, "sys_cpu_osc_ring23"),
> +	CLK_MSR_ID(220, "sys_cpu_osc_ring24"),
> +	CLK_MSR_ID(221, "sys_cpu_osc_ring25"),
> +	CLK_MSR_ID(222, "sys_cpu_osc_ring26"),
> +	CLK_MSR_ID(223, "sys_cpu_osc_ring27"),
> +
> +};
> +
>   static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   			    unsigned int duration)
>   {
> @@ -866,6 +1019,12 @@ static const struct meson_msr_data clk_msr_c3_data = {
>   	.reg = &msr_reg_offset_v2,
>   };
>   
> +static const struct meson_msr_data clk_msr_s4_data = {
> +	.msr_table = (void *)clk_msr_s4,
> +	.msr_count = ARRAY_SIZE(clk_msr_s4),
> +	.reg = &msr_reg_offset_v2,
> +};
> +
>   static const struct of_device_id meson_msr_match_table[] = {
>   	{
>   		.compatible = "amlogic,meson-gx-clk-measure",
> @@ -895,6 +1054,10 @@ static const struct of_device_id meson_msr_match_table[] = {
>   		.compatible = "amlogic,c3-clk-measure",
>   		.data = &clk_msr_c3_data,
>   	},
> +	{
> +		.compatible = "amlogic,s4-clk-measure",
> +		.data = &clk_msr_s4_data,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, meson_msr_match_table);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

