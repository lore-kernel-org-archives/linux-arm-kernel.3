Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC1CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hb9dw+OuJd5vCMoRlHiK6XNIi92thRWK2L4GbkED7Y=; b=WkbUMXkdkeCOa3iVqVW2E3ZGND
	VqrUxPmVmChVQdp9Jc47h+4jLtmye9iGzxv3EiwonklwzbpaFfTx3tnWRaVrZpzIVk0i8zqo5YRVo
	3+GiiICepGWtOlszKXNVS7ybxrlrvRnBWZjw5LNwasJaOZXvFk+HQPgbjk5BGLzxGKe7P4aJArkjD
	1c08wcTXZbFb1j+Y68nkstA4YPVGcfz+OR5YrNFZgT14oS4E0P+AD7OQUkdviLOv9758mrs06IBz+
	YkbQ0p9fvkcDzo8cpoQhrIr1MSjsmkVjGRcQirGRR1Xm+grxbLhFKjfRn3A8JumtKg9AzeSL2Wp1O
	/MbGK8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFph2-00000002gfJ-1w8s;
	Fri, 16 May 2025 07:41:20 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpd9-00000002g4S-3avz;
	Fri, 16 May 2025 07:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747381040; x=1778917040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iyaARSlxSx2c/DhVMA1ZbxR3nXQesEsxPzJdwibwTGs=;
  b=mMDD9WaDlshvByc7zfFZem6MuaKIzrWnXpG+VBIjCP4oG+/hl23NGluz
   zTMOO23QYS4tiP//iOWk6m0vOYzSPA8S5Fmt4e4mSG8yGKz97fvHGMOCt
   knUj/PiOx2aKcW1sV34otjRxa22QFR3bSK/hCEk/+lBvpRGO/9eWQSksF
   jcnks/nt2nZ9x8P8Q0Da8mdHoNlMnlPeDMqDwDfNCWnZh0vRZv2XQREQD
   rm+eV+QeARoCuFTLsTTMf7JB7xIFaonKmMvfBdhSKsfoFrhENj436rN+H
   Ww3cgR5joIgOwminoFb3e9OMdCFQ9Y83c8nXOv8hp4t/43QNLth6f019t
   A==;
X-CSE-ConnectionGUID: 8LKLnl2UQiCcBR1ZW9zHrg==
X-CSE-MsgGUID: T63u+CW3QHWJV+SJJYVbvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60681948"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60681948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 00:37:19 -0700
X-CSE-ConnectionGUID: EmFEkB4PSAy49RIhzknkRA==
X-CSE-MsgGUID: PCyKqvZVQ1CYMs9BpMsMjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="161920591"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 May 2025 00:37:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFpd2-000J6N-0I;
	Fri, 16 May 2025 07:37:12 +0000
Date: Fri, 16 May 2025 15:36:58 +0800
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
Subject: Re: [PATCH v3 16/17] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
Message-ID: <202505161512.PmRwb8Li-lkp@intel.com>
References: <20250515093454.1729720-17-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-17-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_003719_934597_AA6AEF4D 
X-CRM114-Status: GOOD (  16.02  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/paul-pl-chen/dt-bindings-soc-mediatek-add-mutex-yaml-for-MT8196/20250515-173733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250515093454.1729720-17-paul-pl.chen%40mediatek.com
patch subject: [PATCH v3 16/17] drm/mediatek: Add support for multiple mmsys in the one mediatek-drm driver
config: arm64-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161512.PmRwb8Li-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161512.PmRwb8Li-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161512.PmRwb8Li-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_ddp_comp.c: In function 'mtk_find_possible_crtcs':
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.c:670:3: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     670 |   if (found)
         |   ^~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:673:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     673 |    count++;
         |    ^~~~~


vim +/if +670 drivers/gpu/drm/mediatek/mtk_ddp_comp.c

   622	
   623	int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
   624	{
   625		struct mtk_drm_private *private = drm->dev_private;
   626		const struct mtk_mmsys_driver_data *data;
   627		struct mtk_drm_private *priv_n;
   628		int i, j, count = 0, ret;
   629	
   630		/* search each path in private data */
   631		for (i = 0; i < MAX_CRTC; i++) {
   632			bool found = false;
   633			int avail_mmsys_num = 0;
   634	
   635			for (j = 0; j < private->data->mmsys_dev_num; j++) {
   636				const unsigned int *path = NULL;
   637				unsigned int path_len = 0;
   638	
   639				priv_n = private->all_drm_private[j];
   640				data = priv_n->data;
   641	
   642				if (i == CRTC_MAIN) {
   643					path = data->main_path;
   644					path_len = data->main_len;
   645				} else if (i == CRTC_EXT) {
   646					path = data->ext_path;
   647					path_len = data->ext_len;
   648				} else if (i == CRTC_THIRD) {
   649					path = data->third_path;
   650					path_len = data->third_len;
   651				}
   652	
   653				/* skip if no path data in current mmsys */
   654				if (path_len == 0 || !path) {
   655					avail_mmsys_num++;
   656					continue;
   657				}
   658	
   659				if (mtk_ddp_path_available(path, path_len, priv_n->comp_node))
   660					avail_mmsys_num++;
   661	
   662				if (mtk_ddp_comp_find(dev, path, path_len, priv_n->ddp_comp))
   663					found = true;
   664		}
   665	
   666			/* skip invalid path */
   667			if (avail_mmsys_num != private->data->mmsys_dev_num)
   668				continue;
   669	
 > 670			if (found)
   671				return BIT(count);
   672	
   673				count++;
   674		}
   675	
   676		ret = mtk_ddp_comp_find_in_route(dev,
   677						 private->data->conn_routes,
   678						 private->data->num_conn_routes,
   679						 private->ddp_comp);
   680	
   681		if (ret < 0)
   682			DRM_INFO("Failed to find comp in ddp table, ret = %d\n", ret);
   683	
   684		return ret;
   685	}
   686	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

