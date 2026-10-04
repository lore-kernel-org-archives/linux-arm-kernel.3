Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C435ECA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MMnrUg5AqsAHELz/FzoNpL9y+fVJvucpP5Pn6l2j8TA=; b=Xeb92VA/PajZ6jPAzReH3JIEPA
	1gT99Hk3uNID+7dRmpwezVWMBqf7NYySjaLJP3hdf0cPUouS10YLAIJX0mfvbLOeFV9nJranXNNOw
	83oodYXXRLBA2TEhb98pe+Mm7xqy9JkV9qVvyAHmyRb/SgGjpSZ6I9Vhu4zt5JxoNSRVd6vlxtno4
	ihtjaRKv/LwoAgLo/ugazR/EwoUoS9VeSm5Ojy3s9HNG0As4O02VVaXbxGjQc3E2Q7jIjpBtJ0ikT
	YRIGvXp3HBeuVZyIDGfns06xb/Nwe0cPsK6cVAJ18kN2qVcCvaZiA/ybGUxc4Bq9RyVTnUpdLzYXe
	xgHXgqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFXr-0000000EQC3-3abQ;
	Sun, 04 Oct 2026 06:17:59 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFXo-0000000EQBi-1uJ1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791094676; x=1822630676;
  h=date:from:to:cc:subject:message-id;
  bh=CXTjXAb1DHs0FGMFdO8YkjDVVrUcOGSX0TR4zvUAX9g=;
  b=DqGhduRIL2OaXOkDS22Zg+N+45nLjwkK5jsups2vai6k06braaDaA7jO
   UQwYb5v5mVghE4H3eURkx+yeD/omdT9zFUfNQvm+6phxUasUNAb1Nbcql
   vcQWDw5zCmcS60G2xKNp+2iQOwdndMnAFfCGXjRfPd197doQpVyo0NG5f
   Qe5tH1L1MX1u/MT7PO6Bh1N4NIYGTtQyef6aTQ3yeS9g15u2f/sTmjmtt
   ttS2eDsHvTuGR0xGiNfs7Ys9RxTOHsYYuGEVmAR1IxEd3VM55rYo1O9aF
   zuQ2vK5+ig02VbtDFcAJMKO2fFHOA5c4r45iZE8kS3lO+zlLH8crCxRN9
   Q==;
X-CSE-ConnectionGUID: GxjykobMS76ywbEbE8kI3w==
X-CSE-MsgGUID: D6xbd8+eRKqq0KqidWqyzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91904782"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91904782"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 23:17:55 -0700
X-CSE-ConnectionGUID: nT3yyijIQlmU+sRJ4ZGJPA==
X-CSE-MsgGUID: NwtCSREiQMWlgoMl1s6lxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="550649"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 03 Oct 2026 23:17:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDFXi-00000000UXD-38sh;
	Sun, 04 Oct 2026 06:17:50 +0000
Date: Sun, 04 Oct 2026 14:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 8edc6ba15f434fd2b7a58c3151061bd6b6a19aa4
Message-ID: <202610041435.k8TJLkbb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_231756_539917_DF2727E8 
X-CRM114-Status: UNSURE (   5.26  )
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
branch HEAD: 8edc6ba15f434fd2b7a58c3151061bd6b6a19aa4  soc: document merges

elapsed time: 1485m

