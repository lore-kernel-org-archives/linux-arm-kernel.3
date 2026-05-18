Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BEACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfp9Xfl9F8C0qLignbu5BJHJOBkG39IsvvzY8WnS24M=; b=pCEmDlh7PCqn4ojcQySAfIveQD
	wW+8snHxTNN54SdXuasqTUtwdozvAix9GltNirQpySNtDYUuxao8JxUy8SFToxcoFNKXwCKPlpRAF
	fjOmKztKRg0AELH4yV2yxC9PlTwhyvbNfkjEIzydqMjH1xhQ2WB9jIvNjKroRU2YQVBUTtTObHUQ/
	cottDwdpa7mSS3xF2FYyQEsP6S21Abeup24ELIOuFfpNaVndDTO3tqHzi/aI82KNX/O78l3GgXonP
	MxzDtKk+OEuoZW5Z1BFnJqIoGjqZmB0SKVXjLOYZoO80Q5LJTenHyCi7geOEpDPe9oS+G1YT3YVRS
	Qt+PO85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4d0-0000000Gthl-2mOG;
	Mon, 18 May 2026 20:31:54 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4cx-0000000Gth7-0hL2;
	Mon, 18 May 2026 20:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779136311; x=1810672311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ydXo2XIcnCDnuaeWYRtalIfepOWgfDw1EKpHwpkVH/8=;
  b=bqb7qO+W3uRlj1qGK7cfohtnEXLiGAzf7ASjCstnJymMxzJSJYwf54tY
   CQxH+PX7wO20O8N5zmrBXPyCWeQ2AwbLO50r65mNr8dQ9m6dlYAGT7akk
   mXbrOKKsUr0cT3G74x09V4wJgHcG5qIMfRJpBHUAm06UlGly038XC0G0v
   tErSluAH9D+XvlF+U3fhQDm1M7tMQAqlYc9pQRP+l9h77a/zw8RLbhJFj
   o7kCVtjrcmWQFBO7AQlyosZ8uRNn8r2gQd1DefusLLQZWwjHr6dH5fYIX
   Bd3Ke+yVTf/TTri9swPJloYQwE6wJDW1ZRLbEaLenIpeD+Zf+By2V1W+8
   Q==;
X-CSE-ConnectionGUID: nlyNt4vIQEOyQ50jm6IiKA==
X-CSE-MsgGUID: jzKdZo8mRe23vfFdgVWUeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80035064"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="80035064"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 13:31:50 -0700
X-CSE-ConnectionGUID: d0m9t1lWTf6cVYdn+o0JBQ==
X-CSE-MsgGUID: 13v+sl6tR2GHBYRSdDRZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="233164454"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 May 2026 13:31:47 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP4cq-000000003N4-14ih;
	Mon, 18 May 2026 20:31:44 +0000
Date: Tue, 19 May 2026 04:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] media: mediatek: mdp: avoid double free on video
 register failure
Message-ID: <202605190406.bMshG7YY-lkp@intel.com>
References: <20260518125500.1000083-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518125500.1000083-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_133151_247353_55F73BEB 
X-CRM114-Status: GOOD (  12.55  )
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
[also build test ERROR on media-tree/master linus/master v7.1-rc4 next-20260518]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mediatek-mdp-avoid-double-free-on-video-register-failure/20260518-211648
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260518125500.1000083-1-lgs201920130244%40gmail.com
patch subject: [PATCH] media: mediatek: mdp: avoid double free on video register failure
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190406.bMshG7YY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190406.bMshG7YY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190406.bMshG7YY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c: In function 'mtk_mdp_register_m2m_device':
>> drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:1217:40: error: expected ';' before 'mdp'
    1217 |         video_device_release(mdp->vdev)
         |                                        ^
         |                                        ;
    1218 |         mdp->vdev = NULL;
         |         ~~~                             


vim +1217 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c

  1172	
  1173	int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
  1174	{
  1175		struct device *dev = &mdp->pdev->dev;
  1176		int ret;
  1177	
  1178		mdp->variant = &mtk_mdp_default_variant;
  1179		mdp->vdev = video_device_alloc();
  1180		if (!mdp->vdev) {
  1181			dev_err(dev, "failed to allocate video device\n");
  1182			ret = -ENOMEM;
  1183			goto err_video_alloc;
  1184		}
  1185		mdp->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
  1186		mdp->vdev->fops = &mtk_mdp_m2m_fops;
  1187		mdp->vdev->ioctl_ops = &mtk_mdp_m2m_ioctl_ops;
  1188		mdp->vdev->release = video_device_release_empty;
  1189		mdp->vdev->lock = &mdp->lock;
  1190		mdp->vdev->vfl_dir = VFL_DIR_M2M;
  1191		mdp->vdev->v4l2_dev = &mdp->v4l2_dev;
  1192		snprintf(mdp->vdev->name, sizeof(mdp->vdev->name), "%s:m2m",
  1193			 MTK_MDP_MODULE_NAME);
  1194		video_set_drvdata(mdp->vdev, mdp);
  1195	
  1196		mdp->m2m_dev = v4l2_m2m_init(&mtk_mdp_m2m_ops);
  1197		if (IS_ERR(mdp->m2m_dev)) {
  1198			dev_err(dev, "failed to initialize v4l2-m2m device\n");
  1199			ret = PTR_ERR(mdp->m2m_dev);
  1200			goto err_m2m_init;
  1201		}
  1202	
  1203		ret = video_register_device(mdp->vdev, VFL_TYPE_VIDEO, 2);
  1204		if (ret) {
  1205			dev_err(dev, "failed to register video device\n");
  1206			goto err_vdev_register;
  1207		}
  1208		mdp->vdev->release = video_device_release;
  1209	
  1210		v4l2_info(&mdp->v4l2_dev, "driver registered as /dev/video%d",
  1211			  mdp->vdev->num);
  1212		return 0;
  1213	
  1214	err_vdev_register:
  1215		v4l2_m2m_release(mdp->m2m_dev);
  1216	err_m2m_init:
> 1217		video_device_release(mdp->vdev)
  1218		mdp->vdev = NULL;
  1219	err_video_alloc:
  1220	
  1221		return ret;
  1222	}
  1223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

