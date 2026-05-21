Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80209CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 03:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jhzNTIAEZgfItiMOiNmmTr8+h11kxw6OKK63g94Vplg=; b=PT9QiJRktBFptGpVIE4je6dTVR
	D66gtkK9zOdX5C2dhWDyW+IiGDZnIlYeKfonVA13j9mZVULWE6rKzmM+4+SlKApcgpQz5fTINDZzT
	lNu4BvbLJzBNsCUYiNtGfAycPjorHY2TJDA7MdvMsZLBK8X4HwzUMPBSvXbOhARHGvPbQaWiw1jsq
	hiSIqgwiZBlpPk0uEOfVa/iEnsfEiOTIxY6ejDCMbSGvlCgRvKA2zmO6YAkn5AR/mOk61uicx4gAa
	XfpheeDFlXvavFZCRK6nLcEubRGPNbcjzRGXxIdXxNspvFxArLuSOLWLKBDvdXrk/38j69PppvVjB
	HVDvyg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPuDB-00000006ZLx-1TPQ;
	Thu, 21 May 2026 03:36:41 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPuD9-00000006ZLT-2VuR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 03:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779334600; x=1810870600;
  h=date:from:to:cc:subject:message-id;
  bh=hb9mpTNaVRNvUqMSYHFxkxL108sRGXQ/pAyqA0UFJGM=;
  b=UUGQJ6Q+87hAoufQUmr4MJ98QnN+lD00r7r9yGUkPkIjjiq9UBPLfHwp
   B5lXMV+2jwKFqlOI7a+cy7lDY/KbMN9wMQxkIjX310ShiQtLtH+fpBRxl
   KzGsMar+tGnM48EqQUt4y18EmeWqvAvJgrVml7tmvqG8l/CQJT8oNow5A
   huKl9WpLHUPe8sh3rvNBE4/0gIgRhn5nEzdK+U0jUdCMz+f315KC4GPo+
   VFU5KK890eHC+OVxgzAxdmA4brpHmgazADylmaKRSTgqEXXLlV3xbFQXe
   mGouNIx63sULkMk6rCAOCDxnrEsHZv3lokHMRr/Ve0j+2yTJrv+wUof/2
   Q==;
X-CSE-ConnectionGUID: 8dgJp6VyQAiMqkI2m1Su4w==
X-CSE-MsgGUID: AP4SdPTxThCY0Ir5yr+lBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105709241"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="105709241"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 20:36:39 -0700
X-CSE-ConnectionGUID: yVl/XVBlRCuXwPj6B/9pfA==
X-CSE-MsgGUID: undymAuyQrW1+ZoeLXXWww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="278523444"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 May 2026 20:36:38 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPuC6-000000004It-2sUJ;
	Thu, 21 May 2026 03:35:47 +0000
Date: Thu, 21 May 2026 11:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 b1700f8d6c8031948e2b898d2c839dfabe0ba68e
Message-ID: <202605211144.M8FLYl7B-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_203639_686471_11CFB000 
X-CRM114-Status: UNSURE (   5.25  )
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
branch HEAD: b1700f8d6c8031948e2b898d2c839dfabe0ba68e  Merge tag 'renesas-drivers-for-v7.2-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers

elapsed time: 759m

