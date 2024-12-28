Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F2AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 22:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVUOio+y/QGB2n1WUG2sBLncltD5aD46s8bDjD5CEwc=; b=DYEv3halQlLOSun4EBJdL4PCTY
	CEE0bG/M9MNLowUjlJK9ZDFZFyE5c7oO+HXgLDHj23NAefy1K1DLOi6AcUZDi8J9xFLAUYNcuootV
	RCPjW5b4UGycCGkWFX7Wl8eNKaxk76JfwizsgdkgS0kZgRr46PorRFSTbnru29MKGx21fbyn0MnVz
	DykB56LA9U/gjgghzPleCyLv8hD2AuE1XsEzL5bocwcLa/ebibMTmwSfnYjn9T2mIrw6x68W+pXUl
	ZR3Ey5wk5uuSsuIG4B7nVljYpC670Og1bRwaDfJZrCsMvPW+HfxO83ZPUssNAmX6sonP71Y7K49vu
	S3vbqnrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRfAe-00000002SdO-3Jsz;
	Sat, 28 Dec 2024 22:20:32 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRf9M-00000002STm-1IuL;
	Sat, 28 Dec 2024 22:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735424353; x=1766960353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CYotyYWSmunaz27IymD9YuqOxnVhzREjrXIxHRrlV+0=;
  b=WPOKUHyC5qV61oZ4dpUIZZpTGSKLxGQTvabyumOiph9gda5ziQOOKGCL
   X3z94UWfVCA2PQ5bfFkKm8wd0Q06QoxF2SG+EZd+ACGG/ATFjB3nXKivc
   0AvFiHwkHeWCy3I1iHaLMR7mTdy9zEouJP3m1icPRG6734xeCa5BOzG+K
   muxWLPpmiNLoq0DmkfPcA08WPZ25Qqr5Iz5HWYk4pQXtEz7EebuD/RRBX
   u2Gz4bF8proi+c3OBRxOBMKLIYLvpQXldrLxp7xmwspNDoyfpiO5SezOn
   witYE+6l1qH0urp9jdNOKsz8ZfCYQ1HxhEM7fdfpdcfjOZ2iLW4vEcM1z
   g==;
X-CSE-ConnectionGUID: bYfVDLkYRxKnoPBMie07RQ==
X-CSE-MsgGUID: NTh21NN+QlOusMkKnfQfng==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35481723"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35481723"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 14:19:05 -0800
X-CSE-ConnectionGUID: KcCQ2g4yQRC8OcKGelMC2w==
X-CSE-MsgGUID: pmsZWc/URWybCdhcsqflbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105434107"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 14:18:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tRf93-0000000DV4W-2WLW;
	Sun, 29 Dec 2024 00:18:53 +0200
Date: Sun, 29 Dec 2024 00:18:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Esben Haabendal <esben@geanix.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Rengarajan S <rengarajan.s@microchip.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Wander Lairson Costa <wander@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Matt Turner <mattst88@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH tty-next v4 0/6] convert 8250 to nbcon
Message-ID: <Z3B5TQkz1S-C1wro@smile.fi.intel.com>
References: <20241227224523.28131-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227224523.28131-1-john.ogness@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_141912_410992_D59015D5 
X-CRM114-Status: GOOD (  11.49  )
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

On Fri, Dec 27, 2024 at 11:51:16PM +0106, John Ogness wrote:
> This is v4 of a series to convert the 8250 driver to an NBCON
> console, providing both threaded and atomic printing
> implementations. v3 of this series is here [0]. Additional
> background information about NBCON consoles in general is
> available in the cover letter of v2 [1].

Just to be sure I understand the side effect of this series, i.e.
the

https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/tty/serial/8250/8250_port.c#L44
https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/tty/serial/8250/8250_pci.c#L9

are not needed anymore (the first one can be replaced to something like
dev_dbg() or analogue)?

-- 
With Best Regards,
Andy Shevchenko



