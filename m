Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95FFFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+PxzyIDMSNTPdLdO/2w4/bzUVXlqXaseNxcJhjP7Mw=; b=ji1yX1x0I/POitRXUdVVI7XPFv
	TdJgcXmcJwEOVIgZFd5/24zJ37GJu92y8gFx7Q4INYOis1THVWBsq24R6t9V05QnjDm/WWtTxmE0N
	P+3mcPGx4op0NtSMR0JPRZxq/JRST3NmqqDsZJYX7OulTLwJYRO2rVlcluKbGlm5uq25i7emRxhUT
	qitU7shE/HaGVcwlqp9tMmlt0W4dBNe79FTVKda9fKwBggP+CCXw+SvfaYgbnAB0jkOdGrHTFW0o5
	fp89O9AiJOh2ONLDjveuTGWA7Il1Str3pbqPbaQo//vIYk6s6E2BxLFdJcctrbpvGf+ijrCZZVTZI
	EYIaKt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNEw-0000000H7vc-1nLp;
	Mon, 27 Apr 2026 14:47:14 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNEu-0000000H7v0-2X4O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777301233; x=1808837233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jT2AkInyBs5AHhImaePhMXJs0gLBgOo64GulDs2fmD8=;
  b=NLoUI4WvB0VWyIhJG8M6Gpj+/qE+LSLGCN/HXpPryHk72aV1Krphon/s
   3w4alHw5ETJ+uGqsjwzjJGG3+hvSbX28qdRMdcdzO5XQTgz1VkAqT8Q6Q
   +XS3e8f6JC9VQlVRRL6aFgu7e3GIm3/cJv3WQXdtZyDQ3/ZKGDoGUKwR9
   qftqhRqsiE+DnaVoCc7/WuovxqpBGktVVn5gLUzZdL9Q9NAhZgdnVHDIx
   iOnOP9jQyFRkWuIxEeeIM9g5zb+++zHt1T816FoAjlI9aPFu1h68O1MLV
   XIBvC+2tzKKI85l2InzCnqRnvSTELenc6HvDFMpK556gswQxDQqTPa8K7
   Q==;
X-CSE-ConnectionGUID: vpnXJUe4SZOOnXh3nVQcnA==
X-CSE-MsgGUID: b6bxVooETUew95UUej/5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78248692"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="78248692"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:47:09 -0700
X-CSE-ConnectionGUID: Oe2us8pQSNqzXlSerDdJsw==
X-CSE-MsgGUID: PBgU0GbSSoquH4xNqUNteQ==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:47:05 -0700
Date: Mon, 27 Apr 2026 17:47:03 +0300
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
Message-ID: <ae925_txV1grNikJ@ashevche-desk.local>
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
 <20260427-nokia770-gpio-swnodes-v6-2-b693296c1985@oss.qualcomm.com>
 <ae92LAOy6nRsFb9w@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae92LAOy6nRsFb9w@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_074712_661732_867786FC 
X-CRM114-Status: GOOD (  15.07  )
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

On Mon, Apr 27, 2026 at 05:44:05PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 27, 2026 at 12:46:33PM +0200, Bartosz Golaszewski wrote:

...

> >  	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
> > -		pdev = omap16xx_gpio_dev[i];
> > +		pdevinfo = omap16xx_gpio_dev[i];
> >  
> > -		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +		res = &pdevinfo->res[0];
> >  		if (unlikely(!res)) {
> >  			dev_err(&pdev->dev, "Invalid mem resource.\n");
> >  			return -ENODEV;
> 
> >  		base = ioremap(res->start, resource_size(res));
> >  		if (unlikely(!base)) {
> > -			dev_err(&pdev->dev, "ioremap failed.\n");
> > +			pr_err("ioremap failed.\n");
> >  			return -ENOMEM;
> >  		}
> 
> Isn't this a stray change? Or why then? And why the previous dev_err() is left untouched?

If you go with pr_*(), please use ->name and ->id from pdevinfo to make it on par with the
previously called dev_err(). Perhaps even pr_fmt() on top of that (on top of the file).

> >  		__raw_writel(SYSCONFIG_WORD, base + OMAP1610_GPIO_SYSCONFIG);
> >  		iounmap(base);
> >  
> > -		platform_device_register(omap16xx_gpio_dev[i]);
> > +		platform_device_register_full(omap16xx_gpio_dev[i]);
> >  	}

-- 
With Best Regards,
Andy Shevchenko



