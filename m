Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13527E7AD40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 06:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibJU0wUBIZD2vUwQMTCl3u43643DnxYyYUTq+Snsdfo=; b=f8TD5xpeEiiUaL7Y0ouhbCmK4D
	8M5boNYDKYBRfx0hK8NWbcYnUIKrrui1jQC+QpKbPsFVxpST8XG8OuSQZrncCu4C9iqfyHBmpYhzA
	SGBcfFxCG/sXC5TNlXRtjLuaNZIeWjUckhgX5SXkmK61bSDN7mJc5vTIgA+H10rhkA61OQbqPxSmn
	kYkkh3wKiwRjnr5+bdaMxUsC+0B5Eg7HWz5nnn3WTby8NUfZFQfiYk/o0pNeGHPvhuipYaggP5NMW
	qk2Ji6+6Ezi/JB4jGwuUm9Sg9Ii1wG4HpnqrRbF2zZ3RKD9aaMlI4LODNEk2rgv73BP9kJiKt6IL6
	FdEWem6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeoK-000000007rq-2nJe;
	Thu, 25 Dec 2025 06:26:56 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeoG-000000007r8-4A5q;
	Thu, 25 Dec 2025 06:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766644013; x=1798180013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G7DWSOB9fPpBxa7DXoXilHYnQeeepH0vpFzNouz+8bg=;
  b=F1kPBQRe1LLzJKrICJyphO5RJW1pQ4gnylCOuKlScsCJ/1nRUdd0Aa6q
   JdhVceWMVhzGlpV/+zEeGAWRX+h2MyrVhDb4R/g1iz69Zs1W//G8xz+gk
   RuoYQUMLI9nqZVf0k5vEO1ioGeOAvyGnalsPg4xsTdolkcO4/n4GZ3/+r
   QWDkhUAUrnpbB4on4o7T0Yx9/uLh9h98D5resxsW41PlnIUd6PhyGVNNy
   AnUcZBivbzF0jrhrsfKj7OKCwyG98rHwNC7NVqjSwARO1pCxdNak/142u
   i9wjWpSzJCX2xDf2ovbfiGknhBMU5vGzB/JLX8LbP4QX0ADgET/Y/fiOZ
   w==;
X-CSE-ConnectionGUID: A/nGAne+Tia3hEAK7Ovb0g==
X-CSE-MsgGUID: RouW9goIQSqIYrf4LnduHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79089599"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="79089599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:26:50 -0800
X-CSE-ConnectionGUID: Ad0S3tiVS+qUh3q9N8kLWg==
X-CSE-MsgGUID: Msg01NgwSkKvsVX+MGudxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199809963"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Dec 2025 22:26:46 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYeo7-000000003pB-2ymU;
	Thu, 25 Dec 2025 06:26:43 +0000
Date: Thu, 25 Dec 2025 14:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 09/21] drm/colorop: Factor out common paths from
 colorops helpers
Message-ID: <202512251442.dLlbaNp3-lkp@intel.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-9-7d969f9a37a0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-9-7d969f9a37a0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_222653_129618_BDC0EE64 
X-CRM114-Status: UNSURE (   9.88  )
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

Hi Ariel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b96bcfba104c65db41378a04f5ccac186f79578f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariel-D-Alessandro/drm-crtc-Add-color-pipeline-to-CRTC-state/20251224-020551
base:   b96bcfba104c65db41378a04f5ccac186f79578f
patch link:    https://lore.kernel.org/r/20251223-mtk-post-blend-color-pipeline-v3-9-7d969f9a37a0%40collabora.com
patch subject: [PATCH v3 09/21] drm/colorop: Factor out common paths from colorops helpers
config: openrisc-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251442.dLlbaNp3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251442.dLlbaNp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251442.dLlbaNp3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_colorop.c:227 expecting prototype for drm_plane_colorop_curve_1d_init(). Prototype was for drm_common_colorop_curve_1d_init() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

