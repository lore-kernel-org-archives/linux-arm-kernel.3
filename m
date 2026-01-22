Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5483C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 00:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+C1BQqzTqq+wPoXhtFQ+7GupURWTkRgflteJZN87wUs=; b=vWavkEIie3WIeh1RDQhGUtIB1Y
	muAxXShnUO3JIgDICwRRAfFSK3af5s090qxB0PZrfPJ6Mp9R4GjnSEwJgskFtTmVo8k4hbkNIT3pi
	j3tK4EP+OJyg+pr1A4s1THYHjCNYRzCgO15VYqO8QRnmAgd6i5RSRXXgpLVgBkw2k8c51CvewPCx3
	rpL3X3JoTQgzPtJA1LG9BGnd0a/RbKWt1iGbN3CUwImVopP/PnZ8mUL4id/DWc33vhS15WCxBlZMr
	wrBPNK6TQx4FOaBWBD654e9RMf8oMxOunTwTShl8HyBprxos+WxQo9PVgMEzHs7UGnwNFJP2GJs9z
	U9zfiaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiQ5-00000006Cbj-0oRE;
	Thu, 22 Jan 2026 00:19:29 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiQ2-00000006CbP-0Nes
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 00:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769041166; x=1800577166;
  h=date:from:to:cc:subject:message-id;
  bh=LNkkZiTfVwOcLy3mOMW8m2U+taG6BR0bLgefn5fir3Y=;
  b=e54CQmh0FeTfNbXgaY6eG/41mCET9YD8OJlReIxVFKwy18eQ3tFtz16z
   JRqm+FA3GP8u4ixXaZEdjWmzazeu8Ybxy71luvkwspTm8gtU4ZqF65OCK
   Qm5T7vmCyyIRvSmC3HZmBZ8suwKpmFKxSQ5f8TqM4v4GOH4CeYLH9/uB8
   hd0XlJRsDpZJbZwKOovaU/2FT//itrfKC3N6ArlHgq+0WZYbk0J1IwL8w
   EpCO/cT8JeayHbTqNIuyMVXwptTHhPmKQQU10fjLrQrt5hhqSNqhzGUtK
   UN7vPk6Bo10wUrUoKXhPICVxqa6AO0SiIlWqoRcu+yfrCwVs3pMq/kbXH
   w==;
X-CSE-ConnectionGUID: EQe3odOyQqaZ/DO+iL8Aog==
X-CSE-MsgGUID: +RUPNh3dT6Ws63/kjQoJiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87693138"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="87693138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 16:19:23 -0800
X-CSE-ConnectionGUID: jLgdGdQ1QkWCHhM0FacCYQ==
X-CSE-MsgGUID: vECR4sMHRQ6fMSQTUkC0dg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jan 2026 16:19:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viiPu-00000000SCN-3QU8;
	Thu, 22 Jan 2026 00:19:18 +0000
Date: Thu, 22 Jan 2026 08:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 0638dc292e54ba0cbcb1ff81af3ca52d3bbfaf54
Message-ID: <202601220823.zkHqgmMO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_161926_233616_BFD792D7 
X-CRM114-Status: UNSURE (   5.42  )
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
branch HEAD: 0638dc292e54ba0cbcb1ff81af3ca52d3bbfaf54  Merge tag 'qcom-arm64-fixes-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes

elapsed time: 912m

