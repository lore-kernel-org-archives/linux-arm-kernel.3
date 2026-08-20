Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD3C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 22:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KFMwFxnvQ03fHVLSjEZyYk7P7iF4J+MKHtRACyhLrcQ=; b=X0ZBLAoxEgCwN+IksoztAfdUS3
	DbjPa+8nIkSTQhHGJgSpc5OmQbUzTKN2JeO/QDBUgMNntR02Bqk9EkCAYEkDe5438dneKN+SWZm6M
	id6qRTCVulu4yw5Exg8d2mNkCY5c5misGGAaR1Qt9siKCbJknvWC7aPOazLvczo3E0PBvaW4PwpRh
	LSUZc5umD+QDkw97EqOADZ0Q5RJA8dEhm49LcZA5YojvX5WGowc3CU1lRHbOrELC8Z1TsdMALlSZm
	H3dI5yqNrcW4LSvDjoNblHX2BUgUGPNIj3Zs0fi1s7wSSQj8tAuxIyOElgDuZm6vdCDoLUED1ooWb
	5PZGUeWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAzC-0000000CHEW-0796;
	Thu, 20 Aug 2026 22:11:46 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAz9-0000000CHDv-2JW9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 22:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787263903; x=1818799903;
  h=date:from:to:cc:subject:message-id;
  bh=BR6b4lOgSdHneBXAZFFD8MnvNj5bvbArw7uXgzbwMJo=;
  b=iQM+DuxUtPF5zdGQIw+KF0NsCRwv8mMME67lRa0acGD9XwF1nTpiapul
   9IQNcAf/rU/gy/4Wy5Z2/fLYhETs1kl5eekGQPvWhMCrfT/zV0Ze0CyJN
   oKSx6vednwgbNN2KUH0Lyk1JKWtPGL69sRjLBDiiE99AoXHk1qrAVqCwk
   KfThTq9zZaCHF/hmc1YHGK9k4B00avCoUwlVLsZG9tiRTiz5Xm6PM8nzL
   KHpSMNzooZxrPbPaZpIAskH+/IqjBUerAMyH3BAxdS4VDKWNUpLjCfIaw
   F7vMUZ1PZ349W7D43hn/LTZOx856vWrNSwHPCH1npe0WRabVKvMVh4qyC
   w==;
X-CSE-ConnectionGUID: 3D3KInKcQXacaaGxyLQs5w==
X-CSE-MsgGUID: aMoah4aiSAKBaWIWZuux/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98479258"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="98479258"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 15:11:43 -0700
X-CSE-ConnectionGUID: hEA6tfFfRn68I5Cfh7Q08Q==
X-CSE-MsgGUID: 5Fyd2suRTBSNoUe5F3kQdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="269635077"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Aug 2026 15:11:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxAz5-00000000nrH-3RGZ;
	Thu, 20 Aug 2026 22:11:39 +0000
Date: Fri, 21 Aug 2026 06:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4/ux500-dts-golden-voldown-label] BUILD
 SUCCESS 55ccf78b962180cd7cdff2bacc0388df4e8bf2a5
