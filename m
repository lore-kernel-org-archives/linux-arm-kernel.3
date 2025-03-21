Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02356C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 18:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FO+6WGOaMw0ibKCiJIW30sXNuwvLPQXpKREpykWvmkc=; b=W2a5aoSljWZK1bMOKmbmGkgxfC
	exnzPzrHpL433kcQqCy+io+o2bZRRagB90zVbZX+J3U6oJH+kYv3XXxFwkzs0otgaAED/fi+MvYiz
	AIsQztA5zk9A4oV/i4s/ma9+VYDILlHhK56KXOM9gpBif2n6gVs0/HxxtMTlJY9VBWFbFExWjAN4V
	z2ALaNDIU4im5yaJkoMVt7/PT4yAaf6rGAYbrLEbiqafQ6MEqRxya8xMsUCgXBJUBpZOStgLiwXjl
	PQaqsKYgfCdDPdzHf6I4wfcdPPxWBuijkJ9s7zXvm3xG5FzUwYXI0StcNWF3wmU3frP2dtiBgxduL
	Zy0YNVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhDF-0000000FsEY-0vT2;
	Fri, 21 Mar 2025 18:35:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvh9N-0000000FrFX-2DYr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 18:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742581881; x=1774117881;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=y6EGF/mxSagxfgbYKqdWkLT4HZXwRDQ3HIzuXaFUuQk=;
  b=M528O1iH+ooLNlWJFg5yKHUcMt0KiC+V7Hxb0WGFbhr6YIVDAblMajJR
   pxzN5GRTtD4n62zKoeg8mjIULS5pJ82PgondS7DptKD5ZYUH1Y1tVIJmr
   tLBjJGdeo8atG9qaAzgELgvEyvHxXBB1UgahQhKUL7LJnhGZf9xKD5AZa
   QOg7wmndT6XrWWQvN3+6544lizKS6VyhiGs4HxiYr8QuK8kxqD2uq4TcS
   lN1DngL7GMsEvdi4MXZ4TYCIEcZSo2+qt1mF6cMq7F2OXl0xnvI5YaQPq
   z/r7aTY9nGhoRBCu3aW8CmODZriIScif9Nf979sFKoWBuAQfb5hCqHcCJ
   Q==;
X-CSE-ConnectionGUID: gQPSrGhKQx2Z1+/IyfiO9g==
X-CSE-MsgGUID: gH5rVErNQWa27YBPGKghrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47515769"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="47515769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:31:20 -0700
X-CSE-ConnectionGUID: D5bEjmkNTHSv0JQpi2zF2g==
X-CSE-MsgGUID: qgxBRvGqQjucbOdMzLh+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="128298920"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2025 11:31:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvh9I-0001ad-1X;
	Fri, 21 Mar 2025 18:31:16 +0000
Date: Sat, 22 Mar 2025 02:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 24/26]
 drivers/platform/cznic/turris-signing-key.c:25:50: error: parameter name
 omitted
Message-ID: <202503220206.LHWsolYc-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_113121_603075_6D7568C9 
X-CRM114-Status: UNSURE (   8.28  )
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

Hi Marek,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   cf2ae5e5b68b06b4c8bceb42d46fa311e6db9a60
commit: ba8755ab541fc629948233125db870d4dbf00a75 [24/26] firmware: turris-mox-rwtm: Add support for ECDSA signatures with HW private key
config: arm-randconfig-002-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220206.LHWsolYc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220206.LHWsolYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220206.LHWsolYc-lkp@intel.com/

Note: the soc/soc/drivers HEAD cf2ae5e5b68b06b4c8bceb42d46fa311e6db9a60 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/platform/cznic/turris-signing-key.c: In function 'turris_signing_key_instantiate':
>> drivers/platform/cznic/turris-signing-key.c:25:50: error: parameter name omitted
    static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
                                                     ^~~
   drivers/platform/cznic/turris-signing-key.c:25:64: error: parameter name omitted
    static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
                                                                   ^~~~~~~~~~~~~~~~~~~~~


vim +25 drivers/platform/cznic/turris-signing-key.c

0b28b7080ef5a32 Marek Behún 2025-02-04  24  
0b28b7080ef5a32 Marek Behún 2025-02-04 @25  static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
0b28b7080ef5a32 Marek Behún 2025-02-04  26  {
0b28b7080ef5a32 Marek Behún 2025-02-04  27  	return 0;
0b28b7080ef5a32 Marek Behún 2025-02-04  28  }
0b28b7080ef5a32 Marek Behún 2025-02-04  29  

:::::: The code at line 25 was first introduced by commit
:::::: 0b28b7080ef5a323c3afa3860c3d45d627629830 platform: cznic: Add keyctl helpers for Turris platform

:::::: TO: Marek Behún <kabel@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

