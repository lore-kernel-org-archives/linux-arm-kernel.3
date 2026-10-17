Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CC6CCF2CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9zss0HBxC2hnh3BG5QDi7k5785zMX75I0uTXgjx5mI=; b=0IRPbmvHk3o7DM99UyzzpsQ57a
	asDycTPItH9Jn1nV+TTV432a69DrNPEydTX27mvo3kt1DIWPOAFknxVpu08627Bi34wrJbaxIpZ40
	31fdiaOsJQbJJosE2qkP+UuvfvvYFDcC3OPcQOiVqYjnRStGUf6Zy/h04q47iOiDTwOP85ipUUgdt
	vfNZPYi3aCqmGf3kh2OkhyzYfWm4H9Enm9xgl6Aw8sePhGYGSwWtEMD1bMEpUW2Ytm1w0PIz/Rung
	9W/9/XVMe5Yb/JDni8B1KNfWrz/CY+cgiYEJtP5y+VQDaR1jBSk0BUrBMPRLbrKnGbZTwmvUUkxUx
	GWbnYmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5nN-00000004rMH-2URB;
	Sat, 17 Oct 2026 14:54:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5nI-00000004rLQ-3nn7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 14:53:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so4450885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792248835; x=1792853635; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p9zss0HBxC2hnh3BG5QDi7k5785zMX75I0uTXgjx5mI=;
        b=Yxth4B3tci18OIhWj0IpEeILbqpktofJNVGlRsXCxmY8TZ1xKsLnYDYjWwE1Zly9dr
         4xBERhNPoE8zd6+vTjImB3f7SMNSUUVgHOLV6iGgvA2G8qc4JjVbhYn5ylDvu3bH4fLm
         MKZ5ltBumSLe45cYWszofhcQxrupRh6NNr36lHFc0Mf5C4HT23uoLMv11gFzzSYj6uiE
         i5idyVvNcojiRhone9x1l9TvAd1cD0CbjPwCtxWUnoGsvYEzLGYMsczU21JVijncRvfD
         sIeZZpVikd0mlFQ5XHaSVWMiFVX54CcfUHPn1c62PukfkpOaHfceZGh3Jvg8gql8+I+x
         f8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248835; x=1792853635;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9zss0HBxC2hnh3BG5QDi7k5785zMX75I0uTXgjx5mI=;
        b=rpWL3R0xR7LUNc67R8aNZ9tlK1SGTSfN4ksHCaYJMF6pbp9G/VNnI1VaH+p+783m95
         VQCc7m5LlXQHOkzYddwb3WsQ/F2Z+ByVIsymNnK9X98f6ZXagP0gBSCxuRqJ0QqbkiPJ
         ksoO8SZxqHbL57L+LflVLD11WD3aEIch9T7ubMaN0ynAbcSmQFkmllkUcvrVBv6KQ5YL
         4I6rSCeYbDStmJMWqg/0Tx7ORJoXiHzyzF7BNoTntRYhetAjzqLqGEXeadStIGOGtAb9
         OIT8DNe362LMRoLrE//65mAzyPjus+28NJ1woIkA6N1CiKS8Eq20T+/rtvPmuaydLsU8
         Fzig==
X-Forwarded-Encrypted: i=1; AKwUvBytbE0p5zJyZf2ZOKvsrtAfBSzS+j3UthBEhCWbddsJEuTvV0cbiL1ipCq130E6fx61pXqqet6+TDbPDHt42SHY@lists.infradead.org
X-Gm-Message-State: AFq9FYIoBq+JjkmcevK92OV70nnFsmhI/uDaeFJpwkZI0L8wAHriZgCv
	t5b4fD0o8Kf7D48modbU/6gRhIONw5V5Ht3YaWMVBlt7Pbx/HKNAVuB3vs1/zjZahws=
X-Gm-Gg: AYBFou2r0e9cYMcfyBHXCU7R+AlhAE7/7v6bW54Vvml1bVB03KaErQBOWOZHm016T9A
	84OUxNQsZvYaSlbwKBtj3We2ZZNBNCUyi/mA6lmo/fj59ULmiUDmpdXphYRwi8579dje4IibBfK
	y7oPJQ4nZ2FjQKu66E48731NTsVtPXiv9iUKp+fBFH5VT/DnBO6G96UbLaC8HgwKxTbwK1UrFk7
	azaY/1dUmw9yfwU5BHgzzPEAT/eEePHATLAVd58VNz0F/j1dFIJnhyeZRt7tpjT08pTtDO6T9zv
	TKwSDTNX/tmDghZJ2+xAipjx4bmD5QU+aeTFMH49eQi2tZ0MrkgX6ufr7kkQUo3iM7rIJL6BAws
	wazpKS+GEs5xZRU5OWpN6Uz0sB/5gu7ql5YjgqbTu+9+k992D9pBBdjzkAfs7PlXqiro8DJ4oai
	9BzISVO88oYzkeeQZ6/nljcTSEButsfBW4Nhl4Trs/+x5r7mL3WzkEyCCrsOe1bjnT4l6qqcGWg
	skjF2yDX4l5equusg==
