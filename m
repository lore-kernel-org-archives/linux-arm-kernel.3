Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028CFCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 00:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V7Jdj8lclIW7/vqvsi4esQ5YJcV1EWSfDiIMDkGwcTY=; b=10ghjgMMT3kZ2CLBTHEvuxlSup
	+RFMs5AOidRD+8xny/T0bUjANTBYEhQDcuWkdaVR6wNF0QB1gYkmbgASOb2XEX4L16b/b+0eYMkCc
	Tho9DAk6PN9Kf7mlXfynv3vexxA5O1kHxHStwE2Mgy4LTpMC0OkwPofbB/JEqCw2mSp1I26mCxesg
	F2/n930UcHgwH9fXJvIU9SJXmwdycGJLfRBKJ2P1zEVETLy5icSnUaptLnX8ocJthAtoFd3LKY/X5
	SXn7appkcdptuGm24tepteAqZau9fH5bQz+2EFOG9h4RGeMsyYfhvxvAjpkzGtuQLrQvxo2uprMpf
	Ul2hG1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL9G3-00000005ELb-2D1N;
	Fri, 08 May 2026 00:39:59 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL9G0-00000005EKb-4AnE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 00:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778200797; x=1809736797;
  h=date:from:to:cc:subject:message-id;
  bh=j2MXSxKg/ZSu96iDWiyueLrcNMcv4EVTBhOaldvxxAU=;
  b=YI1wHrbuymcfl2U9xNs4oRxAV6SVlpQZo0WhWDTo0QzqcdN/44GT4Qkd
   jjanvmRb0WvRpBLhZeeL6aPI/i6hnSe339e6arZQvyHjbkWfY3svtfkLi
   vJGmtticUQLz4rwG3PM+BaImVYK0QshLUh6VStVnGSpqsn81JBeJYeZ9L
   DS1uYQn8J4rBr4sN7Idc+TrB+1bOw0Tz29CXUhfoZL8QJf6gVdSFUMzvT
   ryc/J7uq4x8U8o5OeG0HKT1yjpRLmXkCAGEyg1rQ7QYSptoNayph1rJ4l
   pLEyIrRaHkscB0n3byusEYbbW69Q3u+jV7AZr0qlk+jlqeWUNqvMiJsN6
   g==;
X-CSE-ConnectionGUID: qT43Ok6UQ1GnIwIyW8KJ7A==
X-CSE-MsgGUID: 2grjE4UzQP2nNkqnHEfOCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79208238"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79208238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 17:39:55 -0700
X-CSE-ConnectionGUID: N/0anUZfTqO7O4M06fIUfQ==
X-CSE-MsgGUID: BOYJ4BOWRvmurUxEBVUcfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="233565013"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2026 17:39:54 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL9Fv-000000000eb-153h;
	Fri, 08 May 2026 00:39:51 +0000
