Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F472C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 02:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFFqiceVJiuepFpOMx5gYNKEGC4/EV80IqJP+L8e/Gg=; b=EoTLND4o8CaBxe/we/M+kftbuv
	4/pzJLcPUKwoAF5Zf9Cd8M9CZQ4OyvTv9+ykFNyxPJeBXCbi5v8+HrTINIhx0kj3IaI3sU7BlRn7x
	QYu47fV4pi4c6AoL/G9J+ShQIJ21gTqna+sqV7T5oAvk3Rw+pGRaTJeVLqxQEGsaYOxmWYlOJpVI8
	7YbkOHFEnRyga9FJHvyORgCn9ZpDXRdQDjm8+ubb8Ox1LfGGz/vp6DkxTd2yfiz5Gg7rZp/YUF65Y
	wEDi/8Nj+GatUmOTgl7em3Q3zmbhUXdt+MWi3it08wjOfwxs6rXj3ijfWswTJ1Sf06+1+nIb/q0e8
	dlYdBEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjWB-0000000G21E-0plu;
	Sat, 08 Mar 2025 02:02:23 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjNO-0000000G1O3-27Ne
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741398798; x=1772934798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j9kwnFeKpGqZY7TWgppnlC/2G2kF5YU2Ca2Dt7U2oD8=;
  b=PRLrRuIUpAkSLpa/eFZ07G1dsCHary552CzeJbcBogN/0WxUVbZMWy68
   OsdbuhUaubShvykLIeCpVK5wPi0Q8wmVkhXnVCslxWcwFQqqnirfcbVo8
   KpkM7gFeXwwYt4KruYphZIRLMzUqHBhAqngTyBzclfddPx5jqkbYLBLjR
   kkUuSRRm8wjeW58FHrdNGKZdcDA5JPXIXssjN8Xtv8UK3+LTdDNwe2p/l
   Oe7Cso/CBlFxf/JUkDQfjVIsNCoRTX9Hz7EpshUBlJzvE0M8l5rsEFR8w
   khEvB61IVLj9YxD5amosvXfG1bPGws8SpU3MSuTQfbUBDGVsb2hqObn21
   g==;
X-CSE-ConnectionGUID: FCA+o98JQ0CIIpL8JHgCqg==
X-CSE-MsgGUID: lTzlaVsDQvSM35gZ17xw6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42376443"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="42376443"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 17:53:14 -0800
X-CSE-ConnectionGUID: 0S3wscT1R/amxXwCI+LZ+w==
X-CSE-MsgGUID: TPjLzn4ZQ26Rld6kSI3owg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150430059"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2025 17:53:12 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqjNF-0001Ku-2s;
	Sat, 08 Mar 2025 01:53:09 +0000
Date: Sat, 8 Mar 2025 09:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
	will@kernel.org, catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
	scott@os.amperecomputing.com, cl@gentwo.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v3 PATCH 4/6] arm64: mm: support large block mapping when
 rodata=full
Message-ID: <202503080930.7ZetfmFz-lkp@intel.com>
References: <20250304222018.615808-5-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304222018.615808-5-yang@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_175318_594119_00EC7727 
X-CRM114-Status: GOOD (  14.07  )
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

