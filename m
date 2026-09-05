Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6257C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 04:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5CuJzWQmFl9t/FIztUKFsSuahyy58yVQ2VfMTAoW7ks=; b=HXp72RDWpgpNYTJQyHscD4k3LP
	z0CZKUyNE+1IVVhaRo7GpLFH3r/5YEEVuTRexyOwm6xbUUDoSXtliSfRWhkRBqM3CoOf99HYDJjX5
	FOo1oeGopTXOfjD/SfBpQ0DsAf2cRE+Zl/sXSlGw21abukrq50KsFpvyQlV7Ht1PDC38yXd4bcCW1
	sdgdKU7ov1LSVDoE4cRb98HjrcMJTgJQAAa59jeJrfIB+LJ0yWt0JRwyNcopb9VttYODGxfAfqbBO
	fypUcWhxtsS0UWhP5PfjL/uVmAwxbMRQleijBj5Sffbds1tGswA7iZHnZozQGMvtjXNFEvI/eGYzx
	AB4k3jEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gox-00000003cvF-23Ah;
	Sat, 05 Sep 2026 03:11:59 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gov-00000003cuw-1RDw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 03:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788577918; x=1820113918;
  h=date:from:to:cc:subject:message-id;
  bh=Uuu3YTy/NIaOKn7gyNGksLecRLL7bo2jh1ByvuYXMUY=;
  b=ACakdFkxPBF48srR1ZO8BQ3Mj4hBITmM5inR0zM7gUr3BZyre40IcWJ8
   uwxwIXXBc4FyfY95HwmUoCJz0w2AH9OFD1GCckacJVUb2Dz1Ylwq5NRgI
   2j6HqQuUvzJ+JitY3eId7h3kWEFCtKjFYDuxfUidwRF77Wrki0YzPrISM
   aTRB9/bLLMvpy0IAgm9jp5vtOzW9BnROx0P9sANMkesO7o+YqrGrqWApp
   /KHwbT9XDAXjU2inxWq6HH0m8KNIhPxsBhLPU49/6XAw8qCTAexbouIH3
   JPIUSMDsk5ghWmmOVxQLRKJKutKTuLPYrq/zj8+mGa2lcIGjos/mkZkQf
   A==;
X-CSE-ConnectionGUID: ZU447D3nTd+yo3p9BGHmQQ==
X-CSE-MsgGUID: 0+Hv7LdrRBmjR/uqch6xUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="114621892"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="114621892"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 20:11:56 -0700
X-CSE-ConnectionGUID: A/O+kFrfQkW5RqP3tMhysA==
X-CSE-MsgGUID: 1KMh9YkJRXmv8kc11OudIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="295071722"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Sep 2026 20:11:54 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2gop-00000000Aeb-1oma;
	Sat, 05 Sep 2026 03:11:51 +0000
Date: Sat, 05 Sep 2026 11:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-msp-fixes] BUILD SUCCESS
 2f95df02f538f1fca7974cb317d05bea56b96a82
Message-ID: <202609051127.x0wuHpam-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_201157_419920_D23676F7 
X-CRM114-Status: UNSURE (   4.92  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-msp-fixes
branch HEAD: 2f95df02f538f1fca7974cb317d05bea56b96a82  ASoC: ux500: Program the MSP FIFO watermarks

elapsed time: 4028m

configs tested: 73
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-19
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

