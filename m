Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AAFC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRit7Gfx5uba8dm8erPWOFTIgUtnZEAD4/wvQacClUI=; b=GZaZRxDnbepXsNFyBPF4HNPKsN
	OG1oDUG/ZGZ1shP3hchx41Vfyr610TdNlAKoPr76avrs2zw+eq9q3kX8+Ad5q4lN9UBEWIBMEzQTb
	tDPtyiM71tBepmtMRbPphsKNynoGow7wG3reNJYm3wpoQtbS1Jlh6J2qLVT2lgvgO5h4l1jymkoqv
	j477W8TkCzhGbU6e8r/8ZqA2bSDj95CU/yCr7akv/LzdDVjUjMMS/uLE6cwzuQMLF/67x9vZMI6BO
	ywWGZAVpo8EvkDFbGHZibTy4dQWjvN05b51Vn/DoR9ppV1ZM7zyluKqsExe07P2cZo8BPlGjIMkmm
	KJ0b6z6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI1Q-00000002OBz-0Fye;
	Mon, 27 Jul 2026 09:53:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI1P-00000002OBa-2Pox
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:53:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5695D43A3C;
	Mon, 27 Jul 2026 09:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8F11F00A3A;
	Mon, 27 Jul 2026 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785145999;
	bh=aRit7Gfx5uba8dm8erPWOFTIgUtnZEAD4/wvQacClUI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=R3ekCTATANXRCgeXbpg4OzWZIkyInp1FJvNGcPQL0E/D1QA8R3VmWg0dDglcO62xl
	 gVcXhZwnQIizWbw3T+nRboftquu6MgwhJQBtjWbjHnqFSVEM6Xea1qgTHdZ93DCfbi
	 qk4PjHMQq9CtgxGzzZ8ODwLPjVx2jvFWp3OJbxfiv8cLTDIMOu5yzZ6RhPRBfgmeZk
	 284IEiBedMkOR1jXq9wfUPa1hppMvOC6PhzyrgVxLIvE5kF/Ny5VWqAqNXw1vPpeYu
	 WWsnTXCMXOw+EFBEdrn8GWIl+s21aHVCa4SjGQcTX1LOYefMdl5lt6imvEZCE5NvYf
	 n0KYnl+j4B8Cw==
Message-ID: <9ecea779-4f11-41e2-95b8-e92ab5302158@kernel.org>
Date: Mon, 27 Jul 2026 11:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v1 3/7] media: em28xx: Open code gpio_request_one()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <20260715185112.1323510-4-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260715185112.1323510-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

On 15/07/2026 20:46, Andy Shevchenko wrote:
> Open code the gpio_request_one() call to be able to kill that API
> in the follow changes.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/usb/em28xx/em28xx-dvb.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
> index ef148a27c94d..d7f8dcf27900 100644
> --- a/drivers/media/usb/em28xx/em28xx-dvb.c
> +++ b/drivers/media/usb/em28xx/em28xx-dvb.c
> @@ -742,18 +742,14 @@ static int em28xx_pctv_290e_set_lna_gpio(struct em28xx *dev, u32 lna)
>  #ifdef CONFIG_GPIOLIB_LEGACY
>  	struct em28xx_dvb *dvb = dev->dvb;
>  	int ret;
> -	unsigned long flags;
>  
> -	if (lna == 1)
> -		flags = GPIOF_OUT_INIT_HIGH; /* enable LNA */
> -	else
> -		flags = GPIOF_OUT_INIT_LOW; /* disable LNA */
> -
> -	ret = gpio_request_one(dvb->lna_gpio, flags, NULL);
> -	if (ret)
> +	ret = gpio_request(dvb->lna_gpio, NULL);
> +	if (ret) {
>  		dev_err(&dev->intf->dev, "gpio request failed %d\n", ret);
> -	else
> +	} else {
> +		gpio_direction_output(dvb->lna_gpio, !!(lna == 1));
>  		gpio_free(dvb->lna_gpio);
> +	}
>  
>  	return ret;
>  #else


