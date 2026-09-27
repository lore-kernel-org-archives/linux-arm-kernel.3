Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E48C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NmCJGOM+t90bGb9fVzpEncDgdHv40MPAo+kl3xioGJg=; b=Ow+/OfN/XUwdf9gpDa8WcNtTtC
	xgOP6DXxiNIu3Kd4znn2o7dejZwkft3IA+g59hABOT07SYX3nO4P+gQsz6rdrAR2TlzHjT1JLmUPy
	YfboB7uZUO+PL5g0qmssrR8PH55hYqW3C8kkUl4f56GqnCgrKjXkOaEHWdgQ9DaCDWID4GV8Z9KPi
	CCWKgl4plCGkiyMzxHtLcBjW4HSUY+jIJiR/a5ER8SNJuHhjDn4lVPSFbxczJ7wBwi8TavUFfxVcK
	ujQsdl1ViT8md6gRfYDlofszuYcMRiUhscAHkqzZuFnkzApMFi1IpyFoeLLFwt5wFPP9ZP7qoeDqQ
	bnwO9TlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAikZ-0000000G4j5-2S9Q;
	Sun, 27 Sep 2026 06:52:39 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAikW-0000000G4iW-2mv8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 06:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790491957; x=1822027957;
  h=date:from:to:cc:subject:message-id;
  bh=tublBDhct16Pgvi97Wq+jL3P080oWvsDmw3eeXKM30c=;
  b=Uah++IVhDihFad5lg3TIDBBH3grA1Z3BGXTUWmnqOV/89Vq0yLEPDDVv
   qKw3xxlZuk4YQ6OIwUjXUoben/HNNmykg2jhq70oCpMA6tSiTG5Id4S91
   OKJCFY1c1krwvn/DW/9WvGr1/cL0GqidO60Id0rqfF+4jDS+pqT8WLq2c
   BMCHrT88lMIT6D0X36fCIHEEmG1dsiLzWbKhsVgCi7xSb4yCnEC7Y49Sf
   dMiRwv656k8qA/4jGYKQcxuwIopJbE2XnWvhPz7mMZNMWz+XX4E8jvANO
   7M1NumboFxGe3vY81QkJwB4Aj2w7gV9ZsqTp1B7Qwyq2OtQQ8xlUtDvEA
   A==;
X-CSE-ConnectionGUID: 6Vqnyu8IRrilz0ysoHma/w==
X-CSE-MsgGUID: Hy5x4D63TOa3Y5ZFywMnXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="90261426"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="90261426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 23:52:34 -0700
X-CSE-ConnectionGUID: xMVGYqplQPu+v2hGY1ZaVw==
X-CSE-MsgGUID: zlGi3bQ6Spiui0HACGCuEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274268941"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Sep 2026 23:52:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAikQ-00000000MZU-0A3e;
	Sun, 27 Sep 2026 06:52:30 +0000
Date: Sun, 27 Sep 2026 14:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:dma40-fixes] BUILD SUCCESS
 b0ae056acbb8c7575aa11ca51b7713256946d594
