Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBF3C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c03obW5LsKMo4CGjzfYGD7yKrSspSapWD8522GDRY+E=; b=vp37rzZfyZ6M6sYPxY+Znrk0tj
	syV73Inq5n7wRVbmWQo0ABajBYX+dNEKfneLRDtkUbZ/uok/MS9mzJ81tNP3dio5nQd63yEsfYcgo
	klok56PeMMZHhaBw6lQ/afDmEmIAqxePRqYGcqgJxSWGdHn3fYpCqLUZtI8/Ov60LymxPwQRyHU7R
	sVDzaUxYpWW/FNgwYCrdG7VWv94uj01fLamrq9vd3HMd/0IahfvJkYEDzuSsml5woE4o5UgiUI98p
	COv8ZU7UHDjRyB3KLKPZ0b72lcjUxI12JNrfrVR+ZPnMUdFTutPxVDkxgPb6wBCPvI9yeX0M3fs6m
	kGAjZWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HGW-00000001aUe-1L1S;
	Mon, 14 Apr 2025 10:42:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gx6-00000001Uth-0Msu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:22:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-391342fc1f6so3403564f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 03:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744626126; x=1745230926; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c03obW5LsKMo4CGjzfYGD7yKrSspSapWD8522GDRY+E=;
        b=w3P2hfevY0m6UsKWSvDdGkZoc5SfP5oo8QJ/8Ik2YHVLFIV3fvnfoKu2rm4WJ930Lr
         Yyg2zh2Yux5p8jkMlW6HhGO9hP58vBBX3Mc4s+tOy89Yqy5DZ9s8lIedL8UOR+0Mfqez
         4Y7mCLqHXuXFbf6O3qBFS7oJUAFeBCOrQ2Y6KqSTYI1446EkjbzgCJ3V1bB0B+cVyz1G
         EkP4/35TbrunSLDfzDNU1Fg8a2+Dd5edA589m8IqfnXxYo8YhWKd3+43Ae51ONn2Lw+c
         BEEihkA9+BU4RxpSLSDWsfyLJ52wPwRrufifVB0uPKt0rh3rweszpUaNPhFZdZmvO/S6
         RNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626126; x=1745230926;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c03obW5LsKMo4CGjzfYGD7yKrSspSapWD8522GDRY+E=;
        b=Ii3cTb7XZaj3UUFhTXGS6uJ3HC7odSstfFLzjMwuFp3ob4Z+Et/HXh2Z21dZwRMiXB
         5Y4om83S1LWCLRS4e9qAuWdgLqOhacBgmdSdwL3eirVZv0WzhbYMz2Cn7LMl3SqO71bU
         gZ9PefOehVFwJ8U61/6IJAR51NnDT5C3KChaXZYSec0pD+coViWPvg6bcSK1R0pYJBiF
         H4PlAHoBazBVzojCepRyZQ+WoaWLP97pRzeFm8pd12KPR/R3109fZ0ab/3ENJKRlS8Np
         Ds7uuUQ8WER05oGTdAe8r6Kg6MWbFZLWU7oOss94hDayqdzQLsEr5NZYs1SLjUzJhi9o
         JDSw==
X-Gm-Message-State: AOJu0YxlIDTySpNdTEMpMNx9Z21QWNQC3ifVb1m7okbZ73/b2bTJWQpb
	3x7Md6ViDROs4QKRMCi3wCMfjx2D7ClVs1S7i1cI5+YufEmDZCAEZlv1jnQrOj4=
X-Gm-Gg: ASbGncsfb2UWi9w8E48+uyZqGPFu25qpishtXX6CNeWPA8muPRoH4IRW4F6/Uo9Vf7J
	UXErTVcOB8/HF7kOY+qecKkHj4zKSkgv/2Qt5VZFI5EuduZmQAqBWdBXeVfeAIxfdhIuPRJLf9A
	U5ZasQPV/VtGVs8SOSiHATP91FObBos0ZO4iY88OQmdwnY6wwwmf5KMhzOCVe7FICijrkKm/Ht7
	DCHqTzqVud36AebocHsTWtX037as0U81CRTxLAJH0qtNp/gXYu5APoRLnVSKPoNOsc7t4vB5kSu
	I8KY4ieu1uZIU/UtP5OXy4DCqISTVz0l4mqXlrvYW3JDH10Hx+w3qBr/abqBFZ3eMbSzbm28ab7
	U/Z7pB6dzgIkQ8/9oaw==
