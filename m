Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614ADC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 00:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ReFJ5dJwkWUyrjcVhdb2bnujKSw8PoZywGxsopBOdNQ=; b=l3QSHSyIyN9l4ZP7pAP9WCjQmb
	F3ezK33WO2yENXbATCVoGetKYoTgEM0UkKYpamq8YUulSE59iWCbwts2BtVWpwP3bWLpFtGF7v42p
	RPi+j21ufDpcp4fE2sNIXg3sSyIVUdDhluLp+zHlGDVV/w/jKHPuxqJXTwmOBU/Kr9dpwK0YUp7pu
	CIMioQMmKwuL1cxseelQo0EeEtmaBenJwyDNMshgkBYBUpZTC7BMNWXYVDTZ7jsrvsoZkv1nPdf0S
	eV/RkWkDLJ6T3/k7zRMJCaI8zYROlHGlHLJZczh/YS1dUTJNyZX0b+9Yo5/peYG8g/KJqQAspyW/v
	1VmmpXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttbWM-0000000H0EQ-2eOl;
	Sun, 16 Mar 2025 00:06:26 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttbUg-0000000H0Ap-384D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 00:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742083483; x=1773619483;
  h=date:from:to:cc:subject:message-id;
  bh=4rt8Zr3BZCLFFDlcjhyBZInSVCJzxXhIYVU/P5G/b6Q=;
  b=Ltil+EgaksL+I54CtWkmk47rdxd3BSmNv6Dupy6z41fCo36O5RpjykAK
   23Y/p0GdVdVlNLNgEfdtSSvUZi04byTQdFPtr4KCWZoIi+8qf7xYzBWBi
   ChG8wIz2pXDx/Tqo59qRXHGSzOE9Q/+qK1Rdc6N4ckQG3jUAog/Ux66cr
   +wYxlyfXS4jBZTS4ZMa+81sUY0DzlX/VN820M+iwisoW5LTjycjOzAzzs
   sAUzbDXYAMaYyQySOXtXA+lJLg98bSdkXlhkAj35kHBxNq5VwfZeTrpfH
   sI4LmpDsWaH0K1wWoZjf2fvvTXGjyXKfOT9A0hCp8SabDOPOyUmI8exM+
   g==;
X-CSE-ConnectionGUID: hbVmK1txQUqqEE2n5Dd4Og==
X-CSE-MsgGUID: V8D3wZpSTtyj/i9Cm+yfWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="42942522"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="42942522"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 17:04:38 -0700
X-CSE-ConnectionGUID: wcT74oUFSJ2KsTO0GY4frQ==
X-CSE-MsgGUID: MENUepbQRB6IusnI/5SelQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="152541995"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Mar 2025 17:04:37 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttbUY-000Bj5-2C;
	Sun, 16 Mar 2025 00:04:34 +0000
Date: Sun, 16 Mar 2025 08:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:k3/dt] BUILD SUCCESS
 377fde74eae4abcbcd5475676d58fb595a07ff85
