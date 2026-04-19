Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10989EA71AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 22:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6gX7EdaBOGbDKyKiMzgyWhMltnLtRwmWqrkmLqntNk=; b=ot0BzaO9HD9NtEkOAc4CqgarAj
	rJ89Ec57QfT7ROEAIevQHwSu5+wYAScWwbes9gt26uVHOjUZhHoyBya1prhYsKTxEBrDmdHjr9xxW
	KsRX0DCH2tADZOkAGSy/EZId1WwhHTif28hQD0P8FyVUyvq6H1fuVzyS7W7y+Db2NOYkpVQx2PjGX
	yfuw/MnCzVSX9dk78kzIZxO0OP/oLaloSszGXHADUmxWd4WkGIIcLhvU2SR25Zb7e+bbni6gVCQgt
	dFsC1MgMbpHubvdRs4AyKo9l72r1dtQPvYXp5fY4l75zKqUO52wBVkn0yd7iO0JqnHWPdCI4YpzQF
	GQMZ8v1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEann-000000068PN-06Dv;
	Sun, 19 Apr 2026 22:39:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEank-000000068P1-0KY1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 22:39:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5D41596;
	Sun, 19 Apr 2026 15:39:32 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC21E3F915;
	Sun, 19 Apr 2026 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776638377; bh=tZlc1dVMVc8vW4uGAZJcag9m8q5W1bX9AFx/oA9k8L4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vQOe0g74c2CHoG+BqnFikOOPTwz5LN8/h4X9uqXxxx4gkMhyECe18zAQdmSfTH74n
	 uI5EnqqpsQC4i9/+aDRnIVHXvuYOM30EMA+i2oYbfPR91IBsoDS6jdN5p5qstFI2Ps
	 /3I0ugo8Lmyv8onj/Mo6uJGHzHE/up1DKDXRBnxY=
Date: Mon, 20 Apr 2026 00:39:15 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/4] clocksource/drivers/sun5i: add H616 hstimer support
Message-ID: <20260420003915.18c0d5f7@ryzen.lan>
In-Reply-To: <20260419-h616-t113s-hstimer-v1-2-1af74ebef7c5@mmpsystems.pl>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
	<20260419-h616-t113s-hstimer-v1-2-1af74ebef7c5@mmpsystems.pl>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_153940_281361_5C517FBD 
X-CRM114-Status: GOOD (  23.80  )
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

On Sun, 19 Apr 2026 14:46:08 +0200
Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

Hi,

> H616 high speed timer differs from existing timer-sun5i by register base
> offset.
> 
> Add selectable register layout structures.
> Add H616 compatible string to OF match table.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  drivers/clocksource/timer-sun5i.c | 56 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
> index f827d3f98f60..125abc11c3c3 100644
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -21,18 +21,52 @@
>  #define TIMER_IRQ_EN_REG		0x00
>  #define TIMER_IRQ_EN(val)			BIT(val)
>  #define TIMER_IRQ_ST_REG		0x04
> -#define TIMER_CTL_REG(val)		(0x20 * (val) + 0x10)
>  #define TIMER_CTL_ENABLE			BIT(0)
>  #define TIMER_CTL_RELOAD			BIT(1)
> -#define TIMER_CTL_CLK_PRES(val)			(((val) & 0x7) << 4)
>  #define TIMER_CTL_ONESHOT			BIT(7)
> -#define TIMER_INTVAL_LO_REG(val)	(0x20 * (val) + 0x14)
> -#define TIMER_INTVAL_HI_REG(val)	(0x20 * (val) + 0x18)
> -#define TIMER_CNTVAL_LO_REG(val)	(0x20 * (val) + 0x1c)
> -#define TIMER_CNTVAL_HI_REG(val)	(0x20 * (val) + 0x20)
> +#define TIMER_CTL_CLK_PRES(val)		(((val) & 0x7) << 4)
> +#define TIMER_CTL_REG(val)		\
> +	(soc_base->stride * (val) + soc_base->ctl_base)
> +#define TIMER_INTVAL_LO_REG(val)	\
> +	(soc_base->stride * (val) + soc_base->intval_lo_base)
> +#define TIMER_INTVAL_HI_REG(val)	\
> +	(soc_base->stride * (val) + soc_base->intval_hi_base)
> +#define TIMER_CNTVAL_LO_REG(val)	\
> +	(soc_base->stride * (val) + soc_base->cntval_lo_base)
> +#define TIMER_CNTVAL_HI_REG(val)	\
> +	(soc_base->stride * (val) + soc_base->cntval_hi_base)
>  
>  #define TIMER_SYNC_TICKS	3
>  
> +struct sunxi_timer_base {
> +	u32 ctl_base;
> +	u32 intval_lo_base;
> +	u32 intval_hi_base;
> +	u32 cntval_lo_base;
> +	u32 cntval_hi_base;
> +	u32 stride;
> +};
> +
> +static const struct sunxi_timer_base sun5i_base = {
> +	.ctl_base = 0x10,
> +	.intval_lo_base = 0x14,
> +	.intval_hi_base = 0x18,
> +	.cntval_lo_base = 0x1c,
> +	.cntval_hi_base = 0x20,

Mmmh, why all these members? Aren't those all the same, just offset by
0x10? So we just need a single value reg_offs, being either 0x0 or 0x10?

> +	.stride = 0x20

What it this about? It's the same stride for both versions, so why is
this a field?

> +};
> +
> +static const struct sunxi_timer_base sun50i_base = {
> +	.ctl_base = 0x20,
> +	.intval_lo_base = 0x24,
> +	.intval_hi_base = 0x28,
> +	.cntval_lo_base = 0x2c,
> +	.cntval_hi_base = 0x30,
> +	.stride = 0x20
> +};
> +
> +static const struct sunxi_timer_base *soc_base;

This doesn't look right. Differentiating between slightly different
hardware revision via the compatible string is a common pattern, look
at for instance drivers/media/rc/sunxi-cir.c and its usage of quirks for
an example how to handle this more nicely.

Cheers,
Andre

> +
>  struct sun5i_timer {
>  	void __iomem		*base;
>  	struct clk		*clk;
> @@ -238,6 +272,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
>  static int sun5i_timer_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev_of_node(&pdev->dev);
>  	struct sun5i_timer *st;
>  	struct reset_control *rstc;
>  	void __iomem *timer_base;
> @@ -251,6 +286,14 @@ static int sun5i_timer_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, st);
>  
> +	if (!node)
> +		return -EINVAL;
> +
> +	if (of_device_is_compatible(node, "allwinner,sun50i-h616-hstimer"))
> +		soc_base = &sun50i_base;
> +	else
> +		soc_base = &sun5i_base;
> +
>  	timer_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(timer_base)) {
>  		dev_err(dev, "Can't map registers\n");
> @@ -314,6 +357,7 @@ static void sun5i_timer_remove(struct platform_device *pdev)
>  static const struct of_device_id sun5i_timer_of_match[] = {
>  	{ .compatible = "allwinner,sun5i-a13-hstimer" },
>  	{ .compatible = "allwinner,sun7i-a20-hstimer" },
> +	{ .compatible = "allwinner,sun50i-h616-hstimer" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, sun5i_timer_of_match);
> 


