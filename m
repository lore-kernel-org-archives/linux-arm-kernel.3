Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEB9C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 21:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7A6GwCEZvMcy5SatwbfEv1UHBj+b85VkGn5YmFkv4g=; b=rCk2PVL5aUaNOJKZbzQz01sYBp
	CvHBrapxTJdrRX/oKXjcT5dqyPpo7STYDhx4/VpTR4gKhznE3QZgT7Rn3tzEROzkBUzc0qHc61xsp
	OVS2xsy4WFzTPfwSORrXkitofiaPVBAI9n1U7CTdwSybo4vlWzcjSjHwYotSx4+PyiCvUZZBrIo7r
	WTnQirWVMePuqWf1cHiazcUwYMO5BY7wTLHr8AVMKzVEMC2DUspKVO3yG8VAv9pyknUNT0lQKx1CB
	3XPjrFdn49m9hHVpaVVRtUWGTp/AEJqDLFOvb8CqlXZ6cgAd3ApH6lh035UeGYFCEIflektjcwOQe
	b4B9ar0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toUgv-0000000EzyH-0ZOs;
	Sat, 01 Mar 2025 21:48:13 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toUfN-0000000Ezmp-0wQz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 21:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740865597; x=1772401597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6l1uC5pceOA+uIFkP/26PTWpP7l3GTDpEwiEC3W1O4E=;
  b=Cw43iRF+2IQOfC8HPg3ufIXEOc22fYgx9GPFQcKHtmQ4teNnd1mN+yeu
   zAMc5ieUn4Inmir7YALr0QkLm3iMiQkJpbkFlHHJmBMhYMy3KKV9hO+Kt
   Xe9NE566ht8n+Uk/TqXvDBBQx+uqNGW/nIJBOyUoL+HCId3+OAN92ppEy
   3Ig275mk5iHEYrlVxyH98OKq85W5GtocOxMmcdH/ix5BGskhoocm22h3I
   fRTZwn+ktXSNoQqmPL2w/68ZHc20NFAaXoGCpcDV1D2kBLCLHjwkIWcKG
   aRj+dJ0HtpMbEGKXQ19aeTeYBq/F2TvHrA8LHA+AMpLmVl/XEeqaay9T8
   A==;
X-CSE-ConnectionGUID: A6WIC+96Scq0cQnfw24jdA==
X-CSE-MsgGUID: yJc9bSbZS/6mayK6IdUFSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59316348"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59316348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 13:46:32 -0800
X-CSE-ConnectionGUID: 7J9dfahmT5WnwjSLafCx7Q==
X-CSE-MsgGUID: YQEx4K2USDqm09yvEVjOqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="148453162"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2025 13:46:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toUfA-000GjY-01;
	Sat, 01 Mar 2025 21:46:24 +0000
Date: Sun, 2 Mar 2025 05:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Marek Vasut <marex@denx.de>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/9] drm/panthor: Implement optional reset
Message-ID: <202503020521.MBUsoVte-lkp@intel.com>
References: <20250227170012.124768-5-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-5-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_134637_306714_CCB5BA67 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next arm64/for-next/core kvmarm/next rockchip/for-next soc/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/dt-bindings-reset-imx95-gpu-blk-ctrl-Document-Freescale-i-MX95-GPU-reset/20250228-011031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250227170012.124768-5-marex%40denx.de
patch subject: [PATCH 4/9] drm/panthor: Implement optional reset
config: x86_64-kismet-CONFIG_RESET_SIMPLE-CONFIG_DRM_PANTHOR-0-0 (https://download.01.org/0day-ci/archive/20250302/202503020521.MBUsoVte-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250302/202503020521.MBUsoVte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020521.MBUsoVte-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESET_SIMPLE when selected by DRM_PANTHOR
   WARNING: unmet direct dependencies detected for RESET_SIMPLE
     Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - DRM_PANTHOR [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARM || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n] && MMU [=y] && SOC_IMX9 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

