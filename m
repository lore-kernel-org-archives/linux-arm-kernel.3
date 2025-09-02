Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C55CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zrYUWTU2T53CwushzoB2O9er3HQhiAypVsy0ov1d3Fk=; b=opngg8yiJW9sfE3FIjvS5bC8kV
	WkYCjUUMzwJefiBQeCf4by6utSfswsHxbRpKMXziKjv37m4hawVx9egWs53xdKsCVCWcZj3yx9sAu
	fSHb4DJo28hncH35DxS0d4yR1M294AYoc1MSphbSJp6h+jdka6sNlo4tekdqVOmtddUIQ07Bj34kF
	9NxwsNPUz4+TBelteVeJn/VappDQO/FVkwQSYU8a1PdLf7gtj7sR5SKF0fq7NKjWZ1pH7HW73uWh4
	tnIzlxX7tH0JWGGO1/gTXSGQRlv/yrkX3dsZOiEBQJD9XZ+Mh4t18DluXbPpZNarsetZQ9mAlHZVC
	AXpZqJsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMcK-0000000G8hU-36xA;
	Tue, 02 Sep 2025 08:43:52 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMBF-0000000FzQp-1qp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756800953; x=1788336953;
  h=date:from:to:cc:subject:message-id;
  bh=AKIKO74l1WMsBs+jFVDSsip0D+1uYjBhZ5Xj56cMdR0=;
  b=Xlnf0bg9okP7GhkzQFK2DKWRRXakszhoVcVARDUTqoX8PHOfvvRvK8Ll
   x+iZeavnMVNuKKY9oea3tj5b3EfXJn/aOezBi3y8xToqOSjONBvXqEwm/
   hNN7zQKqs2MbVmb+zkT55l1dB7Ph/hQtQNOCSTE2gyZ4I0wKasLsm07sT
   dM7xfaSMqOF6Pt+tV1OneijL3tEN7+OFXLzz6v9WE6kEg+Sy8pQWcvhHL
   cx0TfW3AnrW4tGMjCfk8jGgtUemmfL828/XpX/ZcrnQJ3Mo0N/svsNCQv
   OGbmUW4+G+QO3Nz8efLHaZoDAgeYt1YCly1Zpoo6pUcm+yK2bwKRNcvYn
   A==;
X-CSE-ConnectionGUID: m2Rp1dwbR4mrGdZodNyqBg==
X-CSE-MsgGUID: XHGDiGcGRo6g7mkbP9Qpnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59170167"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59170167"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 01:15:52 -0700
X-CSE-ConnectionGUID: RVaM5tCpT9SZEjrbG2Zu7g==
X-CSE-MsgGUID: N1o5UnwNR2GPOGywqlrmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170481115"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 01:15:51 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utMAo-0001cN-2i;
	Tue, 02 Sep 2025 08:15:33 +0000
