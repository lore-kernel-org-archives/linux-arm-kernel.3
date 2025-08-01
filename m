Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBBAC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 04:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=USq0IHQKeB393/lU3gx6AnFF4Az/silmxEN9hKBvoOg=; b=XAkebmhPMoXCEPFf/UkJpjLBAo
	UQzKLwmtyJygrtxmOs449/4QO7F5iIllSRqt9/O+c2T3mURcfJLi6zbRWfpSwazLxnkowrDvyewx0
	cz5SvxtSP9ObRBUojX1cuxgF0ixPX3cxvOO0UuoecORmeSqEJyvfj1oR8FlOkzhoIPsRAdOD5v78L
	kxxwgZNWMWEE/vP68DIMH78wCgZYkDcbY6oYbgcFssTud1L3JKxFwdb7/cNoL95E2ryexon+JfZ/S
	BxQ/vtbbeZkW9EgJhsab8nfEr9NE4eSgzHbdZBFWuxoLAVd02DUiDT+wnFFeGE2ztc3sr3RBkgRSr
	G8fK8vew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhh1x-00000004unF-3IDt;
	Fri, 01 Aug 2025 04:06:05 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhgzN-00000004uWc-1zAz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 04:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754021005; x=1785557005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RH88CElOM73qe5Gp4wA7rpTpR2LMaFx/xlQ73c0WDyk=;
  b=muYu6Iz/c8IZy2ySECWTKL7HwwoOpKcHMlfkje2mabYnXjuq0Z0/7Y1U
   HtJjnd3AR9jUIJCJPNhKpl7kXXJpDBleEtdaeArNRtSjnu0Ondw8P2gXF
   jufsIIJ9Qy8FHz1xPKGWm3DHvKCSXAs+h63uvaTrjTx+GbJmiY3ihQH6/
   sTeVXGxO7qwQWZYTCsb8BQBzznCNcqso4W4/XedAPZe8W06Np1aUE47sK
   sNatspr0ylyKTEtg++AVhfiqBhDnWRJR72ovsj5zfVF/OMIv6UZDvnwHT
   /MEIsiCoN8RYBINRu8YJZTooIl68Xe5DVQFtPPYldkPcQ/nlbv51UmWCP
   g==;
X-CSE-ConnectionGUID: +53SNRFOSiicIp6Etn9Hzg==
X-CSE-MsgGUID: lFONwPyCRUur65qUJpaNRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56320935"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56320935"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 21:03:20 -0700
X-CSE-ConnectionGUID: CNdbwFEdS+ug5dAJmMJgww==
X-CSE-MsgGUID: y237KQWNRr2pWh83k0YBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163016432"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jul 2025 21:03:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhgzF-0004Ku-0f;
	Fri, 01 Aug 2025 04:03:17 +0000
Date: Fri, 1 Aug 2025 12:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 25/25] kernel/irq/manage.c:2466:47: error:
 initialization of 'struct irq_action *' from incompatible pointer type
 'struct irqaction **'
Message-ID: <202508011246.xuBfT6Ao-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_210325_595020_2B4CE281 
X-CRM114-Status: GOOD (  16.43  )
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
config: i386-buildonly-randconfig-002-20250801 (https://download.01.org/0day-ci/archive/20250801/202508011246.xuBfT6Ao-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011246.xuBfT6Ao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011246.xuBfT6Ao-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/irq/manage.c:2453:5: warning: no previous prototype for 'add_percpu_irq_target' [-Wmissing-prototypes]
    2453 | int add_percpu_irq_target(unsigned int irq, void __percpu *dev_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function 'add_percpu_irq_target':
>> kernel/irq/manage.c:2466:47: error: initialization of 'struct irq_action *' from incompatible pointer type 'struct irqaction **' [-Werror=incompatible-pointer-types]
    2466 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
         |                                               ^
>> kernel/irq/manage.c:2466:76: error: invalid use of undefined type 'struct irq_action'
    2466 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
         |                                                                            ^~
   kernel/irq/manage.c:2467:69: error: invalid use of undefined type 'struct irq_action'
    2467 |                         if (cpumask_test_cpu(smp_processor_id(), tmp->affinity))
         |                                                                     ^~
   kernel/irq/manage.c:2470:32: error: invalid use of undefined type 'struct irq_action'
    2470 |                         if (tmp->percpu_dev_id == dev_id)
         |                                ^~
   kernel/irq/manage.c:2474:59: error: invalid use of undefined type 'struct irq_action'
    2474 |                 cpumask_set_cpu(smp_processor_id(), action->affinity);
         |                                                           ^~
   kernel/irq/manage.c:2477:42: error: invalid use of undefined type 'struct irq_action'
    2477 |                 if (cpumask_weight(action->affinity) == nr_possible_cpus())
         |                                          ^~
>> kernel/irq/manage.c:2477:57: error: implicit declaration of function 'nr_possible_cpus'; did you mean 'num_possible_cpus'? [-Werror=implicit-function-declaration]
    2477 |                 if (cpumask_weight(action->affinity) == nr_possible_cpus())
         |                                                         ^~~~~~~~~~~~~~~~
         |                                                         num_possible_cpus
   kernel/irq/manage.c:2478:31: error: invalid use of undefined type 'struct irq_action'
    2478 |                         action->flags &= ~IRQF_SHARED;
         |                               ^~
   kernel/irq/manage.c: At top level:
>> kernel/irq/manage.c:2484:5: warning: no previous prototype for 'remove_percpu_irq_target' [-Wmissing-prototypes]
    2484 | int remove_percpu_irq_target(unsigned int irq)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function 'remove_percpu_irq_target':
   kernel/irq/manage.c:2495:47: error: initialization of 'struct irq_action *' from incompatible pointer type 'struct irqaction **' [-Werror=incompatible-pointer-types]
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                                               ^
>> kernel/irq/manage.c:2495:17: error: 'struct irq_action' declared in 'for' loop initial declaration
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                 ^~~
   kernel/irq/manage.c:2495:76: error: invalid use of undefined type 'struct irq_action'
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                                                                            ^~
   kernel/irq/manage.c:2496:79: error: invalid use of undefined type 'struct irq_action'
    2496 |                         if (cpumask_test_and_clear_cpu(smp_processor_id(), tmp->affinity)) {
         |                                                                               ^~
>> kernel/irq/manage.c:2497:52: error: 'action' undeclared (first use in this function); did you mean 'no_action'?
    2497 |                                 if (cpumask_weight(action->affinity) < nr_possible_cpus())
         |                                                    ^~~~~~
         |                                                    no_action
   kernel/irq/manage.c:2497:52: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +2466 kernel/irq/manage.c

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
> 2466			for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
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
> 2495			for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
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

