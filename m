Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499EBC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wVQ17dx4pratB07V1EaUseOzS5Ef74/S9jFa4499f8E=; b=hIYwn5fFWXKRZpY9d3O9uDyLQD
	s8TvdUiJrJs03kNHW0zzixzshMsEoLiNKj2qJYhy+UX/WuHKxkG6t2CnWAxijrfUExipIdMjLA5nI
	Jdt+ficA82pI7rJ8T/+DcJRflTnMnweuSoft9l3xT2UTxaFg/Q2fWylrzjSRmyi2B8B2ekZrmAB6j
	yCQ2ZwXMtXTmC6PjrlEluCVZAkA7Jd9KjzO89ycl7wJWheHU8xDEr+fsukUa7+fnRaiw61mBseckW
	haH9DdzIFnJ4bsiLM+fs2szkYyVSyLKgFFXUZ+OxQv6T+dhf3bY6YfCsSS/Mm78UB1MlvNmfExO8Z
	99Wu+A3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lMv-00000003paL-3jDZ;
	Sat, 05 Sep 2026 08:03:21 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lMt-00000003pZY-1I9m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788595400; x=1820131400;
  h=date:from:to:cc:subject:message-id;
  bh=R42RIDsTntuv+s3A6dgJ86LP2ybzAkbehUalDCAM7gI=;
  b=Q7HqoJMfT0T5HgqU7WSAyOlYgEiga4RspeLmVAUAptqp6JhibeZLl9Ga
   GdJNxsM44Xf9+w+bDy6hnhNHsdvdL6L2JlvYQa52qS/PfrkRNjXDa4YaU
   vwGWRyN0Co2AediLOmxWxmEd7UqFge9aXU56Qj0cnwCT9PMN8unjT3idE
   dXNbP4DzUL61eBcMN+4e3mn9d3RVyjiOy/fdWlZhDKaJD7kbIqWuRFY7b
   CsSp+p6Meq3g+Krwy/AMw6bz7956NsdxmForMbQEmYhwAAbTjiuT/ONXz
   O3XuwLL6i2cLOE3js+DSx38KJuzwvKwPn78PmMU7HRS/PATZsZgABW72u
   g==;
X-CSE-ConnectionGUID: f9mfxgAhTvijDKMsUxMQGQ==
X-CSE-MsgGUID: 3eH4K1uSTjKIsuh+kjyX0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100246460"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="100246460"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:03:19 -0700
X-CSE-ConnectionGUID: am/29cqqTeW3OF68/W0UNQ==
X-CSE-MsgGUID: VRU6FGHQTkGE7NFob7RpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="268943373"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Sep 2026 01:03:17 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2lMo-000000000H5-3437;
	Sat, 05 Sep 2026 08:03:14 +0000
Date: Sat, 05 Sep 2026 16:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4/ux500-msp-fixes 5/10]
 sound/soc/ux500/ux500_msp_i2s.h:150:38: warning: suggest parentheses around
 arithmetic in operand of '^'
Message-ID: <202609051547.G9SJp8UQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_010319_385907_0740C1E8 
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-msp-fixes
head:   2f95df02f538f1fca7974cb317d05bea56b96a82
commit: a68d4e15f02ffb40f55509d32630a549168d1b5d [5/10] ASoC: ux500: Validate MSP DAI configuration
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260905/202609051547.G9SJp8UQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051547.G9SJp8UQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051547.G9SJp8UQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/ux500/ux500_msp_i2s.c:20:
   sound/soc/ux500/ux500_msp_i2s.c: In function 'configure_protocol':
>> sound/soc/ux500/ux500_msp_i2s.h:150:38: warning: suggest parentheses around arithmetic in operand of '^' [-Wparentheses]
     150 | #define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
   sound/soc/ux500/ux500_msp_i2s.c:204:21: note: in expansion of macro 'MSP_TX_CLKPOL_BIT'
     204 |         temp_reg |= MSP_TX_CLKPOL_BIT(!protdesc->tx_clk_pol ^
         |                     ^~~~~~~~~~~~~~~~~
   sound/soc/ux500/ux500_msp_i2s.h:149:38: warning: suggest parentheses around arithmetic in operand of '^' [-Wparentheses]
     149 | #define MSP_RX_CLKPOL_BIT(n)     ((n & RCKPOL_MASK) << RCKPOL_SHIFT)
   sound/soc/ux500/ux500_msp_i2s.c:208:21: note: in expansion of macro 'MSP_RX_CLKPOL_BIT'
     208 |         temp_reg |= MSP_RX_CLKPOL_BIT(protdesc->rx_clk_pol ^
         |                     ^~~~~~~~~~~~~~~~~


vim +150 sound/soc/ux500/ux500_msp_i2s.h

3592b7f69a54388 Ola Lilja 2012-05-08  145  
3592b7f69a54388 Ola Lilja 2012-05-08  146  #define RCKPOL_MASK		BIT(0)
3592b7f69a54388 Ola Lilja 2012-05-08  147  #define TCKPOL_MASK		BIT(0)
3592b7f69a54388 Ola Lilja 2012-05-08  148  #define SPICKM_MASK		(BIT(1) | BIT(0))
3592b7f69a54388 Ola Lilja 2012-05-08  149  #define MSP_RX_CLKPOL_BIT(n)     ((n & RCKPOL_MASK) << RCKPOL_SHIFT)
3592b7f69a54388 Ola Lilja 2012-05-08 @150  #define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
3592b7f69a54388 Ola Lilja 2012-05-08  151  

:::::: The code at line 150 was first introduced by commit
:::::: 3592b7f69a5438812381ff0aacdea1725ffa1c1c ASoC: Ux500: Add MSP I2S-driver

:::::: TO: Ola Lilja <ola.o.lilja@stericsson.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

