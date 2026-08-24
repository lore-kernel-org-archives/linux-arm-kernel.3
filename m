Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA68C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPyibzDW3CJVwGlMGtcVt6tvoEfTz+yBo2Q3kVFWW7I=; b=3oakyz9VcseRBFQZlyP+p6rID0
	nm097jY1oVlzZXiaqstSyeVxtoFVznNDkb8fXkKqWGJwF729zwMSYNYvN9l9r3MyqO1+D8sOGkvhc
	qY8AyfKPoZc19VgSasZzj8wCgEiiFMF5ISmaZ/DnrlVxHCbIsaEVEe8reEha5T98H+p7EDig+Fo8O
	/rkQFmNX5+vSnWcI6QV0Zd48nw4qZJT+Lw8JFNUDlFX+I0G2BDbUBb1AaWyXCNnFVSr9O8vNyX7cL
	lcas9BloUgnNO3RXFHGnT3oSjZIZZAZcSG0+eJrYuzvePPU0oQYm3N1+XeDkKa+xTSy5z5jDhn00U
	nuZRYjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQBK-0000000GDOv-1C2O;
	Mon, 24 Aug 2026 08:37:29 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQBI-0000000GDOQ-1guM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 08:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787560644; x=1819096644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cAYy6Ol71yQ22chKUdr48h166KtWjCaDZ99Vcll1NQY=;
  b=bWFcvUzX+3BdK+8g+caG+BrscJTUN6miopG8Sk8RsaC/FJmSvqtQ0ctw
   ubm98HDDPhRhFGWenfShywbVaCVB1JA4CRfRj7WL51lzTeNOD7hU8Lpno
   iPllPl4QdUTHhvSsa7PczQSLohDzv75HAU2sLBxsP8KnThWw8uvY/zHNG
   Iuu5FmDtRcuWUs2BaLv9CIlGlzt0I4aJ3Gtp1m31ML/YHpb2TSs9tmAH4
   ktRMR4bTD4W4SDfrHA7dRgb0aBjonvb/I1fBRrBqRDNjUXGtFwIGeaQbf
   4lwdNBfCTVBLsrG6H6j3IgtCiFihQ88oG3S7egZlzAXpsXaHILjCCvK3+
   w==;
X-CSE-ConnectionGUID: X5upva7ZRmKdkQ+utsJKiQ==
X-CSE-MsgGUID: uQWR025qQpOnte234vVVzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87875308"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87875308"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:37:23 -0700
X-CSE-ConnectionGUID: IAOcitHWQo+QTCvXyYaymA==
X-CSE-MsgGUID: ZyA0SafhStG1jWC1UvlR4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="290462069"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:37:20 -0700
Date: Mon, 24 Aug 2026 11:37:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: Re: [PATCH v1 2/4] gpio: shared: Replace open coded
 fwnode_is_gpiochip()
Message-ID: <aowCvk7Em-8AoJ0d@ashevche-desk.local>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
 <20260824074427.3226457-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824074427.3226457-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_013724_453594_12DF1C05 
X-CRM114-Status: GOOD (  10.29  )
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

On Mon, Aug 24, 2026 at 09:42:33AM +0200, Andy Shevchenko wrote:
> Since GPIOLIB provides a helper, no need to open code it, hence
> replace that piece by fwnode_is_gpiochip().

...

> -			np = args.np;

Ah, this one is important.
It seems that

                        struct device_node *np __free(device_node) = NULL;

needs to be replaced with

                        struct fwnode_handle *node __free(fwnode_handle) = NULL;

or something alike between the lines.

> -			if (!of_property_present(np, "gpio-controller"))
> +			fwnode = of_fwnode_handle(args.np);
> +			if (!fwnode_is_gpiochip(fwnode))
>  				continue;

-- 
With Best Regards,
Andy Shevchenko



