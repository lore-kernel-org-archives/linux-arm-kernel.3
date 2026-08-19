Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27014C5DF8B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ixxqXnFRiSCqD8aKNfAMlkdlRIjcOAF9GM9fkkh9u2g=; b=QZpo5PDp+u+XCu2RO8Zqmoha3m
	6xqZAmrYgs31khvmsN1vbCKSvMpR8T/5fDevXIjIpo36v3Fk3JdO49TFVsQJeDEsp0VhXHyTvXzz4
	cMAdzAJb93WYAKY3fmRhbMY7ZHrbrRkiVMAj/gZEoXDYSOXfxch1Z6cbGvBzNXgfWJWK2fanWu9gI
	d9JH39g5VFrbjmVSKtY/fky1aMpECaPOOF0HTO7nszvhz6FWcecmeHNjKNSNdauFWpNB8/oYjpPcd
	/dBJ7Z3mJZOpAZzOeGtwb1UU/3oC7huqhn2mIX5skpblgPcgfjnApyya4arPPeYZ8GbDVvMFSsadW
	YfCQ97sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcjS-00000009QY3-1gzG;
	Wed, 19 Aug 2026 09:37:14 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcjP-00000009QXl-2EJV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787132232; x=1818668232;
  h=date:from:to:cc:subject:message-id;
  bh=Pkk56UhXNUwuMiFfh3EkZyfbky2uzihOpy+35lWnefQ=;
  b=esM19kcVKGNcDqo0amQUQiRucYHEGyLpQKlIf+7wSrTSw0GoKZKOZn1a
   IulWkzD8dZlyS8CgdLW/KSlVXpFgDfo4V9KZRCZHJz58WAHZleYuaxeg4
   7nhL7vAc0Ef1VwAS9tsGV/KpS6AJJlegbv6N4R8OvSgqyceUJqiBKs/DB
   SnRFDe0wvIhwPgPVG0n67QcxxgEG4xay6HwCExi7YOMnizQCadq63QnGk
   HMyx2P42qKMAPGBvQWF2SOhIv7W5+Ajfv/Az142HMPSou/PwjNa5e9uov
   GUxI6RQoKNE6aWRPRF/JumruZa2XbOP+Cgw3AW1KYqO5qTSmvwZVrnF9n
   w==;
X-CSE-ConnectionGUID: 1cm1rFcJRGazO9BGMMCGfg==
X-CSE-MsgGUID: D0n1b//LS++3g8DZDQ5LXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99167647"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="99167647"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 02:37:11 -0700
X-CSE-ConnectionGUID: RrccwPsOQVW3qKgEvqbr+Q==
X-CSE-MsgGUID: 0e6tHwiFT/OLL3Z75l4D1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="295405398"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 02:37:10 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwcjL-000000007Mf-0MO4;
	Wed, 19 Aug 2026 09:37:07 +0000
Date: Wed, 19 Aug 2026 11:36:34 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 198/200] htmldocs:
 Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to
 nonexisting document 'hwmon/max197' [toc.not_readable]
Message-ID: <202608191100.NpT4Y8jp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_023711_721521_897CFA0B 
X-CRM114-Status: UNSURE (   8.77  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: ac9888639e961ae0a4bceac5a00698724ae1a940 [198/200] remaining driver removal
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260819/202608191100.NpT4Y8jp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191100.NpT4Y8jp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to nonexisting document 'hwmon/max197' [toc.not_readable]
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.


vim +19 Documentation/hwmon/index.rst

7ebd8b66dd9e5a Mauro Carvalho Chehab 2019-04-17  18  
7ebd8b66dd9e5a Mauro Carvalho Chehab 2019-04-17 @19  .. toctree::

:::::: The code at line 19 was first introduced by commit
:::::: 7ebd8b66dd9e5a0b65e5ee5e2b8e7ca382ec97b7 docs: hwmon: Add an index file and rename docs to *.rst

:::::: TO: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

