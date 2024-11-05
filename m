Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11E2D12671
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6h/R7lfM4qCrCDmado2Rkx+M46kJFIDRE2I4JWaZEQ=; b=APPV9VYQnWE1Ib+iiK95oCxwiG
	AdZpFwSo7mjqh2K9yl7yWT8e1E8CBGNEHn3Fdrc/MDUrWSb42elFtesjNYEbaQHPcG/ExEHAbjD/x
	2jDQLNbV+h7W+GoohwkTugZrIaDPSRo9QOYOjNsbM0g6O5mfvHu8koZ84M69hHhGYqaWjhMNKwhf5
	9HIPgiRhiD11yKqDTKnhqVKqPgtRvM2DrDxJ8dicuME0K0i1VB3swRZo9QNqJZu+OE5uimmqRwWXm
	kofHxYbFPH2PSjJ8oAjyLccIVrwXy0IMoExCVkh0vKdW4GHJf1TE77C5MX38uQraRnGs9YHjKcBYG
	0B/9goJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GO8-0000000Gc2v-0O0z;
	Tue, 05 Nov 2024 10:02:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GKw-0000000GbNT-1Vj4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:59:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4314b316495so44780365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 01:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800736; x=1731405536; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6h/R7lfM4qCrCDmado2Rkx+M46kJFIDRE2I4JWaZEQ=;
        b=Y4Ggl4LSkcrIuqe3NxP0zdgmPIZLKoRm/YXlgllw9NKCtHjswtQgJjPR5Htor2V+H3
         jj1YDKaCghh4+EG3CcZBjPkeMtPH5YwAqlBEMejb53ssNaFm1VS+1sMF9AA+KuPsRC2Y
         KuOU2N6w7GEOGewug8GTnK5fFFkHxiaDASmifnJUWHhqRijHMcbIcB8qDfeS850oFiuA
         oNi7rbbRcYKM3sCsUzdm0b4N8BaUI2Iq9A50WBShRNcs8cQsYeKhUQeIoCRwHr16cxPN
         EOFcGqRkrOKrrJB8qHZjeYn7aR6TatFpLYT04Jl5BTKE6qNV447LWpXHvptK/Y4Ic9s3
         xtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800736; x=1731405536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6h/R7lfM4qCrCDmado2Rkx+M46kJFIDRE2I4JWaZEQ=;
        b=xH0TjmiHPG1phrfaKAryPLw3aV4XMixsZ0lr+O/cxE/ppLz0DEpP/tZ8blx12ZXJuZ
         TgOxw3j7Y4Cvf1py2Rh5tlhtFCLscOj8/8Cl7n4dhdMiyTmJUIeBpqNKgwP6dIUzhjZg
         ugbIw+Ltj2e36ArSkGgTLDwQgMFNscFwVrAkQbShFddrzCHSW5Vymx2jFlDdhRwaqgrR
         mMpA28L6fLJI/0bG23wJF69XVXBedbu+nSY/ZgdJ6r9w2XObvQdeYGQYrLtxPRefcDrq
         z+WqeqQEdA45EYVpdDYFrPkIvzkdvIkemquYnIpEGHAtMz6lJzq7G3krWfkpMfNAbghi
         6jKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4nYOjewYgfdg5cnrpGOhHgXNcqtZ7fqhiunhqpvRSiro7ilRudrnXcB53lNXPStPM8+bywNQXDD8qOtP1PRkw@lists.infradead.org
X-Gm-Message-State: AOJu0YxywzS+ntevaRvhIureD0PAjDyh2JfifdtrPkQAdkA956xxIT5F
	CqBTj79a1z9PhRsJSSHzBDdxVcNzzxBtLtUzTdZq/nFI2+QT90EXzXTFieTZ8j8=
X-Google-Smtp-Source: AGHT+IENI/tO1m+wxDQs0DVE4GgW4Nt88abEszTQqX11x4d9wmMLAMDwYiShM/iz+S/e697/IpvpqA==
X-Received: by 2002:a05:600c:3112:b0:431:5d4c:5eff with SMTP id 5b1f17b1804b1-4327b6f46bdmr163702085e9.2.1730800736173;
        Tue, 05 Nov 2024 01:58:56 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4d1fsm15533035f8f.38.2024.11.05.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:58:55 -0800 (PST)
