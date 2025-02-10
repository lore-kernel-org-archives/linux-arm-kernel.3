Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A797C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3la8iFDfZYzWG8Aghm+gIpWTihlMsOBNzxlxGjD3w+U=; b=2f2rfghDX2b3Vd+7LBuvZX9xwA
	gAdb+KtcxTusyd98fYSLwHF9XStAZ6pxU9rr83gBZq/ytnMIwEm4g/6oo73xng8pqQwkjq/+kpbo7
	h1R3u6flnKUoH2L5EuEdQvKdDe34OgPjJ4fBZ50ZODQ4dQFvuI/6LRhhG4/7JNk4jXrhtl9fgNW2p
	5SOBfy3JfMjDKyBKgj/SqiUOFzLjEyyNuxt97FHOtCSg/nnuAKrL93vbrlhVM6tovr0+AkOwa4Mdm
	Db2heIfz2LC8umzvvNaL06XM0nyUZD7sS6dV/l3s0MUC8EKpaRSaCwfOf/bOVqStttmaSV36Xnl/4
	uKNSymbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXqn-00000000mCX-0gwc;
	Mon, 10 Feb 2025 17:45:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXXB-00000000iLG-1Ngk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 17:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3la8iFDfZYzWG8Aghm+gIpWTihlMsOBNzxlxGjD3w+U=; b=gxsoE0trbEufepeq0nRYJUz4Qt
	hhdZOzGPBRKbOP0YXLOxlJma54dfOJ306NuUj8gEy4cko6Sd7CNvwtFLfMYdOZpHHu/sD4UHL9ZG8
	Fs2jfze/P1YrEU/aafxOfHpa1OrNjVXR+2sYViLgeuhmJ7nUl/MWPQyYV5Drp6IyUuGa/HR8ZB9Vq
	INIpwBzlsfb14voyTohkJmpFhZReePWkYf8R7WMulgo4j+Xno6n44/tJZP2N+oJ7k7k3oQv3pgwpC
	l6zNwM7p/oW7YK1blE9TBXOCgE0GsCjOzOzSpX7QCQEz/W2SixvlJ8hWS9hSn+ZPdsGrTSS+dL+K+
	Gxf2LbPQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXX8-00000000BDl-1dL9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 17:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1455DA41C75;
	Mon, 10 Feb 2025 17:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D818C4CEE9;
	Mon, 10 Feb 2025 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208319;
	bh=ATfMmIVQUtizYRtKO7eBYnjIZDmUdv/DHgsiIDhlXYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDcVjMX+ZfTwiJl6BjjE71qXxZI4HKCdmqXo9wE5Y+U6FrblPTgzZ1lni9V+xlmdn
	 cbTsy9AlxZT9gnhg+/Htd/n+0NsHnZYlQEThr8rda1MhkYi6nsyAa98V7r2FrWDwIC
	 Y8eumau3YL8CxR4A3mildMq+D0trEY2jOyQ59GjPbK3CNmXszaGDoti76DXcF7dmRf
	 DyH5Lh652kl8wsHu0CHw8fYWES+d+4+nrDssVrn7nsfCrC5E4phuxjvNAawwgHY1oC
	 7Cu7ie5Y0PEbn9G4tFW42SZeUuyW9Cul19AX50sNKvYW0SPmaQ6DSkrQegw8qjB6dk
	 1WDE1x05fisPQ==
Date: Mon, 10 Feb 2025 17:25:13 +0000
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH 2/3] mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS
 display
Message-ID: <20250210172513.GH1868108@google.com>
References: <20241121092308.130328-1-manikandan.m@microchip.com>
 <20241121092308.130328-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121092308.130328-2-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_172522_685952_07FC5F41 
X-CRM114-Status: GOOD (  21.91  )
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
Cc: simona@ffwll.ch, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, bbrezillon@kernel.org, sam@ravnborg.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, claudiu.beznea@tuxon.dev, Dharma Balasubiramani <dharma.b@microchip.com>, dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 21 Nov 2024, Manikandan Muralidharan wrote:

> The XLCDC IP supports DSI, parallel RGB and LVDS Display.
> sys_clk(Generic clock) is used for DSI and Parallel RGB displays;
> And LVDS PLL is used with LVDS displays.
> obtain anyone of the clocks for the LCD to operate

Maybe say something about this being a fall-back strategy.

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  drivers/mfd/atmel-hlcdc.c       | 16 ++++++++++++++--
>  include/linux/mfd/atmel-hlcdc.h |  1 +
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
> index 4c4e35d404f3..60b0b766459e 100644
> --- a/drivers/mfd/atmel-hlcdc.c
> +++ b/drivers/mfd/atmel-hlcdc.c
> @@ -108,10 +108,22 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
>  		return PTR_ERR(hlcdc->periph_clk);
>  	}
>  
> +	/*
> +	 * Obtain one of the main clocks (GCK / LVDS PLL) required by the
> +	 * LCD to function,
> +	 * GCK for Parallel RGB and MIPI displays;
> +	 * LVDS PLL for LVDS displays.
> +	 */
> +	hlcdc->sys_clk = NULL;
> +	hlcdc->lvds_pll_clk = NULL;

Since, devm_kzalloc() is used to allocate this memory space, these are
already NULL.

>  	hlcdc->sys_clk = devm_clk_get(dev, "sys_clk");
>  	if (IS_ERR(hlcdc->sys_clk)) {
> -		dev_err(dev, "failed to get system clock\n");
> -		return PTR_ERR(hlcdc->sys_clk);
> +		dev_dbg(dev, "failed to get system clock\n");

This should be a dev_warn().

May be add some more information.

"failed to get system clock, trying xyz instead"

'\n' here.

> +		hlcdc->lvds_pll_clk = devm_clk_get(dev, "lvds_pll_clk");
> +		if (IS_ERR(hlcdc->lvds_pll_clk)) {
> +			dev_err(dev, "failed to get LVDS PLL clock\n");
> +			return PTR_ERR(hlcdc->lvds_pll_clk);
> +		}
>  	}
>  
>  	hlcdc->slow_clk = devm_clk_get(dev, "slow_clk");
> diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
> index 80d675a03b39..07c2081867fd 100644
> --- a/include/linux/mfd/atmel-hlcdc.h
> +++ b/include/linux/mfd/atmel-hlcdc.h
> @@ -75,6 +75,7 @@
>   */
>  struct atmel_hlcdc {
>  	struct regmap *regmap;
> +	struct clk *lvds_pll_clk;
>  	struct clk *periph_clk;
>  	struct clk *sys_clk;
>  	struct clk *slow_clk;
> -- 
> 2.25.1
> 

-- 
Lee Jones [李琼斯]

