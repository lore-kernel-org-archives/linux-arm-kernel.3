Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8DCCD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 04:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0yvG2J44BNYTjgQcIG7SbnkHlT04sCT1xyyKTnI1n4=; b=TODgUiIdt77DlKkv6frRETuLxQ
	AAHA3QxhC4RKzWht588M2oIwKFDRgZkGfqHbu3wAZ8qkQrweM5eQbvsZ2/ZWZdAlBnctqyMFjXOJd
	HadOPPMwpSvS9uhodRQQ5wpNZ4pwYH2gYUuozU4Kn4cDKHE2/SEEyJSsu1LuBsSIZFA8Dgtid8Ja3
	OIWseRVA/KxhdgZueM9bmwJ9AAjvb7iLFKLs85Y3VDWhdVcs6V0ZTNLMPZcFjcCaaWMziSsO9dhAi
	KoH12ZXQZa2Y4vNevQk17YXijWyo+jAYrYDp+9aLvKNrdbRtCqaNKa9i2X/mAcH37+kflq5vVFNZU
	2p9gO9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWnhH-00000004hnI-2LDd;
	Tue, 09 Jun 2026 04:04:15 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWnhE-00000004hmy-2wm7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 04:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780977853; x=1812513853;
  h=date:from:to:cc:subject:message-id;
  bh=9LKUWE0+aV4s46eoymU6uGK0PpPYFA7kbye6U4sWNtw=;
  b=L5DVHSZa+QeTjYN14pkoKC2Tetebd4rCd+P71N4tf4aOzaLCH0rd+JYN
   S3mmbgysmsyEnk4PUsjdyUFu0qxFkZezOJJohxtqO/wjoQGKEfUKNhSRw
   IDMIwXNQPCSTpDbmEF5UwAUGfWaaUOa8QDFL/FQBCBEU3HfPv7QW81g7m
   w231OqL+bu2KNrASo54+hGtX4UWrxhykiaARfMYC4RxsZ79ff804iCdFV
   djARkqRoHshgadT59Fai8rDroSHZedE/akLcMaOG2b3NHng6osBm1US/w
   UmH0oWcJdTfkhP59LXgbgcTc4Q5lYSugHTF18dxZ3hVJICH7IqkRcEiZc
   w==;
X-CSE-ConnectionGUID: dZpS4izEQLCuOgkarKhPuA==
X-CSE-MsgGUID: um2akCkfQh+2XZjDd9EQSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99147815"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="99147815"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 21:04:12 -0700
X-CSE-ConnectionGUID: Ej5Mq9PzQ1q0VIeg/jyprA==
X-CSE-MsgGUID: SDKXZrDaRNOTsuiKib03pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="244603563"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Jun 2026 21:04:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWnh9-00000000JcE-2SN1;
	Tue, 09 Jun 2026 04:04:07 +0000
Date: Tue, 09 Jun 2026 12:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 6bd8fb9f1cd97f789db5f97cf569f7ed9d6575e0
Message-ID: <202606091204.QM7bbR1W-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_210412_840154_D4B20777 
X-CRM114-Status: UNSURE (   4.91  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: 6bd8fb9f1cd97f789db5f97cf569f7ed9d6575e0  Merge tag 'zynqmp-soc-for-7.2' of https://github.com/Xilinx/linux-xlnx into soc/drivers

elapsed time: 6892m

configs tested: 58
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-16.1.0
alpha         allyesconfig    gcc-16.1.0
arc           allmodconfig    gcc-16.1.0
arc            allnoconfig    gcc-16.1.0
arc           allyesconfig    gcc-16.1.0
arm            allnoconfig    clang-23
arm           allyesconfig    gcc-16.1.0
arm64         allmodconfig    clang-23
arm64          allnoconfig    gcc-16.1.0
csky          allmodconfig    gcc-16.1.0
csky           allnoconfig    gcc-16.1.0
hexagon       allmodconfig    clang-23
hexagon        allnoconfig    clang-23
i386          allmodconfig    gcc-14
i386           allnoconfig    gcc-14
i386          allyesconfig    gcc-14
loongarch     allmodconfig    clang-19
loongarch      allnoconfig    clang-20
m68k          allmodconfig    gcc-16.1.0
m68k           allnoconfig    gcc-16.1.0
m68k          allyesconfig    gcc-16.1.0
microblaze     allnoconfig    gcc-16.1.0
microblaze    allyesconfig    gcc-16.1.0
mips          allmodconfig    gcc-16.1.0
mips           allnoconfig    gcc-16.1.0
mips          allyesconfig    gcc-16.1.0
nios2         allmodconfig    gcc-11.5.0
nios2          allnoconfig    gcc-11.5.0
openrisc      allmodconfig    gcc-16.1.0
openrisc       allnoconfig    gcc-16.1.0
parisc        allmodconfig    gcc-16.1.0
parisc         allnoconfig    gcc-16.1.0
parisc        allyesconfig    gcc-16.1.0
powerpc       allmodconfig    gcc-16.1.0
powerpc        allnoconfig    gcc-16.1.0
riscv         allmodconfig    clang-23
riscv          allnoconfig    gcc-16.1.0
riscv         allyesconfig    clang-23
s390          allmodconfig    clang-23
s390           allnoconfig    clang-23
s390          allyesconfig    gcc-16.1.0
sh            allmodconfig    gcc-16.1.0
sh             allnoconfig    gcc-16.1.0
sh            allyesconfig    gcc-16.1.0
sparc          allnoconfig    gcc-16.1.0
sparc64       allmodconfig    clang-20
um            allmodconfig    clang-23
um             allnoconfig    clang-16
um            allyesconfig    gcc-14
x86_64        allmodconfig    clang-22
x86_64         allnoconfig    clang-22
x86_64        allyesconfig    clang-22
x86_64        rhel-9.4-bpf    gcc-14
x86_64      rhel-9.4-kunit    gcc-14
x86_64        rhel-9.4-ltp    gcc-14
x86_64       rhel-9.4-rust    clang-22
xtensa         allnoconfig    gcc-16.1.0
xtensa        allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

