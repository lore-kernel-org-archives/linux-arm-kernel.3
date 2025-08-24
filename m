Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C20CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 19:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3G7G57FudEO6/xGHV3Q+SctALPt3jhm1oRfT46ePAKc=; b=GLqCk8SqcjGHku0Cy46f+O143R
	1l3XbH07SG4EnRffZ+iVkNy6izvr2HzaOeq/FrkFnkdKdfIXMeA9YsUt6axVzGgz5VKcZ26MC4Od/
	pVe9YnyG+BHyOkPQllVOkxOWsbt6p1Zr9g5NcVerVrVyzqDhA2nkyqlIaq3J5Q3GXzpY1YQ/uJFjf
	eCcvLsqeLLqePHDq/kDbxXhtCnh61rSLsVYkDF141qOnzJ0AAq+IMO44bXaiAyBuOdn58m9vvyWR2
	JDSa7z/IxY0cXnVsAZRopru/uAQctaEHLiWo4Tj9yHAHKejM45sZDlKAaNpYRTlYBjQLFDQJgUu5k
	CZLL8yZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqGb5-00000006VME-2Kr8;
	Sun, 24 Aug 2025 19:41:47 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqGYT-00000006VGX-02Ts
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 19:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756064345; x=1787600345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8DlnE/rWJ6b3Mfl7JEc3Sc72YTacrmk6cJufKubDOs4=;
  b=YQ1bP1dcQSYiRfFcZ34dckjkpCgD7KInfPvYLrzlV8dUOniJDv6RG4yu
   T8ldZsW110cE2oTvNcI2waEYXhSgcPm+YD1U+RFV/fbfXTy4rQgKh1mfY
   nXBSin08xbxTxY7eXkzaifnXQ5zUbUTCVdxQun8V94Sh3Sl0SWG8loiSF
   KmVoSYYi5b90sripJFKLffd3CsMiYXeq6YD4ALKGzcFtqkIERXtIrHKjt
   K43rwo+34vc0hXp9qFlQH53Eks7uipRknn2bo5NrlM7jyvSjeDDuuXCN5
   FpB/4eb4AUHyeLhfvcSr3S/F2eQ9o10lzA5qv8yMsGUIVp+sZddLAtnNx
   g==;
X-CSE-ConnectionGUID: sJo6sS05Spi6qSu89Rl0Zg==
X-CSE-MsgGUID: Rkh0QexMT/C3VWm8SOSx3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69386973"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69386973"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 12:39:00 -0700
X-CSE-ConnectionGUID: MSw73TzIQPKqeRD6Q/wQQw==
X-CSE-MsgGUID: E77TZh/xTvu73DwINgJcmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="192793643"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Aug 2025 12:38:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqGYJ-000NBP-1Q;
	Sun, 24 Aug 2025 19:38:55 +0000
Date: Mon, 25 Aug 2025 03:38:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/14] dmaengine: dma350: Support ARM DMA-250
Message-ID: <202508250351.vxyvTsJa-lkp@intel.com>
References: <20250823154009.25992-15-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823154009.25992-15-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_123905_125580_08CEA823 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Jisheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dmaengine-dma350-Fix-CH_CTRL_USESRCTRIGIN-definition/20250824-000425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250823154009.25992-15-jszhang%40kernel.org
patch subject: [PATCH 14/14] dmaengine: dma350: Support ARM DMA-250
config: x86_64-buildonly-randconfig-002-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250351.vxyvTsJa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508250351.vxyvTsJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508250351.vxyvTsJa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/arm-dma350.c:849:34: warning: variable 'sg' is uninitialized when used here [-Wuninitialized]
     849 |         sglen = DIV_ROUND_UP(sg_dma_len(sg), step_max) * periods;
         |                                         ^~
   include/linux/scatterlist.h:34:27: note: expanded from macro 'sg_dma_len'
      34 | #define sg_dma_len(sg)          ((sg)->dma_length)
         |                                   ^~
   include/uapi/linux/const.h:51:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
      51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   drivers/dma/arm-dma350.c:835:24: note: initialize the variable 'sg' to silence this warning
     835 |         struct scatterlist *sg;
         |                               ^
         |                                = NULL
   1 warning generated.


