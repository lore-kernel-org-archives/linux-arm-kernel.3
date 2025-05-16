Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DC3C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBDY397tKC1uF1e7ERg+nyQvs22cXM4AYChkhAkYMQs=; b=uEGbNdayCkLLTi+GFzy8oKAORq
	A85YCaS5VMIk3r/dVbSf/w0BFj4lpruIqfyOBOuMc5FHH+Em9JRwXJKkTnkcHnpDWjLkpgWH/pUqM
	ZKfl680p06XNPDiYbth6eo5BC/znSWL7Uj65NwP8bw+agBc1q5Upxv5QH9IvTfTkPbiAPP/qvFCSG
	IaURCVCzpjq82Y7WpeWk2zCAAreNvdtBVFgiTQ1OjZ9upMwofy+C1xFh44mDdgDlTjlmWr1wtr7G0
	Kx2LdLssYjgTZFlo7lfYg+nA0SNPk0NxbPg9Er99u1TK56xM++LrC8dao0rJhmCW0nHcvpDMXZAzd
	HoydOISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFohF-00000002aez-0WMo;
	Fri, 16 May 2025 06:37:29 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFof6-00000002aOu-0ExK;
	Fri, 16 May 2025 06:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747377316; x=1778913316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EWO6CZzwsD8bIRRFpNMF4OS0mHTBB1Wpe5eviDCIk8E=;
  b=Phrsj/DRgzc7qmMvEHL/x38r1X2T2R+6Yf86oyOdYN2DjWBo9FCKzkbo
   YfZihoYvO1CfFva81fV5nBY3jKmxWNlmrcari3oj1Z183Iw/LyoA0tte6
   VIkTaSPb5bjwQzLvYz2HHEzxYEtgfmyad5UT0KMw46SvPBKvv7o7N2fqi
   7IVb0g+qfs1CZ5SUYkrA5tbGp3BVmBIY42flWtmHC9yE9lCdHTuXSpdpP
   h4jxqYAsaZwXE+vrai5A2o9EYg/M5sRM9dhtxkyegDjFjpZnxadM4qhLx
   qiaWTpcro4quaDZILIZU3CE9Rbrrt7NKMAvsCYS1hZ2TkJFPYFS45ia21
   Q==;
X-CSE-ConnectionGUID: opZTfBKvSYWeYCdfmcgLkw==
X-CSE-MsgGUID: AdZkWHpgSjK4k3bqcwf/VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49323341"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49323341"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:35:14 -0700
X-CSE-ConnectionGUID: FdBqF5OARzSE8VaoJNoetw==
X-CSE-MsgGUID: 4TNMa49+RSqU+LxFVGFPHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138990800"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 23:35:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFoew-000J3N-2g;
	Fri, 16 May 2025 06:35:06 +0000
Date: Fri, 16 May 2025 14:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, matthias.bgg@gmail.com,
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com,
	nancy.lin@mediatek.com, singo.chang@mediatek.com,
	xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
	paul-pl.chen@mediatek.com, sunny.shen@mediatek.com,
	fshao@chromium.org, treapking@chromium.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 15/17] drm/mediatek: add ovlsys_adaptor support for
 MT8196
Message-ID: <202505161422.JeAeW3Pd-lkp@intel.com>
References: <20250515093454.1729720-16-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-16-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_233516_152639_BF8290BD 
X-CRM114-Status: GOOD (  16.33  )
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

Hi paul-pl.chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/paul-pl-chen/dt-bindings-soc-mediatek-add-mutex-yaml-for-MT8196/20250515-173733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250515093454.1729720-16-paul-pl.chen%40mediatek.com
patch subject: [PATCH v3 15/17] drm/mediatek: add ovlsys_adaptor support for MT8196
config: arm64-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161422.JeAeW3Pd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161422.JeAeW3Pd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161422.JeAeW3Pd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_drm_drv.c: In function 'mtk_drm_ovl_adaptor_probe':
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1071:32: error: storage size of 'ovlsys_priv' isn't known
    1071 |  struct mtk_drm_ovlsys_private ovlsys_priv;
         |                                ^~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1071:32: warning: unused variable 'ovlsys_priv' [-Wunused-variable]
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: In function 'mtk_drm_probe':
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:1145:50: error: 'DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2' undeclared (first use in this function); did you mean 'DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0'?
    1145 |  mtk_drm_ovl_adaptor_probe(dev, private, &match, DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:1145:50: note: each undeclared identifier is reported only once for each function it appears in


vim +1071 drivers/gpu/drm/mediatek/mtk_drm_drv.c

  1066	
  1067	static void mtk_drm_ovl_adaptor_probe(struct device *dev, struct mtk_drm_private *private,
  1068					      struct component_match **match, enum mtk_ddp_comp_id id)
  1069	{
  1070		struct platform_device *ovl_adaptor;
> 1071		struct mtk_drm_ovlsys_private ovlsys_priv;
  1072		bool is_ovlsys = (id != DDP_COMPONENT_DRM_OVL_ADAPTOR);
  1073		char *dev_name = is_ovlsys ? "mediatek-disp-ovlsys-adaptor" : "mediatek-disp-ovl-adaptor";
  1074		void *drv_data = is_ovlsys ? (void *)&ovlsys_priv : (void *)private->mmsys_dev;
  1075		size_t data_size = is_ovlsys ? sizeof(ovlsys_priv) : sizeof(*private->mmsys_dev);
  1076	
  1077		if (mtk_drm_find_mmsys_comp(private, id, &ovlsys_priv.use_path)) {
  1078			ovlsys_priv.mmsys_dev = private->mmsys_dev;
  1079			ovl_adaptor = platform_device_register_data(dev, dev_name, PLATFORM_DEVID_AUTO,
  1080								    drv_data, data_size);
  1081			private->ddp_comp[id].dev = &ovl_adaptor->dev;
  1082			mtk_ddp_comp_init(NULL, &private->ddp_comp[id], id);
  1083			component_match_add(dev, match, compare_dev, &ovl_adaptor->dev);
  1084		}
  1085	}
  1086	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

