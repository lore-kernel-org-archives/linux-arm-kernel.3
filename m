Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390DCC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGD2Ycnz1gCzYpxZFMkcC56M8qJIW6nFnG0K4tyD43E=; b=mbRCt5l3EqN48cNntbY6fY0+br
	CieRwutpP4Qm8Wc+aA6g0wXMh1mvVS1YXQjzAFlbzMLZGWDZSoFSlLxCyDx3Jsx69a9qgQnlVDSV0
	kiwGrgup0z/jAN3PExjp5Ir2nprakkt6iiTzDxca8O4iKWy4a15UZwXVzJZjp9drfUtqwhGlU8r+a
	uPId5BjqIur6JdGFR/tIjU2TidqOZY9nMDw8o4BlH8xZGhSm1nZDu+elexOKT6xEsSZ7rxjxeUABn
	scYcZMyo3GW5n2JCNxbAx6aCgzHtOa0NZvVQ1U6BxjbuyqGaLCHkncvAvrs9D1SXzdT1mh/aaS2C1
	Ulm4tcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTcv-00000008aq3-3Rtx;
	Wed, 09 Jul 2025 12:10:17 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRxN-00000008IG2-428p;
	Wed, 09 Jul 2025 10:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752056598; x=1783592598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=saN/d4gfnEw13D+prR8b8IdE3mlm76MqGHQUgKWmIVM=;
  b=Nicqy+R0TdipZB532ShK1EFZo84lQVBzNlTwzCGM2jTJJ7yx8f1TythC
   9cD1nXSvYFloTkkGz4nwkJCEl+LsAdRag1io2J/GZxi65Nb8aaCACCXBE
   XAzZPyiu7JEcaqtaUpiermnk0zc9yfyBtFXoye25HeK2jP1Uixxo+Sf0x
   oon5ciUIsitZYlfUskxocOQdwb7gu7P88tnsH4koKTl+IMin7ftr1SGV8
   Z6LXjylATW79MznIQcARhCA2+GNh2/uThBhx2ZO9yR1omWwclhuj7hQJu
   fzPjQNW1OH3dVL22NJ0mzCGBUzzALKTs5vTx/lvJ4TFVBQG88N+v4jwey
   w==;
X-CSE-ConnectionGUID: LZOzDkG6Qka2Ua2wF2ICJA==
X-CSE-MsgGUID: /BZkWSaQTfS/4SrfN3ZBCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76860270"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="76860270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:23:16 -0700
X-CSE-ConnectionGUID: 0H38jff9RYSTaPGDbHz5iw==
X-CSE-MsgGUID: P5tlRiFCQPi8zz6fhqvRcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156221519"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2025 03:23:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZRxG-0003OR-0S;
	Wed, 09 Jul 2025 10:23:10 +0000
Date: Wed, 9 Jul 2025 18:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 2/8] media: uapi: Convert RkISP1 to V4L2 extensible params
Message-ID: <202507091859.x8Yx8AZb-lkp@intel.com>
References: <20250708-extensible-parameters-validation-v1-2-9fc27c9c728c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-extensible-parameters-validation-v1-2-9fc27c9c728c@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_032318_038494_616338FA 
X-CRM114-Status: UNSURE (   9.85  )
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

[auto build test ERROR on a8598c7de1bcd94461ca54c972efa9b4ea501fb9]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250708-184651
base:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
patch link:    https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-2-9fc27c9c728c%40ideasonboard.com
patch subject: [PATCH 2/8] media: uapi: Convert RkISP1 to V4L2 extensible params
config: i386-buildonly-randconfig-003-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091859.x8Yx8AZb-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091859.x8Yx8AZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091859.x8Yx8AZb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/rkisp1-config.h:10:10: fatal error: 'linux/build_bug.h' file not found
      10 | #include <linux/build_bug.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

