Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A25D5CCAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYJ2OipNoBnFwOP3LNBLkcGzdQ6qXhlOYIHMDrZlPq0=; b=1QZDe8C2JJtUcVu7d90BX+Oaig
	ZM3WxGXy5wg6AfNaByClUw0n7AyGDvXGuZYwGFgGQ/p01cVk73YXilJJ9wmSUF3UgWoC8B5gjbXUq
	O78U8/7epA+1ysnX4EyocKmAq4ymG7YM1KGxSCwndTPl9NqUqmXkQmAu2Tx3rr62xWDi7eMSu80Wt
	AylIuEBWYQOcfgZn/yaxMVJBR+is3wYidkzaHMT1/Jc0eIxJYQW/aaF4lAuLSo/elZaxfNpG3A3Wq
	5kY237GrALo4rPhdLWAjChI/UcMeIP9PZmPS4+3GoWF4Px3QhKHex4MTFYsh3rKvLbzocsqnfuC9+
	a9xvbWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6U2Y-00000003Ue6-0Or0;
	Thu, 31 Oct 2024 12:12:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Tz7-00000003UFZ-1nvJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:09:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3A821063;
	Thu, 31 Oct 2024 05:09:33 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8228B3F66E;
	Thu, 31 Oct 2024 05:09:00 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:08:57 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Conor
 Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, Parthiban
 <parthiban@linumiz.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/13] clk: sunxi-ng: a100: enable MMC clock
 reparenting
Message-ID: <20241031120857.60bc0d94@donnerap.manchester.arm.com>
In-Reply-To: <20241031070232.1793078-9-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
	<20241031070232.1793078-9-masterr3c0rd@epochal.quest>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_050905_589208_6EFF64C7 
X-CRM114-Status: GOOD (  24.82  )
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

On Thu, 31 Oct 2024 04:02:21 -0300
Cody Eksal <masterr3c0rd@epochal.quest> wrote:

> During testing, it was noted that MMC would fail to initialize, with
> "mmc: fatal err update clk timeout" being printed in the log. It was
> found that CLK_SET_RATE_NO_REPARENT was set on the MMC controllers, and
> that removing this allows MMC to initialize. Therefore, remove
> CLK_SET_RATE_NO_REPARENT from mmc0/1/2.

Well, while this change indeed prevented that error message you mentioned,
but the SD card still doesn't work for me: it probes and I can mount a
filesystem on it, but then it hangs, for instance when running an "ls" on
it. It could be my setup (lacking DT or device issue or missing kernel
config), though, and the eMMC works for me this way, but it would be good
to have that sorted. 

Also it would be good to know why CLK_SET_RATE_NO_REPARENT was put there
in the first place: I don't see it in any other MMC clocks in sunxi-ng, so
it wasn't just copied&pasted.
So was there a problem that this flag was supposed to fix? Is that
something that only applied to older kernels (back when the MMC patches
were first posted), and which has now been fixed/changed elsewhere?

I feel a bit uneasy of just removing this just because it works(TM),
especially if it doesn't really (SD card for me, for instance).

Cheers,
Andre

> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a100.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c b/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
> index bbaa82978716..a59e420b195d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
> @@ -436,7 +436,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc0_clk, "mmc0", mmc_parents, 0x830,
>  					  24, 2,	/* mux */
>  					  BIT(31),	/* gate */
>  					  2,		/* post-div */
> -					  CLK_SET_RATE_NO_REPARENT);
> +					  0);
>  
>  static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1", mmc_parents, 0x834,
>  					  0, 4,		/* M */
> @@ -444,7 +444,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1", mmc_parents, 0x834,
>  					  24, 2,	/* mux */
>  					  BIT(31),	/* gate */
>  					  2,		/* post-div */
> -					  CLK_SET_RATE_NO_REPARENT);
> +					  0);
>  
>  static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc2_clk, "mmc2", mmc_parents, 0x838,
>  					  0, 4,		/* M */
> @@ -452,7 +452,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc2_clk, "mmc2", mmc_parents, 0x838,
>  					  24, 2,	/* mux */
>  					  BIT(31),	/* gate */
>  					  2,		/* post-div */
> -					  CLK_SET_RATE_NO_REPARENT);
> +					  0);
>  
>  static SUNXI_CCU_GATE(bus_mmc0_clk, "bus-mmc0", "ahb3", 0x84c, BIT(0), 0);
>  static SUNXI_CCU_GATE(bus_mmc1_clk, "bus-mmc1", "ahb3", 0x84c, BIT(1), 0);


