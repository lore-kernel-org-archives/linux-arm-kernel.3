Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4B3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 17:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73h6zgdjYwKV/mV0oFHEsq1W810FrZfJYhYEewVFptA=; b=wujgQgp3h44Lq2njjYbkAH99g+
	U7iVqD1Z08JflFHTaVbcE6J4rW7Kv6vvQXbkoWrhsaCOOkklCYrp9hEjaByCwSteG8cVdKYqsSwPV
	G1Yau27JY+qw+9Ys3lfvPQH73G4kCGwZY/WpdWDm0YTSYu5GTFY+nTqS89+hvpQr0C5E8OCCZ+mDG
	G4fXEHU9KSlLjIgJBcbrJANjoP0x9pUEKfgi/QyO3SUI8s9IqVHAnY8qFIiPiV2srP0w98pUlbeJr
	CbRf1gzB2CamcSooL0/xEsI1wyvyaNmZKhIOfLNLbE/hYZ30Ap1IJ+G9ta5WD8zvUcZmAsVBEluBy
	dfeBMuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiznZ-0000000FmB9-0aIG;
	Fri, 14 Feb 2025 17:48:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizGb-0000000FeV8-15Gu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:14:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22101839807so7873305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739553256; x=1740158056; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=73h6zgdjYwKV/mV0oFHEsq1W810FrZfJYhYEewVFptA=;
        b=IhE+3lD0v9t6TWG1PytbddV5GRUjGEgLIVP50ixeOrZTYFhnoX2ep5tBzoCTnARgXK
         jUJPndKBV+D54klrJQiowzcNACi5EFUDpnFchWpGypDEc4Hrzti3eStP4E3jLm0Ouwus
         FdOq/hxlxcdnX2X5MhSNFNW4S/yeOU/Sbo8r/1q4w4B/eit3m6MN9WwvkruJIK9CEHnu
         sLht7S50i+zaFLyAHYibZad+um8aK2sFV5fSI9wHoH/zWLHU+4kvKgdDlK61TE2Kt+ij
         Fj4vnOBjC2eN3yKVZqoboJL9t817A+5XhOieqt3IXQXpEl0t7FsANSjq/G0K1neOH7uI
         /PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739553256; x=1740158056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=73h6zgdjYwKV/mV0oFHEsq1W810FrZfJYhYEewVFptA=;
        b=atOof2EblBm06NynsyLpmdeYDaOKBIPkJATbuCZugqFk2mcCiAs8f0lQQ+tQX0L1cM
         vqgscBh4T+m4vQckIODMM7g4VNIIZnLdlLLwAbyDSBUCIBzboSrn4a00kXD/gOlkfy9w
         MubgYM/76YZSPgafkMn2xLjo0JBmwDjVPnhhQMgVlH7SmRyv5NA/86NS13tTQ5IIRRa6
         Ukqvz940KPdHDlMVigPmHUGl9BE/3zAPD2JeaZgl6zB7/LcfcIEwB/ZwgoLE9xRO+EJd
         2mrHMSCtWZIatd4QK/Y9CzVqSKh8KCMwhrJF8ao1JlucAqgEtQk6SsKhlrltszci7noP
         7MDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaRXtsXcCXoUN9Z1+n0YOJ+xeHYnDn58mltzK13sIVqvc5fBUTUb1RHZt7OdiUC4QnzrjaxfCXTHMhcismBlGn@lists.infradead.org
X-Gm-Message-State: AOJu0YwIIUcI6Wo1yS4uF7+0PyDHNVuV35tCtJt6tLDPS5W6oUt12Mjl
	Hv0YYZqd5YjNCsAh+puFmurKX1xiOwc5w1K02x36IuuFYA95AjX54b9CwSLbRw==
X-Gm-Gg: ASbGnct/XmRTeHdGzaKY15o3vDjQ19aGrBP2tRFudJMpK7hChoRjEvm2sEFzRPZzHyP
	RKMU+iWYi3O9eAseawSUzMoJ7RV/2Sp2taePeeUTb4BmuHl15SZSe/RTxRqW+A7pz6TV7Ty+rjo
	2EFcRDlIEmkKbOyYp1XcJ08XGWVHKPYgsW2hSM5fcuv0iDM0zr2DwXTlSlXejv8Ea8BdR8CD5ii
	kTzB8DhLU7LOlmL9KWIq1+cLC36lLR+ieLa6vMFyHVSvL6c4R3iCBw/ZAE6R2TK2heWSg1v6Fn8
	TSUc0VBdsS2vXmOhKh7SCgMzceY=
