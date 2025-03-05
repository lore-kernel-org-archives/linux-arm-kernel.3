Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2737C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNenv6yzjIRmM3SZ3/5Am7wgOCZ6hFr2iV3gttJOh/w=; b=DSy0xN8WPK+9q0HlamcSR+s12A
	IKwQl2RmPaRQ3zuD6erF11w4qgHGp7ttmqS/+IuwWkN001Cf//8eEf7Vmd3ih2Jo4wdAa5p8SQ84e
	1LDHGAtf1gHwU3gEpjFddz61FQFsJ8MilIJNYoPmkd3+OLVwzC69RXCEevP1jxkJEr3VTeE8ePp7+
	Ju/EYXjMUu8KtWzrr1Nl8WbLhc3RoFy709qTi9mafbuH5epaqLfzHF6EpU4ZA89esTNXpTs7LPEMZ
	iIzUIOHLC5cfcX11o2WkH5yUWWVieyVHLmxaYG7U7jzX4p0MWE8iGytIkzSDnHqVmpVzrRmQOIDsE
	uuTMEw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuGU-0000000937G-2FXK;
	Wed, 05 Mar 2025 19:18:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptIc-00000008u7e-3GkW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 18:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JNenv6yzjIRmM3SZ3/5Am7wgOCZ6hFr2iV3gttJOh/w=; b=kzx3v4hCxyYDVSjPdOHwLOv70p
	gDiZFpdGfaoSW7LT41CBzV9aqe33eTifj5xXUNStNSOr2Q7Bm5YNBxQDYCG0Wyu2kOnpohOKYhvhS
	sEw1c8hPsaLQIIHj4ojvuueBTA6tHHTv72DQzQwYkAx7AUl1UBnjwaAxd1FGtF/xKiMEDwSt5Qv5v
	/+XTczcnaiVC+jznL/TyreYAxjAsIvHiSyiIxK4rYr0Dx8oBVYVzAG7Wc/+qnm/qlc0RSQ1Yui0cQ
	Q0YO4o8dkhmFBvXnDYJNjbNGRDQLH18sdXiYPBGtuXZPV9IF4HaCmQ+rfyWxiJFmq7O4jOd55222w
	/xDMHI/Q==;
Received: from mgamail.intel.com ([198.175.65.16])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptIZ-00000005zbJ-0Xi2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741198611; x=1772734611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LRuZg0UTzGUj7t5oXfbPHk4QtNXMrZZ51pxOPxYi4k=;
  b=FtRNO8sKzbYTw92Ijh0Adn0WMCmlxPgYc2bxrui9Ulx632UqC/YBSc0p
   PkOqjsUuI3PwlCI3J5aPmuiDxj+GG1LYJ05bVqGoDV9bVIuSOdx7Xf6yZ
   bsuZDDNqInaa53ynTJJKa/WKxsbBNaD3vXQfEG4/zrDdSN9fcOLwD44Pl
   jUwaE01uzFGOjXvdxw+Y1gB9gSuY0rz/WpbgwDEhJDx+DOkPkhgByEy+L
   2iA90DwHD7qBxo3/v2kntEW2YQt0hbp7fxZQSgurCq2M2+n6Mzs4X5Hu0
   wt9rir9DQbteqXMJ531GJbTMtmeNQs3Ly6yT2nwJEGUI6i2MiIia3/5iS
   w==;
X-CSE-ConnectionGUID: vvqv5NOIQe2b7batIOoyog==
X-CSE-MsgGUID: auQkTVkvR3i2uZtvrl00bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42309692"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42309692"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 10:16:39 -0800
X-CSE-ConnectionGUID: Ddn4YyTUSb6xo8euSJAHZA==
X-CSE-MsgGUID: LWrbSZbtS8iH5IoWIPdprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="123870141"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2025 10:16:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tptIG-000Lro-24;
	Wed, 05 Mar 2025 18:16:32 +0000
Date: Thu, 6 Mar 2025 02:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v8 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202503060247.j7Mbl9vb-lkp@intel.com>
References: <20250228081812.3115478-3-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228081812.3115478-3-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_181651_492180_0F462FF8 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Ciprian,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm64/for-next/core krzk-dt/for-next linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20250228-162229
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250228081812.3115478-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v8 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250306/202503060247.j7Mbl9vb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060247.j7Mbl9vb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060247.j7Mbl9vb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-s32g.c: In function 'rtc_clk_src_setup':
>> drivers/rtc/rtc-s32g.c:204:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     204 |         rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
         |                ^~~~~~~~~~


vim +/FIELD_PREP +204 drivers/rtc/rtc-s32g.c

   196	
   197	static int rtc_clk_src_setup(struct rtc_priv *priv)
   198	{
   199		u32 rtcc;
   200	
   201		if (priv->rtc_data->reserved_clk_mask & (1 << priv->clk_src_idx))
   202			return -EOPNOTSUPP;
   203	
 > 204		rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
   205	
   206		switch (priv->rtc_data->clk_div) {
   207		case DIV512_32:
   208			rtcc |= RTCC_DIV512EN;
   209			rtcc |= RTCC_DIV32EN;
   210			break;
   211		case DIV512:
   212			rtcc |= RTCC_DIV512EN;
   213			break;
   214		case DIV32:
   215			rtcc |= RTCC_DIV32EN;
   216			break;
   217		case DIV1:
   218			break;
   219		default:
   220			return -EINVAL;
   221		}
   222	
   223		rtcc |= RTCC_APIEN | RTCC_APIIE;
   224		/*
   225		 * Make sure the CNTEN is 0 before we configure
   226		 * the clock source and dividers.
   227		 */
   228		s32g_rtc_disable(priv);
   229		writel(rtcc, priv->rtc_base + RTCC_OFFSET);
   230		s32g_rtc_enable(priv);
   231	
   232		return 0;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

