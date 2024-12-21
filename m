Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086A0E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fnBq5UdWjuuBlpowQiwx5qA4PzZ64zop97k6Ctp9STM=; b=VxZUlsR6dS9VwE5JQwpZ2WaMZg
	URtsS/mxuFLtjoyZh7Cx+JU4KoMJnHdUdE1O+otTv+JC9feIfC4dyKZQVDkKAKQZTy2ennaIRnNmw
	aVSSayvYRoDJRCvHwbJNJZqHLvrN5Q8dbE0HbvFa1YfX42aA4uqQAP6krVjk2zxQs+cBNQgn8dIi5
	Fu5DRHt2pQGd3PT6mAXdAP2TjbpFK/H+mkBmYxmoT9sSstFJ2OIXV0CoaDq1tC02d11JNmoco6gNt
	Hb2uBGAcrg/AoiA27HlWk7qV2RhOf+dfvPrkIn/OeAxkDB9Q3FuD96comO4F+EL8KKP59Kdezbc63
	GbY9DeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOv75-00000006kGS-0JKf;
	Sat, 21 Dec 2024 08:45:31 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOv5s-00000006kDP-3vdV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 08:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734770657; x=1766306657;
  h=date:from:to:cc:subject:message-id;
  bh=heuiHPVEvVIQwwWk3rRZIufsDWjtNz1o+9oT0ZRucbg=;
  b=Frc1SuR4URkOdf/XHPVEiWIsTVYoiLVcXXoJXFO3YOpMaxdEUttisMON
   Fj44hNENoCtUdLNbhJxBPw0r1yhbVHsh5oRs4HbC2SYXNdEArVtPZExrv
   EcUgGQ9datUBfmMY6HOXYNIpm0gSaxJekZm0/1FLsmtQQyfyNBFWpSuGu
   5TjQYOlzHpkzGgHK1aVjjhXwAuWJEkFXcucWUPPuqeM2PKxHjGFfPF4SY
   wSq0V/IS1QlN/d39gcJCbrGxSouI/xQGaMgH8HwMre41PiaDgZUZQP4XC
   RCzAHazCwqQslPj0CBvFwxJbhYUMPvZtXiGlR4Chv7Hsi1nOyFS21s2ip
   w==;
X-CSE-ConnectionGUID: k7Wv0RehTFW2jOMTYNnUCQ==
X-CSE-MsgGUID: SPEU6znQQ7+We/K6k4fZPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35195148"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="35195148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 00:44:16 -0800
X-CSE-ConnectionGUID: HRlTYeybTaqmsgU5Tz5K1g==
X-CSE-MsgGUID: zsQcaJZkRrqXBkoTt/lGMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103724114"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2024 00:44:14 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOv5n-00025n-38;
	Sat, 21 Dec 2024 08:44:11 +0000
Date: Sat, 21 Dec 2024 16:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:stm32/dt] BUILD SUCCESS
 8df9bff2788973e16263ca86df7574d527c84405
