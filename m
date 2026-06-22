Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE897CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 18:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IR6fQ5lxbbd6noh81fKunB8bdAIwH/+Zw5g3Od9T+p0=; b=PdFmK2Bpjksrzv4S5PzUlGwob/
	PkH8G+zpgp17hQYEjr8XINOh9hyLY9yeoZoDtjEvATDDxW0vh4tKfmb0/6mbjax6bZ9YIFG7BjDip
	MrYAJAw0BiCuV0qdZPRgyeuepvbvYppn51LO1e8P63JXuMv7smxOLztvcERLlCGxvowpad55HHVv7
	pvycNmj5nZAV0EOAY7b+YiRA/wCj17/qVX9yIWTkeTtQpj0+0GHtFR/UvNi3eBJdVA1Op753SwLx7
	MTE+kVl7ydwKD6br7zTMWseYy1KIX9VlQF6Cl6Akh/z8p1HipT9yqlzq9HC9ATvokLTXEWl5gGkyn
	EgZ13Zew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjdf-00000005IwV-02ah;
	Mon, 22 Jun 2026 18:44:55 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjdb-00000005IwC-48uF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 18:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782153892; x=1813689892;
  h=date:from:to:cc:subject:message-id;
  bh=n5k7KeuH1MhX3lHxkT2dnx9v8gAqKPg2u6LPMluRvyE=;
  b=D5tr6k6CHAjApqa50inzaC4aZCwJpL/q1qfiyqv9pT1DFou/hIImqpW7
   asF+pd7GnWNJRCXcVWw1p304DHzaigEOfyjpYzSVLllJCd8kjLTBwods8
   0ccH2sS++B0bLpeKkZCDC8Uduv4S8u+bS5axLgWGj2K46yZSBZMYD91no
   vt6CMPeRvtFfkh3NncuRLNJVsQGTD6sMyUJnuxknjQFEqDQCxuuqeXhvh
   e4OmDeBXIXWK7ePpUNUVADKHYSMlcd/zTQBU74P4jWMDWcMNUr+njoSoN
   +/eBobslhIpUfr3VZAmIwpEndPgQKgjV7bZw6NtN1aRlHRZaaYa5UvE4W
   g==;
X-CSE-ConnectionGUID: bf2tGv2ITx+s+NqilPOALg==
X-CSE-MsgGUID: CATMJfFRQZKSCsnJpXbZXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83003289"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="83003289"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 11:44:51 -0700
X-CSE-ConnectionGUID: AA2ifrgkRaGQqLRwBXoj8w==
X-CSE-MsgGUID: 8RIypeH+Qy6OyN51JvUZBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="245165278"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2026 11:44:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbjdB-000000001jT-2PZy;
	Mon, 22 Jun 2026 18:44:42 +0000
Date: Tue, 23 Jun 2026 02:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-power-domains-v7.1] BUILD REGRESSION
 10278e18bc5a61397cb538310a6388075a4f21dd
