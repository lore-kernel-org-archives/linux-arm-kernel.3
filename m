Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A619AC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9qQAfDKsDpauUcJ2ugkIzK+VsIcTqlo0ZRRuaL50+IM=; b=Oe5HXKdbRqc5TAS+2d0XRnAnXM
	m77c1XR/wiY03+30+s+0VZmELBwvW0jg6SMhfjEx1434ZaIwVY1AKlYfOQliWkwPM1YcqoCTCiFTF
	Lj0Qx2Mcnit7anVrasP35pDvCRLtDIvdBRBXpPoIm/OR+modfUhexbyj13WrsZd40BYU+4Wfbssrq
	zJrUh7OHwP1eSKOBaTJ6rJD1YE81ElbZwH06BAE1arZtRYx+oNUL1/Fi1+U1rSjixeoIAFh52MYRx
	7QDPlYScIIb4sUJ0leDYz3evbfjR97aKlvi1dkcdfyxHa9pHQ9HSF9vMaFHcNRK1NZduGtj8jCy0R
	8tkDmnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4guD-0000000Epq6-0h8L;
	Thu, 10 Sep 2026 15:41:41 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gu6-0000000Eplb-36kj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054895; x=1820590895;
  h=date:from:to:cc:subject:message-id;
  bh=2H0BaQZW3/2fCxOelZ1flWFV1S4q9DoZ90tBtqKdjec=;
  b=ChKOubvmv8E4CFpqZpCGjUzY5QeWC1h5RlcoB7OHMTjMMnGlER/Dj59M
   HsxMU9qKD0LYT5fwXcwgyd7mB+Qg3a36hJmu0WmD+059VV/hJmu58MD2d
   dJD885gb/NnarFCIp+dCsCMATXz9vHAk+CC7F51V1zT4FQ2UPfJT1kYB6
   qeiiVso1Pwk8jk+Oarc1z+u5LBF6Yz4H360wvS1rmDxkl1e9qSZL/HaZ1
   VDCCSX18wTBZOGqc7eYZMKvOU89zNlDRLS2LyOVMFaByTarXKy1C9XMQv
   4ZN1d6L0o48bnQjGDEVfVWwO2VpXE0wDV3AVpWyaVcWsDlnnGByHtCLXF
   g==;
X-CSE-ConnectionGUID: f2jkmBFQSl2eZAqiSTpwVA==
X-CSE-MsgGUID: 9maE4mbfQ6upXCzS7yjC6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77066962"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77066962"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:33 -0700
X-CSE-ConnectionGUID: mSwTgU3qQdSJxn5ehk+KXA==
X-CSE-MsgGUID: TOkkE6nERvK0VE4xuxUv4A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000Qi-1bTu;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:40:58 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 170/294]
 drivers/rtc/rtc-stm32.c:795:13: warning: 'stm32_rtc_clear_events' defined but
 not used
Message-ID: <202609100500.VDsB697w-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_084134_807884_830F63A3 
X-CRM114-Status: UNSURE (   8.84  )
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
commit: 99ab6d2408a83752e16a39683a743c131f3d5cb3 [170/294] rtc: stm32: remove mcu support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100500.VDsB697w-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100500.VDsB697w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100500.VDsB697w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-stm32.c:795:13: warning: 'stm32_rtc_clear_events' defined but not used [-Wunused-function]
     795 | static void stm32_rtc_clear_events(struct stm32_rtc *rtc,
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/stm32_rtc_clear_events +795 drivers/rtc/rtc-stm32.c

4e64350f42e2ce Amelie Delaunay 2017-01-11  794  
02b0cc345c2a1b Amelie Delaunay 2018-05-17 @795  static void stm32_rtc_clear_events(struct stm32_rtc *rtc,
02b0cc345c2a1b Amelie Delaunay 2018-05-17  796  				   unsigned int flags)
02b0cc345c2a1b Amelie Delaunay 2018-05-17  797  {
02b0cc345c2a1b Amelie Delaunay 2018-05-17  798  	const struct stm32_rtc_registers *regs = &rtc->data->regs;
02b0cc345c2a1b Amelie Delaunay 2018-05-17  799  
02b0cc345c2a1b Amelie Delaunay 2018-05-17  800  	/* Flags are cleared by writing 0 in RTC_ISR */
02b0cc345c2a1b Amelie Delaunay 2018-05-17  801  	writel_relaxed(readl_relaxed(rtc->base + regs->isr) & ~flags,
02b0cc345c2a1b Amelie Delaunay 2018-05-17  802  		       rtc->base + regs->isr);
02b0cc345c2a1b Amelie Delaunay 2018-05-17  803  }
02b0cc345c2a1b Amelie Delaunay 2018-05-17  804  

:::::: The code at line 795 was first introduced by commit
:::::: 02b0cc345c2a1b7f1c590796a02d84e49e51ded0 rtc: stm32: rework register management to prepare other version of RTC

:::::: TO: Amelie Delaunay <amelie.delaunay@st.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

