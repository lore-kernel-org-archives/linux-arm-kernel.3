Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76171CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fD0chabwe5cCeQ1rhyz+lk+x7E2Y1IcdIVJxph3iDvQ=; b=IRR3E0Y44I53m+E4OWonxCwMyi
	4M9p7vMNZSvqlP+/uvY1JnLZAH/eZhTEzRq45UE8537qfW6th+MZU7CR6kl2WiVbXsDg9ibhCOIK3
	mylhpS8oK/WoiFKPfwTmm/qSViEvVmavF5xVcraCIsdCxmoUwD7HN/svgXe7VT7NYuIcgacai/Pv7
	+/ymg/Wopvc4bXUCvMWpj937usvfNAnyhqvjS/SY3cvU8tnBdONRMZ7armPu81ZeAYql0KxdopLCJ
	sqCkLctrlQimcoWSWOGEyl5iRPosCucP6IU9+ng8A3I/QC7Toq8Vs3afgudLw479AK59OyIQpN0+Y
	/hDMqSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNb2-0000000E5ZP-2iMD;
	Mon, 27 Oct 2025 13:49:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNb1-0000000E5ZI-3ymc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 13:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAFEE6053B;
	Mon, 27 Oct 2025 13:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68862C4CEF1;
	Mon, 27 Oct 2025 13:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761572954;
	bh=BuQRZjoRLkFIeOGFeXAe+MJwyKbmh8gpiipXAD2WStQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YKJnhYhi7MR1rlWeQ7DklQ2nj+h4F/83VYrR90V9o5czk7DZaFlRPgwI7y2AwVwPA
	 j8PvG6WhZdZ3PmJCzvNx/OwuEOB5OZZnP/OVPDl5TzK5+90LGMN8e7rkv3UfdSuhF2
	 J8sVS0k3G8IU9oue3aWVz3wKvWDnweV4+UhcCfBrv+Rixs+ir0hqvhYCGmwgRuZxhM
	 /zloM/HdZgQ7I/kqvJxZcNLH9Fs5gIW+w+5MCtCGilGeHPI6r5tWme4KbXkYHchNR/
	 k+jStBqA2Klto/H43yjyOpPSO7/uv65SFYmX82Z1Ev2cXSQRpZuEs01+uI9MpRC7+8
	 W5GCdjOfzs6GQ==
Date: Mon, 27 Oct 2025 13:49:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: eugen.hristev@linaro.org, alexandre.belloni@bootlin.com,
 lars@metafoo.de, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com
Subject: Re: [PATCH v2] iio: adc: at91-sama5d2_adc: Fix potential
 use-after-free in sama5d2_adc driver
Message-ID: <20251027134908.36d63b9f@jic23-huawei>
In-Reply-To: <268cbf0a5d9b931fcf6c025c53cc698ce78e4689.1760946527.git.xiaopei01@kylinos.cn>
References: <e9d6831a-d0ef-440c-b235-fec18048deed@linaro.org>
	<268cbf0a5d9b931fcf6c025c53cc698ce78e4689.1760946527.git.xiaopei01@kylinos.cn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 20 Oct 2025 15:49:25 +0800
Pei Xiao <xiaopei01@kylinos.cn> wrote:

> at91_adc_interrupt can call at91_adc_touch_data_handler function
> to start the work by schedule_work(&st->touch_st.workq).
> 
> If we remove the module which will call at91_adc_remove to
> make cleanup, it will free indio_dev through iio_device_unregister
> while the work mentioned above will be used. The sequence of operations
> that may lead to a UAF bug is as follows:
> 
> CPU0                                      CPU1
> 
>                                      | at91_adc_workq_handler
> at91_adc_remove                      |
> iio_device_unregister(indio_dev)     |
> //free indio_dev                     |
>                                      | iio_push_to_buffers(indio_dev)
>                                      | //use indio_dev

Hi,

I'm not completely following your description here.
The free doesn't happen in iio_device_unregister() but quite a bit later.
So either the problem you are seeing is actually devm_ tear down that
will do the free, or it's a more specific action in iio_device_unregister()
though I'm not sure what it might be. Possibly a specific buffer mask
getting torn down?  I haven't analysed it closely enough to figure out if
there is a race there but it's the only thing I can immediately spot that
would even be of interest to a work item in a driver via some core interfaces.

Other than working out exact cause for anyone looking at this later, I'm
also not sure you don't leave a potential race where a fresh request comes in
between that cancel_work_sync() and the iio_device_unregister() call as it
is only when iio_device_unregister() is complete that all interfaces are torn
down that could start a fresh capture.

So were the cancel_work_sync() one line later I would have been happy but
from your description I'm not sure that fixes the bug you are seeing!

Jonathan



> 
> Fix it by ensuring that the work is canceled before proceeding with
> the cleanup in at91_adc_remove.
> 
> Fixes: 3ec2774f1cc ("iio: adc: at91-sama5d2_adc: add support for position and pressure channels")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index b4c36e6a7490..1cd6ce61cf17 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -2480,6 +2480,7 @@ static void at91_adc_remove(struct platform_device *pdev)
>  	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
>  	struct at91_adc_state *st = iio_priv(indio_dev);
>  
> +	cancel_work_sync(&st->touch_st.workq);
>  	iio_device_unregister(indio_dev);
>  
>  	at91_adc_dma_disable(st);


