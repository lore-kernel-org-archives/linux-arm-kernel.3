Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AFED7830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvxBtQf9aZiNWc+AJo0OQGsg+0jM7GsmA5RsXFxXkFk=; b=XMnrwW6YzbqutCP6LCFAfMGtTc
	jHM7EcYbtr76anF6cGx8mL+XbENbRfx+gJmqJ5fKEQGURm3a+AhvjyFqeUFNzmth7HopozxqeL/JW
	40ZRISj12oYlBvOjClOC2gp4FaxR0JQuzLCJaULzLy/RaNvmC/orLcrnhVKFE2Cq/BFpfzmPtCgDb
	J3Dlup81KZlQUkxmDlh0TUhjeAkQaypvzzctzkm9C/xD0pVgzHvqNPte/SwijBEUE2JM26rEytMm6
	4OflckBwxCi5YqDaelj6aN+sKCe8gvz4p/iVfO5EwAMEBTiZm2POaJgtv8Y3ZSu/zAxJXvnwjb1Kr
	c2zK7IKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4yH-00000005xkK-0Cn3;
	Mon, 02 Dec 2024 11:52:09 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4xE-00000005xbi-1Lva;
	Mon, 02 Dec 2024 11:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733140265; x=1764676265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2srtZCdeol2V5qtsK1VBin+zesE397D8m0Y3SqsxCEc=;
  b=jae8cMgmwN/nGHeVslLTsxu0eg6+9D1KRUt3+sHn18l2ETAq7Cmvqo+c
   JEVa8Pcn3A+bEg5Xu1QfbJT08KCxTZyyzu7AZEzFNzY30zdbbMmcESHOp
   oXHyvHEnXJGGfUitHzbiQQYuyhTyctTIKaMvKHXyYWiI47LFYTRhllb+j
   KAkRpnO+IuubNBFu42vOZQCKs/VzHX6q1v3pyosqp5wtEHz2VZesECqQe
   njV2z34d+/EPYkP1O5BsCCqkOOPBoryF0Pnj3USybzwdvLjy2b0GO1mYU
   G8gCA6XYmXKY19s8XmedWKuhD8KRWS5x3hBJu2yVHHHzQ/dp2WLg/X1O8
   w==;
X-CSE-ConnectionGUID: aSBUghGxQD+8CJLQcfyQTw==
X-CSE-MsgGUID: 5ghJ/mgsTaSO0w7rFhkQow==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33456089"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33456089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 03:51:01 -0800
X-CSE-ConnectionGUID: Kwt5vPnVTBOsVmupP3iQlQ==
X-CSE-MsgGUID: J/aqEOXBSD6Orwo9sEIQmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="97855401"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2024 03:50:57 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI4x5-0002NJ-2G;
	Mon, 02 Dec 2024 11:50:55 +0000
