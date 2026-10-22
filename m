Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EA9606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SrTNkSR9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nKpgdfCWqF+9Q5MR5EBAQAUQb+BD1snzTotJ0iQU74U=; b=SrTNkSR92UdD86oQdmwqFm1eVq
	oQT5KAcJe23XaTJd6wyGTL69oBVT9ticEFNtxU/hgXWUIP3GHeopX4sxwaIAPGYW66oYnVr0o3DWC
	fRX5wJAuQXvePgm62l8AeQtlxaJw6f0PliFvEZ+XgumsNaYtWz1azd1L6l9ZRlzPUin4DQWxbJkxW
	tLEb0c9yZB0ufDQoud6/Fzz3zPrXQR4QF7B2MkxiPGIlvUOaWZXrMQz/pKLEgbouYAlRfKBm7Xh6b
	d1UwGSbWgaoXo2JDjAvXuRaqaRUa0TElk9HWu2kVMH4DBdyyXmPYrnvrX1NbQoCV+3Kka91JrCpOa
	2rDRvg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxvn-0000000El2q-2bvJ;
	Thu, 22 Oct 2026 18:54:27 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxvk-0000000El0Z-0Iko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:54:26 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xJxva-00029V-00; Thu, 22 Oct 2026 20:54:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E4FE9C0423; Thu, 22 Oct 2026 20:50:40 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:50:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 4/7] MIPS: BCM47XX: Open code gpio_request_one()
Message-ID: <atpbABKiC2KlCxeU@alpha.franken.de>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <20260715185112.1323510-5-andriy.shevchenko@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715185112.1323510-5-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_115424_285449_7837BC2B 
X-CRM114-Status: GOOD (  21.27  )
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Jul 15, 2026 at 08:46:44PM +0200, Andy Shevchenko wrote:
> Open code the gpio_request_one() call to be able to kill that API
> in the follow changes.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/mips/bcm47xx/workarounds.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/bcm47xx/workarounds.c b/arch/mips/bcm47xx/workarounds.c
> index 745c6228eb2c..9148d2c219d1 100644
> --- a/arch/mips/bcm47xx/workarounds.c
> +++ b/arch/mips/bcm47xx/workarounds.c
> @@ -9,11 +9,13 @@ static void __init bcm47xx_workarounds_enable_usb_power(int usb_power)
>  {
>  	int err;
>  
> -	err = gpio_request_one(usb_power, GPIOF_OUT_INIT_HIGH, "usb_power");
> -	if (err)
> +	err = gpio_request(usb_power, "usb_power");
> +	if (err) {
>  		pr_err("Failed to request USB power gpio: %d\n", err);
> -	else
> +	} else {
> +		gpio_direction_output(usb_power, 1);
>  		gpio_free(usb_power);
> +	}
>  }
>  
>  void __init bcm47xx_workarounds(void)
> -- 
> 2.50.1

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

