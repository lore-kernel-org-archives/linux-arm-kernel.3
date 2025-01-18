Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D24C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WojdggSZ71LsZ/bschS24LIE33M3BFHZ9LRodDjhq/Q=; b=yyJB2f0ncozjVOeM+Toc6TkiQ+
	HbBjkCnfipBoAFdsNlDsw+uHqjqMzDeFtLbfrQDKIq3+bk/ePRxFpN8Vm4Ar5EBbhQwDY2pb5Jizs
	8OCMHieuGDGFkvVogIOullFqnAsfLwML8nKQrvMo1wipEsP4eG7dNrczSXdf8lW65rQRv3HNqRdNj
	spIytIzz0+cVFPhlEVw4k9mS9Ck88/+wAAYdZ/+vvM6Vo8V/KnJ83BbRkZOi+HsbxhiuUr5SQJy9Z
	vq6b4QvNCIcX+2hVwzZ4U3Ve3mwNRwTEejTBOst2POzPJ81Nsm1bBR9jAu9GFPKqItkERn4KaCYDo
	ZArnG2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8h4-00000002SOy-2ivJ;
	Sat, 18 Jan 2025 13:16:54 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8ad-00000002RhG-0tRl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 13:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737205815; x=1768741815;
  h=date:from:to:cc:subject:message-id;
  bh=LK67XhoYdFLP1j2J1pFmDC9V3bxVFX6C4HXrke4vQnk=;
  b=M0CIfEt2V1OIKqVpPzvfvHQ3qDUurGRVL7qgQYWfpzB8VePB5NLW9MNS
   bf9X2wNfP5i9BJC1SdKlu2svzQ4blMwvLcuvwyANweGxETTumBPH2Wjzg
   rvLWpvdu2jsQsyoMASnzY44UuMm6YLuUM85Gv2JgicOVsdChQgzeecQsO
   2YxI7CI6o3tQGhQzQcLKQaArQ89QcmrwYyDJwQP6C5QwU4vEqP3rB7oMV
   /aYGNfbPXptc5Xps1bkxKveJPXSiN2YeGyBT8LBSvbuUU09EfODBYAg9E
   tuoaHzollt5txyd4usasQaZOeltClG4DlR8TKnA4PR4Rc412V+O3M6v9B
   w==;
X-CSE-ConnectionGUID: F4n3HaKlRBqUtZCwVnIhzA==
X-CSE-MsgGUID: HiDi9iOCSeevk0w0vXVnKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37868449"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="37868449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:10:12 -0800
X-CSE-ConnectionGUID: m8YJVAz4SeeNtQLj9V28rw==
X-CSE-MsgGUID: lSkqI33gQD6Qw1wlaD+3Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136959892"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2025 05:10:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ8aW-000USE-2d;
	Sat, 18 Jan 2025 13:10:08 +0000
Date: Sat, 18 Jan 2025 21:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 fcf4173cc889f5a246d51a3c425f11d32ce615fc
Message-ID: <202501182149.nKPSBuvf-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_051015_262885_2E026B28 
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
branch HEAD: fcf4173cc889f5a246d51a3c425f11d32ce615fc  soc: document merges

elapsed time: 1449m

configs tested: 100
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250117    gcc-13.2.0
arc                   randconfig-002-20250117    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250117    clang-18
arm                   randconfig-002-20250117    gcc-14.2.0
arm                   randconfig-003-20250117    gcc-14.2.0
arm                   randconfig-004-20250117    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250117    gcc-14.2.0
arm64                 randconfig-002-20250117    clang-18
arm64                 randconfig-003-20250117    clang-20
arm64                 randconfig-004-20250117    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250117    gcc-14.2.0
csky                  randconfig-002-20250117    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250117    clang-20
hexagon               randconfig-002-20250117    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250117    clang-19
i386        buildonly-randconfig-002-20250117    clang-19
i386        buildonly-randconfig-003-20250117    gcc-12
i386        buildonly-randconfig-004-20250117    gcc-12
i386        buildonly-randconfig-005-20250117    clang-19
i386        buildonly-randconfig-006-20250117    gcc-11
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250117    gcc-14.2.0
loongarch             randconfig-002-20250117    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250117    gcc-14.2.0
nios2                 randconfig-002-20250117    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250117    gcc-14.2.0
parisc                randconfig-002-20250117    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250117    gcc-14.2.0
powerpc               randconfig-002-20250117    gcc-14.2.0
powerpc               randconfig-003-20250117    gcc-14.2.0
powerpc64             randconfig-001-20250117    clang-16
powerpc64             randconfig-002-20250117    clang-20
powerpc64             randconfig-003-20250117    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250117    gcc-14.2.0
riscv                 randconfig-002-20250117    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250117    gcc-14.2.0
s390                  randconfig-002-20250117    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250117    gcc-14.2.0
sh                    randconfig-002-20250117    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250117    gcc-14.2.0
sparc                 randconfig-002-20250117    gcc-14.2.0
sparc64               randconfig-001-20250117    gcc-14.2.0
sparc64               randconfig-002-20250117    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250117    clang-20
um                    randconfig-002-20250117    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250117    gcc-12
x86_64      buildonly-randconfig-002-20250117    gcc-12
x86_64      buildonly-randconfig-003-20250117    gcc-12
x86_64      buildonly-randconfig-004-20250117    gcc-12
x86_64      buildonly-randconfig-005-20250117    gcc-12
x86_64      buildonly-randconfig-006-20250117    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250117    gcc-14.2.0
xtensa                randconfig-002-20250117    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

