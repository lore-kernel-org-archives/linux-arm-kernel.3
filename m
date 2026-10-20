Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D3D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 00:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tkKXZiTw;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JIN5d3YB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MiFylPtqUnY6CrXGckpRmv7dEhkJ9zJR98ndxpWeOmo=; b=tkKXZiTwJ/pCRsCfJnbOlP8lIz
	+9gBIWeDu55X+YFqLkgONp54B9163p4MEYCc14dI1w5uAKhP626XXgt6LjiZ+dvuPFDS6tIQdRj/X
	Y6v6DgbKkoY3veDS9zKo11B4LpLn3Cy7kMXE/7PpZl6Ml6JoW1Lgil1g05u6vdksXGwt8PrVs+KGP
	MOhqMS36ssyJjkJnXKp+nBtoW29FcF0le7aiVEj2NZoknsCkBo/WgI+ibx1ph9hoKXGheGwQsdo18
	dR5YCRuFlLUXqD8hpu31kZhpO/gUjbic3K6/2yoJW3EShwV4QnRNZPM+eDKHPADUR6U/KqMI1GJI5
	BnkTmp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIxsk-00000008aS4-2s6Q;
	Tue, 20 Oct 2026 00:39:10 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIxsh-00000008aRk-42br
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 00:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792456748; x=1823992748;
  h=date:from:to:cc:subject:message-id;
  bh=hcO501BivjCbBcTmBdoOrLWPBFGTklG/MABp9fvKTj8=;
  b=JIN5d3YBp/P5upBlffWCJsGdbLlSTQS6zEJk76Vq8QMbieAYmbwJ9qhR
   PxzS7Ux8rsZxbjKFUQWmunE+r1ME0vMp1jP9aTUqPs/CPk12rxS6qykOB
   RttSriWbI6ExuBIwJObxrqN90LrPkwofRbGWRSB4Eoil0xIJOZapSLbVb
   VOwwEeJhn3yfS12S53f14yhDFPxXklTfP7MYo9zSQu2Flf5qbikQ2wIKD
   eO2K+p++WSZHaVqCDwZx0ubDZIkmoCEOYMVrgt1F8x38wQBkaWV+QklZt
   iwZ9Fg3SzWC7m3izoCSYKM3gp/17gFaKxArfv0IUD10fpb4e8GgSQc8co
   w==;
X-CSE-ConnectionGUID: eivxoltaQAmtieJ9ykyQmw==
X-CSE-MsgGUID: K9eRckvvQsmMN3YdGrSSKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1187690"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1187690"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 17:39:05 -0700
X-CSE-ConnectionGUID: ceMJn+TFQWSMrb4Ca4eJ7w==
X-CSE-MsgGUID: EagpmG2STTiVXD4lXXbWwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2717174"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Oct 2026 17:39:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIxsb-00000000MfG-3typ;
	Tue, 20 Oct 2026 00:39:01 +0000
