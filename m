Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5818AD1D48A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 20:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4A2RBTsz+lMEbHenVoitsDsyHPVgkAMP7JsVIEh2xA8=; b=YlYUfFYBggiv4BVBL7j5IxMPmp
	SZqUKlMzMS1Q0xvLLSRynGaG4QEz/4zQBoHwWtUosahGV82dF1QOjGzJt4QQFIBRnjeedZ0RR1I6/
	IRfrjkqnoKB0tbCCMk0nYwR9BEy6PNeQSeS66c/UC8RnFR09X4sgWBLIht9PyI9A+s6OnIUQsGopk
	/OGRwlKmhupevJ26Pf0ky+gSNqnbL4wXGpbf6azfbc9LMf74qJhivt9yxvM5mrO8hBf2a2MuHjUU8
	bp80vMw/H6mERqCl4KOphSVIE/L8y00McT+d1EPZ3rYD5Hmk/ZsypLM8M7gs7q1ics6WDRzwmBqiR
	NeEG8U9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwOd-00000000o1X-2mdl;
	Thu, 08 Jan 2026 20:14:15 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwOa-00000000o16-11iA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 20:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767903252; x=1799439252;
  h=date:from:to:cc:subject:message-id;
  bh=j/tbNj2D6fsTlkdjq6PnPNPwDLhay422D7AlW0jqKu8=;
  b=eWp2dBY4tV1tOeixyzXJxd3maykmRhUX2Lgq7EONMr68hyomVpPB02Qk
   4qkj+RBNY0cPdEDuwgQsjk3oJA6/ojgbmj3oB7l2xhauABMzPgTnLgQ54
   7SEm/zTXmn3OrV9NPJrxGpgjm1YKpx3fyhBDFSZtDnJ12zF+E5kNHBS24
   mtw3ho0kLmLjZ2rdSt4+NYbzbj2taA4YGYiuFFGk7S5uGxG6f+ZHHQUS+
   bWqpLjzZ+Wjg9Wm3C8B8mqV+EiUq4r1wON/OqhELA7GWaf9ZD6mj1ORNb
   AMkVKGP9bsEwtF1WRi2n9U2p+Jpvqqos+Xv07PtA+vY8U0qndRywW995i
   g==;
X-CSE-ConnectionGUID: HFcNy2IlQpyWlGQ73vLlTQ==
X-CSE-MsgGUID: DfDKC52ySq2+6IMuBBPdkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="91951478"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="91951478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 12:14:11 -0800
X-CSE-ConnectionGUID: gyYRJ9WVSJmq/zPLWU6FbQ==
X-CSE-MsgGUID: p+/nGg6gRbqYtS1mIZrYNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="208133648"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jan 2026 12:14:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdwOV-0000000057s-0wjr;
	Thu, 08 Jan 2026 20:14:07 +0000
Date: Fri, 09 Jan 2026 04:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 bf104037ebd5c1774fa736050a484c1f28cb2e6b
Message-ID: <202601090417.w08oSwkZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_121412_329464_02B861EE 
X-CRM114-Status: UNSURE (   5.21  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: bf104037ebd5c1774fa736050a484c1f28cb2e6b  arm64: dts: hisilicon: hikey960: Drop "snps,gctl-reset-quirk" and "snps,tx_de_emphasis*" properties

elapsed time: 1636m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20260108    gcc-9.5.0
arc                   randconfig-002-20260108    gcc-9.5.0
arm                               allnoconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                   randconfig-001-20260108    gcc-9.5.0
arm                   randconfig-002-20260108    gcc-9.5.0
arm                   randconfig-003-20260108    gcc-9.5.0
arm                   randconfig-004-20260108    gcc-9.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20260108    gcc-10.5.0
arm64                 randconfig-002-20260108    gcc-10.5.0
arm64                 randconfig-003-20260108    gcc-10.5.0
arm64                 randconfig-004-20260108    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20260108    gcc-10.5.0
csky                  randconfig-002-20260108    gcc-10.5.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon               randconfig-001-20260108    gcc-8.5.0
hexagon               randconfig-002-20260108    gcc-8.5.0
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260108    clang-20
i386        buildonly-randconfig-002-20260108    clang-20
i386        buildonly-randconfig-003-20260108    clang-20
i386        buildonly-randconfig-004-20260108    clang-20
i386        buildonly-randconfig-005-20260108    clang-20
i386        buildonly-randconfig-006-20260108    clang-20
i386                  randconfig-001-20260108    gcc-14
i386                  randconfig-002-20260108    gcc-14
i386                  randconfig-003-20260108    gcc-14
i386                  randconfig-004-20260108    gcc-14
i386                  randconfig-005-20260108    gcc-14
i386                  randconfig-006-20260108    gcc-14
i386                  randconfig-007-20260108    gcc-14
i386                  randconfig-011-20260108    gcc-14
i386                  randconfig-012-20260108    gcc-14
i386                  randconfig-013-20260108    gcc-14
i386                  randconfig-014-20260108    gcc-14
i386                  randconfig-015-20260108    gcc-14
i386                  randconfig-016-20260108    gcc-14
i386                  randconfig-017-20260108    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260108    gcc-8.5.0
loongarch             randconfig-002-20260108    gcc-8.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                  decstation_64_defconfig    gcc-15.1.0
mips                      loongson3_defconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260108    gcc-8.5.0
nios2                 randconfig-002-20260108    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260108    clang-22
parisc                randconfig-002-20260108    clang-22
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc               randconfig-001-20260108    clang-22
powerpc               randconfig-002-20260108    clang-22
powerpc64             randconfig-001-20260108    clang-22
powerpc64             randconfig-002-20260108    clang-22
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20260108    gcc-13.4.0
riscv                 randconfig-002-20260108    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20260108    gcc-13.4.0
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260108    gcc-13.4.0
sh                    randconfig-002-20260108    gcc-13.4.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260108    gcc-8.5.0
sparc                 randconfig-002-20260108    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260108    gcc-8.5.0
sparc64               randconfig-002-20260108    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260108    gcc-8.5.0
um                    randconfig-002-20260108    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260108    gcc-14
x86_64      buildonly-randconfig-002-20260108    gcc-14
x86_64      buildonly-randconfig-003-20260108    gcc-14
x86_64      buildonly-randconfig-004-20260108    gcc-14
x86_64      buildonly-randconfig-005-20260108    gcc-14
x86_64      buildonly-randconfig-006-20260108    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260108    gcc-12
x86_64                randconfig-002-20260108    gcc-12
x86_64                randconfig-003-20260108    gcc-12
x86_64                randconfig-004-20260108    gcc-12
x86_64                randconfig-005-20260108    gcc-12
x86_64                randconfig-006-20260108    gcc-12
x86_64                randconfig-011-20260108    clang-20
x86_64                randconfig-012-20260108    clang-20
x86_64                randconfig-013-20260108    clang-20
x86_64                randconfig-014-20260108    clang-20
x86_64                randconfig-015-20260108    clang-20
x86_64                randconfig-016-20260108    clang-20
x86_64                randconfig-071-20260108    gcc-14
x86_64                randconfig-072-20260108    gcc-14
x86_64                randconfig-073-20260108    gcc-14
x86_64                randconfig-074-20260108    gcc-14
x86_64                randconfig-075-20260108    gcc-14
x86_64                randconfig-076-20260108    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260108    gcc-8.5.0
xtensa                randconfig-002-20260108    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