Message-ID: <202412211614.6WYu3H2H-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_004417_085334_5A0D85DE 
X-CRM114-Status: UNSURE (   4.82  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git stm32/dt
branch HEAD: 8df9bff2788973e16263ca86df7574d527c84405  arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-ev1

elapsed time: 1449m

configs tested: 206
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241221    gcc-13.2.0
arc                   randconfig-002-20241221    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20241221    gcc-13.2.0
arm                   randconfig-001-20241221    gcc-14.2.0
arm                   randconfig-002-20241221    gcc-13.2.0
arm                   randconfig-002-20241221    gcc-14.2.0
arm                   randconfig-003-20241221    gcc-13.2.0
arm                   randconfig-003-20241221    gcc-14.2.0
arm                   randconfig-004-20241221    clang-18
arm                   randconfig-004-20241221    gcc-13.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241221    clang-18
arm64                 randconfig-001-20241221    gcc-13.2.0
arm64                 randconfig-002-20241221    clang-16
arm64                 randconfig-002-20241221    gcc-13.2.0
arm64                 randconfig-003-20241221    clang-20
arm64                 randconfig-003-20241221    gcc-13.2.0
arm64                 randconfig-004-20241221    gcc-13.2.0
arm64                 randconfig-004-20241221    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241221    gcc-14.2.0
csky                  randconfig-002-20241221    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241221    gcc-14.2.0
hexagon               randconfig-002-20241221    clang-20
hexagon               randconfig-002-20241221    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241221    clang-19
i386        buildonly-randconfig-001-20241221    gcc-12
i386        buildonly-randconfig-002-20241221    clang-19
i386        buildonly-randconfig-002-20241221    gcc-12
i386        buildonly-randconfig-003-20241221    clang-19
i386        buildonly-randconfig-004-20241221    clang-19
i386        buildonly-randconfig-005-20241221    clang-19
i386        buildonly-randconfig-006-20241221    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241221    gcc-12
i386                  randconfig-002-20241221    gcc-12
i386                  randconfig-003-20241221    gcc-12
i386                  randconfig-004-20241221    gcc-12
i386                  randconfig-005-20241221    gcc-12
i386                  randconfig-006-20241221    gcc-12
i386                  randconfig-007-20241221    gcc-12
i386                  randconfig-011-20241221    gcc-12
i386                  randconfig-012-20241221    gcc-12
i386                  randconfig-013-20241221    gcc-12
i386                  randconfig-014-20241221    gcc-12
i386                  randconfig-015-20241221    gcc-12
i386                  randconfig-016-20241221    gcc-12
i386                  randconfig-017-20241221    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241221    gcc-14.2.0
loongarch             randconfig-002-20241221    gcc-14.2.0
m68k                             alldefconfig    clang-15
m68k                              allnoconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-15
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241221    gcc-14.2.0
nios2                 randconfig-002-20241221    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241221    gcc-14.2.0
parisc                randconfig-002-20241221    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    clang-15
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    clang-15
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241221    gcc-14.2.0
powerpc               randconfig-002-20241221    gcc-14.2.0
powerpc               randconfig-003-20241221    gcc-14.2.0
powerpc64             randconfig-001-20241221    gcc-14.2.0
powerpc64             randconfig-002-20241221    gcc-14.2.0
powerpc64             randconfig-003-20241221    clang-18
powerpc64             randconfig-003-20241221    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20241221    clang-18
riscv                 randconfig-001-20241221    gcc-14.2.0
riscv                 randconfig-002-20241221    clang-18
riscv                 randconfig-002-20241221    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241221    clang-18
s390                  randconfig-001-20241221    gcc-14.2.0
s390                  randconfig-002-20241221    clang-18
s390                  randconfig-002-20241221    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    clang-15
sh                    randconfig-001-20241221    clang-18
sh                    randconfig-001-20241221    gcc-14.2.0
sh                    randconfig-002-20241221    clang-18
sh                    randconfig-002-20241221    gcc-14.2.0
sh                   secureedge5410_defconfig    clang-15
sh                   sh7724_generic_defconfig    clang-15
sh                   sh7724_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241221    clang-18
sparc                 randconfig-001-20241221    gcc-14.2.0
sparc                 randconfig-002-20241221    clang-18
sparc                 randconfig-002-20241221    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241221    clang-18
sparc64               randconfig-001-20241221    gcc-14.2.0
sparc64               randconfig-002-20241221    clang-18
sparc64               randconfig-002-20241221    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241221    clang-18
um                    randconfig-002-20241221    clang-18
um                    randconfig-002-20241221    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241221    gcc-12
x86_64      buildonly-randconfig-002-20241221    gcc-12
x86_64      buildonly-randconfig-003-20241221    gcc-12
x86_64      buildonly-randconfig-004-20241221    gcc-12
x86_64      buildonly-randconfig-005-20241221    gcc-11
x86_64      buildonly-randconfig-005-20241221    gcc-12
x86_64      buildonly-randconfig-006-20241221    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241221    gcc-11
x86_64                randconfig-002-20241221    gcc-11
x86_64                randconfig-003-20241221    gcc-11
x86_64                randconfig-004-20241221    gcc-11
x86_64                randconfig-005-20241221    gcc-11
x86_64                randconfig-006-20241221    gcc-11
x86_64                randconfig-007-20241221    gcc-11
x86_64                randconfig-008-20241221    gcc-11
x86_64                randconfig-071-20241221    gcc-12
x86_64                randconfig-072-20241221    gcc-12
x86_64                randconfig-073-20241221    gcc-12
x86_64                randconfig-074-20241221    gcc-12
x86_64                randconfig-075-20241221    gcc-12
x86_64                randconfig-076-20241221    gcc-12
x86_64                randconfig-077-20241221    gcc-12
x86_64                randconfig-078-20241221    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241221    clang-18
xtensa                randconfig-001-20241221    gcc-14.2.0
xtensa                randconfig-002-20241221    clang-18
xtensa                randconfig-002-20241221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

