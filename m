Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8695E1091933
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 23:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waf2PG8psEUFk3GCO5J738brbUdR7U/sXIHicgDZK3A=; b=5DNPT6WONzIyqYTf764zrmnXm5
	oC3MI4msjuRzUE1833mHWYypYROYf+YzEiPYZ+KkgyVG2I6KS2ZWmmji8fl7MfAj1aIOoO/8nD2Us
	DnAOA+ueiMTAH0gAULAwN3d6L71Byt5EiQ0t2l7NtQm4UkOy67nKSOhpswsXK/++LsVAMKoKrpv0U
	mMQCHrsXuRKUaiw3vmLHCL5Szr76ZdNiwuGZ2YUNFBm8lOSwxElkVJ9Hh5XL3ywHB8GC2M3+52IMy
	ZQD+kjypdyQdr4RwfGGZVyaJm4nA93Sj0WFYvT0vnRuyCSCNfBcSUtRyQgO+2ERj7FK4csXD3AZ6+
	3m4gAw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3NCt-0000000BoV8-0bPw;
	Thu, 19 Mar 2026 23:55:15 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3NCq-0000000BoUl-1BRM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 23:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773964512; x=1805500512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r/SbXPFP/ykN1nLBK9p10AiU3ezsLWp1iV0fpBfCrpY=;
  b=fuQaXY7tMFFC6NC77+avg/nZpVNIhSPl1UPD/61S5JM22lrBYsmPadqt
   JKcfbg2HJ+lWbbVEwXcxeFCSF0RU6waqrEYyk8HRrY6BwbF29fT8zVVub
   jXpy/gHWwJ+v3r0y6Cy+jMj9vTPtBrx7iEFODcBd2Z7ZOjB8sePC8JDjI
   iR1N3EjHKsciiy2FiktySAf4E/IRELx70cgINfas+4AGODwg/TGhGFXHY
   Gg5N5fkeJswFSlS0i4auLnOigrjyCKIaVysoK8P5DegpGyEM0RWMvokd8
   Ceobv/9uXH1hadrz6udfEAb0uyF2UOK4yKuEHKziOcpz+Xu25oZOTrgrY
   g==;
X-CSE-ConnectionGUID: rmEt8IPYQ/Gtj11ZSFmdEA==
X-CSE-MsgGUID: W2y1OlO/T4y0hJFWFmtooA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62612635"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="62612635"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 16:55:07 -0700
X-CSE-ConnectionGUID: HphZLJquTpmTIN6wubYLGw==
X-CSE-MsgGUID: 4aygXDj7Tv618DsIpcD7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="261016791"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 16:55:03 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3NCe-000000001nJ-25Ey;
	Thu, 19 Mar 2026 23:55:00 +0000
Date: Fri, 20 Mar 2026 07:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: aspeedyh <yh_chung@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	maciej.lawniczak@intel.com, aspeedyh <yh_chung@aspeedtech.com>
Subject: Re: [PATCH 5/7] soc: aspeed: Add eSPI flash channel support
Message-ID: <202603200700.6fddOZHQ-lkp@intel.com>
References: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_165512_366877_32454F27 
X-CRM114-Status: GOOD (  11.09  )
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

Hi aspeedyh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a]

url:    https://github.com/intel-lab-lkp/linux/commits/aspeedyh/dt-bindings-soc-aspeed-Add-AST2600-eSPI-controller/20260315-101647
base:   0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
patch link:    https://lore.kernel.org/r/20260313-upstream_espi-v1-5-9504428e1f43%40aspeedtech.com
patch subject: [PATCH 5/7] soc: aspeed: Add eSPI flash channel support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603200700.6fddOZHQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200700.6fddOZHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200700.6fddOZHQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/aspeed/espi/ast2600-espi.c: In function 'ast2600_espi_flash_reset':
   drivers/soc/aspeed/espi/ast2600-espi.c:137:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     137 |         reg |= FIELD_PREP(ESPI_CTRL_FLASH_TAFS_MODE, flash->tafs.mode);
         |                ^~~~~~~~~~
   drivers/soc/aspeed/espi/ast2600-espi.c: In function 'ast2600_espi_flash_remove':
>> drivers/soc/aspeed/espi/ast2600-espi.c:172:35: warning: variable 'flash' set but not used [-Wunused-but-set-variable]
     172 |         struct aspeed_espi_flash *flash;
         |                                   ^~~~~
   drivers/soc/aspeed/espi/ast2600-espi.c: In function 'ast2600_espi_flash_get_hdr':
   drivers/soc/aspeed/espi/ast2600-espi.c:194:20: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     194 |         hdr->cyc = FIELD_GET(ESPI_FLASH_RX_CTRL_CYC, reg);
         |                    ^~~~~~~~~


vim +/flash +172 drivers/soc/aspeed/espi/ast2600-espi.c

   169	
   170	int ast2600_espi_flash_remove(struct aspeed_espi *espi)
   171	{
 > 172		struct aspeed_espi_flash *flash;
   173		u32 reg;
   174	
   175		flash = &espi->flash;
   176	
   177		writel(ESPI_INT_EN_FLASH, espi->regs + ESPI_INT_EN_CLR);
   178	
   179		reg = readl(espi->regs + ESPI_CTRL);
   180		reg &= ~(ESPI_CTRL_FLASH_TX_DMA_EN
   181			 | ESPI_CTRL_FLASH_RX_DMA_EN
   182			 | ESPI_CTRL_FLASH_SW_RDY);
   183		writel(reg, espi->regs + ESPI_CTRL);
   184	
   185		return 0;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

