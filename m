Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04DCD3B7D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cW2TNtqNZNdYkp7BXUqakXDtbrDM+pmaTV9FonXRNmw=; b=jmZqscIPC0kImQEUiADkNPaxOX
	iFUCgkSdORF60B5x6FV2nMMNCVOxSlg5Y7RTa/XaMMYGnqtD6EiiRGCY23Qnso2IORKKPHjg+a+Av
	Ab8jCV4RdaJU7/n8/D8I6sI19BaZ+k2dP7apEzOcon1zCERbkUwzvdAc+1Jp5y7PxNhUoO8VJlNxs
	APN05jf7xgcvIw78s1NTRGMeaGrwMuYED67QWwImIX33u+TXdYeuDOw7wn/OdkJk6onVQCOdygrK9
	Ddp5U1idipJVBdMe+1iW6Ny/mdmJggZA65KKpkL8h6quf/aBbsPxVUnW8v1xqWj27+cZQP1lWi6EP
	TrB9W41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRtz8-0000000B1Lx-3nsD;
	Sat, 06 Dec 2025 15:14:10 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRtz4-0000000B1LT-2SU4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 15:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765034047; x=1796570047;
  h=date:from:to:cc:subject:message-id;
  bh=RP/NyejQWtkihUQbOKeBAEpedl3wk8reu0NRPSsYZ9o=;
  b=Wz0TD7kjS4OXt2nSRj8WmPgxdAfMmrC1OEaGmOy5dcu2t+POCikSHvVB
   HPY4Vd0Gzt8KZrrXiiwKTw+WxFXu2c6p85KAJd6AoHZGapnaJqgXZdDj7
   NJsW60LpZI287u6oCrpYAVOaBcHgOIwhWlm/BDm3Wml9LUaweU70kLzF4
   5SycZpSd++Cvl8my4wsqoIODEBBjvx1ocs4ZH/LbiKbBCNCfb+9gA9aZ/
   DWJyWhLqohZ6zoXtmhDtByH1Iz2GzZ0/kI78uxg0q/Jw0llrRPf08Kl30
   yx4qyLNpHpJVxcRvpe4oQHdY+21f2U+Hw9e6v1DuKkFHJ7MILAfoDMoL2
   w==;
X-CSE-ConnectionGUID: C4tn8vkaTNevGq+BpjicLQ==
X-CSE-MsgGUID: HEqcfZWlSOqFd5bSvJlnaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67009969"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67009969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 07:14:03 -0800
X-CSE-ConnectionGUID: tA9qWH+tRuCl/gLIXUxBGA==
X-CSE-MsgGUID: DCs6d5d3RL6FsCDHYHUHvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="194838204"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Dec 2025 07:14:02 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRtyx-00000000IHH-0YF3;
	Sat, 06 Dec 2025 15:13:59 +0000
Date: Sat, 06 Dec 2025 23:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 79edb7f596db99c01b25c1deebeffede6b48b505
Message-ID: <202512062325.cHG08zKn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_071408_606923_64B9708C 
X-CRM114-Status: UNSURE (   4.74  )
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
branch HEAD: 79edb7f596db99c01b25c1deebeffede6b48b505  Merge tag 'samsung-dt-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/dt

elapsed time: 1462m

configs tested: 104
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251206    gcc-8.5.0
arc                   randconfig-002-20251206    gcc-14.3.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251206    clang-22
arm                   randconfig-002-20251206    clang-22
arm                   randconfig-003-20251206    clang-16
arm                   randconfig-004-20251206    clang-20
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251206    gcc-8.5.0
arm64                 randconfig-002-20251206    clang-22
arm64                 randconfig-003-20251206    clang-22
arm64                 randconfig-004-20251206    gcc-8.5.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251206    gcc-15.1.0
csky                  randconfig-002-20251206    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251206    clang-16
hexagon               randconfig-002-20251206    clang-22
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251206    gcc-14
i386        buildonly-randconfig-002-20251206    gcc-14
i386        buildonly-randconfig-003-20251206    clang-20
i386        buildonly-randconfig-004-20251206    clang-20
i386        buildonly-randconfig-005-20251206    clang-20
i386        buildonly-randconfig-006-20251206    clang-20
i386                                defconfig    clang-20
i386                  randconfig-003-20251206    gcc-14
i386                  randconfig-004-20251206    gcc-14
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251206    gcc-15.1.0
loongarch             randconfig-002-20251206    gcc-12.5.0
m68k                                defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251206    gcc-8.5.0
nios2                 randconfig-002-20251206    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251206    gcc-11.5.0
parisc                randconfig-002-20251206    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251206    gcc-11.5.0
powerpc               randconfig-002-20251206    clang-22
powerpc64             randconfig-001-20251206    gcc-15.1.0
powerpc64             randconfig-002-20251206    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251206    clang-22
riscv                 randconfig-002-20251206    clang-19
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251206    clang-22
s390                  randconfig-002-20251206    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251206    gcc-15.1.0
sh                    randconfig-002-20251206    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251206    gcc-12.5.0
sparc                 randconfig-002-20251206    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251206    clang-22
sparc64               randconfig-002-20251206    gcc-8.5.0
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251206    gcc-14
um                    randconfig-002-20251206    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-002-20251206    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251206    clang-20
x86_64                randconfig-002-20251206    gcc-14
x86_64                randconfig-003-20251206    gcc-14
x86_64                randconfig-004-20251206    gcc-14
x86_64                randconfig-005-20251206    gcc-14
x86_64                randconfig-006-20251206    gcc-14
x86_64                randconfig-011-20251206    gcc-14
x86_64                randconfig-013-20251206    gcc-14
x86_64                randconfig-071-20251206    clang-20
x86_64                randconfig-072-20251206    clang-20
x86_64                randconfig-073-20251206    gcc-14
x86_64                randconfig-074-20251206    gcc-14
x86_64                randconfig-075-20251206    gcc-14
x86_64                randconfig-076-20251206    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251206    gcc-8.5.0
xtensa                randconfig-002-20251206    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

