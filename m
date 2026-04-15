Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F76FA0C57
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3TD2McZIZJ/0MmFQEbp0XN2CAuB1czJM2v4klGu07iA=; b=tjZBImzDU3LH8uiQyXrjjzON2W
	vcgGteFDOwp6p3URaAM3c+D5MiNtEm7Fivg8ikW3xQMWI5BSF68/ltE+vwQ0vrsXlO82wtLmFAy7B
	yZO0jb7B1fcYzzSV+1rnOTqtr013lvgJ6g9U+nqB9PrJy0aLJzgHcKmxZuXrTybLsr8UZ5XAYjK3p
	t2xNoH+ki/5ltEug5EaH/ZTsOmHwASKPSiGenTT18yXVTzeB8T60X497GLQp3Wb5LQlOVuh5LgqIp
	BGYSqF4h3HjLgIISyTIQmnWZTl92IeIel4cJjGY+LvlRnguNmYkBi1riIAOy1ygNIdb+Sm16fA2/l
	qdVwYZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvvY-00000000qSh-0uw6;
	Wed, 15 Apr 2026 08:48:52 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvvW-00000000qSN-1F8t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776242930; x=1807778930;
  h=date:from:to:cc:subject:message-id;
  bh=ASn0ODFSQ7Di9x+7nTjMp6lU8bU00Fp5nY7GzD1Fv3I=;
  b=hFfmhwsivP6VJGFRxLYmSxN1tsjUgvO7h8Wo72gKuS6sFuFo2YGIHZa7
   VHtWbD4UwLg47d92oQDFGgzJmdBmBFcKwdXScRPn3m+OA3+qwMaCkA2Or
   0GSGEfSpjVhY8sEfvvd8qSJTMIQwX1igu3MOmgoa7RbRsK0tVXE3jsDxK
   zPYsr3ePyMdWrF6VTXB/ta52BEkkc00fmCIMudJe4cP+TAFv6OA3XvS3l
   8w+jKW7VSg18txttA/YHAbuRptLleboVI8C9YbdZgbSqnNp7qYtOp1Zmr
   qY8SbXZNLO3zW8l70nu+jstrTdo4uf1qCsK2TZd3nN/6kn4PbHh2733sW
   w==;
X-CSE-ConnectionGUID: R8lzKltpQiycoKxuSGwfoA==
X-CSE-MsgGUID: 0VvKuve3Rqirbc04WNIh3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="79797607"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="79797607"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 01:48:50 -0700
X-CSE-ConnectionGUID: Zt6Q47JbRQykdcTJn9HUnQ==
X-CSE-MsgGUID: GWt+djyMRsmGMnkNRXsGTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230216727"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Apr 2026 01:48:48 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCvvR-000000000Kb-37Kw;
	Wed, 15 Apr 2026 08:48:45 +0000
Date: Wed, 15 Apr 2026 16:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/late] BUILD SUCCESS
 c82aee2c760aba93dce0ad354c48195be00bc9cf
Message-ID: <202604151653.G7FHEaTA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_014850_365470_E45DA5AA 
X-CRM114-Status: UNSURE (   4.78  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/late
branch HEAD: c82aee2c760aba93dce0ad354c48195be00bc9cf  Merge tag 'mvebu-dt64-7.1-1' of https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into soc/late

elapsed time: 805m

configs tested: 115
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260415    gcc-15.2.0
arm64                 randconfig-002-20260415    gcc-14.3.0
arm64                 randconfig-003-20260415    gcc-13.4.0
arm64                 randconfig-004-20260415    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260415    gcc-9.5.0
csky                  randconfig-002-20260415    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon               randconfig-001-20260415    clang-23
hexagon               randconfig-002-20260415    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260415    clang-20
i386        buildonly-randconfig-002-20260415    gcc-14
i386        buildonly-randconfig-003-20260415    clang-20
i386        buildonly-randconfig-004-20260415    gcc-14
i386        buildonly-randconfig-005-20260415    gcc-14
i386        buildonly-randconfig-006-20260415    clang-20
i386                  randconfig-001-20260415    gcc-14
i386                  randconfig-002-20260415    clang-20
i386                  randconfig-003-20260415    gcc-13
i386                  randconfig-004-20260415    clang-20
i386                  randconfig-005-20260415    clang-20
i386                  randconfig-006-20260415    clang-20
i386                  randconfig-007-20260415    clang-20
i386                  randconfig-011-20260415    gcc-14
i386                  randconfig-012-20260415    clang-20
i386                  randconfig-013-20260415    gcc-14
i386                  randconfig-014-20260415    gcc-14
i386                  randconfig-015-20260415    clang-20
i386                  randconfig-016-20260415    gcc-14
i386                  randconfig-017-20260415    gcc-14
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260415    clang-18
loongarch             randconfig-002-20260415    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260415    gcc-10.5.0
nios2                 randconfig-002-20260415    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc64                            defconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               alldefconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260415    gcc-8.5.0
sparc                 randconfig-002-20260415    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260415    clang-23
sparc64               randconfig-002-20260415    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260415    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260415    clang-20
x86_64      buildonly-randconfig-002-20260415    gcc-13
x86_64      buildonly-randconfig-003-20260415    gcc-14
x86_64      buildonly-randconfig-004-20260415    clang-20
x86_64      buildonly-randconfig-005-20260415    clang-20
x86_64      buildonly-randconfig-006-20260415    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20260415    clang-20
x86_64                randconfig-072-20260415    clang-20
x86_64                randconfig-073-20260415    gcc-13
x86_64                randconfig-074-20260415    clang-20
x86_64                randconfig-075-20260415    clang-20
x86_64                randconfig-076-20260415    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260415    gcc-8.5.0
xtensa                randconfig-002-20260415    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

