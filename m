Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCE7C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 22:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X616LNffJX61eGVtKm2Wzr50WBE8zSwiZ6ynHACc3pE=; b=OLr3efZdGIzGvpxYmRlokxYOv9
	kmagXOTuuWlTWQVp+fPHHdOreBl7SPZiHnG2STYuBTtAV82hYvUjCNQf+VOYHQ93V5X5YbhXktpgU
	ChxEjZcragOgCUXTsUSC6BJ+Ztk/id17Ejxa0CsapbCVc8qtnksrBZFZwPx9eMHCbuGWr8TJjfOfY
	ArP79QAaWQkzgEV1ZqiWJj0kYZide5u6VilSO7ADkjkPC5Y+/GUAPmGbPl/j2czZJ52D2Ez1IlRhP
	0U3GmXkPDiYhf0jgUX1XdJg7YEoEemTyJKzvBAP1+VkqYpZUx1tNPaGKFhVWhPSehybsP5PBcZYQV
	vZAwZcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3LYt-00000005cHO-0crO;
	Sun, 06 Sep 2026 22:42:07 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3LYn-00000005cH3-0EIa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 22:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788734521; x=1820270521;
  h=date:from:to:cc:subject:message-id;
  bh=/w1BvM7k1p0Lc9Q4/rR58TXn5R6mjByZwzMQRMXBPxY=;
  b=RZ+D8r24Qw/UW9jSTLW+zaSy7GduAz92KlCwTR6nb3EKATVN5w6dNvUu
   MKwPL6fazgoibogeQUg0Kc9KBm5hcQm46lSoLEeHgbpR8mTdToaDzByaF
   ieIFkgSW6VhrV5i8S9NsOsYzQPNEtOVp1yMbFODC3hGBaF9ee1fEWU2AO
   /9vHlWbDbrMLowLKjEV7oH43faVewZl3Td5+SJr9ZmIrQbRMMt7Ym8oxT
   tnbQVYj05m3fNlxiJRyP/CpcCu2iLHvlgRM+Lf+mRtfYKP7bNWNIrszpp
   rZMdYbqjoVfc7Vkj0PFc9UHFZazhiHhE9ZoJfhZmXaWEpG4ggnS7gqWRO
   A==;
X-CSE-ConnectionGUID: YYNIdlpFT5CXiUbPbprclQ==
X-CSE-MsgGUID: 9kETubhiSFGJEHLpHpoWAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100498551"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="100498551"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 15:42:00 -0700
X-CSE-ConnectionGUID: 503KZoB3RSGELIFVCJPsTA==
X-CSE-MsgGUID: CR8ILGd1RJqkJ6jZf3g/QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="274065179"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2026 15:42:00 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3LYj-000000002nl-0sr1;
	Sun, 06 Sep 2026 22:41:57 +0000
Date: Mon, 07 Sep 2026 06:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-simple-sound] BUILD SUCCESS
 9094aef897221bdd693c237c024520bb16251849
Message-ID: <202609070634.pTLqu5k3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_154201_150865_B7E1D797 
X-CRM114-Status: UNSURE (   5.60  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-simple-sound
branch HEAD: 9094aef897221bdd693c237c024520bb16251849  ARM: config: u8500: Enable the simple audio card

elapsed time: 4364m

configs tested: 51
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
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
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

