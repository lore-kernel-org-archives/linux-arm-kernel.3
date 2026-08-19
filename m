Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB816C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 23:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b0L/Rdd5AoIivTINc1trLM094qppzrUvqa+jAbwUsB4=; b=cFJ4HitPUWjzW8zHoFZ8Qr4NsV
	STVNOOQoVLUmsa5TebMar1ILSZnrmn3ub25C1k8gOpqpItkP20OwOipQYsQhj4wzm4LwAOo856EXu
	s/MxUZJolST+0t8WKXaNAk9y0jWRV9DHOLpb6O5FlzxvMjEistXTGsoMUyXU54Rp4gpo9tniLqc5R
	UjszbfzB/kicbcEWVmTSc4vTvvj2e4ro9SJa5qw8LtwHnyKxZ/VeTJ0ZNJInhbgOladnUDkQ9MxVW
	yB/5IS/D3mo3Lf0Ow4FD03tOo9SyeoMZL8YtxPW5bxnCplDW5KxlK/aaUzFrt1Pqy+P9sujkdQAyv
	FLgTFMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwpOX-0000000Adw3-3ZRD;
	Wed, 19 Aug 2026 23:08:29 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwpOV-0000000AdvR-1awG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 23:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787180907; x=1818716907;
  h=date:from:to:cc:subject:message-id;
  bh=bW4hA79fh2Nwx8eAVp8v9QaZEBwQknfE9oajdHi8Zis=;
  b=h8F+XiSsX/ji9lSqbryDVvg79b2ZXG2zb75uJFnHQgIH1iHZTN1UxVHL
   E3gqWJdQTuv7ktaIYINOAMFooPGOymt2PSJONdWDNmUD4pF+bR4fZhHuJ
   VRQACm7ETiJ8xK1hP7/+x7YDpU52y4h4m+hj3SZ4a3Mux95bOmgKh/iS4
   JFdcbdHi8cK9kJrbInYn4nyrBV6Ls2avYeCPwm7Vuewnrbd/fCLoAAFtJ
   cWQG/6RQpOcgxCzI2M8+Q+w7xFN2VHI8Sl9x08poD+onWzawRHI5uLQ7u
   yu0mLCYm464lPoXUKIhHHEB7jdhxtk5WeXKdv0DtPAt5xWXpj/fwljpz2
   w==;
X-CSE-ConnectionGUID: MBu6rooCQkilPUsKag6/zg==
X-CSE-MsgGUID: MUq65YcXSSG6ozX+2Z1kgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="90226445"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="90226445"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 16:08:23 -0700
X-CSE-ConnectionGUID: mK7cXursRKy1N4WuraTlZA==
X-CSE-MsgGUID: ufYj3ubETiuSgInWc/2SNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="264402139"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Aug 2026 16:08:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwpOM-00000000grB-3WXN;
	Wed, 19 Aug 2026 23:08:18 +0000
