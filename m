Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DFACD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 23:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EDipdtlZIaqT2eNKhI+3sO2j9XiOwxME3/geKe34H8I=; b=gh4l6Me9KHS+C0dfjN9t0PdZyX
	27E00roWBIQ1JQLbeDTUwU4YqGwS3FncqAxpKzgDLdbfRxCYCeavIR8PUbmW8SHvv5ehDI0gNQYom
	ovpX9+jcxHqYbC0n2ROC3JeosIbEIIaS0gPR0T3zt00zGO4NhzWcaVyJsqsTJ2s/4UzimL77pYOLg
	hESZ+KzTgaAQeqVGw91JVfWdGJtWXNkzWnwTXyVIHMh9C1D4zx1OOM4ccyFnJqLypOXE+An9fQX2h
	gNARkixrr6EQnfG451itWOcaDkdd4g33gGKI61AehKaxSj1xURLaPIw+/5pQQEqMRE42Utijk6FC2
	Ri2DgQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5sk-00000006VdS-3nwl;
	Tue, 09 Jun 2026 23:29:18 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5sh-00000006Vd6-3c7w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 23:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781047756; x=1812583756;
  h=date:from:to:cc:subject:message-id;
  bh=UIRnAMmfJjpTm8NXajmWOsRKm2QOIThMlGhT68Sjgog=;
  b=UpWWV0F+DGht2wJqLMsJjNAEnZ1haw6Z8Xqa5OUxhI2SrI85/fmTdykm
   +RQQWlv/nBG4brdXkK0M3Hks6yNK8QwLtGQEaYnLiOIoseaTU57SvBl73
   IjQBGXE6lTmFvuUa8OvV5gcWdi7SOrxgh/mscmSa9mZcwTqx2X6nNA1Qx
   Ts+X2oQ95H3r/a9rtPzPZ/ns5ZPOyZXqLk17CZvUovuxvtzb638KJUHf9
   oOHIgLA3s0bGrK6GsKta6mOAu1rJB7xIhlTHyEeuD1agssuXqb+F3OMtV
   GVWCoris1HDGmgi9UvZwUVRK/CKrpwFWQ8INl6L6H+ojKBaquNUUaO3re
   A==;
X-CSE-ConnectionGUID: 3Tw7B7w/R0KNVxvYscwnBw==
X-CSE-MsgGUID: 8VLhFDD+TiOQWarNEr2wHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92936248"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92936248"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 16:29:15 -0700
X-CSE-ConnectionGUID: Y4ZBB+oORASzf0wE1uTBRg==
X-CSE-MsgGUID: qnDL8DIBRhOn5v3g/+lu2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245153584"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2026 16:29:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX5sc-00000000KfS-3vN3;
	Tue, 09 Jun 2026 23:29:10 +0000
Date: Wed, 10 Jun 2026 07:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:imx/soc] BUILD SUCCESS
 ccb4b54b8ecf1ebafef96d538cd6c5c8455bb390