X-Received: by 2002:a05:600c:19ca:b0:4a1:ac66:5ffe with SMTP id 5b1f17b1804b1-4a1d75fce82mr60259805e9.15.1792248835113;
        Sat, 17 Oct 2026 07:53:55 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm11663833f8f.46.2026.10.17.07.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:53:53 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 03/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from
 DT when possible
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, stable@vger.kernel.org
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v10-3-47c97b54a809@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v10-3-47c97b54a809@bootlin.com>
Date: Sat, 17 Oct 2026 16:53:42 +0200
Message-Id: <179224882241.859276.15035084302735586039.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4123; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=14/hMLHV/tYtznG0hyhpzTapCNH3vt/FqyYM36Xqhsw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXexhiw+4KLE5n8ZwffqTXfGbaLNNtyasLfJ8e/iCm3
 CLy7tCfjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzErpWR4Sdf0fTfq1xm7zgu
 fv93xOVbXPPn+r/I3S6oeFzkuOUXhThGhgMHEnaejKt438ISlZTPdOvAkmXKVzS2fls294zl9io
 tcx4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_075357_080894_2086A4C2 
X-CRM114-Status: GOOD (  31.34  )
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

> HXT and LXT are crystal oscillator inputs of the clock controller. As
> such, they are external clock sources which should not be registered by
> this driver.
> 
> HXT is already described in the DT, but is not named. In order to point
> to this parent from its direct child which is HXT_GATE, we must provide
> a fw_name (when it is named, new DTs) and a .name (for when it's not
> named, but the fixed clock node name is used).
> 
> LXT is missing in old DTs, so we must create that clock and register it
> for backward compatibility reasons. It should however be described and
> pointed at in updated DTs.
> 
> Both HXT and LXT are exposed by this driver only in the backward
> compatibility case. Otherwise, both clocks are expected to be retrieved
> from the DT.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1.c | 44 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
> index 00d635cdb604..33b397d7b7c5 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -65,6 +65,14 @@ static DEFINE_SPINLOCK(ma35d1_lock);
>  
>  #define MA35D1_MUX_MAX_PARENTS	10
>  
> +static const struct clk_parent_data hxtg_parent_data[] = {
> +	{ .fw_name = "hxt", .name = "clk_hxt" },
> +};
> +
> +static const struct clk_parent_data lxtg_parent_data[] = {
> +	{ .fw_name = "lxt", .name = "lxt" },
> +};
> +
>  /* Mux parent selection, by index into the controller's clock table */
>  static const int ca35clk_parent_idx[] = { HXT, CAPLL, DDRPLL };
>  static const int sysclk0_parent_idx[] = { EPLL_DIV2, SYSPLL };
> @@ -191,6 +199,15 @@ static struct clk_hw *ma35d1_clk_gate(struct device *dev, const char *name, cons
>  				    reg, shift, 0, &ma35d1_lock);
>  }
>  
> +static struct clk_hw *ma35d1_clk_gate_parent_data(struct device *dev, const char *name,
> +						  const struct clk_parent_data *parent_data,
> +						  void __iomem *reg, u8 shift)
> +{
> +	return devm_clk_hw_register_gate_parent_data(dev, name, parent_data,
> +						     CLK_SET_RATE_PARENT,
> +						     reg, shift, 0, &ma35d1_lock);
> +}
> +
>  static int ma35d1_get_pll_setting(struct device_node *clk_node, u32 *pllmode)
>  {
>  	const char *of_str;
> @@ -219,7 +236,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  	static struct clk_hw **hws;
>  	static struct clk_hw_onecell_data *ma35d1_hw_data;
>  	u32 pllmode[PLL_MAX_NUM];
> -	int ret;
> +	int ret, num_clks;
>  
>  	ma35d1_hw_data = devm_kzalloc(dev,
>  				      struct_size(ma35d1_hw_data, hws, MA35D1_CLK_COUNT),
> @@ -240,12 +257,25 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
> -	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
> -					clk_base + REG_CLK_PWRCTL, 0);
> -	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
> -	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
> -					clk_base + REG_CLK_PWRCTL, 1);
> +	num_clks = of_clk_get_parent_count(clk_node);
> +	if (num_clks < 1 || num_clks > 2)
> +		return -EINVAL;
> +
> +	/*
> +	 * Old DTs do not describe the low-speed crystal. They may also expect
> +	 * an HXT output from this driver. In practice, nobody should use these
> +	 * clocks directly, but they must be kept for backward compatility
> +	 * purposes.
> +	 */
> +	if (num_clks == 1) {
> +		hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
> +		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
> +	}

The above is fine but the problem is those IDs still exist and something like
<&clk HXT> is still valid in DT but now does not provide a clock anymore.

This is why I asked if you about removing the ID. At the very least a comment is
needed next to the IDs saying those are obsolete and should not be used.

-- 
Jerome


