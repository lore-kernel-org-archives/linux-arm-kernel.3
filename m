Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA205C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 23:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jZElpx6GgvMw2kmRMPfNoMe75eoYjgqVySqBj1Y6xuI=; b=mCEomPcke+c4v2oPe2cmhYAslL
	Mx4hgIjWkxt7ENPvoygjwI/sfpfIsDznkFmHLXIsGwC2d0VMrMrgqNND6kxVarshdOFm6dfjdRtyJ
	UpvSOztbdHiOo2U0riZV65+oPfrvQfS/2CZbfVlGn5b0200r9sO/Zb4m9+0KPTzxcPo2f1r1IVHjJ
	c5V45P+/ybqhS6+YU7SXOAv6Lyb9iEtwZP/E4imJr8NRxqKbl1Sxa9oqP/zpn7CBRrScBnq33XXhF
	8Jq5OzpTTfH0dfEaNyjs/8vO36TubCkGfDPaz571qH6Vr/jfDgTmPhWfBZ80rc6bA7+AfArilIzQO
	DoXhIG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1u1w-0000000G4Ve-0GrJ;
	Wed, 02 Sep 2026 23:06:08 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1u1t-0000000G4V8-0I5H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 23:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788390365; x=1819926365;
  h=date:from:to:cc:subject:message-id;
  bh=4/vQmk96zNU9catZULN1HNNntfDw4TnF+Rv2CN+ZcBE=;
  b=lOG5rmVsSYx1u6+uA+xdVf/6eqqW8kHtGYzRRLQB2S7BxrndoJwWaXjM
   CJDlQU9WHbNDhl9bcThmdOngR1EbCNb1r85Pamd0QSjijyiOOi8xR8Vm6
   9xpiNhw2KCj4e/rrXMe4FL5hnKReMOY7AJawO1vrqGF+IHi/lNkRx/MaF
   HWUgLiPu4dYeIiANqDrbkeXkDKEcNNFVWdqc8cr/MNVwLOvJZI0eysI/+
   X3iZiivaeGyfTNGzckkBWHwynPohGjnuTQiSgqWYMS2BtRC2v6PX7Ftwv
   vQa3IHpsJBiO6pl3gQmNoz45viHc1RFSjjFBQITc1NWhTT5ZPMaBhqavS
   Q==;
X-CSE-ConnectionGUID: E0j6fs11QeinavaNGp7tHg==
X-CSE-MsgGUID: OyvvoX2bSt2MdoCTl3xSdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88981963"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88981963"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:06:04 -0700
X-CSE-ConnectionGUID: idyTM+LiRWylQ8nlTgNflQ==
X-CSE-MsgGUID: zIj1LEVpSyipEgUXDjVoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266950791"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2026 16:06:02 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1u1o-000000003Qc-0Bio;
	Wed, 02 Sep 2026 23:06:00 +0000
Date: Thu, 03 Sep 2026 07:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-dts-ab8500-regulators] BUILD
 SUCCESS fa0d6345486c682bc5914524e78320a54b63eacf
Message-ID: <202609030700.LkCl4jOp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_160605_158993_A9E8E295 
X-CRM114-Status: UNSURE (   6.15  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-dts-ab8500-regulators
branch HEAD: fa0d6345486c682bc5914524e78320a54b63eacf  ARM: dts: ux500: Fix up regulator assignments

elapsed time: 1329m

configs tested: 65
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
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
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
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

