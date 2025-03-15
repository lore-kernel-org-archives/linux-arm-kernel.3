Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5EEC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glAtyP4dUnz0l0KiAvV4ANow7G2hB+arbAc9Pjp2TVs=; b=j61cafaLrU8m1myczavI4Fc+tI
	gQ09WDxQ67RVzRGZsiYPWkmew9cSqt+8rtYpRetNsj9LslJUubp6YZ+h4F7iYvuHu7ON74t+p3cSw
	1Mb5xuYFxyVwqObXfSr0B7DevgGBeEtjQRC2bxxr6V+zTNrn2s8cjD05+W4pNpuNQ+sBUiXTelMyo
	9a6Xm9AWCSJMBbSiV7Z0R1GUknWbLVqU3SBAQqmp6JgQtRN3cgJLhqZCg7J3R7/ukRGkAbdYU/DZb
	B1X8saYzyrGbjR4Wru0aN32BIoXnpnYYQ/zoCk1HKjLou/9j5aKaQI2iBR4NxSg7ciOUfvhKlNEgU
	gO0BVeCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMry-0000000G1ly-0r6Y;
	Sat, 15 Mar 2025 08:27:46 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMqH-0000000G1dj-2hGu;
	Sat, 15 Mar 2025 08:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742027161; x=1773563161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VkdKPwJSbXuVY/GWIxtpTxYdiXqy9fUXpxwA7ilNpuc=;
  b=D4ZWLzniqBnvLwMex3E8iLG+DR5fMIfEWarzts4mIfJszhsvHzt6C+n4
   JAftHmdfaRxzLNTJbfWJlU4Wbyztwuuw41CzHol3kBVkt7A/yhZMW8cU+
   op9m3BDopVuwh8ZBPOzwcStql/c/4/53XJdgfsZ6EAQ40bqT8Ua1ebrIh
   D4of0vMRupKCoOFi1GY+PaAl7KIzgYs0urW9pPgBkAes1xl9p+DCEGdwV
   1o9zI8KGAWmM60VTiHPfBNjizmcpdUdYzZJdUeIv4JImlS29M/7Tw2/Y7
   hZez0cHtxPjyHfky4TvA8xW+nbZh+gP3jeH94lVSry21VGgLV2wBSlBKG
   w==;
X-CSE-ConnectionGUID: MRkLZTLKSgmJW2tyCO2QjQ==
X-CSE-MsgGUID: G/wEx4AuTjOrGFK7tXZP1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43388360"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43388360"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 01:25:54 -0700
X-CSE-ConnectionGUID: UBbR/qeyT+uAlIeUlwwv7A==
X-CSE-MsgGUID: uIYkhi5mSoij1+dwF9nXrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="125691055"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2025 01:25:50 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttMq4-000B9v-1M;
	Sat, 15 Mar 2025 08:25:48 +0000
Date: Sat, 15 Mar 2025 16:24:59 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH 4/5] media: vcodec: Implement manual request completion
Message-ID: <202503151605.1d1dDLuM-lkp@intel.com>
References: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_012601_692545_E7EEC003 
X-CRM114-Status: GOOD (  10.85  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on f2151613e040973c868d28c8b00885dfab69eb75]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Fricke/media-mc-add-manual-request-completion/20250314-213005
base:   f2151613e040973c868d28c8b00885dfab69eb75
patch link:    https://lore.kernel.org/r/20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b%40collabora.com
patch subject: [PATCH 4/5] media: vcodec: Implement manual request completion
config: x86_64-buildonly-randconfig-003-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151605.1d1dDLuM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151605.1d1dDLuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151605.1d1dDLuM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:29:13: warning: no previous prototype for function 'state_to_str' [-Wmissing-prototypes]
      29 | const char *state_to_str(enum mtk_request_state state)
         |             ^
   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:29:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
      29 | const char *state_to_str(enum mtk_request_state state)
         |       ^
         | static 
   1 warning generated.


vim +/state_to_str +29 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c

    28	
  > 29	const char *state_to_str(enum mtk_request_state state)
    30	{
    31		switch (state) {
    32		case MTK_REQUEST_RECEIVED:
    33			return "RECEIVED";
    34		case MTK_REQUEST_LAT_DONE:
    35			return "LAT_DONE";
    36		case MTK_REQUEST_CORE_DONE:
    37			return "CORE_DONE";
    38		default:
    39			return "UNKNOWN";
    40		}
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

