Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83905CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xEbuPokphWIs+4h5DDd7NjYQ9fkkhFYcg7pziBj9im4=; b=ZSyvcfIPdtLNhf5UBcLWFQ7RX/
	TBbCKXmNxgdZ+EPyw+Ad2McxUtR4CHEeqvUNI4pQHq+ULu4dq6tLaYLhpqfwYzacyK1ojsrfl2mNp
	MRqgPjt340+1Vvd1nllUIblvRdZYobFJXcSJTZKgEz9HHrSCwJoJ+B1s/ymTzUKPFA1YPzPmvkQnB
	rpXuqgfbdUxxp1KNXG43B4TeUbNgQ4n/lCrGi6Okhc0uvMIloODsMWrIfD3Rk2Q1mpEFOs0z7IlvS
	Tggi6PqnaltPC0H3q8XxtXAYLQcQlwhBeT4GNEwXMMvq1usxmXR7URZIlP5kVTLZCa1i7ua9A7Sii
	1Ac8H5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA8d3-0000000A3hg-1918;
	Sat, 18 Oct 2025 15:13:57 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA8d0-0000000A3h1-2aUs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 15:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760800434; x=1792336434;
  h=date:from:to:cc:subject:message-id;
  bh=gnH1Sr9cbu6LcW48xStbmYfNalhmUaWXn1+A60iE4Hs=;
  b=mp4oFuqSg3Hhfd7cu4QilJvBHRRTRN8LiLjbsWC/aAzC77hQgfANiAwh
   z7w6JQ0CD+i9EMMgNI4t6pkfLGyCW+KW7KS039v4qbARF9dOi7jrnlFNf
   Ligxirw7IZZuS3vlMbaRh/dNeJXdeUeGED7ZSPB5A+a3edz4W6lHsKdPp
   45+AE97U2UQLgpCm6lwmV6tfhicjT3apn/23jUgc1QMx44JzEd1/PqNKZ
   1Zlc0J15JDYQnJhe6BkumQkbjJS06uSdPVBx9HQUKujFxvRxVhxzfYGep
   Jx6mS9JotVf8H8BXJRIo/QfCJ1Utl7UaXZnli97ddCSvMVFroGcaLxhy7
   A==;
X-CSE-ConnectionGUID: fYPnvMghSu6JvefMlOBhIQ==
X-CSE-MsgGUID: SP54vQ2dRAmOf1CGTpNA2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62203082"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="62203082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 08:13:49 -0700
X-CSE-ConnectionGUID: pZqtSsOuSnGiyY4zECHkXw==
X-CSE-MsgGUID: Ffv8fkV1RRekAWOM0Y+dhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="213579659"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2025 08:13:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA8cq-0008MQ-2e;
	Sat, 18 Oct 2025 15:13:44 +0000
Date: Sat, 18 Oct 2025 23:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 3573844359bbcd5e83d6a61f15b9cec4730d4ad3
Message-ID: <202510182308.PFMfZxYn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_081354_696723_541A5E35 
X-CRM114-Status: UNSURE (   5.59  )
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
branch HEAD: 3573844359bbcd5e83d6a61f15b9cec4730d4ad3  soc: officially expand maintainership team

elapsed time: 1454m

