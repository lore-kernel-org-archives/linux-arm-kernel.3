Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C124C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 00:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXS3+l0HFVbrEYwBiR8y+uXlGglyko62xlDpA9oVLaU=; b=u8gSF7utzQu00E3Y5wSpPRy/li
	zq0OiRHSM4sAawFmjoIWvuSyUaFyZRJo4Td7KOo2WCNl9Fr+7bHeJ4UpHtCETE4XV2katdvAU+C4Z
	J8271IURsbCLB/QrgO0ECqfw/3fDYO6BgQJxAu+P/oQ6jzVzSfjt/qC20qT5XxApdyZ+QLn3yRWSX
	Q+LoeO3JfOBHexi/orjiiVI7Rw8XF4ANoOFv/oQ4Xx/q7qBR4OoSfVrF6gdmmLIbbBfOBL7P4jH0F
	etckobi6x0pQF2oqFYAZd6P7lOU8p94+IUsA7LX9HgRZlqUDIBryB1iGp4kRF+5iUSWNgzjkhAUnZ
	XYeGmNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNev-0000000G4XP-3tZP;
	Sat, 12 Jul 2025 00:00:05 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNcY-0000000G3yI-0iHc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 23:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752278258; x=1783814258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5tT9ORXucLaTLjjDZNriJx1evuX5cza/Yehns8ks1zc=;
  b=fBN0zW80/ynfIeDO1Co799mzwmVBPAdyGCyMk2YcvPl5pyHnYEi+7I6P
   z/PGtmj07HLtHEQXx/d2HroeXvddsc6MIPclKR1SPeflMCQ9aILplsvlU
   6nv/B/UmDz5bJAdr7vMyFC0lbwI4SHL9lcuwITf4MCOcrqUPSqM6qXkcN
   qQM7A9mz0lqkoos9cWfrrY31CSNOYuP6NfzYQcBRaRAk5KsJjePYJ/aSp
   UdXrNQs7mIQjNlU60BOcVaSdE/Hg8q2/rknImbdYCM4M5CIKONSXFJ2eg
   Mh+GXB+z2+LrZgesCOwMB5hy93xz4jeyA2d/7DmipT5vKOBV9mn/CGdIB
   Q==;
X-CSE-ConnectionGUID: 2hFoxzxCQYuxshvfl+hXDg==
X-CSE-MsgGUID: hUswufowQbqfKTsWZz1Iyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54436383"
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="54436383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 16:57:36 -0700
X-CSE-ConnectionGUID: OqbzDUo+S4e1ZPXqnfb15g==
X-CSE-MsgGUID: /djIIIW1RIyf+YXjuYsB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="156572850"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2025 16:57:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaNcP-0006uV-37;
	Fri, 11 Jul 2025 23:57:29 +0000
Date: Sat, 12 Jul 2025 07:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: iuncuim <iuncuim@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
Message-ID: <202507120723.0s2u9rLs-lkp@intel.com>
References: <20250711035730.17507-3-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711035730.17507-3-iuncuim@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_165738_246471_3A6D2763 
X-CRM114-Status: GOOD (  12.89  )
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

Hi iuncuim,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on robh/for-next linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/iuncuim/dt-bindings-gpu-mali-bifrost-Add-Allwinner-A523-compatible/20250711-120104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250711035730.17507-3-iuncuim%40gmail.com
patch subject: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
config: arm64-randconfig-001-20250712 (https://download.01.org/0day-ci/archive/20250712/202507120723.0s2u9rLs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120723.0s2u9rLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507120723.0s2u9rLs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:119.29-30 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

