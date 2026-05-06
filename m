Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1586CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 01:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0cm0ifwwN0JCutclMs82LFRzZCYDuo/17o1W1/k91BU=; b=4ZGOrFHe/TH80PhxC6M/kBxTeO
	9W6ADAxrFUDwkt3hysfzGofp9/HDFroU5rQnavdK55TQ4gpx3inXl64sicPa82JoUQhid6VB4zuqh
	rUNvfmNsW8qyi2olNd3p0WbGZ7KERfPJyqYLJa1AayzVKrcLIleLG990J1/j8hFIlDAqIG5Ig/hyB
	vMRZsOFHMfLovfFhi2dN4iSZp3spSOt/jwWZZJ9E5jzx7IWy/Cets/RDpYXPHvVMkFOwIowjcCALz
	RH2DbOTl4b1iI8Gd4g+9Ebr6zQQzLV9VYyB+KdGHDdEmo5myaT83AfktyfWOScCYVIA7SjT2wLgSq
	iHNWnHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQxu-00000000OWc-3Kfh;
	Wed, 06 May 2026 01:22:18 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQxs-00000000OVv-0WJe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 01:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778030536; x=1809566536;
  h=date:from:to:cc:subject:message-id;
  bh=Ztl6DJaG0TyE9wcP4i7s8ulbIRS3D8N7yZToICFHqWg=;
  b=lxdsM/mFj1f4GjGZYxhUjJ+q9W0F/xqiQZHICRNVHJoSa4p74zUvuky1
   fCay/PZhskVTcyXXrS813kUVIvTEFpivlMjn7Q6P8pdigeuggs0XAk6EV
   6xRorfaZ6unSABZNPJPnT4OeWdc4ZAiyfzdeAc7AfHFW7lwVdoDqBGeNb
   OQMNJgBiKiW4HrAn0GbuxqTZbt2lDbXDA5zqnMLf1sdOgODVF0P2uYKBO
   9rLMlpVz3zwCbkpVQMp8WCn4qJQdfKhlKe/f/qEQeoMWp064a66e/nwV6
   1EUbIgR+mfVUNyq8Ev8ucpSf8NWdHF0iANVyzu6o92gQ8T/nfnfAsNrct
   w==;
X-CSE-ConnectionGUID: zmZ91+OXSA2KxlE1QBUBtQ==
X-CSE-MsgGUID: UkLqboWxQFSGY5C9jtmSWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82766758"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="82766758"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 18:22:13 -0700
X-CSE-ConnectionGUID: 4RUGdHY4RhWtLj4OJA/MNg==
X-CSE-MsgGUID: pPVrQ36gTQG9idnozaQniQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="231589458"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2026 18:22:11 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKQxk-000000000aT-33V7;
	Wed, 06 May 2026 01:22:08 +0000
Date: Wed, 06 May 2026 09:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master] BUILD REGRESSION
 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
