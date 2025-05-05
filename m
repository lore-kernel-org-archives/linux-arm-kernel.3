Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A8FC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75z4s+yFG9zaNAwF8I6jFr8NbChrBZAF9iQIhfXmDz0=; b=l/qLvcz4RPBcz5t/zLNJAGpFaE
	YhWxMuOWe9YaOVUG25MooSlmZn9xC7bqKinHPYnIlJYDOsS2AmLtBffLli4FPxGnFmJA1S2rnkbue
	dgzZl5m8Y/NkAIrLhC/kFmeBcKxCW36hIwl9IqChc8tYwu8qrDAT6j6UnJ3rKdBenTRy2SMvk66NB
	nfdU+kWc4mQLkhszs6qbZPyxTlo/z3OdsFDAoQ1HWn3IGL1Mcm9uiQn02AIFYOWlgrJTO3vC7cEOd
	0WKRnPKfFUiqpacO0wrLCcDTaA+/BW+isQVoD7x81hyv1yNBb2ghpwQjan0ucsn2ftXxkQN5YnTJM
	XpBN2hYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwJb-00000007YF9-30Vl;
	Mon, 05 May 2025 13:57:03 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwHZ-00000007Y4z-2TEi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746453298; x=1777989298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mT9cqDmKVvE5D+3NHWI+X4Bdzp3kYBbGRt9lXt3Jz/E=;
  b=gfZxOW2vkLnGZYMY9/QGEH7jJvkfwBCaowlmgnLFkvXvMBfyb5paQlc5
   HY+fcu8oFf3mScqoMOzYITBNM/CMX19JHyjyiCr2S7UR67jftOnaJWEyN
   V1D2vOkewqeNxxXXLbe0mo4LKp2f/4EpKpsw2doaoMoldWaefbJ16I1Gq
   XziVoVu5IhQs9Ufe2gF7pNgMQVsBqh2/nXoS9MD7yBSb9lI3tSYiILfuZ
   +KjpeAfZPxYw2aC1ztAhlz907bX+GfYu/FrOdXB8lbNb8Kt4XPdZhT5T2
   gIEAD2/8NeI+3lXOgFF4SHpr42hSXVO9rEkVvtH3tupj5P2iYieFu1/8v
   A==;
X-CSE-ConnectionGUID: qajEDUjhRaeGJQ1wHy3EGg==
X-CSE-MsgGUID: ZQEaKrBNQrW9u1HVJPbVOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="51881702"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="51881702"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:54:56 -0700
X-CSE-ConnectionGUID: ED7z6mKXR3ymkA6cXhGR6w==
X-CSE-MsgGUID: NwDLqtlJTHuYGEq/aEHKpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="166307889"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 May 2025 06:54:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBwHS-0005mH-1C;
	Mon, 05 May 2025 13:54:50 +0000
Date: Mon, 5 May 2025 21:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, will@kernel.org,
	catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
Message-ID: <202505052102.U2NQHrS4-lkp@intel.com>
References: <20250503112137.1962910-6-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503112137.1962910-6-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_065457_664047_EA651CC9 
X-CRM114-Status: GOOD (  14.25  )
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

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.15-rc5 next-20250505]
[cannot apply to arm64/for-next/core kvmarm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/arm64-boot-Move-init_pgdir-into-__pi_-namespace/20250503-192534
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250503112137.1962910-6-ardb%2Bgit%40google.com
patch subject: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
config: arm64-randconfig-001-20250505 (https://download.01.org/0day-ci/archive/20250505/202505052102.U2NQHrS4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250505/202505052102.U2NQHrS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505052102.U2NQHrS4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/pi/map_kernel.c:191:30: error: use of undeclared identifier 'init_pg_end'
     191 |         memset(init_pg_dir, 0, (u64)init_pg_end - (u64)init_pg_dir);
         |                                     ^
   arch/arm64/kernel/pi/map_kernel.c:222:30: error: use of undeclared identifier 'init_pg_end'
     222 |         memset(__bss_start, 0, (u64)init_pg_end - (u64)__bss_start);
         |                                     ^
   2 errors generated.


vim +/init_pg_end +191 arch/arm64/kernel/pi/map_kernel.c

9684ec186f8fadd Ard Biesheuvel 2024-02-14  158  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  159  static void __init remap_idmap_for_lpa2(void)
9684ec186f8fadd Ard Biesheuvel 2024-02-14  160  {
9684ec186f8fadd Ard Biesheuvel 2024-02-14  161  	/* clear the bits that change meaning once LPA2 is turned on */
9684ec186f8fadd Ard Biesheuvel 2024-02-14  162  	pteval_t mask = PTE_SHARED;
9684ec186f8fadd Ard Biesheuvel 2024-02-14  163  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  164  	/*
9684ec186f8fadd Ard Biesheuvel 2024-02-14  165  	 * We have to clear bits [9:8] in all block or page descriptors in the
9684ec186f8fadd Ard Biesheuvel 2024-02-14  166  	 * initial ID map, as otherwise they will be (mis)interpreted as
9684ec186f8fadd Ard Biesheuvel 2024-02-14  167  	 * physical address bits once we flick the LPA2 switch (TCR.DS). Since
9684ec186f8fadd Ard Biesheuvel 2024-02-14  168  	 * we cannot manipulate live descriptors in that way without creating
9684ec186f8fadd Ard Biesheuvel 2024-02-14  169  	 * potential TLB conflicts, let's create another temporary ID map in a
9684ec186f8fadd Ard Biesheuvel 2024-02-14  170  	 * LPA2 compatible fashion, and update the initial ID map while running
9684ec186f8fadd Ard Biesheuvel 2024-02-14  171  	 * from that.
9684ec186f8fadd Ard Biesheuvel 2024-02-14  172  	 */
9684ec186f8fadd Ard Biesheuvel 2024-02-14  173  	create_init_idmap(init_pg_dir, mask);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  174  	dsb(ishst);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  175  	set_ttbr0_for_lpa2((u64)init_pg_dir);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  176  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  177  	/*
9684ec186f8fadd Ard Biesheuvel 2024-02-14  178  	 * Recreate the initial ID map with the same granularity as before.
9684ec186f8fadd Ard Biesheuvel 2024-02-14  179  	 * Don't bother with the FDT, we no longer need it after this.
9684ec186f8fadd Ard Biesheuvel 2024-02-14  180  	 */
9684ec186f8fadd Ard Biesheuvel 2024-02-14  181  	memset(init_idmap_pg_dir, 0,
ecc54006f158ae0 Zenghui Yu     2024-06-21  182  	       (u64)init_idmap_pg_end - (u64)init_idmap_pg_dir);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  183  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  184  	create_init_idmap(init_idmap_pg_dir, mask);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  185  	dsb(ishst);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  186  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  187  	/* switch back to the updated initial ID map */
9684ec186f8fadd Ard Biesheuvel 2024-02-14  188  	set_ttbr0_for_lpa2((u64)init_idmap_pg_dir);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  189  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  190  	/* wipe the temporary ID map from memory */
9684ec186f8fadd Ard Biesheuvel 2024-02-14 @191  	memset(init_pg_dir, 0, (u64)init_pg_end - (u64)init_pg_dir);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  192  }
9684ec186f8fadd Ard Biesheuvel 2024-02-14  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