Date: Tue, 02 Sep 2025 16:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 1141f2fa2089bce94a4ef6b8ac131b46167b41f9
Message-ID: <202509021649.ZaAeJvd4-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_011553_495550_0E8232E6 
X-CRM114-Status: UNSURE (   5.63  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
branch HEAD: 1141f2fa2089bce94a4ef6b8ac131b46167b41f9  Merge tag 'renesas-arm-soc-for-v6.18-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/arm

elapsed time: 1263m

configs tested: 143
configs skipped: 123

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
arc                               allnoconfig    clang-22
arc                          axs103_defconfig    clang-22
arc                        nsimosci_defconfig    clang-22
arc                 nsimosci_hs_smp_defconfig    clang-22
arc                   randconfig-001-20250902    gcc-8.5.0
arc                   randconfig-002-20250902    gcc-8.5.0
arc                           tb10x_defconfig    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                     davinci_all_defconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20250902    gcc-15.1.0
arm                   randconfig-001-20250902    gcc-8.5.0
arm                   randconfig-002-20250902    gcc-8.5.0
arm                   randconfig-003-20250902    clang-22
arm                   randconfig-003-20250902    gcc-8.5.0
arm                   randconfig-004-20250902    clang-22
arm                   randconfig-004-20250902    gcc-8.5.0
arm64                             allnoconfig    clang-22
arm64                 randconfig-001-20250902    gcc-8.5.0
arm64                 randconfig-002-20250902    gcc-8.5.0
arm64                 randconfig-003-20250902    gcc-8.5.0
arm64                 randconfig-004-20250902    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                  randconfig-001-20250902    gcc-11.5.0
csky                  randconfig-002-20250902    gcc-11.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon               randconfig-001-20250902    gcc-11.5.0
hexagon               randconfig-002-20250902    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250902    gcc-12
i386        buildonly-randconfig-002-20250902    gcc-12
i386        buildonly-randconfig-003-20250902    gcc-12
i386        buildonly-randconfig-004-20250902    gcc-12
i386        buildonly-randconfig-005-20250902    gcc-12
i386        buildonly-randconfig-006-20250902    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250902    gcc-12
i386                  randconfig-002-20250902    gcc-12
i386                  randconfig-003-20250902    gcc-12
i386                  randconfig-004-20250902    gcc-12
i386                  randconfig-005-20250902    gcc-12
i386                  randconfig-006-20250902    gcc-12
i386                  randconfig-007-20250902    gcc-12
i386                  randconfig-011-20250902    gcc-12
i386                  randconfig-012-20250902    gcc-12
i386                  randconfig-013-20250902    gcc-12
i386                  randconfig-014-20250902    gcc-12
i386                  randconfig-015-20250902    gcc-12
i386                  randconfig-016-20250902    gcc-12
i386                  randconfig-017-20250902    gcc-12
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250902    gcc-11.5.0
loongarch             randconfig-002-20250902    gcc-11.5.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250902    gcc-11.5.0
nios2                 randconfig-002-20250902    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-22
parisc                randconfig-001-20250902    gcc-11.5.0
parisc                randconfig-002-20250902    gcc-11.5.0
powerpc                           allnoconfig    clang-22
powerpc               randconfig-001-20250902    gcc-11.5.0
powerpc               randconfig-002-20250902    gcc-11.5.0
powerpc               randconfig-003-20250902    gcc-11.5.0
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20250902    gcc-11.5.0
powerpc64             randconfig-002-20250902    gcc-11.5.0
powerpc64             randconfig-003-20250902    gcc-11.5.0
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250902    gcc-12.5.0
riscv                 randconfig-002-20250902    gcc-12.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-12
s390                  randconfig-001-20250902    gcc-12.5.0
s390                  randconfig-002-20250902    gcc-12.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250902    gcc-12.5.0
sh                    randconfig-002-20250902    gcc-12.5.0
sh                           se7343_defconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250902    gcc-12.5.0
sparc                 randconfig-002-20250902    gcc-12.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250902    gcc-12.5.0
sparc64               randconfig-002-20250902    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250902    gcc-12.5.0
um                    randconfig-002-20250902    gcc-12.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250902    clang-20
x86_64      buildonly-randconfig-002-20250902    clang-20
x86_64      buildonly-randconfig-003-20250902    clang-20
x86_64      buildonly-randconfig-004-20250902    clang-20
x86_64      buildonly-randconfig-005-20250902    clang-20
x86_64      buildonly-randconfig-006-20250902    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250902    clang-20
x86_64                randconfig-002-20250902    clang-20
x86_64                randconfig-003-20250902    clang-20
x86_64                randconfig-004-20250902    clang-20
x86_64                randconfig-005-20250902    clang-20
x86_64                randconfig-006-20250902    clang-20
x86_64                randconfig-007-20250902    clang-20
x86_64                randconfig-008-20250902    clang-20
x86_64                randconfig-071-20250902    clang-20
x86_64                randconfig-072-20250902    clang-20
x86_64                randconfig-073-20250902    clang-20
x86_64                randconfig-074-20250902    clang-20
x86_64                randconfig-075-20250902    clang-20
x86_64                randconfig-076-20250902    clang-20
x86_64                randconfig-077-20250902    clang-20
x86_64                randconfig-078-20250902    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250902    gcc-12.5.0
xtensa                randconfig-002-20250902    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

