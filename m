Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D72CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L80xOGXhCO0yoCXbI9Xv2t/Jn3GCEJlPGgT8WM0lcKo=; b=C/o2lFzG51VEZlAuKRJBluRuxi
	vvLP3RyaKQDP1sOXqOZlqjW3dqOA67jqxbdqk0wWaQrW81ZeOXfqOLE6uiX9Q74dOZeOvTM0q4MTb
	l9KIo0a8VBwylb9KxPxSipnH+o1ImVI5GvHtv9ENhSZtz2Ip3K5UkInNdmwsGJqDXuMGI6G+tauBV
	KjJn1NVkjmrr5gReVjiZVW7zVlUOSz7EgAOvYReKdz+SB95Ai2+wOBMEQxUd/KqokqWQbO4e+2hny
	TKzRqdt+tlA9bilSn9RGt9NzBMLk6D/Js6opjI3YVuII4YHSlfzqPdZRQ4dgBo0iV1+2EeOQMdUu2
	1ufOnE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwEa-0000000FDIZ-1JuO;
	Wed, 14 Oct 2026 10:29:20 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwER-0000000FDGs-2hFm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791973751; x=1823509751;
  h=date:from:to:cc:subject:message-id;
  bh=kCm4pudN32CjRdon08QjT4ZePI+cPF14OvsvjlxSB0s=;
  b=TLbSfrET/9/z/EzpioUKmYPr/5s+KJeoW9P71mXtAcRKlGf1DGdh6dWK
   YSKzhJTqz9VUDJM0pKDjO8dvtRQtS0KjwRuoIRf/4Wq3Q2ZlKK6/V6X1C
   u/SEMuMOZMdNR2G2Q3g/THFt+ocmnxDIuAi9Ow8lTw721RsJ12cMSZquR
   3MqX2H3cC/x65oHL7bTGILBP8G1tMAInmqfrhApkodzW4HHMmEEVJg+Rd
   BHd5U5kItEXsFYCZNnTXovT5EDuRAXulfTAOYJzxIrFxEvXDmSJ9AJn2p
   Bxk6ivWyAfakoAU0pT2QZzXFLCw/OlBtxODk42nfZ5LHAw/fyyeYDZzy8
   A==;
X-CSE-ConnectionGUID: eVB2eLGuRDeoXqiomPjcYQ==
X-CSE-MsgGUID: TzrhJCwmQgyAVYzOgc1Isw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="723686"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="723686"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:29:10 -0700
X-CSE-ConnectionGUID: e2WH/zc6TOSXfjBDVneHvg==
X-CSE-MsgGUID: PZlWWqKdSeaDU5gAqNZPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1739115"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Oct 2026 03:29:09 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGwEL-00000000EWD-3SMn;
	Wed, 14 Oct 2026 10:29:05 +0000
Date: Wed, 14 Oct 2026 18:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm:fixes] BUILD SUCCESS
 59f522f5a0ece96ce051a27d15533667a1d0dee8
Message-ID: <202610141849.DZ6erkBc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_032911_709537_C909B51A 
X-CRM114-Status: UNSURE (   5.17  )
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
branch HEAD: 59f522f5a0ece96ce051a27d15533667a1d0dee8  Merge tag 'at91-fixes-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes

elapsed time: 1052m

