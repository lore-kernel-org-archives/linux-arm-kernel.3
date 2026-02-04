Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CECE8B364
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKCp9/+2JgFjovvH9cgWz+4iiwu7HPl0ERZAPs6ZDyU=; b=3c5KYMpw7VHvWh/+jxNDF+qOhL
	UtnnvZTY5UvuDoIf0xUbKpiP72yqhvCaOrs5sOK4rpXfOOt8jZxjHulEKCeq+6AqLVRDszVmYpQl1
	Umc6qQamT69Kw/Ae3ShjD4Fc6D23usCaBTYknS68mLcCcLsMTG1NMyciQjrYl1CNDfl6LVySVEDDI
	LnwbMKhi0fUXZTF32a0jjGB70Z9+TeMdHkc9E+Thn82RLlen7VFt/f79vlaHkrgoyWrXhogQiwUbv
	E7D25nWVCIaTa/o6c7hRwNuqhjd7kVcB2oc8OzzHP0OVfnZRqCeYstCBaSxb1usFWZQYNcLAbSnoy
	lGQptEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSw9-00000007nES-3Nng;
	Wed, 04 Feb 2026 02:48:13 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSw6-00000007nE5-2Vxa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770173291; x=1801709291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A+tSRYdcSrQwa+tJGBYrQ9F/iqm+CGpSDKpJKstYnos=;
  b=Q98UmBXf9hB3ldCK2LDOhl+Aax8njTKIoBshzBL2atBxjV9MdSKEz2nv
   ekm41y3muquAsvO/I/z/D0Ta/ppfyDPeUx0tUMgOn5KZWoNrxDMx1qxwi
   C8Gm6G7p2bnQaus/uUayCfqUtANtJslcUgdd3jAhj5/cQIrtLDCaxr7W2
   nbRmpU4Q7p8iJd0/rZTSCQ+0CPQjKpabpVD8Mv4dGc/bv7aEqMBKApsn0
   DS5GAhiKAPILygL2U9EUFw34YaRRxbGBc2lST9Ds0x0JlNgqazALdTsjM
   KcVVmqO4pdbZmSIEeva3xTz6+rE3+wIv6XdmVozqpDhB1/DJJDTKf467G
   g==;
X-CSE-ConnectionGUID: +k62U1SaTVOV16sT6lU0FA==
X-CSE-MsgGUID: YOJ3cMfKS1uaImAgl7laBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71254380"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71254380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 18:48:08 -0800
X-CSE-ConnectionGUID: qx9OJY3dSPmjDUZWqUTS+Q==
X-CSE-MsgGUID: CvbhJeo4QVikG3bw+MkIEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210122647"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2026 18:48:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnSvv-00000000hOy-46Aa;
	Wed, 04 Feb 2026 02:48:00 +0000
Date: Wed, 4 Feb 2026 10:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>, alexandre.belloni@bootlin.com,
	arnd@arndb.de, fustini@kernel.org, Jonathan.Cameron@huawei.com,
	krzk@kernel.org, linus.walleij@linaro.org, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, fanghao11@huawei.com,
	linuxarm@huawei.com, liuyonglong@huawei.com,
	prime.zeng@hisilicon.com, wangzhou1@hisilicon.com,
	xuwei5@hisilicon.com, wangyushan12@huawei.com
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Message-ID: <202602041006.7Hb46Sl8-lkp@intel.com>
References: <20260203161843.649417-2-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203161843.649417-2-wangyushan12@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_184810_687447_17FE1378 
X-CRM114-Status: GOOD (  13.01  )
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

Hi Yushan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc8]
[cannot apply to soc/for-next next-20260203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-L3-cache-driver-for-HiSilicon-SoC/20260204-004656
base:   linus/master
patch link:    https://lore.kernel.org/r/20260203161843.649417-2-wangyushan12%40huawei.com
patch subject: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
config: loongarch-randconfig-r131-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041006.7Hb46Sl8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041006.7Hb46Sl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041006.7Hb46Sl8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/hisilicon/hisi_soc_l3c.c:251:7: error: call to undeclared function 'alloc_contig_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     251 |         pg = alloc_contig_pages(1 << order, GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO,
         |              ^
>> drivers/soc/hisilicon/hisi_soc_l3c.c:251:5: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
     251 |         pg = alloc_contig_pages(1 << order, GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO,
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     252 |                                 cpu_to_node(smp_processor_id()), NULL);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/alloc_contig_pages +251 drivers/soc/hisilicon/hisi_soc_l3c.c

   237	
   238	static int hisi_l3c_mmap(struct file *file, struct vm_area_struct *vma)
   239	{
   240		unsigned long size = vma->vm_end - vma->vm_start;
   241		int order = get_order(size);
   242		unsigned long addr;
   243		struct page *pg;
   244		int ret;
   245	
   246		struct hisi_l3c_lock_region *clr __free(kfree) = kzalloc(sizeof(*clr), GFP_KERNEL);
   247		if (!clr)
   248			return -ENOMEM;
   249	
   250		/* Continuous physical memory is required for L3 cache lock. */
 > 251		pg = alloc_contig_pages(1 << order, GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO,
   252					cpu_to_node(smp_processor_id()), NULL);
   253		if (!pg)
   254			return -ENOMEM;
   255	
   256		addr = page_to_phys(pg);
   257		*clr = (struct hisi_l3c_lock_region) {
   258			.addr = addr,
   259			.size = size,
   260			.cpu = smp_processor_id(),
   261			/* vma should not be moved, store here for validation */
   262			.vm_start = vma->vm_start,
   263			.vm_end = vma->vm_end,
   264		};
   265	
   266		vm_flags_set(vma, VM_DONTCOPY | VM_DONTEXPAND);
   267		vma->vm_ops = &hisi_l3c_vm_ops;
   268		vma->vm_private_data = clr;
   269	
   270		hisi_l3c_vm_ops.open(vma);
   271		if (clr->status) {
   272			ret = clr->status;
   273			goto out_page;
   274		}
   275	
   276		ret = remap_pfn_range(vma, vma->vm_start, PFN_DOWN(addr), size,
   277				      vma->vm_page_prot);
   278		if (ret)
   279			goto out_page;
   280	
   281		/* Save clr from being freed when lock succeeds. */
   282		vma->vm_private_data = no_free_ptr(clr);
   283	
   284		return 0;
   285	
   286	out_page:
   287		free_contig_range(PHYS_PFN(clr->addr), 1 << order);
   288		return ret;
   289	}
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

