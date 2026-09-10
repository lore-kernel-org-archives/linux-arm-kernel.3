Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA42C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a08lPSUvZ8lZT8zatO7K7zebCInFK73mDaRGqbExaEY=; b=2/HkuNU4dMzx0IadCeZ7jHJDZR
	eVSSqRVLaEPTj0gfTHfjeR4V4+k8eOTEmda42D7TJUfs0s5OKgMxiqfY+kwjoUyfZIWBVfB76q+sJ
	JWd5Txb6W4FdvFMrBm7UKndb6IZpi2MI1VnsBkzm+w2JqUn4kxQIKWaPLxgcjueaYg/t7Iyd+wSE4
	oJ16oTCiXscr7gtIe1uG4DDc7v85twBN1YwvgNu4eWynRbPKLu9+/YXTOiSFsN4srP7ZRzk4FfZEC
	VJ1+vJsX38br2mtqasHeDGfzuX2+/UCFuo9G4Bncu2GR1cfIZsOVbJj3ZQp4Y/6XwVex7RWZ2z9ld
	t1CsMIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gw7-0000000EqdL-2WVy;
	Thu, 10 Sep 2026 15:43:39 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gw3-0000000EqbE-2jw2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789055016; x=1820591016;
  h=date:from:to:cc:subject:message-id;
  bh=5P2jzA5UZkBsomcq5bHV593HrYG61GtysrVHIr93b5U=;
  b=nqDFfho6Bg0jg8h+Z2Z7leVbPaKV1gAL7jj36OtNTP7vAMVAc66y+0Fh
   BggucQuDyC6AgkZbDF/hJlj77RAYct/2NuUKh64WXtfQIPAr4FhGRdxgQ
   +/yHHQ4P1yVAmQUK2nwq270b3jX4uW35nQEZNnj4J80/lub/lKAvIP0DG
   cGi0srWvWLomq/q7j+ec+RoEqyocrtD3FkKdVfzyF6BcQKBi7BxUcQY9M
   sx5tiRAk/La5D2AOfOFUN42jUasxfEYMQ5b+p3E+nzlSabeywkLKr7nyz
   kCisJXrIWbZOk1tqTozhJ2xMxoc/dLAngyUk0kQjZ+IABWPQo00poIuo+
   A==;
X-CSE-ConnectionGUID: GvyAmQ5TSFeISYBCmVM4gw==
X-CSE-MsgGUID: P0PVReF/R3atx+Ifz/rPpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112280563"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="112280563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:43:33 -0700
X-CSE-ConnectionGUID: FExfs9QnR7i08oPefr3OtA==
X-CSE-MsgGUID: nSJnzOXAT72Nr14sKowNOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295152011"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 08:43:32 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gvy-000000000RZ-0F9H;
	Thu, 10 Sep 2026 15:43:30 +0000
Date: Thu, 10 Sep 2026 17:42:35 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 226/294]
 drivers/mtd/spi-nor/core.c:1178:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202609101040.gBAHTWoN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_084335_738419_20041B5F 
X-CRM114-Status: UNSURE (   9.23  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 62e3b560c8fdcab6be5dce819f3b76df95cd95dc [226/294] mtd: spi-nor: remove controller_ops support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609101040.gBAHTWoN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101040.gBAHTWoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101040.gBAHTWoN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/core.c:351:6: warning: unused variable 'ret' [-Wunused-variable]
     351 |         int ret;
         |             ^~~
>> drivers/mtd/spi-nor/core.c:1178:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1178 |         if (!spi_nor_use_parallel_locking(nor))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1184:9: note: uninitialized use occurs here
    1184 |         return ret;
         |                ^~~
   drivers/mtd/spi-nor/core.c:1178:2: note: remove the 'if' if its condition is always false
    1178 |         if (!spi_nor_use_parallel_locking(nor))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1179 |                 mutex_lock(&nor->lock);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
    1180 |         else
         |         ~~~~
    1181 |                 ret = wait_event_killable(nor->rww.wait,
   drivers/mtd/spi-nor/core.c:1176:9: note: initialize the variable 'ret' to silence this warning
    1176 |         int ret;
         |                ^
         |                 = 0
   drivers/mtd/spi-nor/core.c:1242:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1242 |         if (!spi_nor_use_parallel_locking(nor))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1248:9: note: uninitialized use occurs here
    1248 |         return ret;
         |                ^~~
   drivers/mtd/spi-nor/core.c:1242:2: note: remove the 'if' if its condition is always false
    1242 |         if (!spi_nor_use_parallel_locking(nor))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1243 |                 mutex_lock(&nor->lock);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
    1244 |         else
         |         ~~~~
    1245 |                 ret = wait_event_killable(nor->rww.wait,
   drivers/mtd/spi-nor/core.c:1240:9: note: initialize the variable 'ret' to silence this warning
    1240 |         int ret;
         |                ^
         |                 = 0
   drivers/mtd/spi-nor/core.c:1309:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1309 |         if (!spi_nor_use_parallel_locking(nor))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1315:9: note: uninitialized use occurs here
    1315 |         return ret;
         |                ^~~
   drivers/mtd/spi-nor/core.c:1309:2: note: remove the 'if' if its condition is always false
    1309 |         if (!spi_nor_use_parallel_locking(nor))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1310 |                 mutex_lock(&nor->lock);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
    1311 |         else
         |         ~~~~
    1312 |                 ret = wait_event_killable(nor->rww.wait,
   drivers/mtd/spi-nor/core.c:1307:9: note: initialize the variable 'ret' to silence this warning
    1307 |         int ret;
         |                ^
         |                 = 0
   drivers/mtd/spi-nor/core.c:1333:6: warning: unused variable 'i' [-Wunused-variable]
    1333 |         int i;
         |             ^
   drivers/mtd/spi-nor/core.c:2579:6: warning: unused variable 'ignored_mask' [-Wunused-variable]
    2579 |         u32 ignored_mask, shared_mask;
         |             ^~~~~~~~~~~~
   6 warnings generated.


vim +1178 drivers/mtd/spi-nor/core.c

74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1173  
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1174  int spi_nor_prep_and_lock(struct spi_nor *nor)
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1175  {
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1176  	int ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie  2014-02-24  1177  
74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28 @1178  	if (!spi_nor_use_parallel_locking(nor))
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1179  		mutex_lock(&nor->lock);
74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1180  	else
74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1181  		ret = wait_event_killable(nor->rww.wait,
74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1182  					  spi_nor_rww_start_exclusive(nor));
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1183  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie  2014-02-24  1184  	return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie  2014-02-24  1185  }
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie  2014-02-24  1186  

:::::: The code at line 1178 was first introduced by commit
:::::: 74df43b3f626a3594a4de50556048852bf2753f7 mtd: spi-nor: Enhance locking to support reads while writes

:::::: TO: Miquel Raynal <miquel.raynal@bootlin.com>
:::::: CC: Tudor Ambarus <tudor.ambarus@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