Message-ID: <202606100711.EY16CQMN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_162915_962344_03427944 
X-CRM114-Status: UNSURE (   5.28  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git imx/soc
branch HEAD: ccb4b54b8ecf1ebafef96d538cd6c5c8455bb390  ARM: imx31: Fix IIM mapping leak in revision check

elapsed time: 11559m

configs tested: 266
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                          axs101_defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260609    gcc-15.2.0
arc                   randconfig-001-20260610    gcc-8.5.0
arc                   randconfig-002-20260609    gcc-13.4.0
arc                   randconfig-002-20260610    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260609    gcc-13.4.0
arm                   randconfig-001-20260610    gcc-8.5.0
arm                   randconfig-002-20260609    clang-23
arm                   randconfig-002-20260610    gcc-8.5.0
arm                   randconfig-003-20260609    clang-23
arm                   randconfig-003-20260610    gcc-8.5.0
arm                   randconfig-004-20260609    clang-23
arm                   randconfig-004-20260610    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260609    clang-23
arm64                 randconfig-001-20260610    gcc-11.5.0
arm64                 randconfig-002-20260609    gcc-13.4.0
arm64                 randconfig-002-20260610    gcc-11.5.0
arm64                 randconfig-003-20260609    gcc-15.2.0
arm64                 randconfig-003-20260610    gcc-11.5.0
arm64                 randconfig-004-20260609    clang-23
arm64                 randconfig-004-20260610    gcc-11.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260609    gcc-9.5.0
csky                  randconfig-001-20260610    gcc-11.5.0
csky                  randconfig-002-20260609    gcc-11.5.0
csky                  randconfig-002-20260610    gcc-11.5.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260609    clang-18
hexagon               randconfig-002-20260609    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260609    gcc-14
i386        buildonly-randconfig-001-20260610    gcc-14
i386        buildonly-randconfig-002-20260609    gcc-14
i386        buildonly-randconfig-002-20260610    gcc-14
i386        buildonly-randconfig-003-20260609    clang-22
i386        buildonly-randconfig-003-20260610    gcc-14
i386        buildonly-randconfig-004-20260609    clang-22
i386        buildonly-randconfig-004-20260610    gcc-14
i386        buildonly-randconfig-005-20260609    gcc-14
i386        buildonly-randconfig-005-20260610    gcc-14
i386        buildonly-randconfig-006-20260609    clang-22
i386        buildonly-randconfig-006-20260610    gcc-14
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260609    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260609    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260609    gcc-14
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260609    clang-22
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260609    clang-22
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260609    clang-22
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260609    gcc-14
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260609    clang-22
i386                  randconfig-011-20260610    gcc-14
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260609    clang-22
i386                  randconfig-012-20260610    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260609    clang-22
i386                  randconfig-013-20260610    gcc-14
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260609    gcc-14
i386                  randconfig-014-20260610    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260609    clang-22
i386                  randconfig-015-20260610    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260609    clang-22
i386                  randconfig-016-20260610    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260609    gcc-14
i386                  randconfig-017-20260610    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260609    clang-23
loongarch             randconfig-002-20260609    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260609    gcc-11.5.0
nios2                 randconfig-002-20260609    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-23
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260609    gcc-14.3.0
parisc                randconfig-001-20260610    gcc-8.5.0
parisc                randconfig-002-20260609    gcc-16.1.0
parisc                randconfig-002-20260610    gcc-8.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260609    clang-23
powerpc               randconfig-001-20260610    gcc-8.5.0
powerpc               randconfig-002-20260609    clang-23
powerpc               randconfig-002-20260610    gcc-8.5.0
powerpc64             randconfig-001-20260609    gcc-8.5.0
powerpc64             randconfig-001-20260610    gcc-8.5.0
powerpc64             randconfig-002-20260609    gcc-13.4.0
powerpc64             randconfig-002-20260610    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260609    clang-23
riscv                 randconfig-001-20260610    gcc-16.1.0
riscv                 randconfig-002-20260609    clang-23
riscv                 randconfig-002-20260610    gcc-16.1.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260609    clang-23
s390                  randconfig-001-20260610    gcc-16.1.0
s390                  randconfig-002-20260609    gcc-16.1.0
s390                  randconfig-002-20260610    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-23
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                 kfr2r09-romimage_defconfig    gcc-16.1.0
sh                    randconfig-001-20260609    gcc-13.4.0
sh                    randconfig-001-20260610    gcc-16.1.0
sh                    randconfig-002-20260609    gcc-11.5.0
sh                    randconfig-002-20260610    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260609    gcc-16.1.0
sparc                 randconfig-001-20260610    gcc-14.3.0
sparc                 randconfig-002-20260609    gcc-16.1.0
sparc                 randconfig-002-20260610    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260609    clang-23
sparc64               randconfig-001-20260610    gcc-14.3.0
sparc64               randconfig-002-20260609    gcc-10.5.0
sparc64               randconfig-002-20260610    gcc-14.3.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260609    gcc-14
um                    randconfig-001-20260610    gcc-14.3.0
um                    randconfig-002-20260609    gcc-12
um                    randconfig-002-20260610    gcc-14.3.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260610    gcc-14
x86_64      buildonly-randconfig-002-20260610    gcc-14
x86_64      buildonly-randconfig-003-20260610    gcc-14
x86_64      buildonly-randconfig-004-20260610    gcc-14
x86_64      buildonly-randconfig-005-20260610    gcc-14
x86_64      buildonly-randconfig-006-20260610    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260609    gcc-14
x86_64                randconfig-002-20260609    clang-22
x86_64                randconfig-003-20260609    gcc-14
x86_64                randconfig-004-20260609    clang-22
x86_64                randconfig-005-20260609    clang-22
x86_64                randconfig-006-20260609    clang-22
x86_64                randconfig-011-20260609    gcc-14
x86_64                randconfig-011-20260610    gcc-14
x86_64                randconfig-012-20260609    clang-22
x86_64                randconfig-012-20260610    gcc-14
x86_64                randconfig-013-20260609    gcc-14
x86_64                randconfig-013-20260610    gcc-14
x86_64                randconfig-014-20260609    gcc-14
x86_64                randconfig-014-20260610    gcc-14
x86_64                randconfig-015-20260609    clang-22
x86_64                randconfig-015-20260610    gcc-14
x86_64                randconfig-016-20260609    gcc-14
x86_64                randconfig-016-20260610    gcc-14
x86_64                randconfig-071-20260609    clang-22
x86_64                randconfig-072-20260609    clang-22
x86_64                randconfig-073-20260609    clang-22
x86_64                randconfig-074-20260609    gcc-14
x86_64                randconfig-075-20260609    gcc-14
x86_64                randconfig-076-20260609    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260609    gcc-16.1.0
xtensa                randconfig-001-20260610    gcc-14.3.0
xtensa                randconfig-002-20260609    gcc-8.5.0
xtensa                randconfig-002-20260610    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

