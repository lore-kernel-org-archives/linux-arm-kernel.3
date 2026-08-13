Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A601C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 02:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3CuBB+CHGLw6BDYyP+/TUv8Vblequ83ut7UPIbhRg0=; b=gAPzwFESoUbu5YviZPz/Va3Wgt
	b5nlxBcLYKYV3rNJavV4Htslis4l/C9er6pfwGrNoDbZ8Bk8BE66QT5XUsyqf0/hADX9JvTL+8X4F
	dL/TO6iF3Slnhrv8VSmgPee3FFgn5gTAGjI5PDXQVsWqbfUYOJWgiQot7UnjODOhSmjzLD/p2by/H
	MgIV47LBTJztvsYsXnafa4tRGSxT7NxaOivRecq2xgByL4MxjE3JCvINS+O+KabmZkakfSViGq+tr
	LLFo3VgwgfKxKUGSRGiS9VKL0NG6F3y3Bp+sUD/488IIX+jOJrS815RDnshP9put1jo6gy6kO/TQo
	WD6sD1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuL8N-0000000HHHl-2cfR;
	Thu, 13 Aug 2026 02:25:31 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuL8K-0000000HHHM-1gbm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 02:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786587928; x=1818123928;
  h=date:from:to:cc:subject:message-id;
  bh=lvsIvPpzlVah7U/GZDt5kHn1/5SitdANzRJnj79a7JA=;
  b=K3Djmm2vRAx822k2syPKvrtT2DNGT/j6ULQZ1QHRoBjdRIzJRizUYLjY
   96nZN7uAabCk3ywWTP0rcxMLLeiyF6S8ZB2rlHXjlUxetNQs7qnKYk6QS
   olaVvNzt/YowNTaswR6m1lWDQ5NXsFhOYZ/GiK+d+zDbmsHCnC9FVdj2D
   RFZmRrF/nKrm1aN9SFiuI6wYHNBulQHSOAe+BxGWM9BkAgCt0U7tnBXq5
   /57FKa2dz0wL+SGKBkIVf6K+veCnrCzjR3+oIWXXiv079MBk5hEEK1N1V
   tAz+mOiXNQyAFswN+0fbY7fHWaVE7LpC1AAOnKC7akY7CVL1/E51a2MeO
   g==;
X-CSE-ConnectionGUID: P+3EyHYAThqnfUk6hFwTDg==
X-CSE-MsgGUID: zBsyHCB0SpiSIkkht7g22w==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86275028"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86275028"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:25:27 -0700
X-CSE-ConnectionGUID: UJ0vMSINTJKeLUPV3PzxKA==
X-CSE-MsgGUID: 2MVD+G0qSIOiBYHBA0wDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263845604"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 19:25:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuL8F-00000000SX1-1yN7;
	Thu, 13 Aug 2026 02:25:23 +0000
Date: Thu, 13 Aug 2026 10:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 af3564e6cd8b9c8295b65e68ad7d29cbb8b416e0
Message-ID: <202608131030.ibazct3L-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_192528_464016_F83390B1 
X-CRM114-Status: UNSURE (   5.62  )
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
branch HEAD: af3564e6cd8b9c8295b65e68ad7d29cbb8b416e0  soc: document merges

elapsed time: 2422m

