Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F8DCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVGPySEnxjFy2QOQpcAfInwnpkDXb9sJXNYBkhDhx/c=; b=LWCCU6L2GC8Wz2l00dUDBh+/aU
	7RAu8/5aU3SRs2YgaTUg4ajBq3jGlCiJcPTRvze9fCmRuvbtlfIDxowjELsjEN8LNzAfo/RhFktIs
	mCBzjYtMCIlu0I5FavKe0rTZCVyEX4FjU/mPyasFwV751LNyDmICUrPtokTHTaIip2pPvLihiYOdU
	j3He6xrYcoxYsa/BuQb1eX+/JF7f/7S8Srs9xAIHefdUN4hHSLjnBGnoxOaOv4Txtm2w7GcQpYmcu
	rTpUrrUD4yRbV5Vt4gdHN94iHmE7onRGx9EwfyFkC1UxNqBiZeaUSodXw8IwRutU1Y0IZC9Kt/dQo
	rx+m8i/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCt5h-0000000C1TV-2NTO;
	Sun, 26 Oct 2025 05:14:53 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCt5e-0000000C1T6-3HXW;
	Sun, 26 Oct 2025 05:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761455690; x=1792991690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gKJE14w1KDbJqmE7/dHsKdynDf2xulvE3IRzaIW6bj4=;
  b=dkjTTV+T/qLsrQrcuRto5ZwAnVm3UAIIB/JPhFgLXrPdo+idq981jKW7
   a4S4C4Fln2L0dJQi3NltYqKBHBSffYS7jkankFxG4vr93XGdOZvEcGPwA
   DkY2umU7iDf6tHJqzE2HJJfDlEol97keT3AMLFhgpSlW69TJuifckRXub
   5AI7kVbm0Qztd/9FAHGhE/cXI3Md6FeOpjEJyqTYtgmqgWPtSXjjaVwLV
   UBIyVao61BjArkdKMDyG/5Cv7E4r5alZVDvFGBb2hceGU5jcxr9u2eAlf
   Vg+dsVVj8FN84vvYUjhdaxzYtZTkLRVDhwQuI9o5OmR0/a9b3pQBypo7c
   Q==;
X-CSE-ConnectionGUID: o1uogyzHS+K/ZDtPJtfqcg==
X-CSE-MsgGUID: /HVxjU/2S0yx6wENsrxCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74919508"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="74919508"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 22:14:45 -0700
X-CSE-ConnectionGUID: 3IfibMsMR/SdoNhlTH/RrA==
X-CSE-MsgGUID: x7CYNeabSyG2So3RbmdNKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184839789"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2025 22:14:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCt5F-000Fty-0a;
	Sun, 26 Oct 2025 05:14:34 +0000
Date: Sun, 26 Oct 2025 13:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alexandre.belloni@bootlin.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/2] rtc: Add support for MT6685 Clock IC's RTC over
 SPMI
Message-ID: <202510261223.NRLximA4-lkp@intel.com>
References: <20251024083318.25890-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024083318.25890-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_221450_888020_5221C04E 
X-CRM114-Status: GOOD (  16.26  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-rtc-Add-MediaTek-MT6685-PM-Clock-IC-Real-Time-Clock/20251024-164423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20251024083318.25890-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 2/2] rtc: Add support for MT6685 Clock IC's RTC over SPMI
config: sparc64-randconfig-r062-20251026 (https://download.01.org/0day-ci/archive/20251026/202510261223.NRLximA4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261223.NRLximA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261223.NRLximA4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/rtc/rtc-mt6685.c: In function 'rtc_mt6685_probe':
   drivers/rtc/rtc-mt6685.c:380:13: error: implicit declaration of function 'devm_spmi_subdevice_alloc_and_add' [-Werror=implicit-function-declaration]
     380 |  sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-mt6685.c:380:11: warning: assignment to 'struct spmi_subdevice *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     380 |  sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
         |           ^
   In file included from drivers/rtc/rtc-mt6685.c:20:
>> drivers/rtc/rtc-mt6685.c:397:51: error: dereferencing pointer to incomplete type 'struct spmi_subdevice'
     397 |  rtc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mt6685_rtc_regmap_config);
         |                                                   ^~
   include/linux/regmap.h:775:6: note: in definition of macro '__regmap_lockdep_wrapper'
     775 |   fn(__VA_ARGS__, &_key,     \
         |      ^~~~~~~~~~~
   drivers/rtc/rtc-mt6685.c:397:16: note: in expansion of macro 'devm_regmap_init_spmi_ext'
     397 |  rtc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mt6685_rtc_regmap_config);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +397 drivers/rtc/rtc-mt6685.c

   358	
   359	static int rtc_mt6685_probe(struct platform_device *pdev)
   360	{
   361		struct regmap_config mt6685_rtc_regmap_config = {
   362			.reg_bits = 16,
   363			.val_bits = 8,
   364			.max_register = 0x60,
   365			.fast_io = true,
   366			.use_single_read = true,
   367			.use_single_write = true,
   368		};
   369		struct device *dev = &pdev->dev;
   370		struct spmi_subdevice *sub_sdev;
   371		struct spmi_device *sparent;
   372		struct mt6685_rtc *rtc;
   373		int ret;
   374	
   375		rtc = devm_kzalloc(dev, sizeof(struct mt6685_rtc), GFP_KERNEL);
   376		if (!rtc)
   377			return -ENOMEM;
   378	
   379		sparent = to_spmi_device(dev->parent);
 > 380		sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
   381		if (IS_ERR(sub_sdev))
   382			return PTR_ERR(sub_sdev);
   383	
   384		ret = of_property_read_u32(pdev->dev.of_node, "reg",
   385					   &mt6685_rtc_regmap_config.reg_base);
   386		if (ret)
   387			return ret;
   388	
   389		rtc->irq = platform_get_irq(pdev, 0);
   390		if (rtc->irq < 0)
   391			return rtc->irq;
   392	
   393		rtc->mclk = devm_clk_get(dev, 0);
   394		if (IS_ERR(rtc->mclk))
   395			return PTR_ERR(rtc->mclk);
   396	
 > 397		rtc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mt6685_rtc_regmap_config);
   398		if (IS_ERR(rtc->regmap))
   399			return PTR_ERR(rtc->regmap);
   400	
   401		rtc->rdev = devm_rtc_allocate_device(dev);
   402		if (IS_ERR(rtc->rdev))
   403			return PTR_ERR(rtc->rdev);
   404	
   405		platform_set_drvdata(pdev, rtc);
   406	
   407		/* Clock is required to auto-synchronize IRQ enable to RTC */
   408		ret = clk_prepare_enable(rtc->mclk);
   409		if (ret)
   410			return ret;
   411	
   412		ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
   413						rtc_mt6685_irq_handler_thread,
   414						IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
   415						"mt6685-rtc", rtc);
   416		clk_disable_unprepare(rtc->mclk);
   417		if (ret)
   418			return dev_err_probe(&pdev->dev, ret, "Cannot request alarm IRQ");
   419	
   420		device_init_wakeup(&pdev->dev, true);
   421	
   422		rtc->rdev->ops = &rtc_mt6685_ops;
   423		rtc->rdev->range_min = RTC_TIMESTAMP_BEGIN_1900;
   424		rtc->rdev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
   425		rtc->rdev->start_secs = mktime64(1968, 1, 1, 0, 0, 0);
   426		rtc->rdev->set_start_time = true;
   427	
   428		return devm_rtc_register_device(rtc->rdev);
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

