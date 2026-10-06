Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C54CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TlWClMlWLQmG3oewge0eN6SQZVPE39nYH+wW9qQiqKQ=; b=ITydqMQkLtaT4hZzpWn7Xv+0tZ
	yhS3de2q7cYREWAflxC0qeDhPfqGmt5v2m3YVYzdk2HralbZeFvVpdeWCrPUlSylOEs0U7VRmOP8Z
	bAwoUew0soAIlWHGSOsscnKCP5ETmxWkoYjI3O0hNRTWnesB4TW1TyxCWYaI+fqKfJNDqxa18K74D
	P89n+WO0RJYxLCUuQCxrXHyVFLwp/XtVhr8nUkuI3A0l4sKvHW4nEz8XidVvRRt3jxFglyw4Q1qbz
	0qFYxO7YT7jpVLhdp3xGQHe4w6Q7zE9fS24IHkiwrjCmjRZd9yLDhKgla7ASJxd/OeY7cWBffn3sx
	H1UVUpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvXn-0000000HXo1-49nb;
	Tue, 06 Oct 2026 03:08:43 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvXj-0000000HXnA-1pKN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791256120; x=1822792120;
  h=date:from:to:cc:subject:message-id;
  bh=tg7dICT8u7ozh92mAibZoRCTWcqcAFGfqt9eeYCAllM=;
  b=T/WnMK92K7deyf6XyLgLXbFy4lxZjIqX9K/LloEFVzQqEm/OdNxJSYKO
   TFl7AmpFOpYVBbtrWi13L/l7Lxg7Qbo+snqOEG6dig0e9Ul8rRSBDU2qh
   UMbDKG1pCcaMUYJnL4dVWtmcXZXJSNLR4SLNdW6yXn9YvqojfyNu2a3d0
   XQ4Q+3Hqo1wuhAJWI4VxkKIky35LdDP6WlADV5+qU58cSV8/raq2wNHqi
   Gi5oX/QC0C6BpCcPbHVPLmiZuTK+jQIeq3jUOt3sHUhrCmUJXBc0hXXBm
   5tX14TLe1sRDIma/zTdazLc+B+RQxVaEzzKnAHfvqIvM0RZF+l9EopCCf
   g==;
X-CSE-ConnectionGUID: KDvRf/lGS4SjaDXZ3JK7tA==
X-CSE-MsgGUID: wRuD+2egRCSYiKnoYLFXVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94645966"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="94645966"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 20:08:38 -0700
X-CSE-ConnectionGUID: RDjWv7rrRMOs+p4SCEw09w==
X-CSE-MsgGUID: dIkmh4OASR6+2XzsTB+7+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1038636"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 05 Oct 2026 20:08:36 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDvXd-0000000016Q-389s;
	Tue, 06 Oct 2026 03:08:33 +0000
Date: Tue, 06 Oct 2026 11:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 d168d75530e26c2a9d645c70cc4a155efeaf4904
Message-ID: <202610061135.ZjBYpAlx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_200839_576156_4501481E 
X-CRM114-Status: UNSURE (   5.40  )
X-CRM114-Notice: Please train this message.
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: d168d75530e26c2a9d645c70cc4a155efeaf4904  soc: document merges

elapsed time: 2006m

