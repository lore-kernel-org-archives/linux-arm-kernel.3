Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017A7C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BH3T7qHwOp1a9o5tbDLQUUMqbdhvZojNgKi0kS7JfY=; b=mznaP75g0BIle4gBFBFu10id8x
	WxcomDkFYjhQfBkl9re2jnBYd+EY0bf6h3DHO2lw3BzT3AJ+IKGlpa0KrNdBf96SGcyO5CiJWugoA
	XDiDZyqAmR1pbD8nc7LWSdUPf9fNPDDa5YgjnPyflvVeZC686MVVuNlq+3g1Lv9sNFuoEE3dYKRzf
	ya5GXH2lGKNLdJakMZYgB7dHzA0Evjlifu7t5PUie776dJKBJ/Az/1GHW9rwrpLBlMIIBl2GTzOo9
	GdWEE9nmLsXW18d00SahTN0RQeQLFbjHnTGOFP3MQnw/fkepH+t7EsMaNbJvSBBtD4CVQmINiBtjz
	xxOUzTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqocs-0000000Ge0d-3k95;
	Mon, 03 Aug 2026 09:06:26 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqocq-0000000Ge01-0bP5;
	Mon, 03 Aug 2026 09:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785747985; x=1817283985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5r34M1HHBdLNcPvzBryAdGoZIZUgWkfLIrG031AonBo=;
  b=gL1wXxwISWNTMPqbNli4wfWMX5FGmS1N0wNoVM9n6PHPGFRU70IhT2OJ
   6MV9aFE2tQQAJRD3Xn6H8WNgdn29o0HjPCMVWbW8dy5sARX9kvGi7K2ZD
   d8I+9QgHA/FAuvv14DU6hjRpOyUDBB69gvl7+guAxaSiUTxQDX8gSMbzm
   XF6A+y8a7yRa1rdu8OSPNQCOvMcWeHjXzSGLgIGZ7T4I5hyipZmtTfigi
   HDGQ05RjRu8TjYB2I9VFqTVBbFHblso/MoTPazqmngdqI3klDuANK1fZg
   NS4IH/vCiN5QqdHFYEx9qRJ5MEMWo/I9SOEUtC40NxTelS1tgbQzAIMOD
   g==;
X-CSE-ConnectionGUID: MMW4WbvcRdKW96Jv7z5qGQ==
X-CSE-MsgGUID: 1/ICrvjaRMycWchOYN6Csw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="89957984"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="89957984"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 02:06:24 -0700
X-CSE-ConnectionGUID: HcefI9CnSy2NxCgotPKkRg==
X-CSE-MsgGUID: WdfcalN0TOm7U5TS4Q+O/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="266281795"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2026 02:06:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqocj-000000006Zh-2RBr;
	Mon, 03 Aug 2026 09:06:17 +0000
Date: Mon, 3 Aug 2026 17:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fan Wu <fanwu01@zju.edu.cn>, Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] media: mtk-jpeg: drain hardware completion before
 freeing context
Message-ID: <202608031631.Ha5cORQG-lkp@intel.com>
References: <20260708120833.755998-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708120833.755998-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_020624_263856_3EF60662 
X-CRM114-Status: GOOD (  11.62  )
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

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v7.2-rc5 next-20260731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mtk-jpeg-drain-hardware-completion-before-freeing-context/20260803-143440
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260708120833.755998-1-lgs201920130244%40gmail.com
patch subject: [PATCH] media: mtk-jpeg: drain hardware completion before freeing context
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260803/202608031631.Ha5cORQG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031631.Ha5cORQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031631.Ha5cORQG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c: In function 'mtk_jpeg_release':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1207:17: error: implicit declaration of function 'mtk_jpeg_release_hw'; did you mean 'mtk_jpeg_release'? [-Wimplicit-function-declaration]
    1207 |                 mtk_jpeg_release_hw(jpeg, ctx);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 mtk_jpeg_release


vim +1207 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

  1199	
  1200	static int mtk_jpeg_release(struct file *file)
  1201	{
  1202		struct mtk_jpeg_dev *jpeg = video_drvdata(file);
  1203		struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
  1204	
  1205		if (jpeg->variant->jpeg_worker) {
  1206			cancel_work_sync(&ctx->jpeg_work);
> 1207			mtk_jpeg_release_hw(jpeg, ctx);
  1208		}
  1209	
  1210		mutex_lock(&jpeg->lock);
  1211		v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
  1212		v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
  1213		v4l2_fh_del(&ctx->fh, file);
  1214		v4l2_fh_exit(&ctx->fh);
  1215		kfree(ctx);
  1216		mutex_unlock(&jpeg->lock);
  1217		return 0;
  1218	}
  1219	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

