Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48606D116E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 02:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MNO4Icakf6tEDx0emK8IchUo7T92Khh0x6anV5rFYng=; b=hT8tYlGU5KrnWoVMfH1R302KnF
	93p1HVwrybr6wwbt6S9oTp2fUVwcaAULQAJ7Ye8BAAm9FZ/pz9/6wSOngbSnaLTDDH+TJmOZS4SA4
	7qiKwcAuiSGHfOk1miBWccJ2M4ZdfJWZWl/mX/z2Vplag8cZ4QKEoxEicPnj0AN+/p0SXl+3ZpxlB
	vZ4pgrBOmJ7P1hfRVaG0QwLuumKZc4l4QDFu/3sBJrvHE63MbB/lgTKntPBp0Hm0jFSuknPIRv2S+
	DXb9PGpIVkyFnymEVAy0DpuQlGUvA6n7Ih90P445f83W+DTFobbwmplCJh7HYrFTpAUFYyRjSQrK1
	Y/UsLPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORP6-0000000Fsa9-311e;
	Thu, 27 Nov 2025 02:06:40 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORP3-0000000FsZl-4AJn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 02:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764209198; x=1795745198;
  h=date:from:to:cc:subject:message-id;
  bh=cN/aLTbH2Ln00CJ76UDxQjXK72NXryEztGjhSDkb5Co=;
  b=X7PGC0IX/A3SAlGRsNJA2FLxGEiHuHBJJefvLMETsfnCsR/Nv7UbRmVH
   5wllXtS7WNVG2xurJnygPuzluowB5sFedhJipIZWFSaEF8QRsQdNGtH+w
   qj+u4226OdevzGgV3cRb3OjDdIB0s7lsF5iOJheDR0wetWs4tnAZXDMKr
   UdeK8Uuj8AnLdLEOBtyt/CZXAWyfLbG8nxlFZ/XTPgn4KX0xyLACgmNpv
   mttIc17thWxg8rOJ3JS0Hb5YdfdVzXTAzKku4cJQlm89IzF9ODPdvjiil
   F3gNi3mqrb9Ez7f4CQ0yDb0z0g3hk2EkrH4INA6G7qWVJaSEpqb3jcXeN
   g==;
X-CSE-ConnectionGUID: a1fz3rmiSNONvw0cQBuepw==
X-CSE-MsgGUID: vxfa95fITAOdyY9ZUwW7eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65439884"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65439884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:06:36 -0800
X-CSE-ConnectionGUID: jzaFxLUXT/qhuVehEVoMZg==
X-CSE-MsgGUID: Z+WmuzgJRX+PgAxWlTHu+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193909197"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2025 18:06:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOROz-000000003ZF-2W8K;
	Thu, 27 Nov 2025 02:06:33 +0000
Date: Thu, 27 Nov 2025 10:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:rockchip/dt64] BUILD SUCCESS
 78f316e90906d54c8aa6029e5c19ae83e420e56a
Message-ID: <202511271047.0LXA2pk9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_180638_043173_6CD7720B 
X-CRM114-Status: UNSURE (   6.27  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git rockchip/dt64
branch HEAD: 78f316e90906d54c8aa6029e5c19ae83e420e56a  arm64: dts: rockchip: add vicap node to rk356x

elapsed time: 15916m

configs tested: 69
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-002-20251117    gcc-9.5.0
arm                     allnoconfig    clang-22
arm                    allyesconfig    gcc-15.1.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

