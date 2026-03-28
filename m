Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7322510BA421
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 07:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ljECoULaU7ucxlPJ2Z2t+vks+oWgaKE/ELEa2RWPTtY=; b=bitJoPGzqvrg7aXuRCUsoqrmfU
	ZbigswLKCRCTbmystsd5YoRT20gOFcEUsN4Xh5z3X2gPSv/ran3wvpRpsfAyoiighYLImOlhuZ24q
	/DRiAXp4j4CaDblasZRHRm/vAiwhfV8/9Kbj8VPhr2cF/Ct8Wfpa6O+PmsIy8d76Uaw5Y9crhp/yg
	SZFpW1wP4D8Df9bU+KEFvINp8mNCMyQHLp5DFkWuroYc84txgYldywXiTo8nwk9PtK5YKTm41n+vG
	5BLSU33qJ3Yo9Zhh35HIrjMklq8IyZ+THb3hkUs2LJ/aNfQuQfRxu2TSPSKsypJGApjOqiXRpTwQg
	1vgegYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OYV-00000008iZj-1qV9;
	Sat, 28 Mar 2026 07:58:03 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OYT-00000008iZK-0uw6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 07:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774684681; x=1806220681;
  h=date:from:to:cc:subject:message-id;
  bh=ogSU5z8woee5BlHlvX3aOy4osiCQFRy+xKky82ssMuU=;
  b=DgCQ7GP5AlptzfdlqwbB4EIP3YQNy3bG0ZlkWRdBHh9n++AWMoW25Z4m
   ZWh+IEQ5vKCMigkXHj8WF2htFXnCoC1DFz/1fxktRc5W3y9VwScvZJwKS
   Jo2hskI+xOAyY2w0MbLkW9MdSsFm+cONr3Gk42lXXMDEtRl3ABCVbtRGk
   RnuCEmmr2bD7esC5BPoWlqISTKGMb25y7tjdmxqUplj4rOGfzVVNKmKEx
   25YMphibhfFzq8EypU+6s+6jgl1+GUNne12nEXS73LlaZsb/UPCBdYtX1
   ncug19nnH/izFZwcJtc9S7WOoJQkUgnMhyDxr4QTq+mTCMvk9VqaLdZy2
   w==;
X-CSE-ConnectionGUID: TRRnxuNnQF+hfJcfjiispw==
X-CSE-MsgGUID: gc3MRF47RVilgE6vsHkuFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93330620"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="93330620"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 00:57:59 -0700
X-CSE-ConnectionGUID: skrNgdCIREW8UMOvz2i9Yw==
X-CSE-MsgGUID: NgAXjTRIQSGkf+3UY1lFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="229595123"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Mar 2026 00:57:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6OYN-00000000BD1-18ZO;
	Sat, 28 Mar 2026 07:57:55 +0000
Date: Sat, 28 Mar 2026 15:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 7d3d773bd5e2479e05db450c42b3ad7a29ddd825
Message-ID: <202603281547.mcDGJxDt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_005801_273041_906B22A0 
X-CRM114-Status: UNSURE (   4.83  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: 7d3d773bd5e2479e05db450c42b3ad7a29ddd825  soc: document merges

elapsed time: 759m

configs tested: 174
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260328    gcc-15.2.0
arc                   randconfig-002-20260328    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260328    gcc-15.2.0
arm                   randconfig-002-20260328    gcc-15.2.0
arm                   randconfig-003-20260328    gcc-15.2.0
arm                   randconfig-004-20260328    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260328    gcc-14.3.0
arm64                 randconfig-002-20260328    gcc-14.3.0
arm64                 randconfig-003-20260328    gcc-14.3.0
arm64                 randconfig-004-20260328    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260328    gcc-14.3.0
csky                  randconfig-002-20260328    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260328    gcc-11.5.0
hexagon               randconfig-002-20260328    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260328    clang-20
i386        buildonly-randconfig-002-20260328    clang-20
i386        buildonly-randconfig-003-20260328    clang-20
i386        buildonly-randconfig-004-20260328    clang-20
i386        buildonly-randconfig-005-20260328    clang-20
i386        buildonly-randconfig-006-20260328    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260328    clang-20
i386                  randconfig-002-20260328    clang-20
i386                  randconfig-003-20260328    clang-20
i386                  randconfig-004-20260328    clang-20
i386                  randconfig-005-20260328    clang-20
i386                  randconfig-006-20260328    clang-20
i386                  randconfig-007-20260328    clang-20
i386                  randconfig-011-20260328    gcc-13
i386                  randconfig-012-20260328    gcc-13
i386                  randconfig-013-20260328    gcc-13
i386                  randconfig-014-20260328    gcc-13
i386                  randconfig-015-20260328    gcc-13
i386                  randconfig-016-20260328    gcc-13
i386                  randconfig-017-20260328    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260328    gcc-11.5.0
loongarch             randconfig-002-20260328    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                           ip27_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260328    gcc-11.5.0
nios2                 randconfig-002-20260328    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260328    gcc-10.5.0
parisc                randconfig-002-20260328    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                     akebono_defconfig    clang-23
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260328    gcc-10.5.0
powerpc               randconfig-002-20260328    gcc-10.5.0
powerpc64             randconfig-001-20260328    gcc-10.5.0
powerpc64             randconfig-002-20260328    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    clang-23
riscv                 randconfig-001-20260328    clang-23
riscv                 randconfig-002-20260328    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260328    clang-23
s390                  randconfig-002-20260328    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260328    clang-23
sh                    randconfig-002-20260328    clang-23
sh                           se7705_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260328    gcc-14
sparc                 randconfig-002-20260328    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260328    gcc-14
sparc64               randconfig-002-20260328    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260328    gcc-14
um                    randconfig-002-20260328    gcc-14
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260328    clang-20
x86_64      buildonly-randconfig-002-20260328    clang-20
x86_64      buildonly-randconfig-003-20260328    clang-20
x86_64      buildonly-randconfig-004-20260328    clang-20
x86_64      buildonly-randconfig-005-20260328    clang-20
x86_64      buildonly-randconfig-006-20260328    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260328    gcc-14
x86_64                randconfig-002-20260328    gcc-14
x86_64                randconfig-003-20260328    gcc-14
x86_64                randconfig-004-20260328    gcc-14
x86_64                randconfig-005-20260328    gcc-14
x86_64                randconfig-006-20260328    gcc-14
x86_64                randconfig-011-20260328    clang-20
x86_64                randconfig-012-20260328    clang-20
x86_64                randconfig-013-20260328    clang-20
x86_64                randconfig-014-20260328    clang-20
x86_64                randconfig-015-20260328    clang-20
x86_64                randconfig-016-20260328    clang-20
x86_64                randconfig-071-20260328    gcc-12
x86_64                randconfig-072-20260328    gcc-12
x86_64                randconfig-073-20260328    gcc-12
x86_64                randconfig-074-20260328    gcc-12
x86_64                randconfig-075-20260328    gcc-12
x86_64                randconfig-076-20260328    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260328    gcc-14
xtensa                randconfig-002-20260328    gcc-14
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

