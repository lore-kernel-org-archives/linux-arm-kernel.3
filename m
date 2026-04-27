Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E9CFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIuAINSJU50ITZN6lWg1q1p+JRxjWp0kUjc/Iw3TZt8=; b=YpRSiQH/AvCpc15vmAJWb0Q+7O
	s+YKvNFnuAVLCO7qr2uE7IQ5EUkug/0Rrr84M4ceYycBenJc92PnaIWXtDsZAKSW5vVDVtSUwtpRu
	XdMEVc9VigqTRHzcTWV+xXtWyaYjLr3CDSfkMBC+TifmUpmdgzxSyMIUOHQ5qXcU2H7IItYVYSr+H
	NwXo+MKUFFuezPNIT/JDMrlqQ3uFMTakqYRGumEhfV3/vlZwFrXk7V0kwQYVqVf5XAehSU1NgXNNn
	ZTsxwYMuKjfcqvs72Ga17PaMfEsAfeDbZT2o/RPwngr1qcnvPGV8IvzNa4YWo+wnPVCJGospbGEIR
	OTgLy0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNKW-0000000H8Zf-3N5r;
	Mon, 27 Apr 2026 14:53:00 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNKV-0000000H8ZK-0Dv2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777301579; x=1808837579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GgZguPLQYsq+WYYBuzGAW6TXq7+26UZzZDptmmz1/20=;
  b=kRVf0/Q1jp9faKfFZ04Gofy4t8E/WpVCCjODKwcHzXVIuTpRW+4KUdsA
   SzfAwjheD/Ljow8RlFInDTix5IcVFtJ8b8Ev/21DUWaQ0tCP02wo/tfzH
   ThTX4wZ9ToCS3UjkcKg6vYVqqdggrl1d5fdf/G2NBtMLbKZXrIMbjb6Dk
   uRGlr1KuNodhe7mRIj6EXwS3CrnqY7g2v7hWwGyAtIH3kibwKvp2+463f
   soHd2MPFhH+JcQGqNxxv7jZBluoA+qnmDu78w4MfT3wngCu+17/4+tYAP
   HNAWL9VtN00Z/kNDgfR5N7JFliHkZkCwbBOxwkty4ZSahh0NztuO3hcbm
   w==;
X-CSE-ConnectionGUID: YzxtB7kpT2uNDZ9unfGByA==
X-CSE-MsgGUID: hmCLCNfkTYyJ3RBf9jCBrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77352508"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="77352508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:52:56 -0700
X-CSE-ConnectionGUID: Cl91Ct7QQuyDLm50uxEGsg==
X-CSE-MsgGUID: 28KJ4+YZQ+GB0j5SJbz3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="233930886"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:52:51 -0700
Date: Mon, 27 Apr 2026 17:52:49 +0300
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
Subject: Re: [PATCH v6 3/3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <ae94QVJCMpsXIPCH@ashevche-desk.local>
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
 <20260427-nokia770-gpio-swnodes-v6-3-b693296c1985@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-nokia770-gpio-swnodes-v6-3-b693296c1985@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_075259_154613_125DF880 
X-CRM114-Status: GOOD (  12.56  )
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

On Mon, Apr 27, 2026 at 12:46:34PM +0200, Bartosz Golaszewski wrote:
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

>  #define ADS7846_PENDOWN_GPIO	15


This is the only definition for a GPIO pin and its purpose obvious from the
GPIO con_id below. So, while at it, perhaps get rid of it as well?..

> -	PROPERTY_ENTRY_GPIO("pendown-gpios", &nokia770_gpiochip1_node,
> +	PROPERTY_ENTRY_GPIO("pendown-gpios", &omap16xx_gpio1_swnode,
>  			    ADS7846_PENDOWN_GPIO, GPIO_ACTIVE_LOW),

...will become

	PROPERTY_ENTRY_GPIO("pendown-gpios", &omap16xx_gpio1_swnode, 15, GPIO_ACTIVE_LOW),

(or wrapped version).

-- 
With Best Regards,
Andy Shevchenko