configs tested: 279
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2202-20261003    gcc-11.5.0 smatch
alpha                randconfig-r2303-20261003    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261004    clang-22
arc                   randconfig-1001-20261004    clang-22
arc                  randconfig-r2105-20261003    gcc-8.5.0  cocci
arc                  randconfig-r2106-20261003    gcc-8.5.0  cocci
arc                  randconfig-r2200-20261003    gcc-12.5.0 smatch
arc                  randconfig-r2302-20261003    gcc-13.4.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             qcom_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261004    clang-22
arm                   randconfig-1001-20261004    clang-22
arm                   randconfig-1002-20261004    clang-22
arm                   randconfig-1003-20261004    clang-22
arm                  randconfig-r2103-20261003    gcc-14     cocci
arm                  randconfig-r2309-20261003    gcc-8.5.0  sparse
arm                          s3c6400_defconfig    gcc-16.1.0
arm                     vt8500_v6_v7_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261004    gcc-16.1.0
arm64                 randconfig-1001-20261004    gcc-16.1.0
arm64                 randconfig-1002-20261004    gcc-16.1.0
arm64                 randconfig-1003-20261004    gcc-16.1.0
arm64                randconfig-r2106-20261003    clang-19   cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261004    gcc-16.1.0
csky                  randconfig-1001-20261004    gcc-16.1.0
csky                 randconfig-r2303-20261003    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261004    gcc-16.1.0
hexagon               randconfig-1001-20261004    gcc-16.1.0
hexagon              randconfig-r2100-20261003    gcc-8.5.0  cocci
hexagon              randconfig-r2105-20261003    clang-19   cocci
hexagon              randconfig-r2107-20261003    clang-19   cocci
hexagon              randconfig-r2307-20261003    gcc-16.1.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261004    clang-22
i386        buildonly-randconfig-1001-20261004    clang-22
i386        buildonly-randconfig-1002-20261004    clang-22
i386        buildonly-randconfig-1003-20261004    clang-22
i386        buildonly-randconfig-1004-20261004    clang-22
i386        buildonly-randconfig-1005-20261004    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261004    gcc-14
i386                  randconfig-1001-20261004    gcc-14
i386                  randconfig-1002-20261004    gcc-14
i386                  randconfig-1003-20261004    gcc-14
i386                  randconfig-1004-20261004    gcc-14
i386                  randconfig-1005-20261004    gcc-14
i386                  randconfig-1006-20261004    gcc-14
i386                  randconfig-1007-20261004    clang-22
i386                  randconfig-1008-20261004    clang-22
i386                  randconfig-1009-20261004    clang-22
i386                  randconfig-1010-20261004    clang-22
i386                  randconfig-1011-20261004    clang-22
i386                  randconfig-1012-20261004    clang-22
i386                  randconfig-1013-20261004    clang-22
i386                  randconfig-2100-20261003    gcc-14     cocci
i386                  randconfig-2101-20261003    gcc-14     cocci
i386                  randconfig-2102-20261003    gcc-14     cocci
i386                  randconfig-2103-20261003    gcc-14     cocci
i386                  randconfig-2200-20261003    gcc-14     smatch
i386                  randconfig-2300-20261003    clang-22   sparse
i386                  randconfig-2301-20261003    clang-22   sparse
i386                  randconfig-2302-20261003    clang-22   sparse
i386                 randconfig-r2302-20261003    gcc-16.1.0 sparse
i386                 randconfig-r2306-20261003    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261004    gcc-16.1.0
loongarch             randconfig-1001-20261004    gcc-16.1.0
loongarch            randconfig-r2300-20261003    gcc-16.1.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          apollo_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                 randconfig-r2304-20261003    gcc-13.4.0 sparse
m68k                 randconfig-r2306-20261003    gcc-16.1.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2201-20261003    gcc-13.4.0 smatch
microblaze           randconfig-r2301-20261003    gcc-16.1.0 sparse
microblaze           randconfig-r2301-20261003    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                            ip32_defconfig    gcc-16.1.0
mips                 malta_qemu_32r6_defconfig    gcc-16.1.0
mips                 randconfig-r2102-20261003    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261003    gcc-8.5.0  cocci
mips                 randconfig-r2303-20261003    gcc-13.4.0 sparse
mips                 randconfig-r2309-20261003    gcc-16.1.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261004    gcc-16.1.0
nios2                 randconfig-1001-20261004    gcc-16.1.0
nios2                randconfig-r2100-20261003    gcc-14     cocci
nios2                randconfig-r2101-20261003    gcc-14     cocci
nios2                randconfig-r2200-20261003    gcc-8.5.0  smatch
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261003    gcc-8.5.0  cocci
openrisc             randconfig-r2202-20261003    gcc-12.5.0 smatch
openrisc             randconfig-r2300-20261003    gcc-8.5.0  sparse
openrisc             randconfig-r2307-20261003    gcc-14     sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-32bit_defconfig    gcc-16.1.0
parisc                randconfig-1000-20261004    gcc-12.5.0
parisc                randconfig-1001-20261004    gcc-12.5.0
parisc               randconfig-r2101-20261003    gcc-8.5.0  cocci
parisc               randconfig-r2104-20261003    gcc-8.5.0  cocci
parisc               randconfig-r2202-20261003    gcc-14.3.0 smatch
parisc               randconfig-r2304-20261003    gcc-8.5.0  sparse
parisc               randconfig-r2305-20261003    gcc-8.5.0  sparse
parisc               randconfig-r2308-20261003    gcc-14     sparse
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                      kmeter1_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261004    gcc-12.5.0
powerpc               randconfig-1001-20261004    gcc-12.5.0
powerpc64             randconfig-1000-20261004    gcc-12.5.0
powerpc64             randconfig-1001-20261004    gcc-12.5.0
powerpc64            randconfig-r2300-20261003    gcc-13.4.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261004    gcc-11.5.0
riscv                 randconfig-1001-20261004    gcc-11.5.0
riscv                 randconfig-2000-20261003    gcc-16.1.0
riscv                 randconfig-2001-20261003    gcc-16.1.0
riscv                randconfig-r2201-20261003    clang-24   smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261004    gcc-11.5.0
s390                  randconfig-1001-20261004    gcc-11.5.0
s390                  randconfig-2000-20261003    gcc-16.1.0
s390                  randconfig-2001-20261003    gcc-16.1.0
s390                 randconfig-r2103-20261003    gcc-8.5.0  cocci
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261004    gcc-11.5.0
sh                    randconfig-1001-20261004    gcc-11.5.0
sh                    randconfig-2000-20261003    gcc-16.1.0
sh                    randconfig-2001-20261003    gcc-16.1.0
sh                   randconfig-r2101-20261003    gcc-8.5.0  cocci
sh                   randconfig-r2201-20261003    gcc-16.1.0 smatch
sh                   randconfig-r2301-20261003    gcc-13.4.0 sparse
sh                   randconfig-r2306-20261003    gcc-14     sparse
sh                            se7724_defconfig    gcc-16.1.0
sh                      sh7710voipgw_defconfig    gcc-16.1.0
sh                         sh7785lcr_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261004    gcc-14
sparc                 randconfig-1001-20261004    gcc-14
sparc                 randconfig-2000-20261003    gcc-14
sparc                 randconfig-2001-20261003    gcc-14
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261004    gcc-14
sparc64               randconfig-1001-20261004    gcc-14
sparc64               randconfig-2000-20261003    gcc-14
sparc64               randconfig-2001-20261003    gcc-14
sparc64              randconfig-r2100-20261003    gcc-8.5.0  cocci
sparc64              randconfig-r2302-20261003    gcc-8.5.0  sparse
sparc64              randconfig-r2304-20261003    gcc-16.1.0 sparse
sparc64              randconfig-r2305-20261003    gcc-13.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261004    gcc-14
um                    randconfig-1001-20261004    gcc-14
um                    randconfig-2000-20261003    gcc-14
um                    randconfig-2001-20261003    gcc-14
um                   randconfig-r2102-20261003    gcc-8.5.0  cocci
um                   randconfig-r2104-20261003    clang-19   cocci
um                   randconfig-r2308-20261003    gcc-16.1.0 sparse
um                   randconfig-r2309-20261003    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261004    gcc-14
x86_64      buildonly-randconfig-1001-20261004    gcc-14
x86_64      buildonly-randconfig-1002-20261004    gcc-14
x86_64      buildonly-randconfig-1003-20261004    gcc-14
x86_64      buildonly-randconfig-1004-20261004    gcc-14
x86_64      buildonly-randconfig-1005-20261004    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261004    gcc-14
x86_64                randconfig-1001-20261004    gcc-14
x86_64                randconfig-1002-20261004    gcc-14
x86_64                randconfig-1003-20261004    gcc-14
x86_64                randconfig-1004-20261004    gcc-14
x86_64                randconfig-1005-20261004    gcc-14
x86_64                randconfig-1006-20261004    clang-22
x86_64                randconfig-1007-20261004    clang-22
x86_64                randconfig-1008-20261004    clang-22
x86_64                randconfig-1009-20261004    clang-22
x86_64                randconfig-1010-20261004    clang-22
x86_64                randconfig-1011-20261004    clang-22
x86_64                randconfig-1012-20261004    gcc-13
x86_64                randconfig-1013-20261004    gcc-13
x86_64                randconfig-1014-20261004    gcc-13
x86_64                randconfig-1015-20261004    gcc-13
x86_64                randconfig-1016-20261004    gcc-13
x86_64                randconfig-1017-20261004    gcc-13
x86_64                randconfig-2100-20261003    clang-22   cocci
x86_64                randconfig-2101-20261003    clang-22   cocci
x86_64                randconfig-2102-20261003    clang-22   cocci
x86_64                randconfig-2103-20261003    clang-22   cocci
x86_64                randconfig-2200-20261003    gcc-14     smatch
x86_64                randconfig-2300-20261003    clang-22   sparse
x86_64                randconfig-2301-20261003    clang-22   sparse
x86_64                randconfig-2302-20261003    clang-22   sparse
x86_64               randconfig-r2102-20261003    gcc-14     cocci
x86_64               randconfig-r2308-20261003    gcc-8.5.0  sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261004    gcc-14
xtensa                randconfig-1001-20261004    gcc-14
xtensa                randconfig-2000-20261003    gcc-14
xtensa                randconfig-2001-20261003    gcc-14
xtensa               randconfig-r2107-20261003    gcc-8.5.0  cocci
xtensa               randconfig-r2200-20261003    gcc-8.5.0  smatch
xtensa               randconfig-r2202-20261003    gcc-8.5.0  smatch
xtensa               randconfig-r2305-20261003    gcc-16.1.0 sparse
xtensa               randconfig-r2307-20261003    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

