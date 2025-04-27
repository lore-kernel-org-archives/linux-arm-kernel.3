Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB2BC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuiLlTEwvMVEuk2zBswUQzAEJLSP6SvCt52u9968qrk=; b=uBlXzgBcK1+lj51gsP+IJdzK59
	+6I+u7N/c0IpmwbIIAMuyFr9KyVCgWDQs1hi5lPosOQk6Jv1HJwlVBtdORP6Xc0gCepwbXu7T2Zj2
	LbbGIN5sx6vXY2No1dvBi5AWAw83zZLPbaBj+FhJQoDz2Beo2pqGUFvN9eAmPjwi9XAeRM5RputJm
	neV1RXbYO66Cn7AAjraJ8WJ8aQECPw/4hceS7bPjUycqA/oraInRUaqtDtv5MvWGhhWDZr7A0L7et
	niv6jhWvEZ6zLoaWCkE/XBqHlcMaR3DvsYit7DNIvpsLoIqa1SRKICoxWT6CtY6cchkTafI5etjCg
	JojFV1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xcU-00000003DHl-20kU;
	Sun, 27 Apr 2025 08:44:14 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xXt-00000003CbE-2AWr;
	Sun, 27 Apr 2025 08:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745743170; x=1777279170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3JJDGurve+hRagJydOAH5F2IgPnuoUcTq5M/7yzwLbQ=;
  b=GFDCQO7ctVUo563jPLtvBOOgGtEiNRYuvcrHkZHxAGNdbuyfIzBz7wdO
   5wopMHHIbfmqs0ZeHXA9plreGJUHzxbenhFtGWb3QRfJIabJT934Uauju
   jVlTD/ZxG0Q2mksgfiS5/nrqffIN5pjS2msVpE8G1HjSP5jzpZhnzrIuz
   bQLceQDD4BGIX7j7jMYXzWDg42cWEAm/xkIZohhNO1BK8Cd307ix6CplR
   pdDGeTMKyNAeBJaUysX0Ot0WJsWt9g2zKhhko2LnhitM6+NBBtQKPuTX9
   Nkq4TokrXLt4Xqg646+BF5cDHi/jYnMEeR8nmiNSGRkvv63BCjCBBX90z
   w==;
X-CSE-ConnectionGUID: RPt6KDZJR9SioHWMPTz1+w==
X-CSE-MsgGUID: wLYHz4m8RVyPtlbngA+cuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="51019950"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="51019950"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 01:39:28 -0700
X-CSE-ConnectionGUID: X/0Q7e+NRPCHQlG2RMExcA==
X-CSE-MsgGUID: +s39nTQgSrOmKR05DHz2wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="134199044"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Apr 2025 01:39:26 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8xXo-0006CP-0j;
	Sun, 27 Apr 2025 08:39:24 +0000
Date: Sun, 27 Apr 2025 16:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jianhua Lin <jianhua.lin@mediatek.com>
Subject: Re: [PATCH 1/1] media: mediatek: jpeg: add compatible for MT8188 SoC
Message-ID: <202504271638.9nCgQcOR-lkp@intel.com>
References: <20250426081928.27351-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426081928.27351-1-jianhua.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_013929_596548_868CBD54 
X-CRM114-Status: GOOD (  10.92  )
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250427/202504271638.9nCgQcOR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271638.9nCgQcOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271638.9nCgQcOR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1948:10: error: 'const struct mtk_jpeg_variant' has no member named 'support_34bit'
    1948 |         .support_34bit = true,
         |          ^~~~~~~~~~~~~
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1964:10: error: 'const struct mtk_jpeg_variant' has no member named 'support_34bit'
    1964 |         .support_34bit = true,
         |          ^~~~~~~~~~~~~


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

