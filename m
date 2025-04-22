Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38126C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9LLehpi4FTgAapmuEhpy1x3GNSP3cccL2fj7rqH5yI=; b=PQh+7FS1eazewVNYHiKOp9InzC
	faqsGoaLgOV3PXRA5KBhlT1Mzrojnw+jV0NtxlSfF/rM/FchrAeooXDEvx2o1enZSfRsdjRN9o9dZ
	1VcZy3+V4brraz1rtue2c7pn/ns7c6P/p1Y/xjlBtgO5DMmZ/XN4k75grtwR5C0qHAzKr5Y8it22V
	fk7meKyRAK1ZajmDGFxi+2MLL54EDsg017mK+TCn3/Hi1XG1SaR3AmhS+Sv+rAOjWtgK7K3b72DVT
	4vl+AMSSI9XO/HOiP9czQ7+RLXGC7xCUY16uzBRKYP/qySLSg4ZtPbxwuwX/TcIrrjtFkzNpYBSL/
	ZgZ/6oEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GgS-00000007wse-3Qpz;
	Tue, 22 Apr 2025 16:41:20 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FIQ-00000007enw-145n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:12:28 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zhlzb1gQSz6L51r;
	Tue, 22 Apr 2025 23:10:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B55E61400CA;
	Tue, 22 Apr 2025 23:12:15 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 22 Apr
 2025 17:12:15 +0200
Date: Tue, 22 Apr 2025 16:12:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Troy Mitchell <troymitchell988@gmail.com>
CC: Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Andi Shyti <andi.shyti@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, <linux-i2c@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Yongchao Jia <jyc0019@gmail.com>
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
Message-ID: <20250422161213.0000597d@huawei.com>
In-Reply-To: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
	<20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_081226_457061_BAF1E574 
X-CRM114-Status: GOOD (  18.43  )
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

On Mon, 21 Apr 2025 13:36:38 +0800
Troy Mitchell <troymitchell988@gmail.com> wrote:

> Use guard to automatically release the lock after going out of scope
> instead of calling it manually.

Drive by review, but this changes behavior in a subtle way so we
should have more commentary here...

> 
> Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
> Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 9e5d454d8318..cb96a57df4a0 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -23,6 +23,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> +#include <linux/cleanup.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>

>  
> @@ -1125,30 +1126,27 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
>  {
>  	struct imx_i2c_struct *i2c_imx = dev_id;
>  	unsigned int ctl, status;
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
> +	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
> +
>  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  
>  	if (status & I2SR_IIF) {
>  		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
> +
>  		if (i2c_imx->slave) {
>  			if (!(ctl & I2CR_MSTA)) {
>  				irqreturn_t ret;
>  
> -				ret = i2c_imx_slave_handle(i2c_imx,
> -							   status, ctl);
> -				spin_unlock_irqrestore(&i2c_imx->slave_lock,
> -						       flags);
> -				return ret;
> +				return i2c_imx_slave_handle(i2c_imx,
> +							    status, ctl);
>  			}
>  			i2c_imx_slave_finish_op(i2c_imx);
>  		}
> -		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);

In this path the patch changes the lock release to occur after
i2c_imx_master_isr(i2c_imx, status);

That may well be safe; I have no idea!  You should talk about that
in the patch description if it is.

> +
>  		return i2c_imx_master_isr(i2c_imx, status);
>  	}
> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>  
>  	return IRQ_NONE;
>  }
> 


