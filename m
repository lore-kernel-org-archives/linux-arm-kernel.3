Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788A7E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnF8eWl4CHp250vfS3H8w6hKmKgHouhpFlQhBDeEL9o=; b=H4PYmaktSla2yX1BQJ1QLe7drS
	nEVQeWqy4DolxOiqIjKxVlC4c68CoEvSmYqwmNyLFGu7VlIw72ioqlnqtDunsRFT7qbclYRvBlhLR
	V11U9/t2bR8YkW7/fS8U/tugTuM4if9lNIX7Z3ug94dZ8CVnXw0w4dQKPt23H2CVqOGi4AyLFcJ0B
	35RBpOUWVHq5W8fgTBYG5k6my4rOoSXWhSZyhYFAor8mV1FOBbhCSLwfLSpWYdDr6LruFtfBwntep
	sshc/+lIpl4I2u2A5ywjuqNHWkzYw718ZFzLoNK/UoS4n7AueLL+nONc4LGLpWLxolnM/BMClG4zt
	9rP5r6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyc5-0000000HPYO-0tks;
	Wed, 18 Dec 2024 18:17:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyay-0000000HPN3-0zZY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3CD65C5500;
	Wed, 18 Dec 2024 18:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EF2C4CECD;
	Wed, 18 Dec 2024 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734545787;
	bh=IoS8V5OJJU6ewXW9pzCcwYKAq51QATQ5Pb5qNsYdWfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMrAxgQqqMyB9LgVl3p28na48MJ0GAphgSvZQHaIeR28xUwqS9Siwc9H9DOXli9eS
	 1f2/eclGFbXferEJZxopZFlDHqQaYmm8rYajUQAJdS4H+StalszSeoJvauEif0icUh
	 lbXNjpr+Co6S8uFOkUtLZdIHoh+cPovwT01Sb71KVI8KXauIOG2oQl4cxOXt7xnTMl
	 xbYb5fTp7uJ+2WJDcXvRNV6W4ujsm5DqrD+WifaRgUuuBLukQM5VzHzVjS9+m34lP+
	 DanLD6P+ICV2oX1/OrdyiGVKe1W9wuQ/crJsdhz5m+xBeq0Zf+OhJuaGitV0dESQaZ
	 PzoZFVmf3FFUQ==
Date: Wed, 18 Dec 2024 19:16:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com, 
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <w3x46is2s463ektusvnyu5tt2rinz7eae2ekzyqw2urw5yh5ga@pfzrgzpxjc4y>
References: <20241216151829.74056-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216151829.74056-1-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_101628_376705_4638B7A7 
X-CRM114-Status: GOOD (  27.04  )
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

Hi Stefan,

On Mon, Dec 16, 2024 at 04:16:40PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> A regression was introduced with the implementation of single-master
> mode, preventing proper stop conditions from being generated. Devices
> that require a valid stop condition, such as EEPROMs, fail to function
> correctly as a result.
> 
> The issue only affects devices with the single-master property enabled.
> 
> This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
> polling for single-master mode when generating a stop condition. The fix
> further ensures that the i2c_imx->stopped flag is cleared at the start
> of each transfer, allowing the stop condition to be correctly generated
> in i2c_imx_stop().
> 
> According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
> 5270), polling the IBB bit to determine if the bus is free is only
> necessary in multi-master mode. Consequently, the IBB bit is not polled
> for the start condition in single-master mode.
> 
> Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index f751d231ded8..cbf66a69e20b 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
>  {
>  	unsigned long orig_jiffies = jiffies;
>  	unsigned int temp;
> -
> -	if (!i2c_imx->multi_master)
> -		return 0;
> +	bool multi_master = i2c_imx->multi_master;

with this small adjustment, I have applied your patch to 
i2c/i2c-host-fixes.

The idea behind the change is that variables are sorted by 
length, forming a kind of reversed Christmas tree shape. It's 
not a strict rule—some communities enforce it, others don't, and 
some follow entirely different conventions.

Since it feels somewhat arbitrary to me, I don't enforce it 
strictly. However, I personally try to adhere to the reversed 
Christmas tree rule whenever possible.

Andi

>  
>  	while (1) {
>  		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  
>  		/* check for arbitration lost */
> -		if (temp & I2SR_IAL) {
> +		if (multi_master && (temp & I2SR_IAL)) {
>  			i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
>  			return -EAGAIN;
>  		}
>  
> -		if (for_busy && (temp & I2SR_IBB)) {
> +		if (for_busy && (!multi_master || (temp & I2SR_IBB))) {
>  			i2c_imx->stopped = 0;
>  			break;
>  		}
> -- 
> 2.45.2
> 

