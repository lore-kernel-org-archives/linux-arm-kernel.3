Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB143C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 20:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVzTPkzUVStubZXa9Tt1LfPr+1gubR2in1kIx+J+wxc=; b=Ge/b8kn0q2yv0jXvdgxfcc4EzM
	8a2X+3dotNOEOL5aSyAZZu08jAJTCaW5slHDT3wAIis600qCU7/bVn8ODCW4Vq5ZvAmH1RQQnddJG
	N24xZhOJqtjGRV5DTajI9FbaZPvByHgVTgvRnRNBGRGZSBymYCMiMFFxkRUTW7yW6ZPEMnqCMGYNR
	MLeuO3Uds4vUYBh40NoeR/zDnhMOf1MyuUrGFlirMrSdGwoRHidIFGiv7tMK3qezrTT3Km1ctASfS
	lf32sxaskHgSwCKTSMkJDcdlQPbQxubrduGHv+MGl99TwcZEuDp1tFdcj2rRPr4ZUqfszGB+t0t9i
	lHQXQ2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybXE-0000000HNfw-0Vxl;
	Mon, 24 Aug 2026 20:44:48 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybXC-0000000HNfa-1bLe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 20:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787604286; x=1819140286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NOA4vCbb1ZYoR2rPPmMusfS16XtzjtdN1T/mb8VJtC8=;
  b=ZW0Yuhd+rUrQSDDxgXKOk5QT47UGEsFEYRwEf7q+YaBIEzLZ/VVXkYwc
   TMyKOiHU8wZBSIpjPgEMKUKdVfyQXtRauIbD0CyMZ42lTd8bPmPXAf/Gb
   fKxxJp1QjcExaKY8H3WLj9Ay/VkHK4+nHeh1IwX8tfQwMvmVcQKhkrk+7
   LtN3Ms4d782xDsmT/+XOi9qa8uB0IXaG22QA+DWCvdxBE3C4n5ZBubnwv
   5SqaL9hcl+6mGQv4UMg0URDx11Xh+b4UPEHJOjeraHdtgqOQrzOywjHdW
   yzlhxVVKkk3nMSmeBPhYMRUYQTNGKJRBTmvgDFq0q9lgol6vHhOSE1BnK
   Q==;
X-CSE-ConnectionGUID: 1u01nSKMTwqur5dCbDF0aA==
X-CSE-MsgGUID: R2qiQ7WmRDWRqXg//tIc6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110852363"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="110852363"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:44:44 -0700
X-CSE-ConnectionGUID: gOHQQFA4TaueFmkpeRvIcg==
X-CSE-MsgGUID: 0iKgjXZuS3mbnxO942bOww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="291950997"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Aug 2026 13:44:41 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wybWx-0000000046D-2932;
	Mon, 24 Aug 2026 20:44:32 +0000
Date: Tue, 25 Aug 2026 04:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Michal Simek <monstr@monstr.eu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <202608250423.yjFoKzoa-lkp@intel.com>
References: <20260823050012.17067-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823050012.17067-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_134446_463673_1CB6B84C 
X-CRM114-Status: GOOD (  14.63  )
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

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.2]
[also build test ERROR on linus/master next-20260821]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ASoC-xilinx-formatter_pcm-use-more-devm-in-probe/20260822-220012
base:   v7.2
patch link:    https://lore.kernel.org/r/20260823050012.17067-1-rosenp%40gmail.com
patch subject: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
config: arm64-randconfig-002-20260825 (https://download.01.org/0day-ci/archive/20260825/202608250423.yjFoKzoa-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250423.yjFoKzoa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608250423.yjFoKzoa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/xilinx/xlnx_formatter_pcm.c:632:62: error: too few arguments to function call, expected at least 3, have 2
     632 |                         return dev_err_probe(dev, "audio formatter reset failed\n");
         |                                ~~~~~~~~~~~~~                                      ^
   include/linux/dev_printk.h:278:20: note: 'dev_err_probe' declared here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                    ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +632 sound/soc/xilinx/xlnx_formatter_pcm.c

   584	
   585	static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
   586	{
   587		int ret;
   588		u32 val;
   589		struct xlnx_pcm_drv_data *aud_drv_data;
   590		struct device *dev = &pdev->dev;
   591		struct clk *axi_clk;
   592	
   593		axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
   594		if (IS_ERR(axi_clk))
   595			return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
   596	
   597		aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
   598		if (!aud_drv_data)
   599			return -ENOMEM;
   600	
   601		aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
   602		if (IS_ERR(aud_drv_data->mmio))
   603			return PTR_ERR(aud_drv_data->mmio);
   604	
   605		val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
   606		if (val & AUD_CFG_MM2S_MASK) {
   607			aud_drv_data->mm2s_presence = true;
   608			ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
   609						       XLNX_MM2S_OFFSET);
   610			if (ret)
   611				return dev_err_probe(dev, ret, "audio formatter reset failed\n");
   612			xlnx_formatter_disable_irqs(aud_drv_data->mmio +
   613						    XLNX_MM2S_OFFSET,
   614						    SNDRV_PCM_STREAM_PLAYBACK);
   615	
   616			aud_drv_data->mm2s_irq = platform_get_irq_byname(pdev,
   617									 "irq_mm2s");
   618			if (aud_drv_data->mm2s_irq < 0)
   619				return aud_drv_data->mm2s_irq;
   620	
   621			ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
   622					       xlnx_mm2s_irq_handler, 0,
   623					       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
   624			if (ret)
   625				return ret;
   626		}
   627		if (val & AUD_CFG_S2MM_MASK) {
   628			aud_drv_data->s2mm_presence = true;
   629			ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
   630						       XLNX_S2MM_OFFSET);
   631			if (ret)
 > 632				return dev_err_probe(dev, "audio formatter reset failed\n");
   633			xlnx_formatter_disable_irqs(aud_drv_data->mmio +
   634						    XLNX_S2MM_OFFSET,
   635						    SNDRV_PCM_STREAM_CAPTURE);
   636	
   637			aud_drv_data->s2mm_irq = platform_get_irq_byname(pdev,
   638									 "irq_s2mm");
   639			if (aud_drv_data->s2mm_irq < 0)
   640				return aud_drv_data->s2mm_irq;
   641	
   642			ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
   643					       xlnx_s2mm_irq_handler, 0,
   644					       "xlnx_formatter_pcm_s2mm_irq",
   645					       aud_drv_data);
   646			if (ret)
   647				return ret;
   648		}
   649	
   650		dev_set_drvdata(dev, aud_drv_data);
   651	
   652		return devm_snd_soc_register_component(dev, &xlnx_asoc_component, NULL, 0);
   653	}
   654	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

