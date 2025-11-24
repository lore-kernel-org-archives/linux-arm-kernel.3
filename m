Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AB4CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 07:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qO3poRUudH72SRFjqfuJ9Yk18cHNHwHb6Ky7Ks3bHw=; b=3C+VmEpZJELgxp0Pqu67Mc4ePU
	LsTd2NQJbVNO+kCQ0Tn2C59RKTeigRUwnkf3VXuPBlB/BOPE/Q3hQy6D4Bc7YAL2ztlWRHl4oR2tu
	1K8DDg0fsvMYoH5f4xMkDOuWRDjeSqAtuDjxlSCDJj9ozvqWatOH1L2sWUM2Aue1A5gROuCUKuUWF
	CiTabmDd1z6PFzIRPtugPzuy5Uy5r/egNrBla8G9VnFUoa/HdEipr+sbrJNUvG8l43IrtOBQR0Qja
	Ruxl0OsOBiFXewn/L7XdwNj3veWdr50sF+IY+PFBNd/I1EDm/C91KwPO2YOMrcApm4CO3bRaPEJcO
	/ilvbqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRMZ-0000000BEkQ-3hfK;
	Mon, 24 Nov 2025 07:51:55 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRMX-0000000BEjk-135R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 07:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763970713; x=1795506713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FXdcsNT83bzISlwMMljD1n6AKms9qZXmDn9X2sjfCng=;
  b=L5IK8/g6zNbsvBi0n7cJrliQ+sF6twjrwiSYR1D/XEDOfQ5FZZR8Zy0S
   J6u5XsnA6VqVsWYA73EeyXKzxei2jISjrc4MilaBdPAnfkNsOhfvUyEmm
   Spgwb9iegFss9z0ZFZVuSjMtn0H5l/sv3FBFVqFoyXaRDhoM7qtSlT9Ze
   vB07MMLGRjCCMz+cbXtXpP4hE90TF/w1GyxFi6HUogDG9ismU5G96zTmp
   JMgPN7l3xZ59RFkD+w++puhwKt4fRDe5i5/XPs5wlxBvN6zhinFeAd8QY
   CtAFwwb68DqsikkR7bmh/eN0uzNh9C/60IO5TcGQMk1hCBkEBMZSaNAI4
   w==;
X-CSE-ConnectionGUID: CgYvDgyZSeG1Z8xnuBptUw==
X-CSE-MsgGUID: J/uH3+BMR2OG6ilwatgszA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76576951"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76576951"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:51:51 -0800
X-CSE-ConnectionGUID: ksLs+7wdSoqwQVozj0FSGg==
X-CSE-MsgGUID: 3C/TwgOxSCGblUyziKv2mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="215612518"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:51:47 -0800
Date: Mon, 24 Nov 2025 09:51:44 +0200
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
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
Message-ID: <aSQOkP0fPZfFEytq@smile.fi.intel.com>
References: <20251124002105.25429-1-jszhang@kernel.org>
 <20251124002105.25429-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124002105.25429-3-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_235153_302953_294C1CBA 
X-CRM114-Status: GOOD (  12.13  )
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

On Mon, Nov 24, 2025 at 08:20:53AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

I think converting to the respective macros for NO_IRQ case makes sense in
the same patch. But I leave this to Bart, I'm not going to give tag here
due to the above.

-- 
With Best Regards,
Andy Shevchenko



