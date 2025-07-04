Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12729C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 21:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3JyLdTUhpAS8ohR99oK52Jejio+VCVi4VkmcljFcohE=; b=3VqoyIIlmQDqwfPme/XbG9AOh7
	/4E6exOtQfKdFua+tz8zDfzIfVbjZGcNxP7WIEBMRbyo6sgQT+9PJMZfFMXwKefkR78qqL0aP+DkQ
	aj/E+HYWp8bZvBuvkRiVxTj/QODiRokrxfR9UlZn3ce5EbKhq+M/H0iwqcjRwMf0ChLjpFWn9dhSV
	Y4qRO3Nf1K+Hq/7vPzWbHT/TkAV7fz+plzTcLeDFHbK20e5RTzYgmejYE6vXdUfUQeP7IXh+h6fSv
	qUdS1BsZd3gvwXDdtmROj6xE5w8pqWw2Wa6SMj+Yn/v5/a9mOVGYPjLDgMlM7XDi3oy0Tffp3ArB4
	k0dMxClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXo6o-0000000FXPn-44pD;
	Fri, 04 Jul 2025 21:38:14 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXo4S-0000000FXDY-3bmM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 21:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751664949; x=1783200949;
  h=date:from:to:cc:subject:message-id;
  bh=S9yTVxsj/Nu+N0LoDU5cIUsGKMcSJwGNmAw2VzcIDvE=;
  b=DUB/IUguYEc3aMI36+CFPWbuNDFQQ9+onqxPf+lpJQYK/Ufqpw3lmqP6
   2vWeSJ7L93+fa/GE/YNy1dWn0RsCLP9EAzosyK5Q8yV8U6TQuZyPU+7Xi
   4SKeEcoav3AvPP6gZ23aiFP4pVIvRhh8UNjzi21qSilqLyVu+p1fX8geo
   DWwOXveb8iy+9UjxxkTXEXoH+WCAk5OFslmZl0IYU3MMwURItulpE5oy+
   nH/iR4e61JRUehIMovU/sj5TmxURqhkrohu4C0Nqco5vNzzthE5NbQYWk
   vG7mU+NlwMhNF51ASSQeeBoG2sd+/XwTtVWRbqYamRyaIuLou/obX0UNq
   w==;
X-CSE-ConnectionGUID: nTVA5XUxRryeUASyFmwecA==
X-CSE-MsgGUID: ITHLXqdQTEqXfBdoPLUpSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53712743"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="53712743"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 14:35:44 -0700
X-CSE-ConnectionGUID: Xau4iJb0TXKkJE8C6BjtMw==
X-CSE-MsgGUID: xg13LOU8QwS+jLL70wr3CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="154803742"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jul 2025 14:35:43 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXo4K-00045v-2V;
	Fri, 04 Jul 2025 21:35:40 +0000
Date: Sat, 05 Jul 2025 05:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 990cd3e93a760fd9abed0594a06975dd5e543dc3
Message-ID: <202507050544.fvwRrgLA-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_143548_969693_5DE4E02F 
X-CRM114-Status: UNSURE (   5.48  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
branch HEAD: 990cd3e93a760fd9abed0594a06975dd5e543dc3  ARM: Switch to new sys-off handler API

elapsed time: 722m

configs tested: 100
configs skipped: 116

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
arc                               allnoconfig    clang-21
arc                   randconfig-001-20250705    clang-21
arc                   randconfig-002-20250705    clang-21
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20250704    gcc-8.5.0
arm                   randconfig-001-20250705    clang-21
arm                   randconfig-002-20250704    clang-21
arm                   randconfig-002-20250705    clang-21
arm                   randconfig-003-20250704    gcc-8.5.0
arm                   randconfig-003-20250705    clang-21
arm                   randconfig-004-20250704    gcc-13.4.0
arm                   randconfig-004-20250705    clang-21
arm64                             allnoconfig    clang-21
arm64                 randconfig-001-20250705    clang-21
arm64                 randconfig-002-20250705    clang-21
arm64                 randconfig-003-20250705    clang-21
arm64                 randconfig-004-20250705    clang-21
csky                              allnoconfig    clang-21
hexagon                           allnoconfig    clang-21
i386        buildonly-randconfig-001-20250705    gcc-12
i386        buildonly-randconfig-002-20250705    gcc-12
i386        buildonly-randconfig-003-20250705    gcc-12
i386        buildonly-randconfig-004-20250705    gcc-12
i386        buildonly-randconfig-005-20250705    gcc-12
i386        buildonly-randconfig-006-20250705    gcc-12
i386                  randconfig-001-20250705    gcc-12
i386                  randconfig-002-20250705    gcc-12
i386                  randconfig-003-20250705    gcc-12
i386                  randconfig-004-20250705    gcc-12
i386                  randconfig-005-20250705    gcc-12
i386                  randconfig-006-20250705    gcc-12
i386                  randconfig-007-20250705    gcc-12
loongarch                         allnoconfig    clang-21
m68k                              allnoconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         rt305x_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                       ebony_defconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250705    gcc-12
riscv                 randconfig-002-20250705    gcc-12
s390                              allnoconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250705    gcc-12
s390                  randconfig-002-20250705    gcc-12
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250705    gcc-12
sh                    randconfig-002-20250705    gcc-12
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250705    gcc-12
sparc                 randconfig-002-20250705    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250705    gcc-12
sparc64               randconfig-002-20250705    gcc-12
um                                allnoconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250705    gcc-12
um                    randconfig-002-20250705    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64      buildonly-randconfig-001-20250705    gcc-12
x86_64      buildonly-randconfig-002-20250705    gcc-12
x86_64      buildonly-randconfig-003-20250705    gcc-12
x86_64      buildonly-randconfig-004-20250705    gcc-12
x86_64      buildonly-randconfig-005-20250705    gcc-12
x86_64      buildonly-randconfig-006-20250705    gcc-12
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250705    clang-20
x86_64                randconfig-072-20250705    clang-20
x86_64                randconfig-073-20250705    clang-20
x86_64                randconfig-074-20250705    clang-20
x86_64                randconfig-075-20250705    clang-20
x86_64                randconfig-076-20250705    clang-20
x86_64                randconfig-077-20250705    clang-20
x86_64                randconfig-078-20250705    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250705    gcc-12
xtensa                randconfig-002-20250705    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

