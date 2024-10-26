Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33620D10C02
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Nht/6b3BNTXrG3YlvsVcaD8i6O+4V872r9rEZxhCeA=; b=kDWGBXY6igorQmPb7fyRvbptz4
	k7BBrsVfBBocBG5kkzEmgUBHaP6wL8xwCMS3IBElA68oSZsKvoY5x/pXfd/KE3k+sG87MW2GMCWpE
	QMnqUhU5g6HmC6XxQDr5iMdGKku7sFCBXtII5IiGBGT2hYDHmXM06M1+Z3/6My/iAWZsCfLepoy8p
	1IceHe6Owt85HHvcXfDtH/PAWqfv56PW/BuoLZGu/2pYsagpDjSqL8Wx0F0KEKTANzu7XEhFG+34Z
	xXMinqrQx9dHGpmdrVVJEQW3Mg+2I/3WVxmIyvrg+qoz10QbVHvhVcAZwUyrkOKAc+clPi1Unzk3f
	H2/XwSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4lY4-0000000759K-1oYV;
	Sat, 26 Oct 2024 18:30:04 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4lWT-0000000751v-0fJ1;
	Sat, 26 Oct 2024 18:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729967305; x=1761503305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qn0+EUEBwHw/wS8WVeU9EYrJ/6q9fzV8u+7eXowaNyU=;
  b=Z7Ijdl9w1i8qoPpdlbTX5v5QF3mivhHb9hMMY27GwpJJrPEwo3ah+kf+
   r0P2nl3qAXHwcb0pco9CzPbBH8ZcYhTovWLm6EVcQFIU+n1fo8TrBfA6M
   M6Z89AtdyMteBWItBicG/oIjKxlE8jmuV4/mZS/IC1fT7xoCMeiba3FUD
   vyhXkCDi2at/C7nDvfjnhx6qk/cgURLZsdHk8UPPsucHlHtjnaeQUKwtw
   R4RVUGiSzYLUZcTA44v3X4RYXC+kaUFNflh2RA3T7WIVmj/A2ROjsthud
   9TutVCpnii1qOH/xCZvRBVvmfChKHSLs6KrsaNlj+j6Ww+4iKXY621wVT
   A==;
X-CSE-ConnectionGUID: sZ4i3EqrTrSTyWURxQD0Mg==
X-CSE-MsgGUID: INJGU5i/RAabpUoz4QFGbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="41006189"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="41006189"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 11:28:19 -0700
X-CSE-ConnectionGUID: C1/vY19HRTa7GdJOUmrzQg==
X-CSE-MsgGUID: SsPm+H7rQMWmsp4BOsyosg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="80806687"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2024 11:28:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4lWI-000Zvt-0z;
	Sat, 26 Oct 2024 18:28:14 +0000
Date: Sun, 27 Oct 2024 02:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chhao Chang <ot_chhao.chang@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Message-ID: <202410270252.vGIAE54G-lkp@intel.com>
References: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_112825_312385_17996EAE 
X-CRM114-Status: GOOD (  14.99  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chang-hao/pinctrl-mediatek-add-eint-new-design-for-mt8196/20241025-111952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241025031814.21442-1-ot_chhao.chang%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: add eint new design for mt8196
config: arm-randconfig-r122-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270252.vGIAE54G-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241027/202410270252.vGIAE54G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270252.vGIAE54G-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/mediatek/mtk-eint.c:686:14: sparse: sparse: symbol 'mtk_eint_get_debounce_en' was not declared. Should it be static?
>> drivers/pinctrl/mediatek/mtk-eint.c:709:14: sparse: sparse: symbol 'mtk_eint_get_debounce_value' was not declared. Should it be static?
>> drivers/pinctrl/mediatek/mtk-eint.c:823:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] ph @@
   drivers/pinctrl/mediatek/mtk-eint.c:823:53: sparse:     expected restricted __be32 const [usertype] *p
   drivers/pinctrl/mediatek/mtk-eint.c:823:53: sparse:     got unsigned int const [usertype] *[assigned] ph

