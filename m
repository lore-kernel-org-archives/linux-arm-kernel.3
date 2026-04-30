Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E49FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 03:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bx2NKOvSqVgn6FQHVX7Mo9G4tpgbHKAK6wJi45SFYiY=; b=rQ4ldFlyCdmosZPFltAzr9ZPtU
	CDw4FkLySvaO/QeVSwMroWPHwD6VQmSh8llbbQCXRkNytZwjbpsVAT7ZwU0z6K0xRZZGRl5ZX5yml
	YFkGJNZsNOfe9JevVyorK8gPAPX805E7o5y+j+kefLcrzMJfDm65XR6uySVd+IPublW07/BtIOBm+
	KsVLXQssWlBSp/PTfjJew/GZiDqR+3M1Sdoe+rJA9Vt1+oI6XI3RtM9prtTyPQkGnT2S3B9m5GZdR
	sNyJg/PijhFodRBTXykfen5f9mt2Yj66PknQc+pDaCnto/74bK5c5km42b2GQWPKX9YvHB+Ot8jmU
	Va/D8pjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIJU-00000004bjZ-0Xl1;
	Thu, 30 Apr 2026 03:43:44 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIJR-00000004bii-38O2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 03:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777520622; x=1809056622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LSUoyAnS3qyXHkVYSP2kHgLGwbPtR+uewKnGUpz/K/8=;
  b=UF4q5Pa9WpvdwfQv8sPoKGyI1X5NcrIxAX0K6/jBAIPgH7if99bI2DlF
   4Xdjv+F7oYnxvFRw3kmccEVy4ZstqfdSF4Qo+FedWJkRi902+1IZUCYBW
   LeWFhAWStAywXYP/xixK3wQ5PIYLZOwO1mFmpATCX9UC/vUqZusQQCP7R
   XIbtRZAqsGfvWQthTru34ooerFv/OCeXg54yDPjkVHcBuxVboTfnOdKm5
   C0C4rCZJuSx9b2vl7YMH/XYkHd+ykzPDUlncTVcO0j7Ajo90GC+1oIFxb
   dH5iFG4yMuy4trOPCz3IaQJYE8ygSI5VP2JjztCK2ikYlvwzrR6bgpQry
   Q==;
X-CSE-ConnectionGUID: 0CRLLraIQcCfV73Kgv6Zhg==
X-CSE-MsgGUID: Kyvf7YNkSTSL2Rhc58BLMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82317518"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82317518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:43:40 -0700
X-CSE-ConnectionGUID: 9rP5uj6BQWibB8lOKzn9Mg==
X-CSE-MsgGUID: 5wkqXb7wT9KuGBtol5KTJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="272575622"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2026 20:43:36 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIIJJ-00000000Btg-2HtA;
	Thu, 30 Apr 2026 03:43:33 +0000
Date: Thu, 30 Apr 2026 11:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?67CV66qF7ZuI?= <mhun512@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Myeonghun Pak <mhun512@gmail.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] media: cedrus: clean up media device on probe failure
Message-ID: <202604301101.Nszhy0yB-lkp@intel.com>
References: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_204341_830418_A43A6D05 
X-CRM114-Status: GOOD (  12.87  )
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

Hi 박명훈,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/media-cedrus-clean-up-media-device-on-probe-failure/20260427-235223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20260427100049.29034-1-pakmyeonghun%40bagmyeonghun-ui-MacBookPro.local
patch subject: [PATCH] media: cedrus: clean up media device on probe failure
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260430/202604301101.Nszhy0yB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301101.Nszhy0yB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301101.Nszhy0yB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/sunxi/cedrus/cedrus.c:538:1: warning: unused label 'err_m2m' [-Wunused-label]
     538 | err_m2m:
         | ^~~~~~~~
   1 warning generated.


vim +/err_m2m +538 drivers/staging/media/sunxi/cedrus/cedrus.c

