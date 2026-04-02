Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4442DD6AAE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XM3cpHUUcyNLCB/nYmaJKHDEnGYf34Fg0cTwoWs1xoM=; b=xk36xg7KbZzZiZ3JOZ2rp4ZVO/
	93PFQ1yibSbK4xF+LyiZGkOXKYhOlXr2LbUoJ5N+ND+ySWUNH9noAcG0y7WDY01NXvUfAJxXY8jAj
	8ecLkGi7FokYtOyCIFkMFcIIQ9KKqLGpQwo+N6n0XLrtiPxEty4wCXT6nN855eyL6m1DU5h2FMw0v
	0Bx64WRJolq7ZS9Qyzv7p49UKCJatkxmlyQX4ptjapxTS62ILvN3IlgCOMivkMRCosfuYLgl7Mnbt
	WmQ2qBaEjfpHJvsJkRRmdzDdmD9KNBaFMbva2thd4ryEctT9m5XVKQbNGpCjURq+Dn+Ujf4SZF9MS
	FSECeqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kpk-00000000VcP-2KGi;
	Thu, 02 Apr 2026 16:23:52 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kpi-00000000Vc2-3Bkq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775147031; x=1806683031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jubyS2m2QjhM1wFy1HfygIjKkKElTV1Ix6KF2Q4kQlc=;
  b=IRxht+fe6dniiH2vT5iQKBjUyzqrWRvM3TYTOKBb0n8tYyeh5y9/o/XP
   5PkDzPP8woN5aWGglxRyN42DJFlu0ISFLzPzg/vtX+fB0N9eDUfllDADm
   eIZjh6JQ4Vc9gCBAZ74XbfBtU+5w+fx/8XQTwWx+25+/R1bq8ZWO8Etdt
   Gm9A7JhdMj/Mi36cEotiXSyCrrZ9THABwkAPWuM50rglkH8Mbu9GqoxcQ
   CSzMbQ/W57GXIzspxSATfdUd2hMqwZ9KXM5wPQ/51PI+WbaVfXi0s7hCq
   raJRh0yvdcegwjNoAOg9gYlE2Yfo4tShizJDUckPLVvnYywYXQyUkhiC/
   A==;
X-CSE-ConnectionGUID: SGSX2f7URXqwxD7lEAp/EA==
X-CSE-MsgGUID: w3a8ax1+S0K/cFROIsWJrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87283608"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="87283608"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:23:50 -0700
X-CSE-ConnectionGUID: D0KNrGtMRbC6uGrHszmO3A==
X-CSE-MsgGUID: XhnFx+ziTluokXI1j+c2NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="231060363"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:23:46 -0700
Date: Thu, 2 Apr 2026 19:23:43 +0300
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
Subject: Re: [PATCH v5 4/4] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <ac6YD0Zr46YjNdr5@ashevche-desk.local>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-4-d730db3dd299@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-4-d730db3dd299@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_092350_881492_05297B98 
X-CRM114-Status: GOOD (  13.24  )
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

On Thu, Apr 02, 2026 at 04:15:05PM +0200, Bartosz Golaszewski wrote:
> Currently the board file for Nokia 770 creates dummy software nodes not
> attached in any way to the actual GPIO controller devices and uses the
> fact that GPIOLIB matching swnode's name to the GPIO chip's label during
> software node lookup. This behavior is wrong and we want to remove it.
> To that end, we need to first convert all existing users to creating
> actual fwnode links.
> 
> Create real software nodes for GPIO controllers on OMAP16xx and
> reference them from the software nodes in the nokia board file.

...

> +static const struct software_node omap16xx_gpio2_swnode = { };

No need to have {} for statically defined variables.
OTOH, if you want to have same style over exported and static,
perhaps it's okay.

> +static const struct software_node omap16xx_gpio3_swnode = { };

> +static const struct software_node omap16xx_gpio4_swnode = { };

-- 
With Best Regards,
Andy Shevchenko



