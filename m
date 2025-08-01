Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D4EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 04:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dPz+tpWDKsHmVSqra8RNl6xyeS/BIdYAq6BDfemNfgM=; b=evEmed2tLYpfDKqM10u9Ee9TZf
	nEWRQtEI3xSlwP2EGeDfJK/yUrn4+YlCHNAOOjeReKhBVinNRc60CN3Nn5BqJJm+tJdd9R4Pr1bql
	Pm1zC+uf0i4IRN9UyhAZfBz8tm93yYhB27jGwsRZbknokMNWwDUc8GS8SgeATCJT82FBNDddDMVvV
	NXNet+T/hl6qUFO8o27KQndNeVzCwVXpYv02jEa1eN5TDL2bcId0kUbM68JaWLgA/I+FLD2/cCDky
	d8DHujOKS2khqBRkmhPVBOFhIrhzpNd/T1QFRK0DwP3kMC4sBDCrv3jGd1wSewst8q4KS6ISWlNQ0
	PJVKCT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhhgi-00000004yl7-3ali;
	Fri, 01 Aug 2025 04:48:12 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhhUP-00000004wUH-3VRz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 04:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754022930; x=1785558930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTLT1dq7i2qzp0hHgS3vNWQnXKcncg8giv7jdsQgm8I=;
  b=BWKx9QspJDA13YV41Y1OB01/q53r1wBhllWytiflrNFY7wEixcEORpSa
   4W/i/WaVEuKxIaxjtoRpUuZU79LNACqaizQJbsJomdTnGmJMZjqNCt/cw
   Qck4n394y6OK5LfL6iwxq9fvMWJ3NlMlOPwBUd5kWiH87OTPOSjrJttng
   vDhX8ZWkf7reEPND0NsH718zvAswQQ5KjXEM9N9V2oaokbyWnLBUuAQdW
   qfjQL/022r+RKiOyWBS5/vm6CpS+kyLUmmxX7N8yWshaDDyur+Kna7lmr
   4JnGESjNolyosFabe391Lurt2JZn+qUkzqM27LcKkScN8vYxBBiYYOXE4
   w==;
X-CSE-ConnectionGUID: Afu7h62SRJG9q1/4L9EDow==
X-CSE-MsgGUID: RwTa7CyGRCGBJ3Voz26xww==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66930944"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="66930944"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 21:35:24 -0700
X-CSE-ConnectionGUID: 1VncATKzQOquOek9KfYVww==
X-CSE-MsgGUID: 4GwLvG45RfyrhOp2lOwc/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163373909"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Jul 2025 21:35:23 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhhUG-0004M8-2O;
	Fri, 01 Aug 2025 04:35:20 +0000
Date: Fri, 1 Aug 2025 12:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 25/25] kernel/irq/manage.c:2453:5: warning:
 no previous prototype for function 'add_percpu_irq_target'
