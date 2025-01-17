Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE75C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 06:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64yMjyTL4t4wMpazyaXl34vg+yGeRfzntSUS1LCcLBc=; b=PimD85Orsa9g8YkYfCrEFGTgsk
	IrpYQy++81w4J1+Q2glO28hf1Ea143y9e0PF/VfG6cK0kTGQ5/SGTG6ERnS5xV7i/qfQ7xoXYN61z
	KKMzObXZ37LCPSSoA1AiaCU1SGRXGWmC+IoWWHSW/Ric8jedb8VV/aF+Pan7CmkuykwJHP+8bklrp
	dKmh56mjpJZu1nqLnNbrXy/cN+taCSm51eH7p936PdsHQI0H2tUREG2P7pPRCrTe1N/M8xudFsbDX
	axzTLF/43nXZlb+GDHHoIeZ5aP6MGLC3NvX34qYQbcFsqqdrcU1eqYeYtQNvm1p1SjGKBkm9qnRG3
	4UJPupAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYffS-0000000H5mS-3Ulk;
	Fri, 17 Jan 2025 06:17:18 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYfeC-0000000H5eM-0cCh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 06:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737094560; x=1768630560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kg16RHW8cdWnAcClUOzL818b1KoynA7ZhBOw7j4eORo=;
  b=E1IOyXw1mRtov0iK0AXxn9s6B9bC0RZ+1AG/o0iIFa1p7ltF6hOFVDOG
   1e+HI7vuy/nLSEgUQloGlI71PpQOZgWGNzkP4eNs6yuEHCbjz7HUYHpoq
   38yjPFTRpMr1PpcXoMf2notTzkueczHVqySdbygaHs6W6eV3adLabCR8/
   1vzUYl/BYcHA/+MoYnexCoRwW0tx1EPRP0Yp08PC/L+WTntwYkEMV6MLq
   DY/CEwuasRj3NMDBZLWEMO0cqG1a2GPxmqe0B29V/OhFi5vAgS6ilLLJW
   B1eaetkA4DPoem3ofXIlD+tzVZcMZVKlhI4R23sVcdeFPcoCefDFo7Sdo
   w==;
X-CSE-ConnectionGUID: N/9F4uEOR16ly46E6+nlUg==
X-CSE-MsgGUID: LSviJnDmTLWyA1eP9lLLJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37676376"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="37676376"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 22:16:00 -0800
X-CSE-ConnectionGUID: jrNO/XRtSoKH8B4qQnxQ2Q==
X-CSE-MsgGUID: D1g2/gJ/TGeOVm4pgK7Jug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="106302118"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2025 22:15:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYfe5-000Sq7-1s;
	Fri, 17 Jan 2025 06:15:53 +0000
Date: Fri, 17 Jan 2025 14:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
	will@kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
	sudeep.holla@arm.com, xueshuai@linux.alibaba.com,
	baolin.wang@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org, lenb@kernel.org, tony.luck@intel.com,
	bp@alien8.de, yazen.ghannam@amd.com
Cc: oe-kbuild-all@lists.linux.dev, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v3 4/5] RAS/ATL: Unified ATL interface for ARM64 and AMD
Message-ID: <202501171437.tCtg3x1c-lkp@intel.com>
References: <20250115084228.107573-5-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115084228.107573-5-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_221600_199491_591F52E9 
X-CRM114-Status: GOOD (  13.61  )
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

Hi Ruidong,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge arm64/for-next/core ras/edac-for-next linus/master tip/smp/core v6.13-rc7 next-20250116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/ACPI-RAS-AEST-Initial-AEST-driver/20250115-164601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250115084228.107573-5-tianruidong%40linux.alibaba.com
patch subject: [PATCH v3 4/5] RAS/ATL: Unified ATL interface for ARM64 and AMD
config: x86_64-randconfig-074-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171437.tCtg3x1c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171437.tCtg3x1c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171437.tCtg3x1c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ras/amd/fmpm.c: In function 'save_spa':
>> drivers/ras/amd/fmpm.c:329:15: error: implicit declaration of function 'amd_convert_umc_mca_addr_to_sys_addr'; did you mean 'convert_umc_mca_addr_to_sys_addr'? [-Werror=implicit-function-declaration]
     329 |         spa = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               convert_umc_mca_addr_to_sys_addr
   cc1: some warnings being treated as errors
--
   drivers/ras/amd/atl/umc.c: In function 'retire_row_mi300':
>> drivers/ras/amd/atl/umc.c:333:24: error: implicit declaration of function 'amd_convert_umc_mca_addr_to_sys_addr'; did you mean 'convert_umc_mca_addr_to_sys_addr'? [-Werror=implicit-function-declaration]
     333 |                 addr = amd_convert_umc_mca_addr_to_sys_addr(a_err);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        convert_umc_mca_addr_to_sys_addr
   cc1: some warnings being treated as errors