Date: Fri, 08 May 2026 08:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 d2ab44b9ecf4ff4be22025c5f6f5cf4723403a66
Message-ID: <202605080832.RqjU35IN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_173957_079780_4F3B919A 
X-CRM114-Status: UNSURE (   5.72  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: d2ab44b9ecf4ff4be22025c5f6f5cf4723403a66  ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr

elapsed time: 721m

configs tested: 156
configs skipped: 149

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260508    gcc-14.3.0
arm64                 randconfig-002-20260508    gcc-14.3.0
arm64                 randconfig-003-20260508    gcc-14.3.0
arm64                 randconfig-004-20260508    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260508    gcc-14.3.0
csky                  randconfig-002-20260508    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260507    clang-20
i386        buildonly-randconfig-001-20260508    gcc-14
i386        buildonly-randconfig-002-20260507    clang-20
i386        buildonly-randconfig-002-20260508    gcc-14
i386        buildonly-randconfig-003-20260507    clang-20
i386        buildonly-randconfig-003-20260508    gcc-14
i386        buildonly-randconfig-004-20260507    clang-20
i386        buildonly-randconfig-004-20260508    gcc-14
i386        buildonly-randconfig-005-20260507    clang-20
i386        buildonly-randconfig-005-20260508    gcc-14
i386        buildonly-randconfig-006-20260507    clang-20
i386        buildonly-randconfig-006-20260508    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260507    gcc-14
i386                  randconfig-001-20260508    gcc-14
i386                  randconfig-002-20260507    gcc-14
i386                  randconfig-002-20260508    gcc-14
i386                  randconfig-003-20260507    gcc-14
i386                  randconfig-003-20260508    gcc-14
i386                  randconfig-004-20260507    gcc-14
i386                  randconfig-004-20260508    gcc-14
i386                  randconfig-005-20260507    gcc-14
i386                  randconfig-005-20260508    gcc-14
i386                  randconfig-006-20260507    gcc-14
i386                  randconfig-006-20260508    gcc-14
i386                  randconfig-007-20260507    gcc-14
i386                  randconfig-007-20260508    gcc-14
i386                  randconfig-011-20260507    clang-20
i386                  randconfig-012-20260507    clang-20
i386                  randconfig-013-20260507    clang-20
i386                  randconfig-014-20260507    clang-20
i386                  randconfig-015-20260507    clang-20
i386                  randconfig-016-20260507    clang-20
i386                  randconfig-017-20260507    clang-20
loongarch                        allmodconfig    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
microblaze                       allyesconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260507    gcc-8.5.0
parisc                randconfig-001-20260508    gcc-9.5.0
parisc                randconfig-002-20260507    gcc-8.5.0
parisc                randconfig-002-20260508    gcc-9.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260507    gcc-8.5.0
powerpc               randconfig-001-20260508    gcc-9.5.0
powerpc               randconfig-002-20260507    gcc-8.5.0
powerpc               randconfig-002-20260508    gcc-9.5.0
powerpc64             randconfig-001-20260507    gcc-8.5.0
powerpc64             randconfig-001-20260508    gcc-9.5.0
powerpc64             randconfig-002-20260507    gcc-8.5.0
powerpc64             randconfig-002-20260508    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260507    gcc-12.5.0
sparc                 randconfig-002-20260507    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64               randconfig-001-20260507    gcc-12.5.0
sparc64               randconfig-002-20260507    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                    randconfig-001-20260507    gcc-12.5.0
um                    randconfig-002-20260507    gcc-12.5.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260507    clang-20
x86_64      buildonly-randconfig-002-20260507    clang-20
x86_64      buildonly-randconfig-003-20260507    clang-20
x86_64      buildonly-randconfig-004-20260507    clang-20
x86_64      buildonly-randconfig-005-20260507    clang-20
x86_64      buildonly-randconfig-006-20260507    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260507    gcc-14
x86_64                randconfig-001-20260508    clang-20
x86_64                randconfig-002-20260507    gcc-14
x86_64                randconfig-002-20260508    clang-20
x86_64                randconfig-003-20260507    gcc-14
x86_64                randconfig-003-20260508    clang-20
x86_64                randconfig-004-20260507    gcc-14
x86_64                randconfig-004-20260508    clang-20
x86_64                randconfig-005-20260507    gcc-14
x86_64                randconfig-005-20260508    clang-20
x86_64                randconfig-006-20260507    gcc-14
x86_64                randconfig-006-20260508    clang-20
x86_64                randconfig-011-20260507    gcc-14
x86_64                randconfig-012-20260507    gcc-14
x86_64                randconfig-013-20260507    gcc-14
x86_64                randconfig-014-20260507    gcc-14
x86_64                randconfig-015-20260507    gcc-14
x86_64                randconfig-016-20260507    gcc-14
x86_64                randconfig-071-20260507    clang-20
x86_64                randconfig-072-20260507    clang-20
x86_64                randconfig-073-20260507    clang-20
x86_64                randconfig-074-20260507    clang-20
x86_64                randconfig-075-20260507    clang-20
x86_64                randconfig-076-20260507    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260507    gcc-12.5.0
xtensa                randconfig-002-20260507    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

