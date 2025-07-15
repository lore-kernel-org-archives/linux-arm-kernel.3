Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26404C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpRzCY4G7+9O7MgHRTn0pRun65FHWxhnkHrBlCWPbMs=; b=NnxlyAmBN7nJ+7uj4VMmur1w6J
	FKdNcGpXGnccAZtjsh8fVGvzXxu2yQSiDVXKV8Lhbdz4kUz2Iriz0qsrSQexI6ZSOKt76Z1Z04nvK
	0wlU+xkmE1pTogUOVTaTRdYEbqH8tCjn7p5ZB0tEjxHESlS+OsVZdvTfMA8gQmpSUq+xJU0UhHPMc
	nOSs28hLy6knqO6izuqBf+RJacaIgQLNGuBIJUV8LfojZvob5t1dX0OJlDf0H2x2Ppqzg+HIVSs1z
	u5+3pWOZMPvVnpF1x39sHJXBN9c4+Ix6G68aQdvHg4uJQ1mjY5sSCXrShv1uctxSmZwnJo+QWEByb
	NGhCF/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbdR-00000004ctn-35YV;
	Tue, 15 Jul 2025 09:07:37 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubavK-00000004VSE-1jKc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752567722; x=1784103722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qh3iKXB6e+tUcjfkW8kmUKXqJF2goUOYE8q4iC5PdoU=;
  b=UTIdAtvzVskDtlK1d2juGPDO2V3f8JD+pOAMw1Lt31nJgzZ6FrcyL048
   N4uzN7HKo5K2hx496nkF8V5KqKeb2tGNQFRSTV4b2Pa9XoZcZOGouroxL
   XcYUaZbVJMX9AAl4wVsLaGuNE+FnFOmB35/GEadbN0xWDTnyYbzi1XVkN
   XOM4XQ/gKQ7NONVUGj2LLADuFlYDSNP6gsLIKVDbfJUzO9z5OYaGwPpoL
   PDatw9efVm7A9qgkClgj2ad7VkucvvXS6BSAZzCDwvYF9Us1XBfjJrakZ
   RTM9UK5DZP+Bx0XmFcY6HOHSo57x1MHcCh1AUc2sbBICcuneNiva46AAs
   w==;
X-CSE-ConnectionGUID: GzZOIV08QF2suLr35miVVQ==
X-CSE-MsgGUID: I4BryRGDRJOl1g7WkTYlzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54649076"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54649076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:21:59 -0700
X-CSE-ConnectionGUID: nmlhfCi9TxiaA30+CCz/Fw==
X-CSE-MsgGUID: mXEYMokGT4m8tJAJYkTIlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="180864367"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:21:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubavB-0000000Favp-1Klz;
	Tue, 15 Jul 2025 11:21:53 +0300
Date: Tue, 15 Jul 2025 11:21:53 +0300
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
Message-ID: <aHYPoR5JVP4OO0QZ@smile.fi.intel.com>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
 <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_012202_496610_90F2EC83 
X-CRM114-Status: UNSURE (   8.31  )
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

On Tue, Jul 15, 2025 at 10:19:44AM +0200, Bartosz Golaszewski wrote:
> 
> Replace the if-else with a direct call to the regmap_assign_bits()
> helper and save a couple lines of code.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



