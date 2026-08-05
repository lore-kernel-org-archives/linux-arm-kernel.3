Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A561C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aqD5Qfg3jR3KicQ6b78YQM+IZEq6r2GPemyocjI4g44=; b=An5y4cqQhheVCz34DIQN/ynS6m
	DvdpT+7tgD7iwetTv0kkdWP8L06TmWE2qMVs+Bq4zsKjzrpHP1hJ2ykZpQNjyuwPgikUqDbK06kh0
	ze0/OC9ftPR/KknouYMq0Gx/IohcZMVHWwUKPIIwrxpxSyfOaPmz6kVbl+ESCJJQbWaCED0tKz5ba
	Xi0EEcCOfGX2tR7zB/zzDdLgoma777vtJCQZMRaRwtOYA+RlMDmAm0OKZ79cLlbq0rXnbo7IkfYrG
	I76SNknErccU1soxi8qrh/aw2Bc2wN39hBiig3TcvXOH8NIuzuROHUy58vcjhmMIqzAhiUtwVgIgV
	YXiN3rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrk0s-00000004bi9-1xsa;
	Wed, 05 Aug 2026 22:23:02 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrk0q-00000004bgs-01nM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785968580; x=1817504580;
  h=date:from:to:cc:subject:message-id;
  bh=9X1EVv/YDspdY5QiAo592yeV8f5QUNBgz3AUiaRAaOQ=;
  b=Uwq2sz6cHTgr/xuwB/si+PEErbYOvXeg+0y3oEaifNo9b+IzvtJaSREl
   v9dTNDMYwmPXZzvRIwvTNYNLo+oogcDB4uM2MeAWZ2Xf9asIFMvHtUs4I
   X75xDlAKi+Jk5ofSEaj9pg5XBXSuwyNm6KBLh7rU0BUAIfMWt2AobSeeC
   0lWh1Bp9NM+cO9IMDpu/qs0t/+ElyBr8Ux2j9vFyqLUchlDJcbVT1JTVL
   +RxJoajdMynvZyAQTirW3NnUWJeH4zl5rMSWf4dhuGAmkzDd3XvEThYKV
   Ue/NWp538MGK7TjFVIjgsXNnhkWfBJbcYS62uWXRUfX8uHkw+jJ/QpA3F
   Q==;
X-CSE-ConnectionGUID: uKFlRwtaSH2T6K8FGxCbLA==
X-CSE-MsgGUID: e8mDueI/S9K824/A2RzOrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="103956711"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="103956711"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 15:22:59 -0700
X-CSE-ConnectionGUID: Nl8/zLDgQOyg4qD3e9plIA==
X-CSE-MsgGUID: VEWS44PNTH+NyBLpai7xqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="265773507"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Aug 2026 15:22:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrk0l-00000000DZC-29dN;
	Wed, 05 Aug 2026 22:22:55 +0000
Date: Thu, 06 Aug 2026 06:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 81aa917982c10b9f2cd0dd767d7af5af6057d93d
Message-ID: <202608060613.SfuTSGu1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_152300_089509_C5632F38 
X-CRM114-Status: UNSURE (   5.32  )
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
branch HEAD: 81aa917982c10b9f2cd0dd767d7af5af6057d93d  soc: document merges

elapsed time: 1548m

