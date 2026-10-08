Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6624ACA6009
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 00:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u/nHMJlPsmdZDQ/93XLjeq4sGmXa7n37+tVjJEM3cwQ=; b=isaqIRBhavFg2bOoKRq6zvvlX0
	l88F0jrkZbUh6g4ZNMDjnpBFs7vYUTvzwN4RlT0+1L4zm6DNqQE1nH25VW66TNZIJc6DOTHHuuV52
	LLwA8wAIRs3dD9K9f6nsSHnrOKLdFZwxqJakeZ7bJmHY7vsLOBkgIyMUTdw2iXfq+w0a5t8wHe81J
	QySUApiR4uIz0ynWK91fSA3JYxiSK/uYNBVvQSAw/SSnxRXDvV51AV1wLCkOjWBqUZYoj5gZHPXFy
	R0htjk3aMCEMdNgVmt1tDqve2RbXoMRSQPClcfmma0Kn5eb6Y1u0NAWlwlz5fs5UzzoS48LlP2LvN
	oOg7dy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbbw-00000003J5V-2Bwm;
	Thu, 08 Oct 2026 00:03:48 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbbu-00000003J5A-1PzP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 00:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791417827; x=1822953827;
  h=date:from:to:cc:subject:message-id;
  bh=HkZpuM7oypS/YWSH4IJt1HZoyY3XlYwanDqOI4Pi1rw=;
  b=Wqnq7pmH5I1H5MchadtcUBJwnIhNndl5GfMShJD2X+aF7HMIwzjNYEpp
   h3MtA5fyHak9b8BGkGl2ysD/Urs6SuMqfMixrtoAXwRqDtdsPch8Wj5zE
   9dSKEs1Y4iHKHV3WSvz1FI20ZB8tujLVh/DqcfAz4PKOLQ3ujFISzFPd+
   j1n4s3WEfDgxje6bVzAIaqTYR8WbyP9b2alO2tSPRcW7rlFIztTgk/Pxs
   YXLi6eAMnHUHUltNqtMzV8ufHoKCW2706HMOhtInh/jO2pxwODwzdWJt4
   D7QXI7YJBX0pJSSYOmDYcxMr0WQEIxLNNaonTWqNs9rMaf3Y3Z4wD6PEP
   A==;
X-CSE-ConnectionGUID: co+GZ6MsRDqD8gjhWJfwtA==
X-CSE-MsgGUID: 89bafI/MRh+aHJ/UmasD1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="198574"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="198574"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 17:03:41 -0700
X-CSE-ConnectionGUID: rxdNG5mjQkmuLHVYXVcL/g==
X-CSE-MsgGUID: AiDfmzbiThimYXaIqeVbcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="206881"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 17:03:39 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEbbk-000000003iS-3EjM;
	Thu, 08 Oct 2026 00:03:36 +0000
Date: Thu, 08 Oct 2026 08:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:dma40-fixes] BUILD SUCCESS
 e405319f7b13981672262a4c5b43406325012240
