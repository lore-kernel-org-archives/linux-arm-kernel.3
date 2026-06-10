Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8F0CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x06EGkAQraU+3g7/QufOyAMDQPgvhh3FNld33Xss7GI=; b=YDd45uvMTVmcaBwFh609JtdHXv
	eOvLApUMEABdEFN2QIyqrXjDx1afZsEPrZGP4ikoxpkfqEM3Z/IHYlknSP7hdpyToqTmgh4cIJ1Ot
	H+q1TVM4pGmiObcwOg+lZgSdPsX4tYFL9GBa3PnxVIqVsznUWJJrqv3ciztNp6n8S+bAF2ljhWjMr
	Pp7orvTskV8SAClsl1j/d3ttQO0qTm00i0tj3GTBgODbB4jpJfhGuGmkjKNfY2PTqpRB1NeTt+6a1
	FNZI1pa6ZAGxYjLbUhAalI2KiqwRaNZkTn8MpoY0l+8sCjXUhxgL/m92eeMbjBp7HVlmULiQ9g6wm
	Wgq7sBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHNY-00000007Yzz-3jUG;
	Wed, 10 Jun 2026 11:45:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHNW-00000007Yz2-01rO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781091947;
	bh=x06EGkAQraU+3g7/QufOyAMDQPgvhh3FNld33Xss7GI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SBng9vAFXA745uxhIHrClOk55WICJFXkW6PO4pR5skEcxvS9cTQinyWUKmpDweK5F
	 oUlxG+kXGqnQmGCADLDvvGpDc/7F4hxQrXiiOw7I2DbBa3+fl0UzCvW/yfRmATF8ID
	 +c0PR9l/fX6KBatMXetfTiYrIwHAVN3mF+KhlnjrlSf06kqs9XEbkFSmFVHgS5mFOP
	 vnpVN6+Dg0Qvhn8EB23kB721IjbXdazhQ2rrTqU/SsWhRcfJQINd2Lvqd0kYhD5PRx
	 bHR5mi6vyvIaP1Eikb4SlBm9/x++dN5Ej8V7hYk7rv2ifV1cv3JeYBcM3rfuacYerA
	 jy4z2R72fzf3Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8EF8760A14;
	Wed, 10 Jun 2026 19:45:46 +0800 (AWST)
Message-ID: <9f2caf9887177bad39525a6713325c252ad47dcb.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: check endpoint DMA allocation
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ruoyu Wang <ruoyuw560@gmail.com>, Neal Liu <neal_liu@aspeedtech.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 21:15:46 +0930
In-Reply-To: <20260608081948.3-1-ruoyuw560@gmail.com>
References: <20260608081948.3-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_044550_263532_B90ACE44 
X-CRM114-Status: GOOD (  26.21  )
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

