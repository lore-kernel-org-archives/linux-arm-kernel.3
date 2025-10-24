Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A766CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jjLUdlCQkVULpMq3i3dMMXe8tQBjBS+tUBp+2DbRAOE=; b=r64tiFG5/GrB0f/vaV5K2AdlH6
	6X9Lt3ec0kK/Y6fd9eDwPdNNZCf7mkOLmPu8GtpE5L00v2iZDMlUUeiveMa1ESlIPOe5Nwj/M7npw
	o+vjVPNjrPHo8eU3O9qNFjfyiFDlygFCARuK49hdtAvKT9atiy+HxGQDTt2MGX2UVeEHND364zuIc
	x6wGrQDM1YpPPjT1m1FRdV6ywOYf0OmgK5r8ClKYsY7HnjuSunYvKJTwMY4D1rGnUz4OazR5iE5g7
	96JhFBtV4EwrVel0XYtQOlzCJ5GF8ic5TkxPOWxrxTLlWyl9R7Fh+iJSik9x67kbAdb52mCAbPa9k
	DPsZ42vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNfV-0000000AOSo-3lmw;
	Fri, 24 Oct 2025 19:41:45 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNfT-0000000AOSD-2pVJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 19:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761334904; x=1792870904;
  h=date:from:to:cc:subject:message-id;
  bh=5kPn+GMPtJbFXHyo2J9FfHD5mBhpXvGPFJmvpOa172c=;
  b=fK0nVF4YEhOs8C5prcD4OO64jD6s/80yOlOQeHHLA/1T1JyzJz+BFUoe
   I1T9sN5OSev/tyfsogiXCpIPHKWqYjFO5gyFAyQYbnLB+fnvJWDEOnLxM
   5GDCMw/Wr5iABnwjh//q3tr8TmpPowWdElUjVYv5u9LMRg9wj4YpTcJ5q
   0FEYBdcJ3X+A+ArlfKhRLo4c8A9j9F3tsAgilxOCe6wI0nCwCLnDfSZqp
   qZCA9qnd8wCRvrkZ1EdUH8sGMJexfgijwRiWMsa1qg0uRg3naw3fSrwcb
   pbJl3JyLw/Qk6GJsi7oo66LJTDy8a6Oy+sPgcfRrjVd3LTm4K2Z9SBtkf
   w==;
X-CSE-ConnectionGUID: vw44vBXeShGTEnmMEt4DBw==
X-CSE-MsgGUID: lV4lM+vSRuG4bf1EcUC5FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63412518"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63412518"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 12:41:42 -0700
X-CSE-ConnectionGUID: IsiZP57fSa+6/lgM2uu+Cg==
X-CSE-MsgGUID: bUdPeygNSgG/9qBhVw8XZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="189634078"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Oct 2025 12:41:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCNfO-000EpF-2b;
	Fri, 24 Oct 2025 19:41:38 +0000
Date: Sat, 25 Oct 2025 03:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-janice-v6.18-rc1] BUILD REGRESSION
 ccd3929e54f44ccae885d803cc472204f661c886
