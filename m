Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9FAC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L5K7Tq6wAZcmryQfZrhIYqQN3+HZ/slI5SunJlG2dUU=; b=ZlLou0Awyktswkk2l/KApXq8NX
	VIJFHXDTgnBEmUicR/uFjHKRl78/D3OafN4nU8n9Lfg77k1NQnpocVb09VKcR+PQuBRolr4skqOiv
	8eGnvNSKMHf5KigxT0Lhz5CLjV7TLW2FT9SJSdsPi/kL7dnJUM8pXpiQSlOQMZVZrmkOhkPCRdqFn
	9kKW0xYFaFjWn3jZA4pMVQp05Bt4dSXvojzxqUigVLZfxd32pkX98UFxUGpEj4zGebmyAFqClTzWB
	vR9tngJ0hZiaIK19ZsL+5BulMKLYnxJpPjlhejeMKqPNL8RcoP8NmpGstwuzte8MWzcu+UsJMTPTW
	2TmpJ1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM8g-00000009ryS-0R3I;
	Thu, 30 Jul 2026 08:29:14 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM8e-00000009rxm-0bRB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785400152; x=1816936152;
  h=date:from:to:cc:subject:message-id;
  bh=Cu9CPNF2cHRfM/f9oxNqLbLjY+d8NSZbp/T97eeZpGI=;
  b=T+nVlFx57UxwHEqai7G0Oix06ar+NYKRiK7CnJ7sl0ucMQpl/dp41x7x
   kT/cujtNhZI8uRrM49u0BBWKBh9OicRO/JmV1ryoWJpTrULSs6i5z7sIa
   YJbbIZZrIbKvPDo6mPh0Yjl10maZzGWnifo2vjiJH2JPKlDQBhC9MvScU
   LPTgvAmSdZngxZt7YgJxnhQ0JSv6eQq2pzoGWp0gp/0vKj4f8Ho9m3Hrp
   +JoY8Taqt1J/ToJPc7by0mF/zCrdi5a9VAaQurXjg/lbTeFgkRm0/Jlse
   7pnVwes5XOug5Nj8u4dmdVCjC5Qx5wBYOWmgQsA3nL4dchnVVzhwi1+1z
   g==;
X-CSE-ConnectionGUID: 7ILMziG/Sk2fs5zPSMEYCw==
X-CSE-MsgGUID: b29fF/CsSZ2nWR/A7VstcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86029375"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86029375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 01:29:11 -0700
X-CSE-ConnectionGUID: VxEcX270QX65v3jMSQR9Ig==
X-CSE-MsgGUID: xYoVGvb+SQigeq2zZfoUQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="284815870"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jul 2026 01:29:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpM8Z-00000000gJY-2UpN;
	Thu, 30 Jul 2026 08:29:07 +0000
Date: Thu, 30 Jul 2026 16:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:thead/dts] BUILD SUCCESS
 15d32aaf6300b832814a9930fdbd20efdbc9adcf
