Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E14C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AfYCWfp7g97xJoNboHuWdS5D3EfKndw6K4xRsgbbf2U=; b=ltAb4kMwN1lGpXLq1Fqc6yI8/O
	sazd24n4rAm5H4EMaqd9N2r0sCpERQk29o+AaS1z7qF/dhTKrYpuPsyslVqn87Tm7dvm32mfYgP1g
	LkP4+2C/INrcRecHpBRTE5M05HWUIax1oa3gfjOxW32mgqF0EKNmbJTrXLWPCY2IfZh6GPCNh6plu
	66BShJMpTboB4ekenwTaTYLlbKUjqd1bop1HX10lNMGbCocWYNFK/2wwxcJarGqOpeAHiukR1+BvC
	xutf+yzv9nX6W/FEMSQfXm8a7SL18YakeQNxO5YBA4nyvrRVzTHdyExPdf0tjfDAVLXGERtTIZtQk
	5luxwPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yrk-00000005Cv9-1OAk;
	Tue, 22 Sep 2026 11:40:52 +0000
Received: from mgamail.intel.com ([192.198.163.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yrf-00000005CrT-46GL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790077248; x=1821613248;
  h=date:from:to:cc:subject:message-id;
  bh=5TQc333qVmMPralxmAyRZIdo1JwEtMEMXbC5oBEkxBM=;
  b=hOSq1NnRVQalTz7hcDlPNz4Ea3/z4yklc8cdeNUwtcNa4MQS1qyEJamy
   x9811O/C/sEaf8YXOC/URN7URYqfDuJb74RlSl9dMOlQRz/MXm85YwJkx
   ZIPg3l1RXXDxpDdh7upgCnHljJtLly+Vc69eqB80p09drJrv2KSB4qscO
   kxZaqhpxVNHHw1V/Ik1npYnEceIzRC3K4RTJbl8MPNLEntrYSdPs9JL0x
   xCiu1n5fK4VVnaWTycWSkNLAPhy98RtvCmLd7WGRxySJ6FMSVNmypQQGb
   0ayE8L2TaXZMaot417fbCaVVMX3bl1pnXojtOnwpSyWrC9gbw3QbCIpj8
   A==;
X-CSE-ConnectionGUID: HKjBntzMS3Oghqc4h6Y6ag==
X-CSE-MsgGUID: Pioc8UCKRduvLMjzJO1e4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1173494"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1173494"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:40:45 -0700
X-CSE-ConnectionGUID: j6ynR+SNS8WzooAsTV92ZA==
X-CSE-MsgGUID: QHhXykWtQ3SqeBk6BhgMxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="299340182"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2026 04:40:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8yrZ-00000000FQw-2PvM;
	Tue, 22 Sep 2026 11:40:41 +0000
Date: Tue, 22 Sep 2026 19:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm:fixes] BUILD SUCCESS
 4dd1999783d7d12434006289338373e49492dc96
Message-ID: <202609221941.NW622A91-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044048_074956_38621400 
X-CRM114-Status: UNSURE (   6.00  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: 4dd1999783d7d12434006289338373e49492dc96  soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node

elapsed time: 4114m

configs tested: 200
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20260918    gcc-13.4.0 cocci
alpha                randconfig-r2104-20260918    gcc-8.5.0  cocci
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                  randconfig-r2100-20260918    gcc-14.3.0 cocci
arc                  randconfig-r2101-20260918    gcc-12.5.0 cocci
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                                  defconfig    clang-24
arm                             dove_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260922    clang-24
arm64                 randconfig-1001-20260922    gcc-11.5.0
arm64                 randconfig-1002-20260922    gcc-9.5.0
arm64                 randconfig-1003-20260922    gcc-11.5.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260922    gcc-16.1.0
csky                  randconfig-1001-20260922    gcc-12.5.0
csky                 randconfig-r1300-20260922    gcc-9.5.0  sparse
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon               randconfig-1000-20260922    clang-17
hexagon               randconfig-1001-20260922    clang-17
hexagon              randconfig-r1301-20260922    clang-17   sparse
i386                              allmodconfig    gcc-14
i386                               allnoconfig    gcc-14
i386        buildonly-randconfig-1000-20260922    clang-22
i386        buildonly-randconfig-1001-20260922    clang-22
i386        buildonly-randconfig-1002-20260922    gcc-14
i386        buildonly-randconfig-1003-20260922    gcc-14
i386        buildonly-randconfig-1004-20260922    gcc-14
i386        buildonly-randconfig-1005-20260922    gcc-12
i386                                 defconfig    clang-22
i386                  randconfig-1000-20260922    clang-22
i386                  randconfig-1001-20260922    clang-22
i386                  randconfig-1002-20260922    clang-22
i386                  randconfig-1003-20260922    gcc-14
i386                  randconfig-1004-20260922    gcc-14
i386                  randconfig-1005-20260922    gcc-14
i386                  randconfig-1006-20260922    gcc-14
i386                  randconfig-1007-20260922    clang-22
i386                  randconfig-1008-20260922    gcc-14
i386                  randconfig-1009-20260922    gcc-14
i386                  randconfig-1010-20260922    clang-22
i386                  randconfig-1011-20260922    gcc-14
i386                  randconfig-1012-20260922    gcc-13
i386                  randconfig-1013-20260922    gcc-14
i386                  randconfig-2100-20260918    clang-22   cocci
i386                  randconfig-2101-20260918    gcc-14     cocci
i386                  randconfig-2102-20260918    clang-22   cocci
i386                  randconfig-2103-20260918    clang-22   cocci
i386                  randconfig-2200-20260919    clang-22   smatch
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260922    gcc-16.1.0
loongarch             randconfig-1001-20260922    clang-18
loongarch            randconfig-r1303-20260922    gcc-16.1.0 sparse
loongarch            randconfig-r2200-20260918    gcc-13.4.0 smatch
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
m68k                           hp300_defconfig    gcc-16.1.0
m68k                        m5235evb_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                 randconfig-r1309-20260922    clang-17   sparse
mips                            rs90_defconfig    gcc-16.1.0
nios2                          3c120_defconfig    gcc-11.5.0
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260922    gcc-10.5.0
nios2                 randconfig-1001-20260922    gcc-11.5.0
nios2                randconfig-r1305-20260922    gcc-11.5.0 sparse
nios2                randconfig-r2105-20260918    gcc-10.5.0 cocci
nios2                randconfig-r2106-20260918    gcc-11.5.0 cocci
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2201-20260918    gcc-16.1.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260922    gcc-12.5.0
parisc                randconfig-1001-20260922    gcc-10.5.0
parisc               randconfig-r1307-20260922    gcc-15.2.0 sparse
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc                         icon_defconfig    gcc-16.1.0
powerpc                       katmai_defconfig    clang-24
powerpc               randconfig-1000-20260922    gcc-11.5.0
powerpc               randconfig-1001-20260922    gcc-8.5.0
powerpc64             randconfig-1000-20260922    gcc-8.5.0
powerpc64             randconfig-1001-20260922    gcc-11.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20260922    gcc-8.5.0
riscv                 randconfig-1001-20260922    gcc-13.4.0
riscv                 randconfig-2000-20260918    gcc-12.5.0
riscv                 randconfig-2001-20260918    clang-24
riscv                randconfig-r2107-20260918    gcc-12.5.0 cocci
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20260922    clang-19
s390                  randconfig-1001-20260922    clang-21
s390                  randconfig-2000-20260918    gcc-8.5.0
s390                  randconfig-2001-20260918    clang-17
s390                 randconfig-r1304-20260922    clang-24   sparse
s390                 randconfig-r1308-20260922    clang-20   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-16.1.0
sh                    randconfig-1000-20260922    gcc-10.5.0
sh                    randconfig-1001-20260922    gcc-16.1.0
sh                    randconfig-2000-20260918    gcc-13.4.0
sh                    randconfig-2001-20260918    gcc-11.5.0
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260922    gcc-14.3.0
sparc                 randconfig-1001-20260922    gcc-8.5.0
sparc                 randconfig-2000-20260918    gcc-8.5.0
sparc                 randconfig-2001-20260918    gcc-11.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64               randconfig-1000-20260922    gcc-15.2.0
sparc64               randconfig-1001-20260922    clang-20
sparc64               randconfig-2000-20260918    gcc-8.5.0
sparc64               randconfig-2001-20260918    clang-20
sparc64              randconfig-r1306-20260922    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260922    gcc-14
um                    randconfig-1001-20260922    clang-17
um                    randconfig-2000-20260918    gcc-14
um                    randconfig-2001-20260918    gcc-14
um                            x86_64_defconfig    clang-24
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22
x86_64      buildonly-randconfig-1000-20260922    gcc-14
x86_64      buildonly-randconfig-1001-20260922    gcc-14
x86_64      buildonly-randconfig-1002-20260922    gcc-14
x86_64      buildonly-randconfig-1003-20260922    clang-22
x86_64      buildonly-randconfig-1004-20260922    clang-22
x86_64      buildonly-randconfig-1005-20260922    gcc-14
x86_64                               defconfig    gcc-14
x86_64                randconfig-1000-20260921    gcc-13
x86_64                randconfig-1001-20260921    clang-22
x86_64                randconfig-1002-20260921    gcc-14
x86_64                randconfig-1003-20260921    gcc-14
x86_64                randconfig-1004-20260921    clang-22
x86_64                randconfig-1005-20260921    clang-22
x86_64                randconfig-1006-20260922    clang-22
x86_64                randconfig-1007-20260922    gcc-14
x86_64                randconfig-1008-20260922    clang-22
x86_64                randconfig-1009-20260922    clang-22
x86_64                randconfig-1010-20260922    gcc-14
x86_64                randconfig-1011-20260922    clang-22
x86_64                randconfig-1012-20260922    clang-22
x86_64                randconfig-1013-20260922    gcc-14
x86_64                randconfig-1014-20260922    clang-22
x86_64                randconfig-1015-20260922    clang-22
x86_64                randconfig-1016-20260922    gcc-14
x86_64                randconfig-1017-20260922    clang-22
x86_64                randconfig-2100-20260918    clang-22   cocci
x86_64                randconfig-2101-20260918    clang-22   cocci
x86_64                randconfig-2102-20260918    gcc-14     cocci
x86_64                randconfig-2103-20260918    clang-22   cocci
x86_64                randconfig-2200-20260918    gcc-14     smatch
x86_64               randconfig-r2103-20260918    gcc-14     cocci
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260922    gcc-12.5.0
xtensa                randconfig-1001-20260922    gcc-10.5.0
xtensa                randconfig-2000-20260918    gcc-8.5.0
xtensa                randconfig-2001-20260918    gcc-13.4.0
xtensa               randconfig-r1302-20260922    gcc-15.2.0 sparse
xtensa               randconfig-r2202-20260918    gcc-8.5.0  smatch

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

