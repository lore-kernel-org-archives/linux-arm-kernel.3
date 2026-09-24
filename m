Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD53C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knoFi3k7NZ5o9aDBThxhQL7/bpBgTq1/C7qd7AUxxy4=; b=kgJiVR8L8P0u+NV2hXVG4uQr2N
	HRbGRkcvf+clKvUIbJ44XYl0BiuaECTsqw+bI8pxf+izTEPV+MnLc2HiEuVlxe6iyA9TiYnT7D34a
	p58I8w9A31SsN1YEmaMXH3N8VDtKC/itwEzMaBFZ9wPpQb9e+IBIdhrpo5LdIcnnhJ869RiCaE1e1
	vcKj80jd244hQztvq0JGYKKbv4d6Jt27K5TAh2X38RjG+0abg2wm969cIhyA6CymMVYQ78Wlr3+CG
	Z8p/+hYHw4b+LvBMavmkFPXhB3WAbBoBdW0X29EAF/7klAVCoReStVcMjv/eajBuTfIooZdSERiY5
	GA5FK/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fQg-0000000AXVT-45fd;
	Thu, 24 Sep 2026 09:07:46 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fQd-0000000AXUt-2MAq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:07:45 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 24 Sep 2026 18:07:39 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id A9FBD20914A4;
	Thu, 24 Sep 2026 18:07:39 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 24 Sep 2026 18:07:39 +0900
Received: from [192.168.1.135] (unknown [10.213.44.71])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 81E0110A019;
	Thu, 24 Sep 2026 18:07:38 +0900 (JST)
Message-ID: <97e4ab26-b147-4cf4-97f9-307903f14e61@socionext.com>
Date: Thu, 24 Sep 2026 18:07:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()
To: Malathi A <malathi.a2000@gmail.com>
References: <20260917040511.103232-1-malathi.a2000@gmail.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260917040511.103232-1-malathi.a2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_020743_730913_1D143CB9 
X-CRM114-Status: GOOD (  28.99  )
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

Hi Malathi,

On 2026/09/17 13:05, Malathi A wrote:
> uniphier_uart_probe() enables priv->clk by hand and is then responsible
> for disabling it again on every error path. It misses one: when
> uart_read_port_properties() fails the function returns directly, leaving
> the clock prepared and enabled. The neighbouring path, taken when
> serial8250_register_8250_port() fails, does call clk_disable_unprepare(),
> which shows the leak is an oversight rather than intent.
> 
> Rather than adding another manual unwind, switch to
> devm_clk_get_enabled() so the clock is released by devres. That removes
> the error path entirely, along with the explicit disables in the
> register failure path and in uniphier_uart_remove().
> 
> The clock is still disabled and re-enabled by hand across system sleep,
> which stays balanced: only SET_SYSTEM_SLEEP_PM_OPS is used, so the
> device cannot be unbound while suspended and devres always sees an
> enabled clock at detach.
> 
> Found by smatch:
> 
>    drivers/tty/serial/8250/8250_uniphier.c:232 uniphier_uart_probe() warn:
> 'priv->clk' from clk_prepare_enable() not released on lines: 205.
> 
> Fixes: 26e8349c0d76 ("serial: 8250_uniphier: Switch to use
> uart_read_port_properties()")
> Signed-off-by: Malathi A <malathi.a2000@gmail.com>
> ---
> Changes in v2:
> - Use devm_clk_get_enabled() instead of adding a clk_disable_unprepare()
>    to the failing path, as suggested in review. This also lets the
>    explicit disables in the serial8250_register_8250_port() error path and
>    in uniphier_uart_remove() go away.
> - Reworded the commit message accordingly.
> 
>   drivers/tty/serial/8250/8250_uniphier.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_uniphier.c
> b/drivers/tty/serial/8250/8250_uniphier.c
> index e3db60bf50c9..6fffac12277a 100644
> --- a/drivers/tty/serial/8250/8250_uniphier.c
> +++ b/drivers/tty/serial/8250/8250_uniphier.c
> @@ -180,16 +180,12 @@ static int uniphier_uart_probe(struct
> platform_device *pdev)
>   
>   	memset(&up, 0, sizeof(up));
>   
> -	priv->clk = devm_clk_get(dev, NULL);
> +	priv->clk = devm_clk_get_enabled(dev, NULL);
>   	if (IS_ERR(priv->clk)) {
> -		dev_err(dev, "failed to get clock\n");
> +		dev_err(dev, "failed to get and enable clock\n");
>   		return PTR_ERR(priv->clk);
>   	}
>   
> -	ret = clk_prepare_enable(priv->clk);
> -	if (ret)
> -		return ret;
> -
>   	up.port.uartclk = clk_get_rate(priv->clk);
>   
>   	spin_lock_init(&priv->atomic_write_lock);
> @@ -222,7 +218,6 @@ static int uniphier_uart_probe(struct platform_device
> *pdev)
>   	ret = serial8250_register_8250_port(&up);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to register 8250 port\n");
> -		clk_disable_unprepare(priv->clk);
>   		return ret;
>   	}
>   	priv->line = ret;
> @@ -237,7 +232,6 @@ static void uniphier_uart_remove(struct
> platform_device *pdev)
>   	struct uniphier8250_priv *priv = platform_get_drvdata(pdev);
>   
>   	serial8250_unregister_port(priv->line);
> -	clk_disable_unprepare(priv->clk);
>   }
>   
>   static int __maybe_unused uniphier_uart_suspend(struct device *dev)

I'm a bit concerned about the error path in uniphier_uart_resume().
The clock may have been disabled in uniphier_uart_suspend(), and
clk_prepare_enable() can fail when trying to enable it again.

In that case, wouldn't devres try to disable an already disabled
clock on detach?

Thank you,

---
Best Regards
Kunihiko Hayashi

