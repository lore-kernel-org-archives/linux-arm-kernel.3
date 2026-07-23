Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A798FC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nke0i/JTdEBAOMHCaZMWt/DlDNqZ5T/UfW4FQxOno1Y=; b=ddV8MQBKqFPQtyGz4NYPP0cOVK
	DbvP7i5tYYOAuuXymLpckS5xe1GmAEv+OPQMNsx62Bfs75MJ7pKZ7n2+/LaSR7zf+m1q80zD0EB2x
	feBHX8f99auQKpkJwmORZuE1AoJI3GnQFiy59KB2Z/xl+K+ukMGNVIRTGigNeE8zBVISdXUngNQFl
	JU2RME7lMwhWnMa5uETt2nlxCyB/wAKG7JkpuKEdbDWxRPIGiSOB7JyT0vb58lLP16tH1PWPQd/CJ
	ta6VtPswzIGlefLIMBO/ZPWPSScGB99Afy+JjZ29U48g3iXgDOuDGpHo6sJW4d3o9uiK/g8FT2VFV
	gLyIZfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqkx-0000000E2SA-0RhM;
	Thu, 23 Jul 2026 10:34:23 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqkt-0000000E2RF-3oM8;
	Thu, 23 Jul 2026 10:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1784802779;
	bh=Nke0i/JTdEBAOMHCaZMWt/DlDNqZ5T/UfW4FQxOno1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OKK/gmz5qO781aV4d4CF+XxMd7pYOzGAHxL1e5IwORhvX082bpWefEGzO5LefhAmp
	 Uq+tkQoQo1Z8qmYWGGVoQyPN03eN0kUsR4c+0Gm5sIR5q30W31DcRJv6msgZOAlr2h
	 2ZV2JxUjJLHsAPcBBMUMh9Tx9W3RRdmU2JUg7lKs=
X-QQ-mid: zesmtpsz2t1784802770t35b5fb83
X-QQ-Originating-IP: b5Uv8wOMovQ+QXu/2dOXjuxoCPnrNY23T+SUkFndhfU=
Received: from [172.16.12.90] ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jul 2026 18:32:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4791706803425340570
Message-ID: <5676B227B50EB88B+ff62bc9e-5175-481a-93f8-c1de7f68eba2@airkyi.com>
Date: Thu, 23 Jul 2026 18:32:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: rockchip: pll: Fix the fractional part
 denominator on RK3588/RK3576
To: Alexey Charkov <alchark@flipper.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>,
 Wyon Bi <bivvy.bi@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
 <20260723-rk3588-fracpll-v2-1-3adfb9dda235@flipper.net>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20260723-rk3588-fracpll-v2-1-3adfb9dda235@flipper.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NUTz4BkILuKLWQdF8Ih4DDdpmPCE9YOxMXVLUnt4kb1B9ehuURJChAx9
	0jgZ3imd0jaQGP8g1r2KblgUYlT0LmKg6Gp0Iy7x4kB7xfWraZL+JBSATIK9gR+x6mzc1Km
	AVap/VJcjCf9hQyA3qez/Xh8/w2y1pNQCStX2vJI0uJIxY1sIfnZ2LtnqSL9VyM5K50/S0j
	NXtlsFleUxNA4oVH3XwQIZtcdV8u/ysjtWc8zEZDg9xiz2ezDty9tb7Gd5ul0VvdcHALmeg
	+0o4+e0A2KwloEp2QLDiN60xra9ueQI/wODMH9+yizJp1E85gGov0z0xt2cPItvePpjyQwo
	roECCDdBnEEjgcPCqrVnIDASGKk3QbQh/nHeNumfY50P45f2uftyQa5ezzmX+NwU7hYHy7W
	ZlBbgGWd/xNlxLgtqo0hErn89/hayfBhhyz/yHl41mpo7tBFqHu+yoz5rIYE4RpKlMI0ayY
	BmTbr83Y4dV8y+B7ZPpwcRfQdD25Z84ehvE34pLGES9MO1NFobnJz7PnqyZKZJHTGxaegyQ
	rpqJN1u58oDbrTg0HywNP4whtCcDOAuzpAi9KIz5taT7pJbbxqGcMcwP+0smEDm9yDYsvt5
	pFkYMEfFJbkusx3wmaczcoadEPIAdpDEZQ+qp/nkqOoKopNzVbTyFt16I6P6x/1N0bIHvxv
	d7ZSSuM9wVQQly/1hN7JJVi7Lc/08okU77iFOuDUqRwV65Kszx3hjdUFgk9jvrBz5xAkmVD
	PyLeDbl6x+XpPMy7o3xD59GAlX5HY9fwZxJyCyH4FqEe1ucuZTCf2kq/C3vdMlRW9h3e1xF
	tHFZ5TR3kTwDNXbq8uiShDiF7fFaP6Sn1NwtUkEJ/uePvGto/ev0sY0JicqdOFLGUy93BCa
	f0FU9rjkAXZYzKPlankb7I2YK/0HFc99lznQjBfp5t5C064U7cT9hcq5q0dXPgTRJ4iAbPb
	CtAd97TyEzV7BuKgk9D+/xjl48vYb73g7uG/jYLAkcyzkq1V8/Bc31jFK
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_033420_343278_A8BAB529 
X-CRM114-Status: GOOD (  20.90  )
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

Hello Alexey,

On 7/23/2026 6:21 PM, Alexey Charkov wrote:
> According to the TRM, the fractional PLL coefficient should be divided by
> 65536 rather than 65535 to obtain the output rate.
> 
> Fix the denominator and add a comment with the TRM provided clock formulae
> for future reference.
> 
> See RK3576 TRM Part 1 V1.2 section 2.13.1.4 Setting Guide on P, M, S and K
> or equivalently RK3588 TRM part 1 V1.0 section 2.17.1.4 Setting Guide on P,
> M, S and K.
> 
> Fractional PLL rates don't seem to be used by any current mainline
> consumers, so this is purely a correctness fix. It will also be important
> to properly support DisplayPort output going forward, as the video output
> controller derives its pixel clock from system PLLs with no dedicated PHY
> PLL option for DP unlike HDMI, and some display modes are only achievable
> with fractional PLL rates.
> 
> Fixes: 8f6594494b1c ("clk: rockchip: add pll type for RK3588")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/clk/rockchip/clk-pll.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
> index 6b853800cb6b..bf8acf7cee0d 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -900,6 +900,13 @@ static void rockchip_rk3588_pll_get_params(struct rockchip_clk_pll *pll,
>  	rate->k = ((pllcon >> RK3588_PLLCON2_K_SHIFT) & RK3588_PLLCON2_K_MASK);
>  }
>  
> +/*
> + * 2250 MHz <= Fvco <= 4500 MHz
> + * For Fvco > 3 GHz: period jitter +-1% frac PLL, +-0.75% int PLL
> + * For Fvco < 3 GHz: period jitter +-2% frac PLL, +-1.50% int PLL
> + * Fvco = ((m + k / 65536) * Fin) / p
> + * Fout = ((m + k / 65536) * Fin) / (p * 2^s)
> + */
>  static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
>  {
>  	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
> @@ -915,7 +922,7 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
>  		/* fractional mode */
>  		u64 frac_rate64 = prate * cur.k;
>  
> -		postdiv = cur.p * 65535;
> +		postdiv = cur.p * 65536;


How about using 65536ULL? Will the multiplication here overflow?

>  		do_div(frac_rate64, postdiv);
>  		rate64 += frac_rate64;
>  	}
> 

-- 
Best, 
Chaoyi



