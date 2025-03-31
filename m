Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAE1C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/staWcuBmIKOnQPhCnhZGdwMlRtO9oRntyaaFo5+20=; b=GvYke62HQpz2wlIs5o4Q4z3WpP
	IS2Y3MM6hs3SLd9Gx0d2ykIin7QUQbfWEVFbnZnFIHI6S3w/EnipM/YcqyaZgjN2frN2FqB9dMA8X
	LOjnyNqM0bfcoP1IRyaPMiY/JSuIPlj84pbL5z7kZNnbrUcWABCdTlkt2pqmPfSFIqgwcpIMdQumZ
	UL0NPTT9MMC/AaItEchymwmGXTRjOtpHBZMtGjfotuE2W/KoHVWdiJkgGIKBJYUGmge5cJV8Bw9XM
	D/fJPzFRArTGd56CpLFhN0x+xphFH5ESmFhI1gjvDF2X2X8mRZVrIsXRP/VdEE3LWQbT3c+Mhuo6s
	qnmUn27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAMn-0000000HKnC-39Nx;
	Mon, 31 Mar 2025 08:19:33 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAJu-0000000HKT3-3xyO;
	Mon, 31 Mar 2025 08:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743408995; x=1774944995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QGqKdfPSBPoe0ePQ6nTPzXqBmsVZuUhxOCBg+SqfvXg=;
  b=GKgEViQOUtdX+lDaI6n1i0DJRFU/e9Nd6xfhwLIcuHWHkgnloR9iVaOY
   yWDey4A/G9VTFGVtEvhcpLAsLbLoO+7SnstyO/EeV7pq+1eB36dxGivXx
   zBI5gLUWYnLJUXhNrXny16G1wY0DTe+6zE00SIXCXN9t99yPaY83sn2Y0
   3O0XC1tjgbpy8wgiODVu9fZdPIsdhH5oQzH38AYgnrkJAUhWuZea0hnwP
   RCZYaEzt57PDwImBWB5GSCBmGW0zHhBPJ+XdXcneuJpdoat6tHEbddG4f
   Ls0wvSJ/ilKLMVzMoSi7j3BuvY+tJYC6OoegmPG3hhd+upHjzgkTFpoUP
   g==;
X-CSE-ConnectionGUID: gKrwg4mfSmuaTLDzt6HEyA==
X-CSE-MsgGUID: IEJOzwUuQze6QV6L82yqDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48350878"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="48350878"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 01:16:30 -0700
X-CSE-ConnectionGUID: 9FkABt1SRSqJZ+qcfb5pog==
X-CSE-MsgGUID: tY7RLoEiRtijHRLb6HPV3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126932615"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 31 Mar 2025 01:16:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzAJk-00098A-0h;
	Mon, 31 Mar 2025 08:16:24 +0000
Date: Mon, 31 Mar 2025 16:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH 4/5] media: vcodec: Implement manual request completion
Message-ID: <202503311620.hhbFrG8T-lkp@intel.com>
References: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_011635_033555_204EBB68 
X-CRM114-Status: UNSURE (   9.86  )
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

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on f2151613e040973c868d28c8b00885dfab69eb75]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Fricke/media-mc-add-manual-request-completion/20250314-213005
base:   f2151613e040973c868d28c8b00885dfab69eb75
patch link:    https://lore.kernel.org/r/20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b%40collabora.com
patch subject: [PATCH 4/5] media: vcodec: Implement manual request completion
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250331/202503311620.hhbFrG8T-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311620.hhbFrG8T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311620.hhbFrG8T-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.o: in function `state_to_str':
>> mtk_vcodec_dec_drv.c:(.text.state_to_str+0x0): multiple definition of `state_to_str'; drivers/media/platform/chips-media/wave5/wave5-helper.o:wave5-helper.c:(.text.state_to_str+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

