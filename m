Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC674C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRFmrMMFMlria7W57ZiuRD/uNnUgXTgXArSfSACZ1sM=; b=vWIR9t3cdsoV9klkSRFEp3lWxs
	E1UtE5+Q67a1ukMffGK9lF36finMSXgW5x3UTy8qL4dVNE2vqfz/IfnAR7GNoABP3E/27zGKdYR6x
	pLLqPNRuDTYPmyTxQIb/7IskaS4fz4D37oAt5fI+qoSPW5iszQzLYNTPUbR5puokfDkG8PFf+NB2V
	oTkJ1rAQQrtgSx0kgcwBgaKiGISvR637GY06eGcdtAwtMln3IVTfS2HYGPF+XXFtogjWOt7LXySPe
	ldArq8UqIo4B10/ibRM4ANmYSYsp9nD7v/RrwR7fJTQtwKAI+gFlYhAHvfP81EkJPagSnhbdluMZU
	bXAM3Mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbsc-0000000Arec-4BE7;
	Mon, 12 May 2025 22:44:14 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbp8-0000000ArKP-1lKd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 22:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747089638; x=1778625638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IsFdOGeVB9Z4dwg7zB3kN/cGUL5kif9E+VoJLXZIFoU=;
  b=EGO6MaJLIJ255BAnpDcIgI6ufNrfxhWrWgT02BTDeMUUUfhaMYqq/hqZ
   s2LmYtvkv414CNtqs4n5CdIkjp1N8UCfuXBWoudKvudg1mmGWhtz2r3b1
   0t+lFzkIP87/k9Rf9s3yHpU9lQAyo7We4lUZhtXU+kZp5htA7k/ZQSvKS
   lH/cRITFMAosf4/ST0zM+JUasFlCsiPUATXeMrSMu3g1apP5Tf4DOK30y
   wHJ26Ar2SmwNc683YAJql2LOrD780D6Q5QCaPW7ApoQNiXIwfVbbC1C/1
   mEakPf20zMnrRKTEMWMQjtPx3R6LkL+9QH5V0KT5Xc9R3u7nFxI7m5xI3
   w==;
X-CSE-ConnectionGUID: ugvJgyjcTlq4tbvieQ44Lg==
X-CSE-MsgGUID: Cygt7nbRTTufnRZHI08mPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59571294"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="59571294"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 15:40:34 -0700
X-CSE-ConnectionGUID: ZDqxwHf/RZuEU1s9gaIttA==
X-CSE-MsgGUID: vRw+cxwTQgWXLQrlP7QOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137981734"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 May 2025 15:40:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEbow-000FUb-10;
	Mon, 12 May 2025 22:40:26 +0000
Date: Tue, 13 May 2025 06:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <monstr@monstr.eu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Ricardo Ribalda <ribalda@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <202505130610.joo2DpuX-lkp@intel.com>
References: <20250511144752.504162-3-yassine.ouaissa@allegrodvt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511144752.504162-3-yassine.ouaissa@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_154038_469287_2F079A46 
X-CRM114-Status: GOOD (  11.53  )
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

Hi Yassine,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250511-225629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250511144752.504162-3-yassine.ouaissa%40allegrodvt.com
patch subject: [PATCH 2/3] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250513/202505130610.joo2DpuX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130610.joo2DpuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130610.joo2DpuX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
>> ERROR: modpost: "__bad_udelay" [drivers/media/platform/allegro-dvt/al300/al300-vdec.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

