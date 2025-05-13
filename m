Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C53FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1yZO3SONX8K55OrOr24a1BIv9in3FzwO5IQzYHk7c9k=; b=FV3duwd3KyVI32c+RvJSVa6X0y
	VMqBcHrURtZ7FDR9po8arMh5uuN9SZBVYHJL4L9p+yNjW7Z0JRUEa4zvdUUFe1pZeL/7m2kPHSjmT
	c1n7Ng4S0v0aZkuMFqr+Ji9TGxr5lz5HIL/IxvRnxZEFviOfnpvGj2bZafao5JgeQpHFNLOJtCyy5
	K44tktCMJZYxDkljjXf+NGW5CNrgnHcDyVwqt1NBMJ0oJDraogULy98aznRwAYEqZzGKNF+TjZfvS
	wHy/Oity28c/8obp7gPwHWgjeO1lkV+iSdVkDMSS3oi4lVo+JxPO++Jc9Nd2p9QdUVLuA+eYhKU/s
	JIHqLgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEp2T-0000000COsQ-0S2R;
	Tue, 13 May 2025 12:47:17 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEp0L-0000000COUY-43Jv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 12:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747140306; x=1778676306;
  h=date:from:to:cc:subject:message-id;
  bh=z5/vDUREShY4gDubdAtBdYPZX7Xm78EapVQqeNj+xW0=;
  b=cX1BUVqYcpwqADchD1/SNEiA3qtxTTiaOhylAjcA5y4Xb9PgVemdy7Zw
   tNA76sqCWfsbyowLIPw4igip/EeH0TI+8LoSWRJDg4a63M+zppoGo4+Dh
   BvAMh41o4UcHxgjOZ9qX5fTQv6FwXLFCbbYgdQmX33JT3aIh6l/qk7JzT
   HhHuUH/leuCiG3Ulmz1DNtEjKxXTziz+XbJkDTUCsaEST3KZzmRIR9ZCN
   NKG8OBJLmaK6IngpMUs1GpGkDNt3NH4qL+SVgcgu0AImNqQY1RqpcVJY8
   VMp+SGIhEN89LO2PrOD2gQf2eIrUmi0pEfJ5E48DqiQKk6OVc/7QIqKGx
   Q==;
X-CSE-ConnectionGUID: nuNnts5YQjaoy59nTAkAcQ==
X-CSE-MsgGUID: kPrVQKnUQDq12Ao/L+RHwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48091129"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="48091129"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 05:45:05 -0700
X-CSE-ConnectionGUID: N8slBHdyRce+OBZusLBreQ==
X-CSE-MsgGUID: qFp7cqb2RaSgoF2Bw1YOSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="142886330"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 May 2025 05:45:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEp0H-000G2n-2V;
	Tue, 13 May 2025 12:45:01 +0000
Date: Tue, 13 May 2025 20:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 b892924264c19a155374a0c1cc20c32a91bd3a0a
Message-ID: <202505132029.7p9ZhdQS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_054506_024425_5620B932 
X-CRM114-Status: UNSURE (   5.43  )
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
branch HEAD: b892924264c19a155374a0c1cc20c32a91bd3a0a  Merge tag 'imx-drivers-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc/drivers

elapsed time: 1448m