configs tested: 177
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                        nsimosci_defconfig    clang-22
arc                   randconfig-001-20251018    clang-22
arc                   randconfig-001-20251018    gcc-12.5.0
arc                   randconfig-002-20251018    clang-22
arc                   randconfig-002-20251018    gcc-8.5.0
arm                              alldefconfig    clang-22
arm                               allnoconfig    clang-22
arm                       aspeed_g4_defconfig    clang-22
arm                   randconfig-001-20251018    clang-19
arm                   randconfig-001-20251018    clang-22
arm                   randconfig-002-20251018    clang-20
arm                   randconfig-002-20251018    clang-22
arm                   randconfig-003-20251018    clang-22
arm                   randconfig-004-20251018    clang-22
arm                   randconfig-004-20251018    gcc-15.1.0
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251018    clang-22
arm64                 randconfig-001-20251018    gcc-8.5.0
arm64                 randconfig-002-20251018    clang-22
arm64                 randconfig-003-20251018    clang-22
arm64                 randconfig-003-20251018    gcc-13.4.0
arm64                 randconfig-004-20251018    clang-22
arm64                 randconfig-004-20251018    gcc-11.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251018    gcc-12.5.0
csky                  randconfig-001-20251018    gcc-9.5.0
csky                  randconfig-002-20251018    gcc-12.5.0
csky                  randconfig-002-20251018    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251018    clang-22
hexagon               randconfig-001-20251018    gcc-12.5.0
hexagon               randconfig-002-20251018    clang-22
hexagon               randconfig-002-20251018    gcc-12.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251018    clang-20
i386        buildonly-randconfig-001-20251018    gcc-14
i386        buildonly-randconfig-002-20251018    clang-20
i386        buildonly-randconfig-002-20251018    gcc-14
i386        buildonly-randconfig-003-20251018    clang-20
i386        buildonly-randconfig-004-20251018    clang-20
i386        buildonly-randconfig-004-20251018    gcc-14
i386        buildonly-randconfig-005-20251018    clang-20
i386        buildonly-randconfig-006-20251018    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251018    gcc-14
i386                  randconfig-002-20251018    gcc-14
i386                  randconfig-003-20251018    gcc-14
i386                  randconfig-004-20251018    gcc-14
i386                  randconfig-005-20251018    gcc-14
i386                  randconfig-006-20251018    gcc-14
i386                  randconfig-007-20251018    gcc-14
i386                  randconfig-011-20251018    clang-20
i386                  randconfig-012-20251018    clang-20
i386                  randconfig-013-20251018    clang-20
i386                  randconfig-014-20251018    clang-20
i386                  randconfig-015-20251018    clang-20
i386                  randconfig-016-20251018    clang-20
i386                  randconfig-017-20251018    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251018    clang-22
loongarch             randconfig-001-20251018    gcc-12.5.0
loongarch             randconfig-002-20251018    gcc-12.5.0
loongarch             randconfig-002-20251018    gcc-13.4.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    clang-22
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251018    gcc-11.5.0
nios2                 randconfig-001-20251018    gcc-12.5.0
nios2                 randconfig-002-20251018    gcc-12.5.0
nios2                 randconfig-002-20251018    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251018    gcc-10.5.0
parisc                randconfig-001-20251018    gcc-12.5.0
parisc                randconfig-002-20251018    gcc-12.5.0
parisc                randconfig-002-20251018    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       holly_defconfig    clang-22
powerpc               randconfig-001-20251018    clang-22
powerpc               randconfig-001-20251018    gcc-12.5.0
powerpc               randconfig-002-20251018    clang-22
powerpc               randconfig-002-20251018    gcc-12.5.0
powerpc               randconfig-003-20251018    gcc-12.5.0
powerpc               randconfig-003-20251018    gcc-14.3.0
powerpc                     tqm8555_defconfig    clang-22
powerpc                 xes_mpc85xx_defconfig    clang-22
powerpc64             randconfig-001-20251018    gcc-10.5.0
powerpc64             randconfig-001-20251018    gcc-12.5.0
powerpc64             randconfig-002-20251018    gcc-12.5.0
powerpc64             randconfig-003-20251018    clang-22
powerpc64             randconfig-003-20251018    gcc-12.5.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251018    gcc-8.5.0
riscv                 randconfig-002-20251018    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-002-20251018    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20251018    gcc-13.4.0
sh                    randconfig-002-20251018    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251018    gcc-11.5.0
sparc                 randconfig-002-20251018    gcc-13.4.0
sparc64               randconfig-001-20251018    gcc-8.5.0
sparc64               randconfig-002-20251018    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251018    gcc-14
um                    randconfig-002-20251018    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251018    clang-20
x86_64      buildonly-randconfig-001-20251018    gcc-14
x86_64      buildonly-randconfig-002-20251018    clang-20
x86_64      buildonly-randconfig-002-20251018    gcc-14
x86_64      buildonly-randconfig-003-20251018    clang-20
x86_64      buildonly-randconfig-003-20251018    gcc-14
x86_64      buildonly-randconfig-004-20251018    clang-20
x86_64      buildonly-randconfig-004-20251018    gcc-14
x86_64      buildonly-randconfig-005-20251018    clang-20
x86_64      buildonly-randconfig-005-20251018    gcc-14
x86_64      buildonly-randconfig-006-20251018    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251018    clang-20
x86_64                randconfig-072-20251018    clang-20
x86_64                randconfig-073-20251018    clang-20
x86_64                randconfig-074-20251018    clang-20
x86_64                randconfig-075-20251018    clang-20
x86_64                randconfig-076-20251018    clang-20
x86_64                randconfig-077-20251018    clang-20
x86_64                randconfig-078-20251018    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    clang-22
xtensa                randconfig-002-20251018    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

