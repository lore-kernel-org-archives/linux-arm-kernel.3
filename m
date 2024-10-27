Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3DDD10C11
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 03:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=278DRe8scTYuUtylcsmfWpUUfrLBvAUbaDIoTlSaC2o=; b=ZH6gLj+Q8tVFJRemb4hdlquDOR
	FTM/fQEfyA0aTM5D3T2LjbkjEXSvPGd+qzd1ktECUeP1hfMrXuWcfaF3/ulSZgpLJBD72lfYF2WG3
	E8naKcdgCYp8TbnuGwOkdyrj/sdUW+sI+59zc2VT5KCAv+4QI1yuH2cuL2Rh+c787hrQLrfr+XIRl
	iGIEfshCdMY4trE6uvI6QOxCijH3myMbe0jWIstMmTksLirKJ1SBXtZOyx0eawpg+fQclZJPtn3kb
	qScC0iSBeFCgt2cboVwAvvHWQ/fXAi07vFUXPtA40IRKLq7/YWUB0UK7GqwsLiAx/3/3+Za41eCeF
	zMbYmbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4u6F-00000007alR-3aKR;
	Sun, 27 Oct 2024 03:37:55 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4u4e-00000007aeQ-0syg;
	Sun, 27 Oct 2024 03:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730000176; x=1761536176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tuqOPQeN5J9ifQjSyw5F6waaOmkOaPGwOqm5ND0MEeA=;
  b=IVADKq/jNoULjvBQCNDPAwZaQWO1UQ6js0ki4h/2CfpoHEv0ShvVrgxU
   +INx85uMlm8Ip+CTKVgSm2eqVh+8lfz6ead8qfw5l69HaRw5GLn2J3bs+
   3XGleCnPZMjD/PklGyVO5JA3RPEekmK1zRs0jDy6KZOZKKcSbTEB+Z8Ti
   CGHoZ6AgpeyhyVLnsnw236S8UOfUgO4nQD+PiJbUVR4BCS5gYn7FyRgZ7
   /aSuhaqux0ZN+KRyRa9zbxKU8oKVX/Zr8NtwOKjGZY8/N8U+2HgXyhzVa
   nyUlgAJy81u0xkkOZN6Ug9ADUMNLitZkQFCfob1XaYqIge1e13LDvYto5
   w==;
X-CSE-ConnectionGUID: cRla3jAXQRiPIT6CVJeLdA==
X-CSE-MsgGUID: Rx0z7strSfCyNJ8nkdG1Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29766355"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29766355"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:36:10 -0700
X-CSE-ConnectionGUID: +czJQ7F3Rt2k4fq9aWg89Q==
X-CSE-MsgGUID: ql3X8lkzRTC9A4t5AZnybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85835570"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Oct 2024 20:36:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4u4S-000aKG-1k;
	Sun, 27 Oct 2024 03:36:04 +0000
Date: Sun, 27 Oct 2024 11:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chhao Chang <ot_chhao.chang@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Message-ID: <202410271123.3hyFF6pg-lkp@intel.com>
References: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_203616_353372_31466EE1 
X-CRM114-Status: GOOD (  17.44  )
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

Hi chang,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chang-hao/pinctrl-mediatek-add-eint-new-design-for-mt8196/20241025-111952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241025031814.21442-1-ot_chhao.chang%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: add eint new design for mt8196
config: csky-randconfig-r071-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271123.3hyFF6pg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271123.3hyFF6pg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271123.3hyFF6pg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_do_suspend':
>> drivers/pinctrl/mediatek/mtk-eint.c:588:9: error: implicit declaration of function 'dsb' [-Wimplicit-function-declaration]
     588 |         dsb(sy);
         |         ^~~
>> drivers/pinctrl/mediatek/mtk-eint.c:588:13: error: 'sy' undeclared (first use in this function); did you mean 's8'?
     588 |         dsb(sy);
         |             ^~
         |             s8
   drivers/pinctrl/mediatek/mtk-eint.c:588:13: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_do_resume':
   drivers/pinctrl/mediatek/mtk-eint.c:609:13: error: 'sy' undeclared (first use in this function); did you mean 's8'?
     609 |         dsb(sy);
         |             ^~
         |             s8
   drivers/pinctrl/mediatek/mtk-eint.c: At top level:
   drivers/pinctrl/mediatek/mtk-eint.c:686:14: warning: no previous prototype for 'mtk_eint_get_debounce_en' [-Wmissing-prototypes]
     686 | unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/mtk-eint.c:709:14: warning: no previous prototype for 'mtk_eint_get_debounce_value' [-Wmissing-prototypes]
     709 | unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/mtk-eint.c:749:34: warning: 'eint_compatible_ids' defined but not used [-Wunused-const-variable=]
     749 | static const struct of_device_id eint_compatible_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/dsb +588 drivers/pinctrl/mediatek/mtk-eint.c

   572	
   573	int mtk_eint_do_suspend(struct mtk_eint *eint)
   574	{
   575		unsigned int i, j, port;
   576	
   577		for (i = 0; i < eint->instance_number; i++) {
   578			struct mtk_eint_instance inst = eint->instances[i];
   579	
   580			for (j = 0; j < inst.number; j += MAX_BIT) {
   581				port = j >> REG_GROUP;
   582				writel_relaxed(~inst.wake_mask[port],
   583					       inst.base + port*REG_OFSET + eint->comp->regs->mask_set);
   584				writel_relaxed(inst.wake_mask[port],
   585					       inst.base + port*REG_OFSET + eint->comp->regs->mask_clr);
   586			}
   587		}
 > 588		dsb(sy);
   589	
   590		return 0;
   591	}
   592	EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

