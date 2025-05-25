Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31111C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTz9wudKoCNJPetaaYKXa9vYygxMFUu3nisfOvAEvrE=; b=5FjqWrwYlOCU+WuULl0HnbE9GB
	KL2XZDr4+omr3J9IxgN3p+MVBDAXr1TZC8ceZB0ybZvdp3nIOFDEAQDDxO7Kw6EkJLUhg8Fa3+k/Z
	As9RrPgspY3j+yp/XCEk7kKKkrXTA//QFNEATWUUWTfpqR7TJ2pJ5JMRfM2ZqEH0+KgGjga67eGwR
	6hLh5mHt8CbUBzSMHXUav33inXOzzcVOSUzNAD6Cwv5v5nSAnK6cOkqYfDa/H7gkOehGrCijzQp9Q
	TYJZUxSymyTzmQxs80PGVtJ5vRLHAt04A41aFYm1Bh818XIZBYiQ0B4nHbacDCiTeocn+DrRCzjEv
	JxBYpAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJBRS-000000077X1-3U5Z;
	Sun, 25 May 2025 13:31:06 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJBPN-000000077Kf-1loe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 13:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748179738; x=1779715738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zgP0WvUVk0EyOxWqJtWUylni9ScXVYHpKVhMXiLCehA=;
  b=iKzwODecoyVVsu56bA8haf4QASJ82z9+HzK/1DjPD5FC0JL9/yp8e5fM
   0w4C7/x6ZXgPO8YBPUPuzJ91tth77SbfyNQzCZ3gJkypoN5hftWzv6J9F
   LmTnamZOGgShlkjXoaugBxRWnylcg3RSnkG9mRZepewG2EgsNHxb5QJ4v
   zTdE30eE2IGKMH+hki9/k0RholeIFjarIs2oMVgOlir6aDlZ6GqFl7KXh
   qbAU7wme0e9imnUmGLyDFvq/P0AY/RP35TjPPD7fM/FCLPI/SsnkO6zmv
   IH9JZdhpMEscNRUUXR971/AT0ES1Ec133AObHIjeEUAKbBlpnJ3MuaO6x
   w==;
X-CSE-ConnectionGUID: 8ua6EYhpRjqCGv714THcIA==
X-CSE-MsgGUID: 52RBQFucSL6PaAMHuAkxjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="53824104"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="53824104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 06:28:53 -0700
X-CSE-ConnectionGUID: ATnCZY7XQECv1sPWjZZL7g==
X-CSE-MsgGUID: ckdh9z1PTZqY4Wh7Bpd7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="141807838"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 May 2025 06:28:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJBPC-000Rpo-2x;
	Sun, 25 May 2025 13:28:46 +0000
Date: Sun, 25 May 2025 21:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Gupta <suraj.gupta2@amd.com>, vkoul@kernel.org,
	michal.simek@amd.com, radhey.shyam.pandey@amd.com,
	thomas.gessler@brueckmann-gmbh.de
Cc: oe-kbuild-all@lists.linux.dev, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	harini.katakam@amd.com
Subject: Re: [PATCH 2/2] dmaengine: xilinx_dma: Add support to
 configure/report coalesce parameters from/to client using AXI DMA
