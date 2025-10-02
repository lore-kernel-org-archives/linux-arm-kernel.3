Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08984CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jbpWCESyQRXQRL4NHZ+5x9fswk3N/wuUudMSD0iTADQ=; b=HD0yzOI9km/DgRJDHtKkRozmkp
	dk2a+b7pEnD2uQEyKMIhZfXi6oHMS0SG2GQEjYQ4bMlK0nb+XYiIMcE1qKOLrXznz4+MJE261h/Mm
	PF7DUrjVMN//h6/1FQmH6OzB8TD+sh8FaWfu+6Z2WkMI+dJ6czn49GHFWHXrA1My9vXtOWH9WuXRR
	NLQ3CpJmC7JJK/TzZUyO64jBVVCl/moJw6W7fTuo/Mve+vLTJ5zQZ+Fu2EXVdfPdb8XE6GmaZLzO4
	JIHT9Hna6AbP9e/YQqKUSskOXl7LZnOYpx2kqOBvRAzYNML67fT8/riDsiD5CUEmUmMpVzNlITpOM
	L8eyzT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4R6g-0000000BK92-3GaB;
	Thu, 02 Oct 2025 21:44:58 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4R6e-0000000BK88-2baH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 21:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759441497; x=1790977497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+bQjfMox0LYSANw6kFUEUHC5pwsK+yglyGHXY1J7mTk=;
  b=gMOu41qa6rdPDgsYEA9CIDcaHbqcGe0Cc+hg6r/KdQf9OoxwzqOHwCYu
   mxwvmZrOlFeIk5ac19fn7Uc4EvWGcSwG4rCcouin5IPJhDkagaIH9sj/Y
   pCxSQT0P9XiV/FIwPl7RVvK3ARsdBZJBKfgGZEuty7KwWwqAvdqXwa4aP
   jc4/P6myO9rvwGN2bpbYXcqnKB6ilX1LZEmYeC/r42hn6Iw8/wEeB7x7t
   7Qk5RSL9EPCmrqkoP68a4q9pFqc7MGJSG5w1vmPoDZJpe2EhkCeeMRyDc
   ikgsXgsMm/9KwMoMDwa5sosxd6PnX8xFmC9N0EFHxbQrCP6fG1AQmGtiS
   w==;
X-CSE-ConnectionGUID: PF6SY7ruTjmWEBtEZj0qSg==
X-CSE-MsgGUID: IAFWr4f4QKmgYTH8lzTszA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61770307"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="61770307"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 14:44:54 -0700
X-CSE-ConnectionGUID: jfS8c8r1T8qbK/zClWus7A==
X-CSE-MsgGUID: uCEahISYSu20Xtv6VqmdzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="210114226"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2025 14:44:53 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4R6Z-00048Z-0W;
	Thu, 02 Oct 2025 21:44:51 +0000
Date: Fri, 3 Oct 2025 05:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:csi-v6 3/7] drivers/media/platform/video-mux.c:172:10: error:
 'const struct v4l2_subdev_video_ops' has no member named 'g_frame_interval'
Message-ID: <202510030540.zCd32Zmk-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_144456_704721_2299DD81 
X-CRM114-Status: GOOD (  10.04  )
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

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git csi-v6
head:   9afab5ec0a06e2fc9c2cb2b739bc6caececf815a
commit: 4d73fea00b5748e8b6fb7363f4fefa75bc998932 [3/7] media: staging/imx: add frame intervals back in
config: csky-randconfig-001-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030540.zCd32Zmk-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030540.zCd32Zmk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510030540.zCd32Zmk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/video-mux.c:172:10: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_frame_interval'
     172 |         .g_frame_interval = vidsw_g_frame_interval,
         |          ^~~~~~~~~~~~~~~~
>> drivers/media/platform/video-mux.c:172:29: error: initialization of 'int (*)(struct v4l2_subdev *, void *, unsigned int *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_frame_interval *)' [-Wincompatible-pointer-types]
     172 |         .g_frame_interval = vidsw_g_frame_interval,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/video-mux.c:172:29: note: (near initialization for 'video_mux_subdev_video_ops.s_rx_buffer')
   drivers/media/platform/video-mux.c:145:12: note: 'vidsw_g_frame_interval' declared here
     145 | static int vidsw_g_frame_interval(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/video-mux.c:173:10: error: 'const struct v4l2_subdev_video_ops' has no member named 's_frame_interval'
     173 |         .s_frame_interval = vidsw_s_frame_interval,
         |          ^~~~~~~~~~~~~~~~
>> drivers/media/platform/video-mux.c:173:29: error: initialization of 'int (*)(struct v4l2_subdev *, u32)' {aka 'int (*)(struct v4l2_subdev *, unsigned int)'} from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_frame_interval *)' [-Wincompatible-pointer-types]
     173 |         .s_frame_interval = vidsw_s_frame_interval,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/video-mux.c:173:29: note: (near initialization for 'video_mux_subdev_video_ops.pre_streamon')
   drivers/media/platform/video-mux.c:155:12: note: 'vidsw_s_frame_interval' declared here
     155 | static int vidsw_s_frame_interval(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +172 drivers/media/platform/video-mux.c

   169	
   170	static const struct v4l2_subdev_video_ops video_mux_subdev_video_ops = {
   171		.s_stream = video_mux_s_stream,
 > 172		.g_frame_interval = vidsw_g_frame_interval,
 > 173		.s_frame_interval = vidsw_s_frame_interval,
   174	};
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

