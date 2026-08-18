Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32167C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 21:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d6TbULP6uP+NWTuFPw67prHURIITt2IOSodxUnTQFc0=; b=yxRqPjgItvs4m0LNQPuP/jKmGM
	bPyo1px+BBVe/Nb5+HW/sgvo/tlomBjaIDdQ4qX5QnANEEKKuOwvu18TtdXUhemTQhRaAv8sofb6I
	FQZ6GuNP69tCOXG7hEr4k7lQ9x6qof2oyoFLZW2VnetDCfoCWgoHqQ/AB+5N1BLDUvGs6fHyqAOIu
	xbnpEulb9wLAcM4fzlCN6ly7dHv8ccvlZEF9fS/zc+YxswpsSyrlkrL6g0GhI6fvCflOO2iclj8sN
	UPlg3oL0OZd2R/wP52dZxPbUPCt6ezgj/ix9KgB7B+CUx9bB1LB9dRXzMVVh2O+bwTOReG/P4yurE
	qsz0Ljkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRc0-00000008hFd-2Q2U;
	Tue, 18 Aug 2026 21:44:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRbx-00000008hFE-3p6p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 21:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787089486; x=1818625486;
  h=date:from:to:cc:subject:message-id;
  bh=936Y68lEEmLogaOGAQc0K983UahYZ5PTqiGSgSjTcEk=;
  b=GTpwJmHEdz1V3DB/VhS53AhyIHwVvg7sX2U44L4QLy6M9vLx1lKpTMQa
   TdCp2B1vcV8StuMumaAQ+9xZp4ldeiYjE3eE9FPTGs6yR0+Up9ZLU04Zr
   hHMS4/RfhVUzZDX3pnHfPXf2uuOWNU9KmZ5uAFvbxhN+cJY4wHiGEif6U
   37EASn8wfFqvFpLp9ZQb9NvyYWQJldlASV6aLW+Z23ahKFxS+QZ967dgX
   LbFgdFeeZJgzejB5mgo0f7zpfM2WtCeK3bXdlnfsFfi9dJactjWevEaON
   Q8Mv6l1rgTatI2c/jz/V/YQ50j+eAt8DEWbCk6L6IYf+vq9IpX6WpNcrL
   w==;
X-CSE-ConnectionGUID: QD4huNd6TIGEL4IWFg8Lew==
X-CSE-MsgGUID: Sbtx7zO+QaSaJYwcN5byaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87509782"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87509782"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 14:44:45 -0700
X-CSE-ConnectionGUID: 3V2d+bLITjOWwuHvEHvIMA==
X-CSE-MsgGUID: 1Ht7hSvAR260DHDzqUK4aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267316728"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 14:44:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwRbs-00000000ebe-3I5d;
	Tue, 18 Aug 2026 21:44:40 +0000
Date: Wed, 19 Aug 2026 05:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 dfda289ad743d037f33f9e3796e3fd40ca23374c
Message-ID: <202608190526.RJDaSsQH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_144446_037704_094893BF 
X-CRM114-Status: UNSURE (   5.50  )
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
branch HEAD: dfda289ad743d037f33f9e3796e3fd40ca23374c  Merge tag 'mvebu-dt64-7.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into soc/dt

elapsed time: 1472m

