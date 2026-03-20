Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDF61093179
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 04:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJMOvmuyxnPDgD6UKl/Wo25LJql6LgrNjqbSF6tqdFA=; b=a7PIBB/C4iZjmF+sh35WbOz4Ye
	01P3bx/Sueh9uDvqLQJDNDgRvnSy+97Ywd/9nl2mMkWIe2FuvtzGCKPUZhpqoNFZI9uY2qd7DKWaF
	osxS3geJHkfteWNEpIn34qUJ2fcYHMKTIc7yFtVd7OcgSM/VJoR5FtQJ5yom6vrRAGrbR7gr0TogD
	8jC4nAkgK4wTWaagUrw1TvHVUpXoRnxFUttWxagEwPuVTWZsB5mU5lSr7QqGo/7Cre+WSpAswmQMa
	0xErgLFJEU2ic9ERst8xDCs8mr6fMgnccLicJ80VHmOc82s5JiOwuaUj8to9fjXI4yknWklYSMS7A
	5Ti6bNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3RM9-0000000C3lq-44dD;
	Fri, 20 Mar 2026 04:21:05 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3RM4-0000000C3lU-2P32
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 04:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773980460; x=1805516460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OHnX7uZBV92R01nqYlUueQh+SwiiSpGawFPFVc+X9Ac=;
  b=eRjQ9wy30ZF12NWjEjhyyQb6tF7WMuJGiVD7hnTrKyneR/XLX8G+IBZ4
   zVP0SeLNBqEQXYUJB0c4yTyN8lXHhbzzj62cSpfT03JXlUNiqTZBo47g+
   nMSTb5aezG2KCHU3Rla9xY43lqxXyKK8mx4qVo/sutlajir5isOo5WvSN
   XbCknb35ZdvRgO2mmynzYgKIuPTTPHD8Vns8RxebPJHYY6PSH3Y04jeOO
   I3XrsJp/DJkscgJnYKJJORu7CXs+oy0RbDbD9DI2yC5o0IqUaMXDcr0hM
   zTO7LUjDJkOBx+4RvkJiLA5N/Qade+/3E1s5uOlYMXKJ/ZS2IN6sGOCAg
   w==;
X-CSE-ConnectionGUID: 2DEqLwipQw273pehBZriaQ==
X-CSE-MsgGUID: 10Nu6X/7Rw2wCzs4U0os6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="77670262"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="77670262"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 21:20:56 -0700
X-CSE-ConnectionGUID: f2vicg65TU+omWmZ32VWkg==
X-CSE-MsgGUID: Kgb03j0VRrWGSeCxQZ27jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220549657"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Mar 2026 21:20:53 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3RLn-000000001wf-2k5k;
	Fri, 20 Mar 2026 04:20:45 +0000
Date: Fri, 20 Mar 2026 12:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: aspeedyh <yh_chung@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, maciej.lawniczak@intel.com,
	aspeedyh <yh_chung@aspeedtech.com>
Subject: Re: [PATCH 5/7] soc: aspeed: Add eSPI flash channel support
Message-ID: <202603201234.n0spXcAN-lkp@intel.com>
References: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_212100_655959_0F0A818C 
X-CRM114-Status: GOOD (  11.92  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a]

url:    https://github.com/intel-lab-lkp/linux/commits/aspeedyh/dt-bindings-soc-aspeed-Add-AST2600-eSPI-controller/20260315-101647
base:   0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
patch link:    https://lore.kernel.org/r/20260313-upstream_espi-v1-5-9504428e1f43%40aspeedtech.com
patch subject: [PATCH 5/7] soc: aspeed: Add eSPI flash channel support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603201234.n0spXcAN-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201234.n0spXcAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201234.n0spXcAN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/aspeed/espi/ast2600-espi.c:137:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           reg |= FIELD_PREP(ESPI_CTRL_FLASH_TAFS_MODE, flash->tafs.mode);
                  ^
   drivers/soc/aspeed/espi/ast2600-espi.c:172:28: warning: variable 'flash' set but not used [-Wunused-but-set-variable]
           struct aspeed_espi_flash *flash;
                                     ^
>> drivers/soc/aspeed/espi/ast2600-espi.c:194:13: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           hdr->cyc = FIELD_GET(ESPI_FLASH_RX_CTRL_CYC, reg);
                      ^
   drivers/soc/aspeed/espi/ast2600-espi.c:243:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           reg = FIELD_PREP(ESPI_FLASH_TX_CTRL_CYC, cyc) |
                 ^
   1 warning and 3 errors generated.