On Mon, 2026-06-08 at 16:19 +0800, Ruoyu Wang wrote:
> ast_udc_probe() allocates a coherent DMA buffer used as the backing store
> for endpoint buffers. ast_udc_init_ep() derives per-endpoint buffer
> pointers from udc->ep0_buf, so a failed allocation is dereferenced during
> probe.
>=20
> Check the allocation before endpoint setup. The existing probe error path
> called ast_udc_remove(), which unregisters the gadget unconditionally and
> is not safe before usb_add_gadget_udc() succeeds. Add a local cleanup
> helper for probe failures so pre-registration failures only unwind the
> resources that were actually initialized.
>=20
> This was found by a local static analysis checker for unchecked allocator
> returns while scanning Linux 6.16. The change was checked by applying it
> to current mainline and by running checkpatch. I do not have access to
> Aspeed UDC hardware, so no runtime testing was performed.
>=20
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> Note: a 2022 patch attempted to add only a NULL check for this
> allocation:
> https://lore.kernel.org/all/20221213025120.23149-1-jiasheng@iscas.ac.cn/
>=20
> This version also fixes the probe unwind path so the clock is disabled
> on allocation failure and usb_del_gadget_udc() is not called before the
> gadget has been registered.
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc=
/aspeed_udc.c
> index 7fc6696b7..809a7d5b7 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1434,11 +1434,34 @@ static void ast_udc_init_hw(struct ast_udc_dev *u=
dc)
> =C2=A0	ast_udc_write(udc, 0, AST_UDC_EP0_CTRL);
> =C2=A0}
> =C2=A0
> +static void ast_udc_cleanup(struct platform_device *pdev)
> +{
> +	struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	/* Disable upstream port connection */
> +	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
> +	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> +
> +	clk_disable_unprepare(udc->clk);
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	if (udc->ep0_buf)
> +		dma_free_coherent(&pdev->dev,
> +				=C2=A0 AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
> +				=C2=A0 udc->ep0_buf,
> +				=C2=A0 udc->ep0_buf_dma);
> +
> +	udc->ep0_buf =3D NULL;
> +}
> +
> =C2=A0static void ast_udc_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> -	unsigned long flags;
> -	u32 ctrl;
> =C2=A0
> =C2=A0	usb_del_gadget_udc(&udc->gadget);
> =C2=A0	if (udc->driver) {
> @@ -1453,23 +1476,7 @@ static void ast_udc_remove(struct platform_device =
*pdev)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	spin_lock_irqsave(&udc->lock, flags);
> -
> -	/* Disable upstream port connection */
> -	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
> -	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> -
> -	clk_disable_unprepare(udc->clk);
> -
> -	spin_unlock_irqrestore(&udc->lock, flags);
> -
> -	if (udc->ep0_buf)
> -		dma_free_coherent(&pdev->dev,
> -				=C2=A0 AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
> -				=C2=A0 udc->ep0_buf,
> -				=C2=A0 udc->ep0_buf_dma);
> -
> -	udc->ep0_buf =3D NULL;
> +	ast_udc_cleanup(pdev);
> =C2=A0}
> =C2=A0
> =C2=A0static int ast_udc_probe(struct platform_device *pdev)
> @@ -1523,6 +1530,10 @@ static int ast_udc_probe(struct platform_device *p=
dev)
> =C2=A0					=C2=A0 AST_UDC_EP_DMA_SIZE *
> =C2=A0					=C2=A0 AST_UDC_NUM_ENDPOINTS,
> =C2=A0					=C2=A0 &udc->ep0_buf_dma, GFP_KERNEL);
> +	if (!udc->ep0_buf) {
> +		rc =3D -ENOMEM;
> +		goto err_disable_clk;
> +	}
> =C2=A0
> =C2=A0	udc->gadget.speed =3D USB_SPEED_UNKNOWN;
> =C2=A0	udc->gadget.max_speed =3D USB_SPEED_HIGH;
> @@ -1553,20 +1564,20 @@ static int ast_udc_probe(struct platform_device *=
pdev)
> =C2=A0	udc->irq =3D platform_get_irq(pdev, 0);
> =C2=A0	if (udc->irq < 0) {
> =C2=A0		rc =3D udc->irq;
> -		goto err;
> +		goto err_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	rc =3D devm_request_irq(&pdev->dev, udc->irq, ast_udc_isr, 0,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_MODNAME, udc);
> =C2=A0	if (rc) {
> =C2=A0		dev_err(&pdev->dev, "Failed to request interrupt\n");
> -		goto err;
> +		goto err_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	rc =3D usb_add_gadget_udc(&pdev->dev, &udc->gadget);
> =C2=A0	if (rc) {
> =C2=A0		dev_err(&pdev->dev, "Failed to add gadget udc\n");
> -		goto err;
> +		goto err_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	dev_info(&pdev->dev, "Initialized udc in USB%s mode\n",
> @@ -1574,9 +1585,14 @@ static int ast_udc_probe(struct platform_device *p=
dev)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_disable_clk:
> +	clk_disable_unprepare(udc->clk);
> +	goto err;
> +err_cleanup:
> +	ast_udc_cleanup(pdev);
> +	goto err;
> =C2=A0err:

That last goto is unnecessary.

However, I find it unsettling that in a patch fixing resource handling
we add a mildly convoluted cleanup path, with portions jumping over
each other in this way.

The err_disable_clk label is only used once, and itself jumps down to
the err label. This is the case because beyond its goto we free udc-
>ep0_buf in ast_udc_cleanup(). I think it would make more sense to move
the call to clk_disable_unprepare() into the conditional body of the
allocation failure test, then change its goto label to 'err'. That way
the above hunk becomes:

   +err_cleanup:
   +    ast_udc_cleanup(pdev);
    err:
        ...

Which seems a bit more natural.

Andrew

> =C2=A0	dev_err(&pdev->dev, "Failed to udc probe, rc:0x%x\n", rc);
> -	ast_udc_remove(pdev);
> =C2=A0
> =C2=A0	return rc;
> =C2=A0}

