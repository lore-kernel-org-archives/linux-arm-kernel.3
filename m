Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403451125839
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0ZRQmIyt/GTxHYq72AMYnoAg1V68GbEDdUOeNmHaes=; b=Ds+gH19Td2XOdi7gOoDSGEBM0U
	dEmsqD0VuEcjjJWPFsRZ60QsuJ7inhD5+nkLx/soG0IXaBCWlZbdBj3FRnLZOA2VVhw99cRSvNCs0
	oeP+pvKdIHHRiXSbbkFsJmDlevTii8ZkUl/i51KIW8vz4qx1REhzprDZqs70qvixjobLsIziKJwLK
	78uKWyQGW5EUJiw0jkl+4qgDUqKxrc9KJpe7jNWdjagkQmaUyXdwaVt/iiW9XcdEYhYptRb7dRGXp
	Nnt50hEMIrteFoPlY4Yj9zHZQ8MBUMF5Y91sJz7xh90ygadkj6XsCDbhK/uEp2Qq5/mEB13YS+/qV
	clIDDYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0L1P-0000000Bkdm-1gjm;
	Wed, 11 Mar 2026 14:58:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0L1M-0000000Bkd1-32NT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:58:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B93A140AE4;
	Wed, 11 Mar 2026 14:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A99C4CEF7;
	Wed, 11 Mar 2026 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773241127;
	bh=3UwwGA7p1224trkn2l3lnBOIO6zwoCMBxvu/3n1GBnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prQCEWwzc2c26hzWCQXpbLIVIsXlF2APJXq4ME+yQ7XEp8IDqBOARuSceQg+zJA5u
	 zWofnfjZLH78djAVv0aBq1L0a5JNFoXMJZO8gkSijTmVnQ9xZm2+4Aj0Itan2/212Z
	 fk8eDVRBfW+zBA8hGQORnDn1W6Cs97y21PqAA4vw=
Date: Wed, 11 Mar 2026 15:58:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhaoyang Yu <2426767509@qq.com>
Cc: sergei.shtylyov@gmail.com, daniel@zonque.org, haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] USB: pxa27x_udc: check return value of clk_enable
Message-ID: <2026031145-stencil-italics-89b3@gregkh>
References: <tencent_648835A07EDBB7CA94B66FAF5662EC2F1407@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_648835A07EDBB7CA94B66FAF5662EC2F1407@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_075848_798729_B3073E21 
X-CRM114-Status: GOOD (  22.48  )
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

On Wed, Mar 11, 2026 at 01:56:14PM +0000, Zhaoyang Yu wrote:
> clk_enable() may fail according to the API contract.
> Previously, udc_enable() ignored its return value and returned void.
> 
> Modify udc_enable() to return the error code. Additionally, update
> all of its callers (pxa_udc_pullup, pxa_udc_vbus_session,
> pxa27x_udc_start, pxa_udc_probe, and pxa_udc_resume) to check
> this return value and handle the failure properly with necessary
> cleanups or rollbacks.
> 
> Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
> ---
> Changes in v3:
> - Changed udc_enable() return type from void to int.
> - Propagated the error to all caller functions and added proper
>   error handling/rollback per Greg KH's review.
> 
> Changes in v2:
> - Fixed a formatting issue by moving the 'int ret' declaration to
>   the beginning of the function block.
> 
>  drivers/usb/gadget/udc/pxa27x_udc.c | 60 ++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index 897f53601b5b..0a5f05f8e73c 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -1462,7 +1462,7 @@ static int pxa_udc_wakeup(struct usb_gadget *_gadget)
>  	return 0;
>  }
>  
> -static void udc_enable(struct pxa_udc *udc);
> +static int udc_enable(struct pxa_udc *udc);
>  static void udc_disable(struct pxa_udc *udc);
>  
>  /**
> @@ -1519,14 +1519,18 @@ static int should_disable_udc(struct pxa_udc *udc)
>  static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
>  {
>  	struct pxa_udc *udc = to_gadget_udc(_gadget);
> +	int ret;
>  
>  	if (!udc->gpiod && !udc->udc_command)
>  		return -EOPNOTSUPP;
>  
>  	dplus_pullup(udc, is_active);
>  
> -	if (should_enable_udc(udc))
> -		udc_enable(udc);
> +	if (should_enable_udc(udc)) {
> +		ret = udc_enable(udc);
> +		if (ret)
> +			return ret;
> +	}

DOn't you need to change the pullup?

>  	if (should_disable_udc(udc))
>  		udc_disable(udc);
>  	return 0;
> @@ -1545,10 +1549,14 @@ static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
>  static int pxa_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
>  {
>  	struct pxa_udc *udc = to_gadget_udc(_gadget);
> +	int ret;
>  
>  	udc->vbus_sensed = is_active;
> -	if (should_enable_udc(udc))
> -		udc_enable(udc);
> +	if (should_enable_udc(udc)) {
> +		ret = udc_enable(udc);
> +		if (ret)
> +			return ret;
> +	}

Shouldn't you change vbus_sensed?


>  	if (should_disable_udc(udc))
>  		udc_disable(udc);
>  
> @@ -1691,12 +1699,18 @@ static void udc_init_data(struct pxa_udc *dev)
>   * Enables the udc device : enables clocks, udc interrupts, control endpoint
>   * interrupts, sets usb as UDC client and setups endpoints.
>   */
> -static void udc_enable(struct pxa_udc *udc)
> +static int udc_enable(struct pxa_udc *udc)
>  {
> +	int ret;
> +
>  	if (udc->enabled)
> -		return;
> +		return 0;
>  
> -	clk_enable(udc->clk);
> +	ret = clk_enable(udc->clk);
> +	if (ret) {
> +		dev_err(udc->dev, "clk_enable failed: %d\n", ret);
> +		return ret;
> +	}
>  	udc_writel(udc, UDCICR0, 0);
>  	udc_writel(udc, UDCICR1, 0);
>  	udc_clear_mask_UDCCR(udc, UDCCR_UDE);
> @@ -1726,6 +1740,8 @@ static void udc_enable(struct pxa_udc *udc)
>  	pio_irq_enable(&udc->pxa_ep[0]);
>  
>  	udc->enabled = 1;
> +
> +	return 0;
>  }
>  
>  /**
> @@ -1761,10 +1777,16 @@ static int pxa27x_udc_start(struct usb_gadget *g,
>  		}
>  	}
>  
> -	if (should_enable_udc(udc))
> -		udc_enable(udc);
> +	if (should_enable_udc(udc)) {
> +		retval = udc_enable(udc);
> +		if (retval)
> +			goto fail_enable;
> +	}

No other unwinding is needed?

thanks,

greg k-h

