Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040FDC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DoBasGEsvs5t/rHphTAOa5cchMstJomgZEYiNCdM4mQ=; b=FI8MThkVcxbnkoKc08QwT9IdLN
	osjHcilBh8pcPnnANRj3kF65qYQVM9hzGbhIvaF3DUuHCQQINbTJKa0JOiNfaf+/3TAfLuIjRHgn0
	7j/fEtaIWekPi6D9N2dooB4JJjs+tQ7UHPcM73n/Xk3KdQOhCMamIA+tswOagKlW+O3VpcBk3EKqt
	xJhKlUeeQOxggyB3m4tSBXPuT4p4FUob0BrkyoezNFyvoo+WDx0hNqaqAf8AsIz49Pxy7mC8gUzRN
	unTVSGGYdAfAFzQKlAtR+R7+MttpfczJxfgEku27yDEiM9RWDycvBKkv9DARDbkUDA4So3Bg5osQS
	SK4xRpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8Rd-0000000DHhj-1Ojb;
	Fri, 28 Mar 2025 12:04:17 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8Ps-0000000DHb9-38J9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 12:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743163349; x=1774699349;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xmnJqb14Gk4dPi+KMR/AyDYmv+InQAS+NOzKpuzii+s=;
  b=f4oDMT9H2RPYOyPJ/eO/C7BzKxLzr9W546oKzAmFg/J6kyG0DOEbHqEy
   I3bmzeKcWc96yc4531Px4P/6H4qZ/K2OnXIWEcvNeKvV1pgRiEkHSWd6i
   ueW/W2/KIrWdzDktNEX3PgY3jcXBJRpss5D7zOJjW3GVLoKPB150EiTO3
   ctHY1TANFGbALLK0ot77LIUM7AiNShIjHDTaWsDnlEEevlRMZsXLKvVhG
   yOaC9Gf9U+jcs+q6QHtwAcGFIdWk8aK1CW2jaPpQgwps0eI6WAvgWy3B/
   epOcAVSFnt1MyCJh5GoKOTOXm+Ebe2vFk+nLfCW2zVzSSkubv/uuP3gAe
   A==;
X-CSE-ConnectionGUID: Flx0sRDgQ7qgutbRy145gg==
X-CSE-MsgGUID: j/a7Htl8THShyOsi2thadg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44628468"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44628468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 05:02:27 -0700
X-CSE-ConnectionGUID: Qxaam1EeT5WpDpHcTxDNYg==
X-CSE-MsgGUID: 9PS0Vqf3Tv+tYu0te3g98Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125330918"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2025 05:02:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty8Pi-0007QA-0s;
	Fri, 28 Mar 2025 12:02:19 +0000
Date: Fri, 28 Mar 2025 20:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/17] kernel/irq/manage.c:1662:18: error:
 'struct irqaction' has no member named 'next'
Message-ID: <202503281901.xEY7SZty-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_050228_894938_1B341500 
X-CRM114-Status: GOOD (  16.30  )
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
config: arm-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281901.xEY7SZty-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281901.xEY7SZty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281901.xEY7SZty-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/irq/proc.c:12:
   include/linux/interrupt.h:130:2: error: expected identifier or '(' before 'struct'
     struct irqaction *next;
     ^~~~~~
   In file included from kernel/irq/proc.c:16:
   kernel/irq/proc.c: In function 'name_unique':
>> kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^~
   kernel/irq/proc.c:306:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action) {
     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/proc.c: In function 'show_interrupts':
>> kernel/irq/proc.c:530:26: error: 'struct irqaction' has no member named 'next'
      while ((action = action->next) != NULL)
                             ^~
--
   In file included from kernel/irq/chip.c:14:
   include/linux/interrupt.h:130:2: error: expected identifier or '(' before 'struct'
     struct irqaction *next;
     ^~~~~~
   In file included from kernel/irq/chip.c:20:
   kernel/irq/chip.c: In function 'handle_nested_irq':
>> kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^~
   kernel/irq/chip.c:485:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action)
     ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/irq/irqdesc.c:13:
   include/linux/interrupt.h:130:2: error: expected identifier or '(' before 'struct'
     struct irqaction *next;
     ^~~~~~
   In file included from kernel/irq/irqdesc.c:20:
   kernel/irq/irqdesc.c: In function 'actions_show':
>> kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^~
   kernel/irq/irqdesc.c:356:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action) {
     ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/irq/handle.c:14:
   include/linux/interrupt.h:130:2: error: expected identifier or '(' before 'struct'
     struct irqaction *next;
     ^~~~~~
   In file included from kernel/irq/handle.c:21:
   kernel/irq/handle.c: In function '__handle_irq_event_percpu':
>> kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^~
   kernel/irq/handle.c:147:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action) {
     ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/irq/manage.c:15:
   include/linux/interrupt.h:130:2: error: expected identifier or '(' before 'struct'
     struct irqaction *next;
     ^~~~~~
   In file included from kernel/irq/manage.c:25:
   kernel/irq/manage.c: In function 'irq_wake_thread':
>> kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^~
   kernel/irq/manage.c:1350:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action) {
     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function '__setup_irq':
>> kernel/irq/manage.c:1662:18: error: 'struct irqaction' has no member named 'next'
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
>> kernel/irq/manage.c:2619:24: error: implicit declaration of function 'alloc_cpumask'; did you mean 'alloc_cpumask_var'? [-Werror=implicit-function-declaration]
      action->valid_mask = alloc_cpumask()
                           ^~~~~~~~~~~~~
                           alloc_cpumask_var
>> kernel/irq/manage.c:2619:22: warning: assignment to 'cpumask_t *' {aka 'struct cpumask *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
      action->valid_mask = alloc_cpumask()
                         ^
>> kernel/irq/manage.c:2619:39: error: expected ';' before '}' token
      action->valid_mask = alloc_cpumask()
                                          ^
                                          ;
     }
     ~                                     
   cc1: some warnings being treated as errors
--
   In file included from kernel/irq/spurious.c:11:
   include/linux/interrupt.h:130:2: error: expected identifier or '(' before 'struct'
     struct irqaction *next;
     ^~~~~~
   In file included from kernel/irq/spurious.c:15:
   kernel/irq/spurious.c: In function '__report_bad_irq':
>> kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^~
   kernel/irq/spurious.c:215:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action) {
     ^~~~~~~~~~~~~~~~~~~~~~~


vim +1662 kernel/irq/manage.c

2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1484  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1485  /*
^1da177e4c3f41 Linus Torvalds            2005-04-16  1486   * Internal function to register an irqaction - typically used to
^1da177e4c3f41 Linus Torvalds            2005-04-16  1487   * allocate special interrupts that are part of the architecture.
19d39a3810e703 Thomas Gleixner           2017-07-11  1488   *
19d39a3810e703 Thomas Gleixner           2017-07-11  1489   * Locking rules:
19d39a3810e703 Thomas Gleixner           2017-07-11  1490   *
19d39a3810e703 Thomas Gleixner           2017-07-11  1491   * desc->request_mutex	Provides serialization against a concurrent free_irq()
19d39a3810e703 Thomas Gleixner           2017-07-11  1492   *   chip_bus_lock	Provides serialization for slow bus operations
19d39a3810e703 Thomas Gleixner           2017-07-11  1493   *     desc->lock	Provides serialization against hard interrupts
19d39a3810e703 Thomas Gleixner           2017-07-11  1494   *
19d39a3810e703 Thomas Gleixner           2017-07-11  1495   * chip_bus_lock and desc->lock are sufficient for all other management and
19d39a3810e703 Thomas Gleixner           2017-07-11  1496   * interrupt related functions. desc->request_mutex solely serializes
19d39a3810e703 Thomas Gleixner           2017-07-11  1497   * request/free_irq().
^1da177e4c3f41 Linus Torvalds            2005-04-16  1498   */
d3c60047bdb031 Thomas Gleixner           2008-10-16  1499  static int
d3c60047bdb031 Thomas Gleixner           2008-10-16  1500  __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1501  {
f17c75453b2d19 Ingo Molnar               2009-02-17  1502  	struct irqaction *old, **old_ptr;
b5faba21a6805c Thomas Gleixner           2011-02-23  1503  	unsigned long flags, thread_mask = 0;
3b8249e759c701 Thomas Gleixner           2011-02-07  1504  	int ret, nested, shared = 0;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1505  
7d94f7ca401dd7 Yinghai Lu                2008-08-19  1506  	if (!desc)
c2b5a251b9feca Matthew Wilcox            2005-11-03  1507  		return -EINVAL;
c2b5a251b9feca Matthew Wilcox            2005-11-03  1508  
6b8ff3120c7583 Thomas Gleixner           2010-10-01  1509  	if (desc->irq_data.chip == &no_irq_chip)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1510  		return -ENOSYS;
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1511  	if (!try_module_get(desc->owner))
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1512  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1513  
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1514  	new->irq = irq;
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1515  
4b357daed698c9 Jon Hunter                2016-06-07  1516  	/*
4b357daed698c9 Jon Hunter                2016-06-07  1517  	 * If the trigger type is not specified by the caller,
4b357daed698c9 Jon Hunter                2016-06-07  1518  	 * then use the default for this interrupt.
4b357daed698c9 Jon Hunter                2016-06-07  1519  	 */
4b357daed698c9 Jon Hunter                2016-06-07  1520  	if (!(new->flags & IRQF_TRIGGER_MASK))
4b357daed698c9 Jon Hunter                2016-06-07  1521  		new->flags |= irqd_get_trigger_type(&desc->irq_data);
4b357daed698c9 Jon Hunter                2016-06-07  1522  
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1523  	/*
399b5da29b9f85 Thomas Gleixner           2009-08-13  1524  	 * Check whether the interrupt nests into another interrupt
399b5da29b9f85 Thomas Gleixner           2009-08-13  1525  	 * thread.
399b5da29b9f85 Thomas Gleixner           2009-08-13  1526  	 */
1ccb4e612f68ce Thomas Gleixner           2011-02-09  1527  	nested = irq_settings_is_nested_thread(desc);
399b5da29b9f85 Thomas Gleixner           2009-08-13  1528  	if (nested) {
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1529  		if (!new->thread_fn) {
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1530  			ret = -EINVAL;
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1531  			goto out_mput;
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1532  		}
399b5da29b9f85 Thomas Gleixner           2009-08-13  1533  		/*
399b5da29b9f85 Thomas Gleixner           2009-08-13  1534  		 * Replace the primary handler which was provided from
399b5da29b9f85 Thomas Gleixner           2009-08-13  1535  		 * the driver for non nested interrupt handling by the
399b5da29b9f85 Thomas Gleixner           2009-08-13  1536  		 * dummy function which warns when called.
399b5da29b9f85 Thomas Gleixner           2009-08-13  1537  		 */
399b5da29b9f85 Thomas Gleixner           2009-08-13  1538  		new->handler = irq_nested_primary_handler;
8d32a307e4faa8 Thomas Gleixner           2011-02-23  1539  	} else {
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1540  		if (irq_settings_can_thread(desc)) {
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1541  			ret = irq_setup_forced_threading(new);
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1542  			if (ret)
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1543  				goto out_mput;
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1544  		}
399b5da29b9f85 Thomas Gleixner           2009-08-13  1545  	}
399b5da29b9f85 Thomas Gleixner           2009-08-13  1546  
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1547  	/*
399b5da29b9f85 Thomas Gleixner           2009-08-13  1548  	 * Create a handler thread when a thread function is supplied
399b5da29b9f85 Thomas Gleixner           2009-08-13  1549  	 * and the interrupt does not nest into another interrupt
399b5da29b9f85 Thomas Gleixner           2009-08-13  1550  	 * thread.
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1551  	 */
399b5da29b9f85 Thomas Gleixner           2009-08-13  1552  	if (new->thread_fn && !nested) {
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1553  		ret = setup_irq_thread(new, irq, false);
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1554  		if (ret)
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1555  			goto out_mput;
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1556  		if (new->secondary) {
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1557  			ret = setup_irq_thread(new->secondary, irq, true);
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1558  			if (ret)
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1559  				goto out_thread;
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1560  		}
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1561  	}
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1562  
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1563  	/*
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1564  	 * Drivers are often written to work w/o knowledge about the
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1565  	 * underlying irq chip implementation, so a request for a
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1566  	 * threaded irq without a primary hard irq context handler
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1567  	 * requires the ONESHOT flag to be set. Some irq chips like
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1568  	 * MSI based interrupts are per se one shot safe. Check the
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1569  	 * chip flags, so we can avoid the unmask dance at the end of
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1570  	 * the threaded handler for those.
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1571  	 */
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1572  	if (desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE)
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1573  		new->flags &= ~IRQF_ONESHOT;
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1574  
19d39a3810e703 Thomas Gleixner           2017-07-11  1575  	/*
19d39a3810e703 Thomas Gleixner           2017-07-11  1576  	 * Protects against a concurrent __free_irq() call which might wait
519cc8652b3a1d Lukas Wunner              2018-06-24  1577  	 * for synchronize_hardirq() to complete without holding the optional
836557bd58e5e6 Lukas Wunner              2018-06-24  1578  	 * chip bus lock and desc->lock. Also protects against handing out
836557bd58e5e6 Lukas Wunner              2018-06-24  1579  	 * a recycled oneshot thread_mask bit while it's still in use by
836557bd58e5e6 Lukas Wunner              2018-06-24  1580  	 * its previous owner.
19d39a3810e703 Thomas Gleixner           2017-07-11  1581  	 */
9114014cf4e6df Thomas Gleixner           2017-06-29  1582  	mutex_lock(&desc->request_mutex);
19d39a3810e703 Thomas Gleixner           2017-07-11  1583  
19d39a3810e703 Thomas Gleixner           2017-07-11  1584  	/*
19d39a3810e703 Thomas Gleixner           2017-07-11  1585  	 * Acquire bus lock as the irq_request_resources() callback below
19d39a3810e703 Thomas Gleixner           2017-07-11  1586  	 * might rely on the serialization or the magic power management
19d39a3810e703 Thomas Gleixner           2017-07-11  1587  	 * functions which are abusing the irq_bus_lock() callback,
19d39a3810e703 Thomas Gleixner           2017-07-11  1588  	 */
19d39a3810e703 Thomas Gleixner           2017-07-11  1589  	chip_bus_lock(desc);
19d39a3810e703 Thomas Gleixner           2017-07-11  1590  
19d39a3810e703 Thomas Gleixner           2017-07-11  1591  	/* First installed action requests resources. */
46e48e257360f0 Thomas Gleixner           2017-06-29  1592  	if (!desc->action) {
46e48e257360f0 Thomas Gleixner           2017-06-29  1593  		ret = irq_request_resources(desc);
46e48e257360f0 Thomas Gleixner           2017-06-29  1594  		if (ret) {
46e48e257360f0 Thomas Gleixner           2017-06-29  1595  			pr_err("Failed to request resources for %s (irq %d) on irqchip %s\n",
46e48e257360f0 Thomas Gleixner           2017-06-29  1596  			       new->name, irq, desc->irq_data.chip->name);
19d39a3810e703 Thomas Gleixner           2017-07-11  1597  			goto out_bus_unlock;
46e48e257360f0 Thomas Gleixner           2017-06-29  1598  		}
46e48e257360f0 Thomas Gleixner           2017-06-29  1599  	}
9114014cf4e6df Thomas Gleixner           2017-06-29  1600  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1601  	/*
^1da177e4c3f41 Linus Torvalds            2005-04-16  1602  	 * The following block of code has to be executed atomically
19d39a3810e703 Thomas Gleixner           2017-07-11  1603  	 * protected against a concurrent interrupt and any of the other
19d39a3810e703 Thomas Gleixner           2017-07-11  1604  	 * management calls which are not serialized via
19d39a3810e703 Thomas Gleixner           2017-07-11  1605  	 * desc->request_mutex or the optional bus lock.
^1da177e4c3f41 Linus Torvalds            2005-04-16  1606  	 */
239007b8440abf Thomas Gleixner           2009-11-17  1607  	raw_spin_lock_irqsave(&desc->lock, flags);
f17c75453b2d19 Ingo Molnar               2009-02-17  1608  	old_ptr = &desc->action;
f17c75453b2d19 Ingo Molnar               2009-02-17  1609  	old = *old_ptr;
06fcb0c6fb3aae Ingo Molnar               2006-06-29  1610  	if (old) {
e76de9f8eb67b7 Thomas Gleixner           2006-06-29  1611  		/*
e76de9f8eb67b7 Thomas Gleixner           2006-06-29  1612  		 * Can't share interrupts unless both agree to and are
e76de9f8eb67b7 Thomas Gleixner           2006-06-29  1613  		 * the same type (level, edge, polarity). So both flag
3cca53b02a5bab Thomas Gleixner           2006-07-01  1614  		 * fields must have IRQF_SHARED set and the bits which
9d591edd02a245 Thomas Gleixner           2011-02-23  1615  		 * set the trigger type must match. Also all must
9d591edd02a245 Thomas Gleixner           2011-02-23  1616  		 * agree on ONESHOT.
b525903c254dab Julien Thierry            2019-01-31  1617  		 * Interrupt lines used for NMIs cannot be shared.
e76de9f8eb67b7 Thomas Gleixner           2006-06-29  1618  		 */
4f8413a3a799c9 Marc Zyngier              2017-11-09  1619  		unsigned int oldtype;
4f8413a3a799c9 Marc Zyngier              2017-11-09  1620  
6678ae1918ff55 Jinjie Ruan               2024-04-23  1621  		if (irq_is_nmi(desc)) {
b525903c254dab Julien Thierry            2019-01-31  1622  			pr_err("Invalid attempt to share NMI for %s (irq %d) on irqchip %s.\n",
b525903c254dab Julien Thierry            2019-01-31  1623  				new->name, irq, desc->irq_data.chip->name);
b525903c254dab Julien Thierry            2019-01-31  1624  			ret = -EINVAL;
b525903c254dab Julien Thierry            2019-01-31  1625  			goto out_unlock;
b525903c254dab Julien Thierry            2019-01-31  1626  		}
b525903c254dab Julien Thierry            2019-01-31  1627  
4f8413a3a799c9 Marc Zyngier              2017-11-09  1628  		/*
4f8413a3a799c9 Marc Zyngier              2017-11-09  1629  		 * If nobody did set the configuration before, inherit
4f8413a3a799c9 Marc Zyngier              2017-11-09  1630  		 * the one provided by the requester.
4f8413a3a799c9 Marc Zyngier              2017-11-09  1631  		 */
4f8413a3a799c9 Marc Zyngier              2017-11-09  1632  		if (irqd_trigger_type_was_set(&desc->irq_data)) {
4f8413a3a799c9 Marc Zyngier              2017-11-09  1633  			oldtype = irqd_get_trigger_type(&desc->irq_data);
4f8413a3a799c9 Marc Zyngier              2017-11-09  1634  		} else {
4f8413a3a799c9 Marc Zyngier              2017-11-09  1635  			oldtype = new->flags & IRQF_TRIGGER_MASK;
4f8413a3a799c9 Marc Zyngier              2017-11-09  1636  			irqd_set_trigger_type(&desc->irq_data, oldtype);
4f8413a3a799c9 Marc Zyngier              2017-11-09  1637  		}
382bd4de61827d Hans de Goede             2017-04-15  1638  
3cca53b02a5bab Thomas Gleixner           2006-07-01  1639  		if (!((old->flags & new->flags) & IRQF_SHARED) ||
c2ddeb29612f7c Rafael J. Wysocki         2024-03-25  1640  		    (oldtype != (new->flags & IRQF_TRIGGER_MASK)))
c2ddeb29612f7c Rafael J. Wysocki         2024-03-25  1641  			goto mismatch;
c2ddeb29612f7c Rafael J. Wysocki         2024-03-25  1642  
c2ddeb29612f7c Rafael J. Wysocki         2024-03-25  1643  		if ((old->flags & IRQF_ONESHOT) &&
c2ddeb29612f7c Rafael J. Wysocki         2024-03-25  1644  		    (new->flags & IRQF_COND_ONESHOT))
c2ddeb29612f7c Rafael J. Wysocki         2024-03-25  1645  			new->flags |= IRQF_ONESHOT;
c2ddeb29612f7c Rafael J. Wysocki         2024-03-25  1646  		else if ((old->flags ^ new->flags) & IRQF_ONESHOT)
f5163427453bc6 Dimitri Sivanich          2006-03-25  1647  			goto mismatch;
f5163427453bc6 Dimitri Sivanich          2006-03-25  1648  
f5163427453bc6 Dimitri Sivanich          2006-03-25  1649  		/* All handlers must agree on per-cpuness */
3cca53b02a5bab Thomas Gleixner           2006-07-01  1650  		if ((old->flags & IRQF_PERCPU) !=
3cca53b02a5bab Thomas Gleixner           2006-07-01  1651  		    (new->flags & IRQF_PERCPU))
f5163427453bc6 Dimitri Sivanich          2006-03-25  1652  			goto mismatch;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1653  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1654  		/* add new interrupt at end of irq queue */
^1da177e4c3f41 Linus Torvalds            2005-04-16  1655  		do {
52abb700e16a9a Thomas Gleixner           2012-03-06  1656  			/*
52abb700e16a9a Thomas Gleixner           2012-03-06  1657  			 * Or all existing action->thread_mask bits,
52abb700e16a9a Thomas Gleixner           2012-03-06  1658  			 * so we can find the next zero bit for this
52abb700e16a9a Thomas Gleixner           2012-03-06  1659  			 * new action.
52abb700e16a9a Thomas Gleixner           2012-03-06  1660  			 */
b5faba21a6805c Thomas Gleixner           2011-02-23  1661  			thread_mask |= old->thread_mask;
f17c75453b2d19 Ingo Molnar               2009-02-17 @1662  			old_ptr = &old->next;
f17c75453b2d19 Ingo Molnar               2009-02-17  1663  			old = *old_ptr;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1664  		} while (old);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1665  		shared = 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1666  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1667  
b5faba21a6805c Thomas Gleixner           2011-02-23  1668  	/*
52abb700e16a9a Thomas Gleixner           2012-03-06  1669  	 * Setup the thread mask for this irqaction for ONESHOT. For
52abb700e16a9a Thomas Gleixner           2012-03-06  1670  	 * !ONESHOT irqs the thread mask is 0 so we can avoid a
52abb700e16a9a Thomas Gleixner           2012-03-06  1671  	 * conditional in irq_wake_thread().
b5faba21a6805c Thomas Gleixner           2011-02-23  1672  	 */
52abb700e16a9a Thomas Gleixner           2012-03-06  1673  	if (new->flags & IRQF_ONESHOT) {
52abb700e16a9a Thomas Gleixner           2012-03-06  1674  		/*
52abb700e16a9a Thomas Gleixner           2012-03-06  1675  		 * Unlikely to have 32 resp 64 irqs sharing one line,
52abb700e16a9a Thomas Gleixner           2012-03-06  1676  		 * but who knows.
52abb700e16a9a Thomas Gleixner           2012-03-06  1677  		 */
52abb700e16a9a Thomas Gleixner           2012-03-06  1678  		if (thread_mask == ~0UL) {
b5faba21a6805c Thomas Gleixner           2011-02-23  1679  			ret = -EBUSY;
cba4235e6031e9 Thomas Gleixner           2017-06-20  1680  			goto out_unlock;
b5faba21a6805c Thomas Gleixner           2011-02-23  1681  		}
52abb700e16a9a Thomas Gleixner           2012-03-06  1682  		/*
52abb700e16a9a Thomas Gleixner           2012-03-06  1683  		 * The thread_mask for the action is or'ed to
52abb700e16a9a Thomas Gleixner           2012-03-06  1684  		 * desc->thread_active to indicate that the
52abb700e16a9a Thomas Gleixner           2012-03-06  1685  		 * IRQF_ONESHOT thread handler has been woken, but not
52abb700e16a9a Thomas Gleixner           2012-03-06  1686  		 * yet finished. The bit is cleared when a thread
52abb700e16a9a Thomas Gleixner           2012-03-06  1687  		 * completes. When all threads of a shared interrupt
52abb700e16a9a Thomas Gleixner           2012-03-06  1688  		 * line have completed desc->threads_active becomes
52abb700e16a9a Thomas Gleixner           2012-03-06  1689  		 * zero and the interrupt line is unmasked. See
52abb700e16a9a Thomas Gleixner           2012-03-06  1690  		 * handle.c:irq_wake_thread() for further information.
52abb700e16a9a Thomas Gleixner           2012-03-06  1691  		 *
52abb700e16a9a Thomas Gleixner           2012-03-06  1692  		 * If no thread is woken by primary (hard irq context)
52abb700e16a9a Thomas Gleixner           2012-03-06  1693  		 * interrupt handlers, then desc->threads_active is
52abb700e16a9a Thomas Gleixner           2012-03-06  1694  		 * also checked for zero to unmask the irq line in the
52abb700e16a9a Thomas Gleixner           2012-03-06  1695  		 * affected hard irq flow handlers
52abb700e16a9a Thomas Gleixner           2012-03-06  1696  		 * (handle_[fasteoi|level]_irq).
52abb700e16a9a Thomas Gleixner           2012-03-06  1697  		 *
52abb700e16a9a Thomas Gleixner           2012-03-06  1698  		 * The new action gets the first zero bit of
52abb700e16a9a Thomas Gleixner           2012-03-06  1699  		 * thread_mask assigned. See the loop above which or's
52abb700e16a9a Thomas Gleixner           2012-03-06  1700  		 * all existing action->thread_mask bits.
52abb700e16a9a Thomas Gleixner           2012-03-06  1701  		 */
ffc661c99f6211 Rasmus Villemoes          2017-10-30  1702  		new->thread_mask = 1UL << ffz(thread_mask);
1c6c69525b40eb Thomas Gleixner           2012-04-19  1703  
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1704  	} else if (new->handler == irq_default_primary_handler &&
dc9b229a58dc0d Thomas Gleixner           2012-07-13  1705  		   !(desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE)) {
1c6c69525b40eb Thomas Gleixner           2012-04-19  1706  		/*
1c6c69525b40eb Thomas Gleixner           2012-04-19  1707  		 * The interrupt was requested with handler = NULL, so
1c6c69525b40eb Thomas Gleixner           2012-04-19  1708  		 * we use the default primary handler for it. But it
1c6c69525b40eb Thomas Gleixner           2012-04-19  1709  		 * does not have the oneshot flag set. In combination
1c6c69525b40eb Thomas Gleixner           2012-04-19  1710  		 * with level interrupts this is deadly, because the
1c6c69525b40eb Thomas Gleixner           2012-04-19  1711  		 * default primary handler just wakes the thread, then
1c6c69525b40eb Thomas Gleixner           2012-04-19  1712  		 * the irq lines is reenabled, but the device still
1c6c69525b40eb Thomas Gleixner           2012-04-19  1713  		 * has the level irq asserted. Rinse and repeat....
1c6c69525b40eb Thomas Gleixner           2012-04-19  1714  		 *
1c6c69525b40eb Thomas Gleixner           2012-04-19  1715  		 * While this works for edge type interrupts, we play
1c6c69525b40eb Thomas Gleixner           2012-04-19  1716  		 * it safe and reject unconditionally because we can't
1c6c69525b40eb Thomas Gleixner           2012-04-19  1717  		 * say for sure which type this interrupt really
1c6c69525b40eb Thomas Gleixner           2012-04-19  1718  		 * has. The type flags are unreliable as the
1c6c69525b40eb Thomas Gleixner           2012-04-19  1719  		 * underlying chip implementation can override them.
1c6c69525b40eb Thomas Gleixner           2012-04-19  1720  		 */
025af39b87dc4d Luca Ceresoli             2019-11-05  1721  		pr_err("Threaded irq requested with handler=NULL and !ONESHOT for %s (irq %d)\n",
025af39b87dc4d Luca Ceresoli             2019-11-05  1722  		       new->name, irq);
1c6c69525b40eb Thomas Gleixner           2012-04-19  1723  		ret = -EINVAL;
cba4235e6031e9 Thomas Gleixner           2017-06-20  1724  		goto out_unlock;
52abb700e16a9a Thomas Gleixner           2012-03-06  1725  	}
b5faba21a6805c Thomas Gleixner           2011-02-23  1726  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1727  	if (!shared) {
e76de9f8eb67b7 Thomas Gleixner           2006-06-29  1728  		/* Setup the type (level, edge polarity) if configured: */
3cca53b02a5bab Thomas Gleixner           2006-07-01  1729  		if (new->flags & IRQF_TRIGGER_MASK) {
a1ff541a40e90d Jiang Liu                 2015-06-23  1730  			ret = __irq_set_trigger(desc,
f2b662da8d6bd4 David Brownell            2008-12-01  1731  						new->flags & IRQF_TRIGGER_MASK);
82736f4d1d2b70 Uwe Kleine-König          2008-07-23  1732  
19d39a3810e703 Thomas Gleixner           2017-07-11  1733  			if (ret)
cba4235e6031e9 Thomas Gleixner           2017-06-20  1734  				goto out_unlock;
091738a266fc74 Thomas Gleixner           2011-02-14  1735  		}
6a6de9ef5850d0 Thomas Gleixner           2006-06-29  1736  
c942cee46bba76 Thomas Gleixner           2017-09-13  1737  		/*
c942cee46bba76 Thomas Gleixner           2017-09-13  1738  		 * Activate the interrupt. That activation must happen
c942cee46bba76 Thomas Gleixner           2017-09-13  1739  		 * independently of IRQ_NOAUTOEN. request_irq() can fail
c942cee46bba76 Thomas Gleixner           2017-09-13  1740  		 * and the callers are supposed to handle
c942cee46bba76 Thomas Gleixner           2017-09-13  1741  		 * that. enable_irq() of an interrupt requested with
c942cee46bba76 Thomas Gleixner           2017-09-13  1742  		 * IRQ_NOAUTOEN is not supposed to fail. The activation
c942cee46bba76 Thomas Gleixner           2017-09-13  1743  		 * keeps it in shutdown mode, it merily associates
c942cee46bba76 Thomas Gleixner           2017-09-13  1744  		 * resources if necessary and if that's not possible it
c942cee46bba76 Thomas Gleixner           2017-09-13  1745  		 * fails. Interrupts which are in managed shutdown mode
c942cee46bba76 Thomas Gleixner           2017-09-13  1746  		 * will simply ignore that activation request.
c942cee46bba76 Thomas Gleixner           2017-09-13  1747  		 */
c942cee46bba76 Thomas Gleixner           2017-09-13  1748  		ret = irq_activate(desc);
c942cee46bba76 Thomas Gleixner           2017-09-13  1749  		if (ret)
c942cee46bba76 Thomas Gleixner           2017-09-13  1750  			goto out_unlock;
c942cee46bba76 Thomas Gleixner           2017-09-13  1751  
009b4c3b8ad584 Thomas Gleixner           2011-02-07  1752  		desc->istate &= ~(IRQS_AUTODETECT | IRQS_SPURIOUS_DISABLED | \
32f4125ebffee4 Thomas Gleixner           2011-03-28  1753  				  IRQS_ONESHOT | IRQS_WAITING);
32f4125ebffee4 Thomas Gleixner           2011-03-28  1754  		irqd_clear(&desc->irq_data, IRQD_IRQ_INPROGRESS);
94d39e1f6e8132 Thomas Gleixner           2006-06-29  1755  
a005677b3dd05d Thomas Gleixner           2011-02-08  1756  		if (new->flags & IRQF_PERCPU) {
a005677b3dd05d Thomas Gleixner           2011-02-08  1757  			irqd_set(&desc->irq_data, IRQD_PER_CPU);
a005677b3dd05d Thomas Gleixner           2011-02-08  1758  			irq_settings_set_per_cpu(desc);
c2b1063e8feb21 Thomas Gleixner           2021-04-02  1759  			if (new->flags & IRQF_NO_DEBUG)
c2b1063e8feb21 Thomas Gleixner           2021-04-02  1760  				irq_settings_set_no_debug(desc);
a005677b3dd05d Thomas Gleixner           2011-02-08  1761  		}
6a58fb3bad0990 Thomas Gleixner           2011-02-08  1762  
c2b1063e8feb21 Thomas Gleixner           2021-04-02  1763  		if (noirqdebug)
c2b1063e8feb21 Thomas Gleixner           2021-04-02  1764  			irq_settings_set_no_debug(desc);
c2b1063e8feb21 Thomas Gleixner           2021-04-02  1765  
b25c340c195447 Thomas Gleixner           2009-08-13  1766  		if (new->flags & IRQF_ONESHOT)
3d67baec7f1b01 Thomas Gleixner           2011-02-07  1767  			desc->istate |= IRQS_ONESHOT;
b25c340c195447 Thomas Gleixner           2009-08-13  1768  
2e051552df69af Thomas Gleixner           2017-06-20  1769  		/* Exclude IRQ from balancing if requested */
2e051552df69af Thomas Gleixner           2017-06-20  1770  		if (new->flags & IRQF_NOBALANCING) {
2e051552df69af Thomas Gleixner           2017-06-20  1771  			irq_settings_set_no_balancing(desc);
2e051552df69af Thomas Gleixner           2017-06-20  1772  			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
2e051552df69af Thomas Gleixner           2017-06-20  1773  		}
2e051552df69af Thomas Gleixner           2017-06-20  1774  
cbe16f35bee688 Barry Song                2021-03-03  1775  		if (!(new->flags & IRQF_NO_AUTOEN) &&
cbe16f35bee688 Barry Song                2021-03-03  1776  		    irq_settings_can_autoenable(desc)) {
4cde9c6b826834 Thomas Gleixner           2017-06-20  1777  			irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
04c848d398797a Thomas Gleixner           2017-05-31  1778  		} else {
04c848d398797a Thomas Gleixner           2017-05-31  1779  			/*
04c848d398797a Thomas Gleixner           2017-05-31  1780  			 * Shared interrupts do not go well with disabling
04c848d398797a Thomas Gleixner           2017-05-31  1781  			 * auto enable. The sharing interrupt might request
04c848d398797a Thomas Gleixner           2017-05-31  1782  			 * it while it's still disabled and then wait for
04c848d398797a Thomas Gleixner           2017-05-31  1783  			 * interrupts forever.
04c848d398797a Thomas Gleixner           2017-05-31  1784  			 */
04c848d398797a Thomas Gleixner           2017-05-31  1785  			WARN_ON_ONCE(new->flags & IRQF_SHARED);
e76de9f8eb67b7 Thomas Gleixner           2006-06-29  1786  			/* Undo nested disables: */
e76de9f8eb67b7 Thomas Gleixner           2006-06-29  1787  			desc->depth = 1;
04c848d398797a Thomas Gleixner           2017-05-31  1788  		}
18404756765c71 Max Krasnyansky           2008-05-29  1789  
876dbd4cc1b35c Thomas Gleixner           2011-02-08  1790  	} else if (new->flags & IRQF_TRIGGER_MASK) {
876dbd4cc1b35c Thomas Gleixner           2011-02-08  1791  		unsigned int nmsk = new->flags & IRQF_TRIGGER_MASK;
7ee7e87dfb158e Thomas Gleixner           2016-11-07  1792  		unsigned int omsk = irqd_get_trigger_type(&desc->irq_data);
876dbd4cc1b35c Thomas Gleixner           2011-02-08  1793  
876dbd4cc1b35c Thomas Gleixner           2011-02-08  1794  		if (nmsk != omsk)
876dbd4cc1b35c Thomas Gleixner           2011-02-08  1795  			/* hope the handler works with current  trigger mode */
a395d6a7e3d6e3 Joe Perches               2016-03-22  1796  			pr_warn("irq %d uses trigger mode %u; requested %u\n",
7ee7e87dfb158e Thomas Gleixner           2016-11-07  1797  				irq, omsk, nmsk);
94d39e1f6e8132 Thomas Gleixner           2006-06-29  1798  	}
82736f4d1d2b70 Uwe Kleine-König          2008-07-23  1799  
f17c75453b2d19 Ingo Molnar               2009-02-17  1800  	*old_ptr = new;
82736f4d1d2b70 Uwe Kleine-König          2008-07-23  1801  
cab303be91dc47 Thomas Gleixner           2014-08-28  1802  	irq_pm_install_action(desc, new);
cab303be91dc47 Thomas Gleixner           2014-08-28  1803  
8528b0f1de1101 Linus Torvalds            2007-01-23  1804  	/* Reset broken irq detection when installing new handler */
8528b0f1de1101 Linus Torvalds            2007-01-23  1805  	desc->irq_count = 0;
8528b0f1de1101 Linus Torvalds            2007-01-23  1806  	desc->irqs_unhandled = 0;
1adb0850a12543 Thomas Gleixner           2008-04-28  1807  
1adb0850a12543 Thomas Gleixner           2008-04-28  1808  	/*
1adb0850a12543 Thomas Gleixner           2008-04-28  1809  	 * Check whether we disabled the irq via the spurious handler
1adb0850a12543 Thomas Gleixner           2008-04-28  1810  	 * before. Reenable it and give it another chance.
1adb0850a12543 Thomas Gleixner           2008-04-28  1811  	 */
7acdd53e5b2c55 Thomas Gleixner           2011-02-07  1812  	if (shared && (desc->istate & IRQS_SPURIOUS_DISABLED)) {
7acdd53e5b2c55 Thomas Gleixner           2011-02-07  1813  		desc->istate &= ~IRQS_SPURIOUS_DISABLED;
79ff1cda320b81 Jiang Liu                 2015-06-23  1814  		__enable_irq(desc);
1adb0850a12543 Thomas Gleixner           2008-04-28  1815  	}
1adb0850a12543 Thomas Gleixner           2008-04-28  1816  
239007b8440abf Thomas Gleixner           2009-11-17  1817  	raw_spin_unlock_irqrestore(&desc->lock, flags);
3a90795e1e8851 Thomas Gleixner           2017-06-29  1818  	chip_bus_sync_unlock(desc);
9114014cf4e6df Thomas Gleixner           2017-06-29  1819  	mutex_unlock(&desc->request_mutex);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1820  
b2d3d61adb7b73 Daniel Lezcano            2017-06-23  1821  	irq_setup_timings(desc, new);
b2d3d61adb7b73 Daniel Lezcano            2017-06-23  1822  
8707898e22fd66 Thomas Pfaff              2022-05-02  1823  	wake_up_and_wait_for_irq_thread_ready(desc, new);
8707898e22fd66 Thomas Pfaff              2022-05-02  1824  	wake_up_and_wait_for_irq_thread_ready(desc, new->secondary);
69ab849439b506 Thomas Gleixner           2009-08-17  1825  
2c6927a38f65b5 Yinghai Lu                2008-08-19  1826  	register_irq_proc(irq, desc);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1827  	new->dir = NULL;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1828  	register_handler_proc(irq, new);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1829  	return 0;
f5163427453bc6 Dimitri Sivanich          2006-03-25  1830  
f5163427453bc6 Dimitri Sivanich          2006-03-25  1831  mismatch:
3cca53b02a5bab Thomas Gleixner           2006-07-01  1832  	if (!(new->flags & IRQF_PROBE_SHARED)) {
97fd75b7b8e0f4 Andrew Morton             2012-05-31  1833  		pr_err("Flags mismatch irq %d. %08x (%s) vs. %08x (%s)\n",
f5d89470f91f2e Thomas Gleixner           2012-04-19  1834  		       irq, new->flags, new->name, old->flags, old->name);
f5d89470f91f2e Thomas Gleixner           2012-04-19  1835  #ifdef CONFIG_DEBUG_SHIRQ
f5163427453bc6 Dimitri Sivanich          2006-03-25  1836  		dump_stack();
3f0504471536a2 Alan Cox                  2007-02-12  1837  #endif
f5d89470f91f2e Thomas Gleixner           2012-04-19  1838  	}
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1839  	ret = -EBUSY;
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1840  
cba4235e6031e9 Thomas Gleixner           2017-06-20  1841  out_unlock:
1c389795c15d34 Dan Carpenter             2011-03-17  1842  	raw_spin_unlock_irqrestore(&desc->lock, flags);
3b8249e759c701 Thomas Gleixner           2011-02-07  1843  
46e48e257360f0 Thomas Gleixner           2017-06-29  1844  	if (!desc->action)
46e48e257360f0 Thomas Gleixner           2017-06-29  1845  		irq_release_resources(desc);
19d39a3810e703 Thomas Gleixner           2017-07-11  1846  out_bus_unlock:
19d39a3810e703 Thomas Gleixner           2017-07-11  1847  	chip_bus_sync_unlock(desc);
9114014cf4e6df Thomas Gleixner           2017-06-29  1848  	mutex_unlock(&desc->request_mutex);
9114014cf4e6df Thomas Gleixner           2017-06-29  1849  
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1850  out_thread:
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1851  	if (new->thread) {
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1852  		struct task_struct *t = new->thread;
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1853  
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1854  		new->thread = NULL;
6309727ef27162 Andreas Gruenbacher       2023-09-08  1855  		kthread_stop_put(t);
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1856  	}
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1857  	if (new->secondary && new->secondary->thread) {
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1858  		struct task_struct *t = new->secondary->thread;
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1859  
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1860  		new->secondary->thread = NULL;
6309727ef27162 Andreas Gruenbacher       2023-09-08  1861  		kthread_stop_put(t);
2a1d3ab8986d1b Thomas Gleixner           2015-09-21  1862  	}
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1863  out_mput:
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  1864  	module_put(desc->owner);
3aa551c9b4c400 Thomas Gleixner           2009-03-23  1865  	return ret;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1866  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  1867  

:::::: The code at line 1662 was first introduced by commit
:::::: f17c75453b2d195eba0a90d9f16a3ba88c85b3b4 irq: name 'p' variables a bit better

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