Message-ID: <202606230255.rEhNEYL4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_114452_052806_3F57E314 
X-CRM114-Status: UNSURE (   4.37  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-power-domains-v7.1
branch HEAD: 10278e18bc5a61397cb538310a6388075a4f21dd  ARM: dts: ux500: Remove DB8500 EPOD regulators

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606180825.vUSQntkJ-lkp@intel.com

    include/linux/mfd/dbx500-prcmu.h:408:19: error: redefinition of 'prcmu_abb_read'
    include/linux/mfd/dbx500-prcmu.h:413:19: error: redefinition of 'prcmu_abb_write'
    include/linux/mfd/dbx500-prcmu.h:424:19: error: redefinition of 'prcmu_config_clkout'
    include/linux/mfd/dbx500-prcmu.h:486:19: error: redefinition of 'prcmu_ac_wake_req'
    include/linux/mfd/dbx500-prcmu.h:491:20: error: redefinition of 'prcmu_ac_sleep_req'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- arc-allyesconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- arm-randconfig-004-20260622
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- arm64-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- i386-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- i386-allyesconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- loongarch-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- loongarch-randconfig-001-20260622
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- loongarch-randconfig-002-20260622
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- mips-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- mips-allyesconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- powerpc-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- powerpc-randconfig-002-20260622
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- powerpc64-randconfig-001-20260622
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- riscv-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- riscv-allyesconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- sh-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- sh-allyesconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- sparc64-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- um-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- um-allyesconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- x86_64-allmodconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- x86_64-allyesconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
|-- xtensa-allyesconfig
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
|   |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
|   `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout
`-- xtensa-randconfig-001-20260622
    |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_read
    |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_abb_write
    |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_sleep_req
    |-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_ac_wake_req
    `-- include-linux-mfd-dbx500-prcmu.h:error:redefinition-of-prcmu_config_clkout

elapsed time: 952m

configs tested: 148
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260622    gcc-15.2.0
arc                   randconfig-002-20260622    gcc-9.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260622    gcc-13.4.0
arm                   randconfig-002-20260622    clang-23
arm                   randconfig-003-20260622    gcc-8.5.0
arm                   randconfig-004-20260622    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260622    gcc-8.5.0
arm64                 randconfig-002-20260622    gcc-13.4.0
arm64                 randconfig-003-20260622    gcc-8.5.0
arm64                 randconfig-004-20260622    clang-22
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260622    gcc-13.4.0
csky                  randconfig-002-20260622    gcc-11.5.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260622    clang-23
hexagon               randconfig-002-20260622    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260622    gcc-14
i386        buildonly-randconfig-002-20260622    clang-22
i386        buildonly-randconfig-003-20260622    gcc-14
i386        buildonly-randconfig-004-20260622    gcc-12
i386        buildonly-randconfig-005-20260622    gcc-14
i386        buildonly-randconfig-006-20260622    gcc-14
i386                                defconfig    clang-22
i386                  randconfig-011-20260622    gcc-14
i386                  randconfig-012-20260622    clang-22
i386                  randconfig-013-20260622    gcc-14
i386                  randconfig-014-20260622    clang-22
i386                  randconfig-015-20260622    clang-22
i386                  randconfig-016-20260622    clang-22
i386                  randconfig-017-20260622    clang-22
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260622    clang-18
loongarch             randconfig-002-20260622    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260622    gcc-8.5.0
nios2                 randconfig-002-20260622    gcc-8.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260622    gcc-14.3.0
parisc                randconfig-002-20260622    gcc-12.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260622    gcc-8.5.0
powerpc               randconfig-002-20260622    gcc-8.5.0
powerpc64             randconfig-001-20260622    clang-21
powerpc64             randconfig-002-20260622    clang-20
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260622    clang-23
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                  randconfig-001-20260622    gcc-14.3.0
s390                  randconfig-002-20260622    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260622    gcc-13.4.0
sh                    randconfig-002-20260622    gcc-15.2.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260622    gcc-16.1.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260622    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                        randconfig-001    gcc-12.5.0
sparc64               randconfig-001-20260622    gcc-16.1.0
sparc64                        randconfig-002    clang-20
sparc64               randconfig-002-20260622    clang-23
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                             randconfig-001    clang-23
um                    randconfig-001-20260622    gcc-14
um                             randconfig-002    clang-23
um                    randconfig-002-20260622    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260622    clang-22
x86_64      buildonly-randconfig-002-20260622    clang-22
x86_64      buildonly-randconfig-003-20260622    clang-22
x86_64      buildonly-randconfig-004-20260622    clang-22
x86_64      buildonly-randconfig-005-20260622    gcc-14
x86_64      buildonly-randconfig-006-20260622    clang-22
x86_64                              defconfig    gcc-14
x86_64                randconfig-002-20260622    gcc-14
x86_64                randconfig-011-20260622    clang-22
x86_64                randconfig-012-20260622    clang-22
x86_64                randconfig-013-20260622    gcc-14
x86_64                randconfig-014-20260622    gcc-14
x86_64                randconfig-015-20260622    clang-22
x86_64                randconfig-016-20260622    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260622    gcc-16.1.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260622    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