50e761516f2b8c Paul Kocialkowski 2018-09-13  449  
50e761516f2b8c Paul Kocialkowski 2018-09-13  450  static int cedrus_probe(struct platform_device *pdev)
50e761516f2b8c Paul Kocialkowski 2018-09-13  451  {
50e761516f2b8c Paul Kocialkowski 2018-09-13  452  	struct cedrus_dev *dev;
50e761516f2b8c Paul Kocialkowski 2018-09-13  453  	struct video_device *vfd;
50e761516f2b8c Paul Kocialkowski 2018-09-13  454  	int ret;
50e761516f2b8c Paul Kocialkowski 2018-09-13  455  
50e761516f2b8c Paul Kocialkowski 2018-09-13  456  	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
50e761516f2b8c Paul Kocialkowski 2018-09-13  457  	if (!dev)
50e761516f2b8c Paul Kocialkowski 2018-09-13  458  		return -ENOMEM;
50e761516f2b8c Paul Kocialkowski 2018-09-13  459  
708938f8495147 Dmitry Osipenko   2022-08-18  460  	platform_set_drvdata(pdev, dev);
708938f8495147 Dmitry Osipenko   2022-08-18  461  
50e761516f2b8c Paul Kocialkowski 2018-09-13  462  	dev->vfd = cedrus_video_device;
50e761516f2b8c Paul Kocialkowski 2018-09-13  463  	dev->dev = &pdev->dev;
50e761516f2b8c Paul Kocialkowski 2018-09-13  464  	dev->pdev = pdev;
50e761516f2b8c Paul Kocialkowski 2018-09-13  465  
50e761516f2b8c Paul Kocialkowski 2018-09-13  466  	ret = cedrus_hw_probe(dev);
50e761516f2b8c Paul Kocialkowski 2018-09-13  467  	if (ret) {
50e761516f2b8c Paul Kocialkowski 2018-09-13  468  		dev_err(&pdev->dev, "Failed to probe hardware\n");
50e761516f2b8c Paul Kocialkowski 2018-09-13  469  		return ret;
50e761516f2b8c Paul Kocialkowski 2018-09-13  470  	}
50e761516f2b8c Paul Kocialkowski 2018-09-13  471  
50e761516f2b8c Paul Kocialkowski 2018-09-13  472  	mutex_init(&dev->dev_mutex);
50e761516f2b8c Paul Kocialkowski 2018-09-13  473  
7c38a551bda1b7 Jernej Skrabec    2022-02-01  474  	INIT_DELAYED_WORK(&dev->watchdog_work, cedrus_watchdog);
7c38a551bda1b7 Jernej Skrabec    2022-02-01  475  
50e761516f2b8c Paul Kocialkowski 2018-09-13  476  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
50e761516f2b8c Paul Kocialkowski 2018-09-13  477  	if (ret) {
50e761516f2b8c Paul Kocialkowski 2018-09-13  478  		dev_err(&pdev->dev, "Failed to register V4L2 device\n");
50e761516f2b8c Paul Kocialkowski 2018-09-13  479  		return ret;
50e761516f2b8c Paul Kocialkowski 2018-09-13  480  	}
50e761516f2b8c Paul Kocialkowski 2018-09-13  481  
50e761516f2b8c Paul Kocialkowski 2018-09-13  482  	vfd = &dev->vfd;
50e761516f2b8c Paul Kocialkowski 2018-09-13  483  	vfd->lock = &dev->dev_mutex;
50e761516f2b8c Paul Kocialkowski 2018-09-13  484  	vfd->v4l2_dev = &dev->v4l2_dev;
50e761516f2b8c Paul Kocialkowski 2018-09-13  485  
50e761516f2b8c Paul Kocialkowski 2018-09-13  486  	snprintf(vfd->name, sizeof(vfd->name), "%s", cedrus_video_device.name);
50e761516f2b8c Paul Kocialkowski 2018-09-13  487  	video_set_drvdata(vfd, dev);
50e761516f2b8c Paul Kocialkowski 2018-09-13  488  
50e761516f2b8c Paul Kocialkowski 2018-09-13  489  	dev->m2m_dev = v4l2_m2m_init(&cedrus_m2m_ops);
50e761516f2b8c Paul Kocialkowski 2018-09-13  490  	if (IS_ERR(dev->m2m_dev)) {
50e761516f2b8c Paul Kocialkowski 2018-09-13  491  		v4l2_err(&dev->v4l2_dev,
50e761516f2b8c Paul Kocialkowski 2018-09-13  492  			 "Failed to initialize V4L2 M2M device\n");
50e761516f2b8c Paul Kocialkowski 2018-09-13  493  		ret = PTR_ERR(dev->m2m_dev);
50e761516f2b8c Paul Kocialkowski 2018-09-13  494  
bac875349f8525 Jernej Skrabec    2019-04-07  495  		goto err_v4l2;
50e761516f2b8c Paul Kocialkowski 2018-09-13  496  	}
50e761516f2b8c Paul Kocialkowski 2018-09-13  497  
50e761516f2b8c Paul Kocialkowski 2018-09-13  498  	dev->mdev.dev = &pdev->dev;
50e761516f2b8c Paul Kocialkowski 2018-09-13  499  	strscpy(dev->mdev.model, CEDRUS_NAME, sizeof(dev->mdev.model));
ae0688f659adb1 Hans Verkuil      2019-08-30  500  	strscpy(dev->mdev.bus_info, "platform:" CEDRUS_NAME,
ae0688f659adb1 Hans Verkuil      2019-08-30  501  		sizeof(dev->mdev.bus_info));
50e761516f2b8c Paul Kocialkowski 2018-09-13  502  
50e761516f2b8c Paul Kocialkowski 2018-09-13  503  	media_device_init(&dev->mdev);
50e761516f2b8c Paul Kocialkowski 2018-09-13  504  	dev->mdev.ops = &cedrus_m2m_media_ops;
50e761516f2b8c Paul Kocialkowski 2018-09-13  505  	dev->v4l2_dev.mdev = &dev->mdev;
50e761516f2b8c Paul Kocialkowski 2018-09-13  506  
0e17c50fcf6a9e Hans Verkuil      2020-02-03  507  	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
50e761516f2b8c Paul Kocialkowski 2018-09-13  508  	if (ret) {
50e761516f2b8c Paul Kocialkowski 2018-09-13  509  		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
e8660f15f165e6 Myeonghun Pak     2026-04-27  510  		goto err_media_cleanup;
50e761516f2b8c Paul Kocialkowski 2018-09-13  511  	}
50e761516f2b8c Paul Kocialkowski 2018-09-13  512  
50e761516f2b8c Paul Kocialkowski 2018-09-13  513  	v4l2_info(&dev->v4l2_dev,
50e761516f2b8c Paul Kocialkowski 2018-09-13  514  		  "Device registered as /dev/video%d\n", vfd->num);
50e761516f2b8c Paul Kocialkowski 2018-09-13  515  
bac875349f8525 Jernej Skrabec    2019-04-07  516  	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
bac875349f8525 Jernej Skrabec    2019-04-07  517  						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
bac875349f8525 Jernej Skrabec    2019-04-07  518  	if (ret) {
bac875349f8525 Jernej Skrabec    2019-04-07  519  		v4l2_err(&dev->v4l2_dev,
bac875349f8525 Jernej Skrabec    2019-04-07  520  			 "Failed to initialize V4L2 M2M media controller\n");
bac875349f8525 Jernej Skrabec    2019-04-07  521  		goto err_video;
bac875349f8525 Jernej Skrabec    2019-04-07  522  	}
bac875349f8525 Jernej Skrabec    2019-04-07  523  
50e761516f2b8c Paul Kocialkowski 2018-09-13  524  	ret = media_device_register(&dev->mdev);
50e761516f2b8c Paul Kocialkowski 2018-09-13  525  	if (ret) {
50e761516f2b8c Paul Kocialkowski 2018-09-13  526  		v4l2_err(&dev->v4l2_dev, "Failed to register media device\n");
50e761516f2b8c Paul Kocialkowski 2018-09-13  527  		goto err_m2m_mc;
50e761516f2b8c Paul Kocialkowski 2018-09-13  528  	}
50e761516f2b8c Paul Kocialkowski 2018-09-13  529  
50e761516f2b8c Paul Kocialkowski 2018-09-13  530  	return 0;
50e761516f2b8c Paul Kocialkowski 2018-09-13  531  
50e761516f2b8c Paul Kocialkowski 2018-09-13  532  err_m2m_mc:
50e761516f2b8c Paul Kocialkowski 2018-09-13  533  	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
50e761516f2b8c Paul Kocialkowski 2018-09-13  534  err_video:
50e761516f2b8c Paul Kocialkowski 2018-09-13  535  	video_unregister_device(&dev->vfd);
e8660f15f165e6 Myeonghun Pak     2026-04-27  536  err_media_cleanup:
e8660f15f165e6 Myeonghun Pak     2026-04-27  537  	media_device_cleanup(&dev->mdev);
bac875349f8525 Jernej Skrabec    2019-04-07 @538  err_m2m:
bac875349f8525 Jernej Skrabec    2019-04-07  539  	v4l2_m2m_release(dev->m2m_dev);
50e761516f2b8c Paul Kocialkowski 2018-09-13  540  err_v4l2:
50e761516f2b8c Paul Kocialkowski 2018-09-13  541  	v4l2_device_unregister(&dev->v4l2_dev);
50e761516f2b8c Paul Kocialkowski 2018-09-13  542  
50e761516f2b8c Paul Kocialkowski 2018-09-13  543  	return ret;
50e761516f2b8c Paul Kocialkowski 2018-09-13  544  }
50e761516f2b8c Paul Kocialkowski 2018-09-13  545  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

