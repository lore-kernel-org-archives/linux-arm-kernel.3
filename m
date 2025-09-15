Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E892CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 00:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9XjJge5ZByxGEnvOufRmRCCSNEzTkTFUTL2vH6HrBig=; b=AwqsysHT3vBot+ANb1OqKkaIqC
	DLraWoJpUrGI6RlTFa1Lqun8SGngk1ve9cgwfidzUUhbUfofPNjWNLPs5E9CnuVpJzoJ4x/+yrCFM
	LP8FGN/iWODYM1B6jD5g66fDw5WzENT9/59PAjcoJO+geZeAyWbLBsr/SJ6/zzDDaJmtWDt5Gzfxb
	4ieYmoqaWCnzQ/Vs83i7nDI7+0I2tDduD2+oYcAO/SxmWO9/gnThHVLwAbUCrf3eTI5pjCciHpdT0
	LgsNbFQBkwrbO31BqQr9qdyTvGHxhmbH/Tz89jkEnn5IvCi8INQaz+JRwniL1JB+h6ceX9Fp0yg1A
	aucxgBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwz8-00000002POT-40su;
	Mon, 15 Sep 2025 00:22:22 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwz6-00000002PO3-1lHJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 00:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757895740; x=1789431740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJkSQYxOXWu0k2KJiuOVXO5kgH5MayDdvjvPAtGHGYM=;
  b=JWg6BA7UboyzQL9m1GMld+VWmbRSc5CfyzdxDhqXHgzF13euKPhxeQyQ
   oyP+ReLLskTH+OsHYdvcDTP2I5/SXrKrmN84LcWasQ2pp79k4LYGUq+Vv
   Oan7vRdmGlRrUHEH+fW7HMGmejh3qDOPj7PJs4k+Wkj7IgsY9NE8fYC5o
   HufulvkOGNjTuJD6lzUJpQLJ4WqjAx+/R4n2Y//gWAA9UjtkSiXzBAbB9
   bRM6jY7jqtqTC8RIvj/uSPHWRaPDYkrsuI9V23WlVmbpAQBvbIXofYr3M
   dLO7s1fi41LBUijkn1yOiAChX3ok82FcpG5OiKR99vaHajUf8xQf/r1m3
   w==;
X-CSE-ConnectionGUID: EINd7Va0SK6PmIZZHTpwkQ==
X-CSE-MsgGUID: lWb2jzJcS2OgupLsKp18Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60251938"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="60251938"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 17:22:19 -0700
X-CSE-ConnectionGUID: H4K4DE/5R4WuP3WF+ZS+CA==
X-CSE-MsgGUID: eoQFNU4cQfqxFcJGZx4+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="174549673"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Sep 2025 17:22:18 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxwyw-0002pI-0B;
	Mon, 15 Sep 2025 00:22:11 +0000
Date: Mon, 15 Sep 2025 08:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:irq/ppi-affinity 18/25] drivers/perf/arm_pmu.c:68:35:
 sparse: sparse: cast removes address space '__percpu' of expression
Message-ID: <202509150852.4ziBllm5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_172220_493561_3C634113 
X-CRM114-Status: UNSURE (   9.00  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/ppi-affinity
head:   136dedfe26e7de871029de6ed7dcf555e840fadc
commit: 49964285d3074f0494d8f09dce6e120d623b7843 [18/25] perf: arm_pmu: Request specific affinities for percpu NMI/IRQ
config: arm-randconfig-r132-20250915 (https://download.01.org/0day-ci/archive/20250915/202509150852.4ziBllm5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509150852.4ziBllm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509150852.4ziBllm5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm_pmu.c:68:35: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/perf/arm_pmu.c:68:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got void ** @@
   drivers/perf/arm_pmu.c:68:35: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:68:35: sparse:     got void **
>> drivers/perf/arm_pmu.c:68:35: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/perf/arm_pmu.c:68:35: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/perf/arm_pmu.c:95:35: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/perf/arm_pmu.c:95:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got void ** @@
   drivers/perf/arm_pmu.c:95:35: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:95:35: sparse:     got void **
   drivers/perf/arm_pmu.c:95:35: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/perf/arm_pmu.c:95:35: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +68 drivers/perf/arm_pmu.c

    64	
    65	static void armpmu_free_percpu_pmuirq(unsigned int irq, int cpu,
    66					   void __percpu *devid)
    67	{
  > 68		struct arm_pmu *armpmu = *per_cpu_ptr((void **)devid, cpu);
    69	
    70		if (armpmu_count_irq_users(&armpmu->supported_cpus, irq) == 1)
    71			free_percpu_irq(irq, devid);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

