Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595A8E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUb5xuTuYQHpC3cVU3eh5B+19cq4zd2piW0HbbFtwAo=; b=H+UhN5asnRAWUIjH8M4aIOZU8W
	ypJn1TU+52ru+Cl6FSoWCt/dWHqDCRVYMYiJ8nzLYkpqX2SugsVg24ddP4s2ZXlKp/V3a2ga6b95a
	Zn5ru5q3Ge1J2YDGPhFIEaKE4f4FRShnY+99pQxUw2XlkvOy5e/Oi9IQ/z3M0OO+qMvbku06jfpQI
	8aDHk1smH2SSkiH40BOgX+Og3QdanmkKxS2kZCjqk6baXr89iTZki5CbHeLpWU2BbZ8KNljk9EG/J
	xBmv+q9CwWGuIAkF68V+pchqhvV12CVH4EsaXY/Zr+C2JgNmVN6WAhw8TGb6GjhYJZQOfiRqghDpG
	qemIaiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMjhT-00000007bcx-0b4M;
	Sun, 15 Dec 2024 08:10:03 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMjgN-00000007bTN-18eG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 08:08:56 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1734250133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUb5xuTuYQHpC3cVU3eh5B+19cq4zd2piW0HbbFtwAo=;
	b=VQwcq5hcvGxLAtm/bOe0r7v+VbxFmms5LcWlEqTd4qYYmdRx0yNVCaJa4xxsOAo2ifn/l6
	Hk2Gd3kOpurSjjfzK46Zo1w/VnGvJdOLFEXY5l/+Gx+gkxVA4LKghcC/31KfVj75eQlh0i
	YjZWUX/HiE9ASnjgmXMU4MRqgFbgrtAmMJlSyHmvJ8urrPeZo3ocZewkvTlbmSnibz5WE1
	gKqyBzBvzKcfD8gBSyI3gqn+/LCLcZO5RA79RtbCazdp6n5aenuZYtzpDoqeyW0QQRvkvZ
	ikQ9ClfZUYibbStlY+Yxi31i1iYHs39Ksp3RiNBLfpl3U/W9Yo3AuSACe9BcFg==
Date: Sun, 15 Dec 2024 09:08:53 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek
 <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as
 TCON0 parent
In-Reply-To: <20241215053639.738890-4-anarsoul@gmail.com>
References: <20241215053639.738890-1-anarsoul@gmail.com>
 <20241215053639.738890-4-anarsoul@gmail.com>
Message-ID: <32683972639853c626d46fa4374d1558@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_000855_616835_E6E88228 
X-CRM114-Status: GOOD (  19.74  )
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

Hello Vasily,

On 2024-12-15 06:34, Vasily Khoruzhick wrote:
> Force selecting PLL-MIPI as TCON0 parent breaks video output on 
> Pinebook
> that uses RGB to eDP bridge.
> 
> TCON0 clock parent will be selected in the device tree instead.
> 
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in 
> TCON0 mux")
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Looking good to me, as a patch that completes the panel bugfix.
Thanks once again for the patches!

I'd suggest that the patch description is improved further a bit,
by incorporating some parts of the good description of the issue
that's already in the cover letter.  In particular, I'd suggest
that you describe that the patch partially reverts an earlier
commit, etc.

Additionally, I'd suggest that the comment block deleted below is
actually adjusted and copied to the addition to the A64 SoC dtsi,
which is performed in the first patch in your series.  That might
be of high value later.

With that addressed, please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> index 3a7d61c81667..cc8de0bfbc67 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -534,12 +534,6 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", 
> de_parents,
>  				 0x104, 0, 4, 24, 3, BIT(31),
>  				 CLK_SET_RATE_PARENT);
> 
> -/*
> - * DSI output seems to work only when PLL_MIPI selected. Set it and 
> prevent
> - * the mux from reparenting.
> - */
> -#define SUN50I_A64_TCON0_CLK_REG	0x118
> -
>  static const char * const tcon0_parents[] = { "pll-mipi", 
> "pll-video0-2x" };
>  static const u8 tcon0_table[] = { 0, 2, };
>  static SUNXI_CCU_MUX_TABLE_WITH_GATE_CLOSEST(tcon0_clk, "tcon0", 
> tcon0_parents,
> @@ -959,11 +953,6 @@ static int sun50i_a64_ccu_probe(struct
> platform_device *pdev)
> 
>  	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> 
> -	/* Set PLL MIPI as parent for TCON0 */
> -	val = readl(reg + SUN50I_A64_TCON0_CLK_REG);
> -	val &= ~GENMASK(26, 24);
> -	writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
> -
>  	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_desc);
>  	if (ret)
>  		return ret;

