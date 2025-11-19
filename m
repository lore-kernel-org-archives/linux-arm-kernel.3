Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ED4CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnaB6KfE5HkHnIBWg9P4ahWzOSf8igs0dXOi9Czqe8o=; b=yxlHIM0oILKh2g/K5mNvzZFk6H
	1yYxl3R2jp1JjJU0N8Xop73r20S7jxvCBt9jYlcMsXyiZJyNKVdcG4ZQsUFkJ1K+IyjM7GQPE0vwH
	PE8XfBImao83VH/XTtf78IIPfHAVMHaRns3DSLM+VxXt1hspFSW8NiKohGEC6Q1MdKaBt8wj8icu7
	AxCShFGj15Djb9irN6vD8TmTu4nmqS6iO0ekHmhhRa8M5WeZmnNxkNoRBKFXczzfqGYQK11CfHn84
	hOs4HnulmN8rLgUWXnVn1Lf5meXZ2GoLTsc5oRU43bInCgiFAvnw4JbazyzX3s9jx75IghabVyBal
	e8d4DHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkUR-00000003bEb-3VEQ;
	Wed, 19 Nov 2025 15:53:03 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkUP-00000003bCT-2a5l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763567582; x=1795103582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wZZ20Jbxwtey+hKr4JAqc4oi5EtZrmk607QHTRC7VK4=;
  b=lVNDIwDjK54sZ8MfUDLI/zfI+uweXHjmWlUKOb5wV7polQDbJt9Dttpo
   YtCDQm9vHbjj1ieflErJTDx9LOKzHDLcC9jbGMZFzO9CwvZJADnvsE//0
   YAszGVpGsCD4jzzbO7xaWmazSKDpBQstvyfrzeki8IX/NL3iaaxO+aW1A
   74xXkdRXIJQl2g2c5qK5/J1wefZ4CcNeBv26dPbzPMXn1AvGcztLIvlcN
   QM+4eJlyTDT9uQoi5/ehdNSw/2DpwPSph0hz070s2PvBZXBaBYO3LalYS
   Q1618CwviK0qjPGCKBk0cgeYKPEmN5ulvB3ah+ZTWWEhhNDf45vzzxcWc
   g==;
X-CSE-ConnectionGUID: lAMnXU3ZRdy3G3tCWdFM6w==
X-CSE-MsgGUID: 6N/Frmr0QVG9MLjb8jkuew==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65555772"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65555772"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:53:00 -0800
X-CSE-ConnectionGUID: LwkW7kmFRzK+rznZqdaZEw==
X-CSE-MsgGUID: FSDd044QTvaX8eIBSGsrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196042855"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:52:56 -0800
Date: Wed, 19 Nov 2025 17:52:53 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 00/15] gpio: Use modern PM macros
Message-ID: <aR3n1Y6YnR_tGmrk@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119144327.13345-1-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_075301_707023_57ABCC15 
X-CRM114-Status: GOOD (  18.27  )
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

On Wed, Nov 19, 2025 at 10:43:12PM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
> 
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested only.

Thanks for the changes, but...

This series still does additional things that make the memory consumption grow
for no purpose. I suggest to leave ifdeffery around members and do it in a
separate series with all reasoning and good points. With this split done, I
will immediately review and give tags for the patches as I'm totally in favour
of using pm_ptr() and pm_sleep_ptr().

-- 
With Best Regards,
Andy Shevchenko



