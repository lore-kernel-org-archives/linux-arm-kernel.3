Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61028C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 23:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLQzrPAPpwvRdPXfy7ciYokBJHsSlttpxaCtP1mp9yI=; b=4y5IkWhR24c6WyKJXVM/i9gvqe
	ql00rBft4acSL/m0IuYBfPSCUew2ORUa1zgENwLLeBgIe4FZaSrlt7MUq2+a07OLL9I4g180OwOHc
	pm+vwzibruA90uGgLsLsearkmpBJfxbnvi1YhO9EeUix6sFtfK0P/GUQplSCuzotlPlDj7pQl+d5r
	S2TmatiIecPyZziTFCbpmcBIFrsdDESGaZapMS5L4cUweUCXtde0jUvtaGpRgik+wCir8lwzRCa9T
	nhoMg830nUi7iJxET3xwoe7nEfNe9W6OWuXKgdDx/QTST4uthqO6Q25PhyNVRt/qGKZeiF44sm128
	u1iMihZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucXqv-0000000BGGx-07yl;
	Thu, 17 Jul 2025 23:17:25 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucXoS-0000000BG8d-2zFh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 23:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752794093; x=1784330093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DHh9MHsxm/AndHxSwD8Zrn6sApOHgMAxtoGxE7zYV+s=;
  b=YFYFp58roGsK0Bi+RWjSbBYSb5reoO2eCrEEBejrX18advRcV68O925y
   V8eHJbwvrEPdGYX3t4paUosbUHrNYttg1bTav8gkyJfuGIODwBC4gfyOo
   EeP90dO2OHS/LaUjAUVr4wUYidqADi9mQYW401klojVIDCJKn01I621f7
   OkLb02g/TjXWgyB2DT+KqPOt6BhT4ZlRvSeufJUXTppeF7MtItWwhCcEE
   z6sRtR3wFF/skYv4xPAHH6kTFIwJRx+aVf3aQcM+Ph5iC7P2KBRLLn4kt
   HkRe1OjRRDHWSna0IykKMjFIT190e+Wjx5l6rTRK89sq+Q8UCfk4Xfhy0
   Q==;
X-CSE-ConnectionGUID: OV3aZWrERlCyy8Yc3vf1mw==
X-CSE-MsgGUID: ha3qIktjRQq9FKPrz54vQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="77623848"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="77623848"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 16:14:48 -0700
X-CSE-ConnectionGUID: iMlsDpHLRUayH9Sj6wKtyQ==
X-CSE-MsgGUID: LVK4sNXLStq+13I8f91Z5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="158612855"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2025 16:14:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucXoH-000E5v-2Q;
	Thu, 17 Jul 2025 23:14:41 +0000
Date: Fri, 18 Jul 2025 07:13:44 +0800
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
Message-ID: <202507180700.ACATL5wj-lkp@intel.com>
References: <20250716193111.942217-19-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-19-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_161452_785414_4EDCCC4A 
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
config: nios2-kismet-CONFIG_GENERIC_PINMUX_FUNCTIONS-CONFIG_VIDEO_MAX96717-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180700.ACATL5wj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180700.ACATL5wj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180700.ACATL5wj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINMUX_FUNCTIONS when selected by VIDEO_MAX96717
   WARNING: unmet direct dependencies detected for I2C_MUX
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]
   
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
   
   WARNING: unmet direct dependencies detected for I2C_ATR
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

