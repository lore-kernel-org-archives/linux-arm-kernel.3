Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAF1C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 07:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL3YlGwC31Y8JENjif0rePlWfsMeeECArxgJS8HhxD4=; b=ct+Mo4cFp0Vm9Pglhnx2uROmZt
	zmJtlXC7pimME3W91N+9hhhSCclsPpXHxpOKySbl+rJD6cyZAkXtf9d+6x+FJRF5ppMLBD5jWa0iJ
	5IfefHvWCwLJTH/6q985p72FmKaY6lDKzMNje+s1HmWMgPXov2HuGoK/FZmrvOmlB2sWZV7cE0jly
	vkM2i2oOkN678u5ORaP/VMW1QLwYdqbb2DEJfH6yYhbfYWZXU2guLRtjf6rjr0Ci6ASnyUEgp8znT
	visdnVGRyuW4N1xS7NNSudB5F8LlE7jWJjfApGW1dnegHW5m3fCvQoGuPVYzQ50K3Qnx3vcwMLJjM
	M17sNN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdNVK-0000000CGKc-45eT;
	Sat, 27 Jun 2026 07:31:06 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdNVI-0000000CGJo-0gya
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 07:31:05 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so3136584a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1782545461; x=1783150261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QL3YlGwC31Y8JENjif0rePlWfsMeeECArxgJS8HhxD4=;
        b=Qz/JkyaxDaev+rguPn0eWJuOXcD+JT5m7AxPBOXtINIJNcwhnKqd+IaDMPqqkYOLux
         yMMhus7bJpb6MUYoSQS1nGL3U2/zUpeTBHpgOtZMpHgHhscNaKBbAf2ZO3vlm+/P96Pe
         AojrN0IGtjkyFAnuB6S3pNUaUYeXza72BaEBHwOcS/Ak6Peif1b6uzHzSsXCKRZDGsHc
         yKXe17rT3NSnFErGYjIZFVYxA1YwCzlazgJSuyvn2/6/Ooi5bfZA6qJYDntSYFQBtg9Y
         B9/+Spk8r1CCLkk8RuyQWFI1X2P/2J7DVsB81XG5tI+UFBEC+B3STXzY0v0XEMS/kB/1
         Lhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782545461; x=1783150261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QL3YlGwC31Y8JENjif0rePlWfsMeeECArxgJS8HhxD4=;
        b=HeHF5w/r/O9xju/l7Ey/jKQXBrya3ZUT1aVG6j231qzjWx39qoMan9qCp4YzbxxaGa
         sCRkJGe77lBhXIGHBhhkdRUfvod//KQDJLF8g8oZnNgyjSbiwWSBzo2cFrcpyK9+6M7W
         LnmYjefAcvLPgxLU98pcnmKWzvHfHTcdCpHbitGt3usgBesZ7jldtAOLGiiXuHu6DZwH
         6YMRZDjxT5k+EvLRNHAHaqfG5dwT/EGIxDwVZWWwPZ9vkruiDM/OOcmGeGjXI8eQdZ6k
         9YoI0SH8N9wzoIRWUdHfboOHwi6PQqD/3rc3jQeBOWumj/f/TFoqsYvyGsrmjjQhD3wH
         JeXA==
X-Forwarded-Encrypted: i=1; AHgh+RqjCl4pA3PXub0d2UlxEhLMEpujEFZV1tQv2I4IeAOEwVv0jZOci467BsiSkrygonqCx+fbS84zr4LEc0ceRsCL@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ8zwYVSjnlH7DWXSBG13tqDlpA8e3QDRohzVu97EGbVCHBXm6
	GYvjlUrz/XPVG6pkilVPToSe/Aed99rYMbimVpFvEJEZFmus8+VZDcnFU3fg5NMbZQ==
X-Gm-Gg: AfdE7clidbw1TVVt9hTSXpy01CBcVvUWi/ulaIy/Wrht6MOiqH+5UC49Ki3JFxLp32l
	fk+sY+LVvdd3NA9jPWklEnp4n7Uf4a1VMH2h6AaPi0jGNe/Stat8Y4P5D4LvFIxylsawTtiOPgA
	W6fHb+pkRrOd9dZhAGZSUJoTzsGc1bE0a1H91wgZELzDRCuZbrPwHNTs3ZY8y5Lc0dxOGb7ZSUr
	yYS+uZxQv7uq29s9gupX2dnojuSabMfyBktxi4zn5P9uurLyWKOBHDAHm0J463niyxYxmG9polt
	F8LdhyfNp5gMhdaddxCGQzL+oBfCkdZhWsvIQ+USssXXmOrMnudxE5L0EBxPwcee5huLzoEImzB
	U79Bc5XEroNieHzE8m1aXhUVsjCPMEW9DG2wxy90WRq37POfPIKvTTGn7Grd5E33XBIbnirn+RG
	tls4MQ0v6Vnh2ftRIdyKsW5/TS5pF+KpgagJ8x78BllKY/pdx3mqXUZGobmmfVECyUknWf4LMcE
	QQSKJ5m7ynRxMQvpp6o4nMODjjPL5QfZQsMk9delCjV5AVA4hbftwdgv2yNm0oT
