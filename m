Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BCAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9zwjCj6EBJRZwuako70jsyhbW+Mce+32hY+E/9TnlI=; b=mE9gr5aeorFupkPFBAnEtTnJj4
	29aX8I5LYpB6UVtKTeiYqH5MLiTnd6WKO+K6Dt0++urLqMbIv40NY0CWJGCSHyOqmtKHeNuAzZbhO
	4dfilaeW1DfF/qh1TW1K1z9c/Da+W+mJ+xIR6wCIeQMVoqJQbI/5X/MV9FDCSeKcKAbP2HaWhpAxV
	89zaOUtDwMl+/MAQKEK25rR9qBsuP8FEyuAta1HmpwReBxqoVoTdG4RFH7McvKDkNtV0hUkeeWGKD
	OVBSWZhRAjOqwy7RYv20ZNQ4hdNECboo9T/MAbGI6y3jS5jDhIyxPk9kexazRLhnpYgfb6DY9pNzv
	WuHT80tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNabU-0000000EDtL-0W0x;
	Tue, 17 Dec 2024 16:39:24 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaS1-0000000EBMH-3Twt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 16:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1734452970; x=1735057770; i=wahrenst@gmx.net;
	bh=n9zwjCj6EBJRZwuako70jsyhbW+Mce+32hY+E/9TnlI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Sduztu2dzkh+F63ImWLjVCtaxFvnk8myIrUqxHjsmeNJEC6qi6VTC89A8PFby0JV
	 D8szjnTPkyePT2HUTKfLNR0aFTZ+5gYg9BbGF8ZXvibPraZAZG6W+RLBOscZffo2z
	 eFlRzk6L/IWGYL4fFsz/owBuCxVA9jbRckvvuIBzBs3elN5nz7eIeGwF+xmTjwZ3D
	 T+tAueB2+eFEqbB+3lkQSKZkaEyP33nrbr91p8tFFfklt0fg3dDW5DGYLWuUi84/A
	 qLNHXUrZrHnePF56IdA9CB1zHO09251XvC5/QE168qaag4cwXag+1xGrC1hSbxtCb
	 G02RG6GerC75G2mGFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.106] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ3t-1t2Sf136pR-00UshK; Tue, 17
 Dec 2024 17:29:30 +0100
Message-ID: <da2113a5-301b-4421-a651-9922d4ffb0de@gmx.net>
Date: Tue, 17 Dec 2024 17:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7] dmaengine: bcm2835-dma: Prevent suspend if DMA channel
 is busy
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org
References: <20241204165546.77941-1-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20241204165546.77941-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Da3P5oCeg9aKX6VLje1ZWdJ4c+FGgHfiqv1Puf3Sy97Cv4z2cB5
 Fl0ro4tXVQuFhUqUuaL60prR20rnCXE/nTI+XOaYHUai38ZWOL8kqK8WphB/YfacqgRemqy
 ECxzarKJW38gTyNX4pdg0euqPrXmkwvA5cfFtY/LicFUmTHo6F3I7A9Lgy4/rWas6GpASv4
 HMquwGzCoNKfCH+gBay9Q==