Message-ID: <202607301619.lQixgwb5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_012912_407042_8CBBE91A 
X-CRM114-Status: UNSURE (   5.30  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git thead/dts
branch HEAD: 15d32aaf6300b832814a9930fdbd20efdbc9adcf  riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions

elapsed time: 8211m

configs tested: 382
configs skipped: 97

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    clang-21
arc                  randconfig-001-20260725    clang-21
arc                  randconfig-001-20260728    gcc-8.5.0
arc                  randconfig-001-20260729    gcc-8.5.0
arc                  randconfig-001-20260730    gcc-8.5.0
arc                  randconfig-002-20260725    clang-21
arc                  randconfig-002-20260728    gcc-8.5.0
arc                  randconfig-002-20260729    gcc-8.5.0
arc                  randconfig-002-20260730    gcc-8.5.0
arm                      imx_v6_v7_defconfig    clang-24
arm                  randconfig-001-20260725    clang-21
arm                  randconfig-001-20260728    gcc-8.5.0
arm                  randconfig-001-20260729    gcc-8.5.0
arm                  randconfig-001-20260730    gcc-8.5.0
arm                  randconfig-002-20260725    clang-21
arm                  randconfig-002-20260728    gcc-8.5.0
arm                  randconfig-002-20260729    gcc-8.5.0
arm                  randconfig-002-20260730    gcc-8.5.0
arm                  randconfig-003-20260725    clang-21
arm                  randconfig-003-20260728    gcc-8.5.0
arm                  randconfig-003-20260729    gcc-8.5.0
arm                  randconfig-003-20260730    gcc-8.5.0
arm                  randconfig-004-20260725    clang-21
arm                  randconfig-004-20260728    gcc-8.5.0
arm                  randconfig-004-20260729    gcc-8.5.0
arm                  randconfig-004-20260730    gcc-8.5.0
arm                       realview_defconfig    clang-17
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260725    clang-24
arm64                randconfig-001-20260728    gcc-14.3.0
arm64                randconfig-001-20260729    clang-17
arm64                randconfig-001-20260730    gcc-14.3.0
arm64                randconfig-001-20260730    gcc-15.2.0
arm64                randconfig-002-20260725    clang-24
arm64                randconfig-002-20260728    gcc-14.3.0
arm64                randconfig-002-20260729    clang-17
arm64                randconfig-002-20260730    gcc-14.3.0
arm64                randconfig-002-20260730    gcc-15.2.0
arm64                randconfig-003-20260725    clang-24
arm64                randconfig-003-20260728    gcc-14.3.0
arm64                randconfig-003-20260729    clang-17
arm64                randconfig-003-20260730    gcc-14.3.0
arm64                randconfig-003-20260730    gcc-15.2.0
arm64                randconfig-004-20260725    clang-24
arm64                randconfig-004-20260728    gcc-14.3.0
arm64                randconfig-004-20260729    clang-17
arm64                randconfig-004-20260730    gcc-14.3.0
arm64                randconfig-004-20260730    gcc-15.2.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260725    clang-24
csky                 randconfig-001-20260728    gcc-14.3.0
csky                 randconfig-001-20260729    clang-17
csky                 randconfig-001-20260730    gcc-14.3.0
csky                 randconfig-001-20260730    gcc-15.2.0
csky                 randconfig-002-20260725    clang-24
csky                 randconfig-002-20260728    gcc-14.3.0
csky                 randconfig-002-20260729    clang-17
csky                 randconfig-002-20260730    gcc-14.3.0
csky                 randconfig-002-20260730    gcc-15.2.0
hexagon                       randconfig-001    clang-24
hexagon                       randconfig-001    gcc-9.5.0
hexagon              randconfig-001-20260725    gcc-9.5.0
hexagon              randconfig-001-20260728    gcc-11.5.0
hexagon              randconfig-001-20260729    gcc-9.5.0
hexagon              randconfig-001-20260730    clang-24
hexagon              randconfig-002-20260725    gcc-9.5.0
hexagon              randconfig-002-20260728    gcc-11.5.0
hexagon              randconfig-002-20260729    gcc-9.5.0
hexagon              randconfig-002-20260730    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260725    clang-22
i386       buildonly-randconfig-001-20260728    gcc-14
i386       buildonly-randconfig-001-20260729    gcc-14
i386       buildonly-randconfig-001-20260730    gcc-14
i386       buildonly-randconfig-002-20260725    clang-22
i386       buildonly-randconfig-002-20260728    gcc-14
i386       buildonly-randconfig-002-20260729    gcc-14
i386       buildonly-randconfig-002-20260730    gcc-14
i386       buildonly-randconfig-003-20260725    clang-22
i386       buildonly-randconfig-003-20260728    gcc-14
i386       buildonly-randconfig-003-20260729    gcc-14
i386       buildonly-randconfig-003-20260730    gcc-14
i386       buildonly-randconfig-004-20260725    clang-22
i386       buildonly-randconfig-004-20260728    gcc-14
i386       buildonly-randconfig-004-20260729    gcc-14
i386       buildonly-randconfig-004-20260730    gcc-14
i386       buildonly-randconfig-005-20260725    clang-22
i386       buildonly-randconfig-005-20260728    gcc-14
i386       buildonly-randconfig-005-20260729    gcc-14
i386       buildonly-randconfig-005-20260730    gcc-14
i386       buildonly-randconfig-006-20260725    clang-22
i386       buildonly-randconfig-006-20260728    gcc-14
i386       buildonly-randconfig-006-20260729    gcc-14
i386       buildonly-randconfig-006-20260730    gcc-14
i386                          randconfig-001    clang-22
i386                          randconfig-001    gcc-14
i386                 randconfig-001-20260725    clang-22
i386                 randconfig-001-20260728    gcc-14
i386                 randconfig-001-20260729    clang-22
i386                 randconfig-001-20260730    gcc-14
i386                 randconfig-002-20260725    clang-22
i386                 randconfig-002-20260728    gcc-14
i386                 randconfig-002-20260729    clang-22
i386                 randconfig-002-20260730    gcc-14
i386                 randconfig-003-20260725    clang-22
i386                 randconfig-003-20260728    gcc-14
i386                 randconfig-003-20260729    clang-22
i386                 randconfig-003-20260730    gcc-14
i386                 randconfig-004-20260725    clang-22
i386                 randconfig-004-20260728    gcc-14
i386                 randconfig-004-20260729    clang-22
i386                 randconfig-004-20260730    gcc-14
i386                 randconfig-005-20260725    clang-22
i386                 randconfig-005-20260728    gcc-14
i386                 randconfig-005-20260729    clang-22
i386                 randconfig-005-20260730    gcc-14
i386                 randconfig-006-20260725    clang-22
i386                 randconfig-006-20260728    gcc-14
i386                 randconfig-006-20260729    clang-22
i386                 randconfig-006-20260730    gcc-14
i386                 randconfig-007-20260725    clang-22
i386                 randconfig-007-20260728    gcc-14
i386                 randconfig-007-20260729    clang-22
i386                 randconfig-007-20260730    gcc-14
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260725    clang-22
i386                 randconfig-011-20260728    gcc-14
i386                 randconfig-011-20260729    gcc-14
i386                 randconfig-011-20260730    clang-22
i386                 randconfig-012-20260725    clang-22
i386                 randconfig-012-20260728    gcc-14
i386                 randconfig-012-20260729    gcc-14
i386                 randconfig-012-20260730    clang-22
i386                 randconfig-013-20260725    clang-22
i386                 randconfig-013-20260728    gcc-14
i386                 randconfig-013-20260729    gcc-14
i386                 randconfig-013-20260730    clang-22
i386                 randconfig-014-20260725    clang-22
i386                 randconfig-014-20260728    gcc-14
i386                 randconfig-014-20260729    gcc-14
i386                 randconfig-014-20260730    clang-22
i386                 randconfig-015-20260725    clang-22
i386                 randconfig-015-20260728    gcc-14
i386                 randconfig-015-20260729    gcc-14
i386                 randconfig-015-20260730    clang-22
i386                 randconfig-016-20260725    clang-22
i386                 randconfig-016-20260728    gcc-14
i386                 randconfig-016-20260729    gcc-14
i386                 randconfig-016-20260730    clang-22
i386                 randconfig-017-20260725    clang-22
i386                 randconfig-017-20260728    gcc-14
i386                 randconfig-017-20260729    gcc-14
i386                 randconfig-017-20260730    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260725    gcc-9.5.0
loongarch            randconfig-001-20260728    gcc-11.5.0
loongarch            randconfig-001-20260729    gcc-9.5.0
loongarch            randconfig-001-20260730    clang-24
loongarch            randconfig-002-20260725    gcc-9.5.0
loongarch            randconfig-002-20260728    gcc-11.5.0
loongarch            randconfig-002-20260729    gcc-9.5.0
loongarch            randconfig-002-20260730    clang-24
m68k                      m5249evb_defconfig    gcc-16.1.0
mips                         ath25_defconfig    clang-24
mips                          ip30_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260725    gcc-9.5.0
nios2                randconfig-001-20260728    gcc-11.5.0
nios2                randconfig-001-20260729    gcc-9.5.0
nios2                randconfig-001-20260730    clang-24
nios2                randconfig-002-20260725    gcc-9.5.0
nios2                randconfig-002-20260728    gcc-11.5.0
nios2                randconfig-002-20260729    gcc-9.5.0
nios2                randconfig-002-20260730    clang-24
parisc                          alldefconfig    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-14.3.0
parisc               randconfig-001-20260725    clang-17
parisc               randconfig-001-20260728    gcc-10.5.0
parisc               randconfig-001-20260729    clang-24
parisc               randconfig-001-20260730    gcc-14.3.0
parisc               randconfig-002-20260725    clang-17
parisc               randconfig-002-20260728    gcc-10.5.0
parisc               randconfig-002-20260729    clang-24
parisc               randconfig-002-20260730    gcc-14.3.0
powerpc                mpc836x_rdk_defconfig    clang-24
powerpc              randconfig-001-20260725    clang-17
powerpc              randconfig-001-20260728    gcc-10.5.0
powerpc              randconfig-001-20260729    clang-24
powerpc              randconfig-001-20260730    gcc-14.3.0
powerpc              randconfig-002-20260725    clang-17
powerpc              randconfig-002-20260728    gcc-10.5.0
powerpc              randconfig-002-20260729    clang-24
powerpc              randconfig-002-20260730    gcc-14.3.0
powerpc64            randconfig-001-20260725    clang-17
powerpc64            randconfig-001-20260728    gcc-10.5.0
powerpc64            randconfig-001-20260729    clang-24
powerpc64            randconfig-001-20260730    gcc-14.3.0
powerpc64            randconfig-002-20260725    clang-17
powerpc64            randconfig-002-20260728    gcc-10.5.0
powerpc64            randconfig-002-20260729    clang-24
powerpc64            randconfig-002-20260730    gcc-14.3.0
riscv                randconfig-001-20260725    gcc-10.5.0
riscv                randconfig-001-20260728    gcc-14.3.0
riscv                randconfig-001-20260729    gcc-15.2.0
riscv                randconfig-001-20260730    gcc-15.2.0
riscv                randconfig-002-20260725    gcc-10.5.0
riscv                randconfig-002-20260728    gcc-14.3.0
riscv                randconfig-002-20260729    gcc-15.2.0
riscv                randconfig-002-20260730    gcc-15.2.0
riscv                randconfig-002-20260730    gcc-9.5.0
s390                 randconfig-001-20260725    gcc-10.5.0
s390                 randconfig-001-20260728    gcc-14.3.0
s390                 randconfig-001-20260729    gcc-15.2.0
s390                 randconfig-001-20260730    gcc-15.2.0
s390                 randconfig-002-20260725    gcc-10.5.0
s390                 randconfig-002-20260728    gcc-14.3.0
s390                 randconfig-002-20260729    gcc-15.2.0
s390                 randconfig-002-20260730    gcc-15.2.0
sh                                 defconfig    gcc-16.1.0
sh                       edosk7760_defconfig    gcc-16.1.0
sh                   randconfig-001-20260725    gcc-10.5.0
sh                   randconfig-001-20260728    gcc-14.3.0
sh                   randconfig-001-20260729    gcc-15.2.0
sh                   randconfig-001-20260730    gcc-15.2.0
sh                   randconfig-002-20260725    gcc-10.5.0
sh                   randconfig-002-20260728    gcc-14.3.0
sh                   randconfig-002-20260729    gcc-15.2.0
sh                   randconfig-002-20260730    gcc-15.2.0
sh                          se7705_defconfig    gcc-16.1.0
sparc                         randconfig-001    clang-24
sparc                         randconfig-001    gcc-11.5.0
sparc                randconfig-001-20260725    gcc-8.5.0
sparc                randconfig-001-20260728    gcc-11.5.0
sparc                randconfig-001-20260729    gcc-10.5.0
sparc                randconfig-001-20260730    clang-24
sparc                randconfig-002-20260725    gcc-8.5.0
sparc                randconfig-002-20260728    gcc-11.5.0
sparc                randconfig-002-20260729    gcc-10.5.0
sparc                randconfig-002-20260730    clang-24
sparc64              randconfig-001-20260725    gcc-8.5.0
sparc64              randconfig-001-20260728    gcc-11.5.0
sparc64              randconfig-001-20260729    gcc-10.5.0
sparc64              randconfig-001-20260730    clang-24
sparc64              randconfig-002-20260725    gcc-8.5.0
sparc64              randconfig-002-20260728    gcc-11.5.0
sparc64              randconfig-002-20260729    gcc-10.5.0
sparc64              randconfig-002-20260730    clang-24
um                   randconfig-001-20260725    gcc-8.5.0
um                   randconfig-001-20260728    gcc-11.5.0
um                   randconfig-001-20260729    gcc-10.5.0
um                   randconfig-001-20260730    clang-24
um                   randconfig-002-20260725    gcc-8.5.0
um                   randconfig-002-20260728    gcc-11.5.0
um                   randconfig-002-20260729    gcc-10.5.0
um                   randconfig-002-20260730    clang-24
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260725    gcc-12
x86_64     buildonly-randconfig-001-20260728    clang-22
x86_64     buildonly-randconfig-001-20260729    clang-22
x86_64     buildonly-randconfig-001-20260730    gcc-14
x86_64     buildonly-randconfig-002-20260725    gcc-12
x86_64     buildonly-randconfig-002-20260728    clang-22
x86_64     buildonly-randconfig-002-20260729    clang-22
x86_64     buildonly-randconfig-002-20260730    gcc-14
x86_64     buildonly-randconfig-003-20260725    gcc-12
x86_64     buildonly-randconfig-003-20260728    clang-22
x86_64     buildonly-randconfig-003-20260729    clang-22
x86_64     buildonly-randconfig-003-20260730    gcc-14
x86_64     buildonly-randconfig-004-20260725    gcc-12
x86_64     buildonly-randconfig-004-20260728    clang-22
x86_64     buildonly-randconfig-004-20260729    clang-22
x86_64     buildonly-randconfig-004-20260730    gcc-14
x86_64     buildonly-randconfig-005-20260725    gcc-12
x86_64     buildonly-randconfig-005-20260728    clang-22
x86_64     buildonly-randconfig-005-20260729    clang-22
x86_64     buildonly-randconfig-005-20260730    gcc-14
x86_64     buildonly-randconfig-006-20260725    gcc-12
x86_64     buildonly-randconfig-006-20260728    clang-22
x86_64     buildonly-randconfig-006-20260729    clang-22
x86_64     buildonly-randconfig-006-20260730    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260725    gcc-14
x86_64               randconfig-001-20260728    gcc-12
x86_64               randconfig-001-20260729    clang-22
x86_64               randconfig-001-20260730    clang-22
x86_64               randconfig-002-20260725    gcc-14
x86_64               randconfig-002-20260728    gcc-12
x86_64               randconfig-002-20260729    clang-22
x86_64               randconfig-002-20260730    clang-22
x86_64               randconfig-003-20260725    gcc-14
x86_64               randconfig-003-20260728    gcc-12
x86_64               randconfig-003-20260729    clang-22
x86_64               randconfig-003-20260730    clang-22
x86_64               randconfig-004-20260725    gcc-14
x86_64               randconfig-004-20260728    gcc-12
x86_64               randconfig-004-20260729    clang-22
x86_64               randconfig-004-20260730    clang-22
x86_64               randconfig-005-20260725    gcc-14
x86_64               randconfig-005-20260728    gcc-12
x86_64               randconfig-005-20260729    clang-22
x86_64               randconfig-005-20260730    clang-22
x86_64               randconfig-006-20260725    gcc-14
x86_64               randconfig-006-20260728    gcc-12
x86_64               randconfig-006-20260729    clang-22
x86_64               randconfig-006-20260730    clang-22
x86_64                        randconfig-011    gcc-14
x86_64               randconfig-011-20260725    gcc-14
x86_64               randconfig-011-20260728    clang-22
x86_64               randconfig-011-20260729    gcc-14
x86_64               randconfig-011-20260730    clang-22
x86_64               randconfig-012-20260725    gcc-14
x86_64               randconfig-012-20260728    clang-22
x86_64               randconfig-012-20260729    gcc-14
x86_64               randconfig-012-20260730    clang-22
x86_64               randconfig-013-20260725    gcc-14
x86_64               randconfig-013-20260728    clang-22
x86_64               randconfig-013-20260729    gcc-14
x86_64               randconfig-013-20260730    clang-22
x86_64               randconfig-014-20260725    gcc-14
x86_64               randconfig-014-20260728    clang-22
x86_64               randconfig-014-20260729    gcc-14
x86_64               randconfig-014-20260730    clang-22
x86_64               randconfig-015-20260725    gcc-14
x86_64               randconfig-015-20260728    clang-22
x86_64               randconfig-015-20260729    gcc-14
x86_64               randconfig-015-20260730    clang-22
x86_64               randconfig-016-20260725    gcc-14
x86_64               randconfig-016-20260728    clang-22
x86_64               randconfig-016-20260729    gcc-14
x86_64               randconfig-016-20260730    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260725    gcc-14
x86_64               randconfig-071-20260728    clang-22
x86_64               randconfig-071-20260729    gcc-12
x86_64               randconfig-071-20260730    gcc-12
x86_64               randconfig-071-20260730    gcc-14
x86_64               randconfig-072-20260725    gcc-14
x86_64               randconfig-072-20260728    clang-22
x86_64               randconfig-072-20260729    gcc-12
x86_64               randconfig-072-20260730    gcc-12
x86_64               randconfig-072-20260730    gcc-14
x86_64               randconfig-073-20260725    gcc-14
x86_64               randconfig-073-20260728    clang-22
x86_64               randconfig-073-20260729    gcc-12
x86_64               randconfig-073-20260730    gcc-12
x86_64               randconfig-073-20260730    gcc-14
x86_64               randconfig-074-20260725    gcc-14
x86_64               randconfig-074-20260728    clang-22
x86_64               randconfig-074-20260729    gcc-12
x86_64               randconfig-074-20260730    gcc-12
x86_64               randconfig-074-20260730    gcc-14
x86_64               randconfig-075-20260725    gcc-14
x86_64               randconfig-075-20260728    clang-22
x86_64               randconfig-075-20260729    gcc-12
x86_64               randconfig-075-20260730    gcc-12
x86_64               randconfig-075-20260730    gcc-14
x86_64               randconfig-076-20260725    gcc-14
x86_64               randconfig-076-20260728    clang-22
x86_64               randconfig-076-20260729    gcc-12
x86_64               randconfig-076-20260730    gcc-12
x86_64               randconfig-076-20260730    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260725    gcc-8.5.0
xtensa               randconfig-001-20260728    gcc-11.5.0
xtensa               randconfig-001-20260729    gcc-10.5.0
xtensa               randconfig-001-20260730    clang-24
xtensa               randconfig-002-20260725    gcc-8.5.0
xtensa               randconfig-002-20260728    gcc-11.5.0
xtensa               randconfig-002-20260729    gcc-10.5.0
xtensa               randconfig-002-20260730    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

