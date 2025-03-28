Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B63BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wiwQvgCNIerSur6yC3Bjkj13oTZTFgo6Yme2COtHyOo=; b=HJGqVfiCKdbVrPhnHTFbIDq6gk
	U7VVvSEApU0ioTsfXg6vjGS4H/QCmGonFEftuODyt/xtO9I5uH29TfViexAwrjAFrRHzi1HtkRefi
	oYA/6vVZelgFFlCiVqVIfcYLc77+RnIJb7Fy1ZhYIXvdJ2pKHa92Nc8a3nanWPgGvc+d4zCPD+J0a
	VAo1oZl7FTGJlwPeUAr+r40zjD2EUpUZado0JgJYB+8aR7mQBWj5fwK8makH+X58ycWMCLEOkT28T
	rB3F8jg7+o+BZrB9cHyM/17FZEpCw4oq2mXTzxHTle+OoS7XGd/Y0dJeSwl0aN219YgNDzWZdi9lN
	6u9eI5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8wW-0000000DK62-2WD9;
	Fri, 28 Mar 2025 12:36:12 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8tX-0000000DJoM-0hUG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 12:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743165188; x=1774701188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8bKHVL6pB8J+AtOmNlBwJ3zl4qZj5T6Qp+MRFa1IMc=;
  b=AYGU11+BCnvnSKoJNiPAqckiPKowXfFE1QRPaHXuZfwsntukhbpW+klC
   S8ar+/IbNjLlMJrYRGX0pBDaWMjG74V5BOYBWZFhk6U4MFLcftjQd5wWE
   lTZi21taE0I7ZJoqGFAXXmAROwrmGv9r/eyb0LEQkdDvVNWErJQaXCUkK
   sJ8nb1SLPnpGs0VI7LaA/vHYF4SCkxuU0ZOePbIjnnsU6ysQeuOLS0eF8
   rNjU4sE3pbvDl/0moEZ7J2iS6vNf+JnQWYaY7eRl/24zPmjZgzxzLUF7M
   O8gdnoUl9QnugpgAZkoHtBRe9N6PdEz8w0k7wQMkOtRQ7gJaL7v5s7S43
   g==;
X-CSE-ConnectionGUID: FH5a4YarQfeFbNmV0DTtvA==
X-CSE-MsgGUID: 6HGaQrzbQpeMc/XqOVvRcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44245818"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44245818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 05:33:07 -0700
X-CSE-ConnectionGUID: XK8XL53dQUGzHKcidPntcQ==
X-CSE-MsgGUID: WdQvG5FpQTyRKgcOvvAY9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="126360850"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2025 05:33:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty8tS-0007Ri-28;
	Fri, 28 Mar 2025 12:33:02 +0000
Date: Fri, 28 Mar 2025 20:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/17] kernel/irq/manage.c:2619:22: warning:
 assignment makes pointer from integer without a cast
Message-ID: <202503282049.7rjXBkvh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_053307_251232_B9F55B89 
X-CRM114-Status: GOOD (  15.60  )
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
config: sparc-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503282049.7rjXBkvh-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503282049.7rjXBkvh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503282049.7rjXBkvh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/irq_32.h:16:0,
                    from arch/sparc/include/asm/irq.h:7,
                    from include/linux/irq.h:23,
                    from kernel/irq/manage.c:11:
   include/linux/interrupt.h:130:2: error: expected identifier or '(' before 'struct'
     struct irqaction *next;
     ^~~~~~
   In file included from kernel/irq/manage.c:25:0:
   kernel/irq/manage.c: In function 'irq_set_thread_affinity':
   kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^
   kernel/irq/manage.c:194:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action) {
     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function 'irq_wake_thread':
   kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^
   kernel/irq/manage.c:1350:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action) {
     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function '__setup_irq':
   kernel/irq/manage.c:1662:18: error: 'struct irqaction' has no member named 'next'
       old_ptr = &old->next;
                     ^~
   kernel/irq/manage.c: In function '__free_irq':
   kernel/irq/manage.c:1902:23: error: 'struct irqaction' has no member named 'next'
      action_ptr = &action->next;
                          ^~
   kernel/irq/manage.c:1906:22: error: 'struct irqaction' has no member named 'next'
     *action_ptr = action->next;
                         ^~
   kernel/irq/manage.c: In function '__request_percpu_irq':
   kernel/irq/manage.c:2619:24: error: implicit declaration of function 'alloc_cpumask'; did you mean 'alloc_cpumask_var'? [-Werror=implicit-function-declaration]
      action->valid_mask = alloc_cpumask()
                           ^~~~~~~~~~~~~
                           alloc_cpumask_var
>> kernel/irq/manage.c:2619:22: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      action->valid_mask = alloc_cpumask()
                         ^
   kernel/irq/manage.c:2620:2: error: expected ';' before '}' token
     }
     ^
   cc1: some warnings being treated as errors


vim +2619 kernel/irq/manage.c

  2577	
  2578	/**
  2579	 *	__request_percpu_irq - allocate a percpu interrupt line
  2580	 *	@irq: Interrupt line to allocate
  2581	 *	@handler: Function to be called when the IRQ occurs.
  2582	 *	@flags: Interrupt type flags (IRQF_TIMER only)
  2583	 *	@devname: An ascii name for the claiming device
  2584	 *	@dev_id: A percpu cookie passed back to the handler function
  2585	 *
  2586	 *	This call allocates interrupt resources and enables the
  2587	 *	interrupt on the local CPU. If the interrupt is supposed to be
  2588	 *	enabled on other CPUs, it has to be done on each CPU using
  2589	 *	enable_percpu_irq().
  2590	 *
  2591	 *	Dev_id must be globally unique. It is a per-cpu variable, and
  2592	 *	the handler gets called with the interrupted CPU's instance of
  2593	 *	that variable.
  2594	 */
  2595	int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
  2596				 unsigned long flags, const char *devname,
  2597				 const cpumask_t *valid_mask, void __percpu *dev_id)
  2598	{
  2599		struct irqaction *action;
  2600		struct irq_desc *desc;
  2601		int retval;
  2602	
  2603		if (!dev_id)
  2604			return -EINVAL;
  2605	
  2606		desc = irq_to_desc(irq);
  2607		if (!desc || !irq_settings_can_request(desc) ||
  2608		    !irq_settings_is_per_cpu_devid(desc))
  2609			return -EINVAL;
  2610	
  2611		if (flags && flags != IRQF_TIMER)
  2612			return -EINVAL;
  2613	
  2614		action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
  2615		if (!action)
  2616			return -ENOMEM;
  2617	
  2618		if (valid_mask != cpu_possible_mask) {
> 2619			action->valid_mask = alloc_cpumask()
  2620		}
  2621	
  2622		action->handler = handler;
  2623		action->flags = flags | IRQF_PERCPU | IRQF_NO_SUSPEND;
  2624		action->name = devname;
  2625		action->percpu_dev_id = dev_id;
  2626	
  2627		retval = irq_chip_pm_get(&desc->irq_data);
  2628		if (retval < 0) {
  2629			kfree(action);
  2630			return retval;
  2631		}
  2632	
  2633		retval = __setup_irq(irq, desc, action);
  2634	
  2635		if (retval) {
  2636			irq_chip_pm_put(&desc->irq_data);
  2637			kfree(action);
  2638		}
  2639	
  2640		return retval;
  2641	}
  2642	EXPORT_SYMBOL_GPL(__request_percpu_irq);
  2643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