Message-ID: <202510250314.6neWisyi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_124143_790396_754B67E2 
X-CRM114-Status: UNSURE (   4.69  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-janice-v6.18-rc1
branch HEAD: ccd3929e54f44ccae885d803cc472204f661c886  NFC hack

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202510250319.9WqUFHAz-lkp@intel.com

    drivers/input/misc/isa1200.c:423:3: error: field designator 'probe_new' does not refer to any field in type 'struct i2c_driver'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- hexagon-allmodconfig
|   `-- drivers-input-misc-isa1200.c:error:field-designator-probe_new-does-not-refer-to-any-field-in-type-struct-i2c_driver
`-- um-allmodconfig
    `-- drivers-input-misc-isa1200.c:error:field-designator-probe_new-does-not-refer-to-any-field-in-type-struct-i2c_driver

elapsed time: 1232m

configs tested: 219
configs skipped: 4

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20251024    clang-22
arc                   randconfig-001-20251024    gcc-8.5.0
arc                   randconfig-002-20251024    clang-22
arc                   randconfig-002-20251024    gcc-14.3.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                        clps711x_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20251024    clang-20
arm                   randconfig-001-20251024    clang-22
arm                   randconfig-002-20251024    clang-22
arm                   randconfig-002-20251024    gcc-15.1.0
arm                   randconfig-003-20251024    clang-22
arm                   randconfig-004-20251024    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251024    clang-22
arm64                 randconfig-001-20251024    gcc-8.5.0
arm64                 randconfig-002-20251024    clang-16
arm64                 randconfig-002-20251024    clang-22
arm64                 randconfig-003-20251024    clang-22
arm64                 randconfig-003-20251024    gcc-13.4.0
arm64                 randconfig-004-20251024    clang-17
arm64                 randconfig-004-20251024    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    clang-22
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251024    gcc-14.3.0
csky                  randconfig-001-20251024    gcc-8.5.0
csky                  randconfig-002-20251024    gcc-11.5.0
csky                  randconfig-002-20251024    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251024    clang-22
hexagon               randconfig-001-20251024    gcc-8.5.0
hexagon               randconfig-002-20251024    clang-22
hexagon               randconfig-002-20251024    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251024    clang-20
i386        buildonly-randconfig-001-20251024    gcc-14
i386        buildonly-randconfig-002-20251024    gcc-14
i386        buildonly-randconfig-003-20251024    clang-20
i386        buildonly-randconfig-003-20251024    gcc-14
i386        buildonly-randconfig-004-20251024    gcc-14
i386        buildonly-randconfig-005-20251024    gcc-14
i386        buildonly-randconfig-006-20251024    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251024    clang-20
i386                  randconfig-002-20251024    clang-20
i386                  randconfig-003-20251024    clang-20
i386                  randconfig-004-20251024    clang-20
i386                  randconfig-005-20251024    clang-20
i386                  randconfig-006-20251024    clang-20
i386                  randconfig-007-20251024    clang-20
i386                  randconfig-011-20251024    clang-20
i386                  randconfig-012-20251024    clang-20
i386                  randconfig-013-20251024    clang-20
i386                  randconfig-014-20251024    clang-20
i386                  randconfig-015-20251024    clang-20
i386                  randconfig-016-20251024    clang-20
i386                  randconfig-017-20251024    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251024    gcc-15.1.0
loongarch             randconfig-001-20251024    gcc-8.5.0
loongarch             randconfig-002-20251024    gcc-15.1.0
loongarch             randconfig-002-20251024    gcc-8.5.0
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                       m5208evb_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                          rb532_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251024    gcc-11.5.0
nios2                 randconfig-001-20251024    gcc-8.5.0
nios2                 randconfig-002-20251024    gcc-11.5.0
nios2                 randconfig-002-20251024    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251024    gcc-8.5.0
parisc                randconfig-001-20251024    gcc-9.5.0
parisc                randconfig-002-20251024    gcc-13.4.0
parisc                randconfig-002-20251024    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251024    gcc-8.5.0
powerpc               randconfig-002-20251024    clang-17
powerpc               randconfig-002-20251024    gcc-8.5.0
powerpc               randconfig-003-20251024    clang-16
powerpc               randconfig-003-20251024    gcc-8.5.0
powerpc64             randconfig-001-20251024    gcc-12.5.0
powerpc64             randconfig-001-20251024    gcc-8.5.0
powerpc64             randconfig-002-20251024    gcc-14.3.0
powerpc64             randconfig-002-20251024    gcc-8.5.0
powerpc64             randconfig-003-20251024    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251024    clang-22
riscv                 randconfig-002-20251024    clang-22
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251024    gcc-13.4.0
s390                  randconfig-002-20251024    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                            migor_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251024    gcc-12.5.0
sh                    randconfig-002-20251024    gcc-14.3.0
sh                           se7619_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251024    gcc-12.5.0
sparc                 randconfig-002-20251024    gcc-8.5.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251024    clang-20
sparc64               randconfig-002-20251024    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251024    gcc-14
um                    randconfig-002-20251024    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251024    clang-20
x86_64      buildonly-randconfig-001-20251024    gcc-14
x86_64      buildonly-randconfig-002-20251024    clang-20
x86_64      buildonly-randconfig-002-20251024    gcc-14
x86_64      buildonly-randconfig-003-20251024    clang-20
x86_64      buildonly-randconfig-003-20251024    gcc-14
x86_64      buildonly-randconfig-004-20251024    gcc-14
x86_64      buildonly-randconfig-005-20251024    gcc-14
x86_64      buildonly-randconfig-006-20251024    clang-20
x86_64      buildonly-randconfig-006-20251024    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251024    gcc-14
x86_64                randconfig-002-20251024    gcc-14
x86_64                randconfig-003-20251024    gcc-14
x86_64                randconfig-004-20251024    gcc-14
x86_64                randconfig-005-20251024    gcc-14
x86_64                randconfig-006-20251024    gcc-14
x86_64                randconfig-007-20251024    gcc-14
x86_64                randconfig-008-20251024    gcc-14
x86_64                randconfig-071-20251024    clang-20
x86_64                randconfig-072-20251024    clang-20
x86_64                randconfig-073-20251024    clang-20
x86_64                randconfig-074-20251024    clang-20
x86_64                randconfig-075-20251024    clang-20
x86_64                randconfig-076-20251024    clang-20
x86_64                randconfig-077-20251024    clang-20
x86_64                randconfig-078-20251024    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251024    gcc-11.5.0
xtensa                randconfig-002-20251024    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

