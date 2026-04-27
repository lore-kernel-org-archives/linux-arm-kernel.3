Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99374FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bK8N1RYsXZ7OryJZ9uHfmG8l0HJuB18neAVGNswJ/rs=; b=UxqtGDSlJSHfC30vS9VKLLShBj
	QJ9f3yp0OP+04YfO7qvykqcnVKOt+3pyw74W8y9P/5yt+SNEX1LXqHpCqq6m38qtNJe0XYXiU9sdO
	06y6Qq7iFBmUQgz/4HXRKQmAVzzXrFh73Axm7JxS6zISiaKEqM/2xq2f6BdZk/xmnf9keZau9WWL/
	fNBOyJVOHQzR/auOdcbzCpPvZ7HfyWisTvwxMsKTNeoOY3B+n18b7aIQDYUBTqtN0ULYB8eDPPZ8Y
	gq7E1SeBFjarrPJXWdDr9KyLsnayMcgJ9+ma2tiLQ/nEwQ5i6qW5f/FkR0e3G7vvmQIF2ZEfKvs58
	nV+jsU7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNBx-0000000H7hY-1dik;
	Mon, 27 Apr 2026 14:44:09 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNBu-0000000H7h7-2qZQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777301047; x=1808837047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xEZviH1Rx0Trs7TNfbXnsRxSsbOwAKS55WHlb0BfwFs=;
  b=Z0hbfwCPAIwDpLTm14HToTJonHgIYxHsLRASjEcwYSPcvlN+APwGDpOS
   gGFuI9BhUayl68/ckduMb0egEr5eeSR6ClBS4oFKeFoPR8Z/jQ61Rzqos
   JUjsRpnUM1xp5kkA2LGmnpce9eRr/ldTSOvKYF+txLr9AUZXlv28IroTA
   B4d7oIt0CLp9efuhWAJRj2Ne96i3+E19u5x8MNr5MmlWlfGFiKx5Bh1v+
   Fo/yKV1kSuuJl16wZID+itIwii1+a5zztEZyPlhTRHgMk/2yofbZBoNP+
   67SQ7g2LEQd6sqYr87gBT6zZnI4nON0jVzRVM6SeYICshxhOxObX9Yky0
   A==;
X-CSE-ConnectionGUID: t2fmeyyzSC2eOIHTKrxdLw==
X-CSE-MsgGUID: W6J/r6WETSGmvZDnSShowA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78248300"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="78248300"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:44:05 -0700
X-CSE-ConnectionGUID: HZMRTky5RgWSWwZjmbXWZg==
X-CSE-MsgGUID: Bb9Y1DJDQmu6NQQfLbze+w==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:43:59 -0700
Date: Mon, 27 Apr 2026 17:43:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	brgl@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v6 2/3] ARM: omap1: use platform_device_register_full()
 for GPIO devices on OMAP 16xx
Message-ID: <ae92LAOy6nRsFb9w@ashevche-desk.local>
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
 <20260427-nokia770-gpio-swnodes-v6-2-b693296c1985@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-nokia770-gpio-swnodes-v6-2-b693296c1985@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_074406_781138_FD12154B 
X-CRM114-Status: GOOD (  14.52  )
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

On Mon, Apr 27, 2026 at 12:46:33PM +0200, Bartosz Golaszewski wrote:
> Ahead of changes attaching GPIO controller's software nodes referenced
> from the Nokia 770 board files to their target devices, switch the
> method for registering the platform devices to the
> platform_device_register_full() variant. This is done to leverage the
> new swnode field of struct platform_device_info which automate the
> software node's registration and assignment.

...

>  	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
> -		pdev = omap16xx_gpio_dev[i];
> +		pdevinfo = omap16xx_gpio_dev[i];
>  
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		res = &pdevinfo->res[0];
>  		if (unlikely(!res)) {
>  			dev_err(&pdev->dev, "Invalid mem resource.\n");
>  			return -ENODEV;

>  		base = ioremap(res->start, resource_size(res));
>  		if (unlikely(!base)) {
> -			dev_err(&pdev->dev, "ioremap failed.\n");
> +			pr_err("ioremap failed.\n");
>  			return -ENOMEM;
>  		}

Isn't this a stray change? Or why then? And why the previous dev_err() is left untouched?

>  		__raw_writel(SYSCONFIG_WORD, base + OMAP1610_GPIO_SYSCONFIG);
>  		iounmap(base);
>  
> -		platform_device_register(omap16xx_gpio_dev[i]);
> +		platform_device_register_full(omap16xx_gpio_dev[i]);
>  	}

-- 
With Best Regards,
Andy Shevchenko



