Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04E4C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IGaVmrFVZWN3UlJVLdI/zqzc9Noc28TZN/+YW4fva4o=; b=sxjGgN+G/Psu1FiPb5Xowv9032
	C5tmrmuZD35qfiVxLJ3rGaI1vKtolMd3JaTmxyOiG/Pqsbt/fd/IOmWcEcrx+1KnnWGWNOSVJyNyy
	zmVLZwoSvYtzeX41OmVi2i8SJsx+DQ25OvbG6mkOr9K5LMh97FI12RKFRkNq7TTNX80uDM/70K6/q
	NzEJGwnzuUGHY0nN+rLNPe8HAWXg159tju1N9HRgoVf5sNc1UYbEYLu2d3lg5jRjoFQeRKzONCSMQ
	7WXI5IcqcSY/rSKGL7g5HSgvgX9D2RyaSpNhBBlwUme4+eQZu/8Xb+Vvgyx0i65sAmIGUFV2nt8ft
	6MDG54QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N0D-00000008O8A-2rXc;
	Wed, 23 Sep 2026 13:27:13 +0000
Received: from mgamail.intel.com ([192.198.163.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N0A-00000008O7c-2ut3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790170030; x=1821706030;
  h=date:from:to:cc:subject:message-id;
  bh=LfVviQ7P9EN1Fp//mPaiSmnEezPZPrVyYHH0Rw4koUE=;
  b=IYTOAQMw83GI0vBTs+DUZcVH7zHWr+lSTid+T/uBjp8K+mA+kiXwYQWC
   12jYQZBGgRPTh4/iLIIieSISEeSXL8/ff4pirOB9tba5ZNn5OOhJktCfg
   7Ad54t884Yrtw6nI1ROVMLD4P6rB6k/T7PJH/VE7MepFouI2LpRVw5BWP
   dgYsXU+YdCvhcpYNOW97E665FbhDdZAaYB9QGap88vqRlXdG4p2OdgzZO
   rwhtsdy5/6UFrfvG+cZcBa09KXxFO8Parl2cHfDP98C++/pzVtlUMfcOk
   X7tOwxUZ5iT6SkKg7VPoSmOIbqOkxTv2SZU8P2yWh5UtSYW7yNYoNe893
   Q==;
X-CSE-ConnectionGUID: FBgGd5fxQjCScUoyIr67yA==
X-CSE-MsgGUID: NjqsuNegQX+Q3PkXwxkLTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1359568"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1359568"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:27:09 -0700
X-CSE-ConnectionGUID: 0Ujpw0uXTdK3c0QEcqoLPA==
X-CSE-MsgGUID: Zi2dJFkqTbqDCbHaCSyaHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4703907"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 06:27:08 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9N06-00000000H8j-15GF;
	Wed, 23 Sep 2026 13:27:06 +0000
Date: Wed, 23 Sep 2026 21:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ab8500-charger-dt] BUILD SUCCESS
 00f0633c973230b574b2df512ae9b7b2fc4da214
Message-ID: <202609232151.a9Xnf1Mp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_062710_743232_20CD8805 
X-CRM114-Status: UNSURE (   5.21  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ab8500-charger-dt
branch HEAD: 00f0633c973230b574b2df512ae9b7b2fc4da214  ARM: dts: ux500: Use AB8505 charger compatible

elapsed time: 5550m

configs tested: 136
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                   randconfig-1000-20260923    gcc-8.5.0
arc                   randconfig-1001-20260923    gcc-8.5.0
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                        aspeed_g5_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260923    gcc-8.5.0
arm                   randconfig-1001-20260923    clang-24
arm                   randconfig-1002-20260923    gcc-13.4.0
arm                   randconfig-1003-20260923    gcc-15.2.0
arm64                              allnoconfig    gcc-16.1.0
arm64                 randconfig-1000-20260923    clang-24
arm64                 randconfig-1001-20260923    clang-17
arm64                 randconfig-1002-20260923    clang-24
arm64                 randconfig-1003-20260923    clang-18
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                  randconfig-1000-20260923    gcc-11.5.0
csky                  randconfig-1001-20260923    gcc-9.5.0
hexagon                            allnoconfig    clang-24
hexagon               randconfig-1000-20260923    clang-24
hexagon               randconfig-1001-20260923    clang-20
hexagon              randconfig-r2105-20260919    clang-17   cocci
i386                               allnoconfig    gcc-14
i386                  randconfig-1000-20260923    clang-22
i386                  randconfig-1001-20260923    clang-22
i386                  randconfig-1002-20260923    clang-22
i386                  randconfig-1003-20260923    clang-22
i386                  randconfig-1004-20260923    gcc-14
i386                  randconfig-1005-20260923    clang-22
i386                  randconfig-1006-20260923    clang-22
i386                  randconfig-1300-20260923    clang-22   sparse
i386                  randconfig-1301-20260923    clang-22   sparse
i386                  randconfig-1302-20260923    gcc-12     sparse
i386                  randconfig-2100-20260919    clang-22   cocci
i386                  randconfig-2101-20260919    clang-22   cocci
i386                  randconfig-2102-20260919    clang-22   cocci
i386                  randconfig-2103-20260919    clang-22   cocci
i386                 randconfig-r2200-20260919    gcc-14     smatch
loongarch                          allnoconfig    clang-20
loongarch             randconfig-1000-20260923    clang-24
loongarch             randconfig-1001-20260923    clang-24
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze           randconfig-r2106-20260919    gcc-8.5.0  cocci
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip28_defconfig    gcc-16.1.0
mips                        lemote2f_defconfig    gcc-16.1.0
mips                       maltaaprp_defconfig    clang-17
nios2                              allnoconfig    gcc-11.5.0
nios2                 randconfig-1000-20260923    gcc-8.5.0
nios2                 randconfig-1001-20260923    gcc-9.5.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc               randconfig-r2202-20260919    gcc-8.5.0  smatch
parisc               randconfig-r2202-20260923    gcc-12.5.0 smatch
powerpc                            allnoconfig    gcc-16.1.0
powerpc                      tqm8555_defconfig    gcc-16.1.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                     nommu_virt_defconfig    clang-24
riscv                 randconfig-2000-20260919    gcc-13.4.0
riscv                 randconfig-2001-20260919    clang-24
s390                               allnoconfig    clang-24
s390                                 defconfig    clang-18
s390                  randconfig-2000-20260919    gcc-9.5.0
s390                  randconfig-2001-20260919    clang-17
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                    randconfig-2000-20260919    gcc-16.1.0
sh                    randconfig-2001-20260919    gcc-14.3.0
sh                            se7619_defconfig    gcc-16.1.0
sh                         sh7757lcr_defconfig    gcc-16.1.0
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260923    gcc-15.2.0
sparc                 randconfig-1001-20260923    gcc-13.4.0
sparc                 randconfig-2000-20260919    gcc-12.5.0
sparc                 randconfig-2001-20260919    gcc-14.3.0
sparc                randconfig-r2107-20260919    gcc-16.1.0 cocci
sparc                randconfig-r2200-20260923    gcc-8.5.0  smatch
sparc                randconfig-r2201-20260923    gcc-11.5.0 smatch
sparc64               randconfig-1000-20260923    gcc-14.3.0
sparc64               randconfig-1001-20260923    clang-24
sparc64               randconfig-2000-20260919    clang-24
sparc64               randconfig-2001-20260919    gcc-8.5.0
um                                 allnoconfig    clang-17
um                    randconfig-1000-20260923    clang-24
um                    randconfig-1001-20260923    gcc-12
um                    randconfig-2000-20260919    gcc-14
um                    randconfig-2001-20260919    clang-24
x86_64                             allnoconfig    clang-22
x86_64      buildonly-randconfig-1000-20260923    gcc-14
x86_64      buildonly-randconfig-1001-20260923    clang-22
x86_64      buildonly-randconfig-1002-20260923    gcc-14
x86_64      buildonly-randconfig-1003-20260923    gcc-14
x86_64      buildonly-randconfig-1004-20260923    gcc-14
x86_64      buildonly-randconfig-1005-20260923    clang-22
x86_64                                   kexec    clang-22
x86_64                randconfig-1012-20260923    gcc-14
x86_64                randconfig-1013-20260923    gcc-14
x86_64                randconfig-1014-20260923    gcc-14
x86_64                randconfig-1015-20260923    gcc-14
x86_64                randconfig-1016-20260923    gcc-14
x86_64                randconfig-1017-20260923    clang-22
x86_64                randconfig-1300-20260923    clang-22   sparse
x86_64                randconfig-1301-20260923    clang-22   sparse
x86_64                randconfig-1302-20260923    clang-22   sparse
x86_64                randconfig-2100-20260919    gcc-14     cocci
x86_64                randconfig-2101-20260919    clang-22   cocci
x86_64                randconfig-2102-20260919    clang-22   cocci
x86_64                randconfig-2103-20260919    clang-22   cocci
x86_64                randconfig-2200-20260919    clang-22   smatch
x86_64                randconfig-2200-20260923    gcc-14     smatch
x86_64               randconfig-r2104-20260919    gcc-14     cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                            rhel-9.4-ltp    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                randconfig-1001-20260923    gcc-11.5.0
xtensa                randconfig-2000-20260919    gcc-14.3.0
xtensa                randconfig-2001-20260919    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