Message-ID: <202505252153.Nm1BzFUq-lkp@intel.com>
References: <20250525101617.1168991-3-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525101617.1168991-3-suraj.gupta2@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_062857_549309_A0F7DDE6 
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

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on xilinx-xlnx/master soc/for-next linus/master v6.15-rc7 next-20250523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Gupta/dmaengine-Add-support-to-configure-and-read-IRQ-coalescing-parameters/20250525-181817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250525101617.1168991-3-suraj.gupta2%40amd.com
patch subject: [PATCH 2/2] dmaengine: xilinx_dma: Add support to configure/report coalesce parameters from/to client using AXI DMA
config: i386-buildonly-randconfig-004-20250525 (https://download.01.org/0day-ci/archive/20250525/202505252153.Nm1BzFUq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505252153.Nm1BzFUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505252153.Nm1BzFUq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dmapool.h:14,
                    from drivers/dma/xilinx/xilinx_dma.c:37:
   drivers/dma/xilinx/xilinx_dma.c: In function 'xilinx_dma_start_transfer':
>> drivers/dma/xilinx/xilinx_dma.c:1594:28: error: implicit declaration of function 'FIELD_MAX' [-Werror=implicit-function-declaration]
    1594 |         timer = min(timer, FIELD_MAX(XILINX_DMA_DMACR_DELAY_MASK));
         |                            ^~~~~~~~~
   include/linux/minmax.h:92:49: note: in definition of macro '__careful_cmp_once'
      92 |         __auto_type ux = (x); __auto_type uy = (y);     \
         |                                                 ^
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/dma/xilinx/xilinx_dma.c:1594:17: note: in expansion of macro 'min'
    1594 |         timer = min(timer, FIELD_MAX(XILINX_DMA_DMACR_DELAY_MASK));
         |                 ^~~
   In file included from <command-line>:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_299' declared with attribute error: min(timer, FIELD_MAX((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr((sizeof(int) == sizeof(*(8 ? ((void *)((long)((24) > (31)) * 0l)) : (int *)8))), (24) > (31), false))); }))) + (((~((0UL))) << (24)) & (~((0UL)) >> (32 - 1 - (31))))))) signedness error
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/dma/xilinx/xilinx_dma.c:1594:17: note: in expansion of macro 'min'
    1594 |         timer = min(timer, FIELD_MAX(XILINX_DMA_DMACR_DELAY_MASK));
         |                 ^~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dmapool.h:14,
                    from xilinx_dma.c:37:
   xilinx_dma.c: In function 'xilinx_dma_start_transfer':
   xilinx_dma.c:1594:28: error: implicit declaration of function 'FIELD_MAX' [-Werror=implicit-function-declaration]
    1594 |         timer = min(timer, FIELD_MAX(XILINX_DMA_DMACR_DELAY_MASK));
         |                            ^~~~~~~~~
   include/linux/minmax.h:92:49: note: in definition of macro '__careful_cmp_once'
      92 |         __auto_type ux = (x); __auto_type uy = (y);     \
         |                                                 ^
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   xilinx_dma.c:1594:17: note: in expansion of macro 'min'
    1594 |         timer = min(timer, FIELD_MAX(XILINX_DMA_DMACR_DELAY_MASK));
         |                 ^~~
   In file included from <command-line>:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_299' declared with attribute error: min(timer, FIELD_MAX((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr((sizeof(int) == sizeof(*(8 ? ((void *)((long)((24) > (31)) * 0l)) : (int *)8))), (24) > (31), false))); }))) + (((~((0UL))) << (24)) & (~((0UL)) >> (32 - 1 - (31))))))) signedness error
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   xilinx_dma.c:1594:17: note: in expansion of macro 'min'
    1594 |         timer = min(timer, FIELD_MAX(XILINX_DMA_DMACR_DELAY_MASK));
         |                 ^~~
   cc1: some warnings being treated as errors


vim +/FIELD_MAX +1594 drivers/dma/xilinx/xilinx_dma.c

  1539	
  1540	/**
  1541	 * xilinx_dma_start_transfer - Starts DMA transfer
  1542	 * @chan: Driver specific channel struct pointer
  1543	 */
  1544	static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
  1545	{
  1546		struct xilinx_dma_tx_descriptor *head_desc, *tail_desc;
  1547		struct xilinx_axidma_tx_segment *tail_segment;
  1548		struct dma_slave_config *slave_cfg = &chan->slave_cfg;
  1549		u64 clk_rate;
  1550		u32 reg, usec, timer;
  1551	
  1552		if (chan->err)
  1553			return;
  1554	
  1555		if (list_empty(&chan->pending_list))
  1556			return;
  1557	
  1558		if (!chan->idle)
  1559			return;
  1560	
  1561		head_desc = list_first_entry(&chan->pending_list,
  1562					     struct xilinx_dma_tx_descriptor, node);
  1563		tail_desc = list_last_entry(&chan->pending_list,
  1564					    struct xilinx_dma_tx_descriptor, node);
  1565		tail_segment = list_last_entry(&tail_desc->segments,
  1566					       struct xilinx_axidma_tx_segment, node);
  1567	
  1568		reg = dma_ctrl_read(chan, XILINX_DMA_REG_DMACR);
  1569	
  1570		reg &= ~XILINX_DMA_CR_COALESCE_MAX;
  1571		reg  &= ~XILINX_DMA_CR_DELAY_MAX;
  1572	
  1573		/* Use dma_slave_config if it has valid values */
  1574		if (slave_cfg->coalesce_cnt &&
  1575		    slave_cfg->coalesce_cnt <= XILINX_DMA_COALESCE_MAX)
  1576			reg |= slave_cfg->coalesce_cnt <<
  1577				XILINX_DMA_CR_COALESCE_SHIFT;
  1578		else if (chan->desc_pendingcount <= XILINX_DMA_COALESCE_MAX)
  1579			reg |= chan->desc_pendingcount <<
  1580					  XILINX_DMA_CR_COALESCE_SHIFT;
  1581	
  1582		if (slave_cfg->coalesce_usecs <= XILINX_DMA_DMACR_DELAY_MAX)
  1583			usec = slave_cfg->coalesce_usecs;
  1584		else
  1585			usec = chan->irq_delay;
  1586	
  1587		/* Scale with SG clock rate rather than being a fixed number of
  1588		 * clock cycles.
  1589		 * 1 Timeout Interval = 125 * (clock period of SG clock)
  1590		 */
  1591		clk_rate = clk_get_rate(chan->xdev->rx_clk);
  1592		timer = DIV64_U64_ROUND_CLOSEST((u64)usec * clk_rate,
  1593						XILINX_DMA_DELAY_SCALE);
> 1594		timer = min(timer, FIELD_MAX(XILINX_DMA_DMACR_DELAY_MASK));
  1595		reg |= timer << XILINX_DMA_CR_DELAY_SHIFT;
  1596	
  1597		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
  1598	
  1599		if (chan->has_sg)
  1600			xilinx_write(chan, XILINX_DMA_REG_CURDESC,
  1601				     head_desc->async_tx.phys);
  1602	
  1603		xilinx_dma_start(chan);
  1604	
  1605		if (chan->err)
  1606			return;
  1607	
  1608		/* Start the transfer */
  1609		if (chan->has_sg) {
  1610			if (chan->cyclic)
  1611				xilinx_write(chan, XILINX_DMA_REG_TAILDESC,
  1612					     chan->cyclic_seg_v->phys);
  1613			else
  1614				xilinx_write(chan, XILINX_DMA_REG_TAILDESC,
  1615					     tail_segment->phys);
  1616		} else {
  1617			struct xilinx_axidma_tx_segment *segment;
  1618			struct xilinx_axidma_desc_hw *hw;
  1619	
  1620			segment = list_first_entry(&head_desc->segments,
  1621						   struct xilinx_axidma_tx_segment,
  1622						   node);
  1623			hw = &segment->hw;
  1624	
  1625			xilinx_write(chan, XILINX_DMA_REG_SRCDSTADDR,
  1626				     xilinx_prep_dma_addr_t(hw->buf_addr));
  1627	
  1628			/* Start the transfer */
  1629			dma_ctrl_write(chan, XILINX_DMA_REG_BTT,
  1630				       hw->control & chan->xdev->max_buffer_len);
  1631		}
  1632	
  1633		list_splice_tail_init(&chan->pending_list, &chan->active_list);
  1634		chan->desc_pendingcount = 0;
  1635		chan->idle = false;
  1636	}
  1637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