configs tested: 111
configs skipped: 107

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-10.5.0
arc                  randconfig-001-20260818    gcc-10.5.0
arc                  randconfig-002-20260818    gcc-10.5.0
arm                        at91_dt_defconfig    clang-17
arm                  randconfig-001-20260818    gcc-10.5.0
arm                  randconfig-002-20260818    gcc-10.5.0
arm                  randconfig-003-20260818    gcc-10.5.0
arm                  randconfig-004-20260818    gcc-10.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260818    gcc-12.5.0
arm64                randconfig-001-20260818    gcc-14.3.0
arm64                randconfig-002-20260818    gcc-12.5.0
arm64                randconfig-002-20260818    gcc-14.3.0
arm64                randconfig-003-20260818    gcc-12.5.0
arm64                randconfig-003-20260818    gcc-14.3.0
arm64                randconfig-004-20260818    gcc-12.5.0
arm64                randconfig-004-20260818    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260818    gcc-12.5.0
csky                 randconfig-001-20260818    gcc-14.3.0
csky                 randconfig-002-20260818    gcc-12.5.0
csky                 randconfig-002-20260818    gcc-14.3.0
hexagon              randconfig-001-20260818    gcc-10.5.0
hexagon              randconfig-002-20260818    gcc-10.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260818    clang-22
i386       buildonly-randconfig-002-20260818    clang-22
i386       buildonly-randconfig-003-20260818    clang-22
i386       buildonly-randconfig-004-20260818    clang-22
i386       buildonly-randconfig-005-20260818    clang-22
i386       buildonly-randconfig-006-20260818    clang-22
i386                 randconfig-001-20260818    clang-22
i386                 randconfig-002-20260818    clang-22
i386                 randconfig-003-20260818    clang-22
i386                 randconfig-004-20260818    clang-22
i386                 randconfig-005-20260818    clang-22
i386                 randconfig-006-20260818    clang-22
i386                 randconfig-007-20260818    clang-22
i386                 randconfig-011-20260818    gcc-12
i386                 randconfig-012-20260818    gcc-12
i386                 randconfig-013-20260818    gcc-12
i386                 randconfig-014-20260818    gcc-12
i386                 randconfig-015-20260818    gcc-12
i386                 randconfig-016-20260818    gcc-12
i386                 randconfig-017-20260818    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260818    gcc-10.5.0
loongarch            randconfig-002-20260818    gcc-10.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260818    gcc-10.5.0
nios2                randconfig-002-20260818    gcc-10.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260818    clang-24
parisc               randconfig-002-20260818    clang-24
powerpc              randconfig-001-20260818    clang-24
powerpc              randconfig-002-20260818    clang-24
powerpc64            randconfig-001-20260818    clang-24
powerpc64            randconfig-002-20260818    clang-24
riscv                         randconfig-001    clang-18
riscv                randconfig-001-20260818    clang-18
riscv                randconfig-002-20260818    clang-18
s390                 randconfig-001-20260818    clang-18
s390                 randconfig-002-20260818    clang-18
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260818    clang-18
sh                   randconfig-002-20260818    clang-18
sh                          se7619_defconfig    gcc-16.1.0
sparc                randconfig-001-20260818    gcc-11.5.0
sparc                randconfig-002-20260818    gcc-11.5.0
sparc64              randconfig-001-20260818    gcc-11.5.0
sparc64              randconfig-002-20260818    gcc-11.5.0
um                   randconfig-001-20260818    gcc-11.5.0
um                   randconfig-002-20260818    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260818    clang-22
x86_64     buildonly-randconfig-002-20260818    clang-22
x86_64     buildonly-randconfig-003-20260818    clang-22
x86_64     buildonly-randconfig-004-20260818    clang-22
x86_64     buildonly-randconfig-005-20260818    clang-22
x86_64     buildonly-randconfig-006-20260818    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260818    clang-22
x86_64               randconfig-002-20260818    clang-22
x86_64               randconfig-003-20260818    clang-22
x86_64               randconfig-004-20260818    clang-22
x86_64               randconfig-005-20260818    clang-22
x86_64               randconfig-006-20260818    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260818    clang-22
x86_64               randconfig-012-20260818    clang-22
x86_64               randconfig-013-20260818    clang-22
x86_64               randconfig-014-20260818    clang-22
x86_64               randconfig-015-20260818    clang-22
x86_64               randconfig-016-20260818    clang-22
x86_64                        randconfig-071    gcc-13
x86_64               randconfig-071-20260818    gcc-13
x86_64               randconfig-072-20260818    gcc-13
x86_64               randconfig-073-20260818    gcc-13
x86_64               randconfig-074-20260818    gcc-13
x86_64               randconfig-075-20260818    gcc-13
x86_64               randconfig-076-20260818    gcc-13
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260818    gcc-11.5.0
xtensa               randconfig-002-20260818    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

