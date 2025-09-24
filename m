Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDB2CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YX8a/51L97n1ZI+a5+UNicoAaC6gb4itPc+rxKNEcPM=; b=cKwPRp6EznGc3XTNeZFOK81NAu
	jkT/Ed/TMXbS4D5Va2zbFxxogTykJTYIZMtMDrwgZelSJtAV3blTx2oXqATodZYPqkUuxkCPzM1l+
	DlVwyEsPgD6VIV9UoMNvKgHszSQyRlbyRu8JbytJvzwlsx22mpp97TEX5PfFjKcrEMZfqWLypY56L
	k498liJgpbtd6qLUXkSg/tURcLASEXjqFeNKBvMji4O6NmIH8WlCRdf6B/le2SUucCupZz1gfY+Ei
	mobx5V7+iF473/7Id7FawiyRoF8zJgpMl+WRwr4G0dUbNkHb79r1Fg2oVrRHRYKjSlCKGDQGkECV7
	fyXsRclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SOA-00000001itk-2kzE;
	Wed, 24 Sep 2025 16:30:42 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SO7-00000001itQ-3kya
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758731440; x=1790267440;
  h=date:from:to:cc:subject:message-id;
  bh=r6ytChXBB6+/o/jiw3rRQ4z0qGE/EemGNga8zB6OjXk=;
  b=WHrebcDP9OW8Sp1rRGaKhqdzUVqhkaM6bsjEB+kkF1i/PQChd9m+tAwC
   9zych8kurMPm3b2qYWL0j5DzR7Oc0Xnm4HsDVbsBgR9yM9czWB2SlnrIY
   kkGVhqvYnFkTpz+sJPe2w0vwHcHa+CODnPMKUCNDfqDkjS1U4iUdiuyuu
   Faw1toBnjy5mdT/1OohhP7Dfs/Bk85qkWsaERlvgAfpSVzWOny4b6cix2
   w8cZl8R++aM1SoKRYSB4/MJFSXbXSo0QZ9uqJdvlRh01EEeVQVfjAazU1
   tCpGpj2B27AsxLScRMy6sRSOh+HU4ttlFTYGlUDR0ALkLaLJsK15W6A/o
   A==;
X-CSE-ConnectionGUID: 62E/+rzRTJ6wopvbPe83BQ==
X-CSE-MsgGUID: 91lKopdnQGKp00iqi7ai5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72135971"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="72135971"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 09:30:38 -0700
X-CSE-ConnectionGUID: mcDTpJ6oR7+Zp6oWOOSMuA==
X-CSE-MsgGUID: Og/Lcbt+QgCyvIUL+1Zhlg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Sep 2025 09:30:37 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1SO2-0004Kq-26;
	Wed, 24 Sep 2025 16:30:34 +0000
Date: Thu, 25 Sep 2025 00:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:sophgo/dt] BUILD SUCCESS
 4d94abded400a5194b929c26b3aa07fb9485fe35
Message-ID: <202509250022.3YMPoVuF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_093039_983699_24171CDD 
X-CRM114-Status: UNSURE (   5.31  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt
branch HEAD: 4d94abded400a5194b929c26b3aa07fb9485fe35  dts: sophgo: sg2042: added numa id description

elapsed time: 1180m

configs tested: 73
configs skipped: 125

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
arc                               allnoconfig    clang-22
arm                               allnoconfig    clang-22
arm64                             allnoconfig    clang-22
csky                              allnoconfig    clang-22
hexagon                           allnoconfig    clang-22
i386        buildonly-randconfig-001-20250924    gcc-14
i386        buildonly-randconfig-002-20250924    gcc-14
i386        buildonly-randconfig-003-20250924    gcc-14
i386        buildonly-randconfig-004-20250924    gcc-14
i386        buildonly-randconfig-005-20250924    gcc-14
i386        buildonly-randconfig-006-20250924    gcc-14
i386                  randconfig-001-20250924    clang-20
i386                  randconfig-002-20250924    clang-20
i386                  randconfig-003-20250924    clang-20
i386                  randconfig-004-20250924    clang-20
i386                  randconfig-005-20250924    clang-20
i386                  randconfig-006-20250924    clang-20
i386                  randconfig-007-20250924    clang-20
i386                  randconfig-011-20250924    gcc-14
i386                  randconfig-012-20250924    gcc-14
i386                  randconfig-013-20250924    gcc-14
i386                  randconfig-014-20250924    gcc-14
i386                  randconfig-015-20250924    gcc-14
i386                  randconfig-016-20250924    gcc-14
i386                  randconfig-017-20250924    gcc-14
loongarch                         allnoconfig    clang-22
microblaze                          defconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-14
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250924    gcc-8.5.0
riscv                 randconfig-002-20250924    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-14
sh                                  defconfig    gcc-14
sparc                               defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-14
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64      buildonly-randconfig-001-20250924    clang-20
x86_64      buildonly-randconfig-002-20250924    clang-20
x86_64      buildonly-randconfig-003-20250924    clang-20
x86_64      buildonly-randconfig-004-20250924    clang-20
x86_64      buildonly-randconfig-005-20250924    clang-20
x86_64      buildonly-randconfig-006-20250924    clang-20
x86_64                randconfig-001-20250924    gcc-14
x86_64                randconfig-002-20250924    gcc-14
x86_64                randconfig-003-20250924    gcc-14
x86_64                randconfig-004-20250924    gcc-14
x86_64                randconfig-005-20250924    gcc-14
x86_64                randconfig-006-20250924    gcc-14
x86_64                randconfig-007-20250924    gcc-14
x86_64                randconfig-008-20250924    gcc-14
x86_64                randconfig-071-20250924    clang-20
x86_64                randconfig-072-20250924    clang-20
x86_64                randconfig-073-20250924    clang-20
x86_64                randconfig-074-20250924    clang-20
x86_64                randconfig-075-20250924    clang-20
x86_64                randconfig-076-20250924    clang-20
x86_64                randconfig-077-20250924    clang-20
x86_64                randconfig-078-20250924    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