Date: Thu, 20 Aug 2026 07:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 aed89a05a736d2570a514f00c2ab83388662b271
Message-ID: <202608200753.Rb5cx5ph-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_160827_447470_052055C5 
X-CRM114-Status: UNSURE (   6.04  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: aed89a05a736d2570a514f00c2ab83388662b271  soc: qcom: make QCOM_PDR_MSG selectable

elapsed time: 1474m

configs tested: 201
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260819    gcc-11.5.0
arc                  randconfig-001-20260820    clang-24
arc                  randconfig-002-20260819    gcc-11.5.0
arc                  randconfig-002-20260820    clang-24
arm                  randconfig-001-20260819    gcc-11.5.0
arm                  randconfig-001-20260820    clang-24
arm                  randconfig-002-20260819    gcc-11.5.0
arm                  randconfig-002-20260820    clang-24
arm                  randconfig-003-20260819    gcc-11.5.0
arm                  randconfig-003-20260820    clang-24
arm                  randconfig-004-20260819    gcc-11.5.0
arm                  randconfig-004-20260820    clang-24
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260819    gcc-14.3.0
arm64                randconfig-001-20260819    gcc-9.5.0
arm64                randconfig-001-20260820    clang-24
arm64                randconfig-002-20260819    gcc-14.3.0
arm64                randconfig-002-20260819    gcc-9.5.0
arm64                randconfig-002-20260820    clang-24
arm64                randconfig-003-20260819    gcc-14.3.0
arm64                randconfig-003-20260819    gcc-9.5.0
arm64                randconfig-003-20260820    clang-24
arm64                randconfig-004-20260819    gcc-14.3.0
arm64                randconfig-004-20260819    gcc-9.5.0
arm64                randconfig-004-20260820    clang-24
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260819    gcc-14.3.0
csky                 randconfig-001-20260819    gcc-9.5.0
csky                 randconfig-001-20260820    clang-24
csky                 randconfig-002-20260819    gcc-14.3.0
csky                 randconfig-002-20260819    gcc-9.5.0
csky                 randconfig-002-20260820    clang-24
hexagon                       randconfig-001    gcc-11.5.0
hexagon              randconfig-001-20260819    gcc-11.5.0
hexagon              randconfig-001-20260820    gcc-14.3.0
hexagon              randconfig-002-20260819    gcc-11.5.0
hexagon              randconfig-002-20260820    gcc-14.3.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260819    gcc-14
i386       buildonly-randconfig-001-20260820    gcc-14
i386       buildonly-randconfig-002-20260819    gcc-14
i386       buildonly-randconfig-002-20260820    gcc-14
i386       buildonly-randconfig-003-20260819    gcc-14
i386       buildonly-randconfig-003-20260820    gcc-14
i386       buildonly-randconfig-004-20260819    gcc-14
i386       buildonly-randconfig-004-20260820    gcc-14
i386       buildonly-randconfig-005-20260819    gcc-14
i386       buildonly-randconfig-005-20260820    gcc-14
i386       buildonly-randconfig-006-20260819    gcc-14
i386       buildonly-randconfig-006-20260820    gcc-14
i386                          randconfig-001    gcc-14
i386                 randconfig-001-20260819    gcc-14
i386                 randconfig-001-20260820    clang-22
i386                 randconfig-002-20260819    gcc-14
i386                 randconfig-002-20260820    clang-22
i386                 randconfig-003-20260819    gcc-14
i386                 randconfig-003-20260820    clang-22
i386                 randconfig-004-20260819    gcc-14
i386                 randconfig-004-20260820    clang-22
i386                 randconfig-005-20260819    gcc-14
i386                 randconfig-005-20260820    clang-22
i386                 randconfig-006-20260819    gcc-14
i386                 randconfig-006-20260820    clang-22
i386                 randconfig-007-20260819    gcc-14
i386                 randconfig-007-20260820    clang-22
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260819    gcc-14
i386                 randconfig-011-20260820    gcc-14
i386                 randconfig-012-20260819    gcc-14
i386                 randconfig-012-20260820    gcc-14
i386                 randconfig-013-20260819    gcc-14
i386                 randconfig-013-20260820    gcc-14
i386                 randconfig-014-20260819    gcc-14
i386                 randconfig-014-20260820    gcc-14
i386                 randconfig-015-20260819    gcc-14
i386                 randconfig-015-20260820    gcc-14
i386                 randconfig-016-20260819    gcc-14
i386                 randconfig-016-20260820    gcc-14
i386                 randconfig-017-20260819    gcc-14
i386                 randconfig-017-20260820    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260819    gcc-11.5.0
loongarch            randconfig-001-20260820    gcc-14.3.0
loongarch            randconfig-002-20260819    gcc-11.5.0
loongarch            randconfig-002-20260820    gcc-14.3.0
m68k                         atari_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260819    gcc-11.5.0
nios2                randconfig-001-20260820    gcc-14.3.0
nios2                randconfig-002-20260819    gcc-11.5.0
nios2                randconfig-002-20260820    gcc-14.3.0
openrisc        de0_nano_multicore_defconfig    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    clang-24
parisc               randconfig-001-20260819    clang-24
parisc               randconfig-001-20260820    gcc-8.5.0
parisc               randconfig-002-20260819    clang-24
parisc               randconfig-002-20260820    gcc-8.5.0
powerpc                        ps3_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260819    clang-24
powerpc              randconfig-001-20260820    gcc-8.5.0
powerpc              randconfig-002-20260819    clang-24
powerpc              randconfig-002-20260820    gcc-8.5.0
powerpc                   sam440ep_defconfig    gcc-16.1.0
powerpc                    sequoia_defconfig    clang-24
powerpc64            randconfig-001-20260819    clang-24
powerpc64            randconfig-001-20260820    gcc-8.5.0
powerpc64            randconfig-002-20260819    clang-24
powerpc64            randconfig-002-20260820    gcc-8.5.0
riscv                         randconfig-001    clang-24
riscv                randconfig-001-20260819    clang-24
riscv                randconfig-001-20260820    clang-24
riscv                randconfig-002-20260819    clang-24
riscv                randconfig-002-20260820    clang-24
s390                 randconfig-001-20260819    clang-24
s390                 randconfig-001-20260820    clang-24
s390                 randconfig-002-20260819    clang-24
s390                 randconfig-002-20260820    clang-24
sh                                 defconfig    gcc-16.1.0
sh                kfr2r09-romimage_defconfig    gcc-16.1.0
sh                   randconfig-001-20260819    clang-24
sh                   randconfig-001-20260820    clang-24
sh                   randconfig-002-20260819    clang-24
sh                   randconfig-002-20260820    clang-24
sparc                randconfig-001-20260819    gcc-10.5.0
sparc                randconfig-001-20260820    gcc-13.4.0
sparc                randconfig-002-20260819    gcc-10.5.0
sparc                randconfig-002-20260820    gcc-13.4.0
sparc64              randconfig-001-20260819    gcc-10.5.0
sparc64              randconfig-001-20260820    gcc-13.4.0
sparc64              randconfig-002-20260819    gcc-10.5.0
sparc64              randconfig-002-20260820    gcc-13.4.0
um                   randconfig-001-20260819    gcc-10.5.0
um                   randconfig-001-20260820    gcc-13.4.0
um                   randconfig-002-20260819    gcc-10.5.0
um                   randconfig-002-20260820    gcc-13.4.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260819    gcc-14
x86_64     buildonly-randconfig-001-20260820    gcc-14
x86_64     buildonly-randconfig-002-20260819    gcc-14
x86_64     buildonly-randconfig-002-20260820    gcc-14
x86_64     buildonly-randconfig-003-20260819    gcc-14
x86_64     buildonly-randconfig-003-20260820    gcc-14
x86_64     buildonly-randconfig-004-20260819    gcc-14
x86_64     buildonly-randconfig-004-20260820    gcc-14
x86_64     buildonly-randconfig-005-20260819    gcc-14
x86_64     buildonly-randconfig-005-20260820    gcc-14
x86_64     buildonly-randconfig-006-20260819    gcc-14
x86_64     buildonly-randconfig-006-20260820    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260819    gcc-14
x86_64               randconfig-001-20260820    clang-22
x86_64               randconfig-002-20260819    gcc-14
x86_64               randconfig-002-20260820    clang-22
x86_64               randconfig-003-20260819    gcc-14
x86_64               randconfig-003-20260820    clang-22
x86_64               randconfig-004-20260819    gcc-14
x86_64               randconfig-004-20260820    clang-22
x86_64               randconfig-005-20260819    gcc-14
x86_64               randconfig-005-20260820    clang-22
x86_64               randconfig-006-20260819    gcc-14
x86_64               randconfig-006-20260820    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260819    clang-22
x86_64               randconfig-011-20260820    clang-22
x86_64               randconfig-012-20260819    clang-22
x86_64               randconfig-012-20260820    clang-22
x86_64               randconfig-013-20260819    clang-22
x86_64               randconfig-013-20260820    clang-22
x86_64               randconfig-014-20260819    clang-22
x86_64               randconfig-014-20260820    clang-22
x86_64               randconfig-015-20260819    clang-22
x86_64               randconfig-015-20260820    clang-22
x86_64               randconfig-016-20260819    clang-22
x86_64               randconfig-016-20260820    clang-22
x86_64               randconfig-071-20260819    clang-22
x86_64               randconfig-071-20260820    clang-22
x86_64               randconfig-072-20260819    clang-22
x86_64               randconfig-072-20260820    clang-22
x86_64               randconfig-073-20260819    clang-22
x86_64               randconfig-073-20260820    clang-22
x86_64               randconfig-074-20260819    clang-22
x86_64               randconfig-074-20260820    clang-22
x86_64               randconfig-075-20260819    clang-22
x86_64               randconfig-075-20260820    clang-22
x86_64               randconfig-076-20260819    clang-22
x86_64               randconfig-076-20260820    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260819    gcc-10.5.0
xtensa               randconfig-001-20260820    gcc-13.4.0
xtensa               randconfig-002-20260819    gcc-10.5.0
xtensa               randconfig-002-20260820    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

