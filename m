Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3232EC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f54w4HL92YeMM5xUJcR/G80FWb2J/fTou8KCJx4Tijg=; b=yxI1wlP11URYOWjeR9mz8DL7+9
	UMWcw9P6M5YaiDiFZ5pUoGb9mwYiIZwDinsyCBq/xmbmEthmVFdLF8bQnGRQFTDQ0PwXZRbz+7Rm6
	pKImRugbWy1wkUtbJVWeqSuoquQvRB5nD3QCbA8duDKuDXmulQYeTYoX1J3r8c5/TCAM5C8nOTHSb
	JOK/rWFfj6hw06l/ougA96TlTSi+bngoDak6owgdDMnK7DyDaU5eM3tCiaKgOS5OtGz1scRh+my+p
	DqRVnSLWLuXTLmcVUIGHePg7M7Wn4FP+PKZj3U4YayKso3REtPYnCVQ94kg0L7OgcQqEYc0SgFVJg
	k/6mkx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdam-0000000FKSV-0U0U;
	Wed, 07 May 2025 12:09:40 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdWp-0000000FJFD-3SJS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 12:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746619535; x=1778155535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3pyGgWClMYscBdpdVLp+OKqxwL5YCezeLlm/6I+cQ8E=;
  b=Zgpq883QxojJZwUZ5l0q1VUttz27W93nEFp4XwwtllzTP5EhW1YpTcSL
   4k+3gsWhdKvbZIUJR4KvBSMtut+nfAx/8nPg7NECekeSa5LF259PwrVaP
   asmt6xNMOnwE4+EKTJdLgyyQ9E8E995QwfyEFuKn+WyqmGOBB77DsirzK
   aVTI96F20F2qwUi9Ybw8Vw6n8E45Xn5h0C713YJ4a4Zp02TM+1KLjpN7/
   5xKaVy7K3XutT2Oz7vNa5WAqxTHJa+0gQeIaMvyKgg9YutJhOTXVXJ4L5
   ARqi8GCQ4oyI+RfE75XIe0Uy+Y33UMy3K3myt0sUoMQvnZeFgX9j+jqMW
   g==;
X-CSE-ConnectionGUID: sDHR8AtBQVmUMj9KypHjpw==
X-CSE-MsgGUID: gJoJevT7RuqV+p2oYnn88Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48495357"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48495357"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:05:35 -0700
X-CSE-ConnectionGUID: x7MgS0ucRe6VmyPqZZmmAw==
X-CSE-MsgGUID: N5JZt78SRuyOP25jcGg0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="159237484"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 05:05:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdWl-0007kF-2M;
	Wed, 07 May 2025 12:05:31 +0000
