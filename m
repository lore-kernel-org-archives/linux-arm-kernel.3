Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A146C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yY5bppneQmqSl7HdQhbOsOi2ien4cNBkrFAEDUkGxQ=; b=iqXGLYDhYY0EX0ABsMK5UOorT5
	+U0qFl4fyPclHc8FVKyUavSoebxzKsuY5F4kpIA0HB90RUrs1bP3DzNfBEJnTCePh70tedOR2nQok
	fIeNHzGHetJ00AJlGc/q9d2kv9YFaeFheTaf/qUPCrzJRCWOcnxoidkRJuOZqbgdjWrEwt1gZwF8e
	OWl0+IJawONHZZIkoV/x7GHDT8c3usHhNfn6JJqUaGzmL+2/ofCObBXCtyYdyMu7kDVh3+BHe5nX6
	Ja69VvVGxt5HdlUhTyYSBKcCvWkqzAYHHPfb564MLpO1b8B5t58eD+yQp6fDbq9/yfhWc1nJJgPft
	Fx+5J1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYplQ-00000000tnB-2UUu;
	Fri, 17 Jan 2025 17:04:08 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpcr-00000000s43-1o1n;
	Fri, 17 Jan 2025 16:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737132918; x=1768668918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J3sBxPVGs95RnNwmbCpIngBPBDIjhtL9gamaBrIlh1I=;
  b=Gxx4bu39eO5qObi4htxmGEaI46gAMikYfE8IS3S9S7oZk8xvXbejFo6a
   iOF5b9Im0m8YAezJrVDXWdl1jdMF1rozjNq1eEcTPI71Q+H5WXubUgn8y
   RHyZwf2n/UGYpaDuonEuWIg6yaoDybmS3lUNCTVN/I6TsgM7ETpbdt/Fj
   sZdssgRNKzOdEdINt6dPiPBfAMmzGjnChpBQxxrO/dBb7RXpoMzxx0f4D
   w67XJdZnQ2efsqwHSzOYplgYTmA64mpGdFpszTJSs7oAz9qIKKXbxjYFL
   bmdDIduDjVISk/Z3SO9RZ9C3r22nPiQkqs5f32bhHTcGCa+Z1NWix65ad
   A==;
X-CSE-ConnectionGUID: Am14dmWQRG2NmoOZ/tisZw==
X-CSE-MsgGUID: LhZy7JA8SXmtz+eURKjaig==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48061904"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="48061904"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:55:16 -0800
X-CSE-ConnectionGUID: F3YXPKlSSO6lI8H448/XNQ==
X-CSE-MsgGUID: 5Nda3dfRQzKiK1N5GsXV8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110853008"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2025 08:55:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYpcg-000TU3-2k;
	Fri, 17 Jan 2025 16:55:06 +0000
Date: Sat, 18 Jan 2025 00:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
	airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
	jitao.shi@mediatek.com, jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com, ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: Re: [PATCH v5 32/34] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <202501180052.uSAwTJA8-lkp@intel.com>
References: <20250113145232.227674-33-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113145232.227674-33-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_085517_515218_145B4B8F 
X-CRM114-Status: GOOD (  11.68  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250113]
[cannot apply to robh/for-next pza/reset/next linus/master pza/imx-drm/next drm-misc/drm-misc-next v6.13-rc7 v6.13-rc6 v6.13-rc5 v6.13-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Add-MT8195-and-MT8188-compat/20250113-225554
base:   next-20250113
patch link:    https://lore.kernel.org/r/20250113145232.227674-33-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v5 32/34] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501180052.uSAwTJA8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180052.uSAwTJA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180052.uSAwTJA8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c: In function 'mtk_hdmi_v2_aud_output_channel_map':
>> drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:345:15: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     345 |         val = FIELD_PREP(SD0_MAP, sd0) | FIELD_PREP(SD1_MAP, sd1);
         |               ^~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c: In function 'mtk_hdmi_v2_hpd_pord_status':
>> drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:812:23: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     812 |         hpd_pin_sta = FIELD_GET(HPD_PIN_STA, hpd_status);
         |                       ^~~~~~~~~
--
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c: In function 'mtk_ddc_check_and_rise_low_bus':
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:59:36: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      59 |                                    FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLOCK_SCL));
         |                                    ^~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c: In function 'mtk_ddcm_read_hdmi':
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:207:47: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     207 |                         puc_value[read_idx] = FIELD_GET(DDC_DATA_OUT, val);
         |                                               ^~~~~~~~~


vim +/FIELD_PREP +345 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

   333	
   334	static u32 mtk_hdmi_v2_aud_output_channel_map(u8 sd0, u8 sd1, u8 sd2, u8 sd3,
   335						      u8 sd4, u8 sd5, u8 sd6, u8 sd7)
   336	{
   337		u32 val;
   338	
   339		/*
   340		 * Each of the Output Channels (0-7) can be mapped to get their input
   341		 * from any of the available Input Channels (0-7): this function
   342		 * takes input channel numbers and formats a value that must then
   343		 * be written to the TOP_AUD_MAP hardware register by the caller.
   344		 */
 > 345		val = FIELD_PREP(SD0_MAP, sd0) | FIELD_PREP(SD1_MAP, sd1);
   346		val |= FIELD_PREP(SD2_MAP, sd2) | FIELD_PREP(SD3_MAP, sd3);
   347		val |= FIELD_PREP(SD4_MAP, sd4) | FIELD_PREP(SD5_MAP, sd5);
   348		val |= FIELD_PREP(SD6_MAP, sd6) | FIELD_PREP(SD7_MAP, sd7);
   349	
   350		return val;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

