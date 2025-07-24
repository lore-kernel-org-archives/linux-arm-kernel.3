Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F83FC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GqN6yilQgJpKBQUejpm5KwY8ojufOUNl6Jv5stkj+tQ=; b=TvTi8pFNYqoOH9YvGI/u+o74ul
	k9QRpBoEshtduFlDGzFwBdI1Osbaaov59zo0NnR2ff2HwW0vQi28vfcJSmyNFwhAhqOD9ffKyXlgg
	H4dOIRGqg0ZJuNmd+yaKG4IA5Sc2Xq+cuSndpofMRDx0CxxWz8cKu8t6zBS4Pfpu+ItfaKKiYmODq
	rBFoYw0BS4V1eqciLz1C5S2Wq5w4VPflqfYHvypVBGVdqiCq8oExyExGGy7+c5Yl2zNfk2FL2sXZ7
	ti7uKQeZEG50k26DQtWBdTNqfaqwfFOAeUBB9GzgnTwfuI9Cry1xC6Aqs+uDTVLgt++LeEGhoerHS
	QD+59Jeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3pV-00000008Wzn-03p8;
	Thu, 24 Jul 2025 21:50:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3im-00000008WWB-3sEm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Jul 2025 21:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GqN6yilQgJpKBQUejpm5KwY8ojufOUNl6Jv5stkj+tQ=; b=EfVSfgScquOXGvMLfrOb2Uo1lB
	+07rYny2YduvOShc/uDx1qWKK85aLIJJ576LAPy5spx2fTKoSyyMAQ8vx+6rFqGaUWLcBSGCdbeWC
	dJJHxHe0ypK2dqNq/NHFsdu/tMXDpiPbSSqdi3likVmtxwxFB2K44YGEKS9iqdNP5x5EcgVjWfS3r
	aYJkFqcgCNd/Omc6bxMA32vjEQF5jgPMj7oDw7ZPrx+NrrApq3v/zA2PqWQ5kZGRJjVsDsxhh3tT6
	1rhvE8xaJI1y4mKcrFyXhebe+l2n3V6Ru4UqnXPFJkbGhVIW7ZSODzzzG7WvRBRY8uyveanyxIpRy
	aEP8ixog==;
