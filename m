Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F1AC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 22:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MYfkBbqOqbZBdSYt8DF7/R6TC50b195yD31xR+pbvU0=; b=QGzkFEi8Ky8S/WHcamdPiICN8t
	bcewtJUz7UXAHHNxnotjzwnnuczbvx/gJ2crGzW27UAoJ5Xl2rzowbg+l6eXVoT8kWgOR2dXqEVcA
	dliOkImQBITqiJW0UqTjw+x8TyrERmMoL0Xx2ozZYZRt4YEwWggrnRPgqFLxGWw5F5QPGX5Jf3QRz
	8TGD6ihwmSq2KxnQN9H3hJNnv5X0DzkXQmAaUrXp3CGaX9Ug5DUlYMnkPk3LZFNzaenFWbSPkU8Ux
	7h8BkiFEXoo+LBhEpfmUNlQHSt99OruXryTre3b8OIKsKfNfVvEPNdgD1CG6RBdNESzRCE0p7u/lv
	2w8ByFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrk1t-00000004buv-3Tqv;
	Wed, 05 Aug 2026 22:24:05 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrk1q-00000004btz-3WME
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785968642; x=1817504642;
  h=date:from:to:cc:subject:message-id;
  bh=KDP1vuTHkqYVixjBImmzQ62nYgpuhEL3smoNx6uVwUM=;
  b=KQdJwKKXpAQVmHMmHBlMvkVRkBzpNTyK/dF7t7hjlIqueSQxrQNb6RrM
   iOnlFnJAC7Cca43cplTFqFbmbeSR25n85yfmtrqrndtPNLtmFFufBNRnP
   Ed6YSFZGQQ0P+SDhwas/kzMiUb6VyzFRwDeh7JRujAzLix1XPVznVd8Lc
   55U03EpEmMqXmyL5nw1cvc0gnBtB6CX3zsHcWZVXj4k1IaOxHc/vy21ej
   Oezpd8BU4qbsjBWD1p0NulBmzw7Vz82AuA1ybA2crYCIBBkTSfVPDlywg
   7VNxmHY0lkzbPcP5mFPNJTztkVYE/g9QZneshBVwYTOKwsyn4sRj0/zgg
   A==;
X-CSE-ConnectionGUID: RTFYaf3SS6aOb0f4IrZXVg==
X-CSE-MsgGUID: 2djtmesTTKSKiNsWWL3kDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86671731"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86671731"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 15:24:02 -0700
X-CSE-ConnectionGUID: OObDtYKYTh+fj9v1D/nm9g==
X-CSE-MsgGUID: VaEbVGMLShGQqrpFM9rxGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="261385325"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Aug 2026 15:24:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrk1m-00000000DZb-2aAf;
	Wed, 05 Aug 2026 22:23:58 +0000
Date: Thu, 06 Aug 2026 06:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 6a05421154285888f7bc5d2510e3a9bc1ce31652
Message-ID: <202608060600.BRMXpS2J-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_152402_887646_92355753 
X-CRM114-Status: UNSURE (   5.61  )
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
branch HEAD: 6a05421154285888f7bc5d2510e3a9bc1ce31652  Merge tag 'qcom-drivers-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/drivers

elapsed time: 1548m

