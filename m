Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D869C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JB+EEoVcUKNfGd8y3321kIW+kxw//Y8BH7UJyrw9gVg=; b=pAreRP03AfmQ0tZmeRDt7yEPeH
	M9U5Br531GJJoekHTdBLj0XM8t/6h/AeVKbjboC3ZE0xuORoppiFelGm/hBcaKKhYtnxLTyodhz37
	k5pRpS8hOQdoL2GEPknszrWXG1qyrOar49nQLAKhbo6tdpMvasJyD5yNnbPyA1JUwV7iCfvD6LyQn
	TgoAGKJUfNmEEVHFdwn3yXhKmDbKaJ+4xaFMkpRofE4YWYqilqjqDN+PLI/lT5zt445t245bY49LH
	+OKNpAnWOqFAoXMV5kMzlEMeQmBRDaO5r36444CTg+orTrBKMNPSN59TEROMsEgBPAj5+fIRDgc6P
	Wxlh8yZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCASq-0000000ALaz-2sTT;
	Tue, 06 May 2025 05:03:32 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5aZ-0000000993b-0Uaa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746489071; x=1778025071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0DSF7dHmV17QwKXNCFzP0+mA7qcPG4gxTwIbAzLc++c=;
  b=GdMGzUCTS2u5gWesR7ml3qSv74T9D+4Yiaze3ZcEBPXbkagqW1EnQO9Y
   RlOgV1c3ZboJWoCgLcAEa56qdSh7kzq0N//aUnpamOFt2s1D9D0dO5LRF
   +GXairk/zVK5oUE6pI33lLoV5Dt1yXTXxtwZj5ud1CYaNk1r3KpvHlyNA
   bQkO8U2CrCROR9yiTkO78lkw49JYdbhGJAI1MlWfJkflOphQHgOKaofnW
   kJqt2aIf98TYwCGdGy0bxaVUJ+lRukup8bbBC4RRpU36Kd1U3HdnitRey
   6FbJWqhvP413OdO2bvJ0ec8N29IzI5Dhp99Zwt1+MfuQaoDoJklWY8R/0
   Q==;
X-CSE-ConnectionGUID: vmPA4kQEQ/yEaMnT4NUzpg==
X-CSE-MsgGUID: a0ja0x77SYqrsyuQL/VYHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="51939051"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="51939051"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 16:51:06 -0700
X-CSE-ConnectionGUID: B9ereCXyRtKibr91GbHSFA==
X-CSE-MsgGUID: nRDOwKmBSD+5Q8l7GbvmPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="172617724"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2025 16:51:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC5aO-00068L-2k;
	Mon, 05 May 2025 23:51:00 +0000
