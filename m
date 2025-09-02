Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B5BCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RYEYgY/upIzrKkZJN9FUxOAvt0Tul2q+2/fTuW44PoQ=; b=S4TguLA0ZwTLMzvcWqF/gvh4qt
	qyxdo4isqe0Enkx7EHXoozzbC5JMnHk5ZbRwNLsN6/cEwx0hAOKSANd5+iPf1FbEC2kjZQX2g3hr1
	0S1IUm/0Ap2B9YjfgdmY7qwdayXdrO/9YwBRPz2M2qqh1iEu4WoJb7ctx/+5xL8dmIfeSnnXpvZe+
	ToNJbM2dhVDAgL6ipffU2z7CWoTw/26ZclHAm3XibhCTTaj4cFza2d74ept2cpamSbdJbERa5i7DI
	aumLk9VniOVb0YPR3nD5zHjoGd5jtySnVDCtk+cG4nFnPz3S39xWPzAVdVtEgxTMmrXkfHtGWHzO3
	TGxoGO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTHF-00000000mhB-1vK7;
	Tue, 02 Sep 2025 15:50:33 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPoU-0000000H7RZ-2vgm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756814919; x=1788350919;
  h=date:from:to:cc:subject:message-id;
  bh=SI+EY8FamVCUZV13NEHcAHSWwODucFjrjiTPrcu4foc=;
  b=lwGZLQMRhcknlxB0YPp42A/Jj4cBd7b4ZtvAscNt93ygoO7bi0jWUp1p
   HSmdIa3/snYX13UuJWWwZJ7k7+ykuqh9H7+6kXgw7Glr2vbPToMpyci6d
   mqx7Umf1qY/DRXSbHNIZWmjuBYV25Dq+A5D4YXVslesgKvouX+yI7d3Vl
   YN+PAAqElmFrdVpnLdcdASVkGMFaTKtHRVXELM8ixaqj/cCRz+TSEVIAm
   SLhTTyU2evRX/nMIaBnLQLG8ucjkPuIzlJ98wLENX/wB2hPrKfA/m7CSk
   N4YPOtds6NSAMjDenuVeoj/YTDRtDzLaF2JhxvzyePHQ7cL1z2vqmyn8q
   g==;
X-CSE-ConnectionGUID: /rbsdccQTqmQexs7+69UUg==
X-CSE-MsgGUID: cScGA2WgQzi5Z4OrW3Dwnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59223775"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59223775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:08:38 -0700
X-CSE-ConnectionGUID: xD54pxauRvaHb3aSWbir9w==
X-CSE-MsgGUID: 8UedHCNuR7GqYvSKbAqy2A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Sep 2025 05:08:36 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utPoP-0001wf-2g;
	Tue, 02 Sep 2025 12:08:33 +0000
Date: Tue, 02 Sep 2025 20:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 70757ee5d2bc6da3a31dfbf808d534faa19178bd
Message-ID: <202509022002.bDKUWfih-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_050838_809576_19BF9F9E 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/defconfig
branch HEAD: 70757ee5d2bc6da3a31dfbf808d534faa19178bd  ARM: defconfig: pxa: Remove duplicate CONFIG_USB_GPIO_VBUS entry

elapsed time: 1493m

