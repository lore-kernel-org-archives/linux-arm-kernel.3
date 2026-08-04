Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471ABC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vs5BIlpD31kH75lJ3LGWHfh0U65a6Zt4KmLafSW9ByQ=; b=2L0fL9fsh7mx/ptmZstdfzTPb9
	FqWAqoG2dwhy5wpvNdPfDU0U3X50//qP/PRMEzkDIz5MNPe6WF9z1YIssMvKhZZkprIzdtuoPubR7
	dwwldvGV27HKH5R2xbdSktw75QwXKXixnOwReTgAt1vzQBnlK3qX9QbXr9wME3w4uovAXzLmtDD90
	jq6aPWjJC4LOSdBUpqzSucvnMv1BJ+U569e6/MExhmN9Q9j6Uw/aCF+b6wEH9gWYxjVK3LRAXsyCa
	Ya56OUcoIh60NvTOFcKI5bLHd3xa38vi5MQFsHu0DMZu+m632gBHVDIihgTiIkBmScNGUmZylFkGd
	qLxKC6dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8a1-000000016tx-2fdU;
	Tue, 04 Aug 2026 06:24:49 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8Zy-000000016tD-1hU6;
	Tue, 04 Aug 2026 06:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785824686; x=1817360686;
  h=date:from:to:cc:subject:message-id;
  bh=KKZFpNziv8p8HKPLsoOocbI9p7wTHRY7703zAFRVqFM=;
  b=cEUYeWSa+OkdJ4ZgfcHohaGaKFGOC525Qbot3hRRGnNl0muNxTNbBPue
   VAMHwvt2iEvB5fx4MDQY9EYsQq1AtHPLHamQLMUEvL2MEIKeNHgYWYsII
   UglWkRViZWbEfaIxQrKlpUkgU3lwag09arv7lb7GfQB0jH3yqfWjnledM
   OkCNMz5YdZXFewjhaSiR84nMRxF5ff/8n0lqp2Y02/xwZz0NS8TvYPpWJ
   EsJeK6z2D9A128gDwckdn0u/+eBPmxMJy9fspB3EL+3FKVZDnMEhqSF5u
   mqOB9C6lSb87DGFqaa7xPCyHPu2s/v+d64tpLbjQxyvxBXZh/S2l/0+r6
   w==;
X-CSE-ConnectionGUID: U2t8iAp4Sh6tvicFLcO4cw==
X-CSE-MsgGUID: PTQmcHC0QYqQ9fVbzxYkKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90179420"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="90179420"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 23:24:42 -0700
X-CSE-ConnectionGUID: COFkYOwiRDeMNnPUy81RQg==
X-CSE-MsgGUID: WbO2gSoCTg+tnth5R6yU4Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2026 23:24:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr8Zp-0000000097p-0Ov6;
	Tue, 04 Aug 2026 06:24:37 +0000
Date: Tue, 04 Aug 2026 14:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master] BUILD REGRESSION
 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