Message-ID: <202605060939.1pVmWmry-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_182216_222512_480764F4 
X-CRM114-Status: UNSURE (   5.79  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0  Add linux-next specific files for 20260505

Unverified Error/Warning (likely false positive, kindly check if interested):

    drivers/gpu/drm/xe/xe_hw_engine.c:481:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    drivers/misc/mei/vsc-fw-loader.c:646:34: sparse: sparse: incorrect type in assignment (different base types)
    ftrace.c:(.text+0x18): undefined reference to `__atomic_fetch_add_8'
    ld: ftrace.c:(.text+0x36): undefined reference to `__atomic_fetch_add_8'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-r061-20260505
|   |-- drivers-clk-mmp-clk-pxa1908-apbc.c:Unneeded-semicolon
|   `-- drivers-clk-mmp-clk-pxa1908-apbcp.c:Unneeded-semicolon
|-- arm64-randconfig-r121-20260505
|   `-- drivers-misc-mei-vsc-fw-loader.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-char-usertype-img_cnt-got-restricted-__le16-usertype
|-- i386-buildonly-randconfig-004
|   |-- ftrace.c:(.text):undefined-reference-to-__atomic_fetch_add_8
|   `-- ld:ftrace.c:(.text):undefined-reference-to-__atomic_fetch_add_8
`-- x86_64-dcg_x86_64_defconfig-func
    `-- drivers-gpu-drm-xe-xe_hw_engine.c:warning:the-frame-size-of-bytes-is-larger-than-bytes

elapsed time: 736m

configs tested: 202
configs skipped: 11

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260506    gcc-9.5.0
arc                   randconfig-002-20260506    gcc-12.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260506    clang-23
arm                   randconfig-002-20260506    clang-23
arm                   randconfig-003-20260506    gcc-13.4.0
arm                   randconfig-004-20260506    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260505    gcc-8.5.0
arm64                 randconfig-002-20260505    clang-16
arm64                 randconfig-003-20260505    clang-23
arm64                 randconfig-004-20260505    clang-23
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260505    gcc-15.2.0
csky                  randconfig-002-20260505    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260505    clang-23
hexagon               randconfig-002-20260505    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260505    gcc-13
i386        buildonly-randconfig-001-20260506    clang-20
i386        buildonly-randconfig-001-20260506    gcc-14
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260505    gcc-14
i386        buildonly-randconfig-002-20260506    clang-20
i386        buildonly-randconfig-002-20260506    gcc-14
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260505    clang-20
i386        buildonly-randconfig-003-20260506    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260505    clang-20
i386        buildonly-randconfig-004-20260506    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260505    gcc-14
i386        buildonly-randconfig-005-20260506    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260505    gcc-14
i386        buildonly-randconfig-006-20260506    clang-20
i386        buildonly-randconfig-006-20260506    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260505    gcc-14
i386                  randconfig-002-20260505    gcc-14
i386                  randconfig-003-20260505    clang-20
i386                  randconfig-004-20260505    gcc-14
i386                  randconfig-005-20260505    clang-20
i386                  randconfig-006-20260505    clang-20
i386                  randconfig-007-20260505    gcc-14
i386                  randconfig-011-20260506    clang-20
i386                  randconfig-012-20260506    clang-20
i386                  randconfig-013-20260506    clang-20
i386                  randconfig-014-20260506    clang-20
i386                  randconfig-014-20260506    gcc-14
i386                  randconfig-015-20260506    clang-20
i386                  randconfig-015-20260506    gcc-14
i386                  randconfig-016-20260506    clang-20
i386                  randconfig-017-20260506    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260505    clang-20
loongarch             randconfig-002-20260505    clang-18
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260505    gcc-8.5.0
nios2                 randconfig-002-20260505    gcc-9.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260506    gcc-13.4.0
parisc                randconfig-002-20260506    gcc-10.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260506    gcc-10.5.0
powerpc               randconfig-002-20260506    gcc-8.5.0
powerpc64             randconfig-001-20260506    gcc-8.5.0
powerpc64             randconfig-002-20260506    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260506    gcc-8.5.0
riscv                 randconfig-002-20260506    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260506    gcc-11.5.0
s390                  randconfig-002-20260506    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                         ap325rxa_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260506    gcc-12.5.0
sh                    randconfig-002-20260506    gcc-9.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260506    gcc-15.2.0
sparc                 randconfig-002-20260506    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260506    clang-23
sparc64               randconfig-002-20260506    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260506    gcc-14
um                    randconfig-002-20260506    clang-23
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260506    clang-20
x86_64      buildonly-randconfig-002-20260506    gcc-14
x86_64      buildonly-randconfig-003-20260506    clang-20
x86_64      buildonly-randconfig-004-20260506    clang-20
x86_64      buildonly-randconfig-005-20260506    gcc-12
x86_64      buildonly-randconfig-006-20260506    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260505    clang-20
x86_64                randconfig-001-20260506    clang-20
x86_64                randconfig-002-20260505    gcc-14
x86_64                randconfig-002-20260506    clang-20
x86_64                randconfig-003-20260505    clang-20
x86_64                randconfig-003-20260506    clang-20
x86_64                randconfig-004-20260505    clang-20
x86_64                randconfig-004-20260506    clang-20
x86_64                randconfig-005-20260505    clang-20
x86_64                randconfig-005-20260506    clang-20
x86_64                randconfig-006-20260505    clang-20
x86_64                randconfig-006-20260506    clang-20
x86_64                randconfig-011-20260505    clang-20
x86_64                randconfig-012-20260505    clang-20
x86_64                randconfig-013-20260505    clang-20
x86_64                randconfig-014-20260505    clang-20
x86_64                randconfig-015-20260505    clang-20
x86_64                randconfig-016-20260505    gcc-14
x86_64                randconfig-071-20260506    clang-20
x86_64                randconfig-071-20260506    gcc-14
x86_64                randconfig-072-20260506    clang-20
x86_64                randconfig-072-20260506    gcc-14
x86_64                randconfig-073-20260506    clang-20
x86_64                randconfig-073-20260506    gcc-14
x86_64                randconfig-074-20260506    clang-20
x86_64                randconfig-075-20260506    clang-20
x86_64                randconfig-075-20260506    gcc-14
x86_64                randconfig-076-20260506    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260506    gcc-15.2.0
xtensa                randconfig-002-20260506    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