configs tested: 183
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs103_defconfig    clang-22
arc                                 defconfig    clang-19
arc                        nsimosci_defconfig    clang-22
arc                 nsimosci_hs_smp_defconfig    clang-22
arc                   randconfig-001-20250902    gcc-8.5.0
arc                   randconfig-002-20250902    gcc-8.5.0
arc                           tb10x_defconfig    clang-22
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                     davinci_all_defconfig    clang-22
arm                                 defconfig    clang-19
arm                            hisi_defconfig    clang-22
arm                          ixp4xx_defconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                        multi_v7_defconfig    clang-22
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250902    gcc-15.1.0
arm                   randconfig-001-20250902    gcc-8.5.0
arm                   randconfig-002-20250902    gcc-8.5.0
arm                   randconfig-003-20250902    clang-22
arm                   randconfig-003-20250902    gcc-8.5.0
arm                   randconfig-004-20250902    clang-22
arm                   randconfig-004-20250902    gcc-8.5.0
arm                           stm32_defconfig    gcc-15.1.0
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250902    gcc-8.5.0
arm64                 randconfig-002-20250902    clang-22
arm64                 randconfig-002-20250902    gcc-8.5.0
arm64                 randconfig-003-20250902    gcc-12.5.0
arm64                 randconfig-003-20250902    gcc-8.5.0
arm64                 randconfig-004-20250902    clang-22
arm64                 randconfig-004-20250902    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250902    gcc-11.5.0
csky                  randconfig-002-20250902    gcc-11.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250902    gcc-11.5.0
hexagon               randconfig-002-20250902    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250902    gcc-12
i386        buildonly-randconfig-002-20250902    gcc-12
i386        buildonly-randconfig-003-20250902    gcc-12
i386        buildonly-randconfig-004-20250902    gcc-12
i386        buildonly-randconfig-005-20250902    gcc-12
i386        buildonly-randconfig-006-20250902    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250902    gcc-12
i386                  randconfig-002-20250902    gcc-12
i386                  randconfig-003-20250902    gcc-12
i386                  randconfig-004-20250902    gcc-12
i386                  randconfig-005-20250902    gcc-12
i386                  randconfig-006-20250902    gcc-12
i386                  randconfig-007-20250902    gcc-12
i386                  randconfig-011-20250902    gcc-12
i386                  randconfig-012-20250902    gcc-12
i386                  randconfig-013-20250902    gcc-12
i386                  randconfig-014-20250902    gcc-12
i386                  randconfig-015-20250902    gcc-12
i386                  randconfig-016-20250902    gcc-12
i386                  randconfig-017-20250902    gcc-12
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250902    gcc-11.5.0
loongarch             randconfig-002-20250902    gcc-11.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                            mac_defconfig    clang-22
m68k                        mvme147_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250902    gcc-11.5.0
nios2                 randconfig-002-20250902    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250902    gcc-11.5.0
parisc                randconfig-002-20250902    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                     kmeter1_defconfig    clang-22
powerpc               randconfig-001-20250902    gcc-11.5.0
powerpc               randconfig-002-20250902    gcc-11.5.0
powerpc               randconfig-003-20250902    gcc-11.5.0
powerpc                     tqm8548_defconfig    clang-22
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250902    gcc-11.5.0
powerpc64             randconfig-002-20250902    gcc-11.5.0
powerpc64             randconfig-003-20250902    gcc-11.5.0
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250902    gcc-12.5.0
riscv                 randconfig-002-20250902    gcc-12.5.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250902    gcc-12.5.0
s390                  randconfig-002-20250902    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          polaris_defconfig    clang-22
sh                    randconfig-001-20250902    gcc-12.5.0
sh                    randconfig-002-20250902    gcc-12.5.0
sh                           se7343_defconfig    clang-22
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250902    gcc-12.5.0
sparc                 randconfig-002-20250902    gcc-12.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250902    gcc-12.5.0
sparc64               randconfig-002-20250902    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250902    gcc-12.5.0
um                    randconfig-002-20250902    gcc-12.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250902    clang-20
x86_64      buildonly-randconfig-002-20250902    clang-20
x86_64      buildonly-randconfig-003-20250902    clang-20
x86_64      buildonly-randconfig-004-20250902    clang-20
x86_64      buildonly-randconfig-005-20250902    clang-20
x86_64      buildonly-randconfig-006-20250902    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250902    clang-20
x86_64                randconfig-002-20250902    clang-20
x86_64                randconfig-003-20250902    clang-20
x86_64                randconfig-004-20250902    clang-20
x86_64                randconfig-005-20250902    clang-20
x86_64                randconfig-006-20250902    clang-20
x86_64                randconfig-007-20250902    clang-20
x86_64                randconfig-008-20250902    clang-20
x86_64                randconfig-071-20250902    clang-20
x86_64                randconfig-072-20250902    clang-20
x86_64                randconfig-073-20250902    clang-20
x86_64                randconfig-074-20250902    clang-20
x86_64                randconfig-075-20250902    clang-20
x86_64                randconfig-076-20250902    clang-20
x86_64                randconfig-077-20250902    clang-20
x86_64                randconfig-078-20250902    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250902    gcc-12.5.0
xtensa                randconfig-002-20250902    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

