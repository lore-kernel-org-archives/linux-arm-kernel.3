Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A889CE8E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCRJdYh2csJ+89h1hlReDsgz7vlEUdYt46ocV+NkEwM=; b=cWC4BmrxgsoYtwhak2roQ7dm06
	OxafZOmIC2u7dfloDJpRHlr5TUsZKlPm3e06wv+VGxYYP/aGiNm6OyY2zDTan6oIZpa6I5OS1peGa
	lbK6tVU3GsvdxHr6EcXH/J3x+DNZCrmCdAXgspo4I7YcRMAqT+qTpDoX8IKxkqQXnAyYm/PM89aKy
	mSwGmLQBymhzD33xwbb7gAvcs5HHC8Xvl2FuPR+lTCjaS8BT8fFqiynkN8rTcNl12mIhxZCMk1iof
	z5w2IYphprnt7yEasYUuzEMXNIHie8IN4JMyCcOCHDvUAYg3xAdms+8cwdG64DocLksZZTZY5s0re
	KO/HO67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xNn-00000000PaI-1kAU;
	Thu, 24 Oct 2024 12:56:07 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xLi-00000000PLS-2Wly
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729774439; x=1761310439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HUuhAWk3dXLnQPMq/6w0jxdCVg118X9Z6g0zogfDEU8=;
  b=h/twMj9iyxDgIK1xNShcTxbYu34r8LmGLfm78Ks2T3pYSuMebxGYtMut
   r4YtSw4giXhKLSOnDnoihWQ3nYgMT5QYkKJ6CBmajl36rEzOSK/GUkqgn
   R80HQtXBoI0/XBP7sw6ZHwKbWDO1UUUjExtwnSRr1PCebc+iL7ko2n3Uc
   BhcvOev7c7HJsul3W9/4rlvU96o5Eh2QJOHxpbKMOhisBagPLYxibqL63
   HIAZYWOEprFpgrzdGbzgM9pictpkfYIbHoiBJsW8TwK1ijuEzjkLlUHMJ
   ZYp/kpfE+Z0sWadNVBgKldd1RVciw8QpBSgvKPUU86j8+hXHn/PM6xsp/
   Q==;
X-CSE-ConnectionGUID: ybsaqP2TQ66UgM6ehAr3Qw==
X-CSE-MsgGUID: 4349tcWXR5KbBxxBPhvZeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33305515"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33305515"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 05:53:58 -0700
X-CSE-ConnectionGUID: CYQhb0LyQ/O314nR33NJFw==
X-CSE-MsgGUID: T60QwaPzQhGgKJLZPt2oiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="84560553"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2024 05:53:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3xLc-000WRA-04;
	Thu, 24 Oct 2024 12:53:52 +0000
Date: Thu, 24 Oct 2024 20:53:28 +0800
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
Message-ID: <202410242017.1valHJUC-lkp@intel.com>
References: <20241023090153.1395220-4-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023090153.1395220-4-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_055358_682685_6F7894DB 
X-CRM114-Status: GOOD (  13.39  )
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
config: arm64-randconfig-r133-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242017.1valHJUC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce: (https://download.01.org/0day-ci/archive/20241024/202410242017.1valHJUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242017.1valHJUC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/clk-ast2700.c:17:
>> include/soc/aspeed/reset-aspeed.h:14:5: warning: no previous prototype for function 'aspeed_reset_controller_register' [-Wmissing-prototypes]
      14 | int aspeed_reset_controller_register(struct device *clk_dev, void __iomem *base,
         |     ^
   include/soc/aspeed/reset-aspeed.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      14 | int aspeed_reset_controller_register(struct device *clk_dev, void __iomem *base,
         | ^
         | static 
   1 warning generated.


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

