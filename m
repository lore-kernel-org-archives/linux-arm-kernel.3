Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8798CE784A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 07:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+Qr+mRTnFHA5sf0klHtasI7Lk3iF8KN8OrNZq5c3lU=; b=P9ppQV+/M1HtMcOMl3kUQP0vFn
	VRfNuCb/JdxSQDmpgIpPbsTLPECne1ORe3tDd8ePQ9hDU4sPsJ1bq/MvWWt/mbj5P0AXu2bBISi3L
	uPMeKo+0EhZRGug0B9QBlnzGPr8wEnx6jRpl2A3gHHZW4flfQ1RbWhTb6wKnNpUaV/uiRxiS87SEk
	tmM335Mb3L0gs6VgrSLxIny63GeGtmu5e6j+W8URwi/tdk7vYDOkZ7cRoeHojwt2Xz47eGlo4YVQZ
	hDUwFM+JhBvv8UYS0/Z6d1ZBUZBotHMr6hfIXelawImsBTgwVC+Eldp9aQAQqhNRUgPEkZU9VsO0D
	dDwKZ1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYfKI-000000009Ll-34OE;
	Thu, 25 Dec 2025 06:59:58 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYfKF-000000009LO-1Zwb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 06:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766645996; x=1798181996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+WiEymJv/nr2X5pjWCtt6q+S4mNEdgmhNha83diODgc=;
  b=M5aoF0a7tbl63a1vHS4wKkwC1uxhBw9r8RZkDeyu8gLXa7ajCW4F5Abc
   Oipa98OuWqEW+cVYFvxh96ut9Kz241T57ib100W3Fg+0tnaxzEniGVGQy
   DF6/fH3Q+RksU3/oZHxshL3Ut8PnGQqjJcDip/MKw30D3sZ3EHyw2UrMD
   NEazCSHeTDR34He8fBkZN3Du5B5oCUW5W1s4fCXkUJilVhuLGGYBr6D7r
   fX7EunW8zGtOh367aiRxGk3mGXhFSr20TxHWsMdqeKFJW33ncF4ORm4Hc
   yYA8brQgRfFBP2EmUHHQUCyMgxDIe4xHWrtkZBHZFtXYNz7Xcg/3f/yC9
   Q==;
X-CSE-ConnectionGUID: la+qKXy7RXuhd/Z9QP0YIw==
X-CSE-MsgGUID: zMhhQ6xnSh2Fd4kZj4Vj1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68440325"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68440325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:59:52 -0800
X-CSE-ConnectionGUID: RwRzrLXQR3S4e/QAzpKyJw==
X-CSE-MsgGUID: bgk551fhQNa8HKvE2FagTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="231228707"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Dec 2025 22:59:47 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYfK5-000000003qx-1WVx;
	Thu, 25 Dec 2025 06:59:45 +0000
Date: Thu, 25 Dec 2025 14:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
	will@kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
	sudeep.holla@arm.com, xueshuai@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	lenb@kernel.org, tony.luck@intel.com, bp@alien8.de,
	yazen.ghannam@amd.com, misono.tomohiro@fujitsu.com
Cc: oe-kbuild-all@lists.linux.dev, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v4 14/17] ras: ATL: Unify ATL interface for ARM64 and AMD
Message-ID: <202512251419.gOeKyBqX-lkp@intel.com>
References: <20251222094351.38792-16-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222094351.38792-16-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_225955_559067_DADAC1B3 
X-CRM114-Status: GOOD (  12.91  )
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
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.19-rc2 next-20251219]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/ACPI-AEST-Parse-the-AEST-table/20251222-215248
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251222094351.38792-16-tianruidong%40linux.alibaba.com
patch subject: [PATCH v4 14/17] ras: ATL: Unify ATL interface for ARM64 and AMD
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251225/202512251419.gOeKyBqX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251419.gOeKyBqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251419.gOeKyBqX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ras/amd/fmpm.c: In function 'save_spa':
>> drivers/ras/amd/fmpm.c:336:15: error: implicit declaration of function 'amd_convert_umc_mca_addr_to_sys_addr'; did you mean 'convert_umc_mca_addr_to_sys_addr'? [-Wimplicit-function-declaration]
     336 |         spa = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               convert_umc_mca_addr_to_sys_addr
--
   drivers/ras/amd/atl/umc.c: In function '_retire_row_mi300':
>> drivers/ras/amd/atl/umc.c:321:24: error: implicit declaration of function 'amd_convert_umc_mca_addr_to_sys_addr'; did you mean 'convert_umc_mca_addr_to_sys_addr'? [-Wimplicit-function-declaration]
     321 |                 addr = amd_convert_umc_mca_addr_to_sys_addr(a_err);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        convert_umc_mca_addr_to_sys_addr


vim +336 drivers/ras/amd/fmpm.c