configs tested: 167
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260805    gcc-12.5.0
arc                  randconfig-001-20260806    gcc-11.5.0
arc                  randconfig-002-20260805    gcc-12.5.0
arc                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-001-20260805    gcc-12.5.0
arm                  randconfig-001-20260806    gcc-11.5.0
arm                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-003-20260805    gcc-12.5.0
arm                  randconfig-003-20260806    gcc-11.5.0
arm                  randconfig-004-20260805    gcc-12.5.0
arm                  randconfig-004-20260806    gcc-11.5.0
arm64                         randconfig-001    gcc-10.5.0
arm64                randconfig-001-20260805    gcc-10.5.0
arm64                randconfig-001-20260806    gcc-13.4.0
arm64                randconfig-002-20260805    gcc-10.5.0
arm64                randconfig-002-20260806    gcc-13.4.0
arm64                randconfig-003-20260805    gcc-10.5.0
arm64                randconfig-003-20260806    gcc-13.4.0
arm64                randconfig-004-20260805    gcc-10.5.0
arm64                randconfig-004-20260806    gcc-13.4.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260805    gcc-10.5.0
csky                 randconfig-001-20260806    gcc-13.4.0
csky                 randconfig-002-20260805    gcc-10.5.0
csky                 randconfig-002-20260806    gcc-13.4.0
hexagon                       randconfig-001    clang-18
hexagon              randconfig-001-20260805    clang-18
hexagon              randconfig-001-20260806    clang-24
hexagon              randconfig-002-20260805    clang-18
hexagon              randconfig-002-20260806    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260805    clang-22
i386       buildonly-randconfig-002-20260805    clang-22
i386       buildonly-randconfig-003-20260805    clang-22
i386       buildonly-randconfig-004-20260805    clang-22
i386       buildonly-randconfig-005-20260805    clang-22
i386       buildonly-randconfig-006-20260805    clang-22
i386                 randconfig-001-20260805    gcc-13
i386                 randconfig-002-20260805    gcc-13
i386                 randconfig-003-20260805    gcc-13
i386                 randconfig-004-20260805    gcc-13
i386                 randconfig-005-20260805    gcc-13
i386                 randconfig-006-20260805    gcc-13
i386                 randconfig-007-20260805    gcc-13
i386                 randconfig-011-20260805    gcc-14
i386                 randconfig-011-20260806    clang-22
i386                 randconfig-012-20260805    gcc-14
i386                 randconfig-012-20260806    clang-22
i386                 randconfig-013-20260805    gcc-14
i386                 randconfig-013-20260806    clang-22
i386                 randconfig-014-20260805    gcc-14
i386                 randconfig-014-20260806    clang-22
i386                 randconfig-015-20260805    gcc-14
i386                 randconfig-015-20260806    clang-22
i386                 randconfig-016-20260805    gcc-14
i386                 randconfig-016-20260806    clang-22
i386                 randconfig-017-20260805    gcc-14
i386                 randconfig-017-20260806    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260805    clang-18
loongarch            randconfig-001-20260806    clang-24
loongarch            randconfig-002-20260805    clang-18
loongarch            randconfig-002-20260806    clang-24
m68k                      m5208evb_defconfig    gcc-16.1.0
m68k                       mvme16x_defconfig    gcc-16.1.0
mips                 cavium_octeon_defconfig    gcc-16.1.0
mips                          jazz_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260805    clang-18
nios2                randconfig-001-20260806    clang-24
nios2                randconfig-002-20260805    clang-18
nios2                randconfig-002-20260806    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-9.5.0
parisc               randconfig-001-20260805    gcc-9.5.0
parisc               randconfig-001-20260806    gcc-8.5.0
parisc               randconfig-002-20260805    gcc-9.5.0
parisc               randconfig-002-20260806    gcc-8.5.0
powerpc              randconfig-001-20260805    gcc-9.5.0
powerpc              randconfig-001-20260806    gcc-8.5.0
powerpc              randconfig-002-20260805    gcc-9.5.0
powerpc              randconfig-002-20260806    gcc-8.5.0
powerpc64            randconfig-001-20260805    gcc-9.5.0
powerpc64            randconfig-001-20260806    gcc-8.5.0
powerpc64            randconfig-002-20260805    gcc-9.5.0
powerpc64            randconfig-002-20260806    gcc-8.5.0
riscv                         randconfig-001    gcc-8.5.0
riscv                randconfig-001-20260805    gcc-8.5.0
riscv                randconfig-001-20260806    gcc-13.4.0
riscv                randconfig-002-20260805    gcc-8.5.0
riscv                randconfig-002-20260806    gcc-13.4.0
s390                 randconfig-001-20260805    gcc-8.5.0
s390                 randconfig-001-20260806    gcc-13.4.0
s390                 randconfig-002-20260805    gcc-8.5.0
s390                 randconfig-002-20260806    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260805    gcc-8.5.0
sh                   randconfig-001-20260806    gcc-13.4.0
sh                   randconfig-002-20260805    gcc-8.5.0
sh                   randconfig-002-20260806    gcc-13.4.0
sh                          se7705_defconfig    gcc-16.1.0
sparc                randconfig-001-20260805    gcc-11.5.0
sparc                randconfig-001-20260806    gcc-8.5.0
sparc                randconfig-002-20260805    gcc-11.5.0
sparc                randconfig-002-20260806    gcc-8.5.0
sparc64              randconfig-001-20260805    gcc-11.5.0
sparc64              randconfig-001-20260806    gcc-8.5.0
sparc64              randconfig-002-20260805    gcc-11.5.0
sparc64              randconfig-002-20260806    gcc-8.5.0
um                   randconfig-001-20260805    gcc-11.5.0
um                   randconfig-001-20260806    gcc-8.5.0
um                   randconfig-002-20260805    gcc-11.5.0
um                   randconfig-002-20260806    gcc-8.5.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260805    gcc-14
x86_64     buildonly-randconfig-002-20260805    gcc-14
x86_64     buildonly-randconfig-003-20260805    gcc-14
x86_64     buildonly-randconfig-004-20260805    gcc-14
x86_64     buildonly-randconfig-005-20260805    gcc-14
x86_64     buildonly-randconfig-006-20260805    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260805    gcc-14
x86_64               randconfig-001-20260806    clang-22
x86_64               randconfig-002-20260805    gcc-14
x86_64               randconfig-002-20260806    clang-22
x86_64               randconfig-003-20260805    gcc-14
x86_64               randconfig-003-20260806    clang-22
x86_64               randconfig-004-20260805    gcc-14
x86_64               randconfig-004-20260806    clang-22
x86_64               randconfig-005-20260805    gcc-14
x86_64               randconfig-005-20260806    clang-22
x86_64               randconfig-006-20260805    gcc-14
x86_64               randconfig-006-20260806    clang-22
x86_64               randconfig-011-20260805    gcc-14
x86_64               randconfig-012-20260805    gcc-14
x86_64               randconfig-013-20260805    gcc-14
x86_64               randconfig-014-20260805    gcc-14
x86_64               randconfig-015-20260805    gcc-14
x86_64               randconfig-016-20260805    gcc-14
x86_64               randconfig-071-20260805    clang-22
x86_64               randconfig-071-20260806    gcc-14
x86_64               randconfig-072-20260805    clang-22
x86_64               randconfig-072-20260806    gcc-14
x86_64               randconfig-073-20260805    clang-22
x86_64               randconfig-073-20260806    gcc-14
x86_64               randconfig-074-20260805    clang-22
x86_64               randconfig-074-20260806    gcc-14
x86_64               randconfig-075-20260805    clang-22
x86_64               randconfig-075-20260806    gcc-14
x86_64               randconfig-076-20260805    clang-22
x86_64               randconfig-076-20260806    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260805    gcc-11.5.0
xtensa               randconfig-001-20260806    gcc-8.5.0
xtensa               randconfig-002-20260805    gcc-11.5.0
xtensa               randconfig-002-20260806    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

