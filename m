Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3173ED13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 11:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZVio8cvkxkCAcUKP0pXIkXjIVgnIaUFuCYZiRy+dgw=; b=PGdhVPtANlTO+hfdTaevVfZAqz
	Ulc3cJ3fPSSIY7dkGWFKViHNCQjvNxDXxZBcYxV7D2RTDkJSpDI2YHBIHRWNsK9NaoiXIB83InVoV
	OJLXIpIjYEVSL6LS1CimYqiGHmKJZkYJlbQZnGSx+/YnviOiLt7RFo3FB3KcPe/grv1E2aaxPqx59
	bYCo7VBODBHBdunRSgLe/bLRFrQO29Z1iR49rERp61p2p/WuYFdySAsmAcrIfraCdxzt4B1ymVVx0
	JhUO07GyctAAMdDegaVaWCskP411RDDiGyvTE9BKtTr6vaGcVOoC5ElNw6pn+aiC6rJriu7RYrKT5
	d8eUsGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OE4-0000000AcPs-3PKp;
	Mon, 28 Oct 2024 11:48:00 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OAm-0000000AbwR-2Mam
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 11:44:38 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6e9ba45d67fso32652967b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730115875; x=1730720675; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sZVio8cvkxkCAcUKP0pXIkXjIVgnIaUFuCYZiRy+dgw=;
        b=at8f3TLxKLrSLsAYT1nH0TB+kLwxIoWj1SnE0zN495Q5mes9j7nOryzOpcr1Nlm8/P
         ADC1jFU0XVyUH/tY/pA40rSX5bLZZnsww+3O7obW4Qp1qAKtXUuI8orKLTVsr62FQ3Dz
         lHTE8Ql0r80hvUWWfkbRdvjXCe7mdEVqR5fVxnKPGpb0JFkP+tETqlFx4vNgZuF8rB2t
         VvJq50EVCMR5vE+tPjp4XaMP94gZHKHWfslSqsxYAQjAd+8r5QYQPNk6p+3H4zY1dTor
         GL6LSRDtTRylE/WZXv8Q1xrjpJO54wko/Jx/YAPDd0v82wL6gowWhgZ61ZbNF7N5SI7B
         QI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730115875; x=1730720675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZVio8cvkxkCAcUKP0pXIkXjIVgnIaUFuCYZiRy+dgw=;
        b=AQ8U2I3rgdaJlQ5ikPRwpb+vHkV4cqXcurKRpPF5PeE0ev8zwo6iS68Z+h36XnbGsb
         8CFsCAQlI6VoOZmDere/s8Zuq5fvWIxR1PmREeWgjdLxAcXjFIH4JR8It58gnA5GxM+s
         vj0f0eyDaEySC12alpZLCL5zYBFNsdL7G0Ynyaln0e2Tp0fuLNIKOGMCQLsns337+XP2
         DjzS0OI7oUmVhIUrO2gHQkYniS+J+rdyXd59NATY3jNiYgYEfBAfYlQiNVJPMtpG1QI+
         OiJS8zAj8ho5F5e1KznqbtHLcg4XBkz6ZkDLIFEmv+RfMYm/kvK7MKCTAKo5BhwZ2v0r
         S4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgCreT6QVbJTXwdCDpZ0pvqWOnfZSsrE7dv+2SdX4cj1AOUsHgUkuO6Axi9f5Ddv90aAJJMfD98VF/7ewQV9px@lists.infradead.org
X-Gm-Message-State: AOJu0YwTYGWwhUrunkF43rvtmZUnqvJ/vhxXbFFojsb4KfIc0Z35/v1J
	AS9JrCzgTFAqZ5zRXc6Gk9bAMy7HC1yEGtT00jBhx3UzhjeR06cZ0DMBFBvka914ODoI2uVjBHD
	tunzXJpuu6rzNSw058wJble5t7DggZE/CLb/oUA==
