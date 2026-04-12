Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82BBF3ED5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 05:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eZxJFHgMUogywGKOkV71O7vhZDDU66PWtOfYgg2CUdM=; b=jMPSXeQgSw7HpdlGKRzv6YQUdQ
	DYMCg4feazKavkOc8UgHOVPujhSqsCevnsV+hvLmFCtzGMDpmuhRiUxkbiUGs1nerINMuCSo/Yo4C
	DnTtR9RmgMYFae8THzC9gpFGue7h939c9t+OQLNrDRtu8MOGMJMUJGbMykTz3u+zeZvFC+zpkwnZB
	qKXz+CM4qr+DDPFayls1JLXFpq0GlKo7Gy37hvgRH0DQRISvP0+fxxhJDe2gYQLmJL3hL6g2iOlO1
	f/7ZmQW+AuW2MRvM5dNHB4c1aj/t+4csx4LXcIbDsqEaCJ50jrBNPEo4AF5CWw41s/afTgidL7QRy
	GJy8WlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBnM3-0000000E3rn-1jDo;
	Sun, 12 Apr 2026 05:27:31 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBnM1-0000000E3ql-0R35
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 05:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775971649; x=1807507649;
  h=date:from:to:cc:subject:message-id;
  bh=8U9hyr+QRpiXvguncT+hCmRFK/UPSLq/2Km5mDZpsu4=;
  b=MqmGZgjtKHRJX5hBzvyRXz2C/UT5on0FNIUWmrj0/rV/clwlI5zH15Mi
   hYOlugMJ2HGSxzZjEhd3Xt6zd/4PFavSPzqAl0RIXJp6uIP07kmCs70u0
   H7w9g+C2/k1Iho5Lk6Vh50tVeN7RIArcY5DfiNQXXyMXHS10xL/hiGM4q
   QF4MPxZfvffKomALZlP84xlygUZkf8mfL45gyJs8GM2cxzhBoDDJF+jtQ
   8ZZO5DKi04LHcKWYD/UyWgGb/OMskeWkvPzbHqmJvXcBIqvhwf0IrztHz
   mTX+SCALQ7UWP/hirKsyeNb5P99rG2AJH2OFqNBn7z+7mAtyzSf2t/eCV
   A==;
X-CSE-ConnectionGUID: QPmT6ilgTeyeATCTAc4btA==
X-CSE-MsgGUID: 3GBrdBidReKIdvNPbJM0ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="64470491"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="64470491"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 22:27:29 -0700
X-CSE-ConnectionGUID: Jzv/IcwDQGGfTErSLKGs/Q==
X-CSE-MsgGUID: U53QT0SARcOHJidoZNnjMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="229733260"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2026 22:27:27 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBnLw-000000001uB-3bAb;
	Sun, 12 Apr 2026 05:27:24 +0000
Date: Sun, 12 Apr 2026 13:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 9c4372beab603ef072bbf672a61e3dacabc0ea4c
Message-ID: <202604121350.iHKGF3rt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_222729_161920_E82FFFBE 
X-CRM114-Status: UNSURE (   5.13  )
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
branch HEAD: 9c4372beab603ef072bbf672a61e3dacabc0ea4c  soc: document merges

elapsed time: 727m

