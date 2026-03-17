Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25159FF6E9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 23:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kJoUp3Q7Db7z/LjUQKX/kaAGrPjOPzZp3d+tGcQKJXg=; b=GL1dWL+Rw6eql27ROsaLJ/9pK1
	z16MKU0PfxDjL9ukBjiN2G9jdlyYpvAY344Tr1+PrpNtSKsw8H/dAKU9wSyAa/1Y+GPBDx6VovY0e
	QXisQGXu4miGeVN4XMFL/l+ZegTdPahcpkMPFdSF+Fs7UcsXtYan1OrgP2L4uDx8VNf6dhG5l+0Jq
	5C814mIS/aLHA6+3dEQ7rgUB+LXXJY122f/+ypR08eFFrBxpEwktDalT1aVub2/zbgkXq1joQl7SK
	+lGHK21LFlGZoZu0vTESpxThuotGFWJ2oX8Cn3dTKnHrQEsHXTLuQ0uk7cwb4ZWi3NZiUA8FId2jJ
	mcc4Q73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dyQ-00000007SuF-0KZP;
	Tue, 17 Mar 2026 23:37:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dyN-00000007Stb-3v7R
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 23:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=kJoUp3Q7Db7z/LjUQKX/kaAGrPjOPzZp3d+tGcQKJXg=; b=bkof8Iqj/X/uMHdqay+1UULvVV
	5PfcP2Ubq9BnGq6xuFZt6KZDg5FIQwdObe8oW+iwgNx66JCllB19tervgI+5V/6Dd9fsa63hWblrl
	PnW0s8ijmbMqXhFrci2hOomNDH+oiSzKhKj1Ak03ljAXcyG/SuiD2CVeWp+xuHnBq/dsE5auXYVGQ
	jqkHQmgdRwAE+LylzPnNTvCJdCmQKfcmIb+46NR3tEmU7vF+fhahvfsHe9XwVuxQCz02WRv5tAj+Y
	m9Gq91TngLHfztuCVhD42ChL9kEhL4e1buacuAAKEmGtzYxbwgXcDCPvb3soKWFXU1OcrMW+w5/8X
	Gj6iC06Q==;
Received: from mgamail.intel.com ([192.198.163.13])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dyB-0000000AA1l-32by
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 23:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773790624; x=1805326624;
  h=date:from:to:cc:subject:message-id;
  bh=asmA0ptVnAxSNXw4Kv98IwfV+94Th6aDiEMYEh/Wdj0=;
  b=QutDem54Idg9910ROnIQW2s/jZr22yOY4vZNbOBS056bnCT/d9wglR23
   60Xtw6SiLIHOx+6gXDM/cLGGXWsfSEx0pb3hTQsknAYOFjIxmcjWT0pV6
   ZqnMj2AJqsSCLryptKfk1j2wOeZRKuBGFBFXtQsfX85xHcMLtgSubmBi5
   sWa1TYTT+Iy9C55TfpzwBjWpx+zsJ+bKDSFwhPmnf6p/9EkWcRiLqsUOI
   WeSz8MXVlYVsHjyQ+MHxThdSsjTmTonQ4Qu3UGOA06SpNRN3VemCf+ixS
   TOdta2EM5B0Jh8e2DTJUugFOJuClT43HR3ngb9iGzCmdhwPxgD7cyE8R4
   A==;
X-CSE-ConnectionGUID: UahFJHjjSditIkDeWCOI6w==
X-CSE-MsgGUID: z6eQx8Y0Rv22Wk1ytzGyOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77448782"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="77448782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 16:36:57 -0700
X-CSE-ConnectionGUID: wXXpOvfrSCCPKRmqQyQfiQ==
X-CSE-MsgGUID: ZSWC+nV4Qt2zxZbi5NSBXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="252905238"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2026 16:36:53 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2dxy-000000002An-1iEP;
	Tue, 17 Mar 2026 23:36:50 +0000
Date: Wed, 18 Mar 2026 07:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 d9ef8c91c4bba8160853a76ba0dc99919acef0ab
Message-ID: <202603180757.IZT5fuDj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_233709_922972_1021868B 
X-CRM114-Status: UNSURE (   4.69  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: d9ef8c91c4bba8160853a76ba0dc99919acef0ab  Merge tag 'renesas-dts-for-v7.1-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/dt

elapsed time: 842m

configs tested: 115
configs skipped: 149

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                   randconfig-001-20260318    gcc-8.5.0
arc                   randconfig-002-20260318    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-23
arm                   randconfig-001-20260318    gcc-8.5.0
arm                   randconfig-002-20260318    gcc-8.5.0
arm                   randconfig-003-20260318    gcc-8.5.0
arm                   randconfig-004-20260318    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon               randconfig-001-20260318    gcc-8.5.0
hexagon               randconfig-002-20260318    gcc-8.5.0
i386                              allnoconfig    gcc-15.2.0
i386        buildonly-randconfig-001-20260318    gcc-14
i386        buildonly-randconfig-002-20260318    gcc-14
i386        buildonly-randconfig-003-20260318    gcc-14
i386        buildonly-randconfig-004-20260318    gcc-14
i386        buildonly-randconfig-005-20260318    gcc-14
i386        buildonly-randconfig-006-20260318    gcc-14
i386                  randconfig-001-20260318    gcc-14
i386                  randconfig-002-20260318    gcc-14
i386                  randconfig-003-20260318    gcc-14
i386                  randconfig-004-20260318    gcc-14
i386                  randconfig-005-20260318    gcc-14
i386                  randconfig-006-20260318    gcc-14
i386                  randconfig-007-20260318    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260318    gcc-8.5.0
loongarch             randconfig-002-20260318    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260318    gcc-8.5.0
nios2                 randconfig-002-20260318    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260318    gcc-11.5.0
parisc                randconfig-002-20260318    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260318    gcc-11.5.0
powerpc               randconfig-002-20260318    gcc-11.5.0
powerpc64             randconfig-001-20260318    gcc-11.5.0
powerpc64             randconfig-002-20260318    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260318    gcc-15.2.0
riscv                 randconfig-002-20260318    gcc-15.2.0
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260318    gcc-15.2.0
s390                  randconfig-002-20260318    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260318    gcc-15.2.0
sh                    randconfig-002-20260318    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260318    gcc-13.4.0
sparc                 randconfig-002-20260318    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260318    gcc-13.4.0
sparc64               randconfig-002-20260318    gcc-13.4.0
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260318    gcc-13.4.0
um                    randconfig-002-20260318    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-23
x86_64      buildonly-randconfig-001-20260318    gcc-14
x86_64      buildonly-randconfig-002-20260318    gcc-14
x86_64      buildonly-randconfig-003-20260318    gcc-14
x86_64      buildonly-randconfig-004-20260318    gcc-14
x86_64      buildonly-randconfig-005-20260318    gcc-14
x86_64      buildonly-randconfig-006-20260318    gcc-14
x86_64                              defconfig    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260318    gcc-13.4.0
xtensa                randconfig-002-20260318    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

