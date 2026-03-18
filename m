Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADE2103E170
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hP/rw8hSlAdGUj7ffcNAXTQEMrNqGOy1zArJH20VdTI=; b=PPvnNiLYKZbALkx7HE8hDhzIyX
	bc/JF8XUURO0bpqVA72t2LWC+z2y6ABLThmHHMSab80hJylcRbGM0d/h2nwHcYtHx26vy/WDCq2If
	iWGrdvBBRbUNHArdAaTgiAwO1LkpAdnmOHvdMGKM0XjVQJNzSlw/dFvEj0sslPtSLmNP/zDMAAdHn
	UbcXu2UXaXldUAdaVBLH3gGPqsWiTJ7uCfovkz01REZXr0x6ia0+08YMFfslhVWSe7d+SMz4rl55c
	4a8kKluoT2GZVsoD2wSh+wUIR1HCtv+m11j4ePHP01FLapiAoK2tjKzFKg9JmmoefEgouZxTjQEaK
	h+ujujbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2q2S-00000008OBT-2U2I;
	Wed, 18 Mar 2026 12:30:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2q2P-00000008OAn-0RhL;
	Wed, 18 Mar 2026 12:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837010;
	bh=iOulkhDoqNITbcvR7gTtzu3AHBi+cKQ21g+bnwKGJ64=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=A4uxB/0qxWOhi+l49UbCUHvGY/AqdbIZKCIC8nprEl8vrFJ4LT56pSrGF9BWPtvAw
	 k+fzd/9pNHbsCZmK4ZEPqXz2OaNrBXW6N4xk0Y3ZCc4k7Aei5BVasz31Zs5mtwLyLy
	 79xxD3rwLIHwxx7P2bTsy8/x8Mg42MFfpmE9ndoQUypSRIC0hAhriKMuc25Sc6XKD3
	 cbhre8NlJrTnRPq7ulwRoDvfRHWTfG85iT9haXKYOSPTiqMtFMSBJCrTF5vFOLeD5p
	 2PmPQ5AgY7vSHOsq53/O7IvjECh9kZwX0/9UN6nRtb8dtpTuen2929/oeoB0T0Y6Bf
	 dSdnKvHQUJC0A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17EF117E0497;
	Wed, 18 Mar 2026 13:30:10 +0100 (CET)
Message-ID: <d466ee35-789a-4e2c-a040-f182083dd82e@collabora.com>
Date: Wed, 18 Mar 2026 13:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt7988: use MUX_CLR_SET_UPD for gate-less
 muxes
To: Daniel Golle <daniel@makrotopia.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <869a8a99bbde357fb4f2175f99e605c3e1597640.1773801987.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <869a8a99bbde357fb4f2175f99e605c3e1597640.1773801987.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053013_305439_BE8EC7B1 
X-CRM114-Status: GOOD (  19.53  )
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

Il 18/03/26 03:48, Daniel Golle ha scritto:
> All 18 muxes in the infra_muxes[] array are pure mux selectors without
> a clock gate, yet they were defined using MUX_GATE_CLR_SET_UPD with
> gate_shift = -1.
> 
> This macro assigns mtk_mux_gate_clr_set_upd_ops, whose
> enable/disable/is_enabled callbacks perform BIT(gate_shift). Since
> gate_shift is stored as u8, the -1 truncates to 255, causing a
> shift-out-of-bounds at runtime:
> 
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
> 
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:102:4
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
> 
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:122:16
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
> 
> Switch these definitions to MUX_CLR_SET_UPD, which uses
> mtk_mux_clr_set_upd_ops (no gate callbacks). The actual clock gating
> for these peripherals is handled by the separate GATE_INFRA* definitions
> further down.
> 
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

While this makes things to actually work, there's another problem, and that is
that .upd_ofs is a u32 and is being set to -1.

Since, as far as I remember, MT7988 is *not* the only one that is affected by the
issue that you're fixing here...

I would rather consider, instead, to add a new macro that is a bit more foolproof
in clk-mux.h

#define MUX_CLR_SET(_id, _name, _parents, _mux_ofs,			\
		    _mux_set_ofs, _mux_clr_ofs, _shift)
	MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs, _mux_set_ofs,	\
			_mux_clr_ofs, _shift, 0, 0, -1)

...and use it in this driver (and others, if you can..) instead.

Cheers,
Angelo

> ---
>   drivers/clk/mediatek/clk-mt7988-infracfg.c | 84 +++++++++++-----------
>   1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> index c40e18c27f12e..57203d08ac265 100644
> --- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> @@ -56,49 +56,49 @@ static const char *const infra_pcie_gfmux_tl_ck_o_p3_parents[] __initconst = {
>   
>   static const struct mtk_mux infra_muxes[] = {
>   	/* MODULE_CLK_SEL_0 */
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
> -			     infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
> -			     infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
> -			     infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel", infra_mux_spi0_parents,
> -			     0x0018, 0x0010, 0x0014, 4, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel", infra_mux_spi1_parents,
> -			     0x0018, 0x0010, 0x0014, 5, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel", infra_mux_spi0_parents,
> -			     0x0018, 0x0010, 0x0014, 6, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_SEL, "infra_pwm_sel", infra_pwm_bck_parents, 0x0018,
> -			     0x0010, 0x0014, 14, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 16, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 18, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 20, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 22, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 24, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 26, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 28, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 30, 2, -1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
> +			infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
> +			infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
> +			infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel",
> +			infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 4, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel",
> +			infra_mux_spi1_parents, 0x0018, 0x0010, 0x0014, 5, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel",
> +			infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 6, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_SEL, "infra_pwm_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 14, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 16, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 18, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 20, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 22, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 24, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 26, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 28, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 30, 2, -1, -1),
>   	/* MODULE_CLK_SEL_1 */
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL, "infra_pcie_gfmux_tl_o_p0_sel",
> -			     infra_pcie_gfmux_tl_ck_o_p0_parents, 0x0028, 0x0020, 0x0024, 0, 2, -1,
> -			     -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL, "infra_pcie_gfmux_tl_o_p1_sel",
> -			     infra_pcie_gfmux_tl_ck_o_p1_parents, 0x0028, 0x0020, 0x0024, 2, 2, -1,
> -			     -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL, "infra_pcie_gfmux_tl_o_p2_sel",
> -			     infra_pcie_gfmux_tl_ck_o_p2_parents, 0x0028, 0x0020, 0x0024, 4, 2, -1,
> -			     -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL, "infra_pcie_gfmux_tl_o_p3_sel",
> -			     infra_pcie_gfmux_tl_ck_o_p3_parents, 0x0028, 0x0020, 0x0024, 6, 2, -1,
> -			     -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL, "infra_pcie_gfmux_tl_o_p0_sel",
> +			infra_pcie_gfmux_tl_ck_o_p0_parents, 0x0028, 0x0020, 0x0024, 0, 2,
> +			-1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL, "infra_pcie_gfmux_tl_o_p1_sel",
> +			infra_pcie_gfmux_tl_ck_o_p1_parents, 0x0028, 0x0020, 0x0024, 2, 2,
> +			-1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL, "infra_pcie_gfmux_tl_o_p2_sel",
> +			infra_pcie_gfmux_tl_ck_o_p2_parents, 0x0028, 0x0020, 0x0024, 4, 2,
> +			-1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL, "infra_pcie_gfmux_tl_o_p3_sel",
> +			infra_pcie_gfmux_tl_ck_o_p3_parents, 0x0028, 0x0020, 0x0024, 6, 2,
> +			-1, -1),
>   };
>   
>   static const struct mtk_gate_regs infra0_cg_regs = {



