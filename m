Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AD5C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 01:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPNsFcUYhv82KSowqlG7eWMjT5EQftUTzDLZ/eIlBJ8=; b=WZnPCn1TD8JxZLFTTW7M5zuHVZ
	jSygxEZAKRNAsij3hIEYUQu39LV3TBIX/zqJ7zKmEeES42WYO6uq7At+SFL2qyviX7sJfBGuj51tn
	1BWSJChAj0yXeTrf+PSWlPqtnoArBH7S7Z/phT8i/qIxdQpkAJk8VyuTU5WdsSmf4XoQ9IWeuVpTh
	Njfwt3FY/kUrssD5Ox+oOadcdHJcl6/5dbU3WfQ+d6GoZpC1yI0MC1nLPZP764XqIjvvAawqq17qP
	+poO+Gj1QXVrXL/LEeDkIlo+KAZ4edGpm3OEHnrvZj6r3e+1g9RTFcqXklPOTXWsRPc4YI5/IbTTg
	l36EoVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ZfL-00000007z2K-3zmh;
	Tue, 29 Apr 2025 01:21:43 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ZdP-00000007yiX-2uHF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 01:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889583; x=1777425583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R3UAhkpOPCmKmxNTzkcTSJ8pqpaUKXLkVbgY8NNMnek=;
  b=lRraj1R+ehvFb3Au8U5K/nfXd6G5tWEY8wiy2yh91DIj+PeWIlJImIzA
   ZicndxjSJtl/5Q3vC4vLkh05qyV72wJD4Fo60OLrlEGuHovxNU9AEwLs1
   ykC/o/0FZ5sadgbEfBjay2zFWyTpunkj5lkJ0suvbWSPMZCNO1HH7NM0Q
   p003/scP9xsF/NyfMmLb/0CxaexABEH1bW3mchEEwdxLrG7zpr2I+OUj7
   kgxtwKMZTV9a44t+fgsb3kykT2phk9LmYh2CW28pmrCnGcXsO+ZyYwDQG
   HGUkE6baXyGQGwO58cxCf8be+eepJx76gO0t+kahJjcqPyMG8eW23xTAZ
   Q==;
X-CSE-ConnectionGUID: yR4VFsZfT+aU/SttomWyCA==
X-CSE-MsgGUID: 1phUDBbMSCi4qQ0T6XQyGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165275"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51165275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: NL+2JPk/QSatszxG4Hf86A==
X-CSE-MsgGUID: SgVXDWYzSQ2Krf65Z8hqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164775790"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Zd7-00001R-1V;
	Tue, 29 Apr 2025 01:19:25 +0000
Date: Tue, 29 Apr 2025 02:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, peter.ujfalusi@gmail.com,
	vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, a-chavda@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/8] drivers: soc: ti: k3-ringacc: handle absence of tisci
Message-ID: <202504290207.ct0tnV56-lkp@intel.com>
References: <20250428072032.946008-6-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428072032.946008-6-s-adivi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_181943_776171_E732A0FF 
X-CRM114-Status: GOOD (  12.32  )
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