configs tested: 210
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-001-20260813    gcc-13.4.0
arc                  randconfig-002-20260812    gcc-10.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arc                  randconfig-002-20260813    gcc-13.4.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                       keystone_defconfig    gcc-16.1.0
arm                        mv78xx0_defconfig    clang-24
arm                  randconfig-001-20260812    clang-19
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-001-20260813    gcc-13.4.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-002-20260813    gcc-13.4.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-003-20260812    gcc-14.3.0
arm                  randconfig-003-20260813    gcc-13.4.0
arm                  randconfig-004-20260812    clang-24
arm                  randconfig-004-20260812    gcc-12.5.0
arm                  randconfig-004-20260813    gcc-13.4.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260811    gcc-8.5.0
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-002-20260811    gcc-9.5.0
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-003-20260811    clang-17
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-004-20260811    gcc-13.4.0
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260811    gcc-13.4.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-002-20260811    gcc-16.1.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
hexagon                       randconfig-001    gcc-11.5.0
hexagon              randconfig-001-20260812    clang-24
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-001-20260813    gcc-11.5.0
hexagon              randconfig-002-20260812    clang-17
hexagon              randconfig-002-20260812    gcc-11.5.0
hexagon              randconfig-002-20260813    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-002-20260812    gcc-14
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-005-20260812    gcc-14
i386       buildonly-randconfig-006-20260812    clang-22
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-001-20260812    gcc-14
i386                 randconfig-001-20260813    clang-22
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-002-20260812    gcc-14
i386                 randconfig-002-20260813    clang-22
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-003-20260813    clang-22
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-004-20260812    gcc-14
i386                 randconfig-004-20260813    clang-22
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-005-20260812    gcc-14
i386                 randconfig-005-20260813    clang-22
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-006-20260813    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-007-20260812    gcc-14
i386                 randconfig-007-20260813    clang-22
i386                          randconfig-011    gcc-12
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-011-20260812    gcc-14
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260812    clang-22
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260812    clang-22
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260812    clang-22
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260812    clang-22
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260812    clang-22
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260812    clang-24
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-001-20260813    gcc-11.5.0
loongarch            randconfig-002-20260812    clang-24
loongarch            randconfig-002-20260812    gcc-11.5.0
loongarch            randconfig-002-20260813    gcc-11.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-001-20260813    gcc-11.5.0
nios2                randconfig-002-20260812    gcc-10.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
nios2                randconfig-002-20260813    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-001-20260812    gcc-8.5.0
parisc               randconfig-001-20260813    gcc-10.5.0
parisc               randconfig-002-20260812    clang-17
parisc               randconfig-002-20260812    gcc-8.5.0
parisc               randconfig-002-20260813    gcc-10.5.0
powerpc                     arches_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-001-20260812    gcc-14.3.0
powerpc              randconfig-001-20260813    gcc-10.5.0
powerpc              randconfig-002-20260812    clang-17
powerpc              randconfig-002-20260812    clang-24
powerpc              randconfig-002-20260813    gcc-10.5.0
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-001-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260812    clang-17
powerpc64            randconfig-002-20260812    clang-24
powerpc64            randconfig-002-20260813    gcc-10.5.0
riscv                         randconfig-001    clang-24
riscv                randconfig-001-20260812    clang-20
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-001-20260813    gcc-10.5.0
riscv                randconfig-002-20260812    clang-24
riscv                randconfig-002-20260812    gcc-8.5.0
riscv                randconfig-002-20260813    gcc-10.5.0
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-001-20260812    gcc-9.5.0
s390                 randconfig-001-20260813    gcc-10.5.0
s390                 randconfig-002-20260812    clang-24
s390                 randconfig-002-20260813    gcc-10.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-001-20260812    gcc-14.3.0
sh                   randconfig-001-20260813    gcc-10.5.0
sh                   randconfig-002-20260812    clang-24
sh                   randconfig-002-20260812    gcc-12.5.0
sh                   randconfig-002-20260813    gcc-10.5.0
sparc                         randconfig-001    gcc-13.4.0
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-001-20260812    gcc-15.2.0
sparc                randconfig-001-20260813    clang-20
sparc                randconfig-002-20260812    gcc-13.4.0
sparc                randconfig-002-20260813    clang-20
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-001-20260812    gcc-15.2.0
sparc64              randconfig-001-20260813    clang-20
sparc64              randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-002-20260813    clang-20
um                   randconfig-001-20260812    clang-17
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-001-20260813    clang-20
um                   randconfig-002-20260812    clang-20
um                   randconfig-002-20260812    gcc-13.4.0
um                   randconfig-002-20260813    clang-20
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    clang-22
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-001-20260812    gcc-14
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-002-20260812    gcc-14
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-003-20260812    gcc-14
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-004-20260812    gcc-14
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-005-20260812    gcc-14
x86_64               randconfig-006-20260812    clang-22
x86_64               randconfig-006-20260812    gcc-14
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-014-20260812    gcc-14
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260812    clang-22
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-073-20260812    gcc-14
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-075-20260812    gcc-14
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-001-20260812    gcc-15.2.0
xtensa               randconfig-001-20260813    clang-20
xtensa               randconfig-002-20260812    gcc-13.4.0
xtensa               randconfig-002-20260813    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

