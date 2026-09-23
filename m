Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F22C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCkKiUkI5CBIxSOf3Rl7yoSbI+AcG0DMzQZmanndQ7Q=; b=W0Icw712LzWdDN7fl/6t6vVTXR
	Mv/CHw73HsAqOxWLsmutp+8fFXbl6quznMeoiujsTL8j6hWIDRujNZb4fj6QkTSvhFm2mtltot2Ry
	M2lA78OQzOuDsdJRbX1pDnbPibGRDd8+E1IObZ85veSZRZ1YaXPjcnavIFx3v6kGvJ56tTECy5cXy
	kBW0GBU6z2X2RFoh1NPRQpdbXAmKt/HD/YMtXuG3TCga7ibvxQgxqjK7RNLgbrkQ6TcQ3DvLILNHr
	BI5p9dCDy07u9g82N1rwkw4UCXtf/GmN2vyoUSxbqHpH9lhqsuuiRuKCJRpJZ620PZc8ay+iV3Pai
	FjVzfOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K0t-00000007rp3-3HZk;
	Wed, 23 Sep 2026 10:15:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K0s-00000007ron-1uOF;
	Wed, 23 Sep 2026 10:15:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A55243890;
	Wed, 23 Sep 2026 10:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579C51F000FF;
	Wed, 23 Sep 2026 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790158542;
	bh=cCkKiUkI5CBIxSOf3Rl7yoSbI+AcG0DMzQZmanndQ7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1TUgeNDJyGUoHMu/7rF9Ji1boADsBw1BJyz35sEUatTZhXYmj08V9bUcE1ybhn28W
	 EdImQ5WA/1qzuUeX26KQCb/97MOuqzjtUCUVc1gddBnydJ1akeGHsEhBYWZM6uMsqb
	 oshEVtAX94ty+yZr6i8IqJQpqD++YdebYHPlWl9g=
Date: Wed, 23 Sep 2026 12:15:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	linux-serial@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] tty: serial: meson: fix UART driver lifetime
Message-ID: <2026092344-unlawful-hurling-c87e@gregkh>
References: <20260913034148.15068-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913034148.15068-1-mhun512@gmail.com>
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

On Sat, Sep 12, 2026 at 11:41:48PM -0400, Myeonghun Pak wrote:
> Moving Amlogic UART registration into probe left the first driver
> registration behind if uart_add_one_port() failed. Adding the separate
> ttyS driver later also exposed a global last-port test: removing the last
> port of one driver kept it registered whenever the other had a port.
> 
> Track whether probe registered the driver and undo it when port addition
> fails. On remove, retain the current driver only if a remaining port maps
> to that driver. Serialize the shared lifecycle decisions against parallel
> probe and remove operations.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: bcb5645f99ef ("tty: serial: meson: redesign the module to platform_driver")
> Fixes: e71aab9d6132 ("tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI:GPT-5.6
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/tty/serial/meson_uart.c | 52 +++++++++++++++++++++++++--------
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index a6cb2a535..4bd9d9826 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -12,6 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -80,6 +81,7 @@ static struct uart_driver meson_uart_driver_ttyAML;
>  static struct uart_driver meson_uart_driver_ttyS;
>  
>  static struct uart_port *meson_ports[AML_UART_PORT_NUM];
> +static DEFINE_MUTEX(meson_uart_mutex);
>  
>  struct meson_uart_data {
>  	struct uart_driver *uart_driver;
> @@ -692,6 +694,16 @@ static struct uart_driver *meson_uart_current(const struct meson_uart_data *pd)
>  		pd->uart_driver : &meson_uart_driver_ttyAML;
>  }
>  
> +static bool meson_uart_has_ports(struct uart_driver *uart_driver)

As you require a lock to be held here, document it properly so the
compiler will catch it when you get it wrong.

> +{
> +	for (int id = 0; id < AML_UART_PORT_NUM; id++)
> +		if (meson_ports[id] &&
> +		    meson_uart_current(meson_ports[id]->private_data) == uart_driver)
> +			return true;
> +
> +	return false;
> +}
> +
>  static int meson_uart_probe(struct platform_device *pdev)
>  {
>  	const struct meson_uart_data *priv_data;
> @@ -702,6 +714,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>  	int ret = 0;
>  	int irq;
>  	bool has_rtscts;
> +	bool registered = false;
>  
>  	if (pdev->dev.of_node)
>  		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
> @@ -731,11 +744,6 @@ static int meson_uart_probe(struct platform_device *pdev)
>  	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
>  	has_rtscts = of_property_read_bool(pdev->dev.of_node, "uart-has-rtscts");
>  
> -	if (meson_ports[pdev->id]) {
> -		return dev_err_probe(&pdev->dev, -EBUSY,
> -				     "port %d already allocated\n", pdev->id);
> -	}
> -
>  	port = devm_kzalloc(&pdev->dev, sizeof(struct uart_port), GFP_KERNEL);
>  	if (!port)
>  		return -ENOMEM;
> @@ -748,11 +756,22 @@ static int meson_uart_probe(struct platform_device *pdev)
>  
>  	uart_driver = meson_uart_current(priv_data);
>  
> +	mutex_lock(&meson_uart_mutex);

guard?

thanks,

greg k-h

