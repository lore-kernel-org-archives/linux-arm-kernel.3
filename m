Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCmIkVUlyYS1l50NWD0FkuSukN4OH7MWzn4OjPBsiyQ=; b=3rlLJ0QEi95GgRoTlDHy+jX31l
	rCJ7AizYfL4x/7+3Nuati/H+85/0K7U8ts4l8vKph6+CclXcNDyeWNcgRXk23nR3qX3yA1nUGFj/G
	l2GBYkSGiEKerxdK055xelWBJ7hWvL00TfysBlupKiAcemunwHK/rgf99/LDDXtBr9JRKX9Pd9jrJ
	tzu+HbpvuRVALWyDS9qEzIIdl3ExU7d1mDZtVHz61X1MEkY1W3R9rOnm1kZWp9cd/YLinthJxnpQU
	+DmElD4Om2ma/dquxOlKPIKLvt/MQuadbwBRB/9CqPw8P8dBJLbitJ2A8wDgTYo7vNXHrDLCxjSOJ
	mOFw2YCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoGH-0000000EClV-3EUl;
	Wed, 19 Feb 2025 17:53:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoCq-0000000EBdk-15Vb;
	Wed, 19 Feb 2025 17:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 775D7A42945;
	Wed, 19 Feb 2025 17:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A33DC4CED1;
	Wed, 19 Feb 2025 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739987394;
	bh=1QVCszsYwoEV4SPD2Ug+XLQ1X9GAtUaPJJ4JsX4DaVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VU6TvLGm787LfvptS0TTvQUlSL9tWTKitMKogssmsUzNve619B3DbmezGV7OUvYD1
	 j1CF/mlah6lrCOqVRSgVXTuGHxZvZkqaO/9OaG0R9rNRNXTVemqrNFgruLw6wp3VN5
	 NqlXTgk9UzzloT/l6FNlGjeSa7JS/0uinbWLuQnGJvj4Qz84WAlgfuNvrc9M++btps
	 jVAKdCXzTWfIpzkgnvmKyHkpxBEtLu+2ZkYsRlCp36apwuwxxQbhKbgDMCzqQ6FDav
	 Koq33Va+CB8sus9jqhKzqWj855suAg352tPs9QAbz9G+CYhwkk+AXOyJCafOdGWQLr
	 hMO67dR3MFGnA==
Date: Wed, 19 Feb 2025 23:19:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Message-ID: <20250219174944.l3xdxrdy4lbkevw3@thinkpad>
References: <20250213112416.1610678-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213112416.1610678-1-mordan@ispras.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_094956_434750_79E07D8D 
X-CRM114-Status: GOOD (  22.47  )
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
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: abf42d2f333b ("tty: serial: owl: add "much needed" clk_prepare_enable()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

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

