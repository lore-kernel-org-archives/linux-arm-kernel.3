Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1294CD58D5F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzSZ+TUeB/1XJMf+6wBgy7zflG/XSVm85D9yS89bV2c=; b=aqZ/ypmNI+zmnq5evP3I4ynr/4
	qNJ5chtdKUsjyDzn4r0Utk5p/GFjrBPMlJJPwIoV6zKu4RLWz3HDTi+9sSfDJahUHeSx9xpxaNf2X
	gt64PxPUYure3PPcHALBbItFwTfuCFhHR7VdCppJTcn49SFhAG/kTM/t5APpImE7VGqBfqrWi5gS4
	TtO9pVcPKG3lTul1Y408JnyHQbXoD69wxI6uFSVhcf1q0+udYrhFJ7q6MKiOnTT8OEf9YAHMas2p+
	1HiJn3J7BA3yaE7IBxLkn6ptgxVFxrsYt+++2XUdnIJkQZ11RIfDWfFpTP4uPZJ1QiWhrEkQkIbhi
	Op2i2d0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbOz-00000008ZEb-1qU5;
	Mon, 25 Nov 2024 15:53:29 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbO1-00000008Z6q-0XSc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732549950; x=1764085950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=44XADmBY7482aBrna1Gf1jtuO1UMXA5lIwwU6HOjwtg=;
  b=I2d/PjUMica6c6Sfs1vztxpWK9GibK3L4RqGusuQBkeDCrRGtOxt1z3F
   pNRMJN/AYI/lMVMgCih3GI5tiqkLXP4/8JR07uL00mPScwPm8mcGc6JVY
   JnaIWMOF7hHyIywagHqNF2DMvuRQp1FPecfUsNncWsOKmHkWhSxynpyc1
   sBLmTNi+PTs+63BPf39BZZcEjkGgI8mcI9gbwVB4KbmwdjzV8C4dUQUpy
   NNviqZ4ns3HWHr+Ng7bc4v4SaZpvJfgNIAXOpkNjRypKzjj/6VdqCF1Ru
   ikxYqQsHJhffWZSjlCoTuY0h+4/rDZHRBwnsQsNwzbpzh5nUFHaLm5An7
   Q==;
X-CSE-ConnectionGUID: b4O1pPopSfW+q6uwknr5JQ==
X-CSE-MsgGUID: 1s1c0keBSYuaBU/sctNq5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36446807"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="36446807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 07:52:14 -0800
X-CSE-ConnectionGUID: 23u/Xv/eTCemOL/ogk5O2w==
X-CSE-MsgGUID: F2vfipoVSsmBDXbO0I+SIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="128823369"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2024 07:52:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFbNc-0006ZF-1m;
	Mon, 25 Nov 2024 15:52:04 +0000
Date: Mon, 25 Nov 2024 23:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net, zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 11/25] mm: Allow compound zone device pages
Message-ID: <202411252342.LUEKRmrY-lkp@intel.com>
References: <f1a93b8a38e14e2ab279ece310175334e973b970.1732239628.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1a93b8a38e14e2ab279ece310175334e973b970.1732239628.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_075229_246973_2874E6FB 
X-CRM114-Status: GOOD (  11.72  )
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

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on 81983758430957d9a5cb3333fe324fd70cf63e7e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/fuse-Fix-dax-truncate-punch_hole-fault-path/20241125-094004
base:   81983758430957d9a5cb3333fe324fd70cf63e7e
patch link:    https://lore.kernel.org/r/f1a93b8a38e14e2ab279ece310175334e973b970.1732239628.git-series.apopple%40nvidia.com
patch subject: [PATCH v3 11/25] mm: Allow compound zone device pages
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241125/202411252342.LUEKRmrY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411252342.LUEKRmrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252342.LUEKRmrY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:32,
                    from arch/sh/kernel/asm-offsets.c:14:
   include/linux/memremap.h: In function 'is_device_private_page':
>> include/linux/memremap.h:164:17: error: implicit declaration of function 'page_pgmap' [-Wimplicit-function-declaration]
     164 |                 page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
         |                 ^~~~~~~~~~
>> include/linux/memremap.h:164:33: error: invalid type argument of '->' (have 'int')
     164 |                 page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
         |                                 ^~
   include/linux/memremap.h: In function 'is_pci_p2pdma_page':
   include/linux/memremap.h:176:33: error: invalid type argument of '->' (have 'int')
     176 |                 page_pgmap(page)->type == MEMORY_DEVICE_PCI_P2PDMA;
         |                                 ^~
   include/linux/memremap.h: In function 'is_device_coherent_page':
   include/linux/memremap.h:182:33: error: invalid type argument of '->' (have 'int')
     182 |                 page_pgmap(page)->type == MEMORY_DEVICE_COHERENT;
         |                                 ^~
   make[3]: *** [scripts/Makefile.build:102: arch/sh/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/page_pgmap +164 include/linux/memremap.h

   159	
   160	static inline bool is_device_private_page(const struct page *page)
   161	{
   162		return IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
   163			is_zone_device_page(page) &&
 > 164			page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

