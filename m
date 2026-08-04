Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22EBC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6576v3MOprnouh8kf8c+zTXGFEWTUzL1KdNDDydAwE=; b=hXGzUkB37G9HepLw6hMtPUOdwF
	J4C/w2pqUzKUB90MF23zUxqKRxyM3lqZTSnuNuojsJQukXq9Ykfnzeq3A2mVbU4ZpqE4Rw2rIOUuh
	Njirafc4u/Ar7rOdPbBqbVNppB5nCqysQT6xUH0QYqMKhuZZpYotkZv9Tjf/tZEXTqC22Sy3IRUmn
	+STiQ8dDJzDFm6K8DMIPJ6J+dg08n0qaBCrt1gwwEZldmG9Rj5xQ3B+wPxDONYupBAL3BS7nlTwys
	jqB6Y8yOfDdi143KIu4+rPvolx/ZiLkbJZW7F36EUgOrWkLVpiIyqnL9nOyITSJBhaVqNry2iVQKd
	iwqEqXXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJZm-00000002Zpq-0yUA;
	Tue, 04 Aug 2026 18:09:18 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJZj-00000002Zp6-375j;
	Tue, 04 Aug 2026 18:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785866956; x=1817402956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4aSiIYeWMIhCKAcDd1UGuzMezS0cEl8w1x31H8BKhLk=;
  b=PNvs0kdm4c/niwTEFDtHTNqFcf4FPPekHvbOBn4Fo61jDk8Yzk4a7vRK
   PoWxu44udwywjdbbllgFXxBKZKe9RKsq6wsZF/+fQnaUXj4eHfIACMNQO
   uuofXfw6z5l00i0eu0s2Pnpu7ckUxSC8VcUjtwAFxLXzoDE/d0azsl7YB
   X98So5QTdyULfVYTpVFoQWyLyKLSWCX7yMtGar64BNflbT1JEAVApVaON
   wmam4cXgT8nfIWpC56E/NLB+0ytgb45PN6LHDiVoWCZQHLN/PGne6YRA5
   f/CI8DElb+B0kZDbbQ6HKkFLlecp3qq/MJaUl05zuCHa9d5Pm0lw4HkI6
   w==;
X-CSE-ConnectionGUID: RtknB+PoSjirVp52kWtx7g==
X-CSE-MsgGUID: PYU19+JSSUiBDtOGHvhelg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="85406710"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="85406710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 11:09:15 -0700
X-CSE-ConnectionGUID: w/e1AY87R+KoigwvlggZyA==
X-CSE-MsgGUID: KyhvMCRLRjCmqW3k5o0O+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="259798529"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Aug 2026 11:09:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrJZc-00000000ANR-466W;
	Tue, 04 Aug 2026 18:09:08 +0000
Date: Wed, 5 Aug 2026 02:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>, ryder.lee@mediatek.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix 64-bit type truncation in
 mtk_pcie_set_trans_table()
Message-ID: <202608050123.GZC7hug7-lkp@intel.com>
References: <20260728101413.4575-1-sreekuttan2156239@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728101413.4575-1-sreekuttan2156239@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_110915_794263_533367FF 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Sreeraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.2-rc6 next-20260803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sreeraj-S-Kurup/PCI-mediatek-gen3-Fix-64-bit-type-truncation-in-mtk_pcie_set_trans_table/20260728-183948
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260728101413.4575-1-sreekuttan2156239%40gmail.com
patch subject: [PATCH] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050123.GZC7hug7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050123.GZC7hug7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050123.GZC7hug7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:5,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/pci/controller/pcie-mediatek-gen3.c:10:
   drivers/pci/controller/pcie-mediatek-gen3.c: In function 'mtk_pcie_set_trans_table':
>> drivers/pci/controller/pcie-mediatek-gen3.c:340:46: error: implicit declaration of function 'ffs64'; did you mean 'fls64'? [-Wimplicit-function-declaration]
     340 |                         addr_align = BIT_ULL(ffs64(cpu_addr) - 1);
         |                                              ^~~~~
   include/vdso/bits.h:8:45: note: in definition of macro 'BIT_ULL'
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                             ^~


vim +340 drivers/pci/controller/pcie-mediatek-gen3.c

   321	
   322	static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
   323					    resource_size_t cpu_addr,
   324					    resource_size_t pci_addr,
   325					    resource_size_t size,
   326					    unsigned long type, int *num)
   327	{
   328		resource_size_t remaining = size;
   329		resource_size_t table_size;
   330		resource_size_t addr_align;
   331		const char *range_type;
   332		void __iomem *table;
   333		u32 val;
   334	
   335		while (remaining && (*num < PCIE_MAX_TRANS_TABLES)) {
   336			/* Table size needs to be a power of 2 */
   337			table_size = BIT_ULL(fls64(remaining) - 1);
   338	
   339			if (cpu_addr > 0) {
 > 340				addr_align = BIT_ULL(ffs64(cpu_addr) - 1);
   341				table_size = min(table_size, addr_align);
   342			}
   343	
   344			/* Minimum size of translate table is 4KiB */
   345			if (table_size < 0x1000) {
   346				dev_err(pcie->dev, "illegal table size %#llx\n",
   347					(unsigned long long)table_size);
   348				return -EINVAL;
   349			}
   350	
   351			table = pcie->base + PCIE_TRANS_TABLE_BASE_REG + *num * PCIE_ATR_TLB_SET_OFFSET;
   352			writel_relaxed(lower_32_bits(cpu_addr) |
   353					PCIE_ATR_SIZE(fls64(table_size) - 1), table);
   354			writel_relaxed(upper_32_bits(cpu_addr), table + PCIE_ATR_SRC_ADDR_MSB_OFFSET);
   355			writel_relaxed(lower_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_LSB_OFFSET);
   356			writel_relaxed(upper_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_MSB_OFFSET);
   357	
   358			if (type == IORESOURCE_IO) {
   359				val = PCIE_ATR_TYPE_IO | PCIE_ATR_TLP_TYPE_IO;
   360				range_type = "IO";
   361			} else {
   362				val = PCIE_ATR_TYPE_MEM | PCIE_ATR_TLP_TYPE_MEM;
   363				range_type = "MEM";
   364			}
   365	
   366			writel_relaxed(val, table + PCIE_ATR_TRSL_PARAM_OFFSET);
   367	
   368			dev_dbg(pcie->dev, "set %s trans window[%d]: cpu_addr = %#llx, pci_addr = %#llx, size = %#llx\n",
   369				range_type, *num, (unsigned long long)cpu_addr,
   370				(unsigned long long)pci_addr,
   371				(unsigned long long)table_size);
   372	
   373			cpu_addr += table_size;
   374			pci_addr += table_size;
   375			remaining -= table_size;
   376			(*num)++;
   377		}
   378	
   379		if (remaining)
   380			dev_warn(pcie->dev, "not enough translate table for addr: %#llx, limited to [%d]\n",
   381				 (unsigned long long)cpu_addr, PCIE_MAX_TRANS_TABLES);
   382	
   383		return 0;
   384	}
   385	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

