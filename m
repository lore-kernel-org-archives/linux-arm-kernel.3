Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D760C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UywVkAu+yGc/6bS+58Y19kmuj+hypTicVvq0yBl3M0o=; b=3aNJLUIdxZhthUDNbG1xbPofgd
	xBb/IPx4I5weXT00rd0DXC+yEAJsowx43wr4GTu5uFoInjy8lf+a4W1zmHWncxo44TsFG52QdAst3
	XOph6p2pw1GFl7fpjeUqWLEPhY3hj5ch+zS1EsHH6DHdtu7EofhA6LyjtxLvMRTTTmvT+Q0oZp77I
	57J2G3flMejmwlBRTj7XOREasRjGOeHYMtvCDOsUo+MFMFgL7aJauwwLxFW+7s9ET5cdJbrTmNz2I
	qZoqjtJ68n+qtfXh4jiQp9uh3QjYB7EMwlON8Nv4HB/d0yMXREzmkXitFxXGCfLzr22g1fHIR1qj3
	VILT1uXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7CS-0000000G5v8-2tZT;
	Wed, 12 Aug 2026 11:32:48 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7CQ-0000000G5tM-0jOP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786534366; x=1818070366;
  h=date:from:to:cc:subject:message-id;
  bh=yJltvrLdal4WCOweL/LQjEugbf6QmYDFvEt3bY7a774=;
  b=EevFykIg91LL/8TTESUe5wZPWFTDUINEXr/0MfR9RvmMuKL2MGjJCuXO
   0O3o8g89J6SvEkz9/AlUB3G+DtTycax3xUmSDHSQXonHL2E09YfPWqVsw
   dVl0No7is9Hy+w+ZYwjtEUvQ2I450H5IAbmZTcLUIU5Iq9Lx8H31+v6gr
   WESigx9zMs1/YlvtzLZVnaHIuzxcQ+qDqFLSOIKWKqnbOF3xHfNvVQsbQ
   zxTpnPaJpOeMpZbB95dqIJlXg5T6KMr7KtHmGHBVYsLYWBirI+XazIUcT
   WIQTwRYApeMmFkjAlJTuUBZvUcTZdrAxCN+tEKFwKEHt29+xtpRdC1681
   A==;
X-CSE-ConnectionGUID: g0EohpF+Qz2zxxD4fP2Rlg==
X-CSE-MsgGUID: sUpLDqhVTdORqLqSCm32PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="112629397"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="112629397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 04:32:45 -0700
X-CSE-ConnectionGUID: jXTqDNoLSMSwCxJCnNPTFQ==
X-CSE-MsgGUID: eJxkSSL3TvaaaPUnWEDCYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="264207576"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2026 04:32:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu7CL-00000000QXe-3fSI;
	Wed, 12 Aug 2026 11:32:41 +0000
Date: Wed, 12 Aug 2026 19:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 75fe716d07702e687718f743c6655bbe464e337a
Message-ID: <202608121941.rwA3VoAY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_043246_225810_5A0771EB 
X-CRM114-Status: UNSURE (   5.87  )
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
branch HEAD: 75fe716d07702e687718f743c6655bbe464e337a  Merge tag 'zynqmp-soc-for-7.3' of https://github.com/Xilinx/linux-xlnx into soc/drivers

elapsed time: 1519m

configs tested: 184
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
arc                  randconfig-001-20260811    gcc-11.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-002-20260811    gcc-9.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                  randconfig-001-20260811    gcc-13.4.0
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-002-20260811    gcc-15.2.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-003-20260811    gcc-13.4.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-004-20260811    clang-24
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
hexagon                       randconfig-001    clang-17
hexagon              randconfig-001-20260811    clang-24
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260811    clang-22
hexagon              randconfig-002-20260812    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260811    clang-22
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260811    gcc-14
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-003-20260811    gcc-14
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260811    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260811    gcc-14
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-006-20260811    clang-22
i386       buildonly-randconfig-006-20260812    clang-22
i386                 randconfig-001-20260811    gcc-14
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-002-20260811    gcc-14
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-003-20260811    gcc-14
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260811    gcc-14
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-005-20260811    gcc-14
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-006-20260811    gcc-14
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260811    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-011-20260811    gcc-14
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260811    gcc-14
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260811    clang-22
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260811    gcc-13
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260811    gcc-14
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260811    gcc-14
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260811    gcc-14
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260811    gcc-15.2.0
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260811    clang-24
loongarch            randconfig-002-20260812    gcc-11.5.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
mips                          ip22_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260811    gcc-8.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260811    gcc-9.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc               randconfig-001-20260811    gcc-10.5.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-002-20260811    gcc-16.1.0
parisc               randconfig-002-20260812    clang-17
powerpc              randconfig-001-20260811    clang-24
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-002-20260811    clang-17
powerpc              randconfig-002-20260812    clang-17
powerpc64            randconfig-001-20260811    gcc-15.2.0
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-002-20260811    gcc-13.4.0
powerpc64            randconfig-002-20260812    clang-17
riscv                randconfig-001-20260811    clang-24
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-002-20260811    clang-24
riscv                randconfig-002-20260812    clang-24
s390                 randconfig-001-20260811    clang-20
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-002-20260811    clang-24
s390                 randconfig-002-20260812    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260811    gcc-13.4.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-002-20260811    gcc-16.1.0
sh                   randconfig-002-20260812    clang-24
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
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    clang-22
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260811    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260811    gcc-14
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260811    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260811    gcc-14
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260811    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260811    gcc-13
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260812    clang-22
x86_64               randconfig-071-20260811    clang-22
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260811    gcc-14
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260811    gcc-14
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-074-20260811    gcc-14
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260811    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260811    gcc-14
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260811    gcc-16.1.0
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-002-20260811    gcc-10.5.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

