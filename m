Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980DBD2D108
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fnp0Twvct/2YyZYn+SyZoiEx7nA/vBDFb7/prmNM1To=; b=ji3GfdFnEfn+PYadkH9BQUXQim
	0iL+IrYoLzGNVQnlx931vKNHHFih76mJqAv7LH98sOlzPRcgAsVyi+gECgTiqJJLyUjWckvGqkekc
	VY0ht3m7qVeT/R2myuiqrjiFXTKxkRrlv7nkujxIQ9Y+SOGtZAwLQDyb+gJQgPn5vSqDAPfgwzD0y
	Ef/CQRhsZU0jmNkgivCkd8oYkcumrHKJaDJ94n42t2LjMnXN95SaxBexxV6CmMNtSwX5AQY80FVZO
	FEbcd3qW+AzABMg2j4jF5Y87IwJubUfB0jNBrOMjp2v+v8iBU2sgFFah6qlUEWSIS+i/VO4NOU161
	CKS+YvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfexQ-00000007C1U-2qvT;
	Tue, 13 Jan 2026 14:01:16 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfexM-00000007C0w-1JYv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768312872; x=1799848872;
  h=date:from:to:cc:subject:message-id;
  bh=OE8i5lowkRkl33NdO65t+CqcmthaU4AkOQGojvrGkfs=;
  b=VH/S1XijRqnJN2bvtMxy4VF10vgP8kaZ1PyahBOJiAyLpiv5cXJcaIFQ
   ATO3tx/R1MeI7UXHy0IcXwExAu0IyHNNp02wE0o+FjVd9P+4IqPK7jwbP
   lSyOZuWZy17iqzbWJt059RL8ja4PXN3ES6F6T5fxmUnkhptzmKrQxjdoP
   yjxv58UsmEV1m6C7NvwCGU6ob9FGXAgDB2nUqfvoD0ETQV+7aUcS5IcyT
   6Ia8z5sCI+ZIPS+VTHgnGdQzC8zg0MNcvN9SuFg7IfRcG+ga5EzOCvDBy
   io5XMo/m25qLuk2yx9ARvDAgxPjPsgzFmjWs9fVjnEEA/jbKUtLxlPsBX
   w==;
X-CSE-ConnectionGUID: 1ZxvH1YqToWZP+C4LWSySg==
X-CSE-MsgGUID: Dj9m4T8CTU+zkE89wKZ2Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80315378"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80315378"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:01:12 -0800
X-CSE-ConnectionGUID: aO9kJJqMQ46bS/TtPVsQjQ==
X-CSE-MsgGUID: ib8WynI2TcaF0IIX5P5FUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204473594"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jan 2026 06:01:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfexI-00000000EsB-0fqF;
	Tue, 13 Jan 2026 14:01:08 +0000
Date: Tue, 13 Jan 2026 22:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 aa5f91ce4fd897d7fdc24521650b6de48e834c34
Message-ID: <202601132224.TgyBmuS1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_060112_362683_9313D130 
X-CRM114-Status: UNSURE (   5.62  )
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
branch HEAD: aa5f91ce4fd897d7fdc24521650b6de48e834c34  Merge tag 'renesas-dts-for-v6.20-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/dt

elapsed time: 8432m

configs tested: 54
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-22
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-22
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-22
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-22
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-22
um           allmodconfig    clang-19
um            allnoconfig    clang-22
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

