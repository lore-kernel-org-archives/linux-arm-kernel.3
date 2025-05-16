Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89032C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/ARFSixLHCH8zH36NGc9YwCv2/YHy1TScRGzqv03n0=; b=UcAfC7OmoMYN0tZX7i4JJaQ6AZ
	BMRj+s8CZ71pDZQwFT9BtDHWwzA8PgQrvQ5JNxqscSpRvgaJkpxhzJZ56a6EezyyPyBVCPD6VJ8iP
	AYDVGl61w58mbWt+eIlr/5FRV0chgcuj5axDx7AiMleDqbKpWLBx53t5pzWaLmR302uVcc8A1khC0
	sRs8qeyT5Z7x/9DSlm22KDe2UGwpCezPv9lrSZjS+4vpURO997K9pnPCZAAZBna2bmB3A6TrMEcWZ
	g2rt0Xrm0KpOB4tj3HS512tX6RRjTxqPlMtkfO6DxeMekKz2XODej3jCGdBj2koOnUnrPH0A2fJq+
	bQqyCjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFp1a-00000002coC-0B7j;
	Fri, 16 May 2025 06:58:30 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFozS-00000002cgQ-0CQy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 06:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747378578; x=1778914578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6rfuUKsjOTxXxT8uLY3kxtdvK2WPbv9CQZT5mG0czjU=;
  b=luHERxmp2eK5Lpkj9wQLFLRlN6EaTZVsOTxJveG4B243wpW+Oug22JTb
   GgddHQS7UfQ/zQaIxxCsoeWdR4yQ/58kuFXRxMcgwpwWRzR3Ap0QkWB2G
   tOFkNTtFJyxfT3rqhH2tcVUV7HsWXmiDixWcdAAMl6rsi53e3z6VTBSiK
   vOc1tCNj77AMo7LJ52qY7NNw5bINoTE2Hv2W0v0DBokYQEpv35T2Hy7p1
   5RXH7YBk6iH6evOcb8EAYK60zMKDHT4KXsxkb1Uvxm/kQLZEmRd97Brjo
   0SK/4Mok8DRPtqHRONDLGexR0CbF0+PwNDqGrK01oDQHcbthFu65VmGND
   Q==;
X-CSE-ConnectionGUID: MSt4LBBNSNKui3huzraRpQ==
X-CSE-MsgGUID: Lub4OkrwSrm5IM1ploefig==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74738755"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="74738755"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:56:14 -0700
X-CSE-ConnectionGUID: O0/Va5nMQmqorCi9kxe9jw==
X-CSE-MsgGUID: 9O/mnJV4RoG4sk0/ylvhkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138345283"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2025 23:56:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFozI-000J4N-1Z;
	Fri, 16 May 2025 06:56:08 +0000
Date: Fri, 16 May 2025 14:55:15 +0800
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
Subject: Re: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
Message-ID: <202505161430.wdURc0TG-lkp@intel.com>
References: <20250515-vt8500-timer-updates-v3-4-2197a1b062bd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-vt8500-timer-updates-v3-4-2197a1b062bd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_235618_100762_9D4801EA 
X-CRM114-Status: GOOD (  13.72  )
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
patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-4-2197a1b062bd%40gmail.com
patch subject: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia SoC watchdog functionality
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250516/202505161430.wdURc0TG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161430.wdURc0TG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161430.wdURc0TG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/vt8500-wdt.c: In function 'vt8500_wdt_probe':
>> drivers/watchdog/vt8500-wdt.c:98:44: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '6148914691236517' to '3287081637' [-Woverflow]
      98 |         drvdata->wdd.max_hw_heartbeat_ms = -1UL / (VT8500_TIMER_HZ / 1000);
         |                                            ^


vim +98 drivers/watchdog/vt8500-wdt.c

    75	
    76	static int vt8500_wdt_probe(struct platform_device *pdev)
    77	{
    78		struct device *dev = &pdev->dev;
    79		struct vt8500_wdt *drvdata;
    80	
    81		drvdata = devm_kzalloc(dev, sizeof(struct vt8500_wdt), GFP_KERNEL);
    82		if (!drvdata)
    83			return -ENOMEM;
    84	
    85		/*
    86		 * The register area where the timer and watchdog reside is disarranged.
    87		 * Hence mapping individual register blocks for the timer and watchdog
    88		 * is not recommended as they would have access to each others
    89		 * registers. The timer driver creates the watchdog as a child device.
    90		 * During the watchdogs creation, the timer driver passes the base
    91		 * address to the watchdog over the private interface.
    92		 */
    93	
    94		drvdata->regbase = (void __iomem *)dev->platform_data;
    95	
    96		drvdata->wdd.info = &vt8500_watchdog_info;
    97		drvdata->wdd.ops = &vt8500_watchdog_ops;
  > 98		drvdata->wdd.max_hw_heartbeat_ms = -1UL / (VT8500_TIMER_HZ / 1000);
    99		drvdata->wdd.parent = dev;
   100	
   101		watchdog_set_drvdata(&drvdata->wdd, drvdata);
   102	
   103		return devm_watchdog_register_device(dev, &drvdata->wdd);
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