configs tested: 314
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
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260122    gcc-15.2.0
arc                   randconfig-002-20260122    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         axm55xx_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                   randconfig-001-20260122    gcc-15.2.0
arm                   randconfig-002-20260122    gcc-15.2.0
arm                   randconfig-003-20260122    gcc-15.2.0
arm                   randconfig-004-20260122    gcc-15.2.0
arm                         s3c6400_defconfig    gcc-15.2.0
arm                         socfpga_defconfig    gcc-15.2.0
arm                        spear3xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260121    gcc-15.2.0
arm64                 randconfig-001-20260122    gcc-15.2.0
arm64                 randconfig-002-20260121    clang-22
arm64                 randconfig-002-20260121    gcc-15.2.0
arm64                 randconfig-002-20260122    gcc-15.2.0
arm64                 randconfig-003-20260121    clang-22
arm64                 randconfig-003-20260121    gcc-15.2.0
arm64                 randconfig-003-20260122    gcc-15.2.0
arm64                 randconfig-004-20260121    gcc-12.5.0
arm64                 randconfig-004-20260121    gcc-15.2.0
arm64                 randconfig-004-20260122    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-9.5.0
csky                  randconfig-001-20260122    gcc-15.2.0
csky                  randconfig-002-20260121    gcc-15.2.0
csky                  randconfig-002-20260122    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260121    clang-19
hexagon               randconfig-001-20260121    gcc-15.2.0
hexagon               randconfig-001-20260122    gcc-15.2.0
hexagon               randconfig-002-20260121    clang-22
hexagon               randconfig-002-20260121    gcc-15.2.0
hexagon               randconfig-002-20260122    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260121    clang-20
i386        buildonly-randconfig-001-20260122    clang-20
i386        buildonly-randconfig-002-20260121    clang-20
i386        buildonly-randconfig-002-20260121    gcc-14
i386        buildonly-randconfig-002-20260122    clang-20
i386        buildonly-randconfig-003-20260121    clang-20
i386        buildonly-randconfig-003-20260121    gcc-13
i386        buildonly-randconfig-003-20260122    clang-20
i386        buildonly-randconfig-004-20260121    clang-20
i386        buildonly-randconfig-004-20260122    clang-20
i386        buildonly-randconfig-005-20260121    clang-20
i386        buildonly-randconfig-005-20260122    clang-20
i386        buildonly-randconfig-006-20260121    clang-20
i386        buildonly-randconfig-006-20260122    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260121    clang-20
i386                  randconfig-001-20260121    gcc-14
i386                  randconfig-001-20260122    gcc-14
i386                  randconfig-002-20260121    clang-20
i386                  randconfig-002-20260122    gcc-14
i386                  randconfig-003-20260121    clang-20
i386                  randconfig-003-20260122    gcc-14
i386                  randconfig-004-20260121    clang-20
i386                  randconfig-004-20260122    gcc-14
i386                  randconfig-005-20260121    clang-20
i386                  randconfig-005-20260121    gcc-14
i386                  randconfig-005-20260122    gcc-14
i386                  randconfig-006-20260121    clang-20
i386                  randconfig-006-20260122    gcc-14
i386                  randconfig-007-20260121    clang-20
i386                  randconfig-007-20260122    gcc-14
i386                  randconfig-011-20260121    gcc-14
i386                  randconfig-011-20260122    clang-20
i386                  randconfig-012-20260121    gcc-14
i386                  randconfig-012-20260122    clang-20
i386                  randconfig-013-20260121    gcc-14
i386                  randconfig-013-20260122    clang-20
i386                  randconfig-014-20260121    gcc-14
i386                  randconfig-014-20260122    clang-20
i386                  randconfig-015-20260121    gcc-14
i386                  randconfig-015-20260122    clang-20
i386                  randconfig-016-20260121    gcc-14
i386                  randconfig-016-20260122    clang-20
i386                  randconfig-017-20260121    gcc-14
i386                  randconfig-017-20260122    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260121    gcc-15.2.0
loongarch             randconfig-001-20260122    gcc-15.2.0
loongarch             randconfig-002-20260121    gcc-15.2.0
loongarch             randconfig-002-20260122    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    gcc-15.2.0
m68k                       m5475evb_defconfig    gcc-15.2.0
m68k                            mac_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       bmips_be_defconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                         db1xxx_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260121    gcc-11.5.0
nios2                 randconfig-001-20260121    gcc-15.2.0
nios2                 randconfig-001-20260122    gcc-15.2.0
nios2                 randconfig-002-20260121    gcc-10.5.0
nios2                 randconfig-002-20260121    gcc-15.2.0
nios2                 randconfig-002-20260122    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260121    gcc-9.5.0
parisc                randconfig-001-20260122    gcc-10.5.0
parisc                randconfig-002-20260121    gcc-9.5.0
parisc                randconfig-002-20260122    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                    amigaone_defconfig    clang-22
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                          g5_defconfig    clang-22
powerpc                       holly_defconfig    clang-22
powerpc                      mgcoge_defconfig    clang-22
powerpc                     rainier_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260121    gcc-9.5.0
powerpc               randconfig-001-20260122    gcc-10.5.0
powerpc               randconfig-002-20260121    gcc-9.5.0
powerpc               randconfig-002-20260122    gcc-10.5.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260121    gcc-9.5.0
powerpc64             randconfig-001-20260122    gcc-10.5.0
powerpc64             randconfig-002-20260121    gcc-9.5.0
powerpc64             randconfig-002-20260122    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260121    clang-16
riscv                 randconfig-001-20260122    clang-18
riscv                 randconfig-002-20260121    clang-16
riscv                 randconfig-002-20260122    clang-18
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260121    clang-16
s390                  randconfig-001-20260122    clang-18
s390                  randconfig-002-20260121    clang-16
s390                  randconfig-002-20260122    clang-18
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20260121    clang-16
sh                    randconfig-001-20260122    clang-18
sh                    randconfig-002-20260121    clang-16
sh                    randconfig-002-20260122    clang-18
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7712_defconfig    gcc-15.2.0
sh                           se7721_defconfig    gcc-15.2.0
sh                           se7722_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    gcc-15.2.0
sh                   sh7724_generic_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260121    gcc-8.5.0
sparc                 randconfig-001-20260122    gcc-8.5.0
sparc                 randconfig-002-20260121    gcc-8.5.0
sparc                 randconfig-002-20260122    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260121    gcc-13.4.0
sparc64               randconfig-001-20260121    gcc-8.5.0
sparc64               randconfig-001-20260122    gcc-8.5.0
sparc64               randconfig-002-20260121    gcc-15.2.0
sparc64               randconfig-002-20260121    gcc-8.5.0
sparc64               randconfig-002-20260122    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260121    gcc-14
um                    randconfig-001-20260121    gcc-8.5.0
um                    randconfig-001-20260122    gcc-8.5.0
um                    randconfig-002-20260121    gcc-14
um                    randconfig-002-20260121    gcc-8.5.0
um                    randconfig-002-20260122    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260121    clang-20
x86_64      buildonly-randconfig-001-20260122    clang-20
x86_64      buildonly-randconfig-002-20260121    clang-20
x86_64      buildonly-randconfig-002-20260122    clang-20
x86_64      buildonly-randconfig-003-20260121    clang-20
x86_64      buildonly-randconfig-003-20260122    clang-20
x86_64      buildonly-randconfig-004-20260121    clang-20
x86_64      buildonly-randconfig-004-20260122    clang-20
x86_64      buildonly-randconfig-005-20260121    clang-20
x86_64      buildonly-randconfig-005-20260122    clang-20
x86_64      buildonly-randconfig-006-20260121    clang-20
x86_64      buildonly-randconfig-006-20260122    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260121    clang-20
x86_64                randconfig-001-20260122    clang-20
x86_64                randconfig-002-20260121    clang-20
x86_64                randconfig-002-20260122    clang-20
x86_64                randconfig-003-20260121    clang-20
x86_64                randconfig-003-20260122    clang-20
x86_64                randconfig-004-20260121    clang-20
x86_64                randconfig-004-20260122    clang-20
x86_64                randconfig-005-20260121    clang-20
x86_64                randconfig-005-20260122    clang-20
x86_64                randconfig-006-20260121    clang-20
x86_64                randconfig-006-20260122    clang-20
x86_64                randconfig-011-20260121    gcc-14
x86_64                randconfig-011-20260122    clang-20
x86_64                randconfig-012-20260121    gcc-14
x86_64                randconfig-012-20260122    clang-20
x86_64                randconfig-013-20260121    gcc-14
x86_64                randconfig-013-20260122    clang-20
x86_64                randconfig-014-20260121    gcc-14
x86_64                randconfig-014-20260122    clang-20
x86_64                randconfig-015-20260121    gcc-14
x86_64                randconfig-015-20260122    clang-20
x86_64                randconfig-016-20260121    gcc-14
x86_64                randconfig-016-20260122    clang-20
x86_64                randconfig-071-20260122    clang-20
x86_64                randconfig-072-20260122    clang-20
x86_64                randconfig-073-20260122    clang-20
x86_64                randconfig-074-20260122    clang-20
x86_64                randconfig-075-20260122    clang-20
x86_64                randconfig-076-20260122    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260121    gcc-14.3.0
xtensa                randconfig-001-20260121    gcc-8.5.0
xtensa                randconfig-001-20260122    gcc-8.5.0
xtensa                randconfig-002-20260121    gcc-8.5.0
xtensa                randconfig-002-20260122    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