Message-ID: <202608041404.bOHh2XuT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_232446_480120_E9FD2097 
X-CRM114-Status: UNSURE (   4.63  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec  Add linux-next specific files for 20260803

Unverified Error/Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202608040800.45L57Mym-lkp@intel.com

    drivers/iio/magnetometer/qmc6308.c:402:7: error: call to '__compiletime_assert_472' declared with 'error' attribute: FIELD_PREP: value too large for the field
    drivers/net/ethernet/airoha/airoha_eth.c:3470:25: sparse: sparse: division by zero

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-r121-20260803
|   `-- drivers-net-ethernet-airoha-airoha_eth.c:sparse:sparse:division-by-zero
`-- um-randconfig-002-20260803
    `-- drivers-iio-magnetometer-qmc6308.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:FIELD_PREP:value-too-large-for-the-field

elapsed time: 726m

configs tested: 100
configs skipped: 1

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260804    gcc-15.2.0
arc                  randconfig-002-20260804    gcc-8.5.0
arm                  randconfig-001-20260804    gcc-10.5.0
arm                  randconfig-002-20260804    gcc-15.2.0
arm                  randconfig-003-20260804    clang-17
arm                  randconfig-004-20260804    gcc-8.5.0
arm64                randconfig-001-20260804    clang-24
arm64                randconfig-002-20260804    gcc-9.5.0
arm64                randconfig-003-20260804    gcc-11.5.0
arm64                randconfig-004-20260804    gcc-9.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260804    gcc-9.5.0
csky                 randconfig-002-20260804    gcc-11.5.0
hexagon              randconfig-001-20260804    clang-24
hexagon              randconfig-002-20260804    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260804    clang-22
i386       buildonly-randconfig-002-20260804    clang-22
i386       buildonly-randconfig-003-20260804    clang-22
i386       buildonly-randconfig-004-20260804    gcc-12
i386       buildonly-randconfig-005-20260804    clang-22
i386       buildonly-randconfig-006-20260804    gcc-14
i386                 randconfig-001-20260804    gcc-14
i386                 randconfig-002-20260804    gcc-14
i386                 randconfig-003-20260804    gcc-14
i386                 randconfig-004-20260804    gcc-14
i386                 randconfig-005-20260804    gcc-14
i386                 randconfig-006-20260804    clang-22
i386                 randconfig-007-20260804    gcc-14
i386                 randconfig-011-20260804    clang-22
i386                 randconfig-012-20260804    gcc-14
i386                 randconfig-013-20260804    clang-22
i386                 randconfig-014-20260804    gcc-14
i386                 randconfig-015-20260804    clang-22
i386                 randconfig-016-20260804    gcc-13
i386                 randconfig-017-20260804    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260804    clang-24
loongarch            randconfig-002-20260804    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260804    gcc-8.5.0
nios2                randconfig-002-20260804    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260804    gcc-8.5.0
parisc               randconfig-002-20260804    gcc-8.5.0
powerpc                      eiger_defconfig    clang-24
powerpc              randconfig-001-20260804    clang-24
powerpc              randconfig-002-20260804    gcc-11.5.0
powerpc64            randconfig-001-20260804    gcc-8.5.0
powerpc64            randconfig-002-20260804    gcc-8.5.0
riscv                randconfig-002-20260804    gcc-13.4.0
s390                 randconfig-001-20260804    clang-21
s390                 randconfig-002-20260804    clang-18
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260804    gcc-16.1.0
sh                   randconfig-002-20260804    gcc-16.1.0
sparc                randconfig-001-20260804    gcc-16.1.0
sparc                randconfig-002-20260804    gcc-16.1.0
sparc64              randconfig-001-20260804    clang-24
sparc64              randconfig-002-20260804    clang-20
um                   randconfig-001-20260804    gcc-14
um                   randconfig-002-20260804    gcc-14
x86_64              buildonly-randconfig-001    gcc-12
x86_64     buildonly-randconfig-001-20260804    gcc-14
x86_64     buildonly-randconfig-002-20260804    clang-22
x86_64     buildonly-randconfig-003-20260804    gcc-14
x86_64     buildonly-randconfig-004-20260804    gcc-14
x86_64     buildonly-randconfig-005-20260804    clang-22
x86_64     buildonly-randconfig-006-20260804    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260804    gcc-14
x86_64               randconfig-002-20260804    gcc-13
x86_64               randconfig-003-20260804    clang-22
x86_64               randconfig-004-20260804    clang-22
x86_64               randconfig-005-20260804    gcc-14
x86_64               randconfig-006-20260804    clang-22
x86_64               randconfig-011-20260804    clang-22
x86_64               randconfig-012-20260804    gcc-14
x86_64               randconfig-013-20260804    clang-22
x86_64               randconfig-014-20260804    clang-22
x86_64               randconfig-015-20260804    clang-22
x86_64               randconfig-016-20260804    clang-22
x86_64               randconfig-071-20260804    gcc-14
x86_64               randconfig-072-20260804    gcc-14
x86_64               randconfig-073-20260804    gcc-14
x86_64               randconfig-074-20260804    gcc-12
x86_64               randconfig-075-20260804    gcc-14
x86_64               randconfig-076-20260804    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260804    gcc-8.5.0
xtensa               randconfig-002-20260804    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

