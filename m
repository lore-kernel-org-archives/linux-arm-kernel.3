Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D176BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXt63rwPxe6Cu6FTkl+O+L7/EyK6TLSKrYC0+vzoEII=; b=DzUktHcJEpKHWImawAnDKEo5xS
	7QVXmym7A3Olh5gsSj1xd4yMXdlVMv7ws3mKIBF4GYr18NHwucmaGTsOiANv+ToI43S2BZgky6r/X
	X8AFsZAw3pl7t7ESp5GTiMDUjD1G537aSB31tgMPZ9AzNfCAqBCc247zBmxn7Q4NjopmDz/mo1exk
	YqusZCu8D09prietWEyp5JjPRTjhZ3nc906WO02NLQxvjQE3WMeH9IrQUysg/VrV7EzAnvXevwbiU
	C4/c9UBGWkfj7Fs+Z4OCJaqRN/aTDSr3trlqmrq06UELsQ44/QwNRM1re2bUTb80RCCSloo+0HfCu
	Qf0Y3IlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjF5-0000000CQkv-3UXc;
	Fri, 18 Jul 2025 11:27:07 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucicE-0000000CLBO-139P;
	Fri, 18 Jul 2025 10:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752835618; x=1784371618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V2u/KOLyQYJm4zca8JKpQcxFVXvlEbSp6+XWI+QNO88=;
  b=Y2H9IL4ITz6JVXBXMrIyiME/vWYVerVgAp3FIHO1fdUoGtTUFgQvHFG8
   AZ6C4LbqZJrZvnsDkeb8LQyxegBQprY/Wtmv/PFkqLZ/v16+W/t6QMxrA
   WCtPG2sOiWPzhGMMb62zKQwPu1zMaE6XzZtMcinLRyYySMUZbCWVktjbX
   qbOTv/6JsmZtjGur8vPdorEfevCk3NRp2YwGm/pKullIo7rs+r52nJodE
   NDJUndwaFctdoIV8jgxgl3diGbPdh4qnDaTuIgYAtfBT9C/aLqqvFkjW/
   h4Sb/8kRD/sVlhWNgXKZgsihSTyq22eI6dmGmEXzkxGVEGw4T87x+xFmu
   g==;
X-CSE-ConnectionGUID: XOXeuCcWT2urHpgikwHoUg==
X-CSE-MsgGUID: 2f7zFdA4Svavnn1cuC5lJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58907350"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="58907350"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 03:46:57 -0700
X-CSE-ConnectionGUID: jXryNwtJR/GWJL+OfsXMZQ==
X-CSE-MsgGUID: pfmBAjN7RzKl19/gMU4R8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="195157709"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2025 03:46:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucic6-000EZ1-2I;
	Fri, 18 Jul 2025 10:46:50 +0000
Date: Fri, 18 Jul 2025 18:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 11/26] media: videobuf2-v4l2: Support vb2_queue embedded
 in a context
Message-ID: <202507181803.MKWlcVqu-lkp@intel.com>
References: <20250717-multicontext-mainline-2025-v1-11-81ac18979c03@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-multicontext-mainline-2025-v1-11-81ac18979c03@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034658_340037_053F0EB0 
X-CRM114-Status: GOOD (  14.14  )
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

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on d968e50b5c26642754492dea23cbd3592bde62d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-mc-Add-per-file-handle-data-support/20250717-190546
base:   d968e50b5c26642754492dea23cbd3592bde62d8
patch link:    https://lore.kernel.org/r/20250717-multicontext-mainline-2025-v1-11-81ac18979c03%40ideasonboard.com
patch subject: [PATCH 11/26] media: videobuf2-v4l2: Support vb2_queue embedded in a context
config: x86_64-buildonly-randconfig-004-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181803.MKWlcVqu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181803.MKWlcVqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181803.MKWlcVqu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/common/videobuf2/videobuf2-v4l2.c:1012:5: error: call to undeclared function 'video_device_context_from_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1012 |                                 video_device_context_from_file(file, vdev);
         |                                 ^
>> drivers/media/common/videobuf2/videobuf2-v4l2.c:1011:31: error: incompatible integer to pointer conversion initializing 'struct video_device_context *' with an expression of type 'int' [-Wint-conversion]
    1011 |         struct video_device_context *ctx =
         |                                      ^
    1012 |                                 video_device_context_from_file(file, vdev);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-v4l2.c:1014:19: error: incomplete definition of type 'struct video_device_context'
    1014 |         return ctx ? &ctx->queue
         |                       ~~~^
   include/media/v4l2-dev.h:288:9: note: forward declaration of 'struct video_device_context'
     288 |         struct video_device_context *default_context;
         |                ^
   drivers/media/common/videobuf2/videobuf2-v4l2.c:1015:54: error: incomplete definition of type 'struct video_device_context'
    1015 |                    : vdev->default_context ? &vdev->default_context->queue
         |                                               ~~~~~~~~~~~~~~~~~~~~~^
   include/media/v4l2-dev.h:288:9: note: forward declaration of 'struct video_device_context'
     288 |         struct video_device_context *default_context;
         |                ^
   4 errors generated.


vim +/video_device_context_from_file +1012 drivers/media/common/videobuf2/videobuf2-v4l2.c

   992	
   993	/*
   994	 * The following functions are not part of the vb2 core API, but are helper
   995	 * functions that plug into struct v4l2_ioctl_ops, struct v4l2_file_operations
   996	 * and struct vb2_ops.
   997	 * They contain boilerplate code that most if not all drivers have to do
   998	 * and so they simplify the driver code.
   999	 */
  1000	
  1001	/*
  1002	 * Helper to get the vb2 queue either from:
  1003	 * 1) The video context bound to the open file handle
  1004	 * 2) The default context for context-aware drivers if userspace has not bound
  1005	 *    a context to the file handle
  1006	 * 3) From the video device for non-context aware drivers
  1007	 */
  1008	static struct vb2_queue *get_vb2_queue(struct file *file,
  1009					       struct video_device *vdev)
  1010	{
> 1011		struct video_device_context *ctx =
> 1012					video_device_context_from_file(file, vdev);
  1013	
> 1014		return ctx ? &ctx->queue
  1015			   : vdev->default_context ? &vdev->default_context->queue
  1016			   : vdev->queue;
  1017	}
  1018	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

