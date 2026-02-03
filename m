Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4118EE8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 17:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2906EFWokSIqmuoqECjajhGLsdrLK5DcsfVyAJNplIQ=; b=QJ/477OzcYxr69vPQZcFkLakBW
	fvCE+EoLyTOUP7rtms24mV0/hEc3g5JUu5clbX+lTWMCga/mIxHpevQyCIBJQvDtXhOjmOJuW+H6o
	S5ykzbyd/ceJGNO3BJuzYVVsEmoQV0XKqeuXXzhlhIHc4eQWUBSSLO3ypvF2RVxFlpjscr+LoQTZ8
	faRVkEOZGvYz71WgUB3+KLG1ptUwzQV0zPeZuKU34zX+WjZJL/ibLJYLButZ5Cn3aPZab0kTRHgek
	iBCPgf8Bv9sO8c8v6A4Pu1brAzwplbf65oHC2RzsOfdu0gdgiK/rrbktR8WaqK8Eycf/mMBEsWuNu
	GfQB8BxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKGT-000000073GW-2TPb;
	Tue, 03 Feb 2026 17:32:37 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKGQ-000000073FJ-419p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 17:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770139955; x=1801675955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zOUHPvPYgAED+5chP8L8z0Gl/CW+3EmlWHBnR1pXUuA=;
  b=GRuVFepgSwo9uPbqatqhaNGu7eEXeotl+61n+bw1cmJp6OUR7ckl+jyC
   cj56zhrwuHek2FBRhyD8y9OXjPWzTLV+rN/K2dEkR8btqTLSjwn0wbT0e
   rVUBYcvkepEo4oWOqqUwYSpbPtcRK5VEQxQ+noOHHPZTwvi33gkLq0mZF
   5PBHMNvmxQynpspHmsdEaUT7H8aDdJ+4FVO4j3Gaxpg7IlQ+XwqwhT2sQ
   7RHpy2sL6NI0jAqD06Pjqu1oaUiaQEztVEv7hipndoYEj2d3B5QAwuCQJ
   KuiE5FQ2uGV387hW9q7uhJ4TWZ1eYfSejH/200/2af7AmzePc205nJVUm
   g==;
X-CSE-ConnectionGUID: J+J5lS3KQ4mIusSSnYLjRg==
X-CSE-MsgGUID: KuXo1RvJTqmlmQOabaOJ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74939349"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="74939349"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 09:32:34 -0800
X-CSE-ConnectionGUID: oGD2iRp5REOmYrYYHGZ1VQ==
X-CSE-MsgGUID: j27gC4EKSv+Jhb07xjwNyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209195436"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2026 09:32:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnKGK-00000000guW-0ghX;
	Tue, 03 Feb 2026 17:32:28 +0000
Date: Wed, 4 Feb 2026 01:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 2/3] reset: add Sky1 soc reset support
Message-ID: <202602040111.sphIzkjq-lkp@intel.com>
References: <20260203022031.4075627-3-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203022031.4075627-3-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_093235_086602_F8FAE2D4 
X-CRM114-Status: GOOD (  14.37  )
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

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master pza/reset/next v6.19-rc8 next-20260202]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-soc-cix-document-the-simple-mfd-syscon-on-Sky1-SoC/20260203-102331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260203022031.4075627-3-gary.yang%40cixtech.com
patch subject: [PATCH v6 2/3] reset: add Sky1 soc reset support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260204/202602040111.sphIzkjq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040111.sphIzkjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040111.sphIzkjq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-sky1-base.c:97:5: warning: no previous prototype for function 'sky1_reset_common_probe' [-Wmissing-prototypes]
      97 | int sky1_reset_common_probe(struct platform_device *pdev,
         |     ^
   drivers/reset/reset-sky1-base.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | int sky1_reset_common_probe(struct platform_device *pdev,
         | ^
         | static 
   1 warning generated.


vim +/sky1_reset_common_probe +97 drivers/reset/reset-sky1-base.c

    96	
  > 97	int sky1_reset_common_probe(struct platform_device *pdev,
    98				const struct sky1_src_variant *variant)
    99	{
   100		struct sky1_src *sky1src;
   101		struct device *dev = &pdev->dev;
   102	
   103		sky1src = devm_kzalloc(dev, sizeof(*sky1src), GFP_KERNEL);
   104		if (!sky1src)
   105			return -ENOMEM;
   106	
   107		sky1src->regmap = device_node_to_regmap(dev->parent->of_node);
   108		if (IS_ERR(sky1src->regmap)) {
   109			dev_err(dev, "Unable to get sky1-src regmap");
   110			return PTR_ERR(sky1src->regmap);
   111		}
   112	
   113		sky1src->signals = variant->signals;
   114		sky1src->rcdev.owner     = THIS_MODULE;
   115		sky1src->rcdev.nr_resets = variant->signals_num;
   116		sky1src->rcdev.ops       = &sky1_src_ops;
   117		sky1src->rcdev.of_node   = dev->parent->of_node;
   118		sky1src->rcdev.dev       = dev;
   119	
   120		return devm_reset_controller_register(dev, &sky1src->rcdev);
   121	}
   122	EXPORT_SYMBOL_GPL(sky1_reset_common_probe);
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