Received: from mgamail.intel.com ([192.198.163.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3ih-0000000Bhet-1BKu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 21:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753393399; x=1784929399;
  h=date:from:to:cc:subject:message-id;
  bh=0y+WaQHPFL9Jh9MnbyoM7gRPKRsn/Ev8TIS/gn6EH0k=;
  b=OARQ6O1zWzUBxnOJ78QM8xQz0fDcb6okLod1OG5UMCld3vFY0/lyA3Jp
   /dRmsgbVt3CP0K/NY81nUI4exOv608l4eg7RX5C1MSKQOemPArXy/ja7p
   GegB6yjS2ArnQaY2kZWQB2JMGSIfZR2/GZ6yYZKm6gTGbzvtNADr/pyz+
   tJcc+We3jisWB7SW+2iCzLtsBO2+2Jr1Y+19Y+nPHwxp+b+Z2vLhigWlM
   AZAMtsZpf24kKDz/EhFUMVXBodf5JwzT+Va6i1sj0rIeHA8r6CaN58kKz
   Ld15lQxxgpmVQNKOyqBo/K8f5F3ZVXfR4TGEoHhMm+BVnxI38EG5BCEd8
   Q==;
X-CSE-ConnectionGUID: 5BqHyx6mSeKchOl44oL2dA==
X-CSE-MsgGUID: zV7LZJemRK6dCJuVUSVXrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55812929"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="55812929"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 14:43:13 -0700
X-CSE-ConnectionGUID: hMcYEhhzTjWsSeOaMefQ9w==
X-CSE-MsgGUID: IBnB5fNhTjyWbUgG+WGkFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="191481212"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jul 2025 14:43:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf3iX-000Kqh-1d;
	Thu, 24 Jul 2025 21:43:09 +0000
Date: Fri, 25 Jul 2025 05:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:sophgo/dt] BUILD SUCCESS
 7f90573099e8a506a6874d691d884d7f5b77ec74
Message-ID: <202507250501.XNwJdQVV-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_224320_119733_6C34418E 
X-CRM114-Status: UNSURE (   5.31  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt
branch HEAD: 7f90573099e8a506a6874d691d884d7f5b77ec74  riscv: dts: sophgo: fix mdio node name for CV180X

elapsed time: 1452m

configs tested: 256
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250724    clang-22
arc                   randconfig-001-20250724    gcc-13.4.0
arc                   randconfig-002-20250724    clang-22
arc                   randconfig-002-20250724    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                         at91_dt_defconfig    clang-22
arm                                 defconfig    clang-19
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20250724    clang-22
arm                   randconfig-001-20250724    gcc-10.5.0
arm                   randconfig-002-20250724    clang-22
arm                   randconfig-003-20250724    clang-22
arm                   randconfig-003-20250724    gcc-8.5.0
arm                   randconfig-004-20250724    clang-22
arm                   randconfig-004-20250724    gcc-12.5.0
arm                           tegra_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250724    clang-22
arm64                 randconfig-001-20250724    gcc-8.5.0
arm64                 randconfig-002-20250724    clang-22
arm64                 randconfig-003-20250724    clang-22
arm64                 randconfig-003-20250724    gcc-13.4.0
arm64                 randconfig-004-20250724    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250724    gcc-13.4.0
csky                  randconfig-001-20250724    gcc-14.3.0
csky                  randconfig-002-20250724    gcc-10.5.0
csky                  randconfig-002-20250724    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250724    clang-22
hexagon               randconfig-001-20250724    gcc-14.3.0
hexagon               randconfig-002-20250724    clang-22
hexagon               randconfig-002-20250724    gcc-14.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250724    gcc-12
i386        buildonly-randconfig-001-20250725    gcc-12
i386        buildonly-randconfig-002-20250724    clang-20
i386        buildonly-randconfig-002-20250724    gcc-12
i386        buildonly-randconfig-002-20250725    gcc-12
i386        buildonly-randconfig-003-20250724    clang-20
i386        buildonly-randconfig-003-20250724    gcc-12
i386        buildonly-randconfig-003-20250725    gcc-12
i386        buildonly-randconfig-004-20250724    clang-20
i386        buildonly-randconfig-004-20250724    gcc-12
i386        buildonly-randconfig-004-20250725    gcc-12
i386        buildonly-randconfig-005-20250724    clang-20
i386        buildonly-randconfig-005-20250724    gcc-12
i386        buildonly-randconfig-005-20250725    gcc-12
i386        buildonly-randconfig-006-20250724    clang-20
i386        buildonly-randconfig-006-20250724    gcc-12
i386        buildonly-randconfig-006-20250725    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250724    clang-20
i386                  randconfig-001-20250725    clang-20
i386                  randconfig-002-20250724    clang-20
i386                  randconfig-002-20250725    clang-20
i386                  randconfig-003-20250724    clang-20
i386                  randconfig-003-20250725    clang-20
i386                  randconfig-004-20250724    clang-20
i386                  randconfig-004-20250725    clang-20
i386                  randconfig-005-20250724    clang-20
i386                  randconfig-005-20250725    clang-20
i386                  randconfig-006-20250724    clang-20
i386                  randconfig-006-20250725    clang-20
i386                  randconfig-007-20250724    clang-20
i386                  randconfig-007-20250725    clang-20
i386                  randconfig-011-20250724    gcc-12
i386                  randconfig-011-20250725    gcc-12
i386                  randconfig-012-20250724    gcc-12
i386                  randconfig-012-20250725    gcc-12
i386                  randconfig-013-20250724    gcc-12
i386                  randconfig-013-20250725    gcc-12
i386                  randconfig-014-20250724    gcc-12
i386                  randconfig-014-20250725    gcc-12
i386                  randconfig-015-20250724    gcc-12
i386                  randconfig-015-20250725    gcc-12
i386                  randconfig-016-20250724    gcc-12
i386                  randconfig-016-20250725    gcc-12
i386                  randconfig-017-20250724    gcc-12
i386                  randconfig-017-20250725    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250724    clang-22
loongarch             randconfig-001-20250724    gcc-14.3.0
loongarch             randconfig-002-20250724    gcc-13.4.0
loongarch             randconfig-002-20250724    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    clang-22
m68k                       m5475evb_defconfig    clang-22
m68k                        stmark2_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250724    gcc-11.5.0
nios2                 randconfig-001-20250724    gcc-14.3.0
nios2                 randconfig-002-20250724    gcc-14.3.0
nios2                 randconfig-002-20250724    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250724    gcc-14.3.0
parisc                randconfig-002-20250724    gcc-14.3.0
parisc                randconfig-002-20250724    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    clang-22
powerpc               randconfig-001-20250724    clang-22
powerpc               randconfig-001-20250724    gcc-14.3.0
powerpc               randconfig-002-20250724    gcc-14.3.0
powerpc               randconfig-002-20250724    gcc-8.5.0
powerpc               randconfig-003-20250724    clang-22
powerpc               randconfig-003-20250724    gcc-14.3.0
powerpc                     tqm8541_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250724    clang-22
powerpc64             randconfig-001-20250724    gcc-14.3.0
powerpc64             randconfig-002-20250724    gcc-13.4.0
powerpc64             randconfig-002-20250724    gcc-14.3.0
powerpc64             randconfig-003-20250724    gcc-14.3.0
powerpc64             randconfig-003-20250724    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250724    gcc-13.4.0
riscv                 randconfig-002-20250724    gcc-13.4.0
riscv                 randconfig-002-20250724    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-12
s390                  randconfig-001-20250724    clang-22
s390                  randconfig-001-20250724    gcc-13.4.0
s390                  randconfig-002-20250724    gcc-10.5.0
s390                  randconfig-002-20250724    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250724    gcc-13.4.0
sh                    randconfig-002-20250724    gcc-13.4.0
sh                    randconfig-002-20250724    gcc-15.1.0
sh                           se7722_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250724    gcc-13.4.0
sparc                 randconfig-001-20250724    gcc-15.1.0
sparc                 randconfig-002-20250724    gcc-13.4.0
sparc                 randconfig-002-20250724    gcc-8.5.0
sparc                       sparc32_defconfig    clang-22
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250724    gcc-13.4.0
sparc64               randconfig-001-20250724    gcc-8.5.0
sparc64               randconfig-002-20250724    clang-22
sparc64               randconfig-002-20250724    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250724    clang-22
um                    randconfig-001-20250724    gcc-13.4.0
um                    randconfig-002-20250724    gcc-12
um                    randconfig-002-20250724    gcc-13.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250724    gcc-12
x86_64      buildonly-randconfig-002-20250724    clang-20
x86_64      buildonly-randconfig-002-20250724    gcc-12
x86_64      buildonly-randconfig-003-20250724    gcc-12
x86_64      buildonly-randconfig-004-20250724    gcc-12
x86_64      buildonly-randconfig-005-20250724    clang-20
x86_64      buildonly-randconfig-005-20250724    gcc-12
x86_64      buildonly-randconfig-006-20250724    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250724    gcc-12
x86_64                randconfig-001-20250725    gcc-12
x86_64                randconfig-002-20250724    gcc-12
x86_64                randconfig-002-20250725    gcc-12
x86_64                randconfig-003-20250724    gcc-12
x86_64                randconfig-003-20250725    gcc-12
x86_64                randconfig-004-20250724    gcc-12
x86_64                randconfig-004-20250725    gcc-12
x86_64                randconfig-005-20250724    gcc-12
x86_64                randconfig-005-20250725    gcc-12
x86_64                randconfig-006-20250724    gcc-12
x86_64                randconfig-006-20250725    gcc-12
x86_64                randconfig-007-20250724    gcc-12
x86_64                randconfig-007-20250725    gcc-12
x86_64                randconfig-008-20250724    gcc-12
x86_64                randconfig-008-20250725    gcc-12
x86_64                randconfig-071-20250724    clang-20
x86_64                randconfig-072-20250724    clang-20
x86_64                randconfig-073-20250724    clang-20
x86_64                randconfig-074-20250724    clang-20
x86_64                randconfig-075-20250724    clang-20
x86_64                randconfig-076-20250724    clang-20
x86_64                randconfig-077-20250724    clang-20
x86_64                randconfig-078-20250724    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250724    gcc-12.5.0
xtensa                randconfig-001-20250724    gcc-13.4.0
xtensa                randconfig-002-20250724    gcc-12.5.0
xtensa                randconfig-002-20250724    gcc-13.4.0
xtensa                    smp_lx200_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

