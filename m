Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B411DD12676
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyGIcIP85izql5VivzAyfDSoQYWkeBRRivWAb6Rz/VY=; b=eMGOsmmQl65cqnn8gBedMQHCR/
	mBfS9EFvdrXUz7SRHPQDyDIH1S93TZRjJr6m4ZsALUEteRucTAFNRGVVhO0D3z9RpbHEjvVcT1GvU
	j0EZSTMq24vWB3OBILFIII1tVI8bMhZf+0qWynm4iBxSaVscYZwQdO96ts+PbhhTVtYES0FzMLcsC
	mPfra/bMvAOemCiaeHh7Ix1jKgI0ZX7DXKWDQUt6Dv6yvWgW2V8vZKaxNa3Dlc7dgpeGK7dzbCTDf
	0DUu9cvCCzUCQyKAI3IRnkv3VTcKJfXDeNpcpCyZps2EwoG+1r0psIUxano9IYF4PKv20ib/bkNus
	Mn6gkeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GPn-0000000GcJb-1hjo;
	Tue, 05 Nov 2024 10:03:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GLJ-0000000GbTq-0TZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:59:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43159c9f617so41417605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 01:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800759; x=1731405559; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fyGIcIP85izql5VivzAyfDSoQYWkeBRRivWAb6Rz/VY=;
        b=qywNlPkF23QfmNdG6LbHqbMH4smJZohzjRTGKleR8tfDLck4kWgitDm7if1OhyX+nE
         oAxjYPA49C/WSVxWnU3HOp1a4v3fUS5afUDc+3om1Y0nhsIz8pxcNQKZCxGUH35Am1mh
         AhwdzXS7jU6RY5ImF/au6a+DFh6Fwf2yYwLyBUhTXvjCTDLqo8ADBKSm941y5ioM84T5
         1jTOlVgz2LHXcHU1z5oNhY6DVrYeSU2McYZoP1p1vEu5H7v3sa50XZZQUt+xvh7wHqdC
         NOzMXEXyvXyFTXmIfOlhpSE8KZ03ppr2ml8v7B5egNnsKNWiv2Uw6AOO5JOGNmaYro4x
         nnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800759; x=1731405559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fyGIcIP85izql5VivzAyfDSoQYWkeBRRivWAb6Rz/VY=;
        b=Djd0cPP8PpxWKXxgojBGMY22AKNnkBAjYCGvjaUrtt9Z46zf6mpi3S04FnCLpBtzOA
         95j7aOiNlP1z/v8IFY2py7/bff6IjZSyCOFL9ya2/s21FNpKE9TSfUnNLdiDspvG4zLq
         /7AtgNOURTuE4taUr49LZ5MwzBSPyabX2WZcoxZs2M8xsslqjMt8OqjXXxk+HDp3qKts
         bn5KOVYOOUSiz4oe71jRQEL4JmeVEO+jCBkAKb8byfC0ZYknQ2Dx9Ym9ekmLpfumQ6ut
         TcsqKmzEvvIUgu41Mq/MkhxEis9Ma2uNS1J1hoWOvoaFqcVrfao/ReX2tx7scwHRpmhI
         h8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCULgzIAOmEXLy/rNHpaLr1wqBGA/ejirSZgssQt5HoOUbUYARvYAkAhdRC+GFiTFnslM7bYrM+Wp0IvdHejhb6z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+5B4vxlDEk1gj9Kdb/Pjnc54SLVlIxYk6JVzKBwe/LrE3HGPA
	gWGevv2qDcRQ8lKESQb0P9yQOc3N27w2Z87A0jK+prpqf2PcGmzJ1zmGXX3CnCA=
X-Google-Smtp-Source: AGHT+IFh1eUnSOgYeUPL8vbfgeu7KUTTM1nBaaDD9m2PgycfeAUV7I9FEe2TI7FKOJYLMdMaTY2lWw==
X-Received: by 2002:a05:600c:458f:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-4319ad047a7mr310993305e9.24.1730800759033;
        Tue, 05 Nov 2024 01:59:19 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab305sm182610885e9.7.2024.11.05.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:59:18 -0800 (PST)
Date: Tue, 5 Nov 2024 11:59:17 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH v3 2/5] clk: imx: fracn-gppll: correct PLL initialization
 flow
Message-ID: <ZynsdXx3McoW9SK5@linaro.org>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
 <20241027-imx-clk-v1-v3-2-89152574d1d7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241027-imx-clk-v1-v3-2-89152574d1d7@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_015921_180707_A9BB8EA6 
X-CRM114-Status: GOOD (  16.49  )
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

On 24-10-27 20:00:08, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per i.MX93 Reference Mannual 22.4 Initialization information
> 1. Program appropriate value of DIV[ODIV], DIV[RDIV] and DIV[MFI]
>    as per Integer mode.
> 2. Wait for 5 μs.
> 3. Program the following field in CTRL register.
>    Set CTRL[POWERUP] to 1'b1 to enable PLL block.
> 4. Poll PLL_STATUS[PLL_LOCK] register, and wait till PLL_STATUS[PLL_LOCK]
>    is 1'b1 and pll_lock output signal is 1'b1.
> 5. Set CTRL[CLKMUX_EN] to 1'b1 to enable PLL output clock.
> 
> So move the CLKMUX_EN operation after PLL locked.
> 
> Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
> Co-developed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index 591e0364ee5c113859a7b6271c8c11e98a0e0ffc..4749c3e0b7051cf53876664808aa28742f6861f7 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -303,13 +303,13 @@ static int clk_fracn_gppll_prepare(struct clk_hw *hw)
>  	val |= POWERUP_MASK;
>  	writel_relaxed(val, pll->base + PLL_CTRL);
>  
> -	val |= CLKMUX_EN;
> -	writel_relaxed(val, pll->base + PLL_CTRL);
> -
>  	ret = clk_fracn_gppll_wait_lock(pll);
>  	if (ret)
>  		return ret;
>  
> +	val |= CLKMUX_EN;
> +	writel_relaxed(val, pll->base + PLL_CTRL);
> +
>  	val &= ~CLKMUX_BYPASS;
>  	writel_relaxed(val, pll->base + PLL_CTRL);
>  
> 
> -- 
> 2.37.1
> 