6f15e617cc9932 Yazen Ghannam 2024-02-13  298  
838850c50884cd Yazen Ghannam 2024-03-01  299  static void save_spa(struct fru_rec *rec, unsigned int entry,
838850c50884cd Yazen Ghannam 2024-03-01  300  		     u64 addr, u64 id, unsigned int cpu)
838850c50884cd Yazen Ghannam 2024-03-01  301  {
838850c50884cd Yazen Ghannam 2024-03-01  302  	unsigned int i, fru_idx, spa_entry;
838850c50884cd Yazen Ghannam 2024-03-01  303  	struct atl_err a_err;
838850c50884cd Yazen Ghannam 2024-03-01  304  	unsigned long spa;
838850c50884cd Yazen Ghannam 2024-03-01  305  
838850c50884cd Yazen Ghannam 2024-03-01  306  	if (entry >= max_nr_entries) {
838850c50884cd Yazen Ghannam 2024-03-01  307  		pr_warn_once("FRU descriptor entry %d out-of-bounds (max: %d)\n",
838850c50884cd Yazen Ghannam 2024-03-01  308  			     entry, max_nr_entries);
838850c50884cd Yazen Ghannam 2024-03-01  309  		return;
838850c50884cd Yazen Ghannam 2024-03-01  310  	}
838850c50884cd Yazen Ghannam 2024-03-01  311  
838850c50884cd Yazen Ghannam 2024-03-01  312  	/* spa_nr_entries is always multiple of max_nr_entries */
838850c50884cd Yazen Ghannam 2024-03-01  313  	for (i = 0; i < spa_nr_entries; i += max_nr_entries) {
838850c50884cd Yazen Ghannam 2024-03-01  314  		fru_idx = i / max_nr_entries;
838850c50884cd Yazen Ghannam 2024-03-01  315  		if (fru_records[fru_idx] == rec)
838850c50884cd Yazen Ghannam 2024-03-01  316  			break;
838850c50884cd Yazen Ghannam 2024-03-01  317  	}
838850c50884cd Yazen Ghannam 2024-03-01  318  
838850c50884cd Yazen Ghannam 2024-03-01  319  	if (i >= spa_nr_entries) {
838850c50884cd Yazen Ghannam 2024-03-01  320  		pr_warn_once("FRU record %d not found\n", i);
838850c50884cd Yazen Ghannam 2024-03-01  321  		return;
838850c50884cd Yazen Ghannam 2024-03-01  322  	}
838850c50884cd Yazen Ghannam 2024-03-01  323  
838850c50884cd Yazen Ghannam 2024-03-01  324  	spa_entry = i + entry;
838850c50884cd Yazen Ghannam 2024-03-01  325  	if (spa_entry >= spa_nr_entries) {
838850c50884cd Yazen Ghannam 2024-03-01  326  		pr_warn_once("spa_entries[] index out-of-bounds\n");
838850c50884cd Yazen Ghannam 2024-03-01  327  		return;
838850c50884cd Yazen Ghannam 2024-03-01  328  	}
838850c50884cd Yazen Ghannam 2024-03-01  329  
838850c50884cd Yazen Ghannam 2024-03-01  330  	memset(&a_err, 0, sizeof(struct atl_err));
838850c50884cd Yazen Ghannam 2024-03-01  331  
838850c50884cd Yazen Ghannam 2024-03-01  332  	a_err.addr = addr;
838850c50884cd Yazen Ghannam 2024-03-01  333  	a_err.ipid = id;
838850c50884cd Yazen Ghannam 2024-03-01  334  	a_err.cpu  = cpu;
838850c50884cd Yazen Ghannam 2024-03-01  335  
838850c50884cd Yazen Ghannam 2024-03-01 @336  	spa = amd_convert_umc_mca_addr_to_sys_addr(&a_err);
838850c50884cd Yazen Ghannam 2024-03-01  337  	if (IS_ERR_VALUE(spa)) {
838850c50884cd Yazen Ghannam 2024-03-01  338  		pr_debug("Failed to get system address\n");
838850c50884cd Yazen Ghannam 2024-03-01  339  		return;
838850c50884cd Yazen Ghannam 2024-03-01  340  	}
838850c50884cd Yazen Ghannam 2024-03-01  341  
838850c50884cd Yazen Ghannam 2024-03-01  342  	spa_entries[spa_entry] = spa;
838850c50884cd Yazen Ghannam 2024-03-01  343  	pr_debug("fru_idx: %u, entry: %u, spa_entry: %u, spa: 0x%016llx\n",
838850c50884cd Yazen Ghannam 2024-03-01  344  		 fru_idx, entry, spa_entry, spa_entries[spa_entry]);
838850c50884cd Yazen Ghannam 2024-03-01  345  }
838850c50884cd Yazen Ghannam 2024-03-01  346  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

