Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B374FC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 21:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ZHCiuA9SyNehqCl/yWQslSvMUuWPQOBh7jJjIntDac=; b=MnvyNhWaPdYwPPCUI39AzDy/fU
	UpNM6UL/WFBUzEmL4hfQLTkrXCcDjU2Dw3rBr6FBB5x/1LSWvu62Gm07NLiYH/2rWX72du5Vymnax
	nL9Jo3h/Js5jrV1ee2qLll5NmZbWFVDVsw8LCw8HXzlN5nJVTetH8jDov/Pz+VF/HJV8esG1YkgB+
	hUNY8W9Vz3G9k7Ol7r7qzAVIc/x5LhzzlmMSSfCgVU5MwMk2rJEn+M0Rufkgu8D7u+aCmenRJ/7Kv
	6qVcdMrp5H0xHIeDoVjy3lLgaCh5nYJiObolgiKMn2Fxwf5jZUGJknRbt9jgTDPuhHVveLvy6EVmJ
	eHemC/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wviFj-000000056O2-2tci;
	Sun, 16 Aug 2026 21:18:47 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wviFf-000000056Nc-40Di
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 21:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786915124; x=1818451124;
  h=date:from:to:cc:subject:message-id;
  bh=BKHaEXRzagv9Hwz2NHksp9OSi74XM3X5jnihbEGshu0=;
  b=F+69FxxcR5wcctE3UuSDbakgawugNS1Io6Qz/3dU8ouY+iCHiEuLAa7Q
   kT1hmIMWP3RokQXmm6SyeEEljCo2YJlpCWw7JOrA95EMR8rzyBxehUIQX
   HnHsJ2LX8IiURkx33F+TICK6zU1FrDabNHTBouZgsJImTTYlnR5T7/6uD
   2lyxrSIy31o9dQQIYonnOOfqyI2PYP5oV1Q//vtwVSvO02f9YTcPWv1Gq
   qJJXxrtyqKDmtkD1lgAbAmywQJBBSu6JWIVhB3h5samyfhvSpDtFLfJCX
   9RDCX8EjGhov3Vem8NBHajHtfZW62b96wDktM0tTkzcWImTIi/9Fazb6v
   Q==;
X-CSE-ConnectionGUID: O19aKglaS9yNV1iPI+3Lkw==
X-CSE-MsgGUID: 9lQqosSRR5WMC3oHt4E3eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="74930719"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="74930719"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 14:18:42 -0700
X-CSE-ConnectionGUID: X8iHqja2S8eWjgZc+X3lXA==
X-CSE-MsgGUID: lEL85rqKTB6ibPcVCKsr3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="258526561"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2026 14:18:41 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wviFa-00000000d6u-18i6;
	Sun, 16 Aug 2026 21:18:38 +0000
Date: Mon, 17 Aug 2026 05:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 156/217] Warning:
 drivers/spi/spi-davinci.c:128 Excess struct member 'dma_event_q' description
 in 'davinci_spi_platform_data'
Message-ID: <202608170511.e4bYe4sq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_141844_055211_8F0335E0 
X-CRM114-Status: UNSURE (   8.44  )
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
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 6cc451353fcbdefe9d376e72702743c6dc202a1c [156/217] dma: ti-edma: remove platform data based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608170511.e4bYe4sq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170511.e4bYe4sq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170511.e4bYe4sq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/spi/spi-davinci.c:128 Excess struct member 'dma_event_q' description in 'davinci_spi_platform_data'
>> Warning: drivers/spi/spi-davinci.c:128 Excess struct member 'dma_event_q' description in 'davinci_spi_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

