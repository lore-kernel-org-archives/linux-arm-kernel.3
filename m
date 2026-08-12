Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79578C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=20nce7Ujbigo+H/4dy7ToSV4Yv6WHZ6JDfXGNohozj4=; b=2nU2CxWC0zyMhhg0y0LgogHsq6
	lzOYvT2kYGbcRXAT5IDQaDROR62T/dC+xj96Q3+1JLLsM9j/NIopPjo1R1kTwdO5/vqKtIK/X0AIY
	/48kcruqHKITiHMt9WUZAfbIn0GbxDRda2zaOcw0MKf5Ib5kdkHNa28sHgkiOxF21jZ5Zj/S1k+j0
	5X4tL+V/0FmIBgZMGAut6qpvVJuhMBEgRuRN+p6sqEK/SeSfARw4JXeaXNgg4GtZlvicB+KPM8FEh
	a7fVWoFMExnYgamqxmeNWz5bsBIGbCo673zalkEx41VkNhmv0HupGY/5TxNlvufL0tuw3awpodfGC
	Ai+bhftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDmx-0000000Go6r-13VH;
	Wed, 12 Aug 2026 18:34:55 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDmt-0000000Go6H-0OjY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 18:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786559691; x=1818095691;
  h=date:from:to:cc:subject:message-id;
  bh=6Hyk61EVeGxz60+sXrYuGJiUEGkDxbdafRAjfATbT9s=;
  b=KPxgXpqMqiM6k1IhDo0T14BXkI8/3JpvUtyltpl/TSx5S6q4SROnPwHS
   2GizXlQlFWUCkdrPk3d9sZVEm/QZB5+URcYrtw3wkkvmCtf+aQLwHRBxS
   FM3fyrP/Vt6JO+2FTZ/Un60IyEZoL9njYfLPocH1DqHZDAyurwRUAKeM5
   ZcdglMJIHjyINxrPQtIP50zDd62yLBjWcpB2g3ng3RrOhIO9AWxWDs0R8
   cSJmiyH2FI4FxlcdywEBi6fq0/LIRl83U//VOoblI+uOlNAeTKa2WBLPc
   mzDQ6P+u7u0vXt7S4+HEaNST34R2dgVo0WCQe0rP1wBYulfQntfChVJUd
   g==;
X-CSE-ConnectionGUID: uZEQFkIYQGiTNeqwG5RMfw==
X-CSE-MsgGUID: Y48k1jJ4TyGkkzTx5ZH3Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87004761"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="87004761"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 11:34:51 -0700
X-CSE-ConnectionGUID: Rh8BhfhYSECbVDXU94k3Kg==
X-CSE-MsgGUID: K4ByaEKtQBC2ldknlgtUxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259888694"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2026 11:34:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuDmp-00000000RMY-0bec;
	Wed, 12 Aug 2026 18:34:47 +0000
Date: Thu, 13 Aug 2026 02:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:fsl/soc-drivers] BUILD SUCCESS
 e14b8d39388095fb806fe9f98a95b70619e4cabd
Message-ID: <202608130227.2x7hBxrA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_113451_145661_206CA8C0 
X-CRM114-Status: UNSURE (   5.32  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git fsl/soc-drivers
branch HEAD: e14b8d39388095fb806fe9f98a95b70619e4cabd  bus: fsl-mc: drop unused assignment of acpi_device_id::driver_data

elapsed time: 1951m

configs tested: 156
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
arc                  randconfig-002-20260812    gcc-10.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                  randconfig-001-20260812    clang-19
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-003-20260812    gcc-14.3.0
arm                  randconfig-004-20260812    clang-24
arm                  randconfig-004-20260812    gcc-12.5.0
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
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260812    gcc-11.5.0
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
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-001-20260812    gcc-14
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-002-20260812    gcc-14
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-004-20260812    gcc-14
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-005-20260812    gcc-14
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-007-20260812    gcc-14
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
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260812    gcc-11.5.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
mips                          ip22_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-001-20260812    gcc-8.5.0
parisc               randconfig-002-20260812    clang-17
parisc               randconfig-002-20260812    gcc-8.5.0
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-001-20260812    gcc-14.3.0
powerpc              randconfig-002-20260812    clang-17
powerpc              randconfig-002-20260812    clang-24
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-002-20260812    clang-17
powerpc64            randconfig-002-20260812    clang-24
riscv                randconfig-001-20260812    clang-20
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-002-20260812    clang-24
riscv                randconfig-002-20260812    gcc-8.5.0
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-001-20260812    gcc-9.5.0
s390                 randconfig-002-20260812    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-001-20260812    gcc-14.3.0
sh                   randconfig-002-20260812    clang-24
sh                   randconfig-002-20260812    gcc-12.5.0
sparc                randconfig-001-20260811    gcc-16.1.0
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-002-20260811    gcc-16.1.0
sparc                randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-001-20260811    gcc-8.5.0
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-002-20260811    gcc-8.5.0
sparc64              randconfig-002-20260812    gcc-13.4.0
um                   randconfig-001-20260811    gcc-14
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-002-20260811    gcc-14
um                   randconfig-002-20260812    gcc-13.4.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-002-20260812    gcc-14
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-003-20260812    gcc-14
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
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
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260811    gcc-16.1.0
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-002-20260811    gcc-10.5.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

