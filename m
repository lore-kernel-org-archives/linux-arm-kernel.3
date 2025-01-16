Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB23C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SeAQnoOD31qaESps8bJFkY4L4pabIEG6GYqfL68BMSg=; b=QC0HZIp+FXxwT8mHahkWzGWFk9
	9hJhY4VYCfNb4wr2VFUDDlU3DFIkqWTX8qQ2ciuZt9BGbhQJeZRWAiPcgFuBfe1beVEzgWDA2txaq
	HPcz6+XfGfFGoM5/7xB7Es2yVBmNzhe9coBvHfTNqIERKCLof1HjawqqSNOhRe9HsZOKfn6dNlMph
	1H5XLM4ojCsOS8zyPv7U4aFrwNWvDfBYupbFEKHBC6NH6je06gITKvyUaGvA2JuBL8DvG2FRy5YJJ
	F7BUDPqH4+kDVJDDYXuzM+6jIfoFjdohszUkrw44yquYyUY+c33M+cYf2FwuWbYL/9PHCJpKgCd/a
	6xO7Bg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUWS-0000000FmnI-2osn;
	Thu, 16 Jan 2025 18:23:16 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUUv-0000000FmdA-0Ywy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737051701; x=1768587701;
  h=date:from:to:cc:subject:message-id;
  bh=QsaMUkrjDDYSbM23chQN/TuI48QUKnKwBFKULjywNRk=;
  b=K8k6i3K50ZZbVa1fp6q0XDY/mkk8KAPOwIs30TqwReY+3KhhTK0VUqkD
   3w1hRGiUi3FWlxklHOqo3M/usHZg6lUIWYDj3865DlnpfhLUzl8TzOJxU
   IAYyHYYgB4znhE5MI6TGZKTIgb04by1B45BUdugBcFTjYf3eQh1R2BKlg
   Pd/gtNomF/DRlmybZW2uD2pzvhRnmX82XOjpA82zNK8B/lITsNfQlMkqj
   9L+WINsbGYUa7uFgOi0zJ0wBhdLizb3qHXoKy+aLyGv0KhTvyjU5qVnmO
   RllkAXad2mJm3wQ6dmWMqmvLe4lMGeSgCUYDZ++MKmV8xyrtW5FFvPk8S
   g==;
X-CSE-ConnectionGUID: owtWj6AfRcCCI/scyNbgsg==
X-CSE-MsgGUID: SMFrp+kbQtOruWugUJC55g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48870452"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48870452"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 10:21:40 -0800
X-CSE-ConnectionGUID: D/40QAycSfCoow6Vd/YBww==
X-CSE-MsgGUID: 4rjgi6xDTyWyflzXd/kLMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106042690"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jan 2025 10:21:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYUUq-000SFd-2W;
	Thu, 16 Jan 2025 18:21:36 +0000
Date: Fri, 17 Jan 2025 02:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:drivers/reset] BUILD SUCCESS
 72bb8275a3b0784a817e0371c49c0110d68bb7fb
Message-ID: <202501170221.D2TZCSpM-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_102141_183390_D412DF5B 
X-CRM114-Status: UNSURE (   5.23  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git drivers/reset
branch HEAD: 72bb8275a3b0784a817e0371c49c0110d68bb7fb  reset: amlogic: aux: drop aux registration helper

elapsed time: 1444m

configs tested: 66
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250116    gcc-13.2.0
arc                  randconfig-002-20250116    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                  randconfig-001-20250116    gcc-14.2.0
arm                  randconfig-002-20250116    clang-15
arm                  randconfig-003-20250116    gcc-14.2.0
arm                  randconfig-004-20250116    gcc-14.2.0
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250116    gcc-14.2.0
arm64                randconfig-002-20250116    gcc-14.2.0
arm64                randconfig-003-20250116    clang-15
arm64                randconfig-004-20250116    clang-20
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250116    gcc-14.2.0
csky                 randconfig-002-20250116    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20250116    clang-20
hexagon              randconfig-002-20250116    clang-20
i386       buildonly-randconfig-001-20250116    clang-19
i386       buildonly-randconfig-002-20250116    clang-19
i386       buildonly-randconfig-003-20250116    clang-19
i386       buildonly-randconfig-004-20250116    clang-19
i386       buildonly-randconfig-005-20250116    clang-19
i386       buildonly-randconfig-006-20250116    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250116    gcc-14.2.0
loongarch            randconfig-002-20250116    gcc-14.2.0
nios2                randconfig-001-20250116    gcc-14.2.0
nios2                randconfig-002-20250116    gcc-14.2.0
parisc               randconfig-001-20250116    gcc-14.2.0
parisc               randconfig-002-20250116    gcc-14.2.0
powerpc              randconfig-001-20250116    clang-20
powerpc              randconfig-002-20250116    gcc-14.2.0
powerpc              randconfig-003-20250116    clang-20
powerpc64            randconfig-001-20250116    clang-19
powerpc64            randconfig-002-20250116    clang-20
powerpc64            randconfig-003-20250116    clang-15
riscv                randconfig-001-20250116    gcc-14.2.0
riscv                randconfig-002-20250116    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250116    gcc-14.2.0
s390                 randconfig-002-20250116    clang-18
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250116    gcc-14.2.0
sh                   randconfig-002-20250116    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250116    gcc-14.2.0
sparc                randconfig-002-20250116    gcc-14.2.0
sparc64              randconfig-001-20250116    gcc-14.2.0
sparc64              randconfig-002-20250116    gcc-14.2.0
um                   randconfig-001-20250116    clang-19
um                   randconfig-002-20250116    gcc-12
x86_64     buildonly-randconfig-001-20250116    gcc-12
x86_64     buildonly-randconfig-002-20250116    gcc-12
x86_64     buildonly-randconfig-003-20250116    gcc-12
x86_64     buildonly-randconfig-004-20250116    clang-19
x86_64     buildonly-randconfig-005-20250116    clang-19
x86_64     buildonly-randconfig-006-20250116    clang-19
xtensa               randconfig-001-20250116    gcc-14.2.0
xtensa               randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

