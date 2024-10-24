Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B228D10380
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 21:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2BChVIbZ2q7ifiiOeKthq7YCyppfKNI8HhcmImvUV8=; b=JtlxkqzFdLjVBeyfgheGUQyYGS
	LH1b4cZivMox9k+2b5VIEKfDF3Os3Z0fzcGcxPxUDxnIfkD6glxIcYep3SZQxAwQYGoGwpVXMStNw
	yavF8A/tnetl4YFE0aanlUmV2JcijtV4JlCfRgJ1qxpP7BYET/DWDnELMljIh5pp2fZkg/G4SF+So
	EIiLJYhSeczvkJzwluLD0vqLKfivoykdsoCBIwWfJL/iO8RjLBiIFugEDPltoOF70cSL7RJ8c88iV
	r/rrLH9ufpUsDxnjwjOhR7Bz+TK1MKjQ15EWH7phVbG1odXrxRVtObUlmrDsHhE9bHl65nmbErN/f
	WC6Mc0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t450G-00000001oTn-3ble;
	Thu, 24 Oct 2024 21:04:20 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44i1-00000001mBj-0s9d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729802729; x=1761338729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ucJbwvBiLsWRpla8htTc6H7ChqcVCWNJxbQadeAGzmY=;
  b=JqEfVHsfD3wzAinFJp89Z0ebYrFEWl0mrnJ9nsKAqy+IgyQf73s3Re1s
   NNXRYYWet0TUxViHvu3FkPPTJm2rIZhdkU+y7vCoNzz+1fC6UMlub6EXC
   ihLYMeg5796AnipK72483RGycCs6EBxU/FtJmnZSBQN38xazEuP5wSVAP
   ADlbCzXv0GyW8zLbO0Iu7pL7qNrDXjcLb5bIfOIlivZUAasbnwFfcIroY
   GKoVu2+hHA5uV39HA2qL4y5DHR/+/5lqhQRhkiMdctdunXDWmbhINJwE5
   RRQP1vj8QnVSrtde+3OjrGejDK0WFfTrtkW71ex1G9wjj5ddRtvFBPORC
   Q==;
X-CSE-ConnectionGUID: k0ckx3uQRRGfKqJfh3rMeg==
X-CSE-MsgGUID: 4xalPu7SSOaWsZ85qgVYqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40076654"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="40076654"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 13:45:26 -0700
X-CSE-ConnectionGUID: a80PQk+CTeWoZxyfSaCU0Q==
X-CSE-MsgGUID: A2lUjMM7QYCvJ0mjQUtLcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="84668190"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2024 13:45:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t44hr-000X8a-2u;
	Thu, 24 Oct 2024 20:45:19 +0000
Date: Fri, 25 Oct 2024 04:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dmitry.baryshkov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 3/3] clk: aspeed: add AST2700 clock driver.
Message-ID: <202410250433.GvMiJrDV-lkp@intel.com>
References: <20241023090153.1395220-4-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023090153.1395220-4-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_134529_316188_4195A530 
X-CRM114-Status: GOOD (  12.24  )
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

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on pza/reset/next lee-mfd/for-mfd-next lee-leds/for-leds-next linus/master lee-mfd/for-mfd-fixes v6.12-rc4 next-20241024]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-mfd-aspeed-support-for-AST2700/20241023-170434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241023090153.1395220-4-ryan_chen%40aspeedtech.com
patch subject: [PATCH v6 3/3] clk: aspeed: add AST2700 clock driver.
config: loongarch-randconfig-r054-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250433.GvMiJrDV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250433.GvMiJrDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250433.GvMiJrDV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/clk-ast2700.c:17:
>> include/soc/aspeed/reset-aspeed.h:14:5: warning: no previous prototype for 'aspeed_reset_controller_register' [-Wmissing-prototypes]
      14 | int aspeed_reset_controller_register(struct device *clk_dev, void __iomem *base,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/aspeed_reset_controller_register +14 include/soc/aspeed/reset-aspeed.h

1476d29e4461f6 Ryan Chen 2024-10-23   9  
1476d29e4461f6 Ryan Chen 2024-10-23  10  #if IS_ENABLED(CONFIG_RESET_ASPEED)
1476d29e4461f6 Ryan Chen 2024-10-23  11  int aspeed_reset_controller_register(struct device *clk_dev, void __iomem *base,
1476d29e4461f6 Ryan Chen 2024-10-23  12  				     const char *adev_name);
1476d29e4461f6 Ryan Chen 2024-10-23  13  #else
1476d29e4461f6 Ryan Chen 2024-10-23 @14  int aspeed_reset_controller_register(struct device *clk_dev, void __iomem *base,
1476d29e4461f6 Ryan Chen 2024-10-23  15  				     const char *adev_name)
1476d29e4461f6 Ryan Chen 2024-10-23  16  {
1476d29e4461f6 Ryan Chen 2024-10-23  17  	return -ENODEV;
1476d29e4461f6 Ryan Chen 2024-10-23  18  }
1476d29e4461f6 Ryan Chen 2024-10-23  19  #endif /* if IS_ENABLED(CONFIG_RESET_ASPEED) */
1476d29e4461f6 Ryan Chen 2024-10-23  20  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