configs tested: 246
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-14.2.0
arc                   randconfig-001-20250512    gcc-14.2.0
arc                   randconfig-001-20250513    clang-21
arc                   randconfig-002-20250512    gcc-11.5.0
arc                   randconfig-002-20250513    clang-21
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-21
arm                         lpc18xx_defconfig    gcc-14.2.0
arm                        multi_v5_defconfig    clang-21
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250512    gcc-7.5.0
arm                   randconfig-001-20250513    clang-21
arm                   randconfig-002-20250512    clang-17
arm                   randconfig-002-20250513    clang-21
arm                   randconfig-003-20250512    gcc-6.5.0
arm                   randconfig-003-20250513    clang-21
arm                   randconfig-004-20250512    clang-21
arm                   randconfig-004-20250513    clang-21
arm                           tegra_defconfig    clang-21
arm                           tegra_defconfig    gcc-14.2.0
arm                       versatile_defconfig    clang-21
arm64                            alldefconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250512    gcc-7.5.0
arm64                 randconfig-001-20250513    clang-21
arm64                 randconfig-002-20250512    clang-21
arm64                 randconfig-002-20250513    clang-21
arm64                 randconfig-003-20250512    clang-21
arm64                 randconfig-003-20250513    clang-21
arm64                 randconfig-004-20250512    clang-21
arm64                 randconfig-004-20250513    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250512    gcc-9.3.0
csky                  randconfig-001-20250513    clang-21
csky                  randconfig-002-20250512    gcc-14.2.0
csky                  randconfig-002-20250513    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250512    clang-20
hexagon               randconfig-001-20250513    clang-21
hexagon               randconfig-002-20250512    clang-21
hexagon               randconfig-002-20250513    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250512    gcc-11
i386        buildonly-randconfig-001-20250513    clang-20
i386        buildonly-randconfig-002-20250512    clang-20
i386        buildonly-randconfig-002-20250513    clang-20
i386        buildonly-randconfig-003-20250512    clang-20
i386        buildonly-randconfig-003-20250513    clang-20
i386        buildonly-randconfig-004-20250512    gcc-12
i386        buildonly-randconfig-004-20250513    clang-20
i386        buildonly-randconfig-005-20250512    clang-20
i386        buildonly-randconfig-005-20250513    clang-20
i386        buildonly-randconfig-006-20250512    clang-20
i386        buildonly-randconfig-006-20250513    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250513    gcc-12
i386                  randconfig-002-20250513    gcc-12
i386                  randconfig-003-20250513    gcc-12
i386                  randconfig-004-20250513    gcc-12
i386                  randconfig-005-20250513    gcc-12
i386                  randconfig-006-20250513    gcc-12
i386                  randconfig-007-20250513    gcc-12
i386                  randconfig-011-20250513    gcc-12
i386                  randconfig-012-20250513    gcc-12
i386                  randconfig-013-20250513    gcc-12
i386                  randconfig-014-20250513    gcc-12
i386                  randconfig-015-20250513    gcc-12
i386                  randconfig-016-20250513    gcc-12
i386                  randconfig-017-20250513    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250512    gcc-13.3.0
loongarch             randconfig-001-20250513    clang-21
loongarch             randconfig-002-20250512    gcc-13.3.0
loongarch             randconfig-002-20250513    clang-21
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    clang-21
mips                           ip22_defconfig    gcc-14.2.0
mips                           ip27_defconfig    clang-21
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250512    gcc-7.5.0
nios2                 randconfig-001-20250513    clang-21
nios2                 randconfig-002-20250512    gcc-11.5.0
nios2                 randconfig-002-20250513    clang-21
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250512    gcc-12.4.0
parisc                randconfig-001-20250513    clang-21
parisc                randconfig-002-20250512    gcc-10.5.0
parisc                randconfig-002-20250513    clang-21
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    clang-21
powerpc               randconfig-001-20250512    gcc-5.5.0
powerpc               randconfig-001-20250513    clang-21
powerpc               randconfig-002-20250512    clang-21
powerpc               randconfig-002-20250513    clang-21
powerpc               randconfig-003-20250512    gcc-7.5.0
powerpc               randconfig-003-20250513    clang-21
powerpc                     skiroot_defconfig    clang-21
powerpc64             randconfig-001-20250512    clang-21
powerpc64             randconfig-001-20250513    clang-21
powerpc64             randconfig-002-20250512    gcc-5.5.0
powerpc64             randconfig-003-20250512    clang-21
powerpc64             randconfig-003-20250513    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250512    gcc-7.5.0
riscv                 randconfig-002-20250512    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250512    clang-18
s390                  randconfig-002-20250512    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-21
sh                    randconfig-001-20250512    gcc-11.5.0
sh                    randconfig-002-20250512    gcc-9.3.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                          rsk7269_defconfig    clang-21
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                            shmin_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250512    gcc-10.3.0
sparc                 randconfig-002-20250512    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250512    gcc-6.5.0
sparc64               randconfig-002-20250512    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250512    gcc-12
um                    randconfig-002-20250512    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250512    gcc-12
x86_64      buildonly-randconfig-001-20250513    gcc-12
x86_64      buildonly-randconfig-002-20250512    gcc-12
x86_64      buildonly-randconfig-002-20250513    gcc-12
x86_64      buildonly-randconfig-003-20250512    clang-20
x86_64      buildonly-randconfig-003-20250513    gcc-12
x86_64      buildonly-randconfig-004-20250512    clang-20
x86_64      buildonly-randconfig-004-20250513    gcc-12
x86_64      buildonly-randconfig-005-20250512    clang-20
x86_64      buildonly-randconfig-005-20250513    gcc-12
x86_64      buildonly-randconfig-006-20250512    clang-20
x86_64      buildonly-randconfig-006-20250513    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250513    clang-20
x86_64                randconfig-002-20250513    clang-20
x86_64                randconfig-003-20250513    clang-20
x86_64                randconfig-004-20250513    clang-20
x86_64                randconfig-005-20250513    clang-20
x86_64                randconfig-006-20250513    clang-20
x86_64                randconfig-007-20250513    clang-20
x86_64                randconfig-008-20250513    clang-20
x86_64                randconfig-071-20250513    clang-20
x86_64                randconfig-072-20250513    clang-20
x86_64                randconfig-073-20250513    clang-20
x86_64                randconfig-074-20250513    clang-20
x86_64                randconfig-075-20250513    clang-20
x86_64                randconfig-076-20250513    clang-20
x86_64                randconfig-077-20250513    clang-20
x86_64                randconfig-078-20250513    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250512    gcc-12.4.0
xtensa                randconfig-002-20250512    gcc-14.2.0
xtensa                         virt_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