X-Google-Smtp-Source: AGHT+IGEjW1+nSnm03Sb/7JjOqd2fLGFWNtn2pSYwsh2yOQR3S+BitUF4p8rbuVp0ACw3TNqwyLoRw==
X-Received: by 2002:a05:6a00:4fd2:b0:732:1f45:fcca with SMTP id d2e1a72fcca58-732618fa57dmr185138b3a.21.1739553256278;
        Fri, 14 Feb 2025 09:14:16 -0800 (PST)
Received: from thinkpad ([120.60.134.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73249fe96b4sm2520712b3a.75.2025.02.14.09.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:14:15 -0800 (PST)
Date: Fri, 14 Feb 2025 22:44:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Amit Singh Tomar <amittomer25@gmail.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] tty: owl-uart: fix call balance of owl_port->clk
 handling routines
Message-ID: <20250214171405.kvyyespxtfqxhapc@thinkpad>
References: <20250213112416.1610678-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213112416.1610678-1-mordan@ispras.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091417_306683_25307E0C 
X-CRM114-Status: GOOD (  25.18  )
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

On Thu, Feb 13, 2025 at 02:24:16PM +0300, Vitalii Mordan wrote:
> If owl_port->clk was enabled in owl_uart_probe(), it must be disabled in
> all error paths to ensure proper cleanup. However, if uart_add_one_port()
> returns an error in owl_uart_probe(), the owl_port->clk clock will not be
> disabled.
> 
> Use the devm_clk_get_enabled() helper function to ensure proper call
> balance for owl_port->clk.
> 

Do not use newly introduced APIs to fix old bugs. The bug should be fixed
separately to allow backporting and the conversion should be done on top.

- Mani

> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: abf42d2f333b ("tty: serial: owl: add "much needed" clk_prepare_enable()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
> ---
>  drivers/tty/serial/owl-uart.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/tty/serial/owl-uart.c b/drivers/tty/serial/owl-uart.c
> index 0542882cfbbe..64446820437c 100644
> --- a/drivers/tty/serial/owl-uart.c
> +++ b/drivers/tty/serial/owl-uart.c
> @@ -680,18 +680,12 @@ static int owl_uart_probe(struct platform_device *pdev)
>  	if (!owl_port)
>  		return -ENOMEM;
>  
> -	owl_port->clk = devm_clk_get(&pdev->dev, NULL);
> +	owl_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(owl_port->clk)) {
> -		dev_err(&pdev->dev, "could not get clk\n");
> +		dev_err(&pdev->dev, "could not get and enable clk\n");
>  		return PTR_ERR(owl_port->clk);
>  	}
>  
> -	ret = clk_prepare_enable(owl_port->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "could not enable clk\n");
> -		return ret;
> -	}
> -
>  	owl_port->port.dev = &pdev->dev;
>  	owl_port->port.line = pdev->id;
>  	owl_port->port.type = PORT_OWL;
> @@ -701,7 +695,6 @@ static int owl_uart_probe(struct platform_device *pdev)
>  	owl_port->port.uartclk = clk_get_rate(owl_port->clk);
>  	if (owl_port->port.uartclk == 0) {
>  		dev_err(&pdev->dev, "clock rate is zero\n");
> -		clk_disable_unprepare(owl_port->clk);
>  		return -EINVAL;
>  	}
>  	owl_port->port.flags = UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_LOW_LATENCY;
> @@ -725,7 +718,6 @@ static void owl_uart_remove(struct platform_device *pdev)
>  
>  	uart_remove_one_port(&owl_uart_driver, &owl_port->port);
>  	owl_uart_ports[pdev->id] = NULL;
> -	clk_disable_unprepare(owl_port->clk);
>  }
>  
>  static struct platform_driver owl_uart_platform_driver = {
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

