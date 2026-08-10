Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96124C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 03:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c27CkkVLtXbl71Aarg/vqDks5wEQRxb9sI5hXA6C42A=; b=wdnpjUIOHe2kOazTcfiEJWrY7x
	hmGHKo33ICwFZBZ44Y0+KK4rC054cCjDrlt7Mtlx0RpZjPVTf0AstuM1y37pYdbrsslpKDU8jB+WU
	CdDSSthw/rJMzup62TKeFabSsoOUDxYRU7jx/DEQyaKozKmXCrLvopBU67CIUUPggPbtJbOharbxD
	2qt1jfZVzOTQiJAtI/0+lopYqC9dRq2s739abWBwL/vEcglo0kFNIJYSs7GOa5aQo8BDhEijYPKpG
	UL3dR3+4e84iE1YpHOxwY/ZbAwzYgwvtzsDhvK3ut4hRQr8dS6m8acfqVY7KM6WG9TpFpGTeCeF3L
	4yWZbYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtH1X-0000000AyXp-0dma;
	Mon, 10 Aug 2026 03:50:03 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtH1U-0000000AyX4-0lPQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 03:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786333800; x=1817869800;
  h=date:from:to:cc:subject:message-id;
  bh=uGYZZ5ZVyzelJ8HHYEMn/Ekv8E1NPEGWQ7fS7odqrwM=;
  b=bk5P58eaibM+hwS7AuLHayLGepDNZqCYGU/KYQH/+CTmei8RSru1Ek7R
   yJviQqRqElqx/MSuwY3y7+y1ooKj//ZYrzSNKwn1UDxCiGDYmVIKSHR9V
   btc3pUjY965mikP6B5Ab2njOTRs+7jRNig5NvHWTyah+uOAtGVkIjXVVw
   LhABQjnaR6wV57t9j3ZANu4wOt0o3nmjSxzL3TuTq0O3yhH8YaIqGjTmU
   yjNVHvTmmUEQ0Tl7I7QLoB2u/zHEVOUa1hziBl6dzAswTWvF1cG1BYHzM
   u83cEK6jVvxbVAgSDVifBElGOYZ/JOApx9lncS2rXVaoMMZC41jwtKSAx
   A==;
X-CSE-ConnectionGUID: GQ6lacilTfqqlFOfVLG4Iw==
X-CSE-MsgGUID: 3dZUdAxIS5aqyU5VxTph+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86869218"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="86869218"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 20:49:53 -0700
X-CSE-ConnectionGUID: HEE2/a0nTBuMc/h21+IJ0w==
X-CSE-MsgGUID: kJwJwHo5R/2OHMlWnl5d2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="267175403"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Aug 2026 20:49:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtH1J-00000000Mjo-03ca;
	Mon, 10 Aug 2026 03:49:49 +0000
Date: Mon, 10 Aug 2026 11:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 b981359d9ecafafde4d64c322ac81fe8727855ac
Message-ID: <202608101148.HH9L8Fdu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_205000_252710_C92E378A 
X-CRM114-Status: UNSURE (   5.43  )
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
branch HEAD: b981359d9ecafafde4d64c322ac81fe8727855ac  Merge tag 'tegra-for-7.3-arm64-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/dt

elapsed time: 1538m

