Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E491C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Faw/9lFe0+ktoNYpP1sg5a4ue2Bd4Pdap1CvKGNAtY=; b=cTrQUfOcJEQ7G1/buWCdEoyHBF
	lYTi4rMuvTe8q4DK5+M2KZ+/POIaxFfig3Jb2TAfPpNRfR05AtFhoFq7MpadZPBr4obBn5PVr1y7i
	7ajAhpC95mpV/YTw438O4lIpuIxHn6X+4YsstrRVgn8QZWqfVp8Ji6jUmD8sbn+G4MfCG/GpMV6vj
	cETc4pQ8Lxh4AMyNoyQEoULhuKgpzMzQYo3WbVpHAIgyIBIYbosBXwRfZAnZJTQhW0LDSiB1On1qw
	Vuegq7k2xINn5sq7MRniG+JujIDrn7LG1l1REur/1z0awLGI9ozNRqZI1TlkmuBEkfmiILOKFj3pO
	mnNMEhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3mW-0000000D9tJ-1fRF;
	Fri, 25 Sep 2026 11:07:56 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3mU-0000000D9sv-1xNL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334474; x=1821870474;
  h=date:from:to:cc:subject:message-id;
  bh=NMtpHyOESE3Egi0xg479ulQT1qRyisG4yubsEJi3L48=;
  b=m4B6QaIyw6zJceIJpQB3V038VC5G7qT9VBk4SIOXrzTQheZpL66AKX/2
   tq1Sz2UkGOJTPvEJp1gcxbATgP1TtpAE7wzv86MriySgcWFbqSdrk6RJO
   qEyJNVAK+Lddge54kwm5KqBlQu2fD+6hKCxRHtJqySfx1cqV7EZWzQ0O4
   Ud9rao5MIaNl4ZKQha08WFJ251bmejvKkNhdra7E080XRBqWI4cR+oAq/
   D2S5aUHj2E0j/MPbraR1lAlx6BUkUIA3HyWPXUClqddDaX9+xvGX+BR6r
   88e+/mwGYxImGe1Ma82GRM0ZYuZC3jtNLXlR4BRgxtiC1iPz0Hgvk++dN
   Q==;
X-CSE-ConnectionGUID: C75RAo3PS7Ce9owfKANFAA==
X-CSE-MsgGUID: UsVKQTnLSxOm9piXDvX0uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90982145"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90982145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:07:54 -0700
X-CSE-ConnectionGUID: Un/A61fRQICDrLI64f+IJQ==
X-CSE-MsgGUID: xMjpRFlNRcK9Y33AZl88sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273541246"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Sep 2026 04:07:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3mQ-00000000KUq-1lnH;
	Fri, 25 Sep 2026 11:07:50 +0000
Date: Fri, 25 Sep 2026 19:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-audio-graph-card2] BUILD SUCCESS
 42f2829b6a831410e373174f67ebfb10cf6c18a8
