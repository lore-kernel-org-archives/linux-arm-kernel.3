Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2006DD7237F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MWk6QHSw3kBGoFo3WuBGkaVSB2GJJ0RQE8xmhnr+tw=; b=L2ba+QU5CgjlzgChQ6zLl7vmrR
	VUsPP2X9NYktl8wRH/PwZeqBdMBKWrajFf2lUZndRHD6E6GI3GUc7ebQdB+sQ/Eku85oQxzLmTa43
	+Zq+YT6XvaMMfkGkGbHNyIU7PjLATbGMiz8nSsB/+IxMfRY4bTXxZggf0eUyh3ljallhNnZVWH3gt
	O/17joB2+CmCKAnDUkPXC2C2xlaz7/cdydog0bRHqahzcsIx5yKz2iGTeORIWjgbt6Oh7Ke7j+DJ3
	ys9G48izbcddle0baKdzTrdVBfBfBTqbj0Db79OtuidbZDZnPrGesGDVFttlOQEO2Jj7hujFfBDRN
	QyR3Q8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGFk-00000008uWk-1CFQ;
	Fri, 23 Jan 2026 12:27:04 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGFh-00000008uWG-3nzq;
	Fri, 23 Jan 2026 12:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769171222; x=1800707222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3iT+Gee8r381xtGkYnpzN+q/2dGkK5QY8w1KqVQC8Gs=;
  b=Km09lhfgCfbG3ysMu0CMuEf/ECVmQqHKxzd7GO2uxgttiEr6kPy3u0wN
   r86XvXx/B/npWNIW8L5LWSpHrTkafBr8LOr3paOoNJvLMTPEAHf1TTm0P
   UTvC5m4WsjzcnrPLVrQyXmdAFUM6hgIuUujO9e1QUATmQov2habHAo+DQ
   UY63dH5ZUvCpOK5yiPQsWVHvnixouZW0dYKMGIXSLLvtZUpGaduKyo3mt
   19DB7cJAWVdZPRyql0BePZdgY5btwpYGbfYmKZNs7/Cn4MOxqwUaf9Ch8
   JoCSkp0iM/ZBdsp+6Y+Dpf8+e0j4ysHvymfSRUlZlsucZaLsXc8DzlZ4s
   w==;
X-CSE-ConnectionGUID: 5aSOwroHT+6OoB300skxpA==
X-CSE-MsgGUID: Xujxj4iaQLuiSd5qbIVJzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87841450"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="87841450"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 04:26:59 -0800
X-CSE-ConnectionGUID: 5n8F5fXOSP+30nLg7BP14g==
X-CSE-MsgGUID: zshX63vFSbi7DxIoTLduJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206274997"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2026 04:26:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjGFY-00000000Twa-42p4;
	Fri, 23 Jan 2026 12:26:52 +0000
Date: Fri, 23 Jan 2026 20:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v12 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Message-ID: <202601232059.fCMMbALw-lkp@intel.com>
References: <20260123031713.14621-6-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123031713.14621-6-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_042702_024276_6B17BCBC 
X-CRM114-Status: GOOD (  13.28  )
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

Hi Kyrie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master media-tree/master linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyrie-Wu/media-mediatek-jpeg-fix-jpeg-cores-amounts-setting/20260123-112425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260123031713.14621-6-kyrie.wu%40mediatek.com
patch subject: [PATCH v12 05/12] media: mediatek: jpeg: Fix multi-core clk suspend and resume setting
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260123/202601232059.fCMMbALw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601232059.fCMMbALw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601232059.fCMMbALw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:429:12: warning: 'mtk_jpegenc_resume' defined but not used [-Wunused-function]
     429 | static int mtk_jpegenc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:420:12: warning: 'mtk_jpegenc_suspend' defined but not used [-Wunused-function]
     420 | static int mtk_jpegenc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:412:12: warning: 'mtk_jpegenc_pm_resume' defined but not used [-Wunused-function]
     412 | static int mtk_jpegenc_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:402:12: warning: 'mtk_jpegenc_pm_suspend' defined but not used [-Wunused-function]
     402 | static int mtk_jpegenc_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: In function 'mtk_jpegdec_hw_irq_handler':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:549:30: warning: variable 'ctx' set but not used [-Wunused-but-set-variable]
     549 |         struct mtk_jpeg_ctx *ctx;
         |                              ^~~
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: At top level:
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:707:12: warning: 'mtk_jpegdec_resume' defined but not used [-Wunused-function]
     707 | static int mtk_jpegdec_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:698:12: warning: 'mtk_jpegdec_suspend' defined but not used [-Wunused-function]
     698 | static int mtk_jpegdec_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:690:12: warning: 'mtk_jpegdec_pm_resume' defined but not used [-Wunused-function]
     690 | static int mtk_jpegdec_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:680:12: warning: 'mtk_jpegdec_pm_suspend' defined but not used [-Wunused-function]
     680 | static int mtk_jpegdec_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/mtk_jpegenc_resume +429 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c

   401	
 > 402	static int mtk_jpegenc_pm_suspend(struct device *dev)
   403	{
   404		struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
   405	
   406		clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
   407					   jpeg->venc_clk.clks);
   408	
   409		return 0;
   410	}
   411	
 > 412	static int mtk_jpegenc_pm_resume(struct device *dev)
   413	{
   414		struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
   415	
   416		return clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
   417					       jpeg->venc_clk.clks);
   418	}
   419	
 > 420	static int mtk_jpegenc_suspend(struct device *dev)
   421	{
   422		struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
   423	
   424		v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
   425	
   426		return pm_runtime_force_suspend(dev);
   427	}
   428	
 > 429	static int mtk_jpegenc_resume(struct device *dev)
   430	{
   431		struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
   432		int ret;
   433	
   434		ret = pm_runtime_force_resume(dev);
   435		if (ret < 0)
   436			return ret;
   437	
   438		v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
   439	
   440		return 0;
   441	}
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