X-Google-Smtp-Source: AGHT+IG3Fteb6fKVMQ8a4Y/6aL+K9VtOylBs6apDdCb2Zm0pQ2pWFytupwBh7IsBWbm67TQyeEH02w==
X-Received: by 2002:a05:6000:4285:b0:39c:1efb:ee8a with SMTP id ffacd0b85a97d-39eaaebdecfmr8897783f8f.38.1744626126394;
        Mon, 14 Apr 2025 03:22:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d053sm10696481f8f.68.2025.04.14.03.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:22:06 -0700 (PDT)
Message-ID: <a6eafcb0-8fa8-44f7-9afc-e368f931127b@linaro.org>
Date: Mon, 14 Apr 2025 12:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/7] soc: amlogic: clk-measure: Add support for C3
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-4-65077690053a@amlogic.com>
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
In-Reply-To: <20250414-clk-measure-v2-4-65077690053a@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_032208_151347_AC9B7086 
X-CRM114-Status: GOOD (  15.98  )
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
> Add the clk-measurer clocks IDs for the Amlogic C3 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 157 ++++++++++++++++++++++++++++++++
>   1 file changed, 157 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 82c008ade894..810454ac4119 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -494,6 +494,146 @@ static const struct meson_msr_id clk_msr_sm1[] = {
>   	CLK_MSR_ID(127, "csi2_data"),
>   };
>   
> +static const struct meson_msr_id clk_msr_c3[] = {
> +	CLK_MSR_ID(0,	"sys_clk"),
> +	CLK_MSR_ID(1,	"axi_clk"),
> +	CLK_MSR_ID(2,	"rtc_clk"),
> +	CLK_MSR_ID(3,	"p20_usb2_ckout"),
> +	CLK_MSR_ID(4,	"eth_mpll_test"),
> +	CLK_MSR_ID(5,	"sys_pll"),
> +	CLK_MSR_ID(6,	"cpu_clk_div16"),
> +	CLK_MSR_ID(7,	"ts_pll"),
> +	CLK_MSR_ID(8,	"fclk_div2"),
> +	CLK_MSR_ID(9,	"fclk_div2p5"),
> +	CLK_MSR_ID(10,	"fclk_div3"),
> +	CLK_MSR_ID(11,	"fclk_div4"),
> +	CLK_MSR_ID(12,	"fclk_div5"),
> +	CLK_MSR_ID(13,	"fclk_div7"),
> +	CLK_MSR_ID(15,	"fclk_50m"),
> +	CLK_MSR_ID(16,	"sys_oscin32k_i"),
> +	CLK_MSR_ID(17,	"mclk_pll"),
> +	CLK_MSR_ID(19,	"hifi_pll"),
> +	CLK_MSR_ID(20,	"gp0_pll"),
> +	CLK_MSR_ID(21,	"gp1_pll"),
> +	CLK_MSR_ID(22,	"eth_mppll_50m_ckout"),
> +	CLK_MSR_ID(23,	"sys_pll_div16"),
> +	CLK_MSR_ID(24,	"ddr_dpll_pt_clk"),
> +	CLK_MSR_ID(26,	"nna_core"),
> +	CLK_MSR_ID(27,	"rtc_sec_pulse_out"),
> +	CLK_MSR_ID(28,	"rtc_osc_clk_out"),
> +	CLK_MSR_ID(29,	"debug_in_clk"),
> +	CLK_MSR_ID(30,	"mod_eth_phy_ref_clk"),
> +	CLK_MSR_ID(31,	"mod_eth_tx_clk"),
> +	CLK_MSR_ID(32,	"eth_125m"),
> +	CLK_MSR_ID(33,	"eth_rmii"),
> +	CLK_MSR_ID(34,	"co_clkin_to_mac"),
> +	CLK_MSR_ID(36,	"co_rx_clk"),
> +	CLK_MSR_ID(37,	"co_tx_clk"),
> +	CLK_MSR_ID(38,	"eth_phy_rxclk"),
> +	CLK_MSR_ID(39,	"eth_phy_plltxclk"),
> +	CLK_MSR_ID(40,	"ephy_test_clk"),
> +	CLK_MSR_ID(66,	"vapb"),
> +	CLK_MSR_ID(67,	"ge2d"),
> +	CLK_MSR_ID(68,	"dewarpa"),
> +	CLK_MSR_ID(70,	"mipi_dsi_meas"),
> +	CLK_MSR_ID(71,	"dsi_phy"),
> +	CLK_MSR_ID(79,	"rama"),
> +	CLK_MSR_ID(94,	"vc9000e_core"),
> +	CLK_MSR_ID(95,	"vc9000e_sys"),
> +	CLK_MSR_ID(96,	"vc9000e_aclk"),
> +	CLK_MSR_ID(97,	"hcodec"),
> +	CLK_MSR_ID(106,	"deskew_pll_clk_div32_out"),
> +	CLK_MSR_ID(107,	"mipi_csi_phy_clk_out[0]"),
> +	CLK_MSR_ID(108,	"mipi_csi_phy_clk_out[1]"),
> +	CLK_MSR_ID(110,	"spifc"),
> +	CLK_MSR_ID(111,	"saradc"),
> +	CLK_MSR_ID(112,	"ts"),
> +	CLK_MSR_ID(113,	"sd_emmc_c"),
> +	CLK_MSR_ID(114,	"sd_emmc_b"),
> +	CLK_MSR_ID(115,	"sd_emmc_a"),
> +	CLK_MSR_ID(116,	"gpio_msr_clk"),
> +	CLK_MSR_ID(117,	"spicc_b"),
> +	CLK_MSR_ID(118,	"spicc_a"),
> +	CLK_MSR_ID(122,	"mod_audio_pdm_dclk_o"),
> +	CLK_MSR_ID(124,	"o_earcrx_dmac_clk"),
> +	CLK_MSR_ID(125,	"o_earcrx_cmdc_clk"),
> +	CLK_MSR_ID(126,	"o_earctx_dmac_clk"),
> +	CLK_MSR_ID(127,	"o_earctx_cmdc_clk"),
> +	CLK_MSR_ID(128,	"o_tohdmitx_bclk"),
> +	CLK_MSR_ID(129,	"o_tohdmitx_mclk"),
> +	CLK_MSR_ID(130,	"o_tohdmitx_spdif_clk"),
> +	CLK_MSR_ID(131,	"o_toacodec_bclk"),
> +	CLK_MSR_ID(132,	"o_toacodec_mclk"),
> +	CLK_MSR_ID(133,	"o_spdifout_b_mst_clk"),
> +	CLK_MSR_ID(134,	"o_spdifout_mst_clk"),
> +	CLK_MSR_ID(135,	"o_spdifin_mst_clk"),
> +	CLK_MSR_ID(136,	"o_audio_mclk"),
> +	CLK_MSR_ID(137,	"o_vad_clk"),
> +	CLK_MSR_ID(138,	"o_tdmout_d_sclk"),
> +	CLK_MSR_ID(139,	"o_tdmout_c_sclk"),
> +	CLK_MSR_ID(140,	"o_tdmout_b_sclk"),
> +	CLK_MSR_ID(141,	"o_tdmout_a_sclk"),
> +	CLK_MSR_ID(142,	"o_tdminb_1b_sclk"),
> +	CLK_MSR_ID(143,	"o_tdmin_1b_sclk"),
> +	CLK_MSR_ID(144,	"o_tdmin_d_sclk"),
> +	CLK_MSR_ID(145,	"o_tdmin_c_sclk"),
> +	CLK_MSR_ID(146,	"o_tdmin_b_sclk"),
> +	CLK_MSR_ID(147,	"o_tdmin_a_sclk"),
> +	CLK_MSR_ID(148,	"o_resampleb_clk"),
> +	CLK_MSR_ID(149,	"o_resamplea_clk"),
> +	CLK_MSR_ID(150,	"o_pdmb_sysclk"),
> +	CLK_MSR_ID(151,	"o_pdmb_dclk"),
> +	CLK_MSR_ID(152,	"o_pdm_sysclk"),
> +	CLK_MSR_ID(153,	"o_pdm_dclk"),
> +	CLK_MSR_ID(154,	"c_alockerb_out_clk"),
> +	CLK_MSR_ID(155,	"c_alockerb_in_clk"),
> +	CLK_MSR_ID(156,	"c_alocker_out_clk"),
> +	CLK_MSR_ID(157,	"c_alocker_in_clk"),
> +	CLK_MSR_ID(158,	"audio_mst_clk[34]"),
> +	CLK_MSR_ID(159,	"audio_mst_clk[35]"),
> +	CLK_MSR_ID(160,	"pwm_n"),
> +	CLK_MSR_ID(161,	"pwm_m"),
> +	CLK_MSR_ID(162,	"pwm_l"),
> +	CLK_MSR_ID(163,	"pwm_k"),
> +	CLK_MSR_ID(164,	"pwm_j"),
> +	CLK_MSR_ID(165,	"pwm_i"),
> +	CLK_MSR_ID(166,	"pwm_h"),
> +	CLK_MSR_ID(167,	"pwm_g"),
> +	CLK_MSR_ID(168,	"pwm_f"),
> +	CLK_MSR_ID(169,	"pwm_e"),
> +	CLK_MSR_ID(170,	"pwm_d"),
> +	CLK_MSR_ID(171,	"pwm_c"),
> +	CLK_MSR_ID(172,	"pwm_b"),
> +	CLK_MSR_ID(173,	"pwm_a"),
> +	CLK_MSR_ID(174,	"AU_DAC1_CLK_TO_GPIO"),
> +	CLK_MSR_ID(175,	"AU_ADC_CLK_TO_GPIO"),
> +	CLK_MSR_ID(176,	"rng_ring_osc_clk[0]"),
> +	CLK_MSR_ID(177,	"rng_ring_osc_clk[1]"),
> +	CLK_MSR_ID(178,	"rng_ring_osc_clk[2]"),
> +	CLK_MSR_ID(179,	"rng_ring_osc_clk[3]"),
> +	CLK_MSR_ID(180,	"sys_cpu_ring_osc_clk[0]"),
> +	CLK_MSR_ID(181,	"sys_cpu_ring_osc_clk[1]"),
> +	CLK_MSR_ID(182,	"sys_cpu_ring_osc_clk[2]"),
> +	CLK_MSR_ID(183,	"sys_cpu_ring_osc_clk[3]"),
> +	CLK_MSR_ID(184,	"sys_cpu_ring_osc_clk[4]"),
> +	CLK_MSR_ID(185,	"sys_cpu_ring_osc_clk[5]"),
> +	CLK_MSR_ID(186,	"sys_cpu_ring_osc_clk[6]"),
> +	CLK_MSR_ID(187,	"sys_cpu_ring_osc_clk[7]"),
> +	CLK_MSR_ID(188,	"sys_cpu_ring_osc_clk[8]"),
> +	CLK_MSR_ID(189,	"sys_cpu_ring_osc_clk[9]"),
> +	CLK_MSR_ID(190,	"sys_cpu_ring_osc_clk[10]"),
> +	CLK_MSR_ID(191,	"sys_cpu_ring_osc_clk[11]"),
> +	CLK_MSR_ID(192,	"am_ring_osc_clk_out[12](dmc)"),
> +	CLK_MSR_ID(193,	"am_ring_osc_clk_out[13](rama)"),
> +	CLK_MSR_ID(194,	"am_ring_osc_clk_out[14](nna)"),
> +	CLK_MSR_ID(195,	"am_ring_osc_clk_out[15](nna)"),
> +	CLK_MSR_ID(200,	"rng_ring_osc_clk_1[0]"),
> +	CLK_MSR_ID(201,	"rng_ring_osc_clk_1[1]"),
> +	CLK_MSR_ID(202,	"rng_ring_osc_clk_1[2]"),
> +	CLK_MSR_ID(203,	"rng_ring_osc_clk_1[3]"),
> +
> +};
> +
>   static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   			    unsigned int duration)
>   {
> @@ -713,6 +853,19 @@ static const struct meson_msr_data clk_msr_sm1_data = {
>   	.reg = &msr_reg_offset,
>   };
>   
> +struct msr_reg_offset msr_reg_offset_v2 = {
> +	.freq_ctrl = 0x0,
> +	.duty_ctrl = 0x4,
> +	.freq_val = 0x8,
> +	.duty_val = 0x18,
> +};

Same as patch 1

> +
> +static const struct meson_msr_data clk_msr_c3_data = {
> +	.msr_table = (void *)clk_msr_c3,
> +	.msr_count = ARRAY_SIZE(clk_msr_c3),
> +	.reg = &msr_reg_offset_v2,
> +};
> +
>   static const struct of_device_id meson_msr_match_table[] = {
>   	{
>   		.compatible = "amlogic,meson-gx-clk-measure",
> @@ -738,6 +891,10 @@ static const struct of_device_id meson_msr_match_table[] = {
>   		.compatible = "amlogic,meson-sm1-clk-measure",
>   		.data = &clk_msr_sm1_data,
>   	},
> +	{
> +		.compatible = "amlogic,c3-clk-measure",
> +		.data = &clk_msr_c3_data,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, meson_msr_match_table);
> 

With this fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

