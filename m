Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB762D73EB7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 06:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tcqy+itcw9+1TzIPrlCgABIJ28CYd+PaAWl3/nY2Xr8=; b=oQIm9mfwPmwaQfqfGPvO3atIM2
	Fos8tiH7RpZ+XGh2RtFgsU1MzDxAbxwfQaOCbPa7ug3B7fk+yhGbRD4zlWKCnVioVr1mpD4Mcw0ea
	kS/AkvujKZMh6YGv0SK/xakU9sRjBhA21ow6Lr6wYOYXAlehadbEqak5UNIXOPUT54CLzUsKHXLgW
	j/h1PaKGYVpYuUjrz9gMJyuZ6R9oJmmtR9O/0hqt41xccfVL3Aow6Qr18977RD/zMyEVDh+6Ik1OC
	Bn/d7sHNS8o4Cjt/V34PXA7bARTHi1tgOyhrLSQmcl/gguedz+HT290QMuvdWBtdWifuqxA7TBEsg
	3c6xMXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vli1k-0000000166i-39Ks;
	Fri, 30 Jan 2026 06:30:44 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vli1h-0000000166N-3cjW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 06:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769754642; x=1801290642;
  h=date:from:to:cc:subject:message-id;
  bh=PINpk9di9Dr/Lp6oKiaXmiQsxBwFl8tJq7Gqvp/pz18=;
  b=Sw/BRab+/VvYWKgYZDFiU646BtGZMgNZsVuUhS/SZjcHvLpYvqWooHV0
   cv1QQpeOlQocpbO6nvoHjSosLnRBs3ELU91geQLdPkCr9sbKheFlzXK88
   VEzKvQ688n37wV/61YYrhzNObmVCOLMm1WBnrdW6kPtZsxCi3tdrxoqY9
   BTVpRB46xL5VkTANr5mCejDbzrclt+31N2B4FLPoTg3+Ig+gQc4qDcokS
   rdhExep2aAdmApfR7I6GswSuJQzUSgI0gJJL3ua3zBRMo2gCoAOOhx9ia
   K41VMgac8fVqYE/ssDAMzd7Q6A2/ynOWbB2ugWTfkisbOyjy+igrXCpSZ
   w==;
X-CSE-ConnectionGUID: kfayPiaWRyKa9VxOBMezNg==
X-CSE-MsgGUID: ZZpfvoS1SU2keeClYxpiHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74867863"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="74867863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 22:30:37 -0800
X-CSE-ConnectionGUID: lON5O5H8RX6ivyUYfN5AKQ==
X-CSE-MsgGUID: lXTOwVn+TXqCsWHJ1Pk7rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="208025407"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2026 22:30:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vli1Z-00000000cGX-0Q0O;
	Fri, 30 Jan 2026 06:30:33 +0000
Date: Fri, 30 Jan 2026 14:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 1b65492f45c2ecb4590ccdf0fce35967531db2bf
Message-ID: <202601301417.Wn50V2Tc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_223041_924193_045954E6 
X-CRM114-Status: UNSURE (   5.53  )
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
branch HEAD: 1b65492f45c2ecb4590ccdf0fce35967531db2bf  Merge tag 'v6.20-rockchip-drivers1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/drivers

elapsed time: 1179m

