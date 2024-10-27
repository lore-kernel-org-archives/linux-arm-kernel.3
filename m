Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FEBD13572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 18:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1bxIWA7tzzuJ88LIetAizLHq7RYaGqEOl9fJGgiZvw=; b=h2e93U9JlApm3MkqoggLXxAuHa
	+jfg+j31tEIkAYeNhCFzfVxqbsw5qNIS6ajg24yadANNVX79cChVcJ8DIu9YAhQ/EkmEQKIjnot3U
	s4CGUJvQgaIuyn4W5roP6b3X9mPDI/dq00ffZYGt2361gpUO6F1st+w1hT+x+ulgBwK7JT3h+S5JC
	aLHrKheUQ7Z0rn3VlTGrZ2mXuB2Rehc4/zZZpjvJX+Zk1CAszsIdkp52tfaKKoffTbeptSwgZQ3mb
	1L4OL+vEmXdblIg4mQEwCO/SNa9sJa04GqKBf1Y9ietgKUMEHgNLfvZLH6YxuPYjqSRVobcJcLN/s
	exgE4sSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t57uv-00000008fjq-2Wqa;
	Sun, 27 Oct 2024 18:23:09 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t57tK-00000008fch-1Opw;
	Sun, 27 Oct 2024 18:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730053290; x=1761589290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0foY50M4HsUnWQT73wNT19qOzDjY/3ojUHdpCR2Au0=;
  b=euQ2ayl+pBz8RRviwKEyxXlfiSnffmGYeD13pgSrHajDW95OtO4fA0wu
   fmsBCd+hB4BqQSHu5iusQqGOC+aATLsIRh/OQetZtpz51ctMDhPaf6cQ7
   gy6StdySZsnEWBqkJ/0n6flKvy/9u6cVCfNX/1aYCGxaV89FVYuHqFGmC
   OadeECcYqZR3cvKOne9d3eaQrznJkfv/Ml5Yz3CD1K0PUWKY3JYAlV+56
   MDkki2qUWRbu7FK5OiPkzEs5xkZI58oCtbC5h/2pXQogLIv09d0fxCyWV
   unFZoLbADqVNyJowwgFyJkiEsDXa6UbDdJZglWDMSnWg+l2HPxJt88xNK
   A==;
X-CSE-ConnectionGUID: g+2QbFDISf+TLkYslISCPA==
X-CSE-MsgGUID: dnXekOsqT6G2Zn8/qKUAeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33564715"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="33564715"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 11:21:23 -0700
X-CSE-ConnectionGUID: H1QstXZTRRS7jy5jDhNBEg==
X-CSE-MsgGUID: IpKzxFHhSB6Dxzeg+K+IdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="81353158"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2024 11:21:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t57t7-000au5-2t;
	Sun, 27 Oct 2024 18:21:17 +0000
Date: Mon, 28 Oct 2024 02:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chhao Chang <ot_chhao.chang@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Message-ID: <202410280230.KAMZK7aZ-lkp@intel.com>
References: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_112130_449675_AE3C613B 
X-CRM114-Status: GOOD (  13.64  )
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
config: s390-randconfig-r131-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280230.KAMZK7aZ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20241028/202410280230.KAMZK7aZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280230.KAMZK7aZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/mediatek/mtk-eint.c:14:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/pinctrl/mediatek/mtk-eint.c:14:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/pinctrl/mediatek/mtk-eint.c:14:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/pinctrl/mediatek/mtk-eint.c:588:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           dsb(sy);
           ^
   drivers/pinctrl/mediatek/mtk-eint.c:588:6: error: use of undeclared identifier 'sy'
           dsb(sy);
               ^
   drivers/pinctrl/mediatek/mtk-eint.c:609:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           dsb(sy);
           ^
   drivers/pinctrl/mediatek/mtk-eint.c:609:6: error: use of undeclared identifier 'sy'
           dsb(sy);
               ^
   drivers/pinctrl/mediatek/mtk-eint.c:686:14: warning: no previous prototype for function 'mtk_eint_get_debounce_en' [-Wmissing-prototypes]
   unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
                ^
   drivers/pinctrl/mediatek/mtk-eint.c:686:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
   ^
   static 
   drivers/pinctrl/mediatek/mtk-eint.c:709:14: warning: no previous prototype for function 'mtk_eint_get_debounce_value' [-Wmissing-prototypes]
   unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
                ^
   drivers/pinctrl/mediatek/mtk-eint.c:709:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
   ^
   static 
   14 warnings and 4 errors generated.


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