UI-OutboundReport: notjunk:1;M01:P0:x3XvP3T0YLE=;yI4GKni3/dyqiiUPmfbmS+zpBZJ
 Feag4HlOU+ySnEZ8ZD+E1IcFix5V0zYqmi6lGgp/Pa9YUSdCZptOyPWGF+xgiOj3f//Zpy8CE
 NN581qddagMEZpgK5Hn4bF0/BmPPxCApzobrQk8KPOlfiqkj8nVB6VElF36JK2nOidKCce/Vz
 hmBeUYRRAwcy0ZQ+9Eb6UEPlTpXOTYXBZWus1d83IDfhdQjRoRrsCW4l90s+AkoC6GWDpc1ST
 Lj9hm87pdqxZ/iqvmDMLXPYmRbH60+APp05kjF9AnD9GjT+P9NoFl9/FWpJruy2/fwSOo7m/I
 MtBkhRh6FfdRboRiwHzYx1KFDjh0Z9PRiacDDaBijHQEW3sgvazJKIf8Xf2PSFD9p+5ea7AcU
 3sS+pGbA8qwAe5l7MeSuGjU48JkUHP48oync8nKTb0NJVy/mw7M5rQrA4g7TtckHpXtGbxBI/
 A1dZKvw9J4qEp1g3TjDus4TtN9RlbSm10W0a7g+6NZpryFZlx4B5C+oNeZ/RuebyoDn/buVZ4
 Gc69nq+FkKZ+6SUvicGqNwksFHZpf6OujN3rcRufZvT23C5NGqekusC9TggKOjAZM+juLQTxk
 z3nLJDljC0RastSguHrVs7G88Kgu+4xTZib0J8+oJRR1KK6WLoJ6PU1trBR2JMA8zGjIlKGq8
 5tsG9rRk0eeFf/MvubsIERbzbIcm6tLdXyNlJ/t/s0wodwb8lQTHRAxA23YZEKBpfQEwMAoiG
 sski7S9nKqcjsLUrO1eHG4ZFYmalRQH/rWKfOavh3k9XVx6lbbV5z9IbdlECItSuzEG3aPFfV
 jqe8i1hhGpmqEQw/kB0dNz5fzsGphd1H6NEEO5wAfwoTdJLw8OzUqIHU9jf+laP45r7dh0Wdq
 h8f7/g3kU6EOnKi9jR46bi9r99ewoGJEAQYEVZZ9lU3fyWy4XoAZQyODRRcxavyJRZHzIzo/z
 KAc8wziUh/ADBH5IuT5NCbv8xmIvTjrRKobgrr023zi0csEoBt2DFxCGj2iA5ImXBalL5irfU
 bzUVRAt2kH1IayBSvOKTAJsOjSUqHYCEJ5+FQ9zmTcdrnxwOSbUe07GPDkzo2r8obiDyoiqSK
 ZqGlJIDFTVJCBJ3ftH3I/vWl1Mluk0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_082938_164634_3E3B53A5 
X-CRM114-Status: GOOD (  23.05  )
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

Am 04.12.24 um 17:55 schrieb Stefan Wahren:
> bcm2835-dma provides the service to others, so it should suspend
> late and resume early. Suspend should be prevented in case a DMA
> channel is still busy.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
gentle ping ...
> ---
>   drivers/dma/bcm2835-dma.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> Changes in V7:
> - improve patch title and changelog
> - add explaining comment and drop warning in suspend
> - drop empty resume callback
>
> Changes in V6:
> - split out of series because there is no dependency
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 7ba52dee40a9..20b10c15c696 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -875,6 +875,27 @@ static struct dma_chan *bcm2835_dma_xlate(struct of_phandle_args *spec,
>   	return chan;
>   }
>
> +static int bcm2835_dma_suspend_late(struct device *dev)
> +{
> +	struct bcm2835_dmadev *od = dev_get_drvdata(dev);
> +	struct bcm2835_chan *c, *next;
> +
> +	list_for_each_entry_safe(c, next, &od->ddev.channels,
> +				 vc.chan.device_node) {
> +		void __iomem *chan_base = c->chan_base;
> +
> +		/* Check if DMA channel is busy */
> +		if (readl(chan_base + BCM2835_DMA_ADDR))
> +			return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops bcm2835_dma_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late, NULL)
> +};
> +
>   static int bcm2835_dma_probe(struct platform_device *pdev)
>   {
>   	struct bcm2835_dmadev *od;
> @@ -1033,6 +1054,7 @@ static struct platform_driver bcm2835_dma_driver = {
>   	.driver = {
>   		.name = "bcm2835-dma",
>   		.of_match_table = of_match_ptr(bcm2835_dma_of_match),
> +		.pm = pm_ptr(&bcm2835_dma_pm_ops),
>   	},
>   };
>
> --
> 2.34.1
>