Hi Sai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.15-rc4]
[cannot apply to next-20250428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Sree-Kartheek-Adivi/dt-bindings-dma-ti-Add-document-for-K3-BCDMA-V2/20250428-152616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250428072032.946008-6-s-adivi%40ti.com
patch subject: [PATCH 5/8] drivers: soc: ti: k3-ringacc: handle absence of tisci
config: arm64-randconfig-001-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290207.ct0tnV56-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290207.ct0tnV56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290207.ct0tnV56-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/ti/k3-ringacc.c:214: warning: Function parameter or struct member 'cfg' not described in 'k3_ring'
>> drivers/soc/ti/k3-ringacc.c:214: warning: Function parameter or struct member 'intr' not described in 'k3_ring'


vim +214 drivers/soc/ti/k3-ringacc.c

6b3da0b475b877 Peter Ujfalusi          2020-07-24  168  
3277e8aa2504d9 Grygorii Strashko       2020-01-15  169  /**
3277e8aa2504d9 Grygorii Strashko       2020-01-15  170   * struct k3_ring - RA Ring descriptor
3277e8aa2504d9 Grygorii Strashko       2020-01-15  171   *
3277e8aa2504d9 Grygorii Strashko       2020-01-15  172   * @rt: Ring control/status registers
3277e8aa2504d9 Grygorii Strashko       2020-01-15  173   * @fifos: Ring queues registers
3277e8aa2504d9 Grygorii Strashko       2020-01-15  174   * @proxy: Ring Proxy Datapath registers
3277e8aa2504d9 Grygorii Strashko       2020-01-15  175   * @ring_mem_dma: Ring buffer dma address
3277e8aa2504d9 Grygorii Strashko       2020-01-15  176   * @ring_mem_virt: Ring buffer virt address
3277e8aa2504d9 Grygorii Strashko       2020-01-15  177   * @ops: Ring operations
3277e8aa2504d9 Grygorii Strashko       2020-01-15  178   * @size: Ring size in elements
3277e8aa2504d9 Grygorii Strashko       2020-01-15  179   * @elm_size: Size of the ring element
3277e8aa2504d9 Grygorii Strashko       2020-01-15  180   * @mode: Ring mode
3277e8aa2504d9 Grygorii Strashko       2020-01-15  181   * @flags: flags
50883affe17e11 Lee Jones               2020-11-21  182   * @state: Ring state
3277e8aa2504d9 Grygorii Strashko       2020-01-15  183   * @ring_id: Ring Id
3277e8aa2504d9 Grygorii Strashko       2020-01-15  184   * @parent: Pointer on struct @k3_ringacc
3277e8aa2504d9 Grygorii Strashko       2020-01-15  185   * @use_count: Use count for shared rings
3277e8aa2504d9 Grygorii Strashko       2020-01-15  186   * @proxy_id: RA Ring Proxy Id (only if @K3_RINGACC_RING_USE_PROXY)
8c42379e40e2db Peter Ujfalusi          2020-10-25  187   * @dma_dev: device to be used for DMA API (allocation, mapping)
d782298c6f6b85 Grygorii Strashko       2020-12-08  188   * @asel: Address Space Select value for physical addresses
3277e8aa2504d9 Grygorii Strashko       2020-01-15  189   */
3277e8aa2504d9 Grygorii Strashko       2020-01-15  190  struct k3_ring {
3277e8aa2504d9 Grygorii Strashko       2020-01-15  191  	struct k3_ring_rt_regs __iomem *rt;
babdc2c3524293 Sai Sree Kartheek Adivi 2025-04-28  192  	struct k3_ring_cfg_regs __iomem *cfg;
babdc2c3524293 Sai Sree Kartheek Adivi 2025-04-28  193  	struct k3_ring_intr_regs __iomem *intr;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  194  	struct k3_ring_fifo_regs __iomem *fifos;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  195  	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  196  	dma_addr_t	ring_mem_dma;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  197  	void		*ring_mem_virt;
d9483b44c94eba Christophe JAILLET      2024-07-09  198  	const struct k3_ring_ops *ops;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  199  	u32		size;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  200  	enum k3_ring_size elm_size;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  201  	enum k3_ring_mode mode;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  202  	u32		flags;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  203  #define K3_RING_FLAG_BUSY	BIT(1)
3277e8aa2504d9 Grygorii Strashko       2020-01-15  204  #define K3_RING_FLAG_SHARED	BIT(2)
d782298c6f6b85 Grygorii Strashko       2020-12-08  205  #define K3_RING_FLAG_REVERSE	BIT(3)
6b3da0b475b877 Peter Ujfalusi          2020-07-24  206  	struct k3_ring_state state;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  207  	u32		ring_id;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  208  	struct k3_ringacc	*parent;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  209  	u32		use_count;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  210  	int		proxy_id;
8c42379e40e2db Peter Ujfalusi          2020-10-25  211  	struct device	*dma_dev;
d782298c6f6b85 Grygorii Strashko       2020-12-08  212  	u32		asel;
d782298c6f6b85 Grygorii Strashko       2020-12-08  213  #define K3_ADDRESS_ASEL_SHIFT	48
3277e8aa2504d9 Grygorii Strashko       2020-01-15 @214  };
3277e8aa2504d9 Grygorii Strashko       2020-01-15  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