configs tested: 173
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260805    gcc-12.5.0
arc                  randconfig-001-20260806    gcc-11.5.0
arc                  randconfig-002-20260805    gcc-12.5.0
arc                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-001-20260805    gcc-12.5.0
arm                  randconfig-001-20260806    gcc-11.5.0
arm                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-003-20260805    gcc-12.5.0
arm                  randconfig-003-20260806    gcc-11.5.0
arm                  randconfig-004-20260805    gcc-12.5.0
arm                  randconfig-004-20260806    gcc-11.5.0
arm64                         randconfig-001    gcc-10.5.0
arm64                randconfig-001-20260805    gcc-10.5.0
arm64                randconfig-001-20260806    gcc-13.4.0
arm64                randconfig-002-20260805    gcc-10.5.0
arm64                randconfig-002-20260806    gcc-13.4.0
arm64                randconfig-003-20260805    gcc-10.5.0
arm64                randconfig-003-20260806    gcc-13.4.0
arm64                randconfig-004-20260805    gcc-10.5.0
arm64                randconfig-004-20260806    gcc-13.4.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260805    gcc-10.5.0
csky                 randconfig-001-20260806    gcc-13.4.0
csky                 randconfig-002-20260805    gcc-10.5.0
csky                 randconfig-002-20260806    gcc-13.4.0
hexagon                       randconfig-001    clang-18
hexagon              randconfig-001-20260805    clang-18
hexagon              randconfig-001-20260806    clang-24
hexagon              randconfig-002-20260805    clang-18
hexagon              randconfig-002-20260806    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260805    clang-22
i386       buildonly-randconfig-001-20260806    gcc-14
i386       buildonly-randconfig-002-20260805    clang-22
i386       buildonly-randconfig-002-20260806    gcc-14
i386       buildonly-randconfig-003-20260805    clang-22
i386       buildonly-randconfig-003-20260806    gcc-14
i386       buildonly-randconfig-004-20260805    clang-22
i386       buildonly-randconfig-004-20260806    gcc-14
i386       buildonly-randconfig-005-20260805    clang-22
i386       buildonly-randconfig-005-20260806    gcc-14
i386       buildonly-randconfig-006-20260805    clang-22
i386       buildonly-randconfig-006-20260806    gcc-14
i386                 randconfig-001-20260805    gcc-13
i386                 randconfig-002-20260805    gcc-13
i386                 randconfig-003-20260805    gcc-13
i386                 randconfig-004-20260805    gcc-13
i386                 randconfig-005-20260805    gcc-13
i386                 randconfig-006-20260805    gcc-13
i386                 randconfig-007-20260805    gcc-13
i386                 randconfig-011-20260805    gcc-14
i386                 randconfig-011-20260806    clang-22
i386                 randconfig-012-20260805    gcc-14
i386                 randconfig-012-20260806    clang-22
i386                 randconfig-013-20260805    gcc-14
i386                 randconfig-013-20260806    clang-22
i386                 randconfig-014-20260805    gcc-14
i386                 randconfig-014-20260806    clang-22
i386                 randconfig-015-20260805    gcc-14
i386                 randconfig-015-20260806    clang-22
i386                 randconfig-016-20260805    gcc-14
i386                 randconfig-016-20260806    clang-22
i386                 randconfig-017-20260805    gcc-14
i386                 randconfig-017-20260806    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260805    clang-18
loongarch            randconfig-001-20260806    clang-24
loongarch            randconfig-002-20260805    clang-18
loongarch            randconfig-002-20260806    clang-24
mips                 cavium_octeon_defconfig    gcc-16.1.0
mips                          jazz_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260805    clang-18
nios2                randconfig-001-20260806    clang-24
nios2                randconfig-002-20260805    clang-18
nios2                randconfig-002-20260806    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-9.5.0
parisc               randconfig-001-20260805    gcc-9.5.0
parisc               randconfig-001-20260806    gcc-8.5.0
parisc               randconfig-002-20260805    gcc-9.5.0
parisc               randconfig-002-20260806    gcc-8.5.0
powerpc                   amigaone_defconfig    gcc-16.1.0
powerpc                    asp8347_defconfig    clang-24
powerpc              randconfig-001-20260805    gcc-9.5.0
powerpc              randconfig-001-20260806    gcc-8.5.0
powerpc              randconfig-002-20260805    gcc-9.5.0
powerpc              randconfig-002-20260806    gcc-8.5.0
powerpc64            randconfig-001-20260805    gcc-9.5.0
powerpc64            randconfig-001-20260806    gcc-8.5.0
powerpc64            randconfig-002-20260805    gcc-9.5.0
powerpc64            randconfig-002-20260806    gcc-8.5.0
riscv                         randconfig-001    gcc-8.5.0
riscv                randconfig-001-20260805    gcc-8.5.0
riscv                randconfig-001-20260806    gcc-13.4.0
riscv                randconfig-002-20260805    gcc-8.5.0
riscv                randconfig-002-20260806    gcc-13.4.0
s390                 randconfig-001-20260805    gcc-8.5.0
s390                 randconfig-001-20260806    gcc-13.4.0
s390                 randconfig-002-20260805    gcc-8.5.0
s390                 randconfig-002-20260806    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260805    gcc-8.5.0
sh                   randconfig-001-20260806    gcc-13.4.0
sh                   randconfig-002-20260805    gcc-8.5.0
sh                   randconfig-002-20260806    gcc-13.4.0
sh                          se7705_defconfig    gcc-16.1.0
sparc                randconfig-001-20260805    gcc-11.5.0
sparc                randconfig-001-20260806    gcc-8.5.0
sparc                randconfig-002-20260805    gcc-11.5.0
sparc                randconfig-002-20260806    gcc-8.5.0
sparc64              randconfig-001-20260805    gcc-11.5.0
sparc64              randconfig-001-20260806    gcc-8.5.0
sparc64              randconfig-002-20260805    gcc-11.5.0
sparc64              randconfig-002-20260806    gcc-8.5.0
um                   randconfig-001-20260805    gcc-11.5.0
um                   randconfig-001-20260806    gcc-8.5.0
um                   randconfig-002-20260805    gcc-11.5.0
um                   randconfig-002-20260806    gcc-8.5.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260805    gcc-14
x86_64     buildonly-randconfig-001-20260806    clang-22
x86_64     buildonly-randconfig-002-20260805    gcc-14
x86_64     buildonly-randconfig-002-20260806    clang-22
x86_64     buildonly-randconfig-003-20260805    gcc-14
x86_64     buildonly-randconfig-003-20260806    clang-22
x86_64     buildonly-randconfig-004-20260805    gcc-14
x86_64     buildonly-randconfig-004-20260806    clang-22
x86_64     buildonly-randconfig-005-20260805    gcc-14
x86_64     buildonly-randconfig-005-20260806    clang-22
x86_64     buildonly-randconfig-006-20260805    gcc-14
x86_64     buildonly-randconfig-006-20260806    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260805    gcc-14
x86_64               randconfig-002-20260805    gcc-14
x86_64               randconfig-003-20260805    gcc-14
x86_64               randconfig-004-20260805    gcc-14
x86_64               randconfig-005-20260805    gcc-14
x86_64               randconfig-006-20260805    gcc-14
x86_64               randconfig-011-20260805    gcc-14
x86_64               randconfig-012-20260805    gcc-14
x86_64               randconfig-013-20260805    gcc-14
x86_64               randconfig-014-20260805    gcc-14
x86_64               randconfig-015-20260805    gcc-14
x86_64               randconfig-016-20260805    gcc-14
x86_64               randconfig-071-20260805    clang-22
x86_64               randconfig-071-20260806    gcc-14
x86_64               randconfig-072-20260805    clang-22
x86_64               randconfig-072-20260806    gcc-14
x86_64               randconfig-073-20260805    clang-22
x86_64               randconfig-073-20260806    gcc-14
x86_64               randconfig-074-20260805    clang-22
x86_64               randconfig-074-20260806    gcc-14
x86_64               randconfig-075-20260805    clang-22
x86_64               randconfig-075-20260806    gcc-14
x86_64               randconfig-076-20260805    clang-22
x86_64               randconfig-076-20260806    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260805    gcc-11.5.0
xtensa               randconfig-001-20260806    gcc-8.5.0
xtensa               randconfig-002-20260805    gcc-11.5.0
xtensa               randconfig-002-20260806    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