Date: Tue, 5 Nov 2024 11:58:54 +0200
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
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/5] clk: imx: lpcg-scu: SW workaround for errata
 (e10858)
Message-ID: <ZynsXhzcoyfCzLwq@linaro.org>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
 <20241027-imx-clk-v1-v3-1-89152574d1d7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027-imx-clk-v1-v3-1-89152574d1d7@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_015858_444443_D9FA03FC 
X-CRM114-Status: GOOD (  26.70  )
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

On 24-10-27 20:00:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Back-to-back LPCG writes can be ignored by the LPCG register due to
> a HW bug. The writes need to be separated by at least 4 cycles of
> the gated clock. See https://www.nxp.com.cn/docs/en/errata/IMX8_1N94W.pdf
> 
> The workaround is implemented as follows:
> 1. For clocks running greater than or equal to 24MHz, a read
> followed by the write will provide sufficient delay.
> 2. For clocks running below 24MHz, add a delay of 4 clock cylces
> after the write to the LPCG register.
> 
> Fixes: 2f77296d3df9 ("clk: imx: add lpcg clock support")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-lpcg-scu.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
> index dd5abd09f3e206a5073767561b517d5b3320b28c..620afdf8dc03e9564bb074ca879cf778f7fc6419 100644
> --- a/drivers/clk/imx/clk-lpcg-scu.c
> +++ b/drivers/clk/imx/clk-lpcg-scu.c
> @@ -6,10 +6,12 @@
>  
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/units.h>
>  
>  #include "clk-scu.h"
>  
> @@ -41,6 +43,29 @@ struct clk_lpcg_scu {
>  
>  #define to_clk_lpcg_scu(_hw) container_of(_hw, struct clk_lpcg_scu, hw)
>  
> +/* e10858 -LPCG clock gating register synchronization errata */
> +static void lpcg_e10858_writel(unsigned long rate, void __iomem *reg, u32 val)
> +{
> +	writel(val, reg);
> +
> +	if (rate >= 24 * HZ_PER_MHZ || rate == 0) {
> +		/*
> +		 * The time taken to access the LPCG registers from the AP core
> +		 * through the interconnect is longer than the minimum delay
> +		 * of 4 clock cycles required by the errata.
> +		 * Adding a readl will provide sufficient delay to prevent
> +		 * back-to-back writes.
> +		 */
> +		readl(reg);
> +	} else {
> +		/*
> +		 * For clocks running below 24MHz, wait a minimum of
> +		 * 4 clock cycles.
> +		 */
> +		ndelay(4 * (DIV_ROUND_UP(1000 * HZ_PER_MHZ, rate)));
> +	}
> +}
> +
>  static int clk_lpcg_scu_enable(struct clk_hw *hw)
>  {
>  	struct clk_lpcg_scu *clk = to_clk_lpcg_scu(hw);
> @@ -57,7 +82,8 @@ static int clk_lpcg_scu_enable(struct clk_hw *hw)
>  		val |= CLK_GATE_SCU_LPCG_HW_SEL;
>  
>  	reg |= val << clk->bit_idx;
> -	writel(reg, clk->reg);
> +
> +	lpcg_e10858_writel(clk_hw_get_rate(hw), clk->reg, reg);
>  
>  	spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
>  
> @@ -74,7 +100,7 @@ static void clk_lpcg_scu_disable(struct clk_hw *hw)
>  
>  	reg = readl_relaxed(clk->reg);
>  	reg &= ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
> -	writel(reg, clk->reg);
> +	lpcg_e10858_writel(clk_hw_get_rate(hw), clk->reg, reg);
>  
>  	spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
>  }
> @@ -145,13 +171,8 @@ static int __maybe_unused imx_clk_lpcg_scu_resume(struct device *dev)
>  {
>  	struct clk_lpcg_scu *clk = dev_get_drvdata(dev);
>  
> -	/*
> -	 * FIXME: Sometimes writes don't work unless the CPU issues
> -	 * them twice
> -	 */
> -
> -	writel(clk->state, clk->reg);
>  	writel(clk->state, clk->reg);
> +	lpcg_e10858_writel(0, clk->reg, clk->state);
>  	dev_dbg(dev, "restore lpcg state 0x%x\n", clk->state);
>  
>  	return 0;
> 
> -- 
> 2.37.1
> 