configs tested: 227
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260521    gcc-8.5.0
arc                   randconfig-002-20260521    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260521    gcc-8.5.0
arm                   randconfig-002-20260521    gcc-8.5.0
arm                   randconfig-003-20260521    gcc-8.5.0
arm                   randconfig-004-20260521    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260521    gcc-8.5.0
arm64                 randconfig-002-20260521    gcc-8.5.0
arm64                 randconfig-003-20260521    gcc-8.5.0
arm64                 randconfig-004-20260521    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260521    gcc-8.5.0
csky                  randconfig-002-20260521    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260521    gcc-11.5.0
hexagon               randconfig-002-20260521    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260521    clang-20
i386        buildonly-randconfig-002-20260521    clang-20
i386        buildonly-randconfig-003-20260521    clang-20
i386        buildonly-randconfig-004-20260521    clang-20
i386        buildonly-randconfig-005-20260521    clang-20
i386        buildonly-randconfig-006-20260521    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260521    clang-20
i386                  randconfig-002-20260521    clang-20
i386                  randconfig-002-20260521    gcc-14
i386                  randconfig-003-20260521    clang-20
i386                  randconfig-004-20260521    clang-20
i386                  randconfig-004-20260521    gcc-14
i386                  randconfig-005-20260521    clang-20
i386                  randconfig-006-20260521    clang-20
i386                  randconfig-007-20260521    clang-20
i386                  randconfig-011-20260521    gcc-14
i386                  randconfig-012-20260521    gcc-14
i386                  randconfig-013-20260521    gcc-14
i386                  randconfig-014-20260521    gcc-14
i386                  randconfig-015-20260521    gcc-14
i386                  randconfig-016-20260521    gcc-14
i386                  randconfig-017-20260521    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260521    gcc-11.5.0
loongarch             randconfig-002-20260521    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                         rt305x_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260521    gcc-11.5.0
nios2                 randconfig-002-20260521    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260521    gcc-12.5.0
parisc                randconfig-002-20260521    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      mgcoge_defconfig    clang-23
powerpc               randconfig-001-20260521    gcc-12.5.0
powerpc               randconfig-002-20260521    gcc-12.5.0
powerpc                     stx_gp3_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260521    gcc-12.5.0
powerpc64             randconfig-002-20260521    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-15.2.0
riscv                 randconfig-001-20260521    gcc-15.2.0
riscv                          randconfig-002    gcc-15.2.0
riscv                 randconfig-002-20260521    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260521    gcc-15.2.0
s390                           randconfig-002    gcc-15.2.0
s390                  randconfig-002-20260521    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260521    gcc-15.2.0
sh                             randconfig-002    gcc-15.2.0
sh                    randconfig-002-20260521    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260520    gcc-12.5.0
sparc                 randconfig-001-20260521    gcc-8.5.0
sparc                 randconfig-002-20260520    gcc-14.3.0
sparc                 randconfig-002-20260521    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260520    gcc-13.4.0
sparc64               randconfig-001-20260521    gcc-8.5.0
sparc64               randconfig-002-20260520    gcc-13.4.0
sparc64               randconfig-002-20260521    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260520    clang-23
um                    randconfig-001-20260521    gcc-8.5.0
um                    randconfig-002-20260520    gcc-14
um                    randconfig-002-20260521    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260520    clang-20
x86_64      buildonly-randconfig-001-20260521    clang-20
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260520    clang-20
x86_64      buildonly-randconfig-002-20260521    clang-20
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260520    gcc-14
x86_64      buildonly-randconfig-003-20260521    clang-20
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260520    gcc-14
x86_64      buildonly-randconfig-004-20260521    clang-20
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260520    gcc-14
x86_64      buildonly-randconfig-005-20260521    clang-20
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260520    gcc-14
x86_64      buildonly-randconfig-006-20260521    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260521    clang-20
x86_64                randconfig-002-20260521    clang-20
x86_64                randconfig-003-20260521    clang-20
x86_64                randconfig-004-20260521    clang-20
x86_64                randconfig-005-20260521    clang-20
x86_64                randconfig-006-20260521    clang-20
x86_64                randconfig-011-20260521    gcc-14
x86_64                randconfig-012-20260521    gcc-14
x86_64                randconfig-013-20260521    gcc-14
x86_64                randconfig-014-20260521    gcc-14
x86_64                randconfig-015-20260521    gcc-14
x86_64                randconfig-016-20260521    gcc-14
x86_64                randconfig-071-20260521    clang-20
x86_64                randconfig-072-20260521    clang-20
x86_64                randconfig-073-20260521    clang-20
x86_64                randconfig-074-20260521    clang-20
x86_64                randconfig-075-20260521    clang-20
x86_64                randconfig-076-20260521    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260520    gcc-8.5.0
xtensa                randconfig-001-20260521    gcc-8.5.0
xtensa                randconfig-002-20260520    gcc-11.5.0
xtensa                randconfig-002-20260521    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

