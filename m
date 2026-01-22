Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF2C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoCU9V/sNnYvV+69mvA3iYY81dDmgsl6vWQ/U2zA954=; b=cBRoZ2nZo1LpeFdYgzsCH6Kq8C
	ct9+jJMwF7Dcyme/XOFbM3uBdN7LtxJJvoYbB2Q4EivR+HwCJpd4x6nBOqdVK9sVRE7ttRVfD+CJF
	vOVROzZ39f+8R7OERIge44hDUX6z060H177gQf5DECuyLx77l8r3cSbr5AU8TGPKzXVVPPOeSqbUS
	RW+MngQTfKxUB61AzclY9DftOWBW9jaqbYMANkKO3reajQmXFBGSqu+EsBQu+AT+SJQ8pl3UMldOw
	OOoBEW0ly+ycu7u9dg8kJxYcR3z6FqVn/zlF0IBr4Q4MwnZsKd5cO/8Q7in1N6WtVp5IetG2O+gcG
	Og48/QgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visFK-00000006uTY-0YpC;
	Thu, 22 Jan 2026 10:49:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visFH-00000006uT4-21B8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D2D1408AC;
	Thu, 22 Jan 2026 10:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDA3C16AAE;
	Thu, 22 Jan 2026 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078938;
	bh=/pYGcnquk1Ry5ELKwl0/q78NNQ/wVwQETibzYeFu6GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKRSpAd9jCmYqtF+/gk6uYCaYpeQmXfM45Sy1o8usS7BIY8+fxV6o2KDsbKNjFOtT
	 W10mLs3tWygoR81upQAnJi1ijSF0iGhW2R32sobMl6bVjqth0cC+luAjdmbqe0kD2T
	 W76zUPcNV/O85cD47aWdX75vKrsgqFUt/7tR1oE6jFSTR3HODv5me5XZtI/N7/FWHu
	 njuoTiSWlyxpAXySkAzuzn89IsEESzbs7F67Un6cebu76V3L+a/V31gfGOQAur+s6p
	 7QSa1tbEXX1L5+xlsOOXPDkXlXYwPmZrFp16lq+7npFCJx7mJ7eM0L3dvLZLModIou
	 eTb8+tFi2uNxw==
Date: Thu, 22 Jan 2026 11:48:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V3 1/2] i2c: imx: preserve error state in block data
 length handler
Message-ID: <aXH_agPD8D2QIVs0@zenone.zhora.eu>
References: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20260116111906.3413346-2-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116111906.3413346-2-Qing-wu.Li@leica-geosystems.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024859_540801_056EF3E6 
X-CRM114-Status: GOOD (  16.72  )
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

Hi Li,

I'm adding also Stefan in the Cc list as he has authored the
lines you are changing.

On Fri, Jan 16, 2026 at 11:19:05AM +0000, LI Qingwu wrote:
> When a block read returns an invalid length, zero or >I2C_SMBUS_BLOCK_MAX,
> the length handler sets the state to IMX_I2C_STATE_FAILED. However,
> i2c_imx_master_isr() unconditionally overwrites this with
> IMX_I2C_STATE_READ_CONTINUE, causing an endless read loop that overruns
> buffers and crashes the system.
> 
> Guard the state transition to preserve error states set by the length
> handler.
> 
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>

I asked you to add the Fixes tag here. Perhaps you need to add:

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: <stable@vger.kernel.org> # v6.13+

You can get the information above with "git blame".

I'll wait for comments from Oleksij and/or Stefan here.

Andi

> ---
>  drivers/i2c/busses/i2c-imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 205cc132fdec..05ba41144648 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1102,7 +1102,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
>  
>  	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
>  		i2c_imx_isr_read_block_data_len(i2c_imx);
> -		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
> +		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
> +			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
>  		break;
>  
>  	case IMX_I2C_STATE_WRITE:
> -- 
> 2.43.0
> 

