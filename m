Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46153C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LI4XnnJ8uMI+S2EsajD6FIicBwRXFo8M9bPJ9hNkZCI=; b=Cpj6aZowPHKZYiKYbPTF2DZYla
	ZePzJDgmZ/Z/LPyLhYZ7BUvna3VlHj4f1zaClq5Xb3yeanKbNZU+gdn8Ck7sUa1HP+mTKZLwHj3x2
	E0zfsvO8pjiHH7AjENaIKEvfrocco/23bzxziHNO2RiM4d3aS5OZzOsql1yBq3GBCwBGBtN0/pDCC
	5xs4jgJMl9Xeb4g/CnOekmQGbW29r/Q2E0AgF8azQ1kUkiy67sqPE6DbevNTqq0gBrvMMk+4DL1tt
	NRyRS6ZZUddCNk2L10h8/2oALTSM0eks/Jf47rqang7Gcrgal3b4lTIEYi6ogN9l5ktB8OQZEdldH
	ZkinShGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyETE-0000000E6p4-312s;
	Fri, 28 Mar 2025 18:30:20 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyERU-0000000E6ex-054S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 18:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743186512; x=1774722512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=heWJyGVjzqaT+WCJXTAuSkwIwCGqctjljBgF1ZeXxpI=;
  b=Ud/JLFTJQrh7P/MpMuxQUS/7vmT8sthz0GHbj/L+Mmy+JxifX1OubvyL
   wlolGMUoPQE3bKan5KeZ6FB5tR42LCrcXa1TmQ9OMe3bj8k8FaCCthWS6
   pmzaZ2Ues9yxvNSZtcQMqpzpRQmctu+OjENHEIEea79+UfM0v0aFh7QIh
   NZ1dvODPV9pN+7aBtzUAFKRVNXzURuFps2e3QwtghjFUW3u7AXqHCqA/e
   W9/BoRsGqAoWA6LHvs8WM9vfXYP3n09lLZym1D586gQzBPdei87N4zZAk
   ontj/U84udQXsy5Ncv1kKg7T4Virl9/iR97/fsZ86K1UMXExWORkW4zxD
   g==;
X-CSE-ConnectionGUID: FajpwDODRD2uKK+lKwUlLw==
X-CSE-MsgGUID: qF+KjLmGSmiR/MQjQcM/kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44452553"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="44452553"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 11:28:28 -0700
X-CSE-ConnectionGUID: RzIePqphSjyh1FR52/lWrg==
X-CSE-MsgGUID: 0jQpNG+3RrmNhLmq+dALSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="125502815"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2025 11:28:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyERJ-0007d8-1d;
	Fri, 28 Mar 2025 18:28:22 +0000
Date: Sat, 29 Mar 2025 02:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/17]
 drivers/irqchip/irq-stm32-exti.c:382:22: warning: shift count >= width of
 type
Message-ID: <202503290229.BUv4UWwI-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_112832_102542_077E0E8F 
X-CRM114-Status: GOOD (  12.02  )
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
head:   e9141d0584201dc14a70533175804e111ab53f36
commit: e9141d0584201dc14a70533175804e111ab53f36 [17/17] WIP
config: arm-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250329/202503290229.BUv4UWwI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290229.BUv4UWwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290229.BUv4UWwI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-stm32-exti.c:9:
   include/linux/interrupt.h:130:2: error: expected member name or ';' after declaration specifiers
     129 |         cpumask_t               *valid_mask,
         |         ~~~~~~~~~
     130 |         struct irqaction        *next;
         |         ^
   include/linux/interrupt.h:129:25: error: expected ';' at end of declaration list
     129 |         cpumask_t               *valid_mask,
         |                                             ^
         |                                             ;
>> drivers/irqchip/irq-stm32-exti.c:382:22: warning: shift count >= width of type [-Wshift-count-overflow]
     382 |                 gc->wake_enabled = IRQ_MSK(IRQS_PER_BANK);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:1223:41: note: expanded from macro 'IRQ_MSK'
    1223 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   1 warning and 2 errors generated.


vim +382 drivers/irqchip/irq-stm32-exti.c