configs tested: 480
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                          haps_hs_defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    clang-24
arc                   randconfig-1000-20261005    gcc-8.5.0
arc                   randconfig-1000-20261006    clang-24
arc                   randconfig-1001-20261005    gcc-8.5.0
arc                   randconfig-1001-20261006    clang-24
arc                  randconfig-r2102-20261004    gcc-10.5.0 cocci
arc                  randconfig-r2202-20261005    gcc-14.3.0 smatch
arc                  randconfig-r2300-20261005    gcc-11.5.0 sparse
arc                  randconfig-r2301-20261004    clang-24   sparse
arc                  randconfig-r2301-20261004    gcc-10.5.0 sparse
arc                  randconfig-r2306-20261005    gcc-15.2.0 sparse
arc                  randconfig-r2308-20261005    gcc-14.3.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                        imx_v4_v5_defconfig    gcc-16.1.0
arm                        multi_v4t_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    clang-24
arm                              mxs_defconfig    gcc-16.1.0
arm                           pxa3xx_defconfig    clang-24
arm                           pxa3xx_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261005    gcc-8.5.0
arm                   randconfig-1000-20261006    clang-24
arm                   randconfig-1001-20261005    gcc-8.5.0
arm                   randconfig-1001-20261006    clang-24
arm                   randconfig-1002-20261005    gcc-8.5.0
arm                   randconfig-1002-20261006    clang-24
arm                   randconfig-1003-20261005    gcc-8.5.0
arm                   randconfig-1003-20261006    clang-24
arm                  randconfig-r2102-20261005    gcc-13.4.0 cocci
arm                  randconfig-r2103-20261005    clang-24   cocci
arm                  randconfig-r2201-20261005    clang-24   smatch
arm                  randconfig-r2303-20261005    gcc-11.5.0 sparse
arm                  randconfig-r2309-20261004    clang-24   sparse
arm                          s5pv210_defconfig    gcc-16.1.0
arm                         shmobile_defconfig    gcc-16.1.0
arm                         spear6xx_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261005    gcc-16.1.0
arm64                 randconfig-1000-20261006    gcc-16.1.0
arm64                 randconfig-1001-20261005    gcc-16.1.0
arm64                 randconfig-1001-20261006    gcc-16.1.0
arm64                 randconfig-1002-20261005    gcc-16.1.0
arm64                 randconfig-1002-20261006    gcc-16.1.0
arm64                 randconfig-1003-20261005    gcc-16.1.0
arm64                 randconfig-1003-20261006    gcc-16.1.0
arm64                randconfig-r2100-20261004    clang-22   cocci
arm64                randconfig-r2102-20261005    clang-24   cocci
arm64                randconfig-r2103-20261005    gcc-8.5.0  cocci
arm64                randconfig-r2104-20261005    gcc-15.2.0 cocci
arm64                randconfig-r2105-20261004    clang-19   cocci
arm64                randconfig-r2201-20261004    gcc-9.5.0  smatch
arm64                randconfig-r2309-20261005    gcc-15.2.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261005    gcc-16.1.0
csky                  randconfig-1000-20261006    gcc-16.1.0
csky                  randconfig-1001-20261005    gcc-16.1.0
csky                  randconfig-1001-20261006    gcc-16.1.0
csky                 randconfig-r2103-20261004    gcc-14.3.0 cocci
csky                 randconfig-r2107-20261004    gcc-14.3.0 cocci
csky                 randconfig-r2300-20261005    gcc-11.5.0 sparse
csky                 randconfig-r2307-20261004    clang-18   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261005    gcc-16.1.0
hexagon               randconfig-1000-20261006    gcc-13.4.0
hexagon               randconfig-1001-20261005    gcc-16.1.0
hexagon               randconfig-1001-20261006    gcc-13.4.0
hexagon              randconfig-r2107-20261005    gcc-14.3.0 cocci
hexagon              randconfig-r2308-20261005    gcc-15.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261005    clang-22
i386        buildonly-randconfig-1000-20261006    gcc-14
i386        buildonly-randconfig-1001-20261005    clang-22
i386        buildonly-randconfig-1001-20261006    gcc-14
i386        buildonly-randconfig-1002-20261005    clang-22
i386        buildonly-randconfig-1002-20261006    gcc-14
i386        buildonly-randconfig-1003-20261005    clang-22
i386        buildonly-randconfig-1003-20261006    gcc-14
i386        buildonly-randconfig-1004-20261005    clang-22
i386        buildonly-randconfig-1004-20261006    gcc-14
i386        buildonly-randconfig-1005-20261005    clang-22
i386        buildonly-randconfig-1005-20261006    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261005    clang-22
i386                  randconfig-1000-20261006    gcc-14
i386                  randconfig-1001-20261005    clang-22
i386                  randconfig-1001-20261006    gcc-14
i386                  randconfig-1002-20261005    clang-22
i386                  randconfig-1002-20261006    gcc-14
i386                  randconfig-1003-20261005    clang-22
i386                  randconfig-1003-20261006    gcc-14
i386                  randconfig-1004-20261005    clang-22
i386                  randconfig-1004-20261006    gcc-14
i386                  randconfig-1005-20261005    clang-22
i386                  randconfig-1005-20261006    gcc-14
i386                  randconfig-1006-20261005    clang-22
i386                  randconfig-1006-20261006    gcc-14
i386                  randconfig-1007-20261006    gcc-14
i386                  randconfig-1008-20261006    gcc-14
i386                  randconfig-1009-20261006    gcc-14
i386                  randconfig-1010-20261006    gcc-14
i386                  randconfig-1011-20261006    gcc-14
i386                  randconfig-1012-20261006    gcc-14
i386                  randconfig-1013-20261006    gcc-14
i386                  randconfig-2100-20261004    clang-22   cocci
i386                  randconfig-2100-20261005    gcc-14     cocci
i386                  randconfig-2101-20261004    clang-22   cocci
i386                  randconfig-2101-20261004    gcc-14     cocci
i386                  randconfig-2101-20261005    gcc-14     cocci
i386                  randconfig-2102-20261004    clang-22   cocci
i386                  randconfig-2102-20261004    gcc-14     cocci
i386                  randconfig-2102-20261005    gcc-14     cocci
i386                  randconfig-2103-20261004    clang-22   cocci
i386                  randconfig-2103-20261004    gcc-14     cocci
i386                  randconfig-2103-20261005    gcc-14     cocci
i386                  randconfig-2200-20261004    clang-22   smatch
i386                  randconfig-2200-20261005    gcc-14     smatch
i386                  randconfig-2300-20261004    clang-22   sparse
i386                  randconfig-2300-20261005    clang-22   sparse
i386                  randconfig-2301-20261004    clang-22   sparse
i386                  randconfig-2301-20261005    clang-22   sparse
i386                  randconfig-2302-20261004    clang-22   sparse
i386                  randconfig-2302-20261005    clang-22   sparse
i386                 randconfig-r2100-20261005    gcc-13.4.0 cocci
i386                 randconfig-r2103-20261005    gcc-16.1.0 cocci
i386                 randconfig-r2106-20261005    gcc-14.3.0 cocci
i386                 randconfig-r2202-20261005    clang-22   smatch
i386                 randconfig-r2300-20261005    gcc-13.4.0 sparse
i386                 randconfig-r2304-20261005    gcc-11.5.0 sparse
i386                 randconfig-r2305-20261005    gcc-13.4.0 sparse
i386                 randconfig-r2307-20261004    gcc-14.3.0 sparse
i386                 randconfig-r2308-20261004    gcc-14.3.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261005    gcc-16.1.0
loongarch             randconfig-1000-20261006    gcc-13.4.0
loongarch             randconfig-1001-20261005    gcc-16.1.0
loongarch             randconfig-1001-20261006    gcc-13.4.0
loongarch            randconfig-r2105-20261004    gcc-16.1.0 cocci
loongarch            randconfig-r2106-20261005    gcc-16.1.0 cocci
loongarch            randconfig-r2200-20261005    clang-24   smatch
loongarch            randconfig-r2305-20261004    clang-24   sparse
loongarch            randconfig-r2306-20261004    gcc-14.3.0 sparse
loongarch            randconfig-r2309-20261004    clang-18   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                        bvme6000_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                         mvme16x_defconfig    gcc-16.1.0
m68k                          nettel_defconfig    gcc-16.1.0
m68k                 randconfig-r2102-20261004    gcc-16.1.0 cocci
m68k                 randconfig-r2102-20261005    gcc-16.1.0 cocci
m68k                 randconfig-r2104-20261004    gcc-13.4.0 cocci
m68k                 randconfig-r2104-20261005    gcc-14.3.0 cocci
m68k                 randconfig-r2300-20261004    clang-24   sparse
m68k                 randconfig-r2300-20261004    gcc-8.5.0  sparse
m68k                 randconfig-r2301-20261005    gcc-11.5.0 sparse
m68k                 randconfig-r2303-20261004    gcc-9.5.0  sparse
m68k                 randconfig-r2306-20261005    gcc-14.3.0 sparse
microblaze                        alldefconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.1.0
microblaze           randconfig-r2100-20261005    clang-24   cocci
microblaze           randconfig-r2101-20261005    clang-24   cocci
microblaze           randconfig-r2104-20261004    gcc-10.5.0 cocci
microblaze           randconfig-r2104-20261005    gcc-16.1.0 cocci
microblaze           randconfig-r2106-20261004    gcc-9.5.0  cocci
microblaze           randconfig-r2107-20261005    gcc-15.2.0 cocci
microblaze           randconfig-r2200-20261005    gcc-9.5.0  smatch
microblaze           randconfig-r2202-20261004    gcc-8.5.0  smatch
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       bmips_stb_defconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                       loongson1_defconfig    gcc-16.1.0
mips                 randconfig-r2103-20261004    gcc-16.1.0 cocci
mips                 randconfig-r2105-20261005    gcc-16.1.0 cocci
mips                 randconfig-r2200-20261004    gcc-15.2.0 smatch
mips                 randconfig-r2303-20261005    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261005    gcc-16.1.0
nios2                 randconfig-1000-20261006    gcc-13.4.0
nios2                 randconfig-1001-20261005    gcc-16.1.0
nios2                 randconfig-1001-20261006    gcc-13.4.0
nios2                randconfig-r2101-20261004    gcc-8.5.0  cocci
nios2                randconfig-r2106-20261005    gcc-15.2.0 cocci
nios2                randconfig-r2201-20261004    gcc-11.5.0 smatch
nios2                randconfig-r2201-20261005    gcc-11.5.0 smatch
nios2                randconfig-r2302-20261005    gcc-11.5.0 sparse
nios2                randconfig-r2303-20261005    gcc-9.5.0  sparse
nios2                randconfig-r2309-20261004    gcc-14.3.0 sparse
nios2                randconfig-r2309-20261005    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261004    gcc-16.1.0 cocci
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261005    gcc-8.5.0
parisc                randconfig-1000-20261006    gcc-14.3.0
parisc                randconfig-1001-20261005    gcc-8.5.0
parisc                randconfig-1001-20261006    gcc-14.3.0
parisc               randconfig-r2100-20261004    gcc-16.1.0 cocci
parisc               randconfig-r2101-20261005    gcc-16.1.0 cocci
parisc               randconfig-r2102-20261005    gcc-8.5.0  cocci
parisc               randconfig-r2105-20261005    gcc-15.2.0 cocci
parisc               randconfig-r2106-20261004    gcc-16.1.0 cocci
parisc               randconfig-r2300-20261005    gcc-9.5.0  sparse
parisc               randconfig-r2303-20261004    clang-24   sparse
parisc               randconfig-r2307-20261004    gcc-12.5.0 sparse
parisc               randconfig-r2307-20261005    gcc-8.5.0  sparse
parisc               randconfig-r2308-20261004    clang-18   sparse
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc                       ppc44x_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261005    gcc-8.5.0
powerpc               randconfig-1000-20261006    gcc-14.3.0
powerpc               randconfig-1001-20261005    gcc-8.5.0
powerpc               randconfig-1001-20261006    gcc-14.3.0
powerpc              randconfig-r2107-20261005    gcc-16.1.0 cocci
powerpc              randconfig-r2301-20261005    gcc-13.4.0 sparse
powerpc              randconfig-r2302-20261005    gcc-11.5.0 sparse
powerpc              randconfig-r2305-20261004    gcc-8.5.0  sparse
powerpc                      tqm8548_defconfig    gcc-16.1.0
powerpc                         warp_defconfig    gcc-16.1.0
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64                         alldefconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261005    gcc-8.5.0
powerpc64             randconfig-1000-20261006    gcc-14.3.0
powerpc64             randconfig-1001-20261005    gcc-8.5.0
powerpc64             randconfig-1001-20261006    gcc-14.3.0
powerpc64            randconfig-r2200-20261005    gcc-12.5.0 smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_virt_defconfig    clang-24
riscv                 randconfig-1000-20261005    clang-17
riscv                 randconfig-1000-20261006    clang-24
riscv                 randconfig-1001-20261005    clang-17
riscv                 randconfig-1001-20261006    clang-24
riscv                 randconfig-2000-20261004    clang-24
riscv                 randconfig-2000-20261004    gcc-11.5.0
riscv                 randconfig-2000-20261005    gcc-16.1.0
riscv                 randconfig-2001-20261004    clang-24
riscv                 randconfig-2001-20261004    gcc-11.5.0
riscv                 randconfig-2001-20261005    gcc-16.1.0
riscv                randconfig-r2200-20261004    gcc-11.5.0 smatch
riscv                randconfig-r2202-20261004    clang-17   smatch
riscv                randconfig-r2202-20261005    clang-24   smatch
riscv                randconfig-r2304-20261005    gcc-13.4.0 sparse
riscv                randconfig-r2306-20261005    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                           debug_defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261005    clang-17
s390                  randconfig-1000-20261006    clang-24
s390                  randconfig-1001-20261005    clang-17
s390                  randconfig-1001-20261006    clang-24
s390                  randconfig-2000-20261004    clang-24
s390                  randconfig-2000-20261004    gcc-11.5.0
s390                  randconfig-2000-20261005    gcc-16.1.0
s390                  randconfig-2001-20261004    gcc-10.5.0
s390                  randconfig-2001-20261004    gcc-11.5.0
s390                  randconfig-2001-20261005    gcc-16.1.0
s390                 randconfig-r2303-20261005    gcc-13.4.0 sparse
s390                 randconfig-r2306-20261004    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                          ecovec24_defconfig    gcc-16.1.0
sh                         edosk7705_defconfig    gcc-16.1.0
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261005    clang-17
sh                    randconfig-1000-20261006    clang-24
sh                    randconfig-1001-20261005    clang-17
sh                    randconfig-1001-20261006    clang-24
sh                    randconfig-2000-20261004    gcc-11.5.0
sh                    randconfig-2000-20261004    gcc-13.4.0
sh                    randconfig-2000-20261005    gcc-16.1.0
sh                    randconfig-2001-20261004    gcc-11.5.0
sh                    randconfig-2001-20261005    gcc-16.1.0
sh                   randconfig-r2100-20261005    gcc-16.1.0 cocci
sh                   randconfig-r2101-20261004    gcc-16.1.0 cocci
sh                   randconfig-r2105-20261005    gcc-14.3.0 cocci
sh                   randconfig-r2301-20261005    gcc-9.5.0  sparse
sh                   randconfig-r2302-20261004    gcc-16.1.0 sparse
sh                   randconfig-r2302-20261005    gcc-9.5.0  sparse
sh                   randconfig-r2304-20261004    gcc-11.5.0 sparse
sh                   randconfig-r2305-20261005    gcc-11.5.0 sparse
sh                       rts7751r2d1_defconfig    gcc-16.1.0
sh                      sh7710voipgw_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261005    clang-24
sparc                 randconfig-1000-20261006    gcc-14
sparc                 randconfig-1001-20261005    clang-24
sparc                 randconfig-1001-20261006    gcc-14
sparc                 randconfig-2000-20261004    clang-17
sparc                 randconfig-2000-20261004    gcc-8.5.0
sparc                 randconfig-2000-20261005    clang-17
sparc                 randconfig-2001-20261004    clang-17
sparc                 randconfig-2001-20261004    gcc-15.2.0
sparc                 randconfig-2001-20261005    clang-17
sparc                randconfig-r2101-20261005    gcc-8.5.0  cocci
sparc                randconfig-r2301-20261005    gcc-11.5.0 sparse
sparc                randconfig-r2304-20261005    gcc-11.5.0 sparse
sparc                randconfig-r2307-20261005    gcc-15.2.0 sparse
sparc                randconfig-r2308-20261005    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261005    gcc-14.3.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261005    clang-24
sparc64               randconfig-1000-20261006    gcc-14
sparc64               randconfig-1001-20261005    clang-24
sparc64               randconfig-1001-20261006    gcc-14
sparc64               randconfig-2000-20261004    clang-17
sparc64               randconfig-2000-20261004    clang-20
sparc64               randconfig-2000-20261005    clang-17
sparc64               randconfig-2001-20261004    clang-17
sparc64               randconfig-2001-20261004    gcc-10.5.0
sparc64               randconfig-2001-20261005    clang-17
sparc64              randconfig-r2101-20261005    gcc-13.4.0 cocci
sparc64              randconfig-r2107-20261004    gcc-10.5.0 cocci
sparc64              randconfig-r2302-20261005    gcc-13.4.0 sparse
sparc64              randconfig-r2306-20261004    clang-18   sparse
um                                alldefconfig    gcc-16.1.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261005    clang-24
um                    randconfig-1000-20261006    gcc-14
um                    randconfig-1001-20261005    clang-24
um                    randconfig-1001-20261006    gcc-14
um                    randconfig-2000-20261004    clang-17
um                    randconfig-2000-20261004    gcc-14
um                    randconfig-2000-20261005    clang-17
um                    randconfig-2001-20261004    clang-17
um                    randconfig-2001-20261005    clang-17
um                   randconfig-r2105-20261004    gcc-10.5.0 cocci
um                   randconfig-r2304-20261004    clang-24   sparse
um                   randconfig-r2304-20261005    gcc-9.5.0  sparse
um                   randconfig-r2305-20261005    gcc-11.5.0 sparse
um                   randconfig-r2307-20261005    gcc-14.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261005    gcc-13
x86_64      buildonly-randconfig-1000-20261006    gcc-14
x86_64      buildonly-randconfig-1001-20261005    gcc-13
x86_64      buildonly-randconfig-1001-20261006    gcc-14
x86_64      buildonly-randconfig-1002-20261005    gcc-13
x86_64      buildonly-randconfig-1002-20261006    gcc-14
x86_64      buildonly-randconfig-1003-20261005    gcc-13
x86_64      buildonly-randconfig-1003-20261006    gcc-14
x86_64      buildonly-randconfig-1004-20261005    gcc-13
x86_64      buildonly-randconfig-1004-20261006    gcc-14
x86_64      buildonly-randconfig-1005-20261005    gcc-13
x86_64      buildonly-randconfig-1005-20261006    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261005    gcc-14
x86_64                randconfig-1000-20261006    gcc-14
x86_64                randconfig-1001-20261005    gcc-14
x86_64                randconfig-1001-20261006    gcc-14
x86_64                randconfig-1002-20261005    gcc-14
x86_64                randconfig-1002-20261006    gcc-14
x86_64                randconfig-1003-20261005    gcc-14
x86_64                randconfig-1003-20261006    gcc-14
x86_64                randconfig-1004-20261005    gcc-14
x86_64                randconfig-1004-20261006    gcc-14
x86_64                randconfig-1005-20261005    gcc-14
x86_64                randconfig-1005-20261006    gcc-14
x86_64                randconfig-1006-20261005    gcc-14
x86_64                randconfig-1006-20261006    gcc-14
x86_64                randconfig-1007-20261005    gcc-14
x86_64                randconfig-1007-20261006    gcc-14
x86_64                randconfig-1008-20261005    gcc-14
x86_64                randconfig-1008-20261006    gcc-14
x86_64                randconfig-1009-20261005    gcc-14
x86_64                randconfig-1009-20261006    gcc-14
x86_64                randconfig-1010-20261005    gcc-14
x86_64                randconfig-1010-20261006    gcc-14
x86_64                randconfig-1011-20261005    gcc-14
x86_64                randconfig-1011-20261006    gcc-14
x86_64                randconfig-1012-20261005    gcc-14
x86_64                randconfig-1012-20261006    gcc-14
x86_64                randconfig-1013-20261005    gcc-14
x86_64                randconfig-1013-20261006    gcc-14
x86_64                randconfig-1014-20261005    gcc-14
x86_64                randconfig-1014-20261006    gcc-14
x86_64                randconfig-1015-20261005    gcc-14
x86_64                randconfig-1015-20261006    gcc-14
x86_64                randconfig-1016-20261005    gcc-14
x86_64                randconfig-1016-20261006    gcc-14
x86_64                randconfig-1017-20261005    gcc-14
x86_64                randconfig-1017-20261006    gcc-14
x86_64                randconfig-2100-20261004    gcc-14     cocci
x86_64                randconfig-2100-20261005    clang-22   cocci
x86_64                randconfig-2101-20261004    clang-22   cocci
x86_64                randconfig-2101-20261004    gcc-14     cocci
x86_64                randconfig-2101-20261005    clang-22   cocci
x86_64                randconfig-2102-20261004    gcc-14     cocci
x86_64                randconfig-2102-20261005    clang-22   cocci
x86_64                randconfig-2103-20261004    gcc-14     cocci
x86_64                randconfig-2103-20261005    clang-22   cocci
x86_64                randconfig-2200-20261004    gcc-14     smatch
x86_64                randconfig-2200-20261005    clang-22   smatch
x86_64                randconfig-2300-20261004    clang-22   sparse
x86_64                randconfig-2300-20261005    clang-22   sparse
x86_64                randconfig-2301-20261004    clang-22   sparse
x86_64                randconfig-2301-20261005    clang-22   sparse
x86_64                randconfig-2302-20261004    clang-22   sparse
x86_64                randconfig-2302-20261005    clang-22   sparse
x86_64               randconfig-r2305-20261005    gcc-9.5.0  sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261005    clang-24
xtensa                randconfig-1000-20261006    gcc-14
xtensa                randconfig-1001-20261005    clang-24
xtensa                randconfig-1001-20261006    gcc-14
xtensa                randconfig-2000-20261004    clang-17
xtensa                randconfig-2000-20261004    gcc-8.5.0
xtensa                randconfig-2000-20261005    clang-17
xtensa                randconfig-2001-20261004    clang-17
xtensa                randconfig-2001-20261004    gcc-9.5.0
xtensa                randconfig-2001-20261005    clang-17
xtensa               randconfig-r2100-20261005    gcc-8.5.0  cocci
xtensa               randconfig-r2103-20261005    gcc-13.4.0 cocci
xtensa               randconfig-r2106-20261004    gcc-10.5.0 cocci
xtensa               randconfig-r2107-20261004    gcc-16.1.0 cocci
xtensa               randconfig-r2201-20261004    gcc-13.4.0 smatch
xtensa               randconfig-r2202-20261005    gcc-10.5.0 smatch
xtensa               randconfig-r2302-20261004    clang-24   sparse
xtensa               randconfig-r2308-20261004    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

