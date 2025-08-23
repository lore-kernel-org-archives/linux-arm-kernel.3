Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AACCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 23:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aNKGOu5mAk+DcbqNLrFMLAD1hTsSfr4IsdLitSKfQE=; b=ZOc2etQJpRNMgXR80dzMBwkQpn
	BVxXo45jXJK/a5WYLsyFpoLNJZltZuTrrddsQGQ/6MTEwz2RIp2t8ipieP3huoT8IUCIFe0KmR1aU
	ZttMlcBzW76yYFsk07/6CawsWmqDEWzNmRj0eN8Vh7W146fZfos9bCFSoCHfizxvTMDYNYl6acH8L
	rtWQFPDjIqL6YnA2IV9mJUl1iGXtYDYVTAv9h0SpEAmJyBxnpECNTRfoHvs7nfwGj3xwSjcDmTk0Y
	WSwa7zDApXa0VKdgpSERRfoCkIZzsCqAywAQdk74lsucVI1pG8sMfLmFPNky7O/frbWjIhNqdD6Cb
	rIxoPewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upxWn-00000005SIC-0jc8;
	Sat, 23 Aug 2025 23:20:05 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upxUA-00000005SB8-13Fj;
	Sat, 23 Aug 2025 23:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755991042; x=1787527042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XtKM7eiCxZ0XFcJHdyLW+a+x0++34f9wWFWwximPqJI=;
  b=VTqzzPEfoCCw3hYvku77Gk2d2HKZ2tb+T7uz44zmKK5i4kvrKRGyFfgN
   LTbszpyON06L73UbVsJ7KXcIGz23ZltPR8VvHc1HfSArf2qNcnCUfZHtc
   gJ9GdzD1MkBjY41EVdw7tTk3lg48r5DZIE9cOBWwVbnCwYe5i2WGINo6M
   fCF0LRJk+YtXXjeIY2p98nzj/ovBpwK5oZf9T0znBiI3CZbcHJbJRhMjI
   4GOIcLKpWUmsoriK+OZpBnjB0Qan9oqBRo8yvndnVe9znPcrYv/HY6Vpi
   5NFUC6YqwEGGcQwLYsKk1GirsL3MsNpneE9kBLdraBO2EMPtBtKXfWsJ0
   g==;
X-CSE-ConnectionGUID: qL6GJKPcSNqcEwqnyaHW8A==
X-CSE-MsgGUID: 01EJ05HgTWGGL6RBHjPkaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58320859"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58320859"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 16:17:21 -0700
X-CSE-ConnectionGUID: IhBAIPK8QTOmrL+ANuUlfQ==
X-CSE-MsgGUID: wyxIHYRASsy7bwvCYPlLrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173258707"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Aug 2025 16:17:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upxU3-000MeD-2L;
	Sat, 23 Aug 2025 23:17:15 +0000
Date: Sun, 24 Aug 2025 07:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
Message-ID: <202508240704.AZwGXBaw-lkp@intel.com>
References: <20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_161722_328491_798FE9EB 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

[auto build test ERROR on a75b8d198c55e9eb5feb6f6e155496305caba2dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250820-210503
base:   a75b8d198c55e9eb5feb6f6e155496305caba2dc
patch link:    https://lore.kernel.org/r/20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f%40ideasonboard.com
patch subject: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
config: nios2-randconfig-002-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240704.AZwGXBaw-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/media/v4l2-core/v4l2-params.o: in function `v4l2_params_buffer_validate':
   v4l2-params.c:(.text+0x124): undefined reference to `vb2_plane_vaddr'
>> v4l2-params.c:(.text+0x124): relocation truncated to fit: R_NIOS2_CALL26 against `vb2_plane_vaddr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

