Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96CECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrXG67HjA2YZQiGNl+W3ThjkzBb4feEs7h7zi14BNfg=; b=0Po+0BRe7V8CosX9mvno9ZCs5e
	Y07yHS3hioA1NuWXu+z0B86btXF/JnQsYUQVkgdA4eYqLqfpLdQb6q90gGPrF6ROvSw2uTIDe+yVI
	+YkvxYkoTKMHyYHXySASHvDVVL654kxai0EItZsN0+uNJd1kR94bGXqAvLeBfkcOOyxlpUiU26EIT
	bp9m4EbgvnEEYkO+bOGtjTNkcUdGvCePOX4fqA3RJlpk8RoudVM1B1+BQDNv1QTlijNDo8aNePf1q
	RQ50zFAENXpLOwxOaS2bZriF4denYwIEWg1dRJIoFKjUhVYbHvksJVlDSJfkioixxqnR6ncTdRwJ1
	iFasj4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvwv-00000002nVP-1NMj;
	Fri, 15 Aug 2025 15:02:33 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqXG-000000021W6-3iEQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755249343; x=1786785343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hfZcgn0nzW9uuIxs2763lW2p3DkRL5Fx4+ceg0IC1a0=;
  b=LQCbJSN0yFI/CY9sNwwc4Tn1aiviJLVt3C9NzMTUL35TM9SZ+yI+nt5y
   IlISKH61j4YcNDRxXgcUwC7+b4od/WMp8gx1DE3jaR9DV7D0ANwQDCfk7
   EWnZg3J9TxOPn2MA73NBQqpHQVOTlJmJpuIdO9+jGO3DKyu9740x8zLGL
   rITB6UfEbm7Q3pSW//HUL2loTHXjyvplpifZGBgxDwJ3VjK3q2K06cFrJ
   APiUEQPUPoWSizT2zyy3IWlUN1roQpCPW0SvoLNcR8WOYlaxtDK6ASfMk
   QyApa/oF3L/HoYHvo2I8A3SCUULZTisWLYiECge2nROdFiHXHxwx7gox2
   A==;
X-CSE-ConnectionGUID: RCjUZM76RY6+O76xtJEwgw==
X-CSE-MsgGUID: vAUYAOi7QWqtuf4WGZ6nLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57528789"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57528789"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:15:41 -0700
X-CSE-ConnectionGUID: ZJZH2PX4RoeJ1J/lxbGQOA==
X-CSE-MsgGUID: I0vJDqLSS+eG3dAfYgKucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172199692"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2025 02:15:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umqX9-000BnI-0P;
	Fri, 15 Aug 2025 09:15:35 +0000
Date: Fri, 15 Aug 2025 17:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Qinxin Xia <xiaqinxin@huawei.com>, will@kernel.org,
	robin.murphy@arm.com, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, xiaqinxin@huawei.com, yangyicong@huawei.com,
	wangzhou1@hisilicon.com, prime.zeng@hisilicon.com,
	xuwei5@huawei.com, fanghao11@huawei.com,
	jonathan.cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 2/2] iommu/io-pgtable: Add ARM SMMUv3 page table dump
 support
Message-ID: <202508151641.JHlhcDRk-lkp@intel.com>
References: <20250814093005.2040511-3-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814093005.2040511-3-xiaqinxin@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_021542_975040_6914C991 
X-CRM114-Status: GOOD (  13.43  )
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

Hi Qinxin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qinxin-Xia/iommu-debug-Add-IOMMU-page-table-dump-debug-facility/20250814-173720
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250814093005.2040511-3-xiaqinxin%40huawei.com
patch subject: [PATCH 2/2] iommu/io-pgtable: Add ARM SMMUv3 page table dump support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250815/202508151641.JHlhcDRk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151641.JHlhcDRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151641.JHlhcDRk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from drivers/iommu/io-pgtable-arm.c:12:
   drivers/iommu/io-pgtable-arm.c: In function 'dump_prot':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:557:9: note: in expansion of macro 'printk'
     557 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:557:16: note: in expansion of macro 'KERN_ERR'
     557 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/iommu/io-pgtable-arm.c:882:25: note: in expansion of macro 'pr_err'
     882 |                         pr_err("len = %zu, attr = %s, i =%d\n", length, attr, i);
         |                         ^~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:557:9: note: in expansion of macro 'printk'
     557 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:557:16: note: in expansion of macro 'KERN_ERR'
     557 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/iommu/io-pgtable-arm.c:882:25: note: in expansion of macro 'pr_err'
     882 |                         pr_err("len = %zu, attr = %s, i =%d\n", length, attr, i);
         |                         ^~~~~~
   drivers/iommu/io-pgtable-arm.c: In function 'arm_lpae_dump_iova_prot':
>> drivers/iommu/io-pgtable-arm.c:911:32: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'long long unsigned int' [-Wformat=]
     911 |         seq_printf(s, "%lx - %lx    lvl %d  stage %s ",
         |                              ~~^
         |                                |
         |                                long unsigned int
         |                              %llx


vim +911 drivers/iommu/io-pgtable-arm.c

   891	
   892	static size_t arm_lpae_dump_iova_prot(struct seq_file *s, struct io_pgtable_ops *ops,
   893									   unsigned long iova)
   894	{
   895		struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
   896		struct iova_to_phys_data d;
   897		int ret;
   898	
   899		struct io_pgtable_walk_data walk_data = {
   900			.data = &d,
   901			.visit = visit_iova_to_phys,
   902			.addr = iova,
   903			.end = iova + 1,
   904		};
   905	
   906		/* Only the mapped iova will be output */
   907		ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
   908		if (ret)
   909			return ARM_LPAE_GRANULE(data);
   910	
 > 911		seq_printf(s, "%lx - %lx    lvl %d  stage %s ",
   912				   iova, iova + ARM_LPAE_BLOCK_SIZE(d.lvl, data),
   913				   d.lvl, io_pgtable_fmt_names[data->iop.fmt]);
   914	
   915		/* TODO: The dump prot is incomplete and will be supplemented later... */
   916		dump_prot(s, d.pte);
   917		seq_puts(s, "\n");
   918	
   919		return ARM_LPAE_BLOCK_SIZE(d.lvl, data);
   920	}
   921	#endif
   922	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