Hi Yang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/arm64-Add-BBM-Level-2-cpu-feature/20250305-062252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250304222018.615808-5-yang%40os.amperecomputing.com
patch subject: [v3 PATCH 4/6] arm64: mm: support large block mapping when rodata=full
config: arm64-randconfig-002-20250308 (https://download.01.org/0day-ci/archive/20250308/202503080930.7ZetfmFz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080930.7ZetfmFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080930.7ZetfmFz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/mm/mmu.c: In function 'alloc_init_pud':
>> arch/arm64/mm/mmu.c:511:35: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     511 |                 pud_clear_fixmap();
         |                                   ^
   arch/arm64/mm/mmu.c: In function 'alloc_init_p4d':
   arch/arm64/mm/mmu.c:570:35: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     570 |                 p4d_clear_fixmap();
         |                                   ^


vim +/if +511 arch/arm64/mm/mmu.c

d27cfa1fc823d3 Ard Biesheuvel    2017-03-09  428  
2451145c9a60e0 Yang Shi          2025-03-04  429  static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
da141706aea52c Laura Abbott      2015-01-21  430  			  phys_addr_t phys, pgprot_t prot,
90292aca9854a2 Yu Zhao           2019-03-11  431  			  phys_addr_t (*pgtable_alloc)(int),
c0951366d4b7e0 Ard Biesheuvel    2017-03-09  432  			  int flags)
c1cc1552616d0f Catalin Marinas   2012-03-05  433  {
c1cc1552616d0f Catalin Marinas   2012-03-05  434  	unsigned long next;
2451145c9a60e0 Yang Shi          2025-03-04  435  	int ret = 0;
e9f6376858b979 Mike Rapoport     2020-06-04  436  	p4d_t p4d = READ_ONCE(*p4dp);
6ed8a3a094b43a Ard Biesheuvel    2024-02-14  437  	pud_t *pudp;
6fad683b9a5c21 Yang Shi          2025-03-04  438  	bool split = flags & SPLIT_MAPPINGS;
6fad683b9a5c21 Yang Shi          2025-03-04  439  
6fad683b9a5c21 Yang Shi          2025-03-04  440  	if (split) {
6fad683b9a5c21 Yang Shi          2025-03-04  441  		BUG_ON(p4d_none(p4d));
6fad683b9a5c21 Yang Shi          2025-03-04  442  		pudp = pud_offset(p4dp, addr);
6fad683b9a5c21 Yang Shi          2025-03-04  443  		goto split_pgtable;
6fad683b9a5c21 Yang Shi          2025-03-04  444  	}
c1cc1552616d0f Catalin Marinas   2012-03-05  445  
e9f6376858b979 Mike Rapoport     2020-06-04  446  	if (p4d_none(p4d)) {
efe72541355d4d Yicong Yang       2024-11-02  447  		p4dval_t p4dval = P4D_TYPE_TABLE | P4D_TABLE_UXN | P4D_TABLE_AF;
132233a759580f Laura Abbott      2016-02-05  448  		phys_addr_t pud_phys;
87143f404f338d Ard Biesheuvel    2021-03-10  449  
87143f404f338d Ard Biesheuvel    2021-03-10  450  		if (flags & NO_EXEC_MAPPINGS)
87143f404f338d Ard Biesheuvel    2021-03-10  451  			p4dval |= P4D_TABLE_PXN;
132233a759580f Laura Abbott      2016-02-05  452  		BUG_ON(!pgtable_alloc);
90292aca9854a2 Yu Zhao           2019-03-11  453  		pud_phys = pgtable_alloc(PUD_SHIFT);
2451145c9a60e0 Yang Shi          2025-03-04  454  		if (!pud_phys)
2451145c9a60e0 Yang Shi          2025-03-04  455  			return -ENOMEM;
0e9df1c905d829 Ryan Roberts      2024-04-12  456  		pudp = pud_set_fixmap(pud_phys);
0e9df1c905d829 Ryan Roberts      2024-04-12  457  		init_clear_pgtable(pudp);
0e9df1c905d829 Ryan Roberts      2024-04-12  458  		pudp += pud_index(addr);
87143f404f338d Ard Biesheuvel    2021-03-10  459  		__p4d_populate(p4dp, pud_phys, p4dval);
0e9df1c905d829 Ryan Roberts      2024-04-12  460  	} else {
e9f6376858b979 Mike Rapoport     2020-06-04  461  		BUG_ON(p4d_bad(p4d));
e9f6376858b979 Mike Rapoport     2020-06-04  462  		pudp = pud_set_fixmap_offset(p4dp, addr);
0e9df1c905d829 Ryan Roberts      2024-04-12  463  	}
0e9df1c905d829 Ryan Roberts      2024-04-12  464  
6fad683b9a5c21 Yang Shi          2025-03-04  465  split_pgtable:
c1cc1552616d0f Catalin Marinas   2012-03-05  466  	do {
20a004e7b017cc Will Deacon       2018-02-15  467  		pud_t old_pud = READ_ONCE(*pudp);
e98216b52176ba Ard Biesheuvel    2016-10-21  468  
c1cc1552616d0f Catalin Marinas   2012-03-05  469  		next = pud_addr_end(addr, end);
206a2a73a62d37 Steve Capper      2014-05-06  470  
6fad683b9a5c21 Yang Shi          2025-03-04  471  		if (split) {
6fad683b9a5c21 Yang Shi          2025-03-04  472  			ret = split_pud(pudp, old_pud, pgtable_alloc);
6fad683b9a5c21 Yang Shi          2025-03-04  473  			if (ret)
6fad683b9a5c21 Yang Shi          2025-03-04  474  				break;
6fad683b9a5c21 Yang Shi          2025-03-04  475  
6fad683b9a5c21 Yang Shi          2025-03-04  476  			ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
6fad683b9a5c21 Yang Shi          2025-03-04  477  						  pgtable_alloc, flags);
6fad683b9a5c21 Yang Shi          2025-03-04  478  			if (ret)
6fad683b9a5c21 Yang Shi          2025-03-04  479  				break;
6fad683b9a5c21 Yang Shi          2025-03-04  480  
6fad683b9a5c21 Yang Shi          2025-03-04  481  			continue;
6fad683b9a5c21 Yang Shi          2025-03-04  482  		}
6fad683b9a5c21 Yang Shi          2025-03-04  483  
206a2a73a62d37 Steve Capper      2014-05-06  484  		/*
206a2a73a62d37 Steve Capper      2014-05-06  485  		 * For 4K granule only, attempt to put down a 1GB block
206a2a73a62d37 Steve Capper      2014-05-06  486  		 */
1310222c276b79 Anshuman Khandual 2022-02-16  487  		if (pud_sect_supported() &&
1310222c276b79 Anshuman Khandual 2022-02-16  488  		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
c0951366d4b7e0 Ard Biesheuvel    2017-03-09  489  		    (flags & NO_BLOCK_MAPPINGS) == 0) {
20a004e7b017cc Will Deacon       2018-02-15  490  			pud_set_huge(pudp, phys, prot);
206a2a73a62d37 Steve Capper      2014-05-06  491  
206a2a73a62d37 Steve Capper      2014-05-06  492  			/*
e98216b52176ba Ard Biesheuvel    2016-10-21  493  			 * After the PUD entry has been populated once, we
e98216b52176ba Ard Biesheuvel    2016-10-21  494  			 * only allow updates to the permission attributes.
206a2a73a62d37 Steve Capper      2014-05-06  495  			 */
e98216b52176ba Ard Biesheuvel    2016-10-21  496  			BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
20a004e7b017cc Will Deacon       2018-02-15  497  						      READ_ONCE(pud_val(*pudp))));
206a2a73a62d37 Steve Capper      2014-05-06  498  		} else {
2451145c9a60e0 Yang Shi          2025-03-04  499  			ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
c0951366d4b7e0 Ard Biesheuvel    2017-03-09  500  					    pgtable_alloc, flags);
2451145c9a60e0 Yang Shi          2025-03-04  501  			if (ret)
2451145c9a60e0 Yang Shi          2025-03-04  502  				break;
e98216b52176ba Ard Biesheuvel    2016-10-21  503  
e98216b52176ba Ard Biesheuvel    2016-10-21  504  			BUG_ON(pud_val(old_pud) != 0 &&
20a004e7b017cc Will Deacon       2018-02-15  505  			       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
206a2a73a62d37 Steve Capper      2014-05-06  506  		}
c1cc1552616d0f Catalin Marinas   2012-03-05  507  		phys += next - addr;
20a004e7b017cc Will Deacon       2018-02-15  508  	} while (pudp++, addr = next, addr != end);
f4710445458c0a Mark Rutland      2016-01-25  509  
6fad683b9a5c21 Yang Shi          2025-03-04  510  	if (!split)
f4710445458c0a Mark Rutland      2016-01-25 @511  		pud_clear_fixmap();
2451145c9a60e0 Yang Shi          2025-03-04  512  
2451145c9a60e0 Yang Shi          2025-03-04  513  	return ret;
c1cc1552616d0f Catalin Marinas   2012-03-05  514  }
c1cc1552616d0f Catalin Marinas   2012-03-05  515  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

