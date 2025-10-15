Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6E5CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xa4/849R/xgwcMPIoCI3VbUeCA0k6/U4Rsg5ROqBma4=; b=F66kmoup1042tpLw15cFBlMpoT
	f+yp2boGALQ/BiFem1JLyLySVhczDjvMKhxzgChras97jld7aI41KTuM7vOhk6pfTMsIXagS46aDu
	hxEMcJv0UuliKrYi/zd34PTBKVduEVixom5Mc0lnDMeM9IAFE5Qoab6KR3G4WZrV6r/pWo5nkCO5+
	Fs4arDLsArseLaHUz5YbjIfUfaqz9EFxNR4jhUY29cwHJoqL9vGuLjsNi56QB+lAn0H/W60H5d93E
	aWrxC9mxKixA52rdV6sw5ofrKMV8YzjUI7iVjvXaAeJtZ9ZPcc6QcHpbKLDsPtWt1vIIWw/38ma+d
	t0+txhmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97vd-00000002pd4-1QBL;
	Wed, 15 Oct 2025 20:16:57 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97va-00000002pcO-3EYn;
	Wed, 15 Oct 2025 20:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760559415; x=1792095415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gmAXAdcyfH/0YqbR2yiAskUEQSqfMryfD6kCU4fsFsI=;
  b=BZ7Wlev3HhQ6yunHxpw4IN5vCpjs4sCASoU8n/5y043721WYEnzLiDEX
   qo1z7E2FUjtWlJzPg5OCA3wMusUvgNRDCQc1w0LYF7+nByk2XhBK4Runo
   ewwYclDstBdvFOo1jOmKrFIqUHZq0OcsVKKCXW4Tta77aW7NAy/5Gl2sy
   2xLGmio1BZzkb2OBRFtRJhF+WHJXRg85c41TMhL2a6kufnt/Fa3/b8XCg
   38tQmeGV8SaNzEzh/i7A6hqU92+2FNhbJuk6gzbtIADKxcRoIBOHM2gBR
   uH2N1hjNCgcST7sKOiBTJSIr+Mr7N3QilzovxSn6O1dsxiqdIaPNvtnp4
   A==;
X-CSE-ConnectionGUID: nLI8OrhWSJOvYO34Fgy7lw==
X-CSE-MsgGUID: Ou0fArL4RDakeT2E/wki3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66396403"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="66396403"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 13:16:54 -0700
X-CSE-ConnectionGUID: ZjXlA3GRQj2NR/oq7bHOIA==
X-CSE-MsgGUID: 5BXCaKU+S5CLdi38pkLjpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="219416270"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2025 13:16:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v97vD-0004CF-0w;
	Wed, 15 Oct 2025 20:16:34 +0000
Date: Thu, 16 Oct 2025 04:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 5/5] pmdomain: mediatek: Add support for MFlexGraphics
Message-ID: <202510160411.BLpQNEHZ-lkp@intel.com>
References: <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_131654_866325_A9D72555 
X-CRM114-Status: GOOD (  14.06  )
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

Hi Nicolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40a3abb0f3e5229996c8ef0498fc8d8a0c2bd64f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolas-Frattaroli/dt-bindings-gpu-mali-valhall-csf-add-mediatek-mt8196-mali-variant/20251015-165256
base:   40a3abb0f3e5229996c8ef0498fc8d8a0c2bd64f
patch link:    https://lore.kernel.org/r/20251015-mt8196-gpufreq-v7-5-0a6435da2080%40collabora.com
patch subject: [PATCH v7 5/5] pmdomain: mediatek: Add support for MFlexGraphics
config: arm64-randconfig-003-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160411.BLpQNEHZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160411.BLpQNEHZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160411.BLpQNEHZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/clk-provider.h:9,
                    from drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:10:
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c: In function 'mtk_mfg_probe':
>> include/linux/of.h:138:51: warning: 'shmem' is used uninitialized in this function [-Wuninitialized]
     138 | DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
         |                                                   ^
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:877:22: note: 'shmem' was declared here
     877 |  struct device_node *shmem __free(device_node);
         |                      ^~~~~


vim +/shmem +138 include/linux/of.h

0829f6d1f69e4f2 Pantelis Antoniou 2013-12-13  126  
0f22dd395fc473c Grant Likely      2012-02-15  127  #ifdef CONFIG_OF_DYNAMIC
0f22dd395fc473c Grant Likely      2012-02-15  128  extern struct device_node *of_node_get(struct device_node *node);
0f22dd395fc473c Grant Likely      2012-02-15  129  extern void of_node_put(struct device_node *node);
0f22dd395fc473c Grant Likely      2012-02-15  130  #else /* CONFIG_OF_DYNAMIC */
3ecdd0515287afb Rob Herring       2011-12-13  131  /* Dummy ref counting routines - to be implemented later */
3ecdd0515287afb Rob Herring       2011-12-13  132  static inline struct device_node *of_node_get(struct device_node *node)
3ecdd0515287afb Rob Herring       2011-12-13  133  {
3ecdd0515287afb Rob Herring       2011-12-13  134  	return node;
3ecdd0515287afb Rob Herring       2011-12-13  135  }
0f22dd395fc473c Grant Likely      2012-02-15  136  static inline void of_node_put(struct device_node *node) { }
0f22dd395fc473c Grant Likely      2012-02-15  137  #endif /* !CONFIG_OF_DYNAMIC */
9448e55d032d99a Jonathan Cameron  2024-02-25 @138  DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
3ecdd0515287afb Rob Herring       2011-12-13  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

