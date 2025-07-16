Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11996C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+FcwZ2StdVrL7h4mw8NPeZ2wbOYhicbGHRulVJPCH8=; b=tz8BEr4jlGpgVUmn6V/n0ic+ME
	kCJ9wlazkrGEOzw/pYr8U1tN1VBBrt2h6pkUk9XiPEfDyKo76uMuDhHNpq9WyrKnZnZtOWQ77DNIY
	g664EUFEQmk1/XPFPsVagGFfhCv0sCRx/3wTqsitX+Apu3PvBY33wK6PavUfmheQTeNI9l6OruMYH
	O1BaltLLZ8bI8+trPDf6G0rD1i8PVZgmbTo64fHu2sOnhmTYOysGy1n8coGi0+QVrX2zasOWziOXO
	HK4CaWgycdc8z+eCjeoFB8cejuX9pte+FL72wnAzVIjgsqGFRBK9j4hU2WfJrkIV2ozQvrP0wUaz+
	z8xFmZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc22G-00000007mGI-3YbV;
	Wed, 16 Jul 2025 13:19:00 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1zm-00000007lxa-3vkJ;
	Wed, 16 Jul 2025 13:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752671787; x=1784207787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T2m/oiuwjR2kBEt3SpOmzte4WJb1A9iDMDoZGf9vy1I=;
  b=nIwWcKz49ieoEkD3iadhM1JVQl81JgV+CsIxZmgnNG120eDoHBl7nzA5
   ughALHmlq91kUwkfCos3bi+URaC4r+VrxYrs3GasAmONqCYTqXMRJfEdV
   Ue1TBMozu9PVmgEQlnbatCm1Hsva7GWy4UgzB3AgUk6sri8+AFj/FTWXc
   srjahTDfLMGtDpqklH7UXsKAv9kB32BqhwIPg6ZZ0XgV75ITvl3uHSIUr
   wMGT3Hv1dDWOyJ8Z2biWszcbpjrRadN4eeiIZlg3LUFgESdBdTf1BpPr3
   jYw/TjINzv++FW6Y10Idat4wfMyJ1ezhVR8ugt8eYRyi3Trc9VRajDByD
   A==;
X-CSE-ConnectionGUID: vG8S6HvaQ+u1O+g0+XtCAg==
X-CSE-MsgGUID: bvBL3sGMT06L5EYJKhhN/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58685706"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="58685706"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 06:16:26 -0700
X-CSE-ConnectionGUID: e8YbxVzmQ7uhXb6J+nSkqQ==
X-CSE-MsgGUID: g9WY1BjiTLuoz6pD7l1wYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="156894575"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jul 2025 06:16:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc1zf-000CQl-1x;
	Wed, 16 Jul 2025 13:16:19 +0000
Date: Wed, 16 Jul 2025 21:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Velikanov <me@adomerle.pw>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: Re: [PATCH v1 2/2] clk: mediatek: Add MT6789 clock controllers
Message-ID: <202507162133.0p74u7j1-lkp@intel.com>
References: <20250715222221.29406-2-me@adomerle.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715222221.29406-2-me@adomerle.pw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_061627_040228_1710BAF3 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Arseniy,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next pza/reset/next linus/master v6.16-rc6 next-20250715]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arseniy-Velikanov/clk-mediatek-Add-MT6789-clock-controllers/20250716-062512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250715222221.29406-2-me%40adomerle.pw
patch subject: [PATCH v1 2/2] clk: mediatek: Add MT6789 clock controllers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250716/202507162133.0p74u7j1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507162133.0p74u7j1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507162133.0p74u7j1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/mediatek/clk-mt6789-imp_iic_wrap.c:13:
>> drivers/clk/mediatek/clk-mt6789-imp_iic_wrap.c:33:27: error: 'CLK_IMP_IIC_WRAP_W_I2C0' undeclared here (not in a function); did you mean 'CLK_IMP_IIC_WRAP_W_I2C1'?
      33 |         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C0, "imp_iic_wrap_w_i2c0", "top_i2c", 0),
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:41:23: note: in definition of macro 'GATE_MTK_FLAGS'
      41 |                 .id = _id,                                      \
         |                       ^~~
   drivers/clk/mediatek/clk-mt6789-imp_iic_wrap.c:33:9: note: in expansion of macro 'GATE_IMP_IIC_WRAP'
      33 |         GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C0, "imp_iic_wrap_w_i2c0", "top_i2c", 0),
         |         ^~~~~~~~~~~~~~~~~


vim +33 drivers/clk/mediatek/clk-mt6789-imp_iic_wrap.c

    31	
    32	static const struct mtk_gate imp_iic_wrap_w_clks[] = {
  > 33		GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C0, "imp_iic_wrap_w_i2c0", "top_i2c", 0),
    34		GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C1, "imp_iic_wrap_w_i2c1", "top_i2c", 1),
    35	};
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