configs tested: 240
configs skipped: 2

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
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260130    clang-17
arc                   randconfig-002-20260130    clang-17
arc                        vdk_hs38_defconfig    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    clang-22
arm                          collie_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-22
arm                   milbeaut_m10v_defconfig    clang-22
arm                          moxart_defconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                          pxa3xx_defconfig    gcc-15.2.0
arm                   randconfig-001-20260130    clang-17
arm                   randconfig-002-20260130    clang-17
arm                   randconfig-003-20260130    clang-17
arm                   randconfig-004-20260130    clang-17
arm                           stm32_defconfig    clang-22
arm                           sunxi_defconfig    clang-22
arm                           u8500_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260130    gcc-8.5.0
arm64                 randconfig-002-20260130    gcc-8.5.0
arm64                 randconfig-003-20260130    gcc-8.5.0
arm64                 randconfig-004-20260130    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260130    gcc-8.5.0
csky                  randconfig-002-20260130    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260129    clang-22
hexagon               randconfig-001-20260130    gcc-11.5.0
hexagon               randconfig-002-20260129    clang-22
hexagon               randconfig-002-20260130    gcc-11.5.0
i386                             alldefconfig    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260129    clang-20
i386        buildonly-randconfig-001-20260130    clang-20
i386        buildonly-randconfig-002-20260129    clang-20
i386        buildonly-randconfig-002-20260130    clang-20
i386        buildonly-randconfig-003-20260129    clang-20
i386        buildonly-randconfig-003-20260130    clang-20
i386        buildonly-randconfig-004-20260129    clang-20
i386        buildonly-randconfig-004-20260130    clang-20
i386        buildonly-randconfig-005-20260129    clang-20
i386        buildonly-randconfig-005-20260130    clang-20
i386        buildonly-randconfig-006-20260129    clang-20
i386        buildonly-randconfig-006-20260130    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260130    gcc-14
i386                  randconfig-002-20260130    gcc-14
i386                  randconfig-003-20260130    gcc-14
i386                  randconfig-004-20260130    gcc-14
i386                  randconfig-005-20260130    gcc-14
i386                  randconfig-006-20260130    gcc-14
i386                  randconfig-007-20260130    gcc-14
i386                  randconfig-011-20260130    clang-20
i386                  randconfig-012-20260130    clang-20
i386                  randconfig-013-20260130    clang-20
i386                  randconfig-014-20260130    clang-20
i386                  randconfig-015-20260130    clang-20
i386                  randconfig-016-20260130    clang-20
i386                  randconfig-017-20260130    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260129    clang-22
loongarch             randconfig-001-20260130    gcc-11.5.0
loongarch             randconfig-002-20260129    clang-22
loongarch             randconfig-002-20260130    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5407c3_defconfig    clang-22
m68k                           virt_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-22
mips                     loongson2k_defconfig    gcc-15.2.0
mips                        omega2p_defconfig    clang-22
nios2                         3c120_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260129    clang-22
nios2                 randconfig-001-20260130    gcc-11.5.0
nios2                 randconfig-002-20260129    clang-22
nios2                 randconfig-002-20260130    gcc-11.5.0
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
parisc                randconfig-001-20260130    gcc-8.5.0
parisc                randconfig-002-20260130    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     ksi8560_defconfig    clang-22
powerpc                      mgcoge_defconfig    gcc-15.2.0
powerpc                       ppc64_defconfig    clang-22
powerpc                     rainier_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260130    gcc-8.5.0
powerpc               randconfig-002-20260130    gcc-8.5.0
powerpc                    socrates_defconfig    gcc-15.2.0
powerpc                     tqm8541_defconfig    clang-22
powerpc                 xes_mpc85xx_defconfig    clang-22
powerpc64             randconfig-001-20260130    gcc-8.5.0
powerpc64             randconfig-002-20260130    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260130    clang-22
riscv                 randconfig-002-20260130    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260130    clang-22
s390                  randconfig-002-20260130    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260130    clang-22
sh                    randconfig-002-20260130    clang-22
sh                          rsk7269_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260130    clang-22
sparc                 randconfig-002-20260130    clang-22
sparc                       sparc32_defconfig    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260130    clang-22
sparc64               randconfig-002-20260130    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260130    clang-22
um                    randconfig-002-20260130    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260130    clang-20
x86_64      buildonly-randconfig-002-20260130    clang-20
x86_64      buildonly-randconfig-003-20260130    clang-20
x86_64      buildonly-randconfig-004-20260130    clang-20
x86_64      buildonly-randconfig-005-20260130    clang-20
x86_64      buildonly-randconfig-006-20260130    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260130    clang-20
x86_64                randconfig-002-20260130    clang-20
x86_64                randconfig-003-20260130    clang-20
x86_64                randconfig-004-20260130    clang-20
x86_64                randconfig-005-20260130    clang-20
x86_64                randconfig-006-20260130    clang-20
x86_64                randconfig-011-20260130    clang-20
x86_64                randconfig-012-20260130    clang-20
x86_64                randconfig-013-20260130    clang-20
x86_64                randconfig-014-20260130    clang-20
x86_64                randconfig-015-20260130    clang-20
x86_64                randconfig-016-20260130    clang-20
x86_64                randconfig-071-20260130    clang-20
x86_64                randconfig-072-20260130    clang-20
x86_64                randconfig-073-20260130    clang-20
x86_64                randconfig-074-20260130    clang-20
x86_64                randconfig-075-20260130    clang-20
x86_64                randconfig-076-20260130    clang-20
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
xtensa                           allyesconfig    gcc-15.2.0
xtensa                  cadence_csp_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260130    clang-22
xtensa                randconfig-002-20260130    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

