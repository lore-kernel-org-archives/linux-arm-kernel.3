Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9E7C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 11:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YGI/j4ynqxN6GqQggKFCvfGgUMFQAVYXUDeIgesP+LI=; b=aWslkHQoTvdXXA0Y6MlgDgyrVw
	ndIxbZq+4MZ7i+sipoW45CvOYF5kWhF6StFzD3E/DuKxW7HmDSD43YvNo/Se5e7oQOR8Sbc5rPUfH
	A127n92BI2SHet4crr8Wc841ahJKqDPoqoxevD2XbXdNx9qz/tgV1JA8Dp38Q3BfXJURciqXBe4sd
	gJmz4fV9aJc6V7BIVvDEulw8cbeNpTDq/nTP++z8Z/LVL6oPwDDjc1YYiqQZiSVW+oGAYL8ceXw5t
	huFV1FfGg7go9/YkgrUM2bSOYV5q57o8smXjBy9e+aixTTv38fEKjX39wkrsOQb0JGMajjpfzvbzn
	mbVp8Gdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8Hl-0000000DGnd-21zS;
	Fri, 28 Mar 2025 11:54:05 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8G0-0000000DGhh-3uje
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 11:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743162737; x=1774698737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=og9me2UIjvz1buLK89o91k+q4riorp3hweBNmsCxNi8=;
  b=Q3FzvDYBNt2s9LarwnDNKM6dlGZB6c2l51pU+1qVepUBMlvLh0zwSk8f
   VJtjbDpeCKzwpcdzuPKy7fViykVxRaC0kHo8vqt8Ges/bW5Bvmov7mfA+
   OHBBSKd+UP6A+tTmUBZzJJckiQVEx+gQacE7IhUF456Rq0bo5pDWuUUib
   Dw3x2xsu2H1/d7G1zdwfgoc2yBstwDdqjKJ65UXW9SKJRhu68Ql6pyJ+8
   MxTUXraporaeIBC61E19EPVrhP4H7Rb90qEQNVyBrrR3ir8IPBIl1WfBt
   kuiLwqby3AwVlVpFG6ZFSX+TYGelu2q0quHpSbDuo3uaCuEX38NjZug5n
   Q==;
X-CSE-ConnectionGUID: DjlVmTYaT6SO4vt0XZkilw==
X-CSE-MsgGUID: I8hYAlZDT1u9L8VVTe8bug==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66993893"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="66993893"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 04:52:11 -0700
X-CSE-ConnectionGUID: ooAZ/oguQEu6yml4c1rpfQ==
X-CSE-MsgGUID: 9FMHMzzDRzKdDsgOcZI2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125428401"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Mar 2025 04:52:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty8Fq-0007Pu-36;
	Fri, 28 Mar 2025 11:52:06 +0000
Date: Fri, 28 Mar 2025 19:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/17] include/linux/interrupt.h:130:2:
 error: expected member name or ';' after declaration specifiers
Message-ID: <202503281921.2bXEpvLm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_045217_022276_A940509A 
X-CRM114-Status: GOOD (  10.71  )
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
config: hexagon-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281921.2bXEpvLm-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281921.2bXEpvLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281921.2bXEpvLm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:15:
>> include/linux/interrupt.h:130:2: error: expected member name or ';' after declaration specifiers
     129 |         cpumask_t               *valid_mask,
         |         ~~~~~~~~~
     130 |         struct irqaction        *next;
         |         ^
>> include/linux/interrupt.h:129:25: error: expected ';' at end of declaration list
     129 |         cpumask_t               *valid_mask,
         |                                             ^
         |                                             ;
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/hexagon/kernel/asm-offsets.s] Error 1 shuffle=1775872522
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1269: prepare0] Error 2 shuffle=1775872522
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1775872522
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1775872522
   make: Target 'prepare' not remade because of errors.


vim +130 include/linux/interrupt.h

da482792a6d1a3 David Howells   2006-10-05  105  
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  106  /**
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  107   * struct irqaction - per interrupt action descriptor
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  108   * @handler:	interrupt handler function
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  109   * @name:	name of the device
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  110   * @dev_id:	cookie to identify the device
31d9d9b6d83030 Marc Zyngier    2011-09-23  111   * @percpu_dev_id:	cookie to identify the device
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  112   * @next:	pointer to the next irqaction for shared interrupts
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  113   * @irq:	interrupt number
c0ecaa06d6d40c Thomas Gleixner 2012-04-19  114   * @flags:	flags (see IRQF_* above)
25985edcedea63 Lucas De Marchi 2011-03-30  115   * @thread_fn:	interrupt handler function for threaded interrupts
3aa551c9b4c400 Thomas Gleixner 2009-03-23  116   * @thread:	thread pointer for threaded interrupts
2a1d3ab8986d1b Thomas Gleixner 2015-09-21  117   * @secondary:	pointer to secondary irqaction (force threading)
3aa551c9b4c400 Thomas Gleixner 2009-03-23  118   * @thread_flags:	flags related to @thread
b5faba21a6805c Thomas Gleixner 2011-02-23  119   * @thread_mask:	bitmask for keeping track of @thread activity
c0ecaa06d6d40c Thomas Gleixner 2012-04-19  120   * @dir:	pointer to the proc/irq/NN/name entry
a9d0a1a38352c4 Thomas Gleixner 2009-03-03  121   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  122  struct irqaction {
da482792a6d1a3 David Howells   2006-10-05  123  	irq_handler_t		handler;
e9141d0584201d Marc Zyngier    2025-03-26  124  	union {
^1da177e4c3f41 Linus Torvalds  2005-04-16  125  		void		*dev_id;
31d9d9b6d83030 Marc Zyngier    2011-09-23  126  		void __percpu	*percpu_dev_id;
e9141d0584201d Marc Zyngier    2025-03-26  127  		void __percpu	**part_percpu_dev_id;
e9141d0584201d Marc Zyngier    2025-03-26  128  	};
e9141d0584201d Marc Zyngier    2025-03-26 @129  	cpumask_t		*valid_mask,
^1da177e4c3f41 Linus Torvalds  2005-04-16 @130  	struct irqaction	*next;
3aa551c9b4c400 Thomas Gleixner 2009-03-23  131  	irq_handler_t		thread_fn;
3aa551c9b4c400 Thomas Gleixner 2009-03-23  132  	struct task_struct	*thread;
2a1d3ab8986d1b Thomas Gleixner 2015-09-21  133  	struct irqaction	*secondary;
c0ecaa06d6d40c Thomas Gleixner 2012-04-19  134  	unsigned int		irq;
c0ecaa06d6d40c Thomas Gleixner 2012-04-19  135  	unsigned int		flags;
3aa551c9b4c400 Thomas Gleixner 2009-03-23  136  	unsigned long		thread_flags;
b5faba21a6805c Thomas Gleixner 2011-02-23  137  	unsigned long		thread_mask;
f6cd24777513fc Eric Dumazet    2010-11-04  138  	const char		*name;
f6cd24777513fc Eric Dumazet    2010-11-04  139  	struct proc_dir_entry	*dir;
f6cd24777513fc Eric Dumazet    2010-11-04  140  } ____cacheline_internodealigned_in_smp;
^1da177e4c3f41 Linus Torvalds  2005-04-16  141  

:::::: The code at line 130 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

