Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43146C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DJCqmjpS4fm359F2hkk16qcXnlsHPzOmkdoKZ+VCRm8=; b=JnuD2JchOG/G+GCAxrjh4jjvu7
	Hp+f1djEtbjLuLgIvKlIruGjtw0dAKEr11iMN9eFg9cJq950CEUugV+vdsgmBip6XwC/MeFMwUk/j
	7eDooufnZzOYzZh7DwY/PA1lYmcGMgLngNUoQekkVL9hKTEeuvmsLUWnsvjvwZi7puAwwzacpPmz3
	/A0dYNmKq81oRGkujejG2SaXPtrkPQ1/gt5czdN3apYxzYbJNQqPY0wnZ+R1Zy3qjWULMuR+zX8BP
	2LpxYcKNMmPCNtvAnb4xMtgj55lUtKYNspxRyXUw3rKkdDTTE/DEGBHq1AgphMricwkQsAcqLLOWI
	uYh82jSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaAJ-0000000Afpc-2ICB;
	Mon, 12 May 2025 20:54:23 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEa6A-0000000AfHm-3XSh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 20:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747083006; x=1778619006;
  h=date:from:to:cc:subject:message-id;
  bh=WMB0YIQD6P09j/2Zk+As6J08ouz/4Gt66YRTqIlMJhw=;
  b=kTHnCKtLHBlhBIrS38lVdWdFoCx1njxHUFk5UM532KdEOvKnV89eo1VW
   c9TkJ2j+ofRglSEBNyc9kOwgCFQnJcg/OjJTT10L5dfon9G+QXsrJd/C1
   reLZ63WGyjpnvmeZZnbNIF+nWbLh3R2NBd9mIb46uB3YuqCVz0bgtEje0
   tgINxTGr/w+Y7ebXPf3MjPzbSxqQCm3/mnQa5AThnJLtM0oWjd1IWh/9z
   0T7ed2jPQerfuJ2Ywp+d6mSY1vv/DTcajjJVQqHNcN2B/pGOD0Dh8zsor
   FR1AU/Tt7vCBSWbheCMPQcQQ/ZGV8e2oaQk8lBJwZsNMgTBEt1eyC0VXQ
   g==;
X-CSE-ConnectionGUID: t8nGlH0eQBOYSeQ0I1uk0Q==
X-CSE-MsgGUID: Od3WDwYjQ12QCx0IUC9RwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74299196"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="74299196"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 13:50:06 -0700
X-CSE-ConnectionGUID: gdIIs1NfSRKdNsU8pKh67g==
X-CSE-MsgGUID: ixUVNJdNRZufyfs7Qh5IzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137894356"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2025 13:50:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEa67-000FPa-0G;
	Mon, 12 May 2025 20:50:03 +0000
Date: Tue, 13 May 2025 04:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:omap/dt] BUILD SUCCESS
 550e5608c25e0a886da1182386a6477f49caf2b7
Message-ID: <202505130403.uGvKPY4W-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_135006_896651_49838A49 
X-CRM114-Status: UNSURE (   5.38  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap/dt
branch HEAD: 550e5608c25e0a886da1182386a6477f49caf2b7  ARM: dts: am335x: Set wakeup-source for UART0

elapsed time: 724m

configs tested: 8
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm             allmodconfig    gcc-14.2.0
arm              allnoconfig    clang-21
arm             allyesconfig    gcc-14.2.0
arm  randconfig-001-20250512    gcc-7.5.0
arm  randconfig-002-20250512    clang-17
arm  randconfig-003-20250512    gcc-6.5.0
arm  randconfig-004-20250512    clang-21
arm      versatile_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