X-Received: by 2002:a17:907:6d25:b0:c10:2eac:e839 with SMTP id a640c23a62f3a-c1233661842mr156084766b.39.1782545460756;
        Sat, 27 Jun 2026 00:31:00 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:79f9:b7dc:8cc2:bc28? (2a02-a466-4d7a-0-79f9-b7dc-8cc2-bc28.fixed6.kpn.net. [2a02:a466:4d7a:0:79f9:b7dc:8cc2:bc28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f47d5a35sm3896286a12.17.2026.06.27.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 00:30:59 -0700 (PDT)
Message-ID: <45e48dc7-1aa6-4214-8dcc-b3c562d61343@pardini.net>
Date: Sat, 27 Jun 2026 09:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
To: Daniele Briguglio <hello@superkali.me>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260624123914.1767374-1-hello@superkali.me>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260624123914.1767374-1-hello@superkali.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_003104_244328_3749A731 
X-CRM114-Status: GOOD (  17.53  )
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

On 24/06/2026 14:39, Daniele Briguglio wrote:
> No in-tree board references these gates yet. Boards drive the codec
> MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
> managed clocks, clk_disable_unused() turns them off at boot. On a board
> that relied on firmware leaving the output enabled, that cuts the MCLK
> and analog audio stops working.
> 
> Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
> state firmware left. A board that wants the kernel to own the gate can
> reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
> 
> Fixes: 02b9b0bb6269 ("clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO")
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Closes: https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com/
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Daniele Briguglio <hello@superkali.me>

I've reproduced the failure reported by Diederik on the NanoPC-T6-LTS 
(indirect I2S0_8CH_MCLKOUT) without this patch, then with this patch 
(which fixes it), and re-tested the R58X-Pro (out-of-tree explicit 
I2S0_8CH_MCLKOUT_TO_IO consumer); it all works for me now.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # on R58X-Pro+NanoPC-T6

Thanks,

-- Ricardo

> ---
>   drivers/clk/rockchip/clk-rk3588.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
> index 2ba9976654c..86953f9ffee 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -895,7 +895,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>   	MUX(I2S2_2CH_MCLKOUT, "i2s2_2ch_mclkout", i2s2_2ch_mclkout_p, CLK_SET_RATE_PARENT,
>   			RK3588_CLKSEL_CON(30), 2, 1, MFLAGS),
>   	GATE_GRF(I2S2_2CH_MCLKOUT_TO_IO, "i2s2_2ch_mclkout_to_io", "i2s2_2ch_mclkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
>   
>   	COMPOSITE(CLK_I2S3_2CH_SRC, "clk_i2s3_2ch_src", gpll_aupll_p, 0,
>   			RK3588_CLKSEL_CON(30), 8, 1, MFLAGS, 3, 5, DFLAGS,
> @@ -912,7 +912,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>   	MUX(I2S3_2CH_MCLKOUT, "i2s3_2ch_mclkout", i2s3_2ch_mclkout_p, CLK_SET_RATE_PARENT,
>   			RK3588_CLKSEL_CON(32), 2, 1, MFLAGS),
>   	GATE_GRF(I2S3_2CH_MCLKOUT_TO_IO, "i2s3_2ch_mclkout_to_io", "i2s3_2ch_mclkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
>   	GATE(PCLK_ACDCDIG, "pclk_acdcdig", "pclk_audio_root", 0,
>   			RK3588_CLKGATE_CON(7), 11, GFLAGS),
>   	GATE(HCLK_I2S0_8CH, "hclk_i2s0_8ch", "hclk_audio_root", 0,
> @@ -942,7 +942,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>   	MUX(I2S0_8CH_MCLKOUT, "i2s0_8ch_mclkout", i2s0_8ch_mclkout_p, CLK_SET_RATE_PARENT,
>   			RK3588_CLKSEL_CON(28), 2, 2, MFLAGS),
>   	GATE_GRF(I2S0_8CH_MCLKOUT_TO_IO, "i2s0_8ch_mclkout_to_io", "i2s0_8ch_mclkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
>   
>   	GATE(HCLK_PDM1, "hclk_pdm1", "hclk_audio_root", 0,
>   			RK3588_CLKGATE_CON(9), 6, GFLAGS),
> @@ -2229,7 +2229,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>   	MUX(I2S1_8CH_MCLKOUT, "i2s1_8ch_mclkout", i2s1_8ch_mclkout_p, CLK_SET_RATE_PARENT,
>   			RK3588_PMU_CLKSEL_CON(9), 2, 2, MFLAGS),
>   	GATE_GRF(I2S1_8CH_MCLKOUT_TO_IO, "i2s1_8ch_mclkout_to_io", "i2s1_8ch_mclkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
>   	GATE(PCLK_PMU1, "pclk_pmu1", "pclk_pmu0_root", CLK_IS_CRITICAL,
>   			RK3588_PMU_CLKGATE_CON(1), 0, GFLAGS),
>   	GATE(CLK_DDR_FAIL_SAFE, "clk_ddr_fail_safe", "clk_pmu0", CLK_IGNORE_UNUSED,
> 
> base-commit: 7edfb7fb58ee058298e18fde76a6077ef17d19d8