vim +329 drivers/ras/amd/fmpm.c

6f15e617cc9932 Yazen Ghannam 2024-02-13  291  
838850c50884cd Yazen Ghannam 2024-03-01  292  static void save_spa(struct fru_rec *rec, unsigned int entry,
838850c50884cd Yazen Ghannam 2024-03-01  293  		     u64 addr, u64 id, unsigned int cpu)
838850c50884cd Yazen Ghannam 2024-03-01  294  {
838850c50884cd Yazen Ghannam 2024-03-01  295  	unsigned int i, fru_idx, spa_entry;
838850c50884cd Yazen Ghannam 2024-03-01  296  	struct atl_err a_err;
838850c50884cd Yazen Ghannam 2024-03-01  297  	unsigned long spa;
838850c50884cd Yazen Ghannam 2024-03-01  298  
838850c50884cd Yazen Ghannam 2024-03-01  299  	if (entry >= max_nr_entries) {
838850c50884cd Yazen Ghannam 2024-03-01  300  		pr_warn_once("FRU descriptor entry %d out-of-bounds (max: %d)\n",
838850c50884cd Yazen Ghannam 2024-03-01  301  			     entry, max_nr_entries);
838850c50884cd Yazen Ghannam 2024-03-01  302  		return;
838850c50884cd Yazen Ghannam 2024-03-01  303  	}
838850c50884cd Yazen Ghannam 2024-03-01  304  
838850c50884cd Yazen Ghannam 2024-03-01  305  	/* spa_nr_entries is always multiple of max_nr_entries */
838850c50884cd Yazen Ghannam 2024-03-01  306  	for (i = 0; i < spa_nr_entries; i += max_nr_entries) {
838850c50884cd Yazen Ghannam 2024-03-01  307  		fru_idx = i / max_nr_entries;
838850c50884cd Yazen Ghannam 2024-03-01  308  		if (fru_records[fru_idx] == rec)
838850c50884cd Yazen Ghannam 2024-03-01  309  			break;
838850c50884cd Yazen Ghannam 2024-03-01  310  	}
838850c50884cd Yazen Ghannam 2024-03-01  311  
838850c50884cd Yazen Ghannam 2024-03-01  312  	if (i >= spa_nr_entries) {
838850c50884cd Yazen Ghannam 2024-03-01  313  		pr_warn_once("FRU record %d not found\n", i);
838850c50884cd Yazen Ghannam 2024-03-01  314  		return;
838850c50884cd Yazen Ghannam 2024-03-01  315  	}
838850c50884cd Yazen Ghannam 2024-03-01  316  
838850c50884cd Yazen Ghannam 2024-03-01  317  	spa_entry = i + entry;
838850c50884cd Yazen Ghannam 2024-03-01  318  	if (spa_entry >= spa_nr_entries) {
838850c50884cd Yazen Ghannam 2024-03-01  319  		pr_warn_once("spa_entries[] index out-of-bounds\n");
838850c50884cd Yazen Ghannam 2024-03-01  320  		return;
838850c50884cd Yazen Ghannam 2024-03-01  321  	}
838850c50884cd Yazen Ghannam 2024-03-01  322  
838850c50884cd Yazen Ghannam 2024-03-01  323  	memset(&a_err, 0, sizeof(struct atl_err));
838850c50884cd Yazen Ghannam 2024-03-01  324  
838850c50884cd Yazen Ghannam 2024-03-01  325  	a_err.addr = addr;
838850c50884cd Yazen Ghannam 2024-03-01  326  	a_err.ipid = id;
838850c50884cd Yazen Ghannam 2024-03-01  327  	a_err.cpu  = cpu;
838850c50884cd Yazen Ghannam 2024-03-01  328  
838850c50884cd Yazen Ghannam 2024-03-01 @329  	spa = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
838850c50884cd Yazen Ghannam 2024-03-01  330  	if (IS_ERR_VALUE(spa)) {
838850c50884cd Yazen Ghannam 2024-03-01  331  		pr_debug("Failed to get system address\n");
838850c50884cd Yazen Ghannam 2024-03-01  332  		return;
838850c50884cd Yazen Ghannam 2024-03-01  333  	}
838850c50884cd Yazen Ghannam 2024-03-01  334  
838850c50884cd Yazen Ghannam 2024-03-01  335  	spa_entries[spa_entry] = spa;
838850c50884cd Yazen Ghannam 2024-03-01  336  	pr_debug("fru_idx: %u, entry: %u, spa_entry: %u, spa: 0x%016llx\n",
838850c50884cd Yazen Ghannam 2024-03-01  337  		 fru_idx, entry, spa_entry, spa_entries[spa_entry]);
838850c50884cd Yazen Ghannam 2024-03-01  338  }
838850c50884cd Yazen Ghannam 2024-03-01  339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