Date: Wed, 7 May 2025 20:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 24/25] drivers/perf/arm_pmu.c:39:34: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202505072050.1SVaHUnk-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_050535_906790_1FFE5E68 
X-CRM114-Status: GOOD (  10.32  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   2017a5b657d38d470385b73ae1704eefe13bf2a5
commit: 460c9a4ca1d6db353ba1b4a628697afda752da04 [24/25] perf: arm_pmu: Use a PMU-specific pointer for percpu interrupt request
config: arm64-randconfig-r133-20250426 (https://download.01.org/0day-ci/archive/20250507/202505072050.1SVaHUnk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072050.1SVaHUnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072050.1SVaHUnk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm_pmu.c:39:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct arm_pmu [noderef] __percpu ** @@
   drivers/perf/arm_pmu.c:39:34: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:39:34: sparse:     got struct arm_pmu [noderef] __percpu **
>> drivers/perf/arm_pmu.c:39:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct arm_pmu *armpmu @@     got struct arm_pmu [noderef] __percpu * @@
   drivers/perf/arm_pmu.c:39:34: sparse:     expected struct arm_pmu *armpmu
   drivers/perf/arm_pmu.c:39:34: sparse:     got struct arm_pmu [noderef] __percpu *
>> drivers/perf/arm_pmu.c:41:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct pmu_hw_events [noderef] __percpu ** @@
   drivers/perf/arm_pmu.c:41:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:41:23: sparse:     got struct pmu_hw_events [noderef] __percpu **
>> drivers/perf/arm_pmu.c:41:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void * @@     got struct pmu_hw_events [noderef] __percpu * @@
   drivers/perf/arm_pmu.c:41:23: sparse:     expected void *
   drivers/perf/arm_pmu.c:41:23: sparse:     got struct pmu_hw_events [noderef] __percpu *
   drivers/perf/arm_pmu.c:52:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct arm_pmu [noderef] __percpu ** @@
   drivers/perf/arm_pmu.c:52:34: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:52:34: sparse:     got struct arm_pmu [noderef] __percpu **
   drivers/perf/arm_pmu.c:52:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct arm_pmu *armpmu @@     got struct arm_pmu [noderef] __percpu * @@
   drivers/perf/arm_pmu.c:52:34: sparse:     expected struct arm_pmu *armpmu
   drivers/perf/arm_pmu.c:52:34: sparse:     got struct arm_pmu [noderef] __percpu *
   drivers/perf/arm_pmu.c:54:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct pmu_hw_events [noderef] __percpu ** @@
   drivers/perf/arm_pmu.c:54:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:54:23: sparse:     got struct pmu_hw_events [noderef] __percpu **
>> drivers/perf/arm_pmu.c:54:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *dev_id @@     got struct pmu_hw_events [noderef] __percpu * @@
   drivers/perf/arm_pmu.c:54:23: sparse:     expected void *dev_id
   drivers/perf/arm_pmu.c:54:23: sparse:     got struct pmu_hw_events [noderef] __percpu *
   drivers/perf/arm_pmu.c:71:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct arm_pmu [noderef] __percpu ** @@
   drivers/perf/arm_pmu.c:71:34: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:71:34: sparse:     got struct arm_pmu [noderef] __percpu **
   drivers/perf/arm_pmu.c:71:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct arm_pmu *armpmu @@     got struct arm_pmu [noderef] __percpu * @@
   drivers/perf/arm_pmu.c:71:34: sparse:     expected struct arm_pmu *armpmu
   drivers/perf/arm_pmu.c:71:34: sparse:     got struct arm_pmu [noderef] __percpu *
   drivers/perf/arm_pmu.c:98:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct arm_pmu [noderef] __percpu ** @@
   drivers/perf/arm_pmu.c:98:34: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:98:34: sparse:     got struct arm_pmu [noderef] __percpu **
   drivers/perf/arm_pmu.c:98:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct arm_pmu *armpmu @@     got struct arm_pmu [noderef] __percpu * @@
   drivers/perf/arm_pmu.c:98:34: sparse:     expected struct arm_pmu *armpmu
   drivers/perf/arm_pmu.c:98:34: sparse:     got struct arm_pmu [noderef] __percpu *
>> drivers/perf/arm_pmu.c:633:58: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct arm_pmu [noderef] __percpu *devid @@     got struct arm_pmu *static [noderef] [toplevel] __percpu cpu_armpmu @@
   drivers/perf/arm_pmu.c:633:58: sparse:     expected struct arm_pmu [noderef] __percpu *devid
   drivers/perf/arm_pmu.c:633:58: sparse:     got struct arm_pmu *static [noderef] [toplevel] __percpu cpu_armpmu
   drivers/perf/arm_pmu.c:665:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct pmu_hw_events [noderef] __percpu ** @@
   drivers/perf/arm_pmu.c:665:35: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:665:35: sparse:     got struct pmu_hw_events [noderef] __percpu **
>> drivers/perf/arm_pmu.c:665:35: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *dev @@     got struct pmu_hw_events [noderef] __percpu * @@
   drivers/perf/arm_pmu.c:665:35: sparse:     expected void *dev
   drivers/perf/arm_pmu.c:665:35: sparse:     got struct pmu_hw_events [noderef] __percpu *
   drivers/perf/arm_pmu.c:670:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct pmu_hw_events [noderef] __percpu ** @@
   drivers/perf/arm_pmu.c:670:43: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:670:43: sparse:     got struct pmu_hw_events [noderef] __percpu **
   drivers/perf/arm_pmu.c:670:43: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *dev @@     got struct pmu_hw_events [noderef] __percpu * @@
   drivers/perf/arm_pmu.c:670:43: sparse:     expected void *dev
   drivers/perf/arm_pmu.c:670:43: sparse:     got struct pmu_hw_events [noderef] __percpu *
>> drivers/perf/arm_pmu.c:633:58: sparse: sparse: dereference of noderef expression

vim +39 drivers/perf/arm_pmu.c

    36	
    37	static void armpmu_free_pmuirq(unsigned int irq, int cpu, struct arm_pmu __percpu *devid)
    38	{
  > 39		struct arm_pmu *armpmu = per_cpu(devid, cpu);
    40	
  > 41		free_irq(irq, per_cpu(armpmu->hw_events, cpu));
    42	}
    43	
    44	static const struct pmu_irq_ops pmuirq_ops = {
    45		.enable_pmuirq = enable_irq,
    46		.disable_pmuirq = disable_irq_nosync,
    47		.free_pmuirq = armpmu_free_pmuirq
    48	};
    49	
    50	static void armpmu_free_pmunmi(unsigned int irq, int cpu, struct arm_pmu __percpu *devid)
    51	{
  > 52		struct arm_pmu *armpmu = per_cpu(devid, cpu);
    53	
  > 54		free_nmi(irq, per_cpu(armpmu->hw_events, cpu));
    55	}
    56	
    57	static const struct pmu_irq_ops pmunmi_ops = {
    58		.enable_pmuirq = enable_nmi,
    59		.disable_pmuirq = disable_nmi_nosync,
    60		.free_pmuirq = armpmu_free_pmunmi
    61	};
    62	
    63	static void armpmu_enable_percpu_pmuirq(unsigned int irq)
    64	{
    65		enable_percpu_irq(irq, IRQ_TYPE_NONE);
    66	}
    67	
    68	static void armpmu_free_percpu_pmuirq(unsigned int irq, int cpu,
    69					      struct arm_pmu __percpu *devid)
    70	{
  > 71		struct arm_pmu *armpmu = per_cpu(devid, cpu);
    72	
    73		if (armpmu_count_irq_users(cpu, irq) == 1)
    74			free_percpu_irq(irq, armpmu->hw_events);
    75	}
    76	
    77	static const struct pmu_irq_ops percpu_pmuirq_ops = {
    78		.enable_pmuirq = armpmu_enable_percpu_pmuirq,
    79		.disable_pmuirq = disable_percpu_irq,
    80		.free_pmuirq = armpmu_free_percpu_pmuirq
    81	};
    82	
    83	static void armpmu_enable_percpu_pmunmi(unsigned int irq)
    84	{
    85		if (!prepare_percpu_nmi(irq))
    86			enable_percpu_nmi(irq, IRQ_TYPE_NONE);
    87	}
    88	
    89	static void armpmu_disable_percpu_pmunmi(unsigned int irq)
    90	{
    91		disable_percpu_nmi(irq);
    92		teardown_percpu_nmi(irq);
    93	}
    94	
    95	static void armpmu_free_percpu_pmunmi(unsigned int irq, int cpu,
    96					      struct arm_pmu __percpu *devid)
    97	{
  > 98		struct arm_pmu *armpmu = per_cpu(devid, cpu);
    99	
   100		if (armpmu_count_irq_users(cpu, irq) == 1)
   101			free_percpu_nmi(irq, armpmu->hw_events);
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

