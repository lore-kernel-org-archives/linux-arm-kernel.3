Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B00C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 06:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFMmiCO8nTTqha7CWWoxw6NWBx1ljpYWS2Xp+eYxNu8=; b=PF5q2fbpIWyTALW/tNazNkE/9K
	FXODHf61Jzwp/DgboNzoSrUPg24v51ta0TMpiRRbIIuSS1hBURkqlKwt5E+bTtpl7ggjf/HHRs+7/
	AGUjmlD/GGO46DVh8DQoeO/By0a9TDwrtvaKxtKQ9KZNL0uhjW6mOED3JcH7qevayT/jz+am1goY/
	Sb/FpYJrwEjtw4b6Pp2GJ2KLNQJCQbGquZf8Ju5RnFEEebsy1vVaV4S1qUSwBm0L9mUXhrqjA9Z+f
	48qVAFA4MK7AMpltqEvEs5GWv1tEHGsjWJCKUEDVRbyPotKfBWI/E3mxlYPxKOzf1KnhZUlZI9Bw1
	NtbolxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaqJO-0000000HP7z-1oYV;
	Sun, 13 Jul 2025 06:35:46 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaqGz-0000000HOzA-1NUv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 06:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752388397; x=1783924397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RV2fZ2M4TKY0D92MjssBZlAVgtq65IeP0WmOHlbH5hI=;
  b=at/mESW1YAjA4daE4VxYXIuzoA/HOyGMu8vUYss4qgQna378KpygMzc/
   qWI6t3EH5he0fN4bIx3yNjXJrT84MLnQe2OWxq89RnSx0F4MuJ2JL9EkW
   Q8rmRygpt8pRl+r9UtSCp2c47pQarjlyLCaGiHMvyM838LAEgihBWJwz7
   vF5aHeEYY5SM8ijGoRihM5Wd0H1o/nDhCB4tNKDCmnbUpT9MqkofgK12U
   ooPpGdb998jzf+RMQCLGZ2YX+NivU2VaBlZdwe+XVxVb8UcEwteneU/z5
   Lge7zK6FybYwjsgGNWhgAwnxwjCPvm98aUQDlvnS6AiAqaJ6PVbHqYNgZ
   g==;
X-CSE-ConnectionGUID: WqYX1z4hTP2vskvAtec7Rg==
X-CSE-MsgGUID: gp5PG/jWTAiGyTDhnww5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65319374"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="65319374"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 23:33:13 -0700
X-CSE-ConnectionGUID: 7P1p74VrRPeSyGGK8aOmsA==
X-CSE-MsgGUID: Gk/3Mb/kQ7yzmO6RcneGmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="157018597"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jul 2025 23:33:09 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaqGo-0007wR-2u;
	Sun, 13 Jul 2025 06:33:06 +0000
Date: Sun, 13 Jul 2025 14:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: oe-kbuild-all@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
	kamal.dasu@broadcom.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	Kamal Dasu <kdasu@broadcom.com>
Subject: Re: [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support
Message-ID: <202507131422.6eIuyxUJ-lkp@intel.com>
References: <20250711154221.928164-4-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711154221.928164-4-kamal.dasu@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_233317_413099_B0E0B71B 
X-CRM114-Status: GOOD (  12.78  )
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

Hi Kamal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-for-hwspinlock/20250712-034624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250711154221.928164-4-kamal.dasu%40broadcom.com
patch subject: [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support
config: arc-randconfig-r111-20250713 (https://download.01.org/0day-ci/archive/20250713/202507131422.6eIuyxUJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250713/202507131422.6eIuyxUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131422.6eIuyxUJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwspinlock/brcmstb_hwspinlock.c:26:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/brcmstb_hwspinlock.c:26:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/brcmstb_hwspinlock.c:26:39: sparse:     got void *priv
   drivers/hwspinlock/brcmstb_hwspinlock.c:35:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/brcmstb_hwspinlock.c:35:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/brcmstb_hwspinlock.c:35:39: sparse:     got void *priv
>> drivers/hwspinlock/brcmstb_hwspinlock.c:73:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/brcmstb_hwspinlock.c:73:30: sparse:     expected void *priv
   drivers/hwspinlock/brcmstb_hwspinlock.c:73:30: sparse:     got void [noderef] __iomem *

vim +26 drivers/hwspinlock/brcmstb_hwspinlock.c

    23	
    24	static int brcmstb_hwspinlock_trylock(struct hwspinlock *lock)
    25	{
  > 26		void __iomem *lock_addr = lock->priv;
    27	
    28		writel(HWSPINLOCK_VAL, lock_addr);
    29	
    30		return (readl(lock_addr) == HWSPINLOCK_VAL);
    31	}
    32	
    33	static void brcmstb_hwspinlock_unlock(struct hwspinlock *lock)
    34	{
    35		void __iomem *lock_addr = lock->priv;
    36	
    37		/* release the lock by writing 0 to it */
    38		writel(RESET_SEMAPHORE, lock_addr);
    39	}
    40	
    41	static void brcmstb_hwspinlock_relax(struct hwspinlock *lock)
    42	{
    43		ndelay(50);
    44	}
    45	
    46	static const struct hwspinlock_ops brcmstb_hwspinlock_ops = {
    47		.trylock	= brcmstb_hwspinlock_trylock,
    48		.unlock		= brcmstb_hwspinlock_unlock,
    49		.relax		= brcmstb_hwspinlock_relax,
    50	};
    51	
    52	static int brcmstb_hwspinlock_probe(struct platform_device *pdev)
    53	{
    54		struct hwspinlock_device *bank;
    55		struct hwspinlock *hwlock;
    56		void __iomem *io_base;
    57		int i, num_locks = BRCMSTB_MAX_SEMAPHORES;
    58	
    59		io_base = devm_platform_ioremap_resource(pdev, 0);
    60		if (IS_ERR(io_base)) {
    61			dev_err(&pdev->dev, "semaphore iobase mapping error\n");
    62			return PTR_ERR(io_base);
    63		}
    64	
    65		bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
    66				    GFP_KERNEL);
    67		if (!bank)
    68			return -ENOMEM;
    69	
    70		platform_set_drvdata(pdev, bank);
    71	
    72		for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
  > 73			hwlock->priv = io_base + sizeof(u32) * i;
    74	
    75		return devm_hwspin_lock_register(&pdev->dev, bank,
    76						 &brcmstb_hwspinlock_ops,
    77						 0, num_locks);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