Date: Tue, 20 Oct 2026 08:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 a32ef3f1c49fd8128b5fe1e79b9738a54cd15127
Message-ID: <202610200836.8u3Cyyii-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_173908_173177_DD5A7750 
X-CRM114-Status: UNSURE (   5.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: a32ef3f1c49fd8128b5fe1e79b9738a54cd15127  soc: document merges

elapsed time: 2572m

configs tested: 254
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261019    clang-21
arc                   randconfig-1000-20261020    gcc-10.5.0
arc                   randconfig-1001-20261019    clang-21
arc                   randconfig-1001-20261020    gcc-10.5.0
arm                                allnoconfig    clang-17
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                        imx_v4_v5_defconfig    gcc-16.2.0
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261019    clang-21
arm                   randconfig-1000-20261020    gcc-10.5.0
arm                   randconfig-1001-20261019    clang-21
arm                   randconfig-1001-20261020    gcc-10.5.0
arm                   randconfig-1002-20261019    clang-21
arm                   randconfig-1002-20261020    gcc-10.5.0
arm                   randconfig-1003-20261019    clang-21
arm                   randconfig-1003-20261020    gcc-10.5.0
arm                            sama7_defconfig    gcc-16.2.0
arm                     vt8500_v6_v7_defconfig    gcc-16.2.0
arm                          wpcm450_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261019    clang-24
arm64                 randconfig-1000-20261020    gcc-8.5.0
arm64                 randconfig-1001-20261019    clang-24
arm64                 randconfig-1001-20261020    gcc-8.5.0
arm64                 randconfig-1002-20261019    clang-24
arm64                 randconfig-1002-20261020    gcc-8.5.0
arm64                 randconfig-1003-20261019    clang-24
arm64                 randconfig-1003-20261020    gcc-8.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261019    clang-24
csky                  randconfig-1000-20261020    gcc-8.5.0
csky                  randconfig-1001-20261019    clang-24
csky                  randconfig-1001-20261020    gcc-8.5.0
hexagon                           allmodconfig    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    clang-24
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261019    clang-24
hexagon               randconfig-1000-20261020    clang-17
hexagon               randconfig-1001-20261019    clang-24
hexagon               randconfig-1001-20261020    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-14
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261020    clang-22
i386        buildonly-randconfig-1001-20261020    clang-22
i386        buildonly-randconfig-1002-20261020    clang-22
i386        buildonly-randconfig-1003-20261020    clang-22
i386        buildonly-randconfig-1004-20261020    clang-22
i386        buildonly-randconfig-1005-20261020    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261019    clang-22
i386                  randconfig-1000-20261020    gcc-14
i386                  randconfig-1001-20261019    clang-22
i386                  randconfig-1001-20261020    gcc-14
i386                  randconfig-1002-20261019    clang-22
i386                  randconfig-1002-20261020    gcc-14
i386                  randconfig-1003-20261019    clang-22
i386                  randconfig-1003-20261020    gcc-14
i386                  randconfig-1004-20261019    clang-22
i386                  randconfig-1004-20261020    gcc-14
i386                  randconfig-1005-20261019    clang-22
i386                  randconfig-1005-20261020    gcc-14
i386                  randconfig-1006-20261019    clang-22
i386                  randconfig-1006-20261020    gcc-14
i386                  randconfig-1007-20261019    gcc-14
i386                  randconfig-1008-20261019    gcc-14
i386                  randconfig-1009-20261019    gcc-14
i386                  randconfig-1010-20261019    gcc-14
i386                  randconfig-1011-20261019    gcc-14
i386                  randconfig-1012-20261019    gcc-14
i386                  randconfig-1013-20261019    gcc-14
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    clang-20
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261019    clang-24
loongarch             randconfig-1000-20261020    clang-17
loongarch             randconfig-1001-20261019    clang-24
loongarch             randconfig-1001-20261020    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-16.2.0
m68k                          nettel_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                    sb1250_swarm_defconfig    gcc-16.2.0
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261019    clang-24
nios2                 randconfig-1000-20261020    clang-17
nios2                 randconfig-1001-20261019    clang-24
nios2                 randconfig-1001-20261020    clang-17
openrisc                          allmodconfig    gcc-11.5.0
openrisc                          allmodconfig    gcc-16.2.0
openrisc                           allnoconfig    clang-24
openrisc                           allnoconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc                   or1klitex_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                             allnoconfig    gcc-16.2.0
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.2.0
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261019    gcc-8.5.0
parisc                randconfig-1000-20261020    clang-17
parisc                randconfig-1001-20261019    gcc-8.5.0
parisc                randconfig-1001-20261020    clang-17
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                            allnoconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc                       ppc64e_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261019    gcc-8.5.0
powerpc               randconfig-1000-20261020    clang-17
powerpc               randconfig-1001-20261019    gcc-8.5.0
powerpc               randconfig-1001-20261020    clang-17
powerpc              randconfig-r2200-20261019    gcc-15.3.0 smatch
powerpc                      stx_gp3_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261019    gcc-8.5.0
powerpc64             randconfig-1000-20261020    clang-17
powerpc64             randconfig-1001-20261019    gcc-8.5.0
powerpc64             randconfig-1001-20261020    clang-17
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                              allnoconfig    gcc-16.2.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261019    gcc-11.5.0
riscv                 randconfig-1000-20261020    gcc-11.5.0
riscv                 randconfig-1001-20261019    gcc-11.5.0
riscv                 randconfig-1001-20261020    gcc-11.5.0
riscv                randconfig-r2201-20261019    gcc-8.5.0  smatch
s390                              allmodconfig    clang-17
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261019    gcc-11.5.0
s390                  randconfig-1000-20261020    gcc-11.5.0
s390                  randconfig-1001-20261019    gcc-11.5.0
s390                  randconfig-1001-20261020    gcc-11.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                 allnoconfig    gcc-16.2.0
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.2.0
sh                                j2_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261019    gcc-11.5.0
sh                    randconfig-1000-20261020    gcc-11.5.0
sh                    randconfig-1001-20261019    gcc-11.5.0
sh                    randconfig-1001-20261020    gcc-11.5.0
sh                            se7619_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                              allnoconfig    gcc-16.2.0
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261020    clang-20
sparc                 randconfig-1001-20261020    clang-20
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261020    clang-20
sparc64               randconfig-1001-20261020    clang-20
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-14
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261020    clang-20
um                    randconfig-1001-20261020    clang-20
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261020    gcc-14
x86_64      buildonly-randconfig-1001-20261020    gcc-14
x86_64      buildonly-randconfig-1002-20261020    gcc-14
x86_64      buildonly-randconfig-1003-20261020    gcc-14
x86_64      buildonly-randconfig-1004-20261020    gcc-14
x86_64      buildonly-randconfig-1005-20261020    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261019    clang-22
x86_64                randconfig-1001-20261019    clang-22
x86_64                randconfig-1002-20261019    clang-22
x86_64                randconfig-1003-20261019    clang-22
x86_64                randconfig-1004-20261019    clang-22
x86_64                randconfig-1005-20261019    clang-22
x86_64                randconfig-1006-20261019    clang-22
x86_64                randconfig-1007-20261019    clang-22
x86_64                randconfig-1008-20261019    clang-22
x86_64                randconfig-1009-20261019    clang-22
x86_64                randconfig-1010-20261019    clang-22
x86_64                randconfig-1011-20261019    clang-22
x86_64                randconfig-1012-20261019    gcc-14
x86_64                randconfig-1012-20261020    clang-22
x86_64                randconfig-1013-20261019    gcc-14
x86_64                randconfig-1013-20261020    clang-22
x86_64                randconfig-1014-20261019    gcc-14
x86_64                randconfig-1014-20261020    clang-22
x86_64                randconfig-1015-20261019    gcc-14
x86_64                randconfig-1015-20261020    clang-22
x86_64                randconfig-1016-20261019    gcc-14
x86_64                randconfig-1016-20261020    clang-22
x86_64                randconfig-1017-20261019    gcc-14
x86_64                randconfig-1017-20261020    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                                rhel-9.4    gcc-14
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                           rhel-9.4-func    gcc-14
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                     rhel-9.4-kselftests    gcc-14
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                             allnoconfig    gcc-16.2.0
xtensa                            allyesconfig    gcc-16.2.0
xtensa                randconfig-1000-20261020    clang-20
xtensa                randconfig-1001-20261020    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

