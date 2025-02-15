Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FAFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CtL+AEV+DfIF2SjsQmAPSVbizU8Ubp32vIVGIHdBzCk=; b=0j9HHc15qSGMhCisJpB9z3N8Fd
	o0TVid5g+a6Cfb7/g8K3auYFOz691TFltver5WgbON8LH4Ix6rckgc2B+ymEWlJ+c1uOH1qsiYcVO
	AVKgQAoDeQLXWRwPEbXINQfXPQoxY7G0DVJzuJknoWSB58Pkd2A+jNug9Q9VFos0Kboktmyb2PaQ4
	0oB2QpXmMDdHCtYduw6XquTgtz3Ww+UZBDvBO1MSOQfsd7jnIe9NfdENhJZbrWqDlAQ5GHhr6tUQ6
	W886gGnNcPCgr/CWSE1dBUk1jZRc2vIOezWufQ0irPpjdgZ/RO10szYJfQPszYbFAzfeI12aRjgyn
	e8KcL+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjK3p-00000000Jyr-288Z;
	Sat, 15 Feb 2025 15:26:29 +0000
Received: from [192.198.163.7] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjK2M-00000000JoX-3atg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 15:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739633099; x=1771169099;
  h=date:from:to:cc:subject:message-id;
  bh=opiTqF7RVUEw/2q6deR3B0O3tLomvZTBaCgExOXOldc=;
  b=P/7pWydDuk5V7cAmbxRLtjoy6YbsPmMr5I9VQj4qLeH1I3tjtJq+idRu
   /fah7G7T54GPwO/Lv+sduuWlFj+csootHhUg11yrOE3J3CpLYZI/jVb5J
   n7gNUZKJBPCEEF2vufiuXqGM2ggtBjs5TYC9nK4tgmrRtZXpgo7gKV4YJ
   UG4ZYm2FSEr4u29L6LaNdNDDz/BwlUOpx8NlPw/W4sJ6ZTCDw1Ub67RZo
   3ISy21hbB9SgxUD5qNnc3z5CQBiZdD1p0xn2D6FjKekvJUP87Wi1huYPm
   UbVWG+/Apbw8DNRV0nCtX2l0lih/upgGkUrz6B/4LrPmHmv2bb8po/pom
   w==;
X-CSE-ConnectionGUID: MSPBmwJtRL+Ab563dxPPag==
X-CSE-MsgGUID: Xd2H+LPxRgWMOwjt/BRCmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="65720117"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="65720117"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 07:24:58 -0800
X-CSE-ConnectionGUID: Pf21FZVaTXO84ZxS2TzUHw==
X-CSE-MsgGUID: 9B0BP9aLQS6S8kJjXZWSLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="113451771"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Feb 2025 07:24:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjK2I-001AwL-17;
	Sat, 15 Feb 2025 15:24:54 +0000
Date: Sat, 15 Feb 2025 23:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 70b0d6b0a199c5a3ee6c72f5e61681ed6f759612
Message-ID: <202502152345.Ip8WOgUD-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_072458_940733_E0E068DB 
X-CRM114-Status: UNSURE (   5.16  )
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
branch HEAD: 70b0d6b0a199c5a3ee6c72f5e61681ed6f759612  tee: optee: Fix supplicant wait loop

elapsed time: 1450m

configs tested: 80
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250215    gcc-13.2.0
arc                  randconfig-002-20250215    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250215    clang-15
arm                  randconfig-002-20250215    clang-17
arm                  randconfig-003-20250215    gcc-14.2.0
arm                  randconfig-004-20250215    gcc-14.2.0
arm64                randconfig-001-20250215    clang-21
arm64                randconfig-002-20250215    gcc-14.2.0
arm64                randconfig-003-20250215    clang-17
arm64                randconfig-004-20250215    gcc-14.2.0
csky                 randconfig-001-20250215    gcc-14.2.0
csky                 randconfig-002-20250215    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250215    clang-21
hexagon              randconfig-002-20250215    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250215    gcc-12
i386       buildonly-randconfig-002-20250215    clang-19
i386       buildonly-randconfig-003-20250215    clang-19
i386       buildonly-randconfig-004-20250215    gcc-12
i386       buildonly-randconfig-005-20250215    clang-19
i386       buildonly-randconfig-006-20250215    clang-19
i386                               defconfig    clang-19
loongarch            randconfig-001-20250215    gcc-14.2.0
loongarch            randconfig-002-20250215    gcc-14.2.0
nios2                randconfig-001-20250215    gcc-14.2.0
nios2                randconfig-002-20250215    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                           defconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250215    gcc-14.2.0
parisc               randconfig-002-20250215    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250215    gcc-14.2.0
powerpc              randconfig-002-20250215    clang-21
powerpc              randconfig-003-20250215    clang-19
powerpc64            randconfig-001-20250215    gcc-14.2.0
powerpc64            randconfig-002-20250215    clang-21
powerpc64            randconfig-003-20250215    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250215    clang-17
riscv                randconfig-002-20250215    clang-19
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-21
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250215    gcc-14.2.0
s390                 randconfig-002-20250215    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250215    gcc-14.2.0
sh                   randconfig-002-20250215    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250215    gcc-14.2.0
sparc                randconfig-002-20250215    gcc-14.2.0
sparc64              randconfig-001-20250215    gcc-14.2.0
sparc64              randconfig-002-20250215    gcc-14.2.0
um                              allmodconfig    clang-21
um                               allnoconfig    clang-18
um                              allyesconfig    gcc-12
um                   randconfig-001-20250215    clang-21
um                   randconfig-002-20250215    clang-19
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250215    gcc-12
x86_64     buildonly-randconfig-002-20250215    clang-19
x86_64     buildonly-randconfig-003-20250215    gcc-12
x86_64     buildonly-randconfig-004-20250215    clang-19
x86_64     buildonly-randconfig-005-20250215    clang-19
x86_64     buildonly-randconfig-006-20250215    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250215    gcc-14.2.0
xtensa               randconfig-002-20250215    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

