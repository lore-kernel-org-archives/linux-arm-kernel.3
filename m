Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F4ECFD313
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 23:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PrTDKAT1LwjboE2n6kjnDwzXwHJlbdf93Gv4vAxXPLQ=; b=E7b/q5qXOpD0197z3WKA0Vd2xQ
	KPUidAhchSE1ApxZOBO1uiPwQHdjM5nHGnJ5Jf8meO87Hjvko11e3JIVTbJbvNCFm4P+KRDp+UqKt
	MJTxePJQX/ORiRyStk5qDeNysP4aFmcIvKft8oiUx0PwFpf5g+unGs1iIS4hDKza0nClGA6Ywpzxl
	ic0e28abbeS3MG/yryo+Ky+FA+0/P7AlPxnHmxrGZxFvxX+g6X3DiRiLMWddB/kn8jwHdKY125Syf
	SVTgIUI5SKhraHVQDTvpE1SQMQ/aQOMHT83zPhl8Jrg2th+E4HepCqCzXVS3tjbqOIarrfMJ+l4LQ
	0v6PLItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNJi5-0000000Ang1-0IzG;
	Sun, 23 Nov 2025 23:41:37 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNJi2-0000000Anfd-3s6H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 23:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763941295; x=1795477295;
  h=date:from:to:cc:subject:message-id;
  bh=hzy8SVgRAcDR5+nJzThyWq2DKSj14fv+Rl3bVovgSaw=;
  b=Fny5lVx6rcJwrB9okJgw695L7Fp2xMqK3rqlz0fgSC+LS0gNcmSvgJil
   qMrVuByUbbQiddcwyP6l9b4zR2p5Q8R46lM/0t5pjVKcUbWVVnDBLb2Em
   t4OUMNOz6TrfjajVLtVWe3R62FmxTPu/w1bhLA0owFMa6gzYsm24sZ9+L
   3fz0nkfBgn0qiie7I6+vqRK6aBxuguqT4B4JH9tuv/PEChfIGbc+2M6f/
   OrEobjEhwZYKZyO2X/bUPCc7rwnZsKWw0TL6MATXxLhLKlXM5MOfEoaIh
   w1Q0M23m4CkBxxt+k8L+S01dgf1+63cBcGC/K3v/TRQBpUA4X+bB2vhaY
   g==;
X-CSE-ConnectionGUID: 7/8WHGjbSR+zTv72PZfJsw==
X-CSE-MsgGUID: MZ/JuIKVRoyshnFhD3+Sug==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77414169"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="77414169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 15:41:32 -0800
X-CSE-ConnectionGUID: /oGYAgv+QlOBfbCcQYwQew==
X-CSE-MsgGUID: pwEljAEeQzqN5yEBJEXS8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="191453318"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Nov 2025 15:41:30 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNJhw-000000000Ea-1WZW;
	Sun, 23 Nov 2025 23:41:28 +0000
Date: Mon, 24 Nov 2025 07:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 fe7cdcd1bacec3a54ec94131292b5c883cec50cf
Message-ID: <202511240750.edASI78m-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_154135_060158_17031C5D 
X-CRM114-Status: UNSURE (   5.35  )
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
branch HEAD: fe7cdcd1bacec3a54ec94131292b5c883cec50cf  Merge tag 'qcomtee-fixes2-for-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes

elapsed time: 3034m

configs tested: 74
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251122    gcc-14.3.0
arc                   randconfig-002-20251122    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251122    clang-22
arm                   randconfig-002-20251122    clang-22
arm                   randconfig-003-20251122    clang-22
arm                   randconfig-004-20251122    gcc-12.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251123    gcc-8.5.0
arm64                 randconfig-002-20251123    gcc-11.5.0
arm64                 randconfig-003-20251123    clang-22
arm64                 randconfig-004-20251123    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251123    gcc-15.1.0
csky                  randconfig-002-20251123    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251122    clang-22
hexagon               randconfig-002-20251122    clang-17
i386                              allnoconfig    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251122    gcc-12.5.0
loongarch             randconfig-002-20251122    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251122    gcc-11.5.0
nios2                 randconfig-002-20251122    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251123    gcc-14.3.0
parisc                randconfig-002-20251123    gcc-14.3.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251123    clang-22
powerpc               randconfig-002-20251123    gcc-8.5.0
powerpc64             randconfig-001-20251123    clang-22
powerpc64             randconfig-002-20251123    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251122    clang-22
riscv                 randconfig-002-20251122    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251122    clang-16
s390                  randconfig-002-20251122    gcc-13.4.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251122    gcc-15.1.0
sh                    randconfig-002-20251122    gcc-10.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251123    gcc-8.5.0
sparc                 randconfig-002-20251123    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251123    clang-22
sparc64               randconfig-002-20251123    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251123    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251123    gcc-14
x86_64      buildonly-randconfig-002-20251123    gcc-12
x86_64      buildonly-randconfig-003-20251123    gcc-14
x86_64      buildonly-randconfig-004-20251123    clang-20
x86_64      buildonly-randconfig-005-20251123    gcc-14
x86_64      buildonly-randconfig-006-20251123    clang-20
x86_64                              defconfig    gcc-14
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

