Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E482E67808
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 23:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0913uVD1Ar86P47r8xG/QbA0jjERzwgssVNW8A0PWl0=; b=3JBD0UKyMoJuWutBvMBIqjUVNn
	nbFSEYL6o5KGH1+6BDdRN6+fXerqXNaFKs3N25mtP2A6qdA9IbG+XT0w5jB8TJB0WtATU5nAKICHR
	aOKkXpCreprvBcaw6Iw/kAjr0oRhvoZpNv+O40gFcwIBBil5vgAVVrxNo+t5XAD2rxCpZbzoD/Qaq
	VAp5AgkhfSg7xRWCn2yycJSPPsik9XaF2PRgkp5Ezhnv97FDcPYo/IqtvDN7Sp8odqVzWz6y5l6Ge
	7GkWe4B+5pjp+7+H708bX3Qr6JxqAN6s2FqsS0la8aSKgF3zfC++mVzs9nfBfFDFVjc9hzViEsGFr
	4ArkRlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXpQC-0000000EGjZ-3CKY;
	Mon, 22 Dec 2025 23:34:36 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXpQ9-0000000EGjC-2yWs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 23:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766446474; x=1797982474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rsVXZf5HCfD/6XyIRrhSxqfkKef54C0oJ3OxPaZqzQg=;
  b=jOZaL5gL85a5+BDFfhH7Nn8pOLUnRJWMSyz6GRhqSYSLo+OMidA1gHWK
   0LZGKqneLs3hjmZ019Ue6cQ7o4lmqglbg1WkcDJy5SBos98t6Wtca5jRs
   r7RhAPnQrSuGLDlt37Jwaf4F6T0hZ908Fp1TFo/C97a9oQs/Q2/y1uHo0
   C9x7iMJeWUGiSKTtYNF9i1PjW7JC+HGbtTSpHXnZL1TMFErsXRFYLE+1+
   f6cWBWfUQx+fBez/QF7yYdOCQcuA4gXhwQz/dBmUBlz5FvMQotz/U2Dg/
   BPf5yeLo5+6jV3zIhZ6BfpL7/5dXZC0RzEWWAPS7fzJcdQG7YE7N/Cu5u
   Q==;
X-CSE-ConnectionGUID: /cYDtLKCSW6Iot6a5A/0tA==
X-CSE-MsgGUID: 4b+OAf6VSpa+E42cEwcI4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68285409"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68285409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:34:31 -0800
X-CSE-ConnectionGUID: 87TMfIpKRPaZoBYu7cvMtA==
X-CSE-MsgGUID: wkAk98NKRvq/e5JI8YBASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199945400"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 15:34:28 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpQ1-000000005f2-19it;
	Mon, 22 Dec 2025 23:34:25 +0000
Date: Tue, 23 Dec 2025 00:34:06 +0100
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
Message-ID: <202512230007.Vs6IvFVD-lkp@intel.com>
References: <20251222094351.38792-16-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222094351.38792-16-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_153433_830831_DF18F143 
X-CRM114-Status: GOOD (  13.12  )
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
[also build test ERROR on rafael-pm/bleeding-edge ras/edac-for-next linus/master v6.19-rc2 next-20251219]
[cannot apply to arm64/for-next/core tip/smp/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/ACPI-AEST-Parse-the-AEST-table/20251222-175211
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251222094351.38792-16-tianruidong%40linux.alibaba.com
patch subject: [PATCH v4 14/17] ras: ATL: Unify ATL interface for ARM64 and AMD
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251223/202512230007.Vs6IvFVD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230007.Vs6IvFVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230007.Vs6IvFVD-lkp@intel.com/

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

