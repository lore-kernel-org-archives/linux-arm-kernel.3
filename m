Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56913CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VZbsDnMIbcwW1DKVMEuCtS3gIzS6NRMFdAXirmYN1E=; b=rt/vNX+JKKCQFE6zX949oHwNC3
	exIx8JPPZg/G0ZwuwPJB99o9hq8T+2nieHZxMZXGsPz7V3amOzUjl+t+Rh2DfHxvgHB7quwNM5we1
	YLU8b8aHoXBj71JLGG7nD445LHiAjDuiYL0RsfdeSn9ep8a3yjpym+lhC2ZhRwCD7d7UE80KwhBDV
	VjRT3CWN0O7GwjWT+xeVU7bPGdLvthXBbW8qXm5JCZCKXgGhytNCnWBw5lfdT0qjWSkMrFxxMFn5Q
	afFofNwttUwK+azhkP8sDPg8wO1zOxkOkdhbK+gSTwsAiEz2Nw76un2hese8fKfdDM/Z4LLlTynEM
	KK1fannQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umw4V-00000002oSx-0xYf;
	Fri, 15 Aug 2025 15:10:23 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrC1-000000027vZ-0bfL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755251869; x=1786787869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cRwd0xAh9h5E7sVoqCJod5qdMXXF26YfR10Uhew0+Jg=;
  b=b3ZXJz/7ONJ6dcZ/Kvsjm5YK1gbbbyFwxrJI00Gf9M413b/lAWCOLo8Z
   ChgYp3EQ+kbDs7sf5deFeip1OGx5zSqKN3UcWortvvxw2K47xmwJEhszO
   kCwYRnc6SdW5aHRkvKidSg9KTL8sQyxsSIgiJ6LWLgW619F/KfVfmPNqu
   c1awoRLTyKc5dn5k2yshHl1/5pP37K8j/hUYp9RIaCsx55Pa23h4vKBaP
   Cdvd2IILQcr11gEnU14ILzXzfEqsXA1slWicmZ6Gz2k8q8vj64vOMy4Ix
   Ng1GhLLcCA6ozmbyPglL2KNs29Ku3reRVBQO1pD/kPpFEPcs1gztTVfNn
   A==;
X-CSE-ConnectionGUID: /5pLZg1fToOXOUT/f0uYsw==
X-CSE-MsgGUID: DYrl6vlSTZCUNDZScwgSBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61207240"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61207240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:57:46 -0700
X-CSE-ConnectionGUID: DXmdI5xFRa+CIQ9bGOnzvQ==
X-CSE-MsgGUID: RtOQGOPiTKarUpJGcI93LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171112789"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2025 02:57:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umrBs-000Bpk-2c;
	Fri, 15 Aug 2025 09:57:40 +0000
Date: Fri, 15 Aug 2025 17:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Qinxin Xia <xiaqinxin@huawei.com>, will@kernel.org,
	robin.murphy@arm.com, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, xiaqinxin@huawei.com, yangyicong@huawei.com,
	wangzhou1@hisilicon.com, prime.zeng@hisilicon.com,
	xuwei5@huawei.com, fanghao11@huawei.com,
	jonathan.cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 1/2] iommu/debug: Add IOMMU page table dump debug facility
Message-ID: <202508151711.pZGu9jac-lkp@intel.com>
References: <20250814093005.2040511-2-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814093005.2040511-2-xiaqinxin@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_025749_220113_CC075FE2 
X-CRM114-Status: GOOD (  13.27  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qinxin-Xia/iommu-debug-Add-IOMMU-page-table-dump-debug-facility/20250814-173720
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250814093005.2040511-2-xiaqinxin%40huawei.com
patch subject: [PATCH 1/2] iommu/debug: Add IOMMU page table dump debug facility
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508151711.pZGu9jac-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151711.pZGu9jac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151711.pZGu9jac-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/iommu.c: In function 'iommu_iova_info_dump':
>> drivers/iommu/iommu.c:1093:17: error: implicit declaration of function 'iommu_domain_to_iovad'; did you mean 'iommu_domain_type_str'? [-Wimplicit-function-declaration]
    1093 |         iovad = iommu_domain_to_iovad(domain);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 iommu_domain_type_str
>> drivers/iommu/iommu.c:1093:15: error: assignment to 'struct iova_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1093 |         iovad = iommu_domain_to_iovad(domain);
         |               ^


vim +1093 drivers/iommu/iommu.c

  1078	
  1079	/**
  1080	 * iova_info_dump - dump iova alloced
  1081	 * @s - file structure used to generate serialized output
  1082	 * @iovad: - iova domain in question.
  1083	 */
  1084	static int iommu_iova_info_dump(struct seq_file *s, struct iommu_domain *domain)
  1085	{
  1086		struct iova_domain *iovad;
  1087		unsigned long long pfn;
  1088		unsigned long i_shift;
  1089		struct rb_node *node;
  1090		unsigned long flags;
  1091		size_t prot_size;
  1092	
> 1093		iovad = iommu_domain_to_iovad(domain);
  1094		if (!iovad)
  1095			return -ENOMEM;
  1096	
  1097		i_shift = iova_shift(iovad);
  1098	
  1099		/* Take the lock so that no other thread is manipulating the rbtree */
  1100		spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
  1101		assert_spin_locked(&iovad->iova_rbtree_lock);
  1102	
  1103		for (node = rb_first(&iovad->rbroot); node; node = rb_next(node)) {
  1104			struct iova *iova = rb_entry(node, struct iova, node);
  1105	
  1106			if (iova->pfn_hi <= iova->pfn_lo)
  1107				continue;
  1108	
  1109			for (pfn = iova->pfn_lo; pfn <= iova->pfn_hi; ) {
  1110				prot_size = domain->ops->dump_iova_prot(s, domain, pfn << i_shift);
  1111				pfn = ((pfn << i_shift) + prot_size) >> i_shift;
  1112			}
  1113		}
  1114	
  1115		spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
  1116		return 0;
  1117	}
  1118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

