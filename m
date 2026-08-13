Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B9DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h1fHvtb7fc3SSSgI4nvnupEMVYdR1FPIs35EZWCiDUM=; b=vm+Tc4uIAWWITwN8M1I0PNKNIP
	pEcL0MXnN6plEdFb3g1cUsWMb+DMkzzn/0AjY+L7BOIG/SntZA0/4Jbr3sh01RRKV4b0RdaQAwcFV
	wEkK0wlOQFmtRkDYKLnDJR9qhnye3SlJRJWrZQ2mduSk1FKIfkQNJD9+kFnRRbi2+9696uCY6DqJx
	y4dG7if5kSJl87fSu8daGDpwXoF6lXjNjZAjTj141YPLyKcjliwyRHq8f3EOsOvJ98Hhwe4Bf18b4
	K3U2MdUOXWAgT+z2LJYfqBNuNBsO+sLmbitvsaG9WbLUIS/XIul81/K+ZztjQm7U1c+9aRtfhZnyo
	aXYQx8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuapa-00000001Qs6-2qnb;
	Thu, 13 Aug 2026 19:11:10 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuapX-00000001Qrg-2Zaz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 19:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786648268; x=1818184268;
  h=date:from:to:cc:subject:message-id;
  bh=wdHdZwwpV5RZCxc2KqwnolCtqoyqGiW2xPxD69WOPGA=;
  b=dX0osvBzKhhJBneRHmbrXQj0cimjRLztAsSCMTjUNtk4As39pbInnQ9l
   93r8C7aybwslohXq6gMYh/T3u4uDf4aKCgoqd8jBAllLR/yCiJJuP+mZy
   sSL+hv9m6af1tgQ7qlG0Wotx5FO3hI2In/naYrl9LgNzuSnJkmR8VdcPV
   aMdyYFsVJDSgp/2UAH9AKYd4KjniF//qtc6Ld+9rR5Ce56CYTzPn9yRIk
   e6aoXsNKFHx5nmahtSaPNrq3ZLPruyJTlirs+Cm/zR5xFZezjw/lykzrC
   QU83xfR1ihmhbrqr6YE1x8qsOsuPfnjr5qT3SvcjuaH1ZLMrKtfOy8pY6
   A==;
X-CSE-ConnectionGUID: RNytruc9Qze9BJ01AaDINw==
X-CSE-MsgGUID: z6ClxUSSTDmkmjIdWB7ldA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87448410"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87448410"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 12:11:07 -0700
X-CSE-ConnectionGUID: 1AMT7ZswS0yNjX6zyq7bHA==
X-CSE-MsgGUID: 25eXQ5hhSgWNT16KcNvD3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="268294146"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 12:11:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuapT-00000000WI2-0EaQ;
	Thu, 13 Aug 2026 19:11:03 +0000
Date: Fri, 14 Aug 2026 03:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 1cc747bb4cde2a7c8323422c0ff92e87236837b0
Message-ID: <202608140342.NV6KIr1L-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_121107_686393_AEEA0092 
X-CRM114-Status: UNSURE (   5.30  )
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
branch HEAD: 1cc747bb4cde2a7c8323422c0ff92e87236837b0  soc: document merges

elapsed time: 740m

configs tested: 14
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-16.1.0
alpha         allyesconfig    gcc-16.1.0
alpha            defconfig    gcc-16.1.0
arc           allmodconfig    gcc-16.1.0
arc           allyesconfig    gcc-16.1.0
csky          allmodconfig    gcc-16.1.0
i386          allmodconfig    gcc-14
loongarch        defconfig    clang-24
mips       rb532_defconfig    clang-24
nios2         allmodconfig    gcc-11.5.0
nios2          allnoconfig    gcc-11.5.0
parisc        allmodconfig    gcc-16.1.0
parisc        allyesconfig    gcc-16.1.0
parisc           defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

