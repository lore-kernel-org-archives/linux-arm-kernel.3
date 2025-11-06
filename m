Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103A2CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vH2E/rBk64YCndQMOte35ib2Cg2kEeHLkCEtP4Vre8g=; b=WDfteiDecbPK35Dp04G5QM+tzR
	oIh7Baf5oi46U3kD2MGinmhmaqS5CwHhHGjylr4eP8DoWYZXNhSm/3BW0doOTiSZqu6ILt80QEM0m
	t1WNGfHjY2pUfKdvoeLCksR0PuDmGR0HLA4z6ZYd0BILnyI4m7EXrHScBr9OA5nFJuA6gNDKbgWkX
	kB6MaBmQrt39JP668sSszfky7alEOSQLSGYtZ2N3WP0F++ZabimBUPBZQMSB25I0VMZCLtAUQcsTb
	FQkQyuQHZjGxFd6qhdbgdnAGazkq0VYlRCIm0tbhu8k2xTcPhY5ckgKqv+DDE5ZtX63imDiBZEn6w
	qVJ+SL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzdU-0000000FWv6-3lUw;
	Thu, 06 Nov 2025 13:02:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzdS-0000000FWuU-0BqB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:02:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6B41436F7;
	Thu,  6 Nov 2025 13:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33C4C4CEFB;
	Thu,  6 Nov 2025 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762434159;
	bh=lPkW7VunzQTWdZlBYd5uE68H7anD0Qk+0LUNZisKswM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UU23+Tkm7dkn1sE0/4NeaCjEccKPw6GU2oWcIgcSIJL4uTqPK/F1CGZTUW3HSla1n
	 r2Jms4SG2gWNgTIt4DS88ToamV9Pw6Yt8sd3cqtiLYeNPCY8di7FHa+ZlOWiORkDKa
	 nzM610QiBVZ7E7GS3xoIcLxuapn/C1V3KXF1LBXGPxSgsDvtAUFBJteVnbumdQyHfC
	 4OLeQUw5Lxe4/Bic3P3HP6MK5kfjlUyz7GvuJJ14M9VDFSNyFzj0PkqmW3Ok6nRCOI
	 nhQ6/lrgZiOl9R06Vcudepnz1+fFZItufqtsoMLkeLZMJ1jhQSVN4vKXrfup0qbwNZ
	 QRP5oagVmLGUg==
Date: Thu, 6 Nov 2025 13:02:33 +0000
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dharma.b@microchip.com
Subject: Re: [PATCH v2 RESEND 2/3] mfd: atmel-hlcdc: fetch LVDS PLL clock for
 LVDS display
Message-ID: <20251106130233.GK8064@google.com>
References: <20251022091351.472331-1-manikandan.m@microchip.com>
 <20251022091351.472331-3-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022091351.472331-3-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_050242_146798_B9699882 
X-CRM114-Status: GOOD (  24.08  )
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

On Wed, 22 Oct 2025, Manikandan Muralidharan wrote:

> The XLCDC IP supports parallel RGB, MIPI DSI and LVDS Display.
> The LCD Generic clock (sys_clk) is used for Parallel RGB and MIPI
> displays, while the LVDS PLL clock (lvds_pll_clk) is used for LVDS
> displays.Since both the clocks cannot co-exist together in the DT
> for a given display, this patch first attempts to retrieve sys_clk
> If that fails,it then tries to acquire lvds_pll_clk.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> changes in v2:
> - Rephrase the comments, commit message and err logs
> - Replace dev_err wwith dev_warn
> - Remove Initializing sys_clk and lvds_pll_clk to NULL post
> devm_kzalloc() call
> 
> ---
>  drivers/mfd/atmel-hlcdc.c       | 16 ++++++++++++++--
>  include/linux/mfd/atmel-hlcdc.h |  1 +
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
> index 4c4e35d404f3..f680392b01ba 100644
> --- a/drivers/mfd/atmel-hlcdc.c
> +++ b/drivers/mfd/atmel-hlcdc.c
> @@ -108,10 +108,22 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
>  		return PTR_ERR(hlcdc->periph_clk);
>  	}
>  
> +	/*
> +	 * Retrieve any one of the Main clk required by the LCD to operate:
> +	 *
> +	 * LCDC Generic Clock (sys_clk) - Parallel RGB and MIPI displays,
> +	 * LVDS PLL (lvds_pll_clk)      - LVDS display
> +	 */
>  	hlcdc->sys_clk = devm_clk_get(dev, "sys_clk");
>  	if (IS_ERR(hlcdc->sys_clk)) {
> -		dev_err(dev, "failed to get system clock\n");
> -		return PTR_ERR(hlcdc->sys_clk);
> +		dev_warn(dev,
> +			 "failed to get LCDC generic clock, trying for LVDS PLL clock instead\n");

Does the user really care which clock they use?

Can this just happen silently instead?

> +		hlcdc->lvds_pll_clk = devm_clk_get(dev, "lvds_pll_clk");
> +		if (IS_ERR(hlcdc->lvds_pll_clk)) {
> +			dev_err(dev, "failed to get LVDS PLL clock\n");

Failed to obtain both the LCDC (generic) and LVDS PLL clocks

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