Message-ID: <202503160859.nqoAvZQO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_170442_917660_0C7F8BF5 
X-CRM114-Status: UNSURE (   4.69  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git k3/dt
branch HEAD: 377fde74eae4abcbcd5475676d58fb595a07ff85  arm64: dts: ti: k3-am62a-phycore-som: Reorder properties per DTS coding style

elapsed time: 1445m

configs tested: 153
configs skipped: 130

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    clang-21
alpha                     defconfig    gcc-14.2.0
arc                    allmodconfig    clang-18
arc                     allnoconfig    gcc-14.2.0
arc                    allyesconfig    clang-18
arc                       defconfig    gcc-14.2.0
arc         randconfig-001-20250315    gcc-14.2.0
arc         randconfig-002-20250315    gcc-14.2.0
arm                    allmodconfig    clang-18
arm                     allnoconfig    gcc-14.2.0
arm                    allyesconfig    clang-18
arm                       defconfig    gcc-14.2.0
arm            footbridge_defconfig    gcc-14.2.0
arm                 imxrt_defconfig    gcc-14.2.0
arm         randconfig-001-20250315    gcc-14.2.0
arm         randconfig-002-20250315    gcc-14.2.0
arm         randconfig-003-20250315    gcc-14.2.0
arm         randconfig-004-20250315    gcc-14.2.0
arm64                  allmodconfig    clang-18
arm64                   allnoconfig    gcc-14.2.0
arm64                     defconfig    gcc-14.2.0
arm64       randconfig-001-20250315    gcc-14.2.0
arm64       randconfig-002-20250315    gcc-14.2.0
arm64       randconfig-003-20250315    clang-16
arm64       randconfig-003-20250315    gcc-14.2.0
arm64       randconfig-004-20250315    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky                      defconfig    gcc-14.2.0
csky        randconfig-001-20250315    gcc-14.2.0
csky        randconfig-002-20250315    gcc-14.2.0
hexagon                allmodconfig    clang-21
hexagon                 allnoconfig    gcc-14.2.0
hexagon                allyesconfig    clang-21
hexagon                   defconfig    gcc-14.2.0
hexagon     randconfig-001-20250315    gcc-14.2.0
hexagon     randconfig-002-20250315    gcc-14.2.0
i386                   allmodconfig    clang-19
i386                    allnoconfig    clang-19
i386                   allyesconfig    clang-19
i386                      defconfig    clang-19
i386        randconfig-001-20250316    gcc-12
i386        randconfig-002-20250316    gcc-12
i386        randconfig-003-20250316    gcc-12
i386        randconfig-004-20250316    gcc-12
i386        randconfig-005-20250316    gcc-12
i386        randconfig-006-20250316    gcc-12
i386        randconfig-007-20250316    gcc-12
i386        randconfig-011-20250315    gcc-12
i386        randconfig-012-20250315    gcc-12
i386        randconfig-013-20250315    gcc-12
i386        randconfig-014-20250315    gcc-12
i386        randconfig-015-20250315    gcc-12
i386        randconfig-016-20250315    gcc-12
i386        randconfig-017-20250315    gcc-12
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch                 defconfig    gcc-14.2.0
loongarch   randconfig-001-20250315    gcc-14.2.0
loongarch   randconfig-002-20250315    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
m68k               apollo_defconfig    clang-17
m68k                      defconfig    gcc-14.2.0
m68k              m5272c3_defconfig    clang-17
microblaze             allmodconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
microblaze                defconfig    gcc-14.2.0
mips              maltaup_defconfig    gcc-14.2.0
mips                rb532_defconfig    clang-17
nios2                     defconfig    gcc-14.2.0
nios2       randconfig-001-20250315    gcc-14.2.0
nios2       randconfig-002-20250315    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
openrisc                  defconfig    gcc-12
parisc                 allmodconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc                    defconfig    gcc-12
parisc      generic-64bit_defconfig    clang-17
parisc      randconfig-001-20250315    gcc-14.2.0
parisc      randconfig-002-20250315    gcc-14.2.0
parisc64                  defconfig    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                allyesconfig    gcc-14.2.0
powerpc        mpc885_ads_defconfig    clang-17
powerpc          mvme5100_defconfig    gcc-14.2.0
powerpc     randconfig-001-20250315    gcc-14.2.0
powerpc     randconfig-002-20250315    gcc-14.2.0
powerpc     randconfig-003-20250315    gcc-14.2.0
powerpc          sam440ep_defconfig    clang-17
powerpc64   randconfig-001-20250315    gcc-14.2.0
powerpc64   randconfig-002-20250315    gcc-14.2.0
powerpc64   randconfig-003-20250315    gcc-14.2.0
riscv                  allmodconfig    gcc-14.2.0
riscv                  allyesconfig    gcc-14.2.0
riscv                     defconfig    gcc-12
riscv       randconfig-001-20250316    gcc-14.2.0
riscv       randconfig-002-20250316    gcc-14.2.0
s390                   allmodconfig    gcc-14.2.0
s390                   allyesconfig    gcc-14.2.0
s390                      defconfig    gcc-12
s390        randconfig-001-20250316    gcc-14.2.0
s390        randconfig-002-20250316    gcc-14.2.0
sh                     allmodconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh               apsh4a3a_defconfig    gcc-14.2.0
sh                        defconfig    gcc-12
sh                r7785rp_defconfig    gcc-14.2.0
sh          randconfig-001-20250316    gcc-14.2.0
sh          randconfig-002-20250316    gcc-14.2.0
sh                sdk7786_defconfig    clang-17
sh                   shx3_defconfig    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
sparc       randconfig-001-20250316    gcc-14.2.0
sparc       randconfig-002-20250316    gcc-14.2.0
sparc64                   defconfig    gcc-12
sparc64     randconfig-001-20250316    gcc-14.2.0
sparc64     randconfig-002-20250316    gcc-14.2.0
um                     allmodconfig    clang-21
um                     allyesconfig    clang-21
um                        defconfig    gcc-12
um                   i386_defconfig    gcc-12
um          randconfig-001-20250316    gcc-14.2.0
um          randconfig-002-20250316    gcc-14.2.0
um                 x86_64_defconfig    clang-17
um                 x86_64_defconfig    gcc-12
x86_64                  allnoconfig    clang-19
x86_64                 allyesconfig    clang-19
x86_64                    defconfig    clang-19
x86_64                        kexec    clang-19
x86_64      randconfig-001-20250316    gcc-12
x86_64      randconfig-002-20250316    gcc-12
x86_64      randconfig-003-20250316    gcc-12
x86_64      randconfig-004-20250316    gcc-12
x86_64      randconfig-005-20250316    gcc-12
x86_64      randconfig-006-20250316    gcc-12
x86_64      randconfig-007-20250316    gcc-12
x86_64      randconfig-008-20250316    gcc-12
x86_64      randconfig-071-20250315    clang-19
x86_64      randconfig-072-20250315    clang-19
x86_64      randconfig-073-20250315    clang-19
x86_64      randconfig-074-20250315    clang-19
x86_64      randconfig-075-20250315    clang-19
x86_64      randconfig-076-20250315    clang-19
x86_64      randconfig-077-20250315    clang-19
x86_64      randconfig-078-20250315    clang-19
x86_64                     rhel-9.4    clang-19
x86_64                 rhel-9.4-bpf    clang-18
x86_64               rhel-9.4-kunit    clang-18
x86_64                 rhel-9.4-ltp    clang-18
x86_64                rhel-9.4-rust    clang-18
xtensa      randconfig-001-20250316    gcc-14.2.0
xtensa      randconfig-002-20250316    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

