Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72213CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vlJytSidKc8snvL5MKYl+dzduZrKLBbLsJ0Hnrp9Ig=; b=JshnPhdoTNbfWZMtQOoqzX8x3O
	1sfA9hPFr7atsBVJm5182+Qw62/G3pLbIQkzir6t3Q3P60r4vdk6F2x3qxHqCBiGE9LpKcNtTNmq+
	kjSFQovTC9q9G1n+1A68tY4JTv6uyIx+0yjDw1xIWBivM11aZV782Kld6OWkmf0kwQreFK9jeH+YN
	g8i1/E7ERQnCBwBj0e5RqPFd/NFCy02HXTBKkNWHEqBtJ+qIC0Vhwhu55UmxHlZz1Zh85Gihdtl2v
	KOJGi2Kq5G1jir/vtefBFyQlaz+GvFqyKwcH3xfC/rgkNv13JIK7W+dlLFSyWN2B8ousrs9vjC/Wd
	GJWem5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVWs-00000005VsR-1k3y;
	Thu, 14 May 2026 12:51:06 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVWq-00000005VrY-22MW;
	Thu, 14 May 2026 12:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778763065; x=1810299065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T6e1Sy8/8NgyzN/WXbmfEYNcRDAnhEjQBXWZGy3LDwE=;
  b=Rmd9myy/flWHh358IgFkWN/J1H7uG4wqyv8ieBOpBIFIpG2GHvHWSxNX
   JzznPaB6sjX1oRgkMLn7RtJTrdNz5akjv7+Wr6swg2kERqW6/kjPHCeP7
   J5ooeuKsk0os8wqcyCGp+QIGH8KjgCIY00MmNEZ4N/UWNq8Hgs2cfu1OU
   EkdeENfDapk/EdSOmP0pLTbAbqcJ+PeZtUrQv8Skr32whUFGCf4oAlSTv
   hR2SmplLvgxZAWSr58D8/HNRshUWoOISHNKvWejMzoZTqO6Sm0F5b6BoC
   90HRHOViaE+wwZeGWT9B2i2ef4157dAgnk2xioQPPuDn+aUFTkx0CzaPd
   w==;
X-CSE-ConnectionGUID: AffopVhGSiGoOu+UBWD4/A==
X-CSE-MsgGUID: 4/dF3KeXQfqLQ+HsP1oKlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90806964"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="90806964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 05:51:04 -0700
X-CSE-ConnectionGUID: OoEm0waPTuODUxq408AFCA==
X-CSE-MsgGUID: pz6o/H9EThWOPESAHnbf6A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2026 05:50:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNVWi-000000008ob-0WmY;
	Thu, 14 May 2026 12:50:56 +0000
Date: Thu, 14 May 2026 14:50:17 +0200
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, s-vadapalli@ti.com,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Zhang <18255117159@163.com>
Subject: Re: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link
 training
Message-ID: <202605141445.2Ag4i8fZ-lkp@intel.com>
References: <20260506152346.166056-9-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506152346.166056-9-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_055104_564042_20B25778 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a293ec25d59dd96309058c70df5a4dd0f889a1e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Zhang/PCI-Add-pcie_wait_after_link_train-helper/20260514-132815
base:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
patch link:    https://lore.kernel.org/r/20260506152346.166056-9-18255117159%40163.com
patch subject: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link training
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260514/202605141445.2Ag4i8fZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141445.2Ag4i8fZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141445.2Ag4i8fZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/hotplug/pciehp_ctrl.c:24:
   drivers/pci/hotplug/../pci.h: In function 'pcie_wait_after_link_train':
   drivers/pci/hotplug/../pci.h:73:17: error: implicit declaration of function 'msleep' [-Wimplicit-function-declaration]
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^~~~~~
   In file included from drivers/pci/hotplug/pciehp.h:21,
                    from drivers/pci/hotplug/pciehp_ctrl.c:25:
   include/linux/delay.h: At top level:
>> include/linux/delay.h:61:6: warning: conflicting types for 'msleep'; have 'void(unsigned int)'
      61 | void msleep(unsigned int msecs);
         |      ^~~~~~
   drivers/pci/hotplug/../pci.h:73:17: note: previous implicit declaration of 'msleep' with type 'void(unsigned int)'
      73 |                 msleep(PCIE_RESET_CONFIG_WAIT_MS);
         |                 ^~~~~~


vim +61 include/linux/delay.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  56  
f3f3149f35b919 Alok Kataria     2008-06-23  57  extern unsigned long lpj_fine;
^1da177e4c3f41 Linus Torvalds   2005-04-16  58  void calibrate_delay(void);
ad1a48301f659a Arnd Bergmann    2023-05-17  59  unsigned long calibrate_delay_is_known(void);
8496ecd0bed4c7 Valdis Kletnieks 2019-03-07  60  void __attribute__((weak)) calibration_delay_done(void);
^1da177e4c3f41 Linus Torvalds   2005-04-16 @61  void msleep(unsigned int msecs);
^1da177e4c3f41 Linus Torvalds   2005-04-16  62  unsigned long msleep_interruptible(unsigned int msecs);
e4779015fd5d2f SeongJae Park    2021-12-10  63  void usleep_range_state(unsigned long min, unsigned long max,
e4779015fd5d2f SeongJae Park    2021-12-10  64  			unsigned int state);
e4779015fd5d2f SeongJae Park    2021-12-10  65  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

