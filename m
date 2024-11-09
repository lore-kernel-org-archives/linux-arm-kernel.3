Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D4AD64099
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO3Ry/O9c2i5W1lrkfo4XBJ2hnHkFH+fUAGPIgY1JOM=; b=EU94xCQGlYp9Z3dLrv/Ethw4/1
	CEqe3rhi4dBB/ft55KTIjCNOu7TudJvpPpZcxGFHmoOnEQQceyc9NsATCYuUwGwQ8Kr9Iq8oujefL
	ZNuWYxMb9PmfS645VRyQlVByxaRpmccx3lTBLrODVEl1rRp/CGKwnxAhnrGOO8NR+9ff+9cxVnTZD
	A5hXGkD2TlOZ3OfFsa5sHrfMfJhVt442vSlwc8jUV/yWLEESunafaVDhW6QKTqjKudqOtAavfemqP
	fQwkajfY6BCK4HQzDfcu/ZVsdF1OkYnWqgwJxZAP2a8ktrqcXmJ2ZvPV3MuhBs1A/LyhqpRJ+BLQ2
	vStVAuvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZV4-0000000CMjz-1AJ4;
	Sat, 09 Nov 2024 00:38:50 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZSo-0000000CMPY-109Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 00:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731112590; x=1762648590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/v4nOKMZqjRDKHeSccKn/6TRtfkIXuzKK2o/IGgxuG0=;
  b=mCfxFIXX65FV1yF/ManTwvqbIAVGvXqvYT2EfXH0iSeAKCAQPdKcP0UF
   5007lV9Zp67fqLm2VsGopLGx/ThZd9ldV3EdTW6wdPDhSYZFvOAqUL+8N
   B/bbLghr6JNpEcXX5bkkeJMcbPW4klvylQLVyPJMEL/3agmz6ntjjvbI4
   48lK+RCPKDJRRVtdnmPEeCpWct/Ofjyv5IChW7JFcv1nS3EzvFAY1Clzx
   sn2o52klWmlNb2D+Gdv20wG8+p469F9L891QOSO3c34UWdvDhZLrg6Vnb
   UkcNHHdDVw9JcdU7wKFNG+Qdelq0FeY3oyZvMfL+g6Bm0fnFU541s0CR6
   A==;
X-CSE-ConnectionGUID: qDjf+CyyTei54a4epIpnYA==
X-CSE-MsgGUID: wOjtpAODTl6HE1NBugPjNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34697192"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34697192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 16:36:29 -0800
X-CSE-ConnectionGUID: GzuMQ6EmShiR9JfRGqiapQ==
X-CSE-MsgGUID: O5rcz93TTtGnX69xmuZJlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="85866781"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Nov 2024 16:36:24 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9ZSg-000rvI-0L;
	Sat, 09 Nov 2024 00:36:22 +0000
Date: Sat, 9 Nov 2024 08:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Message-ID: <202411090817.15n7hhOv-lkp@intel.com>
References: <20241108054006.2550856-2-fj5100bi@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108054006.2550856-2-fj5100bi@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_163631_119141_42172B87 
X-CRM114-Status: GOOD (  15.46  )
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

Hi Yoshihiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/smp/core]
[also build test WARNING on linus/master v6.12-rc6]
[cannot apply to arm64/for-next/core arm-perf/for-next/perf next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Furudera/perf-Fujitsu-Add-the-Uncore-MAC-PMU-driver/20241108-134245
base:   tip/smp/core
patch link:    https://lore.kernel.org/r/20241108054006.2550856-2-fj5100bi%40fujitsu.com
patch subject: [PATCH 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241109/202411090817.15n7hhOv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090817.15n7hhOv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090817.15n7hhOv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/fujitsu_mac_pmu.c:12:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/perf/fujitsu_mac_pmu.c:15:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/perf/fujitsu_mac_pmu.c:15:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/perf/fujitsu_mac_pmu.c:15:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/perf/fujitsu_mac_pmu.c:604:36: warning: unused variable 'fujitsu_mac_pmu_acpi_match' [-Wunused-const-variable]
     604 | static const struct acpi_device_id fujitsu_mac_pmu_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   17 warnings generated.


vim +/fujitsu_mac_pmu_acpi_match +604 drivers/perf/fujitsu_mac_pmu.c

   603	
 > 604	static const struct acpi_device_id fujitsu_mac_pmu_acpi_match[] = {
   605		{ "FUJI200C", },
   606		{ }
   607	};
   608	MODULE_DEVICE_TABLE(acpi, fujitsu_mac_pmu_acpi_match);
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