configs tested: 221
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260412    gcc-11.5.0
arc                   randconfig-002-20260412    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260412    gcc-11.5.0
arm                   randconfig-002-20260412    gcc-11.5.0
arm                   randconfig-003-20260412    gcc-11.5.0
arm                   randconfig-004-20260412    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260412    clang-19
arm64                 randconfig-002-20260412    clang-19
arm64                 randconfig-003-20260412    clang-19
arm64                 randconfig-004-20260412    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260412    clang-19
csky                  randconfig-002-20260412    clang-19
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260412    clang-23
hexagon               randconfig-002-20260412    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260412    gcc-14
i386        buildonly-randconfig-002-20260412    clang-20
i386        buildonly-randconfig-002-20260412    gcc-14
i386        buildonly-randconfig-003-20260412    gcc-14
i386        buildonly-randconfig-004-20260412    gcc-14
i386        buildonly-randconfig-005-20260412    gcc-14
i386        buildonly-randconfig-006-20260412    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260412    clang-20
i386                  randconfig-002-20260412    clang-20
i386                  randconfig-003-20260412    clang-20
i386                  randconfig-004-20260412    clang-20
i386                  randconfig-005-20260412    clang-20
i386                  randconfig-005-20260412    gcc-14
i386                  randconfig-006-20260412    clang-20
i386                  randconfig-007-20260412    clang-20
i386                  randconfig-011-20260412    gcc-14
i386                  randconfig-012-20260412    gcc-14
i386                  randconfig-013-20260412    gcc-14
i386                  randconfig-014-20260412    gcc-14
i386                  randconfig-015-20260412    gcc-14
i386                  randconfig-016-20260412    gcc-14
i386                  randconfig-017-20260412    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260412    clang-23
loongarch             randconfig-002-20260412    clang-23
loongarch             randconfig-002-20260412    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         db1xxx_defconfig    clang-23
mips                      loongson3_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260412    clang-23
nios2                 randconfig-001-20260412    gcc-11.5.0
nios2                 randconfig-002-20260412    clang-23
nios2                 randconfig-002-20260412    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260412    gcc-15.2.0
parisc                randconfig-002-20260412    gcc-15.2.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260412    gcc-15.2.0
powerpc               randconfig-002-20260412    gcc-15.2.0
powerpc64             randconfig-001-20260412    gcc-15.2.0
powerpc64             randconfig-002-20260412    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260412    clang-23
riscv                 randconfig-001-20260412    gcc-15.2.0
riscv                 randconfig-002-20260412    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260412    clang-23
s390                  randconfig-001-20260412    gcc-15.2.0
s390                  randconfig-002-20260412    clang-23
s390                  randconfig-002-20260412    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260412    clang-23
sh                    randconfig-001-20260412    gcc-15.2.0
sh                    randconfig-002-20260412    clang-23
sh                    randconfig-002-20260412    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260412    clang-23
sparc                 randconfig-001-20260412    gcc-8.5.0
sparc                 randconfig-002-20260412    clang-23
sparc                 randconfig-002-20260412    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260412    clang-23
sparc64               randconfig-001-20260412    gcc-15.2.0
sparc64               randconfig-002-20260412    clang-23
sparc64               randconfig-002-20260412    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260412    clang-23
um                    randconfig-001-20260412    gcc-14
um                    randconfig-002-20260412    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260412    clang-20
x86_64      buildonly-randconfig-002-20260412    clang-20
x86_64      buildonly-randconfig-003-20260412    clang-20
x86_64      buildonly-randconfig-004-20260412    clang-20
x86_64      buildonly-randconfig-005-20260412    clang-20
x86_64      buildonly-randconfig-006-20260412    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260412    clang-20
x86_64                randconfig-002-20260412    clang-20
x86_64                randconfig-003-20260412    clang-20
x86_64                randconfig-004-20260412    clang-20
x86_64                randconfig-005-20260412    clang-20
x86_64                randconfig-006-20260412    clang-20
x86_64                randconfig-011-20260412    gcc-14
x86_64                randconfig-012-20260412    clang-20
x86_64                randconfig-012-20260412    gcc-14
x86_64                randconfig-013-20260412    clang-20
x86_64                randconfig-013-20260412    gcc-14
x86_64                randconfig-014-20260412    gcc-14
x86_64                randconfig-015-20260412    gcc-14
x86_64                randconfig-016-20260412    gcc-14
x86_64                randconfig-071-20260412    clang-20
x86_64                randconfig-072-20260412    clang-20
x86_64                randconfig-073-20260412    clang-20
x86_64                randconfig-074-20260412    clang-20
x86_64                randconfig-075-20260412    clang-20
x86_64                randconfig-076-20260412    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260412    clang-23
xtensa                randconfig-001-20260412    gcc-12.5.0
xtensa                randconfig-002-20260412    clang-23
xtensa                randconfig-002-20260412    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