Message-ID: <202608210638.8oBcQod0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_151143_615603_8E6ADC46 
X-CRM114-Status: UNSURE (   5.34  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-dts-golden-voldown-label
branch HEAD: 55ccf78b962180cd7cdff2bacc0388df4e8bf2a5  ARM: dts: ux500: Harmonize GPIO key names

elapsed time: 1497m

configs tested: 150
configs skipped: 115

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    clang-24
arc                  randconfig-001-20260820    clang-24
arc                  randconfig-002-20260820    clang-24
arm                  randconfig-001-20260820    clang-24
arm                  randconfig-002-20260820    clang-24
arm                  randconfig-003-20260820    clang-24
arm                  randconfig-003-20260820    gcc-8.5.0
arm                  randconfig-004-20260820    clang-24
arm                          sunxi_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260820    clang-24
arm64                randconfig-001-20260820    gcc-14.3.0
arm64                randconfig-001-20260821    gcc-8.5.0
arm64                randconfig-002-20260820    clang-24
arm64                randconfig-002-20260820    gcc-14.3.0
arm64                randconfig-002-20260821    gcc-8.5.0
arm64                randconfig-003-20260820    clang-24
arm64                randconfig-003-20260820    gcc-14.3.0
arm64                randconfig-003-20260821    gcc-8.5.0
arm64                randconfig-004-20260820    clang-24
arm64                randconfig-004-20260820    gcc-14.3.0
arm64                randconfig-004-20260821    gcc-8.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260820    clang-24
csky                 randconfig-001-20260820    gcc-14.3.0
csky                 randconfig-001-20260821    gcc-8.5.0
csky                 randconfig-002-20260820    clang-24
csky                 randconfig-002-20260820    gcc-14.3.0
csky                 randconfig-002-20260821    gcc-8.5.0
hexagon                       randconfig-001    gcc-14.3.0
hexagon              randconfig-001-20260820    gcc-14.3.0
hexagon              randconfig-002-20260820    gcc-14.3.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260820    gcc-14
i386       buildonly-randconfig-001-20260821    gcc-14
i386       buildonly-randconfig-002-20260820    gcc-14
i386       buildonly-randconfig-002-20260821    gcc-14
i386       buildonly-randconfig-003-20260820    gcc-14
i386       buildonly-randconfig-003-20260821    gcc-14
i386       buildonly-randconfig-004-20260820    gcc-14
i386       buildonly-randconfig-004-20260821    gcc-14
i386       buildonly-randconfig-005-20260820    gcc-14
i386       buildonly-randconfig-005-20260821    gcc-14
i386       buildonly-randconfig-006-20260820    gcc-14
i386       buildonly-randconfig-006-20260821    gcc-14
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260820    clang-22
i386                 randconfig-002-20260820    clang-22
i386                 randconfig-003-20260820    clang-22
i386                 randconfig-004-20260820    clang-22
i386                 randconfig-005-20260820    clang-22
i386                 randconfig-006-20260820    clang-22
i386                 randconfig-007-20260820    clang-22
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260820    gcc-14
i386                 randconfig-012-20260820    gcc-14
i386                 randconfig-013-20260820    gcc-14
i386                 randconfig-014-20260820    gcc-14
i386                 randconfig-015-20260820    gcc-14
i386                 randconfig-016-20260820    gcc-14
i386                 randconfig-017-20260820    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260820    gcc-14.3.0
loongarch            randconfig-002-20260820    gcc-14.3.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260820    gcc-14.3.0
nios2                randconfig-002-20260820    gcc-14.3.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260820    gcc-8.5.0
parisc               randconfig-002-20260820    gcc-8.5.0
powerpc                  lite5200b_defconfig    clang-24
powerpc              randconfig-001-20260820    gcc-8.5.0
powerpc              randconfig-002-20260820    gcc-8.5.0
powerpc                    sequoia_defconfig    clang-24
powerpc64            randconfig-001-20260820    gcc-8.5.0
powerpc64            randconfig-002-20260820    gcc-8.5.0
riscv                         randconfig-001    clang-24
riscv                randconfig-001-20260820    clang-24
riscv                randconfig-001-20260821    clang-24
riscv                randconfig-002-20260820    clang-24
riscv                randconfig-002-20260821    clang-24
s390                 randconfig-001-20260820    clang-24
s390                 randconfig-001-20260821    clang-24
s390                 randconfig-002-20260820    clang-24
s390                 randconfig-002-20260821    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260820    clang-24
sh                   randconfig-001-20260821    clang-24
sh                   randconfig-002-20260820    clang-24
sh                   randconfig-002-20260821    clang-24
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260820    gcc-13.4.0
sparc                randconfig-001-20260821    gcc-8.5.0
sparc                randconfig-002-20260820    gcc-13.4.0
sparc                randconfig-002-20260821    gcc-8.5.0
sparc                      sparc64_defconfig    gcc-16.1.0
sparc64              randconfig-001-20260820    gcc-13.4.0
sparc64              randconfig-001-20260821    gcc-8.5.0
sparc64              randconfig-002-20260820    gcc-13.4.0
sparc64              randconfig-002-20260821    gcc-8.5.0
um                   randconfig-001-20260820    gcc-13.4.0
um                   randconfig-001-20260821    gcc-8.5.0
um                   randconfig-002-20260820    gcc-13.4.0
um                   randconfig-002-20260821    gcc-8.5.0
x86_64     buildonly-randconfig-001-20260820    gcc-14
x86_64     buildonly-randconfig-002-20260820    gcc-14
x86_64     buildonly-randconfig-003-20260820    gcc-14
x86_64     buildonly-randconfig-004-20260820    gcc-14
x86_64     buildonly-randconfig-005-20260820    gcc-14
x86_64     buildonly-randconfig-006-20260820    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260820    clang-22
x86_64               randconfig-002-20260820    clang-22
x86_64               randconfig-003-20260820    clang-22
x86_64               randconfig-004-20260820    clang-22
x86_64               randconfig-005-20260820    clang-22
x86_64               randconfig-006-20260820    clang-22
x86_64               randconfig-011-20260820    clang-22
x86_64               randconfig-012-20260820    clang-22
x86_64               randconfig-013-20260820    clang-22
x86_64               randconfig-014-20260820    clang-22
x86_64               randconfig-015-20260820    clang-22
x86_64               randconfig-016-20260820    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260820    clang-22
x86_64               randconfig-071-20260820    gcc-14
x86_64               randconfig-072-20260820    clang-22
x86_64               randconfig-072-20260820    gcc-14
x86_64               randconfig-073-20260820    clang-22
x86_64               randconfig-073-20260820    gcc-14
x86_64               randconfig-074-20260820    clang-22
x86_64               randconfig-074-20260820    gcc-14
x86_64               randconfig-075-20260820    clang-22
x86_64               randconfig-075-20260820    gcc-14
x86_64               randconfig-076-20260820    clang-22
x86_64               randconfig-076-20260820    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260820    gcc-13.4.0
xtensa               randconfig-001-20260821    gcc-8.5.0
xtensa               randconfig-002-20260820    gcc-13.4.0
xtensa               randconfig-002-20260821    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

