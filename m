Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BF4C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 04:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3qdG3lxwFhp3pKwjo1odkUVfdElGO5EO8aq07GUgj3k=; b=4ihEISTwiVfUrvZF6e5e4dYeQ/
	0I0gPyN19hs06E8hVHsxywNSiHOLJBCgdxKGZpjp2wK3BWR+SxZIkdk+WniowPE9ArcD9VQMGmsS0
	kvw40UgDmZcsfoa53ahKWh9HtY6+Xg7TdKxpoHknXvDK18vaItmkr0Re2j9rSvH/SdAlEGFdZsYj5
	p7TwklubjbKKKBNVTMXciJQz7dNy7WKb0i9ZvdlGXjI44J6dOCebsG/1N99nm/5WYu4+/4up5PLW2
	OHptUA50aFSsmFaIkCMZxHlX51W3+IPTrwwyzbdwNSXmJgg+PadpQvtDB6Mrd6EMhg4/dbDPNWjP1
	bhSrfG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yhy-0000000GJWx-3MeV;
	Thu, 03 Sep 2026 04:05:50 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yhw-0000000GJWG-2nzK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 04:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788408349; x=1819944349;
  h=date:from:to:cc:subject:message-id;
  bh=D5ckpGIgKgaVOCLqRW8u05g9fbF+iHUgIp88KnD09z0=;
  b=eIEELzKwwc27hwzRUQi0pF9W4ziIJ8G5L3EoGB14lsWZ07IKXuknf/KN
   x6iea9tjCIUK8LtDFcqb9WgpHQkFIKCwQHuEKGzti+LKPKWDlu76wJUvb
   VHer7EV0eDr/Pv/mUjO3e4fnxRWd/1L2E/yCNIZ36cGsLAQGyRh5EhHav
   vYa0vvJdqSprbNSg+GCPypJ21xPbhFMn/BjRTMiqD2A5oNg1nNat6V40N
   hNrANbl9+WCQpie1K14n+uZ0N3n/rb/1ZRcM799GPbh5ZMzRgXxjW0Wo8
   lh25OwHsExPcNbuBNn0ZvEYIqjFIotieOY18K9FUbWDpLYS/k7cjH+ruM
   Q==;
X-CSE-ConnectionGUID: cZqFT2kgTAqEwoxJVmsVZg==
X-CSE-MsgGUID: 8LUlJFzVRJGybLw/LT1GTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92696866"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92696866"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:05:48 -0700
X-CSE-ConnectionGUID: Pk3WebMjRSOpZ2snoxwZVQ==
X-CSE-MsgGUID: e69ut7DRRhW7fIRdWWqxRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269055817"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Sep 2026 21:05:47 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1yhs-000000003ye-0ACh;
	Thu, 03 Sep 2026 04:05:44 +0000
Date: Thu, 03 Sep 2026 12:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-dts-for-soc] BUILD SUCCESS
 07f7a23377f1e6c74fba49c5ed7924e78517e666
Message-ID: <202609031221.WAqoiaRJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_210548_721174_6B674FE1 
X-CRM114-Status: UNSURE (   6.04  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-dts-for-soc
branch HEAD: 07f7a23377f1e6c74fba49c5ed7924e78517e666  ARM: dts: ux500: Add the Imagis ISA to Gavini DTS

elapsed time: 2587m

configs tested: 74
configs skipped: 42

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                    allnoconfig    gcc-16.1.0
alpha                   allyesconfig    gcc-16.1.0
alpha       randconfig-r054-20260902    clang-22
arc                     allmodconfig    clang-24
arc                      allnoconfig    gcc-16.1.0
arc                     allyesconfig    clang-24
arc         randconfig-r122-20260901    clang-24
arm                      allnoconfig    gcc-16.1.0
arm                     allyesconfig    clang-24
arm         randconfig-r052-20260902    clang-22
arm         randconfig-r112-20260901    clang-24
arm64                   allmodconfig    clang-24
arm64                    allnoconfig    gcc-16.1.0
csky                    allmodconfig    gcc-16.1.0
csky                     allnoconfig    gcc-16.1.0
csky        randconfig-r061-20260902    clang-22
csky        randconfig-r062-20260902    clang-22
hexagon                 allmodconfig    gcc-16.1.0
hexagon                  allnoconfig    gcc-16.1.0
hexagon     randconfig-r071-20260902    clang-24
i386                    allmodconfig    clang-22
i386                     allnoconfig    gcc-16.1.0
i386                    allyesconfig    clang-22
i386         randconfig-051-20260902    clang-22
i386         randconfig-052-20260902    clang-22
i386         randconfig-053-20260902    clang-22
i386         randconfig-054-20260902    clang-22
i386        randconfig-r063-20260902    clang-22
loongarch               allmodconfig    clang-24
loongarch                allnoconfig    gcc-16.1.0
m68k                    allmodconfig    gcc-16.1.0
m68k                     allnoconfig    gcc-16.1.0
m68k                    allyesconfig    clang-24
microblaze               allnoconfig    gcc-16.1.0
microblaze              allyesconfig    gcc-16.1.0
microblaze  randconfig-r113-20260901    clang-24
mips                    allmodconfig    gcc-16.1.0
mips                     allnoconfig    gcc-16.1.0
mips                    allyesconfig    gcc-16.1.0
nios2                   allmodconfig    clang-20
nios2                    allnoconfig    clang-24
nios2       randconfig-r111-20260901    clang-24
nios2       randconfig-r123-20260901    clang-24
openrisc                allmodconfig    clang-20
openrisc                 allnoconfig    clang-24
openrisc    randconfig-r053-20260902    clang-22
openrisc    randconfig-r064-20260902    clang-22
parisc                  allmodconfig    gcc-16.1.0
parisc                   allnoconfig    clang-24
parisc                  allyesconfig    clang-17
powerpc                 allmodconfig    gcc-16.1.0
powerpc                  allnoconfig    clang-24
riscv                   allmodconfig    clang-24
riscv                    allnoconfig    clang-24
riscv                   allyesconfig    clang-24
riscv       randconfig-r051-20260902    clang-22
s390                    allmodconfig    clang-17
s390                     allnoconfig    clang-24
s390                    allyesconfig    gcc-16.1.0
sh                      allmodconfig    gcc-16.1.0
sh                       allnoconfig    clang-24
sh                      allyesconfig    clang-17
sh          randconfig-r121-20260901    clang-24
sparc                    allnoconfig    clang-24
sparc64                 allmodconfig    clang-20
um                      allmodconfig    clang-17
um                       allnoconfig    clang-24
um                      allyesconfig    gcc-16.1.0
x86_64                  allmodconfig    clang-22
x86_64                   allnoconfig    clang-24
x86_64                  allyesconfig    clang-22
x86_64                 rhel-9.4-rust    clang-22
xtensa                   allnoconfig    clang-24
xtensa                  allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