Message-ID: <202609271447.89jnLqIe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_235236_788009_26CC3066 
X-CRM114-Status: UNSURE (   5.41  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/dma40-fixes
branch HEAD: b0ae056acbb8c7575aa11ca51b7713256946d594  dmaengine: ste_dma40: Validate memcpy configuration

elapsed time: 3757m

configs tested: 233
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260927    gcc-15.2.0
arc                   randconfig-1001-20260927    gcc-8.5.0
arc                  randconfig-r2101-20260925    gcc-9.5.0  cocci
arc                  randconfig-r2107-20260925    gcc-16.1.0 cocci
arc                  randconfig-r2202-20260924    gcc-9.5.0  smatch
arm                               alldefconfig    gcc-16.1.0
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                                  defconfig    clang-24
arm                            h3600_defconfig    gcc-16.1.0
arm                             mps2_defconfig    clang-24
arm                   randconfig-1000-20260927    gcc-10.5.0
arm                   randconfig-1001-20260927    gcc-11.5.0
arm                   randconfig-1002-20260927    gcc-13.4.0
arm                   randconfig-1003-20260927    gcc-15.2.0
arm                  randconfig-r2102-20260924    gcc-12.5.0 cocci
arm                  randconfig-r2103-20260924    gcc-8.5.0  cocci
arm                  randconfig-r2105-20260924    gcc-14.3.0 cocci
arm                  randconfig-r2106-20260924    clang-17   cocci
arm                  randconfig-r2200-20260924    gcc-10.5.0 smatch
arm                           sp7021_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260927    clang-17
arm64                 randconfig-1001-20260927    clang-24
arm64                 randconfig-1002-20260927    clang-17
arm64                 randconfig-1003-20260927    clang-17
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260927    gcc-16.1.0
csky                  randconfig-1001-20260927    gcc-16.1.0
csky                 randconfig-r2200-20260925    gcc-10.5.0 smatch
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon               randconfig-1000-20260927    clang-24
hexagon               randconfig-1001-20260927    clang-22
i386                              allmodconfig    gcc-14
i386                               allnoconfig    gcc-14
i386        buildonly-randconfig-1000-20260927    clang-22
i386        buildonly-randconfig-1001-20260927    gcc-14
i386        buildonly-randconfig-1002-20260927    clang-22
i386        buildonly-randconfig-1003-20260927    clang-22
i386        buildonly-randconfig-1004-20260927    clang-22
i386        buildonly-randconfig-1005-20260927    gcc-13
i386                                 defconfig    clang-22
i386                  randconfig-1001-20260927    clang-22
i386                  randconfig-1003-20260927    gcc-14
i386                  randconfig-1004-20260927    gcc-14
i386                  randconfig-1005-20260927    clang-22
i386                  randconfig-1006-20260927    gcc-14
i386                  randconfig-1008-20260927    gcc-13
i386                  randconfig-1011-20260927    gcc-14
i386                  randconfig-2100-20260924    clang-22   cocci
i386                  randconfig-2100-20260925    clang-22   cocci
i386                  randconfig-2101-20260924    gcc-14     cocci
i386                  randconfig-2101-20260925    clang-22   cocci
i386                  randconfig-2102-20260924    clang-22   cocci
i386                  randconfig-2102-20260925    clang-22   cocci
i386                  randconfig-2103-20260924    gcc-14     cocci
i386                  randconfig-2103-20260925    clang-22   cocci
i386                  randconfig-2200-20260924    clang-22   smatch
i386                  randconfig-2200-20260925    gcc-14     smatch
i386                 randconfig-r2107-20260924    gcc-14     cocci
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260927    gcc-16.1.0
loongarch             randconfig-1001-20260927    clang-24
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
m68k                        m5275evb_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260927    gcc-11.5.0
nios2                 randconfig-1001-20260927    gcc-11.5.0
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2201-20260924    gcc-11.5.0 smatch
openrisc                  simple_smp_defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260927    gcc-9.5.0
parisc                randconfig-1001-20260927    gcc-11.5.0
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc               randconfig-1000-20260927    clang-24
powerpc               randconfig-1001-20260927    gcc-16.1.0
powerpc64             randconfig-1000-20260927    clang-24
powerpc64             randconfig-1001-20260927    clang-17
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20260927    gcc-8.5.0
riscv                 randconfig-1001-20260927    gcc-16.1.0
riscv                 randconfig-2000-20260924    clang-24
riscv                 randconfig-2000-20260925    gcc-11.5.0
riscv                 randconfig-2001-20260924    gcc-8.5.0
riscv                 randconfig-2001-20260925    gcc-11.5.0
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20260927    gcc-8.5.0
s390                  randconfig-1001-20260927    clang-24
s390                  randconfig-2000-20260924    gcc-14.3.0
s390                  randconfig-2000-20260925    gcc-11.5.0
s390                  randconfig-2001-20260924    clang-24
s390                  randconfig-2001-20260925    gcc-11.5.0
s390                 randconfig-r2101-20260924    clang-24   cocci
s390                 randconfig-r2103-20260925    gcc-9.5.0  cocci
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-16.1.0
sh                    randconfig-1000-20260927    gcc-16.1.0
sh                    randconfig-1001-20260927    gcc-16.1.0
sh                    randconfig-2000-20260924    gcc-16.1.0
sh                    randconfig-2000-20260925    gcc-11.5.0
sh                    randconfig-2001-20260924    gcc-13.4.0
sh                    randconfig-2001-20260925    gcc-11.5.0
sh                   randconfig-r2100-20260925    gcc-9.5.0  cocci
sh                   randconfig-r2104-20260925    gcc-16.1.0 cocci
sh                           sdk7786_defconfig    gcc-16.1.0
sh                            sh2007_defconfig    gcc-16.1.0
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260927    gcc-11.5.0
sparc                 randconfig-1001-20260927    gcc-16.1.0
sparc                 randconfig-2000-20260924    gcc-11.5.0
sparc                 randconfig-2000-20260925    gcc-16.1.0
sparc                 randconfig-2001-20260924    gcc-13.4.0
sparc                 randconfig-2001-20260925    gcc-16.1.0
sparc                randconfig-r2104-20260924    gcc-15.2.0 cocci
sparc                randconfig-r2105-20260925    gcc-16.1.0 cocci
sparc                randconfig-r2106-20260925    gcc-16.1.0 cocci
sparc                randconfig-r2202-20260925    gcc-15.2.0 smatch
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64               randconfig-1000-20260927    clang-20
sparc64               randconfig-1001-20260927    clang-24
sparc64               randconfig-2000-20260924    clang-20
sparc64               randconfig-2000-20260925    gcc-16.1.0
sparc64               randconfig-2001-20260924    clang-20
sparc64               randconfig-2001-20260925    gcc-16.1.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260927    clang-24
um                    randconfig-1001-20260927    gcc-14
um                    randconfig-2000-20260924    clang-24
um                    randconfig-2000-20260925    gcc-16.1.0
um                    randconfig-2001-20260924    clang-17
um                    randconfig-2001-20260925    gcc-16.1.0
um                            x86_64_defconfig    clang-24
x86_64                             allnoconfig    clang-22
x86_64      buildonly-randconfig-1000-20260927    gcc-14
x86_64      buildonly-randconfig-1001-20260927    clang-22
x86_64      buildonly-randconfig-1002-20260927    clang-22
x86_64      buildonly-randconfig-1004-20260927    gcc-14
x86_64      buildonly-randconfig-1005-20260927    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260927    clang-22
x86_64                randconfig-1001-20260927    clang-22
x86_64                randconfig-1002-20260927    clang-22
x86_64                randconfig-1003-20260927    clang-22
x86_64                randconfig-1004-20260927    clang-22
x86_64                randconfig-1005-20260927    gcc-14
x86_64                randconfig-1006-20260927    clang-22
x86_64                randconfig-1007-20260927    clang-22
x86_64                randconfig-1008-20260927    clang-22
x86_64                randconfig-1009-20260927    clang-22
x86_64                randconfig-1010-20260927    clang-22
x86_64                randconfig-1011-20260927    clang-22
x86_64                randconfig-1012-20260927    gcc-14
x86_64                randconfig-1013-20260927    clang-22
x86_64                randconfig-1014-20260927    clang-22
x86_64                randconfig-1015-20260927    gcc-14
x86_64                randconfig-1016-20260927    clang-22
x86_64                randconfig-1017-20260927    clang-22
x86_64                randconfig-2100-20260924    gcc-14     cocci
x86_64                randconfig-2100-20260925    clang-22   cocci
x86_64                randconfig-2101-20260924    clang-22   cocci
x86_64                randconfig-2101-20260925    clang-22   cocci
x86_64                randconfig-2102-20260924    clang-22   cocci
x86_64                randconfig-2102-20260925    clang-22   cocci
x86_64                randconfig-2103-20260924    clang-22   cocci
x86_64                randconfig-2103-20260925    clang-22   cocci
x86_64                randconfig-2200-20260924    clang-22   smatch
x86_64               randconfig-r2100-20260924    gcc-14     cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                            rhel-9.4-ltp    clang-22
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260927    gcc-13.4.0
xtensa                randconfig-1001-20260927    gcc-8.5.0
xtensa                randconfig-2000-20260924    gcc-13.4.0
xtensa                randconfig-2000-20260925    gcc-16.1.0
xtensa                randconfig-2001-20260924    gcc-11.5.0
xtensa                randconfig-2001-20260925    gcc-16.1.0
xtensa               randconfig-r2102-20260925    gcc-9.5.0  cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