vim +/mtk_eint_get_debounce_en +686 drivers/pinctrl/mediatek/mtk-eint.c

   685	
 > 686	unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
   687					      unsigned int eint_num)
   688	{
   689		unsigned int instance, index, bit;
   690		void __iomem *reg;
   691	
   692		reg = mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
   693					  &instance, &index);
   694	
   695		if (!reg) {
   696			dev_err(eint->dev, "%s invalid eint_num %d\n",
   697				__func__, eint_num);
   698			return 0;
   699		}
   700	
   701		reg = eint->instances[instance].base +
   702			(index / REG_OFSET) * REG_OFSET + eint->comp->regs->dbnc_ctrl;
   703	
   704		bit = MTK_EINT_DBNC_SET_EN << ((index % REG_OFSET) * DB_GROUP);
   705	
   706		return (readl(reg) & bit) ? 1 : 0;
   707	}
   708	
 > 709	unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
   710						   unsigned int eint_num)
   711	{
   712		unsigned int instance, index, mask, ofset;
   713		void __iomem *reg;
   714	
   715		reg = mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
   716					  &instance, &index);
   717	
   718		if (!reg) {
   719			dev_err(eint->dev, "%s invalid eint_num %d\n",
   720				__func__, eint_num);
   721			return 0;
   722		}
   723	
   724		reg = eint->instances[instance].base +
   725			(index / REG_OFSET) * REG_OFSET + eint->comp->regs->dbnc_ctrl;
   726	
   727		ofset = MTK_EINT_DBNC_SET_DBNC_BITS + ((index % REG_OFSET) * DB_GROUP);
   728		mask = 0xf << ofset;
   729	
   730		return ((readl(reg) & mask) >> ofset);
   731	}
   732	
   733	int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
   734	{
   735		int irq;
   736	
   737		irq = irq_find_mapping(eint->domain, eint_n);
   738		if (!irq)
   739			return -EINVAL;
   740	
   741		return irq;
   742	}
   743	EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
   744	
   745	static const struct mtk_eint_compatible default_compat = {
   746		.regs = &mtk_generic_eint_regs,
   747	};
   748	
   749	static const struct of_device_id eint_compatible_ids[] = {
   750		{ }
   751	};
   752	
   753	int mtk_eint_do_init(struct mtk_eint *eint)
   754	{
   755		int i, virq;
   756		unsigned int size, inst = 0;
   757		eint->instance_number = 1;
   758		eint->total_pin_number = eint->hw->ap_num;
   759	
   760		for (i = 0; i < eint->total_pin_number; i++) {
   761			eint->pins[i].enabled = true;
   762			eint->pins[i].instance = inst;
   763			eint->pins[i].index = i;
   764			eint->pins[i].debounce =  (i < eint->hw->db_cnt) ? 1 : 0;
   765	
   766			eint->instances[inst].pin_list[i] = i;
   767			eint->instances[inst].number++;
   768		}
   769	
   770		for (i = 0; i < eint->instance_number; i++) {
   771			size = (eint->instances[i].number / MAX_BIT + 1) * sizeof(unsigned int);
   772			eint->instances[i].wake_mask =
   773				devm_kzalloc(eint->dev, size, GFP_KERNEL);
   774			eint->instances[i].cur_mask =
   775				devm_kzalloc(eint->dev, size, GFP_KERNEL);
   776	
   777			if (!eint->instances[i].wake_mask ||
   778			    !eint->instances[i].cur_mask)
   779				return -ENOMEM;
   780		}
   781	
   782		eint->comp = &default_compat;
   783	
   784		eint->domain = irq_domain_add_linear(eint->dev->of_node,
   785						     eint->total_pin_number,
   786						     &irq_domain_simple_ops, NULL);
   787		if (!eint->domain)
   788			return -ENOMEM;
   789	
   790		mtk_eint_hw_init(eint);
   791		for (i = 0; i < eint->total_pin_number; i++) {
   792			virq = irq_create_mapping(eint->domain, i);
   793	
   794			irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
   795						 handle_level_irq);
   796			irq_set_chip_data(virq, eint);
   797		}
   798	
   799		irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
   800						 eint);
   801	
   802		global_eintc = eint;
   803	
   804		return 0;
   805	}
   806	EXPORT_SYMBOL_GPL(mtk_eint_do_init);
   807	
   808	int mtk_eint_do_init_v2(struct mtk_eint *eint)
   809	{
   810		int i, virq, matrix_number = 0;
   811		struct device_node *node;
   812		unsigned int ret, size, ofset;
   813		unsigned int id, inst, idx, support_deb;
   814	
   815		const phandle *ph;
   816	
   817		ph = of_get_property(eint->dev->of_node, "mediatek,eint", NULL);
   818		if (!ph) {
   819			dev_err(eint->dev, "Cannot find EINT phandle in PIO node.\n");
   820			return -ENODEV;
   821		}
   822	
 > 823		node = of_find_node_by_phandle(be32_to_cpup(ph));
   824		if (!node) {
   825			dev_err(eint->dev, "Cannot find EINT node by phandle.\n");
   826			return -ENODEV;
   827		}
   828	
   829		ret = of_property_read_u32(node, "mediatek,total-pin-number",
   830					   &eint->total_pin_number);
   831		if (ret) {
   832			dev_err(eint->dev,
   833			       "%s cannot read total-pin-number from device node.\n",
   834			       __func__);
   835			return -EINVAL;
   836		}
   837	
   838		dev_info(eint->dev, "%s eint total %u pins.\n", __func__,
   839			eint->total_pin_number);
   840	
   841		ret = of_property_read_u32(node, "mediatek,instance-num",
   842					   &eint->instance_number);
   843		if (ret)
   844			eint->instance_number = 1; // only 1 instance in legacy chip
   845	
   846		size = eint->instance_number * sizeof(struct mtk_eint_instance);
   847		eint->instances = devm_kzalloc(eint->dev, size, GFP_KERNEL);
   848		if (!eint->instances)
   849			return -ENOMEM;
   850	
   851		size = eint->total_pin_number * sizeof(struct mtk_eint_pin);
   852		eint->pins = devm_kzalloc(eint->dev, size, GFP_KERNEL);
   853		if (!eint->pins)
   854			return -ENOMEM;
   855	
   856		for (i = 0; i < eint->instance_number; i++) {
   857			ret = of_property_read_string_index(node, "reg-name", i,
   858							    &(eint->instances[i].name));
   859			if (ret) {
   860				dev_info(eint->dev,
   861					 "%s cannot read the name of instance %d.\n",
   862					 __func__, i);
   863			}
   864	
   865			eint->instances[i].base = of_iomap(node, i);
   866			if (!eint->instances[i].base)
   867				return -ENOMEM;
   868		}
   869	
   870		matrix_number = of_property_count_u32_elems(node, "mediatek,pins") / ARRAY_0;
   871		if (matrix_number < 0) {
   872			matrix_number = eint->total_pin_number;
   873			dev_info(eint->dev, "%s eint in legacy mode, assign the matrix number to %u.\n",
   874				 __func__, matrix_number);
   875		} else
   876			dev_info(eint->dev, "%s eint in new mode, assign the matrix number to %u.\n",
   877				 __func__, matrix_number);
   878	
   879		for (i = 0; i < matrix_number; i++) {
   880			ofset = i * REG_OFSET;
   881	
   882			ret = of_property_read_u32_index(node, "mediatek,pins",
   883						   ofset, &id);
   884			ret |= of_property_read_u32_index(node, "mediatek,pins",
   885						   ofset+FIRST, &inst);
   886			ret |= of_property_read_u32_index(node, "mediatek,pins",
   887						   ofset+SECOND, &idx);
   888			ret |= of_property_read_u32_index(node, "mediatek,pins",
   889						   ofset+THIRD, &support_deb);
   890	
   891			/* Legacy chip which no need to give coordinate list */
   892			if (ret) {
   893				id = i;
   894				inst = 0;
   895				idx = i;
   896				support_deb = (i < MAX_BIT) ? 1 : 0;
   897			}
   898	
   899			eint->pins[id].enabled = true;
   900			eint->pins[id].instance = inst;
   901			eint->pins[id].index = idx;
   902			eint->pins[id].debounce = support_deb;
   903	
   904			eint->instances[inst].pin_list[idx] = id;
   905			eint->instances[inst].number++;
   906	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