f9fc1745501e7b9 Ludovic Barre    2018-04-26  333  
f9fc1745501e7b9 Ludovic Barre    2018-04-26  334  static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
f9fc1745501e7b9 Ludovic Barre    2018-04-26  335  				  struct device_node *node)
f9fc1745501e7b9 Ludovic Barre    2018-04-26  336  {
f9fc1745501e7b9 Ludovic Barre    2018-04-26  337  	struct stm32_exti_host_data *host_data;
e072041688ca73f Alexandre TORGUE 2016-09-20  338  	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
f9fc1745501e7b9 Ludovic Barre    2018-04-26  339  	int nr_irqs, ret, i;
e072041688ca73f Alexandre TORGUE 2016-09-20  340  	struct irq_chip_generic *gc;
e072041688ca73f Alexandre TORGUE 2016-09-20  341  	struct irq_domain *domain;
e072041688ca73f Alexandre TORGUE 2016-09-20  342  
f9fc1745501e7b9 Ludovic Barre    2018-04-26  343  	host_data = stm32_exti_host_init(drv_data, node);
4096165d55218a6 Dan Carpenter    2018-08-08  344  	if (!host_data)
4096165d55218a6 Dan Carpenter    2018-08-08  345  		return -ENOMEM;
e072041688ca73f Alexandre TORGUE 2016-09-20  346  
f9fc1745501e7b9 Ludovic Barre    2018-04-26  347  	domain = irq_domain_add_linear(node, drv_data->bank_nr * IRQS_PER_BANK,
e072041688ca73f Alexandre TORGUE 2016-09-20  348  				       &irq_exti_domain_ops, NULL);
e072041688ca73f Alexandre TORGUE 2016-09-20  349  	if (!domain) {
f9c75bca44d4754 Yangtao Li       2018-11-23  350  		pr_err("%pOFn: Could not register interrupt domain.\n",
f9c75bca44d4754 Yangtao Li       2018-11-23  351  		       node);
e072041688ca73f Alexandre TORGUE 2016-09-20  352  		ret = -ENOMEM;
e072041688ca73f Alexandre TORGUE 2016-09-20  353  		goto out_unmap;
e072041688ca73f Alexandre TORGUE 2016-09-20  354  	}
e072041688ca73f Alexandre TORGUE 2016-09-20  355  
6dd64ee17e04c39 Ludovic Barre    2017-11-06  356  	ret = irq_alloc_domain_generic_chips(domain, IRQS_PER_BANK, 1, "exti",
e072041688ca73f Alexandre TORGUE 2016-09-20  357  					     handle_edge_irq, clr, 0, 0);
e072041688ca73f Alexandre TORGUE 2016-09-20  358  	if (ret) {
e81f54c668d89e5 Rob Herring      2017-07-18  359  		pr_err("%pOF: Could not allocate generic interrupt chip.\n",
e81f54c668d89e5 Rob Herring      2017-07-18  360  		       node);
e072041688ca73f Alexandre TORGUE 2016-09-20  361  		goto out_free_domain;
e072041688ca73f Alexandre TORGUE 2016-09-20  362  	}
e072041688ca73f Alexandre TORGUE 2016-09-20  363  
f9fc1745501e7b9 Ludovic Barre    2018-04-26  364  	for (i = 0; i < drv_data->bank_nr; i++) {
f9fc1745501e7b9 Ludovic Barre    2018-04-26  365  		const struct stm32_exti_bank *stm32_bank;
f9fc1745501e7b9 Ludovic Barre    2018-04-26  366  		struct stm32_exti_chip_data *chip_data;
6dd64ee17e04c39 Ludovic Barre    2017-11-06  367  
f9fc1745501e7b9 Ludovic Barre    2018-04-26  368  		stm32_bank = drv_data->exti_banks[i];
cfbf9e497094dcf Fabien Dessenne  2019-04-17  369  		chip_data = stm32_exti_chip_init(host_data, i, node);
d9e2b19b0274406 Ludovic Barre    2018-04-26  370  
6dd64ee17e04c39 Ludovic Barre    2017-11-06  371  		gc = irq_get_domain_generic_chip(domain, i * IRQS_PER_BANK);
6dd64ee17e04c39 Ludovic Barre    2017-11-06  372  
f9fc1745501e7b9 Ludovic Barre    2018-04-26  373  		gc->reg_base = host_data->base;
e072041688ca73f Alexandre TORGUE 2016-09-20  374  		gc->chip_types->type = IRQ_TYPE_EDGE_BOTH;
be6230f0c2bd5d2 Ludovic Barre    2018-04-26  375  		gc->chip_types->chip.irq_ack = stm32_irq_ack;
e072041688ca73f Alexandre TORGUE 2016-09-20  376  		gc->chip_types->chip.irq_mask = irq_gc_mask_clr_bit;
e072041688ca73f Alexandre TORGUE 2016-09-20  377  		gc->chip_types->chip.irq_unmask = irq_gc_mask_set_bit;
e072041688ca73f Alexandre TORGUE 2016-09-20  378  		gc->chip_types->chip.irq_set_type = stm32_irq_set_type;
d9e2b19b0274406 Ludovic Barre    2018-04-26  379  		gc->chip_types->chip.irq_set_wake = irq_gc_set_wake;
d9e2b19b0274406 Ludovic Barre    2018-04-26  380  		gc->suspend = stm32_irq_suspend;
d9e2b19b0274406 Ludovic Barre    2018-04-26  381  		gc->resume = stm32_irq_resume;
d9e2b19b0274406 Ludovic Barre    2018-04-26 @382  		gc->wake_enabled = IRQ_MSK(IRQS_PER_BANK);
d9e2b19b0274406 Ludovic Barre    2018-04-26  383  
6dd64ee17e04c39 Ludovic Barre    2017-11-06  384  		gc->chip_types->regs.mask = stm32_bank->imr_ofst;
d9e2b19b0274406 Ludovic Barre    2018-04-26  385  		gc->private = (void *)chip_data;
6dd64ee17e04c39 Ludovic Barre    2017-11-06  386  	}
e072041688ca73f Alexandre TORGUE 2016-09-20  387  
e072041688ca73f Alexandre TORGUE 2016-09-20  388  	nr_irqs = of_irq_count(node);
e072041688ca73f Alexandre TORGUE 2016-09-20  389  	for (i = 0; i < nr_irqs; i++) {
e072041688ca73f Alexandre TORGUE 2016-09-20  390  		unsigned int irq = irq_of_parse_and_map(node, i);
e072041688ca73f Alexandre TORGUE 2016-09-20  391  
e072041688ca73f Alexandre TORGUE 2016-09-20  392  		irq_set_handler_data(irq, domain);
e072041688ca73f Alexandre TORGUE 2016-09-20  393  		irq_set_chained_handler(irq, stm32_irq_handler);
e072041688ca73f Alexandre TORGUE 2016-09-20  394  	}
e072041688ca73f Alexandre TORGUE 2016-09-20  395  
e072041688ca73f Alexandre TORGUE 2016-09-20  396  	return 0;
e072041688ca73f Alexandre TORGUE 2016-09-20  397  
e072041688ca73f Alexandre TORGUE 2016-09-20  398  out_free_domain:
e072041688ca73f Alexandre TORGUE 2016-09-20  399  	irq_domain_remove(domain);
e072041688ca73f Alexandre TORGUE 2016-09-20  400  out_unmap:
f9fc1745501e7b9 Ludovic Barre    2018-04-26  401  	iounmap(host_data->base);
f9fc1745501e7b9 Ludovic Barre    2018-04-26  402  	kfree(host_data->chips_data);
f9fc1745501e7b9 Ludovic Barre    2018-04-26  403  	kfree(host_data);
e072041688ca73f Alexandre TORGUE 2016-09-20  404  	return ret;
e072041688ca73f Alexandre TORGUE 2016-09-20  405  }
e072041688ca73f Alexandre TORGUE 2016-09-20  406  

:::::: The code at line 382 was first introduced by commit
:::::: d9e2b19b02744068b1cc16ca7d5249a62e789601 irqchip/stm32: Add suspend support

:::::: TO: Ludovic Barre <ludovic.barre@st.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