Date: Mon, 2 Dec 2024 19:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Chhao Chang <ot_chhao.chang@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Message-ID: <202412021959.txWIlGI0-lkp@intel.com>
References: <20241202085024.25375-1-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202085024.25375-1-ot_chhao.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_035104_408236_F9D8541E 
X-CRM114-Status: GOOD (  16.22  )
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
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.13-rc1 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chang-hao/pinctrl-mediatek-add-eint-new-design-for-mt8196/20241202-165544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241202085024.25375-1-ot_chhao.chang%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: add eint new design for mt8196
config: x86_64-buildonly-randconfig-004-20241202 (https://download.01.org/0day-ci/archive/20241202/202412021959.txWIlGI0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021959.txWIlGI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021959.txWIlGI0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/mtk-eint.c:246:6: warning: no previous prototype for function 'mt6983_eint_ack' [-Wmissing-prototypes]
     246 | void mt6983_eint_ack(struct irq_data *d)
         |      ^
   drivers/pinctrl/mediatek/mtk-eint.c:246:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     246 | void mt6983_eint_ack(struct irq_data *d)
         | ^
         | static 
>> drivers/pinctrl/mediatek/mtk-eint.c:605:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     605 |         dsb(sy);
         |         ^
>> drivers/pinctrl/mediatek/mtk-eint.c:605:6: error: use of undeclared identifier 'sy'
     605 |         dsb(sy);
         |             ^
   drivers/pinctrl/mediatek/mtk-eint.c:626:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     626 |         dsb(sy);
         |         ^
   drivers/pinctrl/mediatek/mtk-eint.c:626:6: error: use of undeclared identifier 'sy'
     626 |         dsb(sy);
         |             ^
>> drivers/pinctrl/mediatek/mtk-eint.c:704:14: warning: no previous prototype for function 'mtk_eint_get_debounce_en' [-Wmissing-prototypes]
     704 | unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
         |              ^
   drivers/pinctrl/mediatek/mtk-eint.c:704:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     704 | unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
         | ^
         | static 
>> drivers/pinctrl/mediatek/mtk-eint.c:727:14: warning: no previous prototype for function 'mtk_eint_get_debounce_value' [-Wmissing-prototypes]
     727 | unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
         |              ^
   drivers/pinctrl/mediatek/mtk-eint.c:727:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     727 | unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
         | ^
         | static 
   3 warnings and 4 errors generated.


vim +/dsb +605 drivers/pinctrl/mediatek/mtk-eint.c

   589	
   590	int mtk_eint_do_suspend(struct mtk_eint *eint)
   591	{
   592		unsigned int i, j, port;
   593	
   594		for (i = 0; i < eint->instance_number; i++) {
   595			struct mtk_eint_instance inst = eint->instances[i];
   596	
   597			for (j = 0; j < inst.number; j += 32) {
   598				port = j >> 5;
   599				writel_relaxed(~inst.wake_mask[port],
   600					       inst.base + port * 4 + eint->comp->regs->mask_set);
   601				writel_relaxed(inst.wake_mask[port],
   602					       inst.base + port * 4 + eint->comp->regs->mask_clr);
   603			}
   604		}
 > 605		dsb(sy);
   606	
   607		return 0;
   608	}
   609	EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
   610	
   611	int mtk_eint_do_resume(struct mtk_eint *eint)
   612	{
   613		unsigned int i, j, port;
   614	
   615		for (i = 0; i < eint->instance_number; i++) {
   616			struct mtk_eint_instance inst = eint->instances[i];
   617	
   618			for (j = 0; j < inst.number; j += 32) {
   619				port = j >> 5;
   620				writel_relaxed(~inst.cur_mask[port],
   621					       inst.base + port * 4 + eint->comp->regs->mask_set);
   622				writel_relaxed(inst.cur_mask[port],
   623					       inst.base + port * 4 + eint->comp->regs->mask_clr);
   624			}
   625		}
   626		dsb(sy);
   627	
   628		return 0;
   629	}
   630	EXPORT_SYMBOL_GPL(mtk_eint_do_resume);
   631	
   632	int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
   633				  unsigned int debounce)
   634	{
   635		int virq, eint_offset;
   636		unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask,
   637			     dbnc;
   638		static const unsigned int debounce_time[] = { 156, 313, 625, 1250,
   639			20000, 40000, 80000, 160000, 320000, 640000 };
   640		struct irq_data *d;
   641		unsigned int instance, index;
   642		void __iomem *reg;
   643	
   644		/*
   645		 * Due to different number of bit field, we only decode
   646		 * the coordinate here, instead of get the VA.
   647		 */
   648		reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
   649					  &instance, &index);
   650	
   651		if (!reg) {
   652			dev_err(eint->dev, "%s invalid eint_num %lu\n",
   653				__func__, eint_num);
   654			return 0;
   655		}
   656	
   657		virq = irq_find_mapping(eint->domain, eint_num);
   658		eint_offset = (index % 4) * 8;
   659		d = irq_get_irq_data(virq);
   660	
   661		reg = eint->instances[instance].base;
   662		set_offset = (index / 4) * 4 + eint->comp->regs->dbnc_set;
   663		clr_offset = (index / 4) * 4 + eint->comp->regs->dbnc_clr;
   664	
   665		if (!mtk_eint_can_en_debounce(eint, eint_num))
   666			return -EINVAL;
   667	
   668		/*
   669		 * Check eint number to avoid access out-of-range
   670		 */
   671		dbnc = ARRAY_SIZE(debounce_time) - 1;
   672		for (i = 0; i < ARRAY_SIZE(debounce_time); i++) {
   673			if (debounce <= debounce_time[i]) {
   674				dbnc = i;
   675				break;
   676			}
   677		}
   678	
   679		if (!mtk_eint_get_mask(eint, eint_num)) {
   680			mtk_eint_mask(d);
   681			unmask = 1;
   682		} else {
   683			unmask = 0;
   684		}
   685	
   686		clr_bit = 0xff << eint_offset;
   687		writel(clr_bit, reg + clr_offset);
   688	
   689		bit = ((dbnc << MTK_EINT_DBNC_SET_DBNC_BITS)
   690			| MTK_EINT_DBNC_SET_EN) << eint_offset;
   691		rst = MTK_EINT_DBNC_RST_BIT << eint_offset;
   692		writel(rst | bit, reg + set_offset);
   693	
   694		/* Delay should be (8T @ 32k) from dbc rst to work correctly. */
   695		udelay(250);
   696	
   697		if (unmask == 1)
   698			mtk_eint_unmask(d);
   699	
   700		return 0;
   701	}
   702	EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
   703	
 > 704	unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
   705					      unsigned int eint_num)
   706	{
   707		unsigned int instance, index, bit;
   708		void __iomem *reg;
   709	
   710		reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
   711					  &instance, &index);
   712	
   713		if (!reg) {
   714			dev_err(eint->dev, "%s invalid eint_num %d\n",
   715				__func__, eint_num);
   716			return 0;
   717		}
   718	
   719		reg = eint->instances[instance].base +
   720			(index / 4) * 4 + eint->comp->regs->dbnc_ctrl;
   721	
   722		bit = MTK_EINT_DBNC_SET_EN << ((index % 4) * 8);
   723	
   724		return (readl(reg) & bit) ? 1 : 0;
   725	}
   726	
 > 727	unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
   728						 unsigned int eint_num)
   729	{
   730		unsigned int instance, index, mask, offset;
   731		void __iomem *reg;
   732	
   733		reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
   734					  &instance, &index);
   735	
   736		if (!reg) {
   737			dev_err(eint->dev, "%s invalid eint_num %d\n",
   738				__func__, eint_num);
   739			return 0;
   740		}
   741	
   742		reg = eint->instances[instance].base +
   743			(index / 4) * 4 + eint->comp->regs->dbnc_ctrl;
   744	
   745		offset = MTK_EINT_DBNC_SET_DBNC_BITS + ((index % 4) * 8);
   746		mask = 0xf << offset;
   747	
   748		return ((readl(reg) & mask) >> offset);
   749	}
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

