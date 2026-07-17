Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC0FC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 03:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fC6NeqQgeLXwtiDe4nrjEbxysReahqrxr0oaAhfJ2qQ=; b=dAK/RPxCaJxePDJo/k25Ganpl5
	40kOqhhSX8NVzDFU4/w2gHHMXLTsfe9TvhkT237kzCl5fpIFpPpThVQOT+aHEFDEJ5cjxQSA8PRSA
	mgTpUKcTXjdvju5W5FN2wSmeKdCf//kZLyrRg3wXCefMEi+G0GoZoGqqHDH6rLpMDISAjshBkoZS4
	PILd9Mzd66Wyeyl0lEtyup+9+IPn99Wg+12VvFnN1WW1A1qCCeUKMIlFC1VB2Esl9eX7BG88egGWB
	24VvlthPfN4vDDm1WAEO+njsGe0CD2sonDj01naLD0kdup789SBM3OonLDvA0ajTI8zSS2Hnl3/67
	6HLuWimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZ0O-000000011Bj-3TXp;
	Fri, 17 Jul 2026 03:12:52 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZ0M-000000011BG-30r5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 03:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784257970; x=1815793970;
  h=date:from:to:cc:subject:message-id;
  bh=og2VjErPJ4FGxNPSKBDq78FiuY3D9RccSEbCoRsHtmI=;
  b=bmgHpXGkpSBKy3Jcf3+YmO2n/zpvGZjJz/FAC9/QjosezDII9yVSOIr1
   pxFjXcagnX9YEv8uq2Tkspkwj++SAGwIakWZClRvYdk8mI5JqpA4Ji9pk
   Le2KEAo3mngxKanwgtNeNTzQfO3IY1vgBA3SLq/2v2QRo1F7L3rDwvxVh
   eGGlEemhr4H58Xcg7C7o22NVDwvnKW80fDSND0LSg+5XIgboIQlW/70OJ
   0gySkbSlo3bBZQ6V5wYVTM/JnOptu7qL32pvt370L87qaFK4j7J2uYjvy
   V9LPk9+z3Nia/raToeF8lj//VvE3lBCyHYowNPYoweHxekbOHZUxKviXQ
   g==;
X-CSE-ConnectionGUID: 8DN0l/LWTJSPqy66fJjC2A==
X-CSE-MsgGUID: BApX0bLrR8mV1MIND9SDsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102351005"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="102351005"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 20:12:48 -0700
X-CSE-ConnectionGUID: ASV/aWuyQ0yfL9m5ayNSSA==
X-CSE-MsgGUID: zo39i64KQVaXFwSjtipBAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="252264712"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jul 2026 20:12:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkZ0G-00000000SO8-2SiG;
	Fri, 17 Jul 2026 03:12:44 +0000
Date: Fri, 17 Jul 2026 11:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 900d72f1052c1028d6e8c1f182529a403ba50a72
Message-ID: <202607171151.7HQB0NdL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_201250_826722_56A03545 
X-CRM114-Status: UNSURE (   5.19  )
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
branch HEAD: 900d72f1052c1028d6e8c1f182529a403ba50a72  soc: document merges

elapsed time: 1641m

configs tested: 41
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arc        randconfig-001-20260717    gcc-11.5.0
arc        randconfig-002-20260717    gcc-11.5.0
arm        randconfig-001-20260717    gcc-11.5.0
arm        randconfig-002-20260717    gcc-11.5.0
arm        randconfig-003-20260717    gcc-11.5.0
arm        randconfig-004-20260717    gcc-11.5.0
csky                  allmodconfig    gcc-16.1.0
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
m68k             mvme147_defconfig    gcc-16.1.0
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
parisc     randconfig-001-20260717    gcc-11.5.0
parisc     randconfig-002-20260717    gcc-11.5.0
powerpc    randconfig-001-20260717    gcc-11.5.0
powerpc    randconfig-002-20260717    gcc-11.5.0
powerpc64  randconfig-001-20260717    gcc-11.5.0
powerpc64  randconfig-002-20260717    gcc-11.5.0
sh                       defconfig    gcc-16.1.0
sparc      randconfig-001-20260717    gcc-8.5.0
sparc      randconfig-002-20260717    gcc-8.5.0
sparc64    randconfig-001-20260717    gcc-8.5.0
sparc64    randconfig-002-20260717    gcc-8.5.0
um         randconfig-001-20260717    gcc-8.5.0
um         randconfig-002-20260717    gcc-8.5.0
x86_64     randconfig-071-20260717    clang-22
x86_64     randconfig-072-20260717    clang-22
x86_64     randconfig-073-20260717    clang-22
x86_64     randconfig-074-20260717    clang-22
x86_64     randconfig-075-20260717    clang-22
x86_64     randconfig-076-20260717    clang-22
xtensa     randconfig-001-20260717    gcc-8.5.0
xtensa     randconfig-002-20260717    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

