Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F20BCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40rL0fPKzTuViz2gkXTyTAo+dJXubNEK7r+Z6rN+J6M=; b=SL03trCqAiNAmENQ6G5rf2cW6b
	+0vWsxDQhDj1FJ28Wgc61S20lwAcli2xKcDXWKXsMjzuvJO/5nXG2M3nQeOWDzAMKng1AsO/JY9AF
	yMoh4fsd75aRRnW53shIcCT0qWiIt3UIFJlWpfEDz1voRqkKMJxfJ6BHx4UXlZK4HKHnQNK8p7vc6
	FbO5+v20woo66FlEGpthgYFl2uzJYd7NYtEx5xNmWctUXPzijob+Ud3X5gw95UMYDbz8NQgjNDW5Q
	i1uJReXRxuP8Un1vPXbHjwADw7DoLasSYPsKzVkhJkpsk3c4mazkAeBcdaxJp3WAKRNs85XA0vVHP
	r7P8JVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAWF-00000004m4T-0dQF;
	Mon, 15 Sep 2025 14:49:27 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAWC-00000004m3U-2rL1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757947764; x=1789483764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qzDJZ6MIVaKjCDoPQ7eYvhjd24ErbN5nstetVspBJWE=;
  b=VE8GyxXxq/FV/RpLCULRoNM9QGPYv+oZiDnKrHhuTWIyw3lDx4mqO+c9
   XuE92JgeAmhsn17QSWfkjye+VRgWuqO865Qw7EccZBQ7sL2g/UaO5rEGs
   Wnly/bbXVaJRiDWtLjr/AfX29Q4mVgUtnuxt4/FYZdrKpakUSINpOCr7Z
   TXksXk9eufvRRIeWqt29ToyAtCgcMCV1+gzxwrcjaL88X0VnbTYuDZB6j
   bU6StducQbE0lg/9dcpEvJmZxFFLlXq3dcIlt7EkhNY+xbBjKXSiaH5U1
   u+AGt/CQ1VCFradttV0oj5Upr6MzC+xnA0RwtLJ7rtmLyb2j9lYB+XrKQ
   Q==;
X-CSE-ConnectionGUID: FV27I/OYQ06n3Ut89dd9eQ==
X-CSE-MsgGUID: E8nqPJzlQqyVUB/9vVAXbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="62837290"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="62837290"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 07:37:03 -0700
X-CSE-ConnectionGUID: icW+tYUUQeqOVdgjfXiksg==
X-CSE-MsgGUID: wUiI5kB1Sm6pIh+A7sUphA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="174477461"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2025 07:36:59 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyAJp-0000Jn-0W;
	Mon, 15 Sep 2025 14:36:37 +0000
Date: Mon, 15 Sep 2025 22:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan.Wanner@microchip.com, claudiu.beznea@tuxon.dev, sre@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	linux@armlinux.org.uk
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: at91: PM: implement selection of LPM
Message-ID: <202509152248.NjJj2xwQ-lkp@intel.com>
References: <e72d9af1326cf44888059270263afde875ccc994.1757519351.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e72d9af1326cf44888059270263afde875ccc994.1757519351.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_074924_761762_7CEE1809 
X-CRM114-Status: GOOD (  15.15  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on cbeznea/tests linus/master v6.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Wanner-microchip-com/dt-bindings-power-reset-atmel-sama5d2-shdwc-add-lpm-binding/20250911-002354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/e72d9af1326cf44888059270263afde875ccc994.1757519351.git.Ryan.Wanner%40microchip.com
patch subject: [PATCH 2/4] ARM: at91: PM: implement selection of LPM
config: arm-randconfig-r131-20250915 (https://download.01.org/0day-ci/archive/20250915/202509152248.NjJj2xwQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509152248.NjJj2xwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509152248.NjJj2xwQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mach-at91/pm.c:283:75: sparse: sparse: Using plain integer as NULL pointer
   arch/arm/mach-at91/pm.c:1101:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void ( *static [assigned] [toplevel] at91_suspend_sram_fn )( ... ) @@     got void [noderef] __iomem * @@
   arch/arm/mach-at91/pm.c:1101:30: sparse:     expected void ( *static [assigned] [toplevel] at91_suspend_sram_fn )( ... )
   arch/arm/mach-at91/pm.c:1101:30: sparse:     got void [noderef] __iomem *

vim +283 arch/arm/mach-at91/pm.c

   271	
   272	static int at91_pm_prepare_lpm(unsigned int pm_mode)
   273	{
   274		struct platform_device *pdev;
   275		int ndevices, i, ret;
   276		struct of_phandle_args lpmspec;
   277	
   278		if ((pm_mode != AT91_PM_ULP0 && pm_mode != AT91_PM_ULP1) ||
   279		    !soc_pm.shdwc_np)
   280			return 0;
   281	
   282		ndevices = of_count_phandle_with_args(soc_pm.shdwc_np,
 > 283						      "microchip,lpm-connection", 0);
   284		if (ndevices < 0)
   285			return 0;
   286	
   287		soc_pm.data.lpm = 1;
   288		for (i = 0; i < ndevices; i++) {
   289			ret = of_parse_phandle_with_args(soc_pm.shdwc_np,
   290							 "microchip,lpm-connection",
   291							 NULL, i, &lpmspec);
   292			if (ret < 0) {
   293				if (ret == -ENOENT) {
   294					continue;
   295				} else {
   296					soc_pm.data.lpm = 0;
   297					return ret;
   298				}
   299			}
   300	
   301			pdev = of_find_device_by_node(lpmspec.np);
   302			if (!pdev)
   303				continue;
   304	
   305			if (device_may_wakeup(&pdev->dev)) {
   306				if (pm_mode == AT91_PM_ULP1) {
   307					/*
   308					 * ULP1 wake-up sources are limited. Ignore it if not
   309					 * in soc_pm.ws_ids.
   310					 */
   311					if (at91_pm_device_in_list(pdev, soc_pm.ws_ids))
   312						soc_pm.data.lpm = 0;
   313				} else {
   314					soc_pm.data.lpm = 0;
   315				}
   316			}
   317	
   318			put_device(&pdev->dev);
   319			if (!soc_pm.data.lpm)
   320				break;
   321		}
   322	
   323		return 0;
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

