Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30A3C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 21:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B95cKjQWsqBbQPgbTg3P0us13r8FUUR+W+PVMNJEgSE=; b=RgjmJutrnQZkIohEngXO2e8gdQ
	Ud4dYQfuSbv6CZ2NIF4zGgtbZ6iQmV/M7r+JhTUGurYsNpFfpgcqQ8KjbqEtvU8sq6fhFgeLOXkXi
	40c+ViwKv7wmBuWTCf6QeN4f+4k4py/LpkcryRHbFe2uT8K0JtBO3EEJ3wSHwliHpLU5q/kNAzRE7
	SToAxUR3rKK9Z8Yw3Dx2MuulGs9Q+SbxL0vLJ6vcOUlSZWmw+Rn1jNQYaFd/4PucCz2Ty6M5u4iib
	p9IKEZCXdnu1CxjYh4L+Lfi6C+YIlvgC4z+MmKLfylWZuoVcxcSrzl5ZDCjPAVkG3uagnlVoUtLCt
	Qkz2viVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRay-00000008h4V-0ZwL;
	Tue, 18 Aug 2026 21:43:44 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRaw-00000008h3q-0Myo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 21:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787089422; x=1818625422;
  h=date:from:to:cc:subject:message-id;
  bh=xA5hgefXc9huRw42UI/aoy86uTSMH0PtzqZdzEJiCtc=;
  b=bKVP3lEIUbdxsiHXFxVO2ioyPInOkYahfuoUWEOjNalUn4bEsGjc2bSa
   sDivtS/pEaNWlHHtG1A9FXALrzdav4CyN52HhItJNT+xF3Goi5oAHHRPL
   PFsS1vgQ5XffYSfrUtKJAbGQndqh92LAyMxeyXHA44NDBSrsic5S6aPL3
   gGzJJT50Yh8AyzpaAnV3kqvu5uJgpSm/3XtYHT0bfs4qL41oETLAz4Xp8
   kY7xDzwOid6jqnnLt0HpApBdACZ4g/pl1vZ8uQNExEVrXlYDEXonFwR+u
   GjotP9F0eyggmhAMAuWeuw7x0FKMVnZqKcSZS/dyt11zlzRZoe5YnvZ8m
   w==;
X-CSE-ConnectionGUID: iCLuJFxAQbu/D3hLTbSVKg==
X-CSE-MsgGUID: 3KQM/BOlS3S1iGOpMJPafg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="86552166"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="86552166"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 14:43:41 -0700
X-CSE-ConnectionGUID: EgUUcdqTRMmXUoS6eO9/uA==
X-CSE-MsgGUID: yKDW92qWSbeHsPeABJH9Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="290166609"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Aug 2026 14:43:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwRar-00000000ebO-1h5W;
	Tue, 18 Aug 2026 21:43:37 +0000
Date: Wed, 19 Aug 2026 05:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 ae77d827fb0e6fb2faf8186f075c6c337f2dcf08
Message-ID: <202608190541.BGdGpcTF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_144342_168342_87072A9D 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: ae77d827fb0e6fb2faf8186f075c6c337f2dcf08  soc: document merges

elapsed time: 1472m

configs tested: 81
configs skipped: 107

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260818    gcc-10.5.0
arc                  randconfig-002-20260818    gcc-10.5.0
arm                        at91_dt_defconfig    clang-17
arm                  randconfig-001-20260818    gcc-10.5.0
arm                  randconfig-002-20260818    gcc-10.5.0
arm                  randconfig-003-20260818    gcc-10.5.0
arm                  randconfig-004-20260818    gcc-10.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260818    gcc-14.3.0
arm64                randconfig-002-20260818    gcc-14.3.0
arm64                randconfig-003-20260818    gcc-14.3.0
arm64                randconfig-004-20260818    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260818    gcc-14.3.0
csky                 randconfig-002-20260818    gcc-14.3.0
hexagon              randconfig-001-20260818    gcc-10.5.0
hexagon              randconfig-002-20260818    gcc-10.5.0
i386                            allmodconfig    gcc-14
i386                 randconfig-001-20260818    clang-22
i386                 randconfig-002-20260818    clang-22
i386                 randconfig-003-20260818    clang-22
i386                 randconfig-004-20260818    clang-22
i386                 randconfig-005-20260818    clang-22
i386                 randconfig-006-20260818    clang-22
i386                 randconfig-007-20260818    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260818    gcc-10.5.0
loongarch            randconfig-002-20260818    gcc-10.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                randconfig-001-20260818    gcc-10.5.0
nios2                randconfig-002-20260818    gcc-10.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
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

