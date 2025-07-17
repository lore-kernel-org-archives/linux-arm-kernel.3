Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491BC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 21:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KjN8QagsfjIfw38T7EUwgFTc3pATvc7/A53dj+f9J8=; b=XmoYxdWWh6N1vaEdBn3ButWr2Y
	K1YeLo2x/Guq7WoRtjSHR+BKJE5NDyLAIKOh3uZuSyR3VdrSMMoE1czN2AR7N7iwJV2yWO5itdmtU
	Xrma8khQOJipPpfASKFZ7YfJkOzx34do3ZrwOdjKnyr+P5l48ejr8DUukakP1/YIqJT8b7RvmIGvU
	bGFWy1Nqsv4QDZ9ODqNrD7ljxSbWxMWnHJZjaNoAu+MbdZKq7cbG1tYF9lWgcRvnkG7ZfasSKV32m
	8sq9LP7h0UoflUBLkghhpLKZpdd+0iEkoDBayc0V1PBsydnLQndD5AR19SXIlZpuQjPoUTq5v8IGZ
	5jNA1aBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucWZO-0000000BBdx-3Jyc;
	Thu, 17 Jul 2025 21:55:14 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucWWw-0000000BBSL-2eSb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 21:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752789162; x=1784325162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5CBicrbhXtL9L2WtqL7HdX/deKcqvUNeJR9TBkHR9N0=;
  b=FvoT+2HAS7JkO1UMEkO+MiHiajZXYBjlh8Gd2swvbISHGi1COqI2Jsn/
   iHxgvgQLCJ5oqdXX9+6SkAw9p2zZIAf7uKk0K6Px1ED4LLDG/DXwZL5gR
   ZEeTD3VumQGqruOVKi6zVHFm1+29hwy9103Ce+Powp8N399e9TuGgL8PW
   izM5REk+HzZXWZL5MOf2SyuEkqL+XeIiekgKH6/1yvCovcN9I9wbb5KGD
   zlXgObhOKuLn7cYTS0MIXQPD2itqcIbKGxacX/diba1QyzpjhTKqF64f1
   yfBehedjSdanG9wcA5BAjrV/oTe4eD6gAkeSv0lJGq8gSw/KDaMtgXTbt
   Q==;
X-CSE-ConnectionGUID: tSn4VYWjT0iqif2iaRVgQg==
X-CSE-MsgGUID: irMEuwgATQCpvfTvnigArg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55021229"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55021229"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 14:52:40 -0700
X-CSE-ConnectionGUID: wMDSmwFfQvWxkbaZSiXyJg==
X-CSE-MsgGUID: iTiStihjT2KaBwyiCRyjzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="157980363"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2025 14:52:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucWWn-000E2p-1y;
	Thu, 17 Jul 2025 21:52:33 +0000
Date: Fri, 18 Jul 2025 05:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
Message-ID: <202507180543.aUfFOLJo-lkp@intel.com>
References: <20250716193111.942217-19-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-19-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_145242_680931_ED41ACD3 
X-CRM114-Status: GOOD (  11.04  )
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

Hi Cosmin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250716]
[also build test WARNING on v6.16-rc6]
[cannot apply to robh/for-next staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-mc-Add-INTERNAL-pad-flag/20250717-033901
base:   next-20250716
patch link:    https://lore.kernel.org/r/20250716193111.942217-19-demonsingur%40gmail.com
patch subject: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
config: nios2-kismet-CONFIG_GENERIC_PINCTRL_GROUPS-CONFIG_VIDEO_MAX96717-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180543.aUfFOLJo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180543.aUfFOLJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180543.aUfFOLJo-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS when selected by VIDEO_MAX96717
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINMUX_FUNCTIONS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