Message-ID: <202508011211.XM88eJmr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_213529_930024_B13F6587 
X-CRM114-Status: GOOD (  13.44  )
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
head:   8a3b504aca25e8c9a274cb563d63a6b9454b2780
commit: 8a3b504aca25e8c9a274cb563d63a6b9454b2780 [25/25] WIP
config: i386-buildonly-randconfig-001-20250801 (https://download.01.org/0day-ci/archive/20250801/202508011211.XM88eJmr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011211.XM88eJmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011211.XM88eJmr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/manage.c:2466:27: error: incompatible pointer types initializing 'struct irq_action *' with an expression of type 'struct irqaction **' [-Werror,-Wincompatible-pointer-types]
    2466 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
         |                                         ^     ~~~~~~~~~~~~~
   kernel/irq/manage.c:2466:62: error: incomplete definition of type 'struct irq_action'
    2466 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
         |                                                                         ~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2467:48: error: incomplete definition of type 'struct irq_action'
    2467 |                         if (cpumask_test_cpu(smp_processor_id(), tmp->affinity))
         |                                                                  ~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2470:11: error: incomplete definition of type 'struct irq_action'
    2470 |                         if (tmp->percpu_dev_id == dev_id)
         |                             ~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2474:45: error: incomplete definition of type 'struct irq_action'
    2474 |                 cpumask_set_cpu(smp_processor_id(), action->affinity);
         |                                                     ~~~~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2477:28: error: incomplete definition of type 'struct irq_action'
    2477 |                 if (cpumask_weight(action->affinity) == nr_possible_cpus())
         |                                    ~~~~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
   kernel/irq/manage.c:2477:43: error: call to undeclared function 'nr_possible_cpus'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2477 |                 if (cpumask_weight(action->affinity) == nr_possible_cpus())
         |                                                         ^
   kernel/irq/manage.c:2478:10: error: incomplete definition of type 'struct irq_action'
    2478 |                         action->flags &= ~IRQF_SHARED;
         |                         ~~~~~~^
   kernel/irq/manage.c:2461:10: note: forward declaration of 'struct irq_action'
    2461 |                 struct irq_action *action = NULL;
         |                        ^
>> kernel/irq/manage.c:2453:5: warning: no previous prototype for function 'add_percpu_irq_target' [-Wmissing-prototypes]
    2453 | int add_percpu_irq_target(unsigned int irq, void __percpu *dev_id)
         |     ^
   kernel/irq/manage.c:2453:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2453 | int add_percpu_irq_target(unsigned int irq, void __percpu *dev_id)
         | ^
         | static 
   kernel/irq/manage.c:2495:27: error: incompatible pointer types initializing 'struct irq_action *' with an expression of type 'struct irqaction **' [-Werror,-Wincompatible-pointer-types]
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                                         ^     ~~~~~~~~~~~~~
   kernel/irq/manage.c:2495:62: error: incomplete definition of type 'struct irq_action'
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                                                                         ~~~^
   kernel/irq/manage.c:2495:15: note: forward declaration of 'struct irq_action'
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                             ^
   kernel/irq/manage.c:2496:58: error: incomplete definition of type 'struct irq_action'
    2496 |                         if (cpumask_test_and_clear_cpu(smp_processor_id(), tmp->affinity)) {
         |                                                                            ~~~^
   kernel/irq/manage.c:2495:15: note: forward declaration of 'struct irq_action'
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                             ^
   kernel/irq/manage.c:2497:44: error: call to undeclared function 'nr_possible_cpus'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2497 |                                 if (cpumask_weight(action->affinity) < nr_possible_cpus())
         |                                                                        ^
   kernel/irq/manage.c:2497:24: error: use of undeclared identifier 'action'
    2497 |                                 if (cpumask_weight(action->affinity) < nr_possible_cpus())
         |                                                    ^
   kernel/irq/manage.c:2498:6: error: use of undeclared identifier 'action'
    2498 |                                         action->flags |= IRQF_SHARED;
         |                                         ^
>> kernel/irq/manage.c:2484:5: warning: no previous prototype for function 'remove_percpu_irq_target' [-Wmissing-prototypes]
    2484 | int remove_percpu_irq_target(unsigned int irq)
         |     ^
   kernel/irq/manage.c:2484:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2484 | int remove_percpu_irq_target(unsigned int irq)
         | ^
         | static 
   2 warnings and 14 errors generated.


vim +/add_percpu_irq_target +2453 kernel/irq/manage.c

  2452	
> 2453	int add_percpu_irq_target(unsigned int irq, void __percpu *dev_id)
  2454	{
  2455		struct irq_desc *desc = irq_to_desc(irq);
  2456	
  2457		if (!desc || !irq_settings_is_per_cpu_devid(desc))
  2458			return -EINVAL;
  2459	
  2460		scoped_guard(raw_spinlock_irqsave, &desc->lock) {
  2461			struct irq_action *action = NULL;
  2462	
  2463			if (cpumask_test_cpu(smp_processor_id(), desc->percpu_enabled))
  2464				return -EINVAL;
  2465	
  2466			for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
  2467				if (cpumask_test_cpu(smp_processor_id(), tmp->affinity))
  2468					return -EINVAL;
  2469	
  2470				if (tmp->percpu_dev_id == dev_id)
  2471					action = tmp;
  2472			}
  2473	
  2474			cpumask_set_cpu(smp_processor_id(), action->affinity);
  2475	
  2476			/* If we have a full house, indicate we can't share anymore */
> 2477			if (cpumask_weight(action->affinity) == nr_possible_cpus())
  2478				action->flags &= ~IRQF_SHARED;
  2479		}
  2480	
  2481		return 0;
  2482	}
  2483	
> 2484	int remove_percpu_irq_target(unsigned int irq)
  2485	{
  2486		struct irq_desc *desc = irq_to_desc(irq);
  2487	
  2488		if (!desc || !irq_settings_is_per_cpu_devid(desc))
  2489			return -EINVAL;
  2490	
  2491		scoped_guard(raw_spinlock_irqsave, &desc->lock) {
  2492			if (cpumask_test_cpu(smp_processor_id(), desc->percpu_enabled))
  2493				return -EINVAL;
  2494	
  2495			for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
  2496				if (cpumask_test_and_clear_cpu(smp_processor_id(), tmp->affinity)) {
> 2497					if (cpumask_weight(action->affinity) < nr_possible_cpus())
  2498						action->flags |= IRQF_SHARED;
  2499	
  2500					return 0;
  2501				}
  2502		}
  2503	
  2504		return -ENOENT;
  2505	}
  2506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

