Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D9FC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy0+KiYRcsZU/ymaImEymSgtU/XBNCGbs6mGpoeZE6k=; b=hUuyVFKXM0zvd2AMAMN91qSQpO
	0Ae0FiV7ZMTLNaw0cJf06bMN5n/CaWMbc3molbsRuYxqJXw5rLaXHU6Ox2k6XBMXUBO2y3GhSC6cj
	VquWooNlBGfq3KpuW9zY0sGHL3KCW5VA5nRVZXtBlBTlqClemH95U9IJyFD+6knZLXfdhY85osmbx
	kkTx8p6rHoDQfOnMYwUqEE/3KFOjTJPL70k5e/LLWaUaYoiUQnm6kUFMLjwH3o6lc7Tnxo74LZ0QF
	CK6TwhlzfK/ymrkJV8yTiyFB2JIeQP9IbdtQoIVZxArf/Tl4TSyA1PPeNC8drIvdEo2QbaOMVB8iB
	74b4pH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eC3-0000000AKuv-249K;
	Thu, 24 Sep 2026 07:48:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eC2-0000000AKuM-0RuP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:48:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F2BE41FCE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 07:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5BE1F008A0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 07:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236113;
	bh=fy0+KiYRcsZU/ymaImEymSgtU/XBNCGbs6mGpoeZE6k=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=V5HvV/cppc8WVHeYIUCIXT0ZwvIwN5DV+RLZY47pD8guzaGDfj/dnMoFxRzTTHB0n
	 /38S30rCAnpbGCsd4ksLMB4e2lKDjbDv0+M/tFkBlxKX7dsniGIUsVOYXXUV3WIwXE
	 ZOgalRrjGdyy7odLe9kgx9Xb+uVpOMw+fNPt9s7q70KWLEvPZMRPseT6iYC8meocf7
	 TRAECxi49YbEyKyau2RPZ8iRxs3TXum6k6LuN9Cwo/PsYAUoxYSJeCRgYr4tW1smvl
	 A2qEwYhLCC1/82PR2F5GaoUW5uN9z+0RsK++iwmmyB3d7v9Ut6rUJA77I6tavwLCyg
	 C1mOLaiU65JFg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso603120e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 00:48:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxoxbdWObxymaMVBqzVLXQisaXbkqHIOQ2Sb8WlH77JAyLdaQxEIedmleuX1N5HiBAxYhdderorQk5wBbC0YOTk@lists.infradead.org
X-Gm-Message-State: AFuF++kR0kNJSuQ5/4d15JiStyqc6lDZbZ9K0C8Avv6ZHt7SA0oik3AQ
	9qflsR15hqLrYT2x6JFB2n1agCdGnSqc6QLapryscnZZDD13vBQn6JzfWa5bf6cS4UdGjdTv5MQ
	ukgDxVcqgK8phH/kUjoc29vbvW2I+EVzeycadAifMpw==
X-Received: by 2002:ac2:4112:0:b0:5b6:10bc:b86a with SMTP id
 2adb3069b0e04-5b8df0e31cfmr327732e87.24.1790236111912; Thu, 24 Sep 2026
 00:48:31 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 00:48:29 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 00:48:29 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260923184450.135601-1-2000.costalucas@gmail.com>
MIME-Version: 1.0
References: <20260923184450.135601-1-2000.costalucas@gmail.com>
Date: Thu, 24 Sep 2026 00:48:29 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeqkCM=QP_mUcGg130UrjnB58S9j636zZqriEqEVdGGXQ@mail.gmail.com>
X-Gm-Features: AclHuK-Z4kbLfsNuY9cD-lwa9fSqwcZM3BY76R7SUB6NbTYvyq7es4e_Zfoq3eY
Message-ID: <CAMRc=MeqkCM=QP_mUcGg130UrjnB58S9j636zZqriEqEVdGGXQ@mail.gmail.com>
Subject: Re: [PATCH] spi: bcm2835: fix device_node reference leak in bcm2835_spi_setup()
To: Lucas Costa <2000.costalucas@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, bcm-kernel-feedback-list@broadcom.com, 
	linux-spi@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 23 Sep 2026 20:44:50 +0200, Lucas Costa
<2000.costalucas@gmail.com> said:
> of_find_compatible_node() returns a device_node with its reference count
> incremented, but the function bcm2835_spi_setup() uses the ret value
> in the loop to check a condition and never releases it.
>
> Store the returned node and drop it with of_node_put() before breaking
> out of the loop.
>
> Fixes: e19c1272c80a ("spi: bcm2835: Restore native CS probing when pinctrl-bcm2835 is absent")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
> ---
>  drivers/spi/spi-bcm2835.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
> index 8f8715809c7c..8909757c94e3 100644
> --- a/drivers/spi/spi-bcm2835.c
> +++ b/drivers/spi/spi-bcm2835.c
> @@ -1226,6 +1226,7 @@ static int bcm2835_spi_setup(struct spi_device *spi)
>  	struct bcm2835_spi *bs = spi_controller_get_devdata(ctlr);
>  	struct bcm2835_spidev *target = spi_get_ctldata(spi);
>  	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
> +	struct device_node *np;
>  	static const char * const pinctrl_compats[] = {
>  		"brcm,bcm2835-gpio",
>  		"brcm,bcm2711-gpio",
> @@ -1297,8 +1298,11 @@ static int bcm2835_spi_setup(struct spi_device *spi)
>  	}
>
>  	for (i = 0; i < ARRAY_SIZE(pinctrl_compats); i++) {
> -		if (of_find_compatible_node(NULL, NULL, pinctrl_compats[i]))
> +		np = of_find_compatible_node(NULL, NULL, pinctrl_compats[i]);
> +		if (np) {
> +			of_node_put(np);
>  			break;
> +		}
>  	}
>
>  	if (i == ARRAY_SIZE(pinctrl_compats))
> --
> 2.43.0
>
>

Just use cleanup.h like so:

	struct device_node *np __free(device_node) = of_find_compatible_node(...);

It's a oneliner this way.

Bart

