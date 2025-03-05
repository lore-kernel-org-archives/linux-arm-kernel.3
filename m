Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70772C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GixKrI4auj+Jq2I/e3aa9PpIqnSOeuqb6Z1Wgla2k/g=; b=rnJjSF+mBPGVKzLpzzURLEa/Lo
	ukXjpP9/6vh8KpaHh4H0VGtlW8sgRG/oKgRNw3cR/nldIfxesZjxphob+VIlY5JBQYkw0Yhkf3ykg
	Y5NvJvJn47OqUd5kZzCSkQJ9ZHiXQz8ukItDVN8QpPiLaveJx5QC6sd6vGYV/46RHyVrGV/9/nq1F
	KRVSfe2ekwzK7CpwVfel/0TVi7VEvNJXkx3rq2P6mQUFYxNsQoqa3pV3CL50JUF64ibyE62AZ25Bu
	MYDVO2/Ywgp8hMJ05Bn2ndzYJ2g5jeardQIceK+mb0wEZCh7HHpi3RuEVbF4s6+LqAIMF5yx1WZ/9
	2dBFP+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn0H-00000007ryl-2LOW;
	Wed, 05 Mar 2025 11:33:33 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm2M-00000007gzn-2bXn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:31:39 +0000
X-CSE-ConnectionGUID: XmSe+DFzSEC9DQWWRekNoA==
X-CSE-MsgGUID: 3X+wga1iTCmsuoh1cMmoyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53523077"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="53523077"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:31:38 -0800
X-CSE-ConnectionGUID: Z/A8xlFITVmp8Z0twxO01Q==
X-CSE-MsgGUID: nLVWQ8vMT/elxbz01T8mpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="149420928"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:31:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tpm27-0000000HNqe-12WE;
	Wed, 05 Mar 2025 12:31:23 +0200
Date: Wed, 5 Mar 2025 12:31:22 +0200
From: Andy Shevchenko <andy@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org,
	evanbenn@chromium.org, kabel@kernel.org, krzk@kernel.org,
	mazziesaccount@gmail.com, thomas.richard@bootlin.com,
	lma@chromium.org, bleung@chromium.org,
	support.opensource@diasemi.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	paul@crapouillou.net, alexander.usyskin@intel.com,
	andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, mwalle@kernel.org,
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, imx@lists.linux.dev,
	linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org,
	linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 0/2] Add stop_on_panic support for watchdog
Message-ID: <Z8gn-jxUH_7FT4b2@smile.fi.intel.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-1-george.cherian@marvell.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023138_692650_AE7BF5BA 
X-CRM114-Status: GOOD (  12.23  )
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

On Wed, Mar 05, 2025 at 10:10:23AM +0000, George Cherian wrote:
> This series adds a new kernel command line option to watchdog core to
> stop the watchdog on panic. This is useul in certain systems which prevents
> successful loading of kdump kernel due to watchdog reset.
> 
> Some of the watchdog drivers stop function could sleep. For such
> drivers the stop_on_panic is not valid as the notifier callback happens
> in atomic context. Introduce WDIOF_STOP_MAYSLEEP flag to watchdog_info
> options to indicate whether the stop function would sleep.

Should you only enable this if the kdump is enabled in the kernel configuration?

-- 
With Best Regards,
Andy Shevchenko