vim +/FIELD_PREP +137 drivers/soc/aspeed/espi/ast2600-espi.c

   111	
   112	static void ast2600_espi_flash_reset(struct aspeed_espi *espi)
   113	{
   114		struct aspeed_espi_flash *flash;
   115		u32 reg;
   116	
   117		flash = &espi->flash;
   118	
   119		writel(ESPI_INT_EN_FLASH, espi->regs + ESPI_INT_EN_CLR);
   120		writel(ESPI_INT_STS_FLASH, espi->regs + ESPI_INT_STS);
   121	
   122		reg = readl(espi->regs + ESPI_CTRL);
   123		reg &= ~(ESPI_CTRL_FLASH_TX_SW_RST
   124			 | ESPI_CTRL_FLASH_RX_SW_RST
   125			 | ESPI_CTRL_FLASH_TX_DMA_EN
   126			 | ESPI_CTRL_FLASH_RX_DMA_EN
   127			 | ESPI_CTRL_FLASH_SW_RDY);
   128		writel(reg, espi->regs + ESPI_CTRL);
   129	
   130		udelay(1);
   131	
   132		reg |= (ESPI_CTRL_FLASH_TX_SW_RST | ESPI_CTRL_FLASH_RX_SW_RST);
   133		writel(reg, espi->regs + ESPI_CTRL);
   134	
   135		flash->tafs.mode = TAFS_MODE_SW;
   136		reg = readl(espi->regs + ESPI_CTRL) & ~ESPI_CTRL_FLASH_TAFS_MODE;
 > 137		reg |= FIELD_PREP(ESPI_CTRL_FLASH_TAFS_MODE, flash->tafs.mode);
   138		writel(reg, espi->regs + ESPI_CTRL);
   139	
   140		if (flash->dma.enable) {
   141			writel(flash->dma.tx_addr, espi->regs + ESPI_FLASH_TX_DMA);
   142			writel(flash->dma.rx_addr, espi->regs + ESPI_FLASH_RX_DMA);
   143	
   144			reg = readl(espi->regs + ESPI_CTRL)
   145			      | ESPI_CTRL_FLASH_TX_DMA_EN
   146			      | ESPI_CTRL_FLASH_RX_DMA_EN;
   147			writel(reg, espi->regs + ESPI_CTRL);
   148		}
   149	
   150		writel(ESPI_INT_EN_FLASH_RX_CMPLT, espi->regs + ESPI_INT_EN);
   151	
   152		reg = readl(espi->regs + ESPI_CTRL) | ESPI_CTRL_FLASH_SW_RDY;
   153		writel(reg, espi->regs + ESPI_CTRL);
   154	}
   155	
   156	int ast2600_espi_flash_probe(struct aspeed_espi *espi)
   157	{
   158		u32 regs;
   159	
   160		regs = readl(espi->regs + ESPI_STS);
   161		if (regs & (ESPI_STS_FLASH_TX_BUSY | ESPI_STS_FLASH_RX_BUSY)) {
   162			dev_warn(espi->dev, "eSPI flash channel is busy, deferring...\n");
   163			return -EPROBE_DEFER;
   164		}
   165	
   166		ast2600_espi_flash_reset(espi);
   167		return 0;
   168	}
   169	
   170	int ast2600_espi_flash_remove(struct aspeed_espi *espi)
   171	{
   172		struct aspeed_espi_flash *flash;
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
   188	int ast2600_espi_flash_get_hdr(struct aspeed_espi *espi,
   189				       struct espi_comm_hdr *hdr)
   190	{
   191		u32 reg, len;
   192	
   193		reg = readl(espi->regs + ESPI_FLASH_RX_CTRL);
 > 194		hdr->cyc = FIELD_GET(ESPI_FLASH_RX_CTRL_CYC, reg);
   195		hdr->tag = FIELD_GET(ESPI_FLASH_RX_CTRL_TAG, reg);
   196		len = FIELD_GET(ESPI_FLASH_RX_CTRL_LEN, reg);
   197		hdr->len_h = (len >> 8) & 0xff;
   198		hdr->len_l = len & 0xff;
   199	
   200		return 0;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

