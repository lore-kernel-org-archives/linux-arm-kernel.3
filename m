Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3ABC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jGIahVsVtFGllRm0ivj9fpT9wj2Qq6Ot/6P7HlFwlk=; b=X0aTYaYuS96K1GmOcMbJ3rMFuS
	frg/immhCFFx5fwdK+P43Sczz7wkwMHgOrL/o1S7jhR7t2BMsTLoJ5RLm6e3eGT+fprNgPT429yM6
	wL6ZzKqviWx7ivkiuoHD8s5QrZhkZV6ufO8cCRC4bOkUlLPATemqhEbJro6PMG3yhqbkn7LLNDVRf
	6VUV8vrToqzugsbqBcXApzXDcn85dpZVvRO+FWLfF1RjNSy86JG3iCsmdMREpgjvIn8zL6jCqDI4S
	on35iQ1lr1KsL5MtIdmxoAOH00IMuLyhV815IuTlOAj6kVVsCZmUSrf9T1nR7nNtB7WqSk9nzDyXh
	Pm5loRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbfp-00000004d9I-25XZ;
	Tue, 15 Jul 2025 09:10:05 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubavo-00000004VYy-1Rne
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752567752; x=1784103752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a/QsrXQn2Q+8kG4obINj/xiE+3HXSCctW3/j44bjJvA=;
  b=VQNljfMvYOZAOva8O80Kf5a43jTxXAPyOSN3oABPYp2OhVfsOZ/VH7fd
   DW/j5BefyDHnvqUGc3J+d+JTFim1Bthw2T9OjLdgHf+r7UT5gLE2rcGGq
   dPHxGXPka0CGplofuFlFAposQe/No0Zl6NQUyaTsOwV7bUaoLL7xJey/0
   JveHWBerx7+FZNaX4+YqHXlhD27kO7DXsdbTEbCr65y3VaDLiUQE78PF+
   4/Fq693iVRFOLSXLLcg1yv+/zUvCTBFUgEDKc4q44cwSMzFZTk23+ia9l
   8+DidAd/DdeRXmUemRzvegebw4AVr1uGiOxki6Jh6x88eL/vKdgoB6nB9
   w==;
X-CSE-ConnectionGUID: 8gbKVjBeR3Cn0xrHP1bpeA==
X-CSE-MsgGUID: T5qxhxCkR4aUOOutSSymaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54649111"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54649111"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:22:32 -0700
X-CSE-ConnectionGUID: RV8tVbiwSt+C/N3N9A6KLQ==
X-CSE-MsgGUID: l841zr9kQlyZeWDn3U8ydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="180864523"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:22:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubavh-0000000Fawi-3Sud;
	Tue, 15 Jul 2025 11:22:25 +0300
Date: Tue, 15 Jul 2025 11:22:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: wcove: use regmap_assign_bits() in .set()
Message-ID: <aHYPweTatnLC3TUI@smile.fi.intel.com>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
 <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
 <aHYPoR5JVP4OO0QZ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHYPoR5JVP4OO0QZ@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_012232_419728_5029ACED 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 15, 2025 at 11:21:53AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 15, 2025 at 10:19:44AM +0200, Bartosz Golaszewski wrote:

> > Replace the if-else with a direct call to the regmap_assign_bits()
> > helper and save a couple lines of code.

'...a couple of lines of code.'

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



