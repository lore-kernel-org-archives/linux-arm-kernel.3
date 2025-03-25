Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BD8C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7arWMy5jZj4Bv3P8AKxTdmjhJKWgvmfnuN9tMkr0MhE=; b=aLpFbXWnqUg9AeWwAKpoQqY1yQ
	klQbFs/xaJM+A1H6Aq9r82/8ABeNltyKYIC6Qsp5eoGn8bAFXSIytY+rVZ10JCb8YE/jKG+lsUcZv
	ah8RbgJHoUUk6tu/4xCfrlG+Qn//gELMeTQBRotp6Hfx1CEmkE1HJbfdxn4iyW1f3t3HnDZlXE5i8
	QE6TrDDbQOv+QIBwBrDidfTcDcEJVqn77L3qrtD+j4kITr8aJwbUfZkVIhY3XRY8f5ZMx28xWd8HI
	weQlnVZLvxWzRiknTi5zusUqZRnCIImDJZGZVhZ00/m64/RBtzjLtVzKrj5XAVKfPr/3xe9VTgux4
	rVA6HcQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCgl-00000007AGI-37xQ;
	Tue, 25 Mar 2025 22:24:03 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCeK-000000079so-0Oz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 22:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742941292; x=1774477292;
  h=date:from:to:cc:subject:message-id;
  bh=fQfnjQVbTCCcx+cP0DiVEOig/IscwjJqaAAVhsLqKFw=;
  b=K/IwWCrk38H/5LaY/bbhSItWmJWiHQrgnRKim6ZG3pFI/hmqK/57nmEl
   Mw6HT4kn2i2yHKmNOlW+M0wSw4GQ6RAq4G1PKnuZ9JB7d+DwYESadf9n6
   vS24GCaK/+Wy2qD9qYnzPw2eVk3tgrlVsu509FdH80JIeE1X24mQklsQJ
   Sx8/sOjZa2YHSlKqWTFjgLnmtbl/p5ZyLGIsXP2WBCIuWJO+dJE81gt/O
   hPEVfD+PlTa35cyRHGOjILPEKA+BctkfPGxdq/KxNYiVkjZtTx7mMlido
   kO/nZ9VbiSZEMnUn8G/mXlaDuD3HpIAAVTELm5R5rQZ8b0ZwSyT+h1/P+
   Q==;
X-CSE-ConnectionGUID: oAGV5XPnTyyz9nZakpS6OQ==
X-CSE-MsgGUID: A60VLMNWQqG56aLen8U5yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54414161"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="54414161"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 15:21:32 -0700
X-CSE-ConnectionGUID: hFZ9nAukSIOcFIOIGQh+tw==
X-CSE-MsgGUID: t8ae+cgrQeCARE0KNYppyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="129184096"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2025 15:21:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txCeG-0005Ej-0T;
	Tue, 25 Mar 2025 22:21:28 +0000
Date: Wed, 26 Mar 2025 06:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD REGRESSION
 6ba14668e6f415a9da15588c5e5957784e0798f0
Message-ID: <202503260645.k5l0HPUk-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_152132_179974_8382B059 
X-CRM114-Status: UNSURE (   4.59  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: 6ba14668e6f415a9da15588c5e5957784e0798f0  Merge tag 'omap-for-v6.14/drivers-signed' of https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/drivers

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- (.text):undefined-reference-to-__ffsdi2
|   `-- alpha-linux-ld:(.text):undefined-reference-to-__ffsdi2
|-- arm-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- i386-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- i386-allyesconfig
|   `-- turris-omnia-mcu-gpio.c:(.text):undefined-reference-to-__ffsdi2
|-- m68k-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- m68k-allyesconfig
|   `-- turris-omnia-mcu-gpio.c:(.text):undefined-reference-to-__ffsdi2
|-- microblaze-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- microblaze-allyesconfig
|   `-- (.text):undefined-reference-to-__ffsdi2
|-- parisc-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- sh-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- sh-allyesconfig
|   `-- (.text):undefined-reference-to-__ffsdi2
`-- sparc-allmodconfig
    `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined

elapsed time: 1448m

configs tested: 131
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                   randconfig-001-20250325    gcc-14.2.0
arc                   randconfig-002-20250325    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    clang-19
arm                             mxs_defconfig    clang-15
arm                   randconfig-001-20250325    gcc-5.5.0
arm                   randconfig-002-20250325    gcc-5.5.0
arm                   randconfig-003-20250325    gcc-5.5.0
arm                   randconfig-004-20250325    clang-21
arm                       versatile_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250325    gcc-9.5.0
arm64                 randconfig-002-20250325    clang-18
arm64                 randconfig-003-20250325    gcc-7.5.0
arm64                 randconfig-004-20250325    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250325    gcc-13.3.0
csky                  randconfig-002-20250325    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250325    clang-16
hexagon               randconfig-002-20250325    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250325    gcc-12
i386        buildonly-randconfig-002-20250325    clang-20
i386        buildonly-randconfig-003-20250325    gcc-12
i386        buildonly-randconfig-004-20250325    clang-20
i386        buildonly-randconfig-005-20250325    gcc-12
i386        buildonly-randconfig-006-20250325    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250325    gcc-14.2.0
loongarch             randconfig-002-20250325    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-14
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250325    gcc-7.5.0
nios2                 randconfig-002-20250325    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250325    gcc-12.4.0
parisc                randconfig-002-20250325    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250325    clang-21
powerpc               randconfig-002-20250325    clang-21
powerpc               randconfig-003-20250325    gcc-9.3.0
powerpc64             randconfig-001-20250325    clang-15
powerpc64             randconfig-002-20250325    clang-21
powerpc64             randconfig-003-20250325    gcc-9.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250325    gcc-9.3.0
riscv                 randconfig-002-20250325    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250325    clang-18
s390                  randconfig-002-20250325    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250325    gcc-5.5.0
sh                    randconfig-002-20250325    gcc-11.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250325    gcc-8.5.0
sparc                 randconfig-002-20250325    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250325    gcc-8.5.0
sparc64               randconfig-002-20250325    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250325    clang-21
um                    randconfig-002-20250325    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250325    gcc-12
x86_64      buildonly-randconfig-002-20250325    clang-20
x86_64      buildonly-randconfig-003-20250325    gcc-12
x86_64      buildonly-randconfig-004-20250325    gcc-12
x86_64      buildonly-randconfig-005-20250325    clang-20
x86_64      buildonly-randconfig-006-20250325    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250325    gcc-8.5.0
xtensa                randconfig-002-20250325    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

