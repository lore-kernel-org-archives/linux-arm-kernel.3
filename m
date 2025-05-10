Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1664DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 23:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eVWLOfjR9Qr8p8a9DlJ6yvG3cR1nI3sbSaaK2eS4+pE=; b=uJo5zGPIart5SGWGpJOkHDrvOD
	/ZCgDclMVc1WsIP1DkLmCUXBXNZlq+eroB9LprbG+ouCZVBFIBVkEkpP2f7Iy4tgnOBeyl+ucEiCY
	M5tQYJonkgZpknLZriS/+cziVG3AlR5ZhrGHxdkU/R+N3RXSC6ChzYwQR4Ld55SUomjm005YdoNxC
	NRWcX0rwZsIoxyzLK5qqCxbXwjOJdOr9HaTWlj2f5IowkIlEhZn1UO96C3+qgjWHO9aDmYEwdsFOJ
	L+ycQL6WQxnylXGieFAijq/ipYU8EePC1ENZcTerctueL3KgCFarn0OzIXvSD7gk4HR/23LAd0iHc
	AVKzO4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDtkT-00000006Una-3XSH;
	Sat, 10 May 2025 23:36:53 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDtiL-00000006UhB-1dVb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 23:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746920081; x=1778456081;
  h=date:from:to:cc:subject:message-id;
  bh=dcbnjm4Yq4ZaLYfTx0XMh1VRjdpM7/X4MN0Bd2d5lLo=;
  b=V8VDl0eEUUArvAq9t2K3AVq0mw4BS6/ez0q6SRsujOPJgSwVCkzt/HXo
   5fx0NbmFN+/O0o6aZergFd4aPgBrcD03NLOh4ca14vqyElfr7K2pf29Yl
   S6wVk3ZutEPVq0OvdBBB3dPHobqOtB3h/EC80cex3V88rBtL7EGSMq+Bj
   d823JGdQgsbHMSEnC1LuL8XuKwZHFBLbe47ZS37FGHuIwps/hEC4zojt8
   ktwlEUoU1aAqNCpWWttTA1iiasdw4Ng0h4mOBYOm0LJ8fqfj+bI2eAkKI
   dWV0CBwyvB3+Fc2yr7t3vJgWyNyIcVu9RuwGlsIrZSv9BEumG6ZeCsdXf
   g==;
X-CSE-ConnectionGUID: fmVn7mobQ1eA4S1mCnKq8g==
X-CSE-MsgGUID: M+8kgI8HSr6wTgrHK0qBGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="66271646"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="66271646"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 16:34:35 -0700
X-CSE-ConnectionGUID: OlHZG0xdSmOiFexJ70m6rg==
X-CSE-MsgGUID: GsWkenWsQ9+g9YhTDuKi2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="136929825"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 May 2025 16:34:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDtiB-000DTB-32;
	Sat, 10 May 2025 23:34:31 +0000
Date: Sun, 11 May 2025 07:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 a6e160ead8e7fc8d22ed16cff721c05723c38926
Message-ID: <202505110747.DiZpwG3N-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_163441_466734_21C6C9B8 
X-CRM114-Status: UNSURE (   4.96  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
branch HEAD: a6e160ead8e7fc8d22ed16cff721c05723c38926  Merge tag 'arm-gpio-set-conversion-for-v6.16-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into soc/arm

elapsed time: 774m

configs tested: 13
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                  allmodconfig    gcc-14.2.0
arm                   allnoconfig    clang-21
arm                  allyesconfig    gcc-14.2.0
arm       randconfig-001-20250510    gcc-10.5.0
arm       randconfig-002-20250510    clang-21
arm       randconfig-003-20250510    gcc-10.5.0
arm       randconfig-004-20250510    gcc-7.5.0
openrisc              allnoconfig    clang-21
parisc                allnoconfig    clang-21
powerpc               allnoconfig    clang-21
riscv                 allnoconfig    clang-21
s390                  allnoconfig    clang-21
um                    allnoconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

