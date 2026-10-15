Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2F7CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 23:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RRbiKX1IIdlTwNCQqDikgAOOiBg6jsNei09RfgsCA4=; b=xRdvor0dZ8HC+0pDrEtSSIZ1Zy
	pt5kkldHYx2IrZ3IWrWfrwepzill8XvJ6RSEvaVwM3lH+zByqIQ9Nb2vY6W/bbygGJmy8Bh8FN+Ob
	O8hROpgFQLT8CuxRIJnnfGltAINF88f9r4AAia6dwzg6cMLXpHydJyY32uAxm97EY5VtM/pIxdS9Q
	ItHqoka3EHbN+rm8RthBJmwQzkld8AibHCdCz0msJW1qupk6XgGYlzzlPz3GXJIEz6VlQZmmLQPTT
	iSlzDZEnZNBdcggM/H+zzjiLxoH8oQkTPVIJzBkkfn97c9DYqjijqTGksNUSeOwOA876vvmRh3EUW
	5BPqqJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVEb-00000001ZwH-0zaq;
	Thu, 15 Oct 2026 23:51:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVEZ-00000001ZwB-2tYn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 23:51:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C652560A74;
	Thu, 15 Oct 2026 23:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844FF1F000C4;
	Thu, 15 Oct 2026 23:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792108298;
	bh=/RRbiKX1IIdlTwNCQqDikgAOOiBg6jsNei09RfgsCA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PpLG1J7ORRhLp6RnZaE1SYJmNPWjSIkzHmq+PHFjPOwCVpz+s+IrxIyPUutaSL0pJ
	 6NF5zCscdGImjBADIJl0Wqjbzv2Pt0+Dn+i2Sze/ZlS2baQsGE0a7LkHymtqRexd92
	 VbKJtbqwF+4B/dy4TOeTDlv/iX0lJrOIIiBxN1/WvARAx0lDJPJY4sMoPoODItbT9z
	 +8iA1NPZDO8NRP8NWhCcZd0/iho4d/98/0BACUMaW4l7fE527PRcexypUOn9X251eh
	 zEz5QipXHYmovX72LZWFm3YUtGN+qa5XKuwHPy98cKO/Rp3H+YeUyEMzTZ6ERmQggM
	 mLcllYSBbCncQ==
Date: Fri, 16 Oct 2026 01:51:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: i2c-xiic: fix clearing of bnb irq
Message-ID: <atFf1ZbNi29Lbdbb@zenone.zhora.eu>
References: <20261015081127.1566244-1-thi.zirnstein@gmail.com>
 <20261015081127.1566244-2-thi.zirnstein@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015081127.1566244-2-thi.zirnstein@gmail.com>
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

Hi Thilo,

On Thu, Oct 15, 2026 at 10:11:27AM +0200, Thilo Zirnstein wrote:
> Add a function for clearing the bnb bit,
> It waits for all preconditions before clearing the bnb bit or times out.
> 
> Tested on Zynqmp dev board with some custom logic.
> Tested-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> 

Please, don't leave blank lines between tags. Moreover in this
case I don't need your Tested-by, I believe you tested your patch
before sending.

> Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>

I'd need here an ack from Michal.

> ---
>  drivers/i2c/busses/i2c-xiic.c | 42 +++++++++++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 5e397a7e63f6..da9cedb86f94 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -230,7 +230,9 @@ static const struct timing_regs timing_reg_values[] = {
>  
>  #define XIIC_RESET_MASK             0xAUL
>  
> -#define XIIC_PM_TIMEOUT		1000	/* ms */
> +#define XIIC_PM_TIMEOUT 1000 /* ms */

Why this change?

> +/* timeout waiting for bus busy */
> +#define XIIC_BB_TIMEOUT		(msecs_to_jiffies(1))

I don't see much benefit from this define as it's used only once.
It just makes it more difficult to read.

>  /* timeout waiting for the controller to respond */
>  #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
>  /* timeout waiting for the controller finish transfers */
> @@ -392,6 +394,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
>  	return 0;
>  }
>  
> +static int xiic_clear_en_bnb(struct xiic_i2c *i2c)

Why do you need to return an error value if you ignore it
everywhere?

> +{
> +	u8 sr = 0, isr = 0;
> +	unsigned long timeout;
> +
> +	timeout = jiffies + XIIC_BB_TIMEOUT;
> +	for (isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
> +		(isr & XIIC_INTR_BNB_MASK);
> +		isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET)) {

this for loop is quite ugly. I believe that with a do...while()
you can write a clearer code.

> +
> +		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
> +		if (sr & XIIC_SR_BUS_BUSY_MASK)
> +			xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
> +
> +		if (time_after(jiffies, timeout)) {

If this is called in a context where interrupts are disabled,
jiffies might not be incremented and you end up looping forever.
How about using read_poll_timeout_atomic() instead?

> +			dev_err(i2c->dev, "Failed to clear bnb\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
> +	return 0;
> +}
> +
>  /**
>   * xiic_setclk - Sets the configured clock rate
>   * @i2c: Pointer to the xiic device structure

...

> @@ -1225,8 +1248,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)
>  
>  		/* Clear any pending Tx empty, Tx Error and then enable them */
>  		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
> -				XIIC_INTR_TX_ERROR_MASK |
> -				XIIC_INTR_BNB_MASK);
> +						XIIC_INTR_TX_ERROR_MASK);
> +

this needs to be aligned properly.

Andi

> +		xiic_clear_en_bnb(i2c);
>  	}
>  
>  	i2c->prev_msg_tx = true;
> -- 
> 2.43.0
> 

