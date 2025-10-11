Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676D1CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 03:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jDVuHMgHwQp4m5cd9mOgd8iCeqeSIO4Vb9udCzHEu0=; b=Trk0TWfXhwW2HaCEuYNjLWXCm0
	4tDWn7PYFwpGXVIHTeUyHffTCUADv2+QSi2FG9NmzZzoDXjdQ0clNEbruC0W1p3Lp//rRO4g83+2j
	QDR53PD5MgbThD7TZkChPOweg9LCJWkWI90WROvK62QSeQ4O1TC931ipgh+Zn2/jLefYVoR06F1Yl
	LphKwFQXV66DB9cXagJfDCXBa7CiWzXTInDs9I9H74mx7ggMnjLEH+qvHkBioeL8iaVpTZ/3/msCz
	iR7zNwGJPk0OqNhVVksZbeQSYB2VTqvJX7ObtU9kfo4/BTBmLCRi0ZX9sUGosuWGBwlEKaWHG2MIh
	1jmd1mRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QSx-00000009lPO-2Mxj;
	Sat, 11 Oct 2025 03:40:19 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QSt-00000009lOn-3aJc;
	Sat, 11 Oct 2025 03:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760154016; x=1791690016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p/Sw6hsNG/Asjp0JRAo06u1WUs6i3eDXjAUi4btbFE4=;
  b=HkajbDfxrtAaJ9qvqevOoKTK0yoKuHrVAK1HPXUQZhhcNhpAum002J8v
   BKfDFsu4Zn1K6Lkg5ZSg3H5f8wDx2NcTTGwczI1WFdQX34lkGASRBaIe5
   V9jn0oC2J8R0aHBBRNBTtMiLE9gmBHfUUxs6dlADV6bBQE6OJ/n5veEEd
   jaCoo4mtj0c9wUV6qY/7hxjpTkFiC196/GjJiqQl2LzMHcV7wDKD2TJTa
   N89Ti6QsMm7qhwITDPNSnkM+PEja05Tbpfeq5RuB6guRL4dhqcwIADtTM
   T9rHeWApjiRhrAtlN1bR8EeMCzpMClWUn3n6CCxG4CTOjg/9NnVXU83TS
   g==;
X-CSE-ConnectionGUID: tV9wv4qjTJ2Kf2Sxk4ySCg==
X-CSE-MsgGUID: WYqsvdT9RZWnLg12d864LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73476879"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73476879"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 20:40:11 -0700
X-CSE-ConnectionGUID: SsZEgcbATqSz7rgWvti7/A==
X-CSE-MsgGUID: oc8A357CSaCUSoyqDnPI5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180236749"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 20:40:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7QSh-0003UX-1s;
	Sat, 11 Oct 2025 03:40:03 +0000
Date: Sat, 11 Oct 2025 11:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 1/4] usb: dwc3: Add Google SoC DWC3 glue driver
Message-ID: <202510111335.oyOAs9MB-lkp@intel.com>
References: <20251006232125.1833979-2-royluo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006232125.1833979-2-royluo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_204015_971583_22DEFCAA 
X-CRM114-Status: GOOD (  11.01  )
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

Hi Roy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e5f0a698b34ed76002dc5cff3804a61c80233a7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Roy-Luo/usb-dwc3-Add-Google-SoC-DWC3-glue-driver/20251010-092651
base:   e5f0a698b34ed76002dc5cff3804a61c80233a7a
patch link:    https://lore.kernel.org/r/20251006232125.1833979-2-royluo%40google.com
patch subject: [PATCH v1 1/4] usb: dwc3: Add Google SoC DWC3 glue driver
config: s390-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111335.oyOAs9MB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111335.oyOAs9MB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111335.oyOAs9MB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-google.c:467:12: warning: 'dwc3_google_resume' defined but not used [-Wunused-function]
     467 | static int dwc3_google_resume(struct dwc3_google *google, pm_message_t msg)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-google.c:441:12: warning: 'dwc3_google_suspend' defined but not used [-Wunused-function]
     441 | static int dwc3_google_suspend(struct dwc3_google *google, pm_message_t msg)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/dwc3_google_resume +467 drivers/usb/dwc3/dwc3-google.c

   440	
 > 441	static int dwc3_google_suspend(struct dwc3_google *google, pm_message_t msg)
   442	{
   443		if (pm_runtime_suspended(google->dev))
   444			return 0;
   445	
   446		if (google->dwc.current_dr_role == DWC3_GCTL_PRTCAP_HOST) {
   447			/*
   448			 * Follow dwc3_suspend_common() guidelines for deciding between
   449			 * a full teardown and hibernation.
   450			 */
   451			if (PMSG_IS_AUTO(msg) || device_may_wakeup(google->dev)) {
   452				dev_dbg(google->dev, "enter hibernation");
   453				pm_runtime_get_sync(google->usb_top_pd);
   454				device_wakeup_enable(google->usb_top_pd);
   455				dwc3_google_enable_pme_irq(google);
   456				google->is_hibernation = true;
   457				return 0;
   458			}
   459		}
   460	
   461		reset_control_bulk_assert(google->num_rsts, google->rsts);
   462		clk_bulk_disable_unprepare(google->num_clks, google->clks);
   463	
   464		return 0;
   465	}
   466	
 > 467	static int dwc3_google_resume(struct dwc3_google *google, pm_message_t msg)
   468	{
   469		int ret;
   470	
   471		if (google->is_hibernation) {
   472			dev_dbg(google->dev, "exit hibernation");
   473			dwc3_google_disable_pme_irq(google);
   474			device_wakeup_disable(google->usb_top_pd);
   475			pm_runtime_put_sync(google->usb_top_pd);
   476			google->is_hibernation = false;
   477			return 0;
   478		}
   479	
   480		ret = clk_bulk_prepare_enable(google->num_clks, google->clks);
   481		if (ret)
   482			return ret;
   483	
   484		ret = reset_control_bulk_deassert(google->num_rsts, google->rsts);
   485		if (ret) {
   486			clk_bulk_disable_unprepare(google->num_clks, google->clks);
   487			return ret;
   488		}
   489	
   490		return 0;
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