Date: Tue, 6 May 2025 07:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
Message-ID: <202505060740.OIkWGFVZ-lkp@intel.com>
References: <20250503112137.1962910-6-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503112137.1962910-6-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_165111_232969_25466CFD 
X-CRM114-Status: GOOD (  17.86  )
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
[also build test ERROR on arm/for-next arm/fixes linus/master v6.15-rc5 next-20250505]
[cannot apply to arm64/for-next/core kvmarm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/arm64-boot-Move-init_pgdir-into-__pi_-namespace/20250503-192534
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250503112137.1962910-6-ardb%2Bgit%40google.com
patch subject: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250506/202505060740.OIkWGFVZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505060740.OIkWGFVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505060740.OIkWGFVZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/pi/map_kernel.c: In function 'remap_idmap_for_lpa2':
>> arch/arm64/kernel/pi/map_kernel.c:191:37: error: 'init_pg_end' undeclared (first use in this function); did you mean 'init_pg_dir'?
     191 |         memset(init_pg_dir, 0, (u64)init_pg_end - (u64)init_pg_dir);
         |                                     ^~~~~~~~~~~
         |                                     init_pg_dir
   arch/arm64/kernel/pi/map_kernel.c:191:37: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kernel/pi/map_kernel.c: In function 'early_map_kernel':
   arch/arm64/kernel/pi/map_kernel.c:222:37: error: 'init_pg_end' undeclared (first use in this function); did you mean 'init_pg_dir'?
     222 |         memset(__bss_start, 0, (u64)init_pg_end - (u64)__bss_start);
         |                                     ^~~~~~~~~~~
         |                                     init_pg_dir


vim +191 arch/arm64/kernel/pi/map_kernel.c

9684ec186f8fad Ard Biesheuvel 2024-02-14  158  
9684ec186f8fad Ard Biesheuvel 2024-02-14  159  static void __init remap_idmap_for_lpa2(void)
9684ec186f8fad Ard Biesheuvel 2024-02-14  160  {
9684ec186f8fad Ard Biesheuvel 2024-02-14  161  	/* clear the bits that change meaning once LPA2 is turned on */
9684ec186f8fad Ard Biesheuvel 2024-02-14  162  	pteval_t mask = PTE_SHARED;
9684ec186f8fad Ard Biesheuvel 2024-02-14  163  
9684ec186f8fad Ard Biesheuvel 2024-02-14  164  	/*
9684ec186f8fad Ard Biesheuvel 2024-02-14  165  	 * We have to clear bits [9:8] in all block or page descriptors in the
9684ec186f8fad Ard Biesheuvel 2024-02-14  166  	 * initial ID map, as otherwise they will be (mis)interpreted as
9684ec186f8fad Ard Biesheuvel 2024-02-14  167  	 * physical address bits once we flick the LPA2 switch (TCR.DS). Since
9684ec186f8fad Ard Biesheuvel 2024-02-14  168  	 * we cannot manipulate live descriptors in that way without creating
9684ec186f8fad Ard Biesheuvel 2024-02-14  169  	 * potential TLB conflicts, let's create another temporary ID map in a
9684ec186f8fad Ard Biesheuvel 2024-02-14  170  	 * LPA2 compatible fashion, and update the initial ID map while running
9684ec186f8fad Ard Biesheuvel 2024-02-14  171  	 * from that.
9684ec186f8fad Ard Biesheuvel 2024-02-14  172  	 */
9684ec186f8fad Ard Biesheuvel 2024-02-14  173  	create_init_idmap(init_pg_dir, mask);
9684ec186f8fad Ard Biesheuvel 2024-02-14  174  	dsb(ishst);
9684ec186f8fad Ard Biesheuvel 2024-02-14  175  	set_ttbr0_for_lpa2((u64)init_pg_dir);
9684ec186f8fad Ard Biesheuvel 2024-02-14  176  
9684ec186f8fad Ard Biesheuvel 2024-02-14  177  	/*
9684ec186f8fad Ard Biesheuvel 2024-02-14  178  	 * Recreate the initial ID map with the same granularity as before.
9684ec186f8fad Ard Biesheuvel 2024-02-14  179  	 * Don't bother with the FDT, we no longer need it after this.
9684ec186f8fad Ard Biesheuvel 2024-02-14  180  	 */
9684ec186f8fad Ard Biesheuvel 2024-02-14  181  	memset(init_idmap_pg_dir, 0,
ecc54006f158ae Zenghui Yu     2024-06-21  182  	       (u64)init_idmap_pg_end - (u64)init_idmap_pg_dir);
9684ec186f8fad Ard Biesheuvel 2024-02-14  183  
9684ec186f8fad Ard Biesheuvel 2024-02-14  184  	create_init_idmap(init_idmap_pg_dir, mask);
9684ec186f8fad Ard Biesheuvel 2024-02-14  185  	dsb(ishst);
9684ec186f8fad Ard Biesheuvel 2024-02-14  186  
9684ec186f8fad Ard Biesheuvel 2024-02-14  187  	/* switch back to the updated initial ID map */
9684ec186f8fad Ard Biesheuvel 2024-02-14  188  	set_ttbr0_for_lpa2((u64)init_idmap_pg_dir);
9684ec186f8fad Ard Biesheuvel 2024-02-14  189  
9684ec186f8fad Ard Biesheuvel 2024-02-14  190  	/* wipe the temporary ID map from memory */
9684ec186f8fad Ard Biesheuvel 2024-02-14 @191  	memset(init_pg_dir, 0, (u64)init_pg_end - (u64)init_pg_dir);
9684ec186f8fad Ard Biesheuvel 2024-02-14  192  }
9684ec186f8fad Ard Biesheuvel 2024-02-14  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

