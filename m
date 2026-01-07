Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7CED0D16F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 20:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dPEn4UjlQ7i3tceEVXvdfIFXBsXv6YwuaJUrswDWaY=; b=szv9mTdl5L9rTtjuToZ5Ds2+Al
	+fRkJSElATc74+IswRBh4jQ1ohvtUnUyyhDY1f6WsVaekV4lVfWqzt89XCYBykiQEtw4eirNgnO4N
	6BUDA6AKIRsEX/x7qbYUsxSgogahvBTapw9KPOBbcDtmcC1cgCH86OsQ5JcACPW80U//aCv97Hz7L
	rhCrdCnhLzqrj9ZK7zuuAY5y67vQyMDDrsgLdyYpj6cBkexZw5ZPR+QLdjoFBWR9/2pAZNdLh2SyJ
	oTght5c+70Idh3rVkpn0vSerCtw8FWnZ0rhcrNO3pztONsWPnInfi/3dygXrpFKShRhxusFD6v4Y2
	yyWCMRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZuO-0000000Fb0l-0XFg;
	Wed, 07 Jan 2026 20:13:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZuM-0000000Fazv-03RJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 20:13:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BF7A43617;
	Wed,  7 Jan 2026 20:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75230C4CEF1;
	Wed,  7 Jan 2026 20:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767816809;
	bh=4PmyOcjuUAuQC00TXSZnc4NpP7+naircmS/+sn6yl+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dEA76UbpBU7G8jX+YypizwPSzE8/5gK1vFTwb6Yxm0U+SrDVCUFl/6+32NMSgZZwd
	 j4YAmfJ5uX++anOG7IBfMxkQaX7dNN0GZvr1pzqLHl0nRsI2tmnT7vCl4ag2mbs6AN
	 DlvXhl4uLBVBRIgSCmX7kr9gfLPoKn7rUXz6fzdmpV4TnkLzHYGNZJZg5h3GEU9IcL
	 M3KVZwDvd/8yVZ3Dk68citmHrEZFM6CNhN+/6xIK+fH/DQIFzYp9O8WPpUG30gauUV
	 xsoblF0pYpuHYrsrpJVKTikO9czCRM1q94VbaLsTqpSJvKqv0mJ1SrEvmvgk8BR6IY
	 qwcy1kyG82gQw==
Date: Wed, 7 Jan 2026 21:13:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Message-ID: <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_121330_079152_61A6D900 
X-CRM114-Status: GOOD (  28.86  )
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

Hi,

Can anyone from Pengutronix give this patch a look and possibly a
try? Oleksij?

On Mon, Dec 29, 2025 at 08:16:29AM +0000, LI Qingwu wrote:
> SMBus block read transfers encode the payload length in the first data
> byte. When this first byte is zero, there is no payload and the
> transaction should terminate immediately.
> 
> On i.MX, if the first byte of an SMBus block read is zero, the driver
> unconditionally overwrites the state with IMX_I2C_STATE_READ_CONTINUE.
> This causes the state machine to enter an endless read loop, eventually
> overrunning internal buffers and leading to a crash.
> 
> At the same time, the controller remains in master receive mode and
> never generates a proper STOP condition, leaving the I2C bus permanently
> busy and preventing any further transfers on the bus.
> 
> Fix this by handling the zero-length case explicitly: when the first
> byte is zero, ensure that a clean STOP is generated. In this situation
> the controller is in master receive mode, so it must be switched to
> master transmit mode before stopping. This is done by draining the
> pending received byte from I2DR, setting I2CR_MTX to enter transmit
> mode, waiting briefly for the mode change, and then proceeding with the
> normal STOP sequence.
> 
> This change has been tested on i.MX 8M Plus platform.
> 
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>

Is this a fix?

> ---
>  drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index dcce882f3eba..f40deecf0f66 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -735,6 +735,16 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
>  		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  		if (!(temp & I2CR_MSTA))
>  			i2c_imx->stopped = 1;
> +		if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {
> +			(void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);

why do we need a cast here?

> +			temp |= I2CR_MTX;
> +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +			if (atomic)
> +				udelay(25);

where is this 25 coming from?

> +			else
> +				usleep_range(25, 50);
> +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);

Thanks,
Andi

