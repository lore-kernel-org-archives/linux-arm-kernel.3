Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D788CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pygkzeE34nESSLMFfA+HDZtxOSR6p+nlwLJRKufzmsA=; b=v4+EhEBATuouVtoPmYkpStkPrT
	NcoKGf1vaHahXMiqnx/m/IDMFwoJ4yJEVqIviGDI8zr4OKxqu6IK2L7s3waz1hsetzP+dbuPwJtiU
	mqSALLNs089Ok2S21i9EMCRVgVXIFmnCBqHr8VuK4TQafGx6G0jxfm0f+i8VuagXTfCpFqqadkZMh
	H5K4QuaVl4WSFSDT8gc2LpxXwZo2b8VVhnvvOm0DWA9JYfdyq0cSWxpMfilS2z/CoKYmdlGld1BlM
	SggfoItn9JU5VHOonOYtg1aC5L3lH2dqWuDmx9yOpZ11fl6kxSXHbchLp81/awlRowIi8paD1/MID
	W7PCrKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0Eg-0000000Fl9P-3vQw;
	Wed, 14 Oct 2026 14:45:42 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0EU-0000000Fl7G-1hEO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 14:45:42 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5338f65913dso4820961cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791989124; x=1792593924; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pygkzeE34nESSLMFfA+HDZtxOSR6p+nlwLJRKufzmsA=;
        b=V3PASxvU9IaeTxceq7zVUrj1EeWYq50PsWAXM4QPcH1uX0XSjJ98GcLMyJY/IF17s2
         m8Va0CA5c3LleVTAbixqlAxwpxV8WaW+yMpugvv2SAnwAkG61BxoPvO/0q5tBUACIAy0
         mEvg9uY4i/r4L9kQPvdloFzD3Mg0Te2RY8sopeikdkNG3/smt2Z4Ak9IhxQtSPo7uwvl
         qjqmJ2YXVz9TQNYp2HXe1UCR7/b/lvFiKrcISBTQ2LorX87NAJWYy+Srib0fHZrrL8eQ
         8JdkOoUIuMPighdGW3A+DKDjFMn63Gk8nSTAQ24jSOIgOj2xkMK17czx+Yi2jDokT3aj
         c7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989124; x=1792593924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pygkzeE34nESSLMFfA+HDZtxOSR6p+nlwLJRKufzmsA=;
        b=ABDKHWaB3E+JvFn/i0xVgyAIoVIBqfT9AaqeUETQrjIafUrU/A5YfiPsq3QKS6c0ml
         iyO+Tt5Rr1tslL0WIQRDxAafXbUb+xjsXRgr/l2hjFRJAJsZq4oRX0TSVY0XVvG8C4Z2
         fxOkubVyyU+lG6Cac2/bQr910IbYYJe5qxqDAjqEyOI1c/yhyIxp0A1kkIDfP7sg4orQ
         1PzhbmWeLFGRdNTo2HSxdI0hZpLP8zci9zjFcenPQUa7gIH+qlQssRoXnHTTx6CHamHk
         qyCTXTSDb68i5xpDzBiOfcWBMyTefvlHDSjjcCTqc2+gYjJbowHQZ5ZWVMn4PauGv1uA
         VT6A==
X-Forwarded-Encrypted: i=1; AKwUvBxmGBYN+AH6KV+GlYUYaHzZT1K6mPLQpEPgTZgzWOmtOXBmGwbsbpDtLzk9P9EfOT9/lX0VB1OAgLS13P9uPop8@lists.infradead.org
X-Gm-Message-State: AFq9FYKzmBTsvyPHC+IbJ0LSXJORUQ4K0hFF35gq5MFs/0Gw+cDrtAGl
	9b9JBMPxUE1tdFtHLdncO/gQfLEi4+7b/HhpCrkwGV4y5i1k7/xjgvm4SQrDIejoyQ==
X-Gm-Gg: AYBFou16Nd9iMImfg5+GyLRh9xpuCCzLxXG3h0gQgBr1v2njowiPxh21S7qEahDZld2
	CnAAA2DxJPYEDTO80bXC6yYdxdJQJcTJeMyiZmtsJVhP+quMPuBChdh+i5fBtxcDhRc4gD4OH3t
	cv5LhW57D4QxV0fioTHf0AgU6VT0t4iijS+DE8RF4gCsc3O6yIKu8MLfmMaS+1t9leYscMLPVQd
	BO/CkU7DA2FqvgdhBIuKwElbXCFQr2jic+ZYzmHRA8I2nGmX+2Pgf/03Qz30sv1dZ6IAtacpTLq
	+9lsDoOaN3Ae4JoFtHIeO8QgnRUUbBMMUnp6dYdthPihYlEEMzwUsYGokxo3m3R/E45y2Loq0Cf
	URpa7bp1gPAJ7s1HJ58G+MmG6scTQWiU/ju4vsHMZ+8hk6T2cHvVt3wX52dytXjeTb0s6SqtiVh
	blr37vnK1hXuWjDHj7bhEQeHP/hFZi5/v1ExK6VPf9mhwyreXtp6U/cIeIpKxzQK3/YqRibbKCi
	7sUMMEL7EMnNLc5f6Sg++yHOJg=
X-Received: by 2002:a05:622a:22a4:b0:533:33ed:c39d with SMTP id d75a77b69052e-5359f497f48mr235877821cf.7.1791989124279;
        Wed, 14 Oct 2026 07:45:24 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7e32cesm122425341cf.28.2026.10.14.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:45:23 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:45:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-atmel: Use dev_dbg() for debug messages
Message-ID: <54704da1-1493-42bf-aedb-231d6d339c32@rowland.harvard.edu>
References: <20261014121656.1634-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014121656.1634-1-mihai.sain@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_074534_240728_71AFC100 
X-CRM114-Status: GOOD (  18.87  )
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

On Wed, Oct 14, 2026 at 03:16:56PM +0300, Mihai Sain wrote:
> Use dev_dbg() instead of pr_debug() in the probe function
> to provide a more specific device message.
> This ensures the log message is properly associated with
> the corresponding platform device instance.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-atmel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 65747270fd88..b6ba7005be69 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -99,7 +99,7 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
>  	if (usb_disabled())
>  		return -ENODEV;
>  
> -	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
> +	dev_dbg(&pdev->dev, "Initializing Atmel-SoC USB Host Controller\n");
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -- 
> 2.56.0
> 

