Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F4CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9N/4QYyb5CyHXgCgw/9fZIPmkkQbrIVWQ0yYR+VQ+o=; b=VRrGo9kdMyZPvvR1oGYVbhsIpQ
	cA+8QW/4jMdxG+f5cQK52p3zTqPUYJr5LtYjO2cLFQqH6jtYH8U0BA5PjxvSEhNF/XDuGjpHSL+nr
	5wYBDP0IRxAPUX3Kv3go3J/mvPi6fuItdODThD7oh7ijoQnKbg+rpS0mbQzvHkxvNkeeqftgLbGY5
	Qq4sDC6Gu8dQb1lomy+rU0Dbzhtp+WIsrR2stBqu5I0KrbzP5N0Bd26pFR05ZUdyHNTM4iluqEjvk
	hT0Y/FuB3D37JuQQ2FCdR7fYThEQ6R37p50RdfCYzIyGtv6JBx2/14hLKVcTyO/isx4gg1lq+6weu
	Lvxh4mFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xeO-00000003DQa-0KVU;
	Sun, 27 Apr 2025 08:46:12 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xXt-00000003CbH-28qC;
	Sun, 27 Apr 2025 08:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745743170; x=1777279170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5isVS8GkuL0a55DBwyh9ZXrtSqb336aZOmGprl0xtxQ=;
  b=AZgCtSkeyh2xowPFj0nGT6jGWS4Kt90IcvyN+oQvZ427IQEE1gR7PUu4
   0iMuE99ITIch3eouWnrRzSlakK6/wp6wGEM3xST3ioPfdetidAbWgqpwj
   ZvE5hZDjrfnZLhC18BbZCuCiE8wmgosRGIczGP7ijfjPEfD5gass8XIwF
   3J5H40RJdNVsaJ5rJeqbSZmik+vnVghG1fbC74KGaRAgwQrS2DBeCyiuC
   cLKEixN262ybMmmpFlz7QNMMRyHBvwzsLOaA7ky9OULB9XyMsG/QdCHpK
   1VF0s0zjg5lzr8dH5Zgn6ZftSyEkxm6HTzQOLKHOmcTGUg4sp7CiQBTkZ
   A==;
X-CSE-ConnectionGUID: MMLUAA1XSaKKGQXQLA4HBw==
X-CSE-MsgGUID: m9u3HzemRqSLimYkRJBr+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="58331928"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="58331928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 01:39:29 -0700
X-CSE-ConnectionGUID: xuRv65tAQaqvZvP8J7t7jg==
X-CSE-MsgGUID: Fes50s8iR2eAyk9cHTtoaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="170470569"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Apr 2025 01:39:27 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8xXo-0006CR-0n;
	Sun, 27 Apr 2025 08:39:24 +0000
Date: Sun, 27 Apr 2025 16:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jianhua Lin <jianhua.lin@mediatek.com>
Subject: Re: [PATCH 1/1] media: mediatek: jpeg: add compatible for MT8188 SoC
Message-ID: <202504271611.pB3EgBfr-lkp@intel.com>
References: <20250426081928.27351-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426081928.27351-1-jianhua.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_013929_594915_45CA7A94 
X-CRM114-Status: GOOD (  11.35  )
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

Hi Jianhua,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianhua-Lin/media-mediatek-jpeg-add-compatible-for-MT8188-SoC/20250426-162259
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250426081928.27351-1-jianhua.lin%40mediatek.com
patch subject: [PATCH 1/1] media: mediatek: jpeg: add compatible for MT8188 SoC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250427/202504271611.pB3EgBfr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271611.pB3EgBfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271611.pB3EgBfr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1948:3: error: field designator 'support_34bit' does not refer to any field in type 'const struct mtk_jpeg_variant'
    1948 |         .support_34bit = true,
         |         ~^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1964:3: error: field designator 'support_34bit' does not refer to any field in type 'const struct mtk_jpeg_variant'
    1964 |         .support_34bit = true,
         |         ~^~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1948 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

  1934	
  1935	static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
  1936		.clks = mtk_jpeg_clocks,
  1937		.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
  1938		.formats = mtk_jpeg_enc_formats,
  1939		.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
  1940		.qops = &mtk_jpeg_enc_qops,
  1941		.irq_handler = mtk_jpeg_enc_irq,
  1942		.hw_reset = mtk_jpeg_enc_reset,
  1943		.m2m_ops = &mtk_jpeg_enc_m2m_ops,
  1944		.dev_name = "mtk-jpeg-enc",
  1945		.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
  1946		.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
  1947		.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> 1948		.support_34bit = true,
  1949	};
  1950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

