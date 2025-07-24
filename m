Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D6AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 01:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c5+d9Egidv/a1yFuUAzEWvY5Ntl1Jygw54WvCaRmnv8=; b=PkoQA+FvFiKcDMmJkDruhCK24B
	CTE9Sq1ipPmeuDgKj6+aSbWkJEUk73QJDGlqUrdvmkTE+uELY/tcSbsjVLDsGxYgqo42bLcGuEoN5
	c17C9CXRhCxdVC4cuJs+IQD8yEQDGrVkQsQjqeayS7qSR4jYQzA5fU5BzbzOvU8LEa+lGH0z7rpHq
	bL7Ct+AWhGhfIxq7vPWZu8CyZNIOb7c0bO3VmtihHtruum/zV94XhHSEWWDQOip6QLV01W/pUqMuS
	FWU5SNiOcyKtoPrdJlr0WA+zbT3yDJn7MurVQWSzQER0V518+ntEs4GN7uxM6qHkidzjYZ1OzKOcy
	RzHMYxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uekMg-00000006Gzh-43ty;
	Thu, 24 Jul 2025 01:03:18 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uekKF-00000006Gnq-2c9P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 01:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753318847; x=1784854847;
  h=date:from:to:cc:subject:message-id;
  bh=uphJFXX2koaRGllz+pKFF3hDz8hb9LNZr7F1sP4Uii0=;
  b=MjVq9Dx6ZpMg6BcnE4cnjkFPoSBRynPb/XvHO7YBiu/f5AVqYLpFsEma
   5GlnOvvQKmCX7rHB99WbmtWmLkSt+MfkOmPi9l3MUu93L88LCYSjg8b7q
   nXysnHYanyE5AKOkvMTcph9/NeTTSTgk/q/EFUKNzH1MPFX5mC7934Y6A
   9jVriRUKxLD9PBrPdYETbkujzJ8vA3pSUjlOKCLCuuBuyRKsOGSNW+RQl
   AfD5TKp4FGMmougmd96FCLrIyrYrAvu2xKwZR82DJ41hQOEFPhz5wUH3a
   T0zvaHybeMK9X/KRMvdcSudWi6d3Cosq40tyyl0dkYzvvXjpekumu5q7h
   w==;
X-CSE-ConnectionGUID: 2C65SP5FQjmwqc6wBNDgWA==
X-CSE-MsgGUID: E7SRo9tlRyqws4koshgieg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55577964"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="55577964"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 18:00:45 -0700
X-CSE-ConnectionGUID: wwZKqAlRT62AFCnbrVLWsA==
X-CSE-MsgGUID: ukNLDHeiS6uylsZ/VvEX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="190792606"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2025 18:00:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uekK9-000JyF-2x;
	Thu, 24 Jul 2025 01:00:41 +0000
Date: Thu, 24 Jul 2025 08:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 8c1f5a11dad0a9043c17c4c0240f394e481baca6
Message-ID: <202507240838.kI3hb54i-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_180047_730674_F9EE2E69 
X-CRM114-Status: UNSURE (   5.18  )
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
branch HEAD: 8c1f5a11dad0a9043c17c4c0240f394e481baca6  Merge tag 'v6.17-rockchip-arm32-1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/arm

elapsed time: 1097m

configs tested: 13
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20250723    gcc-13.4.0
arm    randconfig-002-20250723    gcc-13.4.0
arm    randconfig-003-20250723    clang-16
arm    randconfig-004-20250723    clang-22
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20250723    clang-22
arm64  randconfig-002-20250723    clang-16
arm64  randconfig-003-20250723    clang-16
arm64  randconfig-004-20250723    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