X-Google-Smtp-Source: AGHT+IHLKeKx9NpqZxAGiLQJMaILqzRYuWQfYpYj/MQf6dPo+SbTGqn7EpjJInbFkjakb3I2ccTD9UYXD8f0NCsex7M=
X-Received: by 2002:a05:690c:3804:b0:6e3:6467:f46c with SMTP id
 00721157ae682-6e9d89f3b5emr75751517b3.14.1730115875249; Mon, 28 Oct 2024
 04:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241025103621.4780-1-wahrenst@gmx.net> <20241025103621.4780-5-wahrenst@gmx.net>
In-Reply-To: <20241025103621.4780-5-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Oct 2024 12:43:58 +0100
Message-ID: <CAPDyKFqwozGppFLJhjTc86nW1rodZymBbVZr+VpN4e2J3VowMQ@mail.gmail.com>
Subject: Re: [PATCH V5 4/9] mmc: bcm2835: Introduce proper clock handling
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Minas Harutyunyan <hminas@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, 
	"Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org, 
	kernel-list@raspberrypi.com, bcm-kernel-feedback-list@broadcom.com, 
	dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_044436_834001_5F31E0FA 
X-CRM114-Status: GOOD (  24.94  )
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

On Fri, 25 Oct 2024 at 12:36, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> The custom sdhost controller on BCM2835 is feed by the critical VPU clock.
> In preparation for PM suspend/resume support, add a proper clock handling
> to the driver like in the other clock consumers (e.g. I2C).
>
> Move the clock handling behind mmc_of_parse(), because it could return
> with -EPROBE_DEFER and we want to minimize potential clock operation during
> boot phase.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/bcm2835.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index 3d3eda5a337c..107666b7c1c8 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -148,6 +148,7 @@ struct bcm2835_host {
>         void __iomem            *ioaddr;
>         u32                     phys_addr;
>
> +       struct clk              *clk;
>         struct platform_device  *pdev;
>
>         unsigned int            clock;          /* Current clock speed */
> @@ -1345,7 +1346,6 @@ static int bcm2835_add_host(struct bcm2835_host *host)
>  static int bcm2835_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> -       struct clk *clk;
>         struct bcm2835_host *host;
>         struct mmc_host *mmc;
>         const __be32 *regaddr_p;
> @@ -1393,15 +1393,6 @@ static int bcm2835_probe(struct platform_device *pdev)
>                 /* Ignore errors to fall back to PIO mode */
>         }
>
> -
> -       clk = devm_clk_get(dev, NULL);
> -       if (IS_ERR(clk)) {
> -               ret = dev_err_probe(dev, PTR_ERR(clk), "could not get clk\n");
> -               goto err;
> -       }
> -
> -       host->max_clk = clk_get_rate(clk);
> -
>         host->irq = platform_get_irq(pdev, 0);
>         if (host->irq < 0) {
>                 ret = host->irq;
> @@ -1412,16 +1403,30 @@ static int bcm2835_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err;
>
> -       ret = bcm2835_add_host(host);
> +       host->clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(host->clk)) {
> +               ret = dev_err_probe(dev, PTR_ERR(host->clk), "could not get clk\n");
> +               goto err;
> +       }
> +
> +       ret = clk_prepare_enable(host->clk);
>         if (ret)
>                 goto err;
>
> +       host->max_clk = clk_get_rate(host->clk);
> +
> +       ret = bcm2835_add_host(host);
> +       if (ret)
> +               goto err_clk;
> +
>         platform_set_drvdata(pdev, host);
>
>         dev_dbg(dev, "%s -> OK\n", __func__);
>
>         return 0;
>
> +err_clk:
> +       clk_disable_unprepare(host->clk);
>  err:
>         dev_dbg(dev, "%s -> err %d\n", __func__, ret);
>         if (host->dma_chan_rxtx)
> @@ -1445,6 +1450,8 @@ static void bcm2835_remove(struct platform_device *pdev)
>         cancel_work_sync(&host->dma_work);
>         cancel_delayed_work_sync(&host->timeout_work);
>
> +       clk_disable_unprepare(host->clk);
> +
>         if (host->dma_chan_rxtx)
>                 dma_release_channel(host->dma_chan_rxtx);
>
> --
> 2.34.1
>

