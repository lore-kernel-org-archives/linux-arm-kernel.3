Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E99AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8z6+9aYLHZYdfCJA23t+r1RSEBj9B4ddSmlqXz5D9eE=; b=ii5h7sY01/BdHmwTPGkjBTPi8F
	1S/1MBv6c9I7JdwRXI8PVU2tiu8e3dSdMUX+5vicSCFgpBJ4PvYGAUZaYe4p1+v85xWZ16g5ZtxX6
	JXJvxH0r2REKDyHyGtyr4/jtqGrI53GexA32SlMSIW1j9fhpv87/te09WZ5DUTqR3h94hFWDiOLTx
	9rkUDS+DwTRU72IWcn4FXsiqMYAFwxp4MPKJZpOtsqC7CgH1kUK3IdyLhAf+sOmBTEv8qnSmJ4JFk
	UQE2tyDXiH9oy0mCQ36Q89I3kCDktYaE7sxz3Q/oqIQDp5zi7qHUS1uT0+ND3uU52jtljIxeaZDkE
	vYdkw6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woY0o-00000004I4s-0CsF;
	Tue, 28 Jul 2026 02:57:46 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woY0l-00000004I4Z-2rOB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785207464; x=1816743464;
  h=date:from:to:cc:subject:message-id;
  bh=D7mILVUwrcsn4nC0TdJyYh4cssIOmOYUVRi3/KX4ubA=;
  b=MECe0obkdtxn5ZfACDgl/vFUM1Vq9DOZvkrl+0B5RtbnePW56+2NE7B7
   mva4wh901pGuZ76tpD6/0nw7ixZb/ocKgVaVvDyNAQlMmEiaLlC3fYOjZ
   jez21vqUxwXdCmh7zvDZlGfH2JzlIBseOo7BNmIUeeUls7jyYM0NBStQG
   THzRi6aMin4Bg5EzevETnSdGVDmea1j9uyUIE64HqN7JKm6nmU+CXTlOa
   Ay2SV8HFjEdU9UB5AbyvZcaUk97bNC2mdihyxpougdA6+z6l0OwHab1Pi
   0ggSWVXZZa3QAw+/FzRPe3bbbFEw/H5B8OsM1RsI3GOEmzEwvOyhMOsoX
   A==;
X-CSE-ConnectionGUID: lQe2o4rWROOKYgENp9QFbw==
X-CSE-MsgGUID: WS6KhyTYTASUF2ptkwF6Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103326409"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="103326409"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 19:57:42 -0700
X-CSE-ConnectionGUID: li0n/K4TR7KHRAg5YSU1xQ==
X-CSE-MsgGUID: MN+OHByrTh2LCRxAGoe4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="259638775"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Jul 2026 19:57:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woY0g-00000000dqV-1XAp;
	Tue, 28 Jul 2026 02:57:38 +0000
Date: Tue, 28 Jul 2026 10:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 1df696a7d18d5a14e6482a8dd3ca6e588735ac65
Message-ID: <202607281000.LX9VH1I9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_195743_761908_5DFA7FF8 
X-CRM114-Status: UNSURE (   5.36  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: 1df696a7d18d5a14e6482a8dd3ca6e588735ac65  Merge tag 'arm-soc/for-7.2/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm/fixes

elapsed time: 3500m

configs tested: 46
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arm            imx_v6_v7_defconfig    clang-24
csky                  allmodconfig    gcc-16.1.0
i386                  allmodconfig    gcc-14
i386                randconfig-011    gcc-14
i386       randconfig-011-20260728    gcc-14
i386       randconfig-012-20260728    gcc-14
i386       randconfig-013-20260728    gcc-14
i386       randconfig-014-20260728    gcc-14
i386       randconfig-015-20260728    gcc-14
i386       randconfig-016-20260728    gcc-14
i386       randconfig-017-20260728    gcc-14
loongarch                defconfig    clang-24
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
parisc     randconfig-001-20260728    gcc-10.5.0
parisc     randconfig-002-20260728    gcc-10.5.0
powerpc    randconfig-001-20260728    gcc-10.5.0
powerpc    randconfig-002-20260728    gcc-10.5.0
powerpc64  randconfig-001-20260728    gcc-10.5.0
powerpc64  randconfig-002-20260728    gcc-10.5.0
riscv      randconfig-001-20260728    gcc-14.3.0
riscv      randconfig-002-20260728    gcc-14.3.0
s390       randconfig-001-20260728    gcc-14.3.0
s390       randconfig-002-20260728    gcc-14.3.0
sh                       defconfig    gcc-16.1.0
sh         randconfig-001-20260728    gcc-14.3.0
sh         randconfig-002-20260728    gcc-14.3.0
sparc               randconfig-001    gcc-11.5.0
sparc      randconfig-001-20260728    gcc-11.5.0
sparc      randconfig-002-20260728    gcc-11.5.0
sparc64    randconfig-001-20260728    gcc-11.5.0
sparc64    randconfig-002-20260728    gcc-11.5.0
um         randconfig-001-20260728    gcc-11.5.0
um         randconfig-002-20260728    gcc-11.5.0
x86_64                       kexec    clang-22
x86_64                rhel-9.4-bpf    gcc-14
xtensa     randconfig-001-20260728    gcc-11.5.0
xtensa     randconfig-002-20260728    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

