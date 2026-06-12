Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F44CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KSp1lJVb/Jym05DqWCaKkX4UHP+Mdq65/YqSgbJzXmY=; b=wfrqo+IMXOuMUemLLx+t7mxKkG
	mHp0IuJIWdSoQ6GGkQKZe1XID8w7o0Otf/HTeIhb0/Y/EETAmnHEIfFATIyDfM2c8gPNfIeMaBMQF
	OjjMf4hqAk3OCdeE37QOvET98vfp0Fc5kZYFyZHTSyzMXDJ7Bs5YyfIkjLJZ8Y/YaOsAJwQNcnoFw
	SGWXpn2sto3651xdb5uHGtv3man3dXFdTmaGUI+maWf10rJ5XxlvMIcv73PMJOaGBD45GZzdfJRjS
	ewEwgq+uDQo4PbO0XYJPRmg3pVMr+mAmCAp8MCb1RSe2d9KIt+1wBFJYM6FJOZwVsDO1PFf5pCB7b
	T8ul6JuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9Ey-0000000BbAH-2HzO;
	Fri, 12 Jun 2026 21:16:36 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9Ev-0000000Bb9s-0VzR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 21:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298993; x=1812834993;
  h=date:from:to:cc:subject:message-id;
  bh=VCBILet7RE3d6UjT3ni4oa+N35GvMJqhgGcXkIStp5g=;
  b=RO/gi+de00lJ/JTxUa6HlJuYfcvxqRclo053+S0pwsUQ/ifz/zsYIBmv
   OnZCkHB5qv9xOm8eiS9kStM/HMRsLhTdOwoJOlCAIqr0QAMlonJ6FArxV
   LdxRF4Y+ubfn21DiLsIPynu2YyNLiQSaF02I5sC/iSMv0Ut7QTpOxOSwq
   kz/C8eBhDyfrqD+lnNxEl0QQOXxAx80DUhGua2S5mJ6Bc6rxOJNrxeyQn
   AA0VoZfV37ktfwNW3rE0n+BmxiL7UBLudQGjUkCxzoi7R5Kv+zF+7ljjT
   rZo6hkJ3YOYyr8a6Yc8ClmPAFJljhrMESUUG4dWW46FqOB8i2Dta41/HD
   g==;
X-CSE-ConnectionGUID: mnU3gmCkQ6mOiXmBMQ1h0w==
X-CSE-MsgGUID: GajURiGhTVSnaCJwps9TGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82123361"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82123361"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:16:32 -0700
X-CSE-ConnectionGUID: kCu+ocYvTh2FzZCimkyWIg==
X-CSE-MsgGUID: wbuJZmWpS0GbVSCETcyo/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="270967455"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jun 2026 14:16:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY9Eq-00000000PKr-1PPq;
	Fri, 12 Jun 2026 21:16:28 +0000
Date: Sat, 13 Jun 2026 05:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Gordon Ge <gordon.ge@bst.ai>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:bst/defconfig] BUILD SUCCESS
 22ca5df7c9d25077e44e33fb5751583aa79ee21a
