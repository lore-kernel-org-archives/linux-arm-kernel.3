Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B98AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 02:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sYJYkpmPWBm2UEadDEqqqCCn9lOdCM3GXz4jIuzRZLk=; b=jyaZBIb6DuxrxYbpfNz9clGYkT
	DQqOeBkRJNlJwiyFObwxXs4uSHORvMFNSw8qRWEU856CROYUoGy1SrTKaaGSmp7ik3njWW3v4Sy5s
	bMa0BwwWPzDfQnZ9O885fEgBgPYzwSbAT/RwoCOXA8e5ZvOg8rCryOhS7RVEIe2WBIwuAO+MnsfRz
	JMzGjI7sHkmuw16lBR3CXKABqM+LLakt2fyiPwYeW+fIWExvX0r762nX/JZfBM8Px+wyrfMumlqB6
	f2Y8jm/kjLG+PcoqDhRspHowA0hdzgBU6dJI/Hzh8sSXijQh0xb4puaBO1qYV//Qv3m0VgjWZMBg0
	uYn8f5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCJG-0000000GJPj-25qi;
	Thu, 16 Jul 2026 02:58:50 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCJE-0000000GJPA-02kQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 02:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784170728; x=1815706728;
  h=date:from:to:cc:subject:message-id;
  bh=ZB/bCEdYpnwBe/qxuDIC6CGMx23DPelnjLLSgpG/c7k=;
  b=kUXMZJp6Y4ojzoKTGU9FZi1ZdZ/WZY9+EAXO4FskOYTQUn3q5l7429VK
   N8qHymiVPRnbb3OoVOc1ouHmavYR+vBARmcR+zrICbDpuObxprd54NAy6
   gMqaW+5QjQYABzaHM8eJ+RETnpWNY9ahRhE7TciPT6hdHDI+r+yY7iPi7
   g5HnxW6iHkVQ1r0mhBq+EsoTJ3+3hVpS3sx5cZuU2EZRvVx3b/T9vfeTr
   0KmEYiEAN5ZJSOY2rQl/IvnQP0BIeT3F8w9eqSiLaYPqPcLbnOxEapb2N
   kwmpsGLtz3jprXfu9davvilZj6OPevCJhPPI2sT7q0fFpG6iRaGO6IEl/
   g==;
X-CSE-ConnectionGUID: H6uvaKBpTXS6ZEBUJpufhQ==
X-CSE-MsgGUID: x9TLj/nXSYqPmyZr8aAXag==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84704385"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84704385"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:58:46 -0700
X-CSE-ConnectionGUID: bUKzCJufRrauAAbYSEGbXQ==
X-CSE-MsgGUID: AE+tnE6fRBieZjOF8uRprA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="252958925"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jul 2026 19:58:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkCJ8-00000000OFW-1URJ;
	Thu, 16 Jul 2026 02:58:42 +0000
Date: Thu, 16 Jul 2026 10:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 809177dbf32e3c649abcd027334dbcfe34720446
Message-ID: <202607161026.fYBwQEiN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_195848_109571_2040D9E7 
X-CRM114-Status: UNSURE (   4.98  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
branch HEAD: 809177dbf32e3c649abcd027334dbcfe34720446  Merge tag 'arm-feature-deprecation-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc into soc/arm

elapsed time: 722m

configs tested: 140
configs skipped: 210

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260716    clang-23
arc                   randconfig-002-20260716    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260716    clang-23
arm                   randconfig-002-20260716    clang-23
arm                   randconfig-003-20260716    clang-23
arm                   randconfig-004-20260716    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260716    gcc-12.5.0
arm64                 randconfig-002-20260716    gcc-12.5.0
arm64                 randconfig-003-20260716    gcc-12.5.0
arm64                 randconfig-004-20260716    gcc-12.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260716    gcc-12.5.0
csky                  randconfig-002-20260716    gcc-12.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260716    clang-20
hexagon               randconfig-002-20260716    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260716    clang-22
i386                  randconfig-002-20260716    clang-22
i386                  randconfig-003-20260716    clang-22
i386                  randconfig-004-20260716    clang-22
i386                  randconfig-005-20260716    clang-22
i386                  randconfig-006-20260716    clang-22
i386                  randconfig-007-20260716    clang-22
i386                  randconfig-011-20260716    clang-22
i386                  randconfig-012-20260716    clang-22
i386                  randconfig-013-20260716    clang-22
i386                  randconfig-014-20260716    clang-22
i386                  randconfig-015-20260716    clang-22
i386                  randconfig-016-20260716    clang-22
i386                  randconfig-017-20260716    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260716    clang-20
loongarch             randconfig-002-20260716    clang-20
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260716    clang-20
nios2                 randconfig-002-20260716    clang-20
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                randconfig-001-20260716    clang-19
parisc                randconfig-002-20260716    clang-19
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260716    clang-19
powerpc               randconfig-002-20260716    clang-19
powerpc64             randconfig-001-20260716    clang-19
powerpc64             randconfig-002-20260716    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                 randconfig-001-20260716    clang-17
riscv                 randconfig-002-20260716    clang-17
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                  randconfig-001-20260716    clang-17
s390                  randconfig-002-20260716    clang-17
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                    randconfig-001-20260716    clang-17
sh                    randconfig-002-20260716    clang-17
sparc                             allnoconfig    clang-23
sparc                 randconfig-001-20260716    gcc-13.4.0
sparc                 randconfig-002-20260716    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64               randconfig-001-20260716    gcc-13.4.0
sparc64               randconfig-002-20260716    gcc-13.4.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                    randconfig-001-20260716    gcc-13.4.0
um                    randconfig-002-20260716    gcc-13.4.0
x86_64                            allnoconfig    clang-23
x86_64      buildonly-randconfig-001-20260716    gcc-14
x86_64      buildonly-randconfig-002-20260716    gcc-14
x86_64      buildonly-randconfig-003-20260716    gcc-14
x86_64      buildonly-randconfig-004-20260716    gcc-14
x86_64      buildonly-randconfig-005-20260716    gcc-14
x86_64      buildonly-randconfig-006-20260716    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260716    clang-22
x86_64                randconfig-002-20260716    clang-22
x86_64                randconfig-003-20260716    clang-22
x86_64                randconfig-004-20260716    clang-22
x86_64                randconfig-005-20260716    clang-22
x86_64                randconfig-006-20260716    clang-22
x86_64                randconfig-013-20260716    gcc-14
x86_64                randconfig-016-20260716    gcc-14
x86_64                randconfig-074-20260716    gcc-14
x86_64                randconfig-076-20260716    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260716    gcc-13.4.0
xtensa                randconfig-002-20260716    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

