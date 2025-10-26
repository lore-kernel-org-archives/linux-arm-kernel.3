Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED9CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 07:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHIz0pXObPUkMBRb/Fz5nEm2cV7kwuybKTa2FpwxhYA=; b=lz6qzDBVp6CQ3XxTGhcfs7Y8el
	FbnnSUkT79pdz3dv3EXU0o4Gk8kYo2bXsNUeeoYrOq3XnOKMsa2H3jl71RhOz9Vmxhbf7GjVnM3xL
	SdHk8iAhNK5d0Z85XmllGqLDhh3teYKHOL6M/s5YCGGVk5Wdb9tF2on7sd0RkNRmzE1aLNU3fYBfX
	XziFWmw/0et1XabepBx6y7zTOKuqPCpRxUfxPXPmQgbTTyGb4Zv3E+Hv+/F5WE4i+bvkgEnxghtUR
	1RkMvOTXoGaRMSTWzFN+rZD1eaGyUZ0liL5iAs1FdeximEx4Gh6kmF9wRQKd6DZbb75hbB0Rkwsar
	m6gONFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCvCZ-0000000C8FM-03oi;
	Sun, 26 Oct 2025 07:30:07 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCvCV-0000000C8Ew-3aAC;
	Sun, 26 Oct 2025 07:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761463804; x=1792999804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=htiWAq6iMZXxfabupy1JM4kiUVfrOnJOCEMU/JiJmzQ=;
  b=cmqO2er71GR+w2WJnf/KEXQycwu4Ir/P1HFi7QPu5M6v+TIWFUHoxjEB
   +dMlWe3W1euuNFbJjIxNq5cRhP1hyGcnAaEVlitOfAseGLs0QIYAIG7ci
   vjV5M7OFmoCFNlIOTkswYLg+h5KWzzihZosqQSa3UGKzoIqueGftDh8hA
   saECgoP5z5nSFn/WGpXcg/T6kMeFlHBgogTr9v7USIjAoMl1WpJz7Mb0F
   RzK0UdWHc9sJ7gQa+gaQHbx/NOyjbIai3FA4n7p3Z3aSWPjI2maZUve+k
   BaGjDSIAkuMysh+9cyTjWxZWGc8ZwKAfyrk8OgqYFIsn6t+uOhuPC5JL4
   w==;
X-CSE-ConnectionGUID: VIIK7nKtQ7+8sT3e3wJs1g==
X-CSE-MsgGUID: zmuqMGOETcuE46OBqVojQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63613086"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="63613086"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 00:30:02 -0700
X-CSE-ConnectionGUID: IOhbygVPQmG+sECxKbCJdQ==
X-CSE-MsgGUID: FpsA08v6Q5KZpnC9I5OBIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="189155119"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Oct 2025 00:29:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCvCN-000FxV-0H;
	Sun, 26 Oct 2025 07:29:55 +0000
Date: Sun, 26 Oct 2025 15:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	sboyd@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mturquette@baylibre.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, laura.nao@collabora.com,
	nfraprado@collabora.com, wenst@chromium.org,
	y.oudjana@protonmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 7/7] clk: mediatek: Add support for MT6685 PM/Clock IC
 Clock Controller
Message-ID: <202510261450.oYPrwZwR-lkp@intel.com>
References: <20251024083301.25845-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024083301.25845-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_003003_910502_05ECFD75 
X-CRM114-Status: GOOD (  13.38  )
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

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/clk-mediatek-Split-out-registration-from-mtk_clk_register_gates/20251024-164213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251024083301.25845-8-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 7/7] clk: mediatek: Add support for MT6685 PM/Clock IC Clock Controller
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251026/202510261450.oYPrwZwR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261450.oYPrwZwR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261450.oYPrwZwR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mtk-spmi.c: In function 'mtk_spmi_clk_simple_probe':
>> drivers/clk/mediatek/clk-mtk-spmi.c:48:20: error: implicit declaration of function 'devm_spmi_subdevice_alloc_and_add' [-Wimplicit-function-declaration]
      48 |         sub_sdev = devm_spmi_subdevice_alloc_and_add(&pdev->dev, sparent);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/mediatek/clk-mtk-spmi.c:48:18: error: assignment to 'struct spmi_subdevice *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      48 |         sub_sdev = devm_spmi_subdevice_alloc_and_add(&pdev->dev, sparent);
         |                  ^
   In file included from drivers/clk/mediatek/clk-mtk-spmi.c:16:
>> drivers/clk/mediatek/clk-mtk-spmi.c:52:53: error: invalid use of undefined type 'struct spmi_subdevice'
      52 |         regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mtk_spmi_clk_regmap_config);
         |                                                     ^~
   include/linux/regmap.h:775:20: note: in definition of macro '__regmap_lockdep_wrapper'
     775 |                 fn(__VA_ARGS__, &_key,                                  \
         |                    ^~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk-spmi.c:52:18: note: in expansion of macro 'devm_regmap_init_spmi_ext'
      52 |         regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mtk_spmi_clk_regmap_config);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/devm_spmi_subdevice_alloc_and_add +48 drivers/clk/mediatek/clk-mtk-spmi.c

0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  21  
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  22  int mtk_spmi_clk_simple_probe(struct platform_device *pdev)
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  23  {
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  24  	struct regmap_config mtk_spmi_clk_regmap_config = {
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  25  		.reg_bits = 16,
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  26  		.val_bits = 8,
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  27  		.fast_io = true
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  28  	};
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  29  	struct device_node *node = pdev->dev.of_node;
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  30  	const struct mtk_spmi_clk_desc *mscd;
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  31  	struct spmi_subdevice *sub_sdev;
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  32  	struct spmi_device *sparent;
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  33  	struct regmap *regmap;
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  34  	int ret;
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  35  
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  36  	ret = of_property_read_u32(node, "reg", &mtk_spmi_clk_regmap_config.reg_base);
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  37  	if (ret)
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  38  		return ret;
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  39  
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  40  	/* If the max_register was not declared the pdata is not valid */
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  41  	mscd = device_get_match_data(&pdev->dev);
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  42  	if (mscd->max_register == 0)
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  43  		return -EINVAL;
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  44  
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  45  	mtk_spmi_clk_regmap_config.max_register = mscd->max_register;
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  46  
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  47  	sparent = to_spmi_device(pdev->dev.parent);
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24 @48  	sub_sdev = devm_spmi_subdevice_alloc_and_add(&pdev->dev, sparent);
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  49  	if (IS_ERR(sub_sdev))
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  50  		return PTR_ERR(sub_sdev);
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  51  
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24 @52  	regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mtk_spmi_clk_regmap_config);
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  53  	if (IS_ERR(regmap))
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  54  		return PTR_ERR(regmap);
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  55  
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  56  	return mtk_clk_simple_probe_internal(pdev, node, mscd->desc, regmap);
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  57  }
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  58  EXPORT_SYMBOL_GPL(mtk_spmi_clk_simple_probe);
0986bdc04bd40e AngeloGioacchino Del Regno 2025-10-24  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