configs tested: 186
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260809    gcc-12.5.0
arc                  randconfig-001-20260810    gcc-8.5.0
arc                  randconfig-002-20260809    gcc-12.5.0
arc                  randconfig-002-20260810    gcc-8.5.0
arm                           hisi_defconfig    gcc-16.1.0
arm                  randconfig-001-20260809    gcc-12.5.0
arm                  randconfig-001-20260810    gcc-8.5.0
arm                  randconfig-002-20260809    gcc-12.5.0
arm                  randconfig-002-20260810    gcc-8.5.0
arm                  randconfig-003-20260809    gcc-12.5.0
arm                  randconfig-003-20260810    gcc-8.5.0
arm                  randconfig-004-20260809    gcc-12.5.0
arm                  randconfig-004-20260810    gcc-8.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260809    gcc-14.3.0
arm64                randconfig-001-20260810    gcc-16.1.0
arm64                randconfig-002-20260809    gcc-14.3.0
arm64                randconfig-002-20260810    gcc-16.1.0
arm64                randconfig-003-20260809    gcc-14.3.0
arm64                randconfig-003-20260810    gcc-16.1.0
arm64                randconfig-004-20260809    gcc-14.3.0
arm64                randconfig-004-20260810    gcc-16.1.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260809    gcc-14.3.0
csky                 randconfig-001-20260810    gcc-16.1.0
csky                 randconfig-002-20260809    gcc-14.3.0
csky                 randconfig-002-20260810    gcc-16.1.0
hexagon              randconfig-001-20260809    gcc-12.5.0
hexagon              randconfig-001-20260810    gcc-10.5.0
hexagon              randconfig-002-20260809    gcc-12.5.0
hexagon              randconfig-002-20260810    gcc-10.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260809    clang-22
i386       buildonly-randconfig-001-20260810    clang-22
i386       buildonly-randconfig-002-20260809    clang-22
i386       buildonly-randconfig-002-20260810    clang-22
i386       buildonly-randconfig-003-20260809    clang-22
i386       buildonly-randconfig-003-20260810    clang-22
i386       buildonly-randconfig-004-20260809    clang-22
i386       buildonly-randconfig-004-20260810    clang-22
i386       buildonly-randconfig-005-20260809    clang-22
i386       buildonly-randconfig-005-20260810    clang-22
i386       buildonly-randconfig-006-20260809    clang-22
i386       buildonly-randconfig-006-20260810    clang-22
i386                 randconfig-001-20260809    clang-22
i386                 randconfig-001-20260810    gcc-14
i386                 randconfig-002-20260809    clang-22
i386                 randconfig-002-20260810    gcc-14
i386                 randconfig-003-20260809    clang-22
i386                 randconfig-003-20260810    gcc-14
i386                 randconfig-004-20260809    clang-22
i386                 randconfig-004-20260810    gcc-14
i386                 randconfig-005-20260809    clang-22
i386                 randconfig-005-20260810    gcc-14
i386                 randconfig-006-20260809    clang-22
i386                 randconfig-006-20260810    gcc-14
i386                 randconfig-007-20260809    clang-22
i386                 randconfig-007-20260810    gcc-14
i386                          randconfig-011    clang-22
i386                 randconfig-011-20260809    clang-22
i386                 randconfig-011-20260810    clang-22
i386                 randconfig-012-20260809    clang-22
i386                 randconfig-012-20260810    clang-22
i386                 randconfig-013-20260809    clang-22
i386                 randconfig-013-20260810    clang-22
i386                 randconfig-014-20260809    clang-22
i386                 randconfig-014-20260810    clang-22
i386                 randconfig-015-20260809    clang-22
i386                 randconfig-015-20260810    clang-22
i386                 randconfig-016-20260809    clang-22
i386                 randconfig-016-20260810    clang-22
i386                 randconfig-017-20260809    clang-22
i386                 randconfig-017-20260810    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260809    gcc-12.5.0
loongarch            randconfig-001-20260810    gcc-10.5.0
loongarch            randconfig-002-20260809    gcc-12.5.0
loongarch            randconfig-002-20260810    gcc-10.5.0
mips                         ath25_defconfig    clang-24
mips                          ip27_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260809    gcc-12.5.0
nios2                randconfig-001-20260810    gcc-10.5.0
nios2                randconfig-002-20260809    gcc-12.5.0
nios2                randconfig-002-20260810    gcc-10.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260809    gcc-8.5.0
parisc               randconfig-001-20260810    gcc-8.5.0
parisc               randconfig-002-20260809    gcc-8.5.0
parisc               randconfig-002-20260810    gcc-8.5.0
powerpc              randconfig-001-20260809    gcc-8.5.0
powerpc              randconfig-001-20260810    gcc-8.5.0
powerpc              randconfig-002-20260809    gcc-8.5.0
powerpc              randconfig-002-20260810    gcc-8.5.0
powerpc64            randconfig-001-20260809    gcc-8.5.0
powerpc64            randconfig-001-20260810    gcc-8.5.0
powerpc64            randconfig-002-20260809    gcc-8.5.0
powerpc64            randconfig-002-20260810    gcc-8.5.0
riscv                randconfig-001-20260809    clang-24
riscv                randconfig-001-20260810    gcc-8.5.0
riscv                randconfig-002-20260809    clang-24
riscv                randconfig-002-20260810    gcc-8.5.0
s390                 randconfig-001-20260809    clang-24
s390                 randconfig-001-20260810    gcc-8.5.0
s390                 randconfig-002-20260809    clang-24
s390                 randconfig-002-20260810    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260809    clang-24
sh                   randconfig-001-20260810    gcc-8.5.0
sh                   randconfig-002-20260809    clang-24
sh                   randconfig-002-20260810    gcc-8.5.0
sparc                randconfig-001-20260809    gcc-11.5.0
sparc                randconfig-001-20260810    gcc-11.5.0
sparc                randconfig-002-20260809    gcc-11.5.0
sparc                randconfig-002-20260810    gcc-11.5.0
sparc64              randconfig-001-20260809    gcc-11.5.0
sparc64              randconfig-001-20260810    gcc-11.5.0
sparc64              randconfig-002-20260809    gcc-11.5.0
sparc64              randconfig-002-20260810    gcc-11.5.0
um                   randconfig-001-20260809    gcc-11.5.0
um                   randconfig-001-20260810    gcc-11.5.0
um                   randconfig-002-20260809    gcc-11.5.0
um                   randconfig-002-20260810    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260809    clang-22
x86_64     buildonly-randconfig-001-20260810    gcc-14
x86_64     buildonly-randconfig-002-20260809    clang-22
x86_64     buildonly-randconfig-002-20260810    gcc-14
x86_64     buildonly-randconfig-003-20260809    clang-22
x86_64     buildonly-randconfig-003-20260810    gcc-14
x86_64     buildonly-randconfig-004-20260809    clang-22
x86_64     buildonly-randconfig-004-20260810    gcc-14
x86_64     buildonly-randconfig-005-20260809    clang-22
x86_64     buildonly-randconfig-005-20260810    gcc-14
x86_64     buildonly-randconfig-006-20260809    clang-22
x86_64     buildonly-randconfig-006-20260810    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260809    clang-22
x86_64               randconfig-001-20260810    gcc-14
x86_64               randconfig-002-20260809    clang-22
x86_64               randconfig-002-20260810    gcc-14
x86_64               randconfig-003-20260809    clang-22
x86_64               randconfig-003-20260810    gcc-14
x86_64               randconfig-004-20260809    clang-22
x86_64               randconfig-004-20260810    gcc-14
x86_64               randconfig-005-20260809    clang-22
x86_64               randconfig-005-20260810    gcc-14
x86_64               randconfig-006-20260809    clang-22
x86_64               randconfig-006-20260810    gcc-14
x86_64               randconfig-011-20260809    gcc-14
x86_64               randconfig-011-20260810    clang-22
x86_64               randconfig-012-20260809    gcc-14
x86_64               randconfig-012-20260810    clang-22
x86_64               randconfig-013-20260809    gcc-14
x86_64               randconfig-013-20260810    clang-22
x86_64               randconfig-014-20260809    gcc-14
x86_64               randconfig-014-20260810    clang-22
x86_64               randconfig-015-20260809    gcc-14
x86_64               randconfig-015-20260810    clang-22
x86_64               randconfig-016-20260809    gcc-14
x86_64               randconfig-016-20260810    clang-22
x86_64               randconfig-071-20260809    clang-22
x86_64               randconfig-071-20260810    clang-22
x86_64               randconfig-072-20260809    clang-22
x86_64               randconfig-072-20260810    clang-22
x86_64               randconfig-073-20260809    clang-22
x86_64               randconfig-073-20260810    clang-22
x86_64               randconfig-074-20260809    clang-22
x86_64               randconfig-074-20260810    clang-22
x86_64               randconfig-075-20260809    clang-22
x86_64               randconfig-075-20260810    clang-22
x86_64               randconfig-076-20260809    clang-22
x86_64               randconfig-076-20260810    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260809    gcc-11.5.0
xtensa               randconfig-001-20260810    gcc-11.5.0
xtensa               randconfig-002-20260809    gcc-11.5.0
xtensa               randconfig-002-20260810    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