Message-ID: <202610080801.tuUuZEyr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_170346_427619_6558E5CD 
X-CRM114-Status: UNSURE (   5.56  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/dma40-fixes
branch HEAD: e405319f7b13981672262a4c5b43406325012240  dmaengine: ste_dma40: Search all blocks for fixed logical channels

elapsed time: 2097m

configs tested: 295
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2103-20261006    gcc-8.5.0  cocci
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261007    clang-24
arc                   randconfig-1001-20261007    clang-24
arc                  randconfig-r2107-20261006    gcc-8.5.0  cocci
arc                  randconfig-r2303-20261006    clang-24   sparse
arm                                allnoconfig    gcc-16.1.0
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             qcom_defconfig    clang-24
arm                   randconfig-1000-20261007    clang-24
arm                   randconfig-1001-20261007    clang-24
arm                   randconfig-1002-20261007    clang-24
arm                   randconfig-1003-20261007    clang-24
arm                         shmobile_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261007    gcc-13.4.0
arm64                 randconfig-1001-20261007    gcc-13.4.0
arm64                 randconfig-1002-20261007    gcc-13.4.0
arm64                 randconfig-1003-20261007    gcc-13.4.0
arm64                randconfig-r2308-20261006    gcc-14.3.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261007    gcc-13.4.0
csky                  randconfig-1001-20261007    gcc-13.4.0
csky                 randconfig-r2101-20261006    gcc-12.5.0 cocci
csky                 randconfig-r2106-20261006    gcc-8.5.0  cocci
csky                 randconfig-r2201-20261006    gcc-9.5.0  smatch
csky                 randconfig-r2301-20261006    gcc-14.3.0 sparse
csky                 randconfig-r2302-20261006    gcc-16.1.0 sparse
csky                 randconfig-r2304-20261006    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261007    gcc-12.5.0
hexagon               randconfig-1001-20261007    gcc-12.5.0
hexagon              randconfig-r2100-20261006    gcc-8.5.0  cocci
hexagon              randconfig-r2103-20261006    clang-24   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261007    gcc-14
i386        buildonly-randconfig-1001-20261007    gcc-14
i386        buildonly-randconfig-1002-20261007    gcc-14
i386        buildonly-randconfig-1003-20261007    gcc-14
i386        buildonly-randconfig-1004-20261007    gcc-14
i386        buildonly-randconfig-1005-20261007    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261007    clang-22
i386                  randconfig-1001-20261007    clang-22
i386                  randconfig-1002-20261007    clang-22
i386                  randconfig-1003-20261007    clang-22
i386                  randconfig-1004-20261007    clang-22
i386                  randconfig-1005-20261007    clang-22
i386                  randconfig-1006-20261007    clang-22
i386                  randconfig-1007-20261007    gcc-14
i386                  randconfig-1008-20261007    gcc-14
i386                  randconfig-1009-20261007    gcc-14
i386                  randconfig-1010-20261007    gcc-14
i386                  randconfig-1011-20261007    gcc-14
i386                  randconfig-1012-20261007    gcc-14
i386                  randconfig-1013-20261007    gcc-14
i386                  randconfig-2100-20261006    clang-22   cocci
i386                  randconfig-2101-20261006    clang-22   cocci
i386                  randconfig-2102-20261006    clang-22   cocci
i386                  randconfig-2103-20261006    clang-22   cocci
i386                  randconfig-2103-20261006    gcc-14     cocci
i386                  randconfig-2200-20261006    gcc-13     smatch
i386                  randconfig-2300-20261006    clang-22   sparse
i386                  randconfig-2300-20261006    gcc-14     sparse
i386                  randconfig-2301-20261006    gcc-14     sparse
i386                  randconfig-2302-20261006    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261007    gcc-12.5.0
loongarch             randconfig-1001-20261007    gcc-12.5.0
loongarch            randconfig-r2101-20261006    gcc-8.5.0  cocci
loongarch            randconfig-r2104-20261006    gcc-8.5.0  cocci
loongarch            randconfig-r2106-20261006    gcc-16.1.0 cocci
loongarch            randconfig-r2200-20261006    clang-18   smatch
loongarch            randconfig-r2201-20261006    gcc-13.4.0 smatch
loongarch            randconfig-r2305-20261006    clang-24   sparse
loongarch            randconfig-r2307-20261006    gcc-14.3.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                 randconfig-r2106-20261006    gcc-8.5.0  cocci
m68k                 randconfig-r2107-20261006    gcc-8.5.0  cocci
m68k                 randconfig-r2202-20261006    gcc-8.5.0  smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261006    clang-24   cocci
microblaze           randconfig-r2304-20261006    clang-24   sparse
microblaze           randconfig-r2305-20261006    clang-24   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2105-20261006    clang-17   cocci
mips                 randconfig-r2302-20261006    clang-24   sparse
mips                 randconfig-r2303-20261006    gcc-8.5.0  sparse
mips                 randconfig-r2308-20261006    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261007    gcc-12.5.0
nios2                 randconfig-1001-20261007    gcc-12.5.0
nios2                randconfig-r2107-20261006    gcc-11.5.0 cocci
nios2                randconfig-r2304-20261006    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2200-20261006    gcc-13.4.0 smatch
openrisc             randconfig-r2202-20261006    gcc-16.1.0 smatch
openrisc             randconfig-r2303-20261006    gcc-12.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261007    gcc-15.2.0
parisc                randconfig-1001-20261007    gcc-15.2.0
parisc               randconfig-r2100-20261006    gcc-8.5.0  cocci
parisc               randconfig-r2101-20261006    gcc-8.5.0  cocci
parisc               randconfig-r2103-20261006    gcc-8.5.0  cocci
parisc               randconfig-r2305-20261006    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                         fsp2_defconfig    clang-24
powerpc                  mpc832x_rdb_defconfig    clang-24
powerpc               randconfig-1000-20261007    gcc-15.2.0
powerpc               randconfig-1001-20261007    gcc-15.2.0
powerpc              randconfig-r2100-20261006    clang-24   cocci
powerpc              randconfig-r2104-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2105-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2200-20261006    gcc-9.5.0  smatch
powerpc                      tqm8555_defconfig    clang-24
powerpc64             randconfig-1000-20261007    gcc-15.2.0
powerpc64             randconfig-1001-20261007    gcc-15.2.0
powerpc64            randconfig-r2102-20261006    clang-24   cocci
powerpc64            randconfig-r2104-20261006    gcc-8.5.0  cocci
powerpc64            randconfig-r2303-20261006    clang-24   sparse
powerpc64            randconfig-r2307-20261006    clang-24   sparse
powerpc64            randconfig-r2309-20261006    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261007    clang-24
riscv                 randconfig-1001-20261007    clang-24
riscv                 randconfig-2000-20261006    gcc-16.1.0
riscv                 randconfig-2001-20261006    gcc-16.1.0
riscv                randconfig-r2102-20261006    clang-24   cocci
riscv                randconfig-r2306-20261006    gcc-14.3.0 sparse
riscv                randconfig-r2308-20261006    gcc-14.3.0 sparse
s390                              allmodconfig    clang-17
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261007    clang-24
s390                  randconfig-1001-20261007    clang-24
s390                  randconfig-2000-20261006    gcc-16.1.0
s390                  randconfig-2001-20261006    gcc-16.1.0
s390                 randconfig-r2102-20261006    gcc-8.5.0  cocci
s390                 randconfig-r2309-20261006    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261007    clang-24
sh                    randconfig-1001-20261007    clang-24
sh                    randconfig-2000-20261006    gcc-16.1.0
sh                    randconfig-2001-20261006    gcc-16.1.0
sh                   randconfig-r2200-20261006    gcc-16.1.0 smatch
sh                   randconfig-r2306-20261006    clang-24   sparse
sh                            se7751_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261007    clang-17
sparc                 randconfig-1001-20261007    clang-17
sparc                 randconfig-2000-20261006    gcc-15.2.0
sparc                 randconfig-2000-20261007    gcc-16.1.0
sparc                 randconfig-2001-20261006    gcc-16.1.0
sparc                 randconfig-2001-20261007    gcc-8.5.0
sparc                randconfig-r2104-20261006    gcc-11.5.0 cocci
sparc                randconfig-r2107-20261006    gcc-16.1.0 cocci
sparc                randconfig-r2300-20261006    clang-24   sparse
sparc                randconfig-r2302-20261006    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261006    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261007    clang-17
sparc64               randconfig-1001-20261007    clang-17
sparc64               randconfig-2000-20261006    clang-20
sparc64               randconfig-2000-20261007    gcc-11.5.0
sparc64               randconfig-2001-20261006    gcc-8.5.0
sparc64               randconfig-2001-20261007    gcc-8.5.0
sparc64              randconfig-r2100-20261006    clang-22   cocci
sparc64              randconfig-r2103-20261006    clang-24   cocci
sparc64              randconfig-r2300-20261006    clang-24   sparse
sparc64              randconfig-r2301-20261006    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261007    clang-17
um                    randconfig-1001-20261007    clang-17
um                    randconfig-2000-20261006    gcc-14
um                    randconfig-2000-20261007    gcc-14
um                    randconfig-2001-20261006    clang-24
um                    randconfig-2001-20261007    clang-24
um                   randconfig-r2105-20261006    gcc-8.5.0  cocci
um                   randconfig-r2300-20261006    gcc-14     sparse
um                   randconfig-r2300-20261006    gcc-8.5.0  sparse
um                   randconfig-r2301-20261006    clang-24   sparse
um                   randconfig-r2307-20261006    gcc-14.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261007    gcc-14
x86_64      buildonly-randconfig-1001-20261007    gcc-14
x86_64      buildonly-randconfig-1002-20261007    gcc-14
x86_64      buildonly-randconfig-1003-20261007    gcc-14
x86_64      buildonly-randconfig-1004-20261007    gcc-14
x86_64      buildonly-randconfig-1005-20261007    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261007    clang-22
x86_64                randconfig-1001-20261007    clang-22
x86_64                randconfig-1002-20261007    clang-22
x86_64                randconfig-1003-20261007    clang-22
x86_64                randconfig-1004-20261007    clang-22
x86_64                randconfig-1005-20261007    clang-22
x86_64                randconfig-1006-20261007    clang-22
x86_64                randconfig-1007-20261007    clang-22
x86_64                randconfig-1008-20261007    clang-22
x86_64                randconfig-1009-20261007    clang-22
x86_64                randconfig-1010-20261007    clang-22
x86_64                randconfig-1011-20261007    clang-22
x86_64                randconfig-1012-20261007    gcc-12
x86_64                randconfig-1013-20261007    gcc-12
x86_64                randconfig-1014-20261007    gcc-12
x86_64                randconfig-1015-20261007    gcc-12
x86_64                randconfig-1016-20261007    gcc-12
x86_64                randconfig-1017-20261007    gcc-12
x86_64                randconfig-2100-20261006    clang-22   cocci
x86_64                randconfig-2101-20261006    clang-22   cocci
x86_64                randconfig-2102-20261006    clang-22   cocci
x86_64                randconfig-2102-20261006    gcc-14     cocci
x86_64                randconfig-2103-20261006    clang-22   cocci
x86_64                randconfig-2200-20261006    clang-22   smatch
x86_64                randconfig-2300-20261006    gcc-14     sparse
x86_64                randconfig-2301-20261006    clang-22   sparse
x86_64                randconfig-2301-20261006    gcc-14     sparse
x86_64                randconfig-2302-20261006    gcc-14     sparse
x86_64               randconfig-r2304-20261006    gcc-8.5.0  sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261007    clang-17
xtensa                randconfig-1001-20261007    clang-17
xtensa                randconfig-2000-20261006    gcc-9.5.0
xtensa                randconfig-2000-20261007    gcc-12.5.0
xtensa                randconfig-2001-20261007    gcc-14.3.0
xtensa               randconfig-r2102-20261006    gcc-8.5.0  cocci
xtensa               randconfig-r2105-20261006    gcc-8.5.0  cocci
xtensa               randconfig-r2202-20261006    gcc-9.5.0  smatch
xtensa               randconfig-r2302-20261006    clang-24   sparse
xtensa               randconfig-r2305-20261006    gcc-12.5.0 sparse
xtensa               randconfig-r2306-20261006    gcc-14.3.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