Message-ID: <202609251924.ypuSD8GA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_040754_553343_7B077757 
X-CRM114-Status: UNSURE (   5.42  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-audio-graph-card2
branch HEAD: 42f2829b6a831410e373174f67ebfb10cf6c18a8  mfd: dt-bindings: ab8500: Describe codec graph and microphone wiring

elapsed time: 1132m

configs tested: 197
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260925    clang-24
arc                   randconfig-1001-20260925    clang-24
arc                  randconfig-r1301-20260925    gcc-11.5.0 sparse
arc                            tb10x_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           pxa910_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260925    clang-24
arm                   randconfig-1001-20260925    clang-24
arm                   randconfig-1002-20260925    clang-24
arm                   randconfig-1003-20260925    clang-24
arm                  randconfig-r1309-20260925    clang-22   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260925    clang-24
arm64                 randconfig-1001-20260925    clang-24
arm64                 randconfig-1002-20260925    clang-24
arm64                 randconfig-1003-20260925    clang-24
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260925    clang-24
csky                  randconfig-1001-20260925    clang-24
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260925    gcc-9.5.0
hexagon               randconfig-1001-20260925    gcc-9.5.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260925    clang-22
i386        buildonly-randconfig-1001-20260925    clang-22
i386        buildonly-randconfig-1002-20260925    clang-22
i386        buildonly-randconfig-1003-20260925    clang-22
i386        buildonly-randconfig-1004-20260925    clang-22
i386        buildonly-randconfig-1005-20260925    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260925    clang-22
i386                  randconfig-1001-20260925    clang-22
i386                  randconfig-1002-20260925    clang-22
i386                  randconfig-1003-20260925    clang-22
i386                  randconfig-1004-20260925    clang-22
i386                  randconfig-1005-20260925    clang-22
i386                  randconfig-1006-20260925    clang-22
i386                  randconfig-1007-20260925    gcc-12
i386                  randconfig-1008-20260925    gcc-12
i386                  randconfig-1009-20260925    gcc-12
i386                  randconfig-1010-20260925    gcc-12
i386                  randconfig-1011-20260925    gcc-12
i386                  randconfig-1012-20260925    gcc-12
i386                  randconfig-1013-20260925    gcc-12
i386                  randconfig-1300-20260925    clang-22   sparse
i386                  randconfig-1301-20260925    clang-22   sparse
i386                  randconfig-1302-20260925    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260925    gcc-9.5.0
loongarch             randconfig-1001-20260925    gcc-9.5.0
loongarch            randconfig-r1308-20260925    clang-22   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r1304-20260925    gcc-11.5.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260925    gcc-9.5.0
nios2                 randconfig-1001-20260925    gcc-9.5.0
nios2                randconfig-r1302-20260925    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260925    clang-24
parisc                randconfig-1001-20260925    clang-24
parisc               randconfig-r1307-20260925    clang-22   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                         fsp2_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260925    clang-24
powerpc               randconfig-1001-20260925    clang-24
powerpc                     socrates_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260925    clang-24
powerpc64             randconfig-1001-20260925    clang-24
powerpc64            randconfig-r1303-20260925    gcc-11.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260925    clang-24
riscv                 randconfig-1001-20260925    clang-24
riscv                 randconfig-2000-20260924    clang-24
riscv                 randconfig-2001-20260924    gcc-8.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260925    clang-24
s390                  randconfig-1001-20260925    clang-24
s390                  randconfig-2000-20260924    gcc-14.3.0
s390                  randconfig-2001-20260924    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20260925    clang-24
sh                    randconfig-1001-20260925    clang-24
sh                    randconfig-2000-20260924    gcc-16.1.0
sh                    randconfig-2001-20260924    gcc-13.4.0
sh                            sh2007_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260925    gcc-12
sparc                 randconfig-1001-20260925    gcc-12
sparc                randconfig-r1300-20260925    gcc-11.5.0 sparse
sparc                randconfig-r1305-20260925    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260925    gcc-12
sparc64               randconfig-1001-20260925    gcc-12
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260925    gcc-12
um                    randconfig-1001-20260925    gcc-12
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260925    clang-22
x86_64      buildonly-randconfig-1001-20260925    clang-22
x86_64      buildonly-randconfig-1002-20260925    clang-22
x86_64      buildonly-randconfig-1003-20260925    clang-22
x86_64      buildonly-randconfig-1004-20260925    clang-22
x86_64      buildonly-randconfig-1005-20260925    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260925    gcc-14
x86_64                randconfig-1001-20260925    gcc-14
x86_64                randconfig-1002-20260925    gcc-14
x86_64                randconfig-1003-20260925    gcc-14
x86_64                randconfig-1004-20260925    gcc-14
x86_64                randconfig-1005-20260925    gcc-14
x86_64                randconfig-1006-20260925    clang-22
x86_64                randconfig-1007-20260925    clang-22
x86_64                randconfig-1008-20260925    clang-22
x86_64                randconfig-1009-20260925    clang-22
x86_64                randconfig-1010-20260925    clang-22
x86_64                randconfig-1011-20260925    clang-22
x86_64                randconfig-1012-20260925    clang-22
x86_64                randconfig-1013-20260925    clang-22
x86_64                randconfig-1014-20260925    clang-22
x86_64                randconfig-1015-20260925    clang-22
x86_64                randconfig-1016-20260925    clang-22
x86_64                randconfig-1017-20260925    clang-22
x86_64                randconfig-1300-20260925    clang-22   sparse
x86_64                randconfig-1301-20260925    clang-22   sparse
x86_64                randconfig-1302-20260925    clang-22   sparse
x86_64               randconfig-r1306-20260925    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   audio_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20260925    gcc-12
xtensa                randconfig-1001-20260925    gcc-12
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