vim +/sg +849 drivers/dma/arm-dma350.c

   824	
   825	static struct dma_async_tx_descriptor *
   826	d250_prep_cyclic(struct dma_chan *chan, dma_addr_t buf_addr,
   827			 size_t buf_len, size_t period_len, enum dma_transfer_direction dir,
   828			 unsigned long flags)
   829	{
   830		struct d350_chan *dch = to_d350_chan(chan);
   831		u32 len, periods, trig, *cmd, tsz;
   832		dma_addr_t src, dst, phys, mem_addr;
   833		size_t xfer_len, step_max;
   834		struct d350_desc *desc;
   835		struct scatterlist *sg;
   836		struct d350_sg *dsg;
   837		int sglen, i;
   838	
   839		if (unlikely(!is_slave_direction(dir) || !buf_len || !period_len))
   840			return NULL;
   841	
   842		if (dir == DMA_MEM_TO_DEV)
   843			tsz = __ffs(dch->config.dst_addr_width | (1 << dch->tsz));
   844		else
   845			tsz = __ffs(dch->config.src_addr_width | (1 << dch->tsz));
   846		step_max = ((1UL << 16) - 1) << tsz;
   847	
   848		periods = buf_len / period_len;
 > 849		sglen = DIV_ROUND_UP(sg_dma_len(sg), step_max) * periods;
   850	
   851		desc = kzalloc(struct_size(desc, sg, sglen), GFP_NOWAIT);
   852		if (!desc)
   853			return NULL;
   854	
   855		dch->cyclic = true;
   856		dch->periods = periods;
   857		desc->sglen = sglen;
   858	
   859		sglen = 0;
   860		for (i = 0; i < periods; i++) {
   861			len = period_len;
   862			mem_addr = buf_addr + i * period_len;
   863			do {
   864				desc->sg[sglen].command = dma_pool_zalloc(dch->cmd_pool, GFP_NOWAIT, &phys);
   865				if (unlikely(!desc->sg[sglen].command))
   866					goto err_cmd_alloc;
   867	
   868				xfer_len = (len > step_max) ? step_max : len;
   869				desc->sg[sglen].phys = phys;
   870				dsg = &desc->sg[sglen];
   871	
   872				if (dir == DMA_MEM_TO_DEV) {
   873					src = mem_addr;
   874					dst = dch->config.dst_addr;
   875					trig = CH_CTRL_USEDESTRIGIN;
   876				} else {
   877					src = dch->config.src_addr;
   878					dst = mem_addr;
   879					trig = CH_CTRL_USESRCTRIGIN;
   880				}
   881				dsg->tsz = tsz;
   882				dsg->xsize = lower_16_bits(xfer_len >> dsg->tsz);
   883	
   884				cmd = dsg->command;
   885				cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_DESADDR |
   886					 LINK_XSIZE | LINK_SRCTRANSCFG |
   887					 LINK_DESTRANSCFG | LINK_XADDRINC | LINK_LINKADDR;
   888	
   889				cmd[1] = FIELD_PREP(CH_CTRL_TRANSIZE, dsg->tsz) |
   890					 FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE) |
   891					 FIELD_PREP(CH_CTRL_DONETYPE, CH_CTRL_DONETYPE_CMD) | trig;
   892	
   893				cmd[2] = lower_32_bits(src);
   894				cmd[3] = lower_32_bits(dst);
   895				cmd[4] = FIELD_PREP(CH_XY_SRC, dsg->xsize) |
   896					 FIELD_PREP(CH_XY_DES, dsg->xsize);
   897				if (dir == DMA_MEM_TO_DEV) {
   898					cmd[0] |= LINK_DESTRIGINCFG;
   899					cmd[5] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
   900					cmd[6] = TRANSCFG_DEVICE;
   901					cmd[7] = FIELD_PREP(CH_XY_SRC, 1);
   902					cmd[8] = FIELD_PREP(CH_DESTRIGINMODE, CH_DESTRIG_DMA_FC) |
   903						  FIELD_PREP(CH_DESTRIGINTYPE, CH_DESTRIG_HW_REQ);
   904				} else {
   905					cmd[0] |= LINK_SRCTRIGINCFG;
   906					cmd[5] = TRANSCFG_DEVICE;
   907					cmd[6] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
   908					cmd[7] = FIELD_PREP(CH_XY_DES, 1);
   909					cmd[8] = FIELD_PREP(CH_SRCTRIGINMODE, CH_SRCTRIG_DMA_FC) |
   910						  FIELD_PREP(CH_SRCTRIGINTYPE, CH_SRCTRIG_HW_REQ);
   911				}
   912	
   913				if (sglen)
   914					desc->sg[sglen - 1].command[9] = phys | CH_LINKADDR_EN;
   915	
   916				len -= xfer_len;
   917				mem_addr += xfer_len;
   918				sglen++;
   919			} while (len);
   920			desc->sg[sglen - 1].command[1] |= FIELD_PREP(CH_CTRL_DONETYPE,
   921								     CH_CTRL_DONETYPE_CMD);
   922		}
   923	
   924		/* cyclic list */
   925		desc->sg[sglen - 1].command[9] = desc->sg[0].phys | CH_LINKADDR_EN;
   926	
   927		mb();
   928	
   929		return vchan_tx_prep(&dch->vc, &desc->vd, flags);
   930	
   931	err_cmd_alloc:
   932		for (i = 0; i < sglen; i++)
   933			dma_pool_free(dch->cmd_pool, desc->sg[i].command, desc->sg[i].phys);
   934		kfree(desc);
   935		return NULL;
   936	}
   937	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

