Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F33C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A9M62P2+DdnpCIB6ELkqUnG30re4dJJC9FV65LoTKQo=; b=F+vSYWNDd5M2D9CT72zxfyrRz7
	p0YGNJPeoQ4hHy32w8RleiqELiGYAwy+R1novYn5Wtb4LTNDBzRWEYb6pAROcKdgtXkgV+2fRTByW
	e+ZNLtR4pCoKay3XlIjQm6eskluBrgxf1u5hGwwDdTVdlJygm3UwCrrwa3TKsFLMkAwQR63mf6L00
	sXYJteRgs7krnl2fOQLz7xur1R/40vYrCZtz6CDJIc/5qAtT+GFr1UL5RFrXLZ4A9YC6mExUBMvH0
	bTb8+lYw5qoKF8cYAx3N4wWsXhf2PV8M4+9UE1oDzHQ1v/MfuK8uZ5k4CS1Bj8ckBNSQeJg+dvsvs
	pTwQ00lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbeH-0000000F4R4-0YxD;
	Fri, 07 Mar 2025 17:38:13 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbYm-0000000F3PI-15sk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741368752; x=1772904752;
  h=date:from:to:cc:subject:message-id;
  bh=lrzKPw2R9WSQV3ewePo/gOul9d1h2Nxe8EfIZVldIM0=;
  b=QvrRfdxAiH57itjjYQ9UWeRL2JtbMEgXO2kBD3t3iN/mUD6O/xtOVm0i
   LHL8uiquu2rcOFLHBQaXF6/zY44AWTjoxdeMCxNFILDf/ig3fUTSPQcvC
   egk2ckLV3mA+Fs5TV2HcOtd2C8Jh6lEJBOTt7qWChZDN5j8enVmMOxeUi
   2jnqd3vbnEXc0lg+abs9LrBjpY9RhiiEuK0kp2/PqnEIxHpD7ZGOwvQQH
   UdQAxg+6IkUe/N8TCp+fZ3VBYeo+qCibLxFns3bLtqRKqntmU2TZbnFws
   lyhg40unHgzwp2oJI0eoN/jsRqIHEoHTrAwBc7jiPWV64AzsHOeQqsfLW
   A==;
X-CSE-ConnectionGUID: rDBWewijQu2B8bXzhmxgGQ==
X-CSE-MsgGUID: lGVnGv7zTGSv3inLeI3wdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46080683"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="46080683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:32:31 -0800
X-CSE-ConnectionGUID: Cr35A6/LTiujrz9Y+o89aw==
X-CSE-MsgGUID: vcvLIoF5Q1SWmrxlkOyNiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119206980"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2025 09:32:30 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqbYi-0000rR-0C;
	Fri, 07 Mar 2025 17:32:28 +0000
Date: Sat, 08 Mar 2025 01:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 f03f6e276bdd332a53118ed51b325c3367814267
Message-ID: <202503080154.xbfEQg8H-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_093232_382278_51F28824 
X-CRM114-Status: UNSURE (   5.51  )
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
branch HEAD: f03f6e276bdd332a53118ed51b325c3367814267  Merge tag 'renesas-arm-soc-for-v6.15-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/arm

elapsed time: 1450m

configs tested: 4
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm  randconfig-001-20250307    clang-21
arm  randconfig-002-20250307    gcc-14.2.0
arm  randconfig-003-20250307    clang-19
arm  randconfig-004-20250307    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