configs tested: 494
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-16.1.0
alpha                    allyesconfig    gcc-16.1.0
alpha                       defconfig    gcc-16.1.0
alpha       randconfig-r2104-20261013    clang-22   cocci
alpha       randconfig-r2105-20261013    gcc-8.5.0  cocci
alpha       randconfig-r2106-20261013    clang-22   cocci
alpha       randconfig-r2110-20261012    gcc-10.5.0 cocci
alpha       randconfig-r2309-20261012    gcc-12.5.0 sparse
alpha       randconfig-r2309-20261013    clang-24   sparse
arc                      allmodconfig    clang-24
arc                       allnoconfig    gcc-16.1.0
arc                      allyesconfig    clang-24
arc                         defconfig    gcc-16.1.0
arc          randconfig-1000-20261014    clang-17
arc          randconfig-1001-20261014    clang-17
arc          randconfig-2000-20261012    gcc-16.1.0
arc          randconfig-2000-20261013    gcc-8.5.0
arc          randconfig-2001-20261012    gcc-16.1.0
arc          randconfig-2001-20261013    gcc-8.5.0
arc         randconfig-r2102-20261012    gcc-15.2.0 cocci
arc         randconfig-r2102-20261013    clang-24   cocci
arc         randconfig-r2107-20261013    clang-22   cocci
arc         randconfig-r2109-20261013    clang-24   cocci
arc         randconfig-r2110-20261013    gcc-8.5.0  cocci
arc         randconfig-r2200-20261012    gcc-16.1.0 smatch
arc         randconfig-r2200-20261013    gcc-13.4.0 smatch
arc         randconfig-r2300-20261013    gcc-8.5.0  sparse
arc         randconfig-r2301-20261012    gcc-11.5.0 sparse
arc         randconfig-r2301-20261013    gcc-12.5.0 sparse
arc         randconfig-r2310-20261012    gcc-12.5.0 sparse
arm                       allnoconfig    gcc-16.1.0
arm                      allyesconfig    clang-24
arm                         defconfig    gcc-16.1.0
arm          randconfig-1000-20261014    clang-17
arm          randconfig-1001-20261014    clang-17
arm          randconfig-1002-20261014    clang-17
arm          randconfig-1003-20261014    clang-17
arm          randconfig-2000-20261012    gcc-16.1.0
arm          randconfig-2000-20261013    gcc-8.5.0
arm          randconfig-2001-20261012    gcc-16.1.0
arm          randconfig-2001-20261013    gcc-8.5.0
arm         randconfig-r2101-20261013    clang-24   cocci
arm         randconfig-r2104-20261013    gcc-8.5.0  cocci
arm         randconfig-r2107-20261012    gcc-11.5.0 cocci
arm         randconfig-r2107-20261012    gcc-9.5.0  cocci
arm         randconfig-r2109-20261012    gcc-15.2.0 cocci
arm         randconfig-r2109-20261013    clang-24   cocci
arm         randconfig-r2110-20261012    clang-24   cocci
arm         randconfig-r2111-20261013    gcc-14.3.0 cocci
arm         randconfig-r2201-20261012    gcc-10.5.0 smatch
arm         randconfig-r2202-20261013    gcc-8.5.0  smatch
arm         randconfig-r2306-20261012    gcc-12.5.0 sparse
arm         randconfig-r2307-20261013    clang-19   sparse
arm         randconfig-r2308-20261012    gcc-16.1.0 sparse
arm         randconfig-r2308-20261013    clang-24   sparse
arm         randconfig-r2311-20261012    gcc-12.5.0 sparse
arm64                    allmodconfig    clang-24
arm64                     allnoconfig    gcc-16.1.0
arm64                       defconfig    gcc-16.1.0
arm64        randconfig-2000-20261012    gcc-16.1.0
arm64        randconfig-2000-20261013    gcc-9.5.0
arm64        randconfig-2001-20261012    gcc-16.1.0
arm64        randconfig-2001-20261013    gcc-9.5.0
arm64       randconfig-r2100-20261012    gcc-15.2.0 cocci
arm64       randconfig-r2101-20261012    gcc-15.2.0 cocci
arm64       randconfig-r2103-20261013    clang-24   cocci
arm64       randconfig-r2108-20261012    gcc-15.2.0 cocci
arm64       randconfig-r2111-20261012    gcc-11.5.0 cocci
arm64       randconfig-r2200-20261012    clang-24   smatch
arm64       randconfig-r2200-20261013    gcc-8.5.0  smatch
arm64       randconfig-r2201-20261012    gcc-10.5.0 smatch
arm64       randconfig-r2201-20261013    gcc-11.5.0 smatch
arm64       randconfig-r2303-20261012    clang-24   sparse
arm64       randconfig-r2305-20261012    clang-24   sparse
arm64       randconfig-r2305-20261013    gcc-12.5.0 sparse
arm64       randconfig-r2306-20261013    gcc-10.5.0 sparse
arm64       randconfig-r2307-20261012    gcc-16.1.0 sparse
arm64       randconfig-r2309-20261013    clang-19   sparse
arm64       randconfig-r2311-20261012    gcc-12.5.0 sparse
arm64       randconfig-r2311-20261013    clang-24   sparse
csky                     allmodconfig    gcc-16.1.0
csky                      allnoconfig    gcc-16.1.0
csky                        defconfig    gcc-16.1.0
csky         randconfig-2000-20261012    gcc-16.1.0
csky         randconfig-2000-20261013    gcc-9.5.0
csky         randconfig-2001-20261012    gcc-16.1.0
csky         randconfig-2001-20261013    gcc-9.5.0
csky        randconfig-r2100-20261012    gcc-12.5.0 cocci
csky        randconfig-r2101-20261013    gcc-12.5.0 cocci
csky        randconfig-r2106-20261012    gcc-14     cocci
csky        randconfig-r2111-20261012    gcc-10.5.0 cocci
csky        randconfig-r2111-20261013    gcc-10.5.0 cocci
csky        randconfig-r2200-20261012    gcc-10.5.0 smatch
csky        randconfig-r2300-20261013    gcc-16.1.0 sparse
csky        randconfig-r2302-20261012    clang-24   sparse
csky        randconfig-r2303-20261013    gcc-16.1.0 sparse
csky        randconfig-r2304-20261013    gcc-16.1.0 sparse
csky        randconfig-r2306-20261012    gcc-12.5.0 sparse
csky        randconfig-r2310-20261012    gcc-16.1.0 sparse
hexagon                  allmodconfig    gcc-16.1.0
hexagon                   allnoconfig    gcc-16.1.0
hexagon                     defconfig    gcc-16.1.0
hexagon      randconfig-2000-20261012    gcc-16.1.0
hexagon      randconfig-2000-20261013    gcc-9.5.0
hexagon      randconfig-2001-20261012    gcc-16.1.0
hexagon      randconfig-2001-20261013    gcc-9.5.0
hexagon     randconfig-r2101-20261013    clang-24   cocci
hexagon     randconfig-r2102-20261012    clang-24   cocci
hexagon     randconfig-r2102-20261013    clang-24   cocci
hexagon     randconfig-r2103-20261013    clang-21   cocci
hexagon     randconfig-r2103-20261013    clang-24   cocci
hexagon     randconfig-r2104-20261012    clang-24   cocci
hexagon     randconfig-r2107-20261013    clang-24   cocci
hexagon     randconfig-r2108-20261012    gcc-15.2.0 cocci
hexagon     randconfig-r2109-20261012    clang-24   cocci
hexagon     randconfig-r2110-20261012    gcc-14     cocci
hexagon     randconfig-r2301-20261013    gcc-8.5.0  sparse
hexagon     randconfig-r2305-20261012    clang-24   sparse
i386                     allmodconfig    clang-22
i386                      allnoconfig    gcc-16.1.0
i386                        defconfig    gcc-16.1.0
i386         randconfig-1000-20261014    clang-22
i386         randconfig-1001-20261014    clang-22
i386         randconfig-1002-20261014    clang-22
i386         randconfig-1003-20261014    clang-22
i386         randconfig-1004-20261014    clang-22
i386         randconfig-1005-20261014    clang-22
i386         randconfig-1006-20261014    clang-22
i386         randconfig-2000-20261012    gcc-16.1.0
i386         randconfig-2000-20261013    gcc-8.5.0
i386         randconfig-2001-20261012    gcc-16.1.0
i386         randconfig-2001-20261013    gcc-8.5.0
i386         randconfig-2100-20261012    clang-22   cocci
i386         randconfig-2100-20261013    gcc-14     cocci
i386         randconfig-2101-20261012    clang-22   cocci
i386         randconfig-2101-20261013    gcc-14     cocci
i386         randconfig-2102-20261012    clang-22   cocci
i386         randconfig-2102-20261013    gcc-14     cocci
i386         randconfig-2103-20261012    clang-22   cocci
i386         randconfig-2103-20261013    gcc-14     cocci
i386         randconfig-2104-20261012    clang-22   cocci
i386         randconfig-2104-20261013    gcc-14     cocci
i386         randconfig-2105-20261012    clang-22   cocci
i386         randconfig-2105-20261013    gcc-14     cocci
i386         randconfig-2200-20261012    clang-22   smatch
i386         randconfig-2200-20261013    gcc-14     smatch
i386         randconfig-2300-20261012    gcc-14     sparse
i386         randconfig-2300-20261013    gcc-14     sparse
i386         randconfig-2301-20261012    gcc-14     sparse
i386         randconfig-2301-20261013    gcc-14     sparse
i386         randconfig-2302-20261012    gcc-14     sparse
i386         randconfig-2302-20261013    gcc-14     sparse
i386        randconfig-r2100-20261012    clang-24   cocci
i386        randconfig-r2100-20261013    clang-24   cocci
i386        randconfig-r2102-20261013    clang-24   cocci
i386        randconfig-r2104-20261013    gcc-10.5.0 cocci
i386        randconfig-r2110-20261013    clang-24   cocci
i386        randconfig-r2111-20261013    clang-22   cocci
i386        randconfig-r2202-20261012    clang-22   smatch
i386        randconfig-r2301-20261012    clang-22   sparse
i386        randconfig-r2305-20261013    clang-22   sparse
i386        randconfig-r2306-20261012    gcc-16.1.0 sparse
i386        randconfig-r2307-20261012    gcc-12.5.0 sparse
i386        randconfig-r2308-20261012    gcc-16.1.0 sparse
i386        randconfig-r2308-20261013    gcc-9.5.0  sparse
i386        randconfig-r2310-20261012    gcc-12.5.0 sparse
i386        randconfig-r2311-20261012    clang-22   sparse
loongarch                allmodconfig    clang-24
loongarch                 allnoconfig    gcc-16.1.0
loongarch    randconfig-2000-20261012    gcc-11.5.0
loongarch    randconfig-2000-20261013    gcc-11.5.0
loongarch    randconfig-2001-20261012    gcc-11.5.0
loongarch    randconfig-2001-20261013    gcc-11.5.0
loongarch   randconfig-r2100-20261013    gcc-12.5.0 cocci
loongarch   randconfig-r2101-20261012    clang-24   cocci
loongarch   randconfig-r2101-20261013    clang-24   cocci
loongarch   randconfig-r2102-20261012    gcc-12.5.0 cocci
loongarch   randconfig-r2106-20261012    gcc-10.5.0 cocci
loongarch   randconfig-r2106-20261013    gcc-8.5.0  cocci
loongarch   randconfig-r2110-20261012    gcc-11.5.0 cocci
loongarch   randconfig-r2110-20261013    gcc-14.3.0 cocci
loongarch   randconfig-r2201-20261012    clang-20   smatch
loongarch   randconfig-r2201-20261013    clang-24   smatch
loongarch   randconfig-r2300-20261013    gcc-12.5.0 sparse
loongarch   randconfig-r2302-20261012    clang-24   sparse
loongarch   randconfig-r2305-20261012    clang-22   sparse
loongarch   randconfig-r2306-20261013    clang-24   sparse
loongarch   randconfig-r2311-20261012    gcc-16.1.0 sparse
m68k                     allmodconfig    gcc-16.1.0
m68k                      allnoconfig    gcc-16.1.0
m68k                     allyesconfig    clang-24
m68k        randconfig-r2100-20261013    clang-24   cocci
m68k        randconfig-r2101-20261012    clang-24   cocci
m68k        randconfig-r2101-20261012    gcc-15.2.0 cocci
m68k        randconfig-r2103-20261012    gcc-12.5.0 cocci
m68k        randconfig-r2103-20261013    gcc-12.5.0 cocci
m68k        randconfig-r2107-20261013    gcc-8.5.0  cocci
m68k        randconfig-r2108-20261013    clang-24   cocci
m68k        randconfig-r2109-20261012    gcc-12.5.0 cocci
m68k        randconfig-r2109-20261013    gcc-12.5.0 cocci
m68k        randconfig-r2201-20261012    gcc-13.4.0 smatch
m68k        randconfig-r2201-20261013    gcc-16.1.0 smatch
m68k        randconfig-r2302-20261012    clang-24   sparse
m68k        randconfig-r2304-20261012    clang-21   sparse
m68k        randconfig-r2305-20261012    clang-24   sparse
microblaze                allnoconfig    gcc-16.1.0
microblaze               allyesconfig    gcc-16.1.0
microblaze  randconfig-r2108-20261012    clang-24   cocci
microblaze  randconfig-r2108-20261012    gcc-13.4.0 cocci
microblaze  randconfig-r2109-20261012    gcc-15.2.0 cocci
microblaze  randconfig-r2200-20261012    gcc-15.2.0 smatch
microblaze  randconfig-r2300-20261012    clang-24   sparse
microblaze  randconfig-r2301-20261013    gcc-16.1.0 sparse
microblaze  randconfig-r2302-20261012    gcc-11.5.0 sparse
microblaze  randconfig-r2307-20261013    clang-24   sparse
microblaze  randconfig-r2308-20261012    gcc-12.5.0 sparse
microblaze  randconfig-r2309-20261012    gcc-16.1.0 sparse
mips                      allnoconfig    gcc-16.1.0
mips                     allyesconfig    gcc-16.1.0
mips        randconfig-r2100-20261012    clang-24   cocci
mips        randconfig-r2105-20261013    gcc-10.5.0 cocci
mips        randconfig-r2106-20261013    gcc-10.5.0 cocci
mips        randconfig-r2110-20261013    gcc-10.5.0 cocci
mips        randconfig-r2111-20261013    clang-24   cocci
mips        randconfig-r2202-20261013    clang-24   smatch
mips        randconfig-r2300-20261013    gcc-8.5.0  sparse
mips        randconfig-r2301-20261012    clang-21   sparse
mips        randconfig-r2301-20261013    gcc-8.5.0  sparse
mips        randconfig-r2302-20261013    gcc-8.5.0  sparse
mips        randconfig-r2304-20261012    clang-24   sparse
mips        randconfig-r2310-20261013    gcc-10.5.0 sparse
nios2                    allmodconfig    clang-20
nios2                     allnoconfig    clang-24
nios2        randconfig-2000-20261012    gcc-11.5.0
nios2        randconfig-2000-20261013    gcc-11.5.0
nios2        randconfig-2001-20261012    gcc-11.5.0
nios2        randconfig-2001-20261013    gcc-11.5.0
nios2       randconfig-r2103-20261012    clang-24   cocci
nios2       randconfig-r2105-20261012    gcc-11.5.0 cocci
nios2       randconfig-r2106-20261013    gcc-14.3.0 cocci
nios2       randconfig-r2107-20261012    gcc-10.5.0 cocci
nios2       randconfig-r2108-20261012    clang-24   cocci
nios2       randconfig-r2108-20261012    gcc-12.5.0 cocci
nios2       randconfig-r2111-20261013    gcc-8.5.0  cocci
nios2       randconfig-r2201-20261013    gcc-8.5.0  smatch
nios2       randconfig-r2202-20261013    gcc-11.5.0 smatch
nios2       randconfig-r2300-20261012    clang-24   sparse
nios2       randconfig-r2302-20261013    clang-22   sparse
nios2       randconfig-r2305-20261012    clang-21   sparse
nios2       randconfig-r2305-20261013    gcc-8.5.0  sparse
nios2       randconfig-r2307-20261012    gcc-16.1.0 sparse
nios2       randconfig-r2311-20261012    gcc-16.1.0 sparse
nios2       randconfig-r2311-20261013    clang-19   sparse
openrisc                 allmodconfig    clang-20
openrisc                  allnoconfig    clang-24
openrisc    randconfig-r2100-20261013    clang-24   cocci
openrisc    randconfig-r2104-20261012    gcc-14     cocci
openrisc    randconfig-r2201-20261013    gcc-15.2.0 smatch
openrisc    randconfig-r2310-20261012    gcc-16.1.0 sparse
parisc                   allmodconfig    gcc-16.1.0
parisc                    allnoconfig    clang-24
parisc                   allyesconfig    clang-17
parisc       randconfig-2000-20261012    gcc-11.5.0
parisc       randconfig-2000-20261013    gcc-11.5.0
parisc       randconfig-2001-20261012    gcc-11.5.0
parisc       randconfig-2001-20261013    gcc-11.5.0
parisc      randconfig-r2105-20261012    gcc-9.5.0  cocci
parisc      randconfig-r2106-20261013    gcc-8.5.0  cocci
parisc      randconfig-r2108-20261013    clang-24   cocci
parisc      randconfig-r2110-20261012    gcc-9.5.0  cocci
parisc      randconfig-r2111-20261012    gcc-9.5.0  cocci
parisc      randconfig-r2201-20261012    gcc-16.1.0 smatch
parisc      randconfig-r2202-20261012    gcc-10.5.0 smatch
parisc      randconfig-r2303-20261012    clang-22   sparse
parisc      randconfig-r2304-20261012    clang-22   sparse
parisc      randconfig-r2305-20261013    gcc-16.1.0 sparse
parisc      randconfig-r2311-20261013    gcc-10.5.0 sparse
powerpc                   allnoconfig    clang-24
powerpc      randconfig-2000-20261012    gcc-14
powerpc      randconfig-2000-20261013    gcc-14
powerpc      randconfig-2001-20261012    gcc-14
powerpc      randconfig-2001-20261013    gcc-14
powerpc     randconfig-r2103-20261012    clang-24   cocci
powerpc     randconfig-r2106-20261012    clang-24   cocci
powerpc     randconfig-r2106-20261012    gcc-9.5.0  cocci
powerpc     randconfig-r2107-20261013    gcc-10.5.0 cocci
powerpc     randconfig-r2110-20261013    clang-22   cocci
powerpc     randconfig-r2110-20261013    gcc-8.5.0  cocci
powerpc     randconfig-r2302-20261013    gcc-16.1.0 sparse
powerpc     randconfig-r2303-20261012    clang-24   sparse
powerpc     randconfig-r2305-20261012    gcc-11.5.0 sparse
powerpc     randconfig-r2305-20261013    gcc-8.5.0  sparse
powerpc     randconfig-r2309-20261012    clang-22   sparse
powerpc64    randconfig-2000-20261012    gcc-14
powerpc64    randconfig-2000-20261013    gcc-14
powerpc64    randconfig-2001-20261012    gcc-14
powerpc64    randconfig-2001-20261013    gcc-14
powerpc64   randconfig-r2105-20261012    clang-24   cocci
powerpc64   randconfig-r2106-20261013    clang-24   cocci
powerpc64   randconfig-r2109-20261012    gcc-13.4.0 cocci
powerpc64   randconfig-r2109-20261013    clang-21   cocci
powerpc64   randconfig-r2109-20261013    clang-24   cocci
powerpc64   randconfig-r2202-20261012    gcc-14.3.0 smatch
powerpc64   randconfig-r2300-20261012    gcc-11.5.0 sparse
powerpc64   randconfig-r2300-20261013    clang-22   sparse
powerpc64   randconfig-r2302-20261012    clang-22   sparse
powerpc64   randconfig-r2304-20261012    gcc-11.5.0 sparse
powerpc64   randconfig-r2307-20261013    clang-24   sparse
powerpc64   randconfig-r2309-20261013    clang-24   sparse
powerpc64   randconfig-r2310-20261013    clang-24   sparse
riscv                    allmodconfig    clang-24
riscv                     allnoconfig    clang-24
riscv                    allyesconfig    clang-24
riscv        randconfig-2000-20261012    gcc-14.3.0
riscv        randconfig-2000-20261013    gcc-15.2.0
riscv        randconfig-2001-20261012    gcc-14.3.0
riscv        randconfig-2001-20261013    gcc-15.2.0
riscv       randconfig-r2102-20261012    clang-24   cocci
riscv       randconfig-r2102-20261012    gcc-15.2.0 cocci
riscv       randconfig-r2103-20261012    gcc-15.2.0 cocci
riscv       randconfig-r2111-20261012    clang-24   cocci
riscv       randconfig-r2111-20261013    gcc-8.5.0  cocci
riscv       randconfig-r2202-20261012    clang-24   smatch
riscv       randconfig-r2300-20261012    clang-22   sparse
riscv       randconfig-r2308-20261012    gcc-16.1.0 sparse
riscv       randconfig-r2308-20261013    gcc-10.5.0 sparse
riscv       randconfig-r2310-20261013    clang-24   sparse
s390                     allmodconfig    clang-17
s390                      allnoconfig    clang-24
s390         randconfig-2000-20261012    gcc-14.3.0
s390         randconfig-2000-20261013    gcc-15.2.0
s390         randconfig-2001-20261012    gcc-14.3.0
s390         randconfig-2001-20261013    gcc-15.2.0
s390        randconfig-r2100-20261012    gcc-13.4.0 cocci
s390        randconfig-r2100-20261013    clang-21   cocci
s390        randconfig-r2104-20261012    gcc-11.5.0 cocci
s390        randconfig-r2105-20261012    gcc-14     cocci
s390        randconfig-r2105-20261013    gcc-14.3.0 cocci
s390        randconfig-r2108-20261013    gcc-12.5.0 cocci
s390        randconfig-r2109-20261013    clang-24   cocci
s390        randconfig-r2111-20261012    gcc-14     cocci
s390        randconfig-r2200-20261013    clang-24   smatch
s390        randconfig-r2202-20261012    gcc-14.3.0 smatch
s390        randconfig-r2302-20261013    gcc-12.5.0 sparse
s390        randconfig-r2304-20261012    clang-24   sparse
s390        randconfig-r2304-20261013    gcc-8.5.0  sparse
s390        randconfig-r2306-20261012    clang-22   sparse
s390        randconfig-r2307-20261013    gcc-10.5.0 sparse
s390        randconfig-r2309-20261012    gcc-12.5.0 sparse
s390        randconfig-r2310-20261012    clang-22   sparse
s390        randconfig-r2310-20261012    gcc-16.1.0 sparse
s390        randconfig-r2311-20261013    clang-24   sparse
sh                       allmodconfig    gcc-16.1.0
sh                        allnoconfig    clang-24
sh                       allyesconfig    clang-17
sh           randconfig-2000-20261012    gcc-14.3.0
sh           randconfig-2000-20261013    gcc-15.2.0
sh           randconfig-2001-20261012    gcc-14.3.0
sh           randconfig-2001-20261013    gcc-15.2.0
sh          randconfig-r2101-20261013    clang-24   cocci
sh          randconfig-r2104-20261013    gcc-8.5.0  cocci
sh          randconfig-r2105-20261013    gcc-8.5.0  cocci
sh          randconfig-r2107-20261012    clang-24   cocci
sh          randconfig-r2109-20261012    clang-24   cocci
sh          randconfig-r2201-20261012    gcc-9.5.0  smatch
sh          randconfig-r2300-20261012    clang-24   sparse
sh          randconfig-r2301-20261012    clang-24   sparse
sh          randconfig-r2303-20261012    clang-21   sparse
sh          randconfig-r2306-20261013    gcc-9.5.0  sparse
sh          randconfig-r2307-20261012    gcc-16.1.0 sparse
sh          randconfig-r2309-20261012    gcc-16.1.0 sparse
sh          randconfig-r2309-20261013    gcc-9.5.0  sparse
sparc                     allnoconfig    clang-24
sparc        randconfig-2000-20261012    gcc-8.5.0
sparc        randconfig-2000-20261013    gcc-16.1.0
sparc        randconfig-2001-20261012    gcc-8.5.0
sparc        randconfig-2001-20261013    gcc-16.1.0
sparc       randconfig-r2100-20261012    gcc-15.2.0 cocci
sparc       randconfig-r2101-20261012    gcc-12.5.0 cocci
sparc       randconfig-r2103-20261013    clang-24   cocci
sparc       randconfig-r2107-20261013    gcc-8.5.0  cocci
sparc       randconfig-r2108-20261013    clang-24   cocci
sparc       randconfig-r2302-20261012    clang-21   sparse
sparc       randconfig-r2303-20261013    gcc-8.5.0  sparse
sparc       randconfig-r2304-20261013    clang-22   sparse
sparc       randconfig-r2306-20261012    gcc-16.1.0 sparse
sparc       randconfig-r2306-20261013    clang-19   sparse
sparc64                  allmodconfig    clang-20
sparc64      randconfig-2000-20261012    gcc-8.5.0
sparc64      randconfig-2000-20261013    gcc-16.1.0
sparc64      randconfig-2001-20261012    gcc-8.5.0
sparc64      randconfig-2001-20261013    gcc-16.1.0
sparc64     randconfig-r2100-20261013    clang-24   cocci
sparc64     randconfig-r2105-20261013    clang-24   cocci
sparc64     randconfig-r2200-20261012    clang-20   smatch
sparc64     randconfig-r2200-20261013    clang-24   smatch
sparc64     randconfig-r2300-20261012    clang-21   sparse
sparc64     randconfig-r2301-20261012    clang-24   sparse
sparc64     randconfig-r2303-20261012    gcc-11.5.0 sparse
sparc64     randconfig-r2303-20261013    clang-22   sparse
sparc64     randconfig-r2304-20261013    gcc-12.5.0 sparse
sparc64     randconfig-r2311-20261012    gcc-16.1.0 sparse
sparc64     randconfig-r2311-20261013    gcc-9.5.0  sparse
um                       allmodconfig    clang-17
um                        allnoconfig    clang-24
um                       allyesconfig    gcc-16.1.0
um           randconfig-2000-20261012    gcc-8.5.0
um           randconfig-2000-20261013    gcc-16.1.0
um           randconfig-2001-20261012    gcc-8.5.0
um           randconfig-2001-20261013    gcc-16.1.0
um          randconfig-r2101-20261013    clang-21   cocci
um          randconfig-r2102-20261013    clang-24   cocci
um          randconfig-r2102-20261013    gcc-12.5.0 cocci
um          randconfig-r2103-20261012    gcc-13.4.0 cocci
um          randconfig-r2104-20261013    clang-24   cocci
um          randconfig-r2106-20261012    gcc-11.5.0 cocci
um          randconfig-r2108-20261013    clang-21   cocci
um          randconfig-r2200-20261013    clang-17   smatch
um          randconfig-r2202-20261012    clang-17   smatch
um          randconfig-r2303-20261013    gcc-12.5.0 sparse
um          randconfig-r2307-20261012    clang-22   sparse
um          randconfig-r2308-20261013    clang-19   sparse
um          randconfig-r2310-20261013    clang-19   sparse
um          randconfig-r2310-20261013    gcc-9.5.0  sparse
x86_64                   allmodconfig    clang-22
x86_64                    allnoconfig    clang-24
x86_64                          kexec    clang-22
x86_64       randconfig-2000-20261012    gcc-14
x86_64       randconfig-2000-20261013    gcc-14
x86_64       randconfig-2001-20261012    gcc-14
x86_64       randconfig-2001-20261013    gcc-14
x86_64       randconfig-2100-20261012    clang-22   cocci
x86_64       randconfig-2100-20261013    clang-22   cocci
x86_64       randconfig-2101-20261012    clang-22   cocci
x86_64       randconfig-2101-20261013    clang-22   cocci
x86_64       randconfig-2102-20261012    clang-22   cocci
x86_64       randconfig-2102-20261013    clang-22   cocci
x86_64       randconfig-2103-20261012    clang-22   cocci
x86_64       randconfig-2103-20261013    clang-22   cocci
x86_64       randconfig-2104-20261012    clang-22   cocci
x86_64       randconfig-2104-20261013    clang-22   cocci
x86_64       randconfig-2105-20261012    clang-22   cocci
x86_64       randconfig-2105-20261013    clang-22   cocci
x86_64       randconfig-2200-20261012    gcc-14     smatch
x86_64       randconfig-2200-20261013    gcc-13     smatch
x86_64       randconfig-2300-20261012    gcc-14     sparse
x86_64       randconfig-2300-20261013    gcc-14     sparse
x86_64       randconfig-2301-20261012    gcc-14     sparse
x86_64       randconfig-2301-20261013    gcc-14     sparse
x86_64       randconfig-2302-20261012    gcc-14     sparse
x86_64       randconfig-2302-20261013    gcc-14     sparse
x86_64      randconfig-r2102-20261013    clang-21   cocci
x86_64      randconfig-r2104-20261012    gcc-10.5.0 cocci
x86_64      randconfig-r2105-20261012    gcc-10.5.0 cocci
x86_64      randconfig-r2107-20261012    gcc-14     cocci
x86_64      randconfig-r2202-20261013    gcc-14     smatch
x86_64      randconfig-r2301-20261013    clang-22   sparse
x86_64      randconfig-r2302-20261013    gcc-8.5.0  sparse
x86_64      randconfig-r2303-20261013    gcc-8.5.0  sparse
x86_64      randconfig-r2304-20261012    clang-24   sparse
x86_64      randconfig-r2304-20261013    gcc-8.5.0  sparse
x86_64      randconfig-r2306-20261013    clang-24   sparse
x86_64      randconfig-r2308-20261012    clang-22   sparse
x86_64      randconfig-r2308-20261013    clang-24   sparse
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                   rhel-9.4-bpf    gcc-14
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                 rhel-9.4-kunit    gcc-14
x86_64                   rhel-9.4-ltp    clang-22
x86_64                   rhel-9.4-ltp    gcc-14
x86_64                  rhel-9.4-rust    clang-22
x86_64                  rhel-9.4-rust    clang-22
xtensa                    allnoconfig    clang-24
xtensa                   allyesconfig    clang-20
xtensa       randconfig-2000-20261012    gcc-8.5.0
xtensa       randconfig-2000-20261013    gcc-16.1.0
xtensa       randconfig-2001-20261012    gcc-8.5.0
xtensa       randconfig-2001-20261013    gcc-16.1.0
xtensa      randconfig-r2101-20261012    gcc-13.4.0 cocci
xtensa      randconfig-r2102-20261012    gcc-13.4.0 cocci
xtensa      randconfig-r2103-20261012    gcc-15.2.0 cocci
xtensa      randconfig-r2104-20261012    gcc-9.5.0  cocci
xtensa      randconfig-r2104-20261013    gcc-14.3.0 cocci
xtensa      randconfig-r2105-20261013    clang-22   cocci
xtensa      randconfig-r2107-20261013    gcc-14.3.0 cocci
xtensa      randconfig-r2301-20261012    clang-24   sparse
xtensa      randconfig-r2303-20261012    clang-24   sparse
xtensa      randconfig-r2306-20261012    gcc-16.1.0 sparse
xtensa      randconfig-r2307-20261013    gcc-9.5.0  sparse
xtensa      randconfig-r2309-20261012    gcc-16.1.0 sparse
xtensa      randconfig-r2309-20261013    gcc-10.5.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

