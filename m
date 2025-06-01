Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9612BC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 07:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpkYCM2BixhUvQmOUVzn3Ziacs+ECDEW7RUuP0zvjRg=; b=pSrEO6YNOyqqr9J6tNvAjcx+cN
	FY3rKlkD+tiTXS9uaoWXBmBF8JKFE2igPJH/FW3pFWmvKbJAws4elp4RFv5SKZWGhOi/1FTjEemU6
	7BKLAa46r49rDt04B1VfV9dFS+4NuoUzGOT5CBXL+O0kQbp1uDPiT8/HDNQyJoE7wv+fH/pMhqbGU
	SgGgZowa5HWtGCl2RG8NFxu+glbMi1qkhKRxZDsSpEwrwiw6EMn7srPh4krbMaEQgU+wAhvHNWLzU
	vEfzFCoUhTSs3KB0Ll457p4xoI/O4cpLfDRjsX9NQgTjh8ftj+YR0NCZEpZ5HYRNns7jHS0RLXhSJ
	rqmj63Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLdIG-000000052DY-3Fji;
	Sun, 01 Jun 2025 07:39:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLdG8-0000000525U-2bxr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 07:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DB595C24D9;
	Sun,  1 Jun 2025 07:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487FCC4CEE7;
	Sun,  1 Jun 2025 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748763450;
	bh=tyGsOVSDYorh9HaW+EfaNB/Fo+Bsp+pz+XBA+8J64Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ymSV42HNxbQxqmaZXfZpjwNSu5HsUm4XwTm4xBmc+V5rmLm3OPUH8Kqx86fC2CoGn
	 qLyRAvBmsYKgxu7Se7n8VbrFXZ1aZO1YZ3kUdOkehgR5IU/jjH1q5FgUVFdkSAEYcm
	 f6pAsPXQxGN1WrLwwyHOKmTSOFvODJkIoOk6n92w=
Date: Sun, 1 Jun 2025 09:37:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v1 1/2] usb: gadget: pxa25x_udc: Switch to use
 devm_gpio_request_one()
Message-ID: <2025060110-smooth-flatten-590f@gregkh>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
 <20250531212331.3635269-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531212331.3635269-2-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_003732_896676_68B2FD1B 
X-CRM114-Status: GOOD (  12.19  )
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

On Sun, Jun 01, 2025 at 12:21:38AM +0300, Andy Shevchenko wrote:
> devm_gpio_request() is going to be removed. This driver is only user of that
> API. Convert it to use different API.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/gadget/udc/pxa25x_udc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

