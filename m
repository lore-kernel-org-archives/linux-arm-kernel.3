Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D542AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 01:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrbETAlkKcGhEiN5ehdK89++BMCfiyI4OImxh5LgmFo=; b=pjVS64v26RZd8Y1HdTSPD2pCWD
	jd7BPQ93dd088p+IGy9tA9IPi14sPQ/bUayM1z5uiCeDt8gxpZkrQew+HWGKdzkUCBr/tUNYPiNph
	BX6RHLFg+DB+lDWWRHWN0oIinztMZWY4ArSmcl99kHjl9mmiYFlX3lKrs9TWt9vKlvriv2ur5jwng
	dRLU5mNbvQ3kEtQZnS//ibY+ZgG2Q38kU1C1EaPt0Phb6AtAP+jqDjnhysBHR9DHVnvbzLPIr8JGI
	kIIDvWGyFW3IgF5RWStmNGoldmUzJgvX7ho0V9r3Xm9weDqHxyskYjBjDak2uuAITURcHxsS9JZen
	jCXpfxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGSnf-00000006Ve1-0gmG;
	Sun, 18 May 2025 01:26:47 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGSle-00000006VX9-1Tlq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 01:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747531482; x=1779067482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GVpEsHZVrrsjA7zswAKObb5JB0OgW/GOr4FoLaILUQw=;
  b=n2U7Me7j87NBthuThDXNE7xNs4uKqauC4fGMzVic75YgyB41z1uRdBSi
   jWrdYqFe/Ufp09U0w3R8SjTBg23WBRKu/uYkEFP15lEywLD4tk3oX6fFy
   KY1fWd+i5NzBY+jS+xYlrvctB07I7BakEfs3tMxVpQIKpS8bmdaITRB9B
   JfeIAaj6Lrx7A4KOg7c3P8CuRbou7ox3bJwxsy3k5q/8DsNJTb+ld6dz8
   QI9No1Kwm+f3pR+zcGyB8S9CFf4TeshASjgUtMmwHOdIdh9hR6v6Rd73C
   ImGPya2xfwiARWlCst8l6cag9X8HYDDnndTjSx3JLcXzCHA5OdUjUNCk1
   A==;
X-CSE-ConnectionGUID: 1iltBarSQyyEVXhz0xlSPg==
X-CSE-MsgGUID: GvT1LulITAepX7wBMUwiPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49394041"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49394041"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 18:24:42 -0700
X-CSE-ConnectionGUID: klB+4pyaQUG+Go610CoLIg==
X-CSE-MsgGUID: y3cYQp3ySzyHYD2rhtEsHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139081337"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 May 2025 18:24:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGSlY-000KXP-2W;
	Sun, 18 May 2025 01:24:36 +0000
Date: Sun, 18 May 2025 09:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
Message-ID: <202505180911.hDevFA1N-lkp@intel.com>
References: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_182442_406461_9A32B27A 
X-CRM114-Status: GOOD (  12.39  )
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

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
base:   92a09c47464d040866cf2b4cd052bc60555185fb
patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-3-2197a1b062bd%40gmail.com
patch subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for watchdog functionality
config: loongarch-randconfig-r123-20250517 (https://download.01.org/0day-ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180911.hDevFA1N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-vt8500.c:201:51: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *platform_data @@     got void [noderef] __iomem *static [assigned] [toplevel] regbase @@
   drivers/clocksource/timer-vt8500.c:201:51: sparse:     expected void *platform_data
   drivers/clocksource/timer-vt8500.c:201:51: sparse:     got void [noderef] __iomem *static [assigned] [toplevel] regbase

vim +201 drivers/clocksource/timer-vt8500.c

   175	
   176	/*
   177	 * This probe gets called after the timer is already up and running. This will create
   178	 * the watchdog device as a child since the registers are shared.
   179	 */
   180	static int vt8500_timer_probe(struct platform_device *pdev)
   181	{
   182		struct platform_device *vt8500_watchdog_device;
   183		struct device *dev = &pdev->dev;
   184		int ret;
   185	
   186		if (!sys_timer_ch) {
   187			dev_info(dev, "Not enabling watchdog: only one irq was given");
   188			return 0;
   189		}
   190	
   191		if (!regbase)
   192			return dev_err_probe(dev, -ENOMEM,
   193				"Timer not initialized, cannot create watchdog");
   194	
   195		vt8500_watchdog_device = platform_device_alloc("vt8500-wdt", -1);
   196		if (!vt8500_watchdog_device)
   197			return dev_err_probe(dev, -ENOMEM,
   198				"Failed to allocate vt8500-wdt");
   199	
   200		/* Pass the base address as platform data and nothing else */
 > 201		vt8500_watchdog_device->dev.platform_data = regbase;
   202		vt8500_watchdog_device->dev.parent = dev;
   203	
   204		ret = platform_device_add(vt8500_watchdog_device);
   205		if (ret)
   206			platform_device_put(vt8500_watchdog_device);
   207	
   208		return ret;
   209	}
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

