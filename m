Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62478C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 02:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qKbzXHXT3NPOzM+GaCrINdQmgZH49bCs2X6oSxN8iRU=; b=v1fYM5qoCvNQE326dlveHUBwJM
	ZVJl4erPn1KYeUU24P8hwh+CrrACmMXFFP6dLvWRAJQjRM+an74U/qlhd1iu+3JGMx0GOMV+8jgIv
	dRALwLBvIca4AzJyWBt9hhNa9nW6QKY9pSTwMUa7SZccdF8BojmWhrVSl/qEjLsDAP2UAL+MtCRX7
	k3MqyzwdSLe0Zjm32RAbZ/HIrdN4TWp40BNEAZk7PaxxEBVzKvl7U532RQU9HOeeUN8J5gfP+Zxbe
	38gTKKv0/yt71GYIbBHmEKjeieyDest+3tz8cDw3HhQB2Cb5JnrsasQasTxMXlf9qOpVDILjOHh4H
	EoIYx1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvSOA-0000000DiLK-1Aw6;
	Fri, 21 Mar 2025 02:45:38 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvSKu-0000000Di3x-0ZNd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 02:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742524936; x=1774060936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6fFZB10S4y9KoN6y15XmXrUds/vJgH0OB+XZq8/nlVw=;
  b=MBXmG+kikgcOM5GNfChsPbB5gXglGEyxCz53WVwMalFl2WR/IveZ+Hi5
   xKk7D0pAfIMCs0RswYwjhVmSevyAyGjAjGiXQT1xqYacQC43XO0Cv0bR7
   RkS/3nTV4xA8j8BQ8hBa6sXFMdgOoPORyuPFZxTp/T3F/o2tU5kW6/HHK
   GxVNUsVe9YNZa3gbBLZml+WgPnjvW+7GNUcfbNnBVHQ0bKWefZLRTnkRa
   rUEsL6j5mCG1LBSNXJ8Jypu3fHAyHDx5RTrYTBhLGPj26tNgUz7hZeP7V
   8WvdYAbRTL/u5r3/Wp7PGa4n20I5qU+s3FCd7W81X2EScTM1B1xg+QwiR
   g==;
X-CSE-ConnectionGUID: kFfJqvIgSVil41KdSVq2zQ==
X-CSE-MsgGUID: axNjIOj1Rpe+TQXJMn5F2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54418808"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="54418808"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 19:42:13 -0700
X-CSE-ConnectionGUID: O3l+moyTRTmAGrZ8q7doLg==
X-CSE-MsgGUID: 70qIrQzPQlqrIEC82XlqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="154171389"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2025 19:42:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvSKn-0000xb-1U;
	Fri, 21 Mar 2025 02:42:09 +0000
Date: Fri, 21 Mar 2025 10:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 20/24] ERROR: modpost: "__ffsdi2"
 [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
Message-ID: <202503211029.DnQpqsJs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_194216_183518_1643D180 
X-CRM114-Status: UNSURE (   7.05  )
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
head:   ba8755ab541fc629948233125db870d4dbf00a75
commit: ee7f8ed72990f28657b5bf598e695fcf4633f4ed [20/24] platform: cznic: turris-omnia-mcu: Refactor requesting MCU interrupt
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211029.DnQpqsJs-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> ERROR: modpost: "__ffsdi2" [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

