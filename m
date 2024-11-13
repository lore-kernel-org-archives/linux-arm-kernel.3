Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF3FD597DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 04:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f/P3hggPMaHjGHAylXVZdLP3hAJUklpac/712TVhjjw=; b=2Tz1dITUUYVWA+Q+RakW/2h0sN
	ruLXrW21i8Ruoza8lVQxvQ38CoPrOxxv6j/IM0s81xDjr9XsHCPnt/+R61ORl5TD2iKYSIXcM9KJb
	AwYisGkNI+bNym7Qi8afD1yC1x6wxtToEq89jLW0mBPFg0zqFvABAaLhNN6PcNo1kvKkPp+w1mhv4
	5vPR1c0HoD2HagPESO3U7Keiqr8eB1EPI3IpINKRjTjb5iwtZQphiEZKTteZS82zNnSHU2pR62+bl
	RrpIjIJiCsN0mhRhPGjREDy0UICaKb7XRys9mHUulR2TUhsx32n0wwjM1qvy2JqC0g0kA0+iCtrXa
	/g/Wu2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB4Z6-00000005hk3-0qsA;
	Wed, 13 Nov 2024 04:01:12 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB4XI-00000005hfn-3ff2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 03:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731470361; x=1763006361;
  h=date:from:to:cc:subject:message-id;
  bh=3IBVGJ6xyLvOiga1Z8t9ZD6wj3XF/37lIF5ZxTu4Qwg=;
  b=QKcGMo5CB+MOSoPqwjfJOg5MjXlzm7aVwKEKTerE1hlNO6HNHmhDnzDD
   XOxhDWWlqMcAHnXLbgfQJ03JZHKiDN7rNGHX9pmyIC9nAMGFg5YgIAwIq
   HA/V7I85Ym85ww9sABUSYVzrQjtfcwFG2TPhMOC0HiBKy9eTtyWXZRRW+
   TYYhQkKHS4hDfVvu2VEIjxGvtVcKCy2q172LV30qiZck/eiIOKEIKFNVz
   Vd1kpZkIS20lg0tzMisNssD6B+pjVnk5qUHU/78T6kQV5sZNfjXkm8V0G
   OVIb2M7nhra1UpOQOXbQu3YYw0GPh6j662PDG6oLlG02APffl7nSnJR4z
   A==;
X-CSE-ConnectionGUID: 7RHq/uPhQlKPdCJu48Q+MQ==
X-CSE-MsgGUID: /y3pLC9GSCeRgwra87gVJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48850681"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="48850681"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 19:59:16 -0800
X-CSE-ConnectionGUID: QbheDCwDQHmSPVpO1yNUUQ==
X-CSE-MsgGUID: 6d+v74vmQuqQl8/vf4Ko9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87858780"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2024 19:59:15 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB4XB-00002z-1I;
	Wed, 13 Nov 2024 03:59:13 +0000
Date: Wed, 13 Nov 2024 11:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 f335e0157717490e99145313871db789e8f10bd9
Message-ID: <202411131127.mFIG5ZB1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_195920_949408_3EABF777 
X-CRM114-Status: UNSURE (   5.77  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: f335e0157717490e99145313871db789e8f10bd9  platform: cznic: turris-omnia-mcu: Rename variable holding GPIO line names

elapsed time: 724m

configs tested: 72
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-14.2.0
alpha       allyesconfig    clang-20
alpha       allyesconfig    gcc-14.2.0
arc         allmodconfig    clang-20
arc         allmodconfig    gcc-13.2.0
arc          allnoconfig    gcc-14.2.0
arc         allyesconfig    clang-20
arc         allyesconfig    gcc-13.2.0
arm         allmodconfig    clang-20
arm         allmodconfig    gcc-14.2.0
arm          allnoconfig    gcc-14.2.0
arm         allyesconfig    clang-20
arm         allyesconfig    gcc-14.2.0
arm64       allmodconfig    clang-20
arm64        allnoconfig    gcc-14.2.0
csky         allnoconfig    gcc-14.2.0
hexagon     allmodconfig    clang-20
hexagon      allnoconfig    gcc-14.2.0
hexagon     allyesconfig    clang-20
i386        allmodconfig    clang-19
i386        allmodconfig    gcc-12
i386         allnoconfig    clang-19
i386         allnoconfig    gcc-12
i386        allyesconfig    clang-19
i386        allyesconfig    gcc-12
i386           defconfig    clang-19
loongarch   allmodconfig    gcc-14.2.0
loongarch    allnoconfig    gcc-14.2.0
m68k        allmodconfig    gcc-14.2.0
m68k         allnoconfig    gcc-14.2.0
m68k        allyesconfig    gcc-14.2.0
microblaze  allmodconfig    gcc-14.2.0
microblaze   allnoconfig    gcc-14.2.0
microblaze  allyesconfig    gcc-14.2.0
mips         allnoconfig    gcc-14.2.0
nios2        allnoconfig    gcc-14.2.0
openrisc     allnoconfig    clang-20
openrisc     allnoconfig    gcc-14.2.0
openrisc    allyesconfig    gcc-14.2.0
parisc      allmodconfig    gcc-14.2.0
parisc       allnoconfig    clang-20
parisc       allnoconfig    gcc-14.2.0
parisc      allyesconfig    gcc-14.2.0
powerpc     allmodconfig    gcc-14.2.0
powerpc      allnoconfig    clang-20
powerpc      allnoconfig    gcc-14.2.0
powerpc     allyesconfig    gcc-14.2.0
riscv       allmodconfig    gcc-14.2.0
riscv        allnoconfig    clang-20
riscv        allnoconfig    gcc-14.2.0
riscv       allyesconfig    gcc-14.2.0
s390        allmodconfig    clang-20
s390        allmodconfig    gcc-14.2.0
s390         allnoconfig    clang-20
s390        allyesconfig    gcc-14.2.0
sh          allmodconfig    gcc-14.2.0
sh           allnoconfig    gcc-14.2.0
sh          allyesconfig    gcc-14.2.0
sparc       allmodconfig    gcc-14.2.0
um          allmodconfig    clang-20
um           allnoconfig    clang-17
um           allnoconfig    clang-20
um          allyesconfig    clang-20
um          allyesconfig    gcc-12
x86_64       allnoconfig    clang-19
x86_64      allyesconfig    clang-19
x86_64         defconfig    clang-19
x86_64         defconfig    gcc-11
x86_64             kexec    clang-19
x86_64             kexec    gcc-12
x86_64          rhel-8.3    gcc-12
xtensa       allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