Message-ID: <202606130550.YvuS8ZuR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_141633_213493_7E235D9A 
X-CRM114-Status: UNSURE (   5.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git bst/defconfig
branch HEAD: 22ca5df7c9d25077e44e33fb5751583aa79ee21a  arm64: defconfig: enable BST SDHCI controller

elapsed time: 825m

configs tested: 241
configs skipped: 177

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
arc                   randconfig-001-20260612    gcc-13.4.0
arc                   randconfig-002-20260612    gcc-13.4.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                         axm55xx_defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260612    gcc-13.4.0
arm                   randconfig-002-20260612    gcc-13.4.0
arm                   randconfig-003-20260612    gcc-13.4.0
arm                   randconfig-004-20260612    gcc-13.4.0
arm                       spear13xx_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260612    gcc-13.4.0
arm64                 randconfig-002-20260612    gcc-13.4.0
arm64                 randconfig-003-20260612    gcc-13.4.0
arm64                 randconfig-004-20260612    gcc-13.4.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260612    gcc-13.4.0
csky                  randconfig-002-20260612    gcc-13.4.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260612    clang-23
hexagon               randconfig-001-20260612    gcc-11.5.0
hexagon               randconfig-001-20260613    clang-23
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260612    clang-23
hexagon               randconfig-002-20260612    gcc-11.5.0
hexagon               randconfig-002-20260613    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260612    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260612    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260612    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260612    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260612    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260612    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260612    clang-22
i386                  randconfig-001-20260613    clang-22
i386                  randconfig-002-20260612    clang-22
i386                  randconfig-002-20260613    clang-22
i386                  randconfig-003-20260612    clang-22
i386                  randconfig-003-20260613    clang-22
i386                  randconfig-004-20260612    clang-22
i386                  randconfig-004-20260613    clang-22
i386                  randconfig-005-20260612    clang-22
i386                  randconfig-005-20260613    clang-22
i386                  randconfig-006-20260612    clang-22
i386                  randconfig-006-20260613    clang-22
i386                  randconfig-007-20260612    clang-22
i386                  randconfig-007-20260613    clang-22
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260612    clang-22
i386                  randconfig-011-20260613    gcc-14
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260612    clang-22
i386                  randconfig-012-20260613    gcc-14
i386                           randconfig-013    clang-22
i386                  randconfig-013-20260612    clang-22
i386                  randconfig-013-20260613    gcc-14
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260612    clang-22
i386                  randconfig-014-20260613    gcc-14
i386                           randconfig-015    clang-22
i386                  randconfig-015-20260612    clang-22
i386                  randconfig-015-20260613    gcc-14
i386                           randconfig-016    clang-22
i386                  randconfig-016-20260612    clang-22
i386                  randconfig-016-20260613    gcc-14
i386                           randconfig-017    clang-22
i386                  randconfig-017-20260612    clang-22
i386                  randconfig-017-20260613    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260612    clang-23
loongarch             randconfig-001-20260612    gcc-11.5.0
loongarch             randconfig-001-20260613    clang-23
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260612    clang-23
loongarch             randconfig-002-20260612    gcc-11.5.0
loongarch             randconfig-002-20260613    clang-23
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
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260612    clang-23
nios2                 randconfig-001-20260612    gcc-11.5.0
nios2                 randconfig-001-20260613    clang-23
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260612    clang-23
nios2                 randconfig-002-20260612    gcc-11.5.0
nios2                 randconfig-002-20260613    clang-23
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-23
parisc                              defconfig    gcc-16.1.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                  mpc885_ads_defconfig    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-11.5.0
riscv                 randconfig-001-20260612    gcc-11.5.0
riscv                 randconfig-001-20260613    gcc-10.5.0
riscv                          randconfig-002    gcc-11.5.0
riscv                 randconfig-002-20260612    gcc-11.5.0
riscv                 randconfig-002-20260613    gcc-10.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260612    gcc-11.5.0
s390                  randconfig-001-20260613    gcc-10.5.0
s390                           randconfig-002    gcc-11.5.0
s390                  randconfig-002-20260612    gcc-11.5.0
s390                  randconfig-002-20260613    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-23
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-11.5.0
sh                    randconfig-001-20260612    gcc-11.5.0
sh                    randconfig-001-20260613    gcc-10.5.0
sh                             randconfig-002    gcc-11.5.0
sh                    randconfig-002-20260612    gcc-11.5.0
sh                    randconfig-002-20260613    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260612    gcc-8.5.0
sparc                 randconfig-001-20260613    gcc-13.4.0
sparc                 randconfig-002-20260612    gcc-8.5.0
sparc                 randconfig-002-20260613    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260612    gcc-8.5.0
sparc64               randconfig-001-20260613    gcc-13.4.0
sparc64               randconfig-002-20260612    gcc-8.5.0
sparc64               randconfig-002-20260613    gcc-13.4.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260612    gcc-8.5.0
um                    randconfig-001-20260613    gcc-13.4.0
um                    randconfig-002-20260612    gcc-8.5.0
um                    randconfig-002-20260613    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260612    gcc-14
x86_64      buildonly-randconfig-002-20260612    gcc-14
x86_64      buildonly-randconfig-003-20260612    gcc-14
x86_64      buildonly-randconfig-004-20260612    gcc-14
x86_64      buildonly-randconfig-005-20260612    gcc-14
x86_64      buildonly-randconfig-006-20260612    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260612    clang-22
x86_64                randconfig-002-20260612    clang-22
x86_64                randconfig-003-20260612    clang-22
x86_64                randconfig-004-20260612    clang-22
x86_64                randconfig-005-20260612    clang-22
x86_64                randconfig-006-20260612    clang-22
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260612    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260612    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260612    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260612    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260612    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260612    clang-22
x86_64                randconfig-071-20260612    gcc-14
x86_64                randconfig-071-20260613    clang-22
x86_64                randconfig-072-20260612    gcc-14
x86_64                randconfig-072-20260613    clang-22
x86_64                randconfig-073-20260612    gcc-14
x86_64                randconfig-073-20260613    clang-22
x86_64                randconfig-074-20260612    gcc-14
x86_64                randconfig-074-20260613    clang-22
x86_64                randconfig-075-20260612    gcc-14
x86_64                randconfig-075-20260613    clang-22
x86_64                randconfig-076-20260612    gcc-14
x86_64                randconfig-076-20260613    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260612    gcc-8.5.0
xtensa                randconfig-001-20260613    gcc-13.4.0
xtensa                randconfig-002-20260612    gcc-8.5.0
xtensa                randconfig-002-20260613    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

