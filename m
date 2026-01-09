Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BCED1A623
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YegoCBBqq/Tt/iroVwkypVt4UvILAGoyFwcS9GtxwSk=; b=mw1hpbs+kfN9Ap7N7z3RyMnO7/
	+hXQMi4pJCu40fEgwU7NmlX6upNZqY4e73r9Jh0u4EqqeOnBq01Ddz8fEe9DJgKT95tHEiPTlhW7y
	QuK7obqz0RP3OWhpcY60c3QnKBOk+8wBd299Q8q0MIUmcgR+KHHZA4ZjH3bsUOUYoZNh797mHDLJ6
	j+dh4QXLQfejCf9pErpaW3GKg775Q9PV+wcoindDJFCmOExO475YQzy/InUk/eoTwwRv8bsMNEvtA
	HOVDK1QUYXHMZbZdXbB2xgg6CR/J/2RmE2q69Ecx+qQiJXkhqXrRZJds17Tp2z+MAtstvix7zUZEy
	fJ10Fdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCvX-00000002NRo-3EvA;
	Fri, 09 Jan 2026 13:53:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCvU-00000002NR0-39EB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 13:53:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1veCvM-0002aa-F0; Fri, 09 Jan 2026 14:53:08 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1veCvL-009r4F-2k;
	Fri, 09 Jan 2026 14:53:07 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1veCvL-002G7w-2I;
	Fri, 09 Jan 2026 14:53:07 +0100
Date: Fri, 9 Jan 2026 14:53:07 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: kernel@pengutronix.de, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Message-ID: <aWEIQ2X9nWbuJpeH@pengutronix.de>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_055316_816769_DD853C38 
X-CRM114-Status: GOOD (  40.41  )
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

Sorry for delay and thank you for your work.

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

I would love to have more comments, so I'll add some. Otherwise it is hard
to recall everything needed with my cold cache :)

        /*
         * Condition: We are in Master Mode (MSTA=1) AND Receive Mode (MTX=0).
         *
         * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.3 I2Cx_I2CR:
         * - Bit 5 (MSTA): 1 = Master Mode.
         * - Bit 4 (MTX):  0 = Receive.
         */

> +		if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {

            /*
             * Dummy read of I2C Data Register (I2DR).
             *
             * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.5 I2C Data I/O Register (I2Cx_I2DR):
             * "Reading the data register... initiates the next byte to be received."
             *
             * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.4 I2C Status Register (I2Cx_I2SR) -> ICF (Bit 7):
             * "The data transferring bit (ICF) is cleared... by reading from I2C_I2DR in Receive mode."
             *
             * This dummy read is essential to clear the 'Transfer Complete' (ICF)
             * flag and release the SCL line if the hardware
             * was stretching the clock waiting for a read.
             */


> +			(void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);

            /*
             * Force the controller into Master Transmit Mode (MTX=1).
             *
             * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.3 I2Cx_I2CR -> MTX (Bit 4):
             * "1 = Transmit"
             *
             * We cannot safely STOP while waiting for data (RX). By switching to TX,
             * the Master asserts control over SDA to generate the STOP condition
             * without the ambiguity of an expected incoming byte.
             */
> +			temp |= I2CR_MTX;
> +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);

            /*
             * Wait for the mode switch to settle.
             *
             * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.4 Note on Timeout:
             * "The minimum timeout... is 25 us".
             *
             * The state machine needs time to latch the new mode (TX) before
             * we immediately command it to STOP. 25us is the documented safe lower bound
             * for I2C bus event processing at 400kHz.
             * T_min = 10/F_SCL
             * T_min = 10 / 400000 Hz = 0,00002 Sec
             */

             I would recommend here to calculate delay based on current clock,
             probably i2c_imx->cur_clk is the right variable.
             May be i2c_imx->disable_delay should be used? Cirrently it is used only
             for imx1.

             I'm still not sure about impact of this delay withing this context.

> +			if (atomic)
> +				udelay(25);
> +			else
> +				usleep_range(25, 50);

            /*
             * Read back the control register to ensure the write persisted and
             * to have the freshest state for the final STOP command?
             */

> +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +		}
>  		temp &= ~(I2CR_MSTA | I2CR_MTX);
>  		if (i2c_imx->dma)
>  			temp &= ~I2CR_DMAEN;
> @@ -1103,7 +1113,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
>  
>  	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
>  		i2c_imx_isr_read_block_data_len(i2c_imx);
> -		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;

I ques, this part can go as separate directly upstream to the stable.

> +		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
> +			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
>  		break;
>  
>  	case IMX_I2C_STATE_WRITE:
> -- 
> 2.43.0
> 
> 

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

