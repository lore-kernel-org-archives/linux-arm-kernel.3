Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED78C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLw6u/9KG8AMEQ7cc8ebwokFW1DKb1XeOFanxU4bNi4=; b=g6hzbeEqwCJ9xjbG8OINSdlhP4
	hsJsmUonPY4f3qm8gjB5zWkll7WaG0TxDkXlYQ83/mhy11t0Lcm2far49ec2yho7kgWj+DyA2zAVX
	7M5uSJpBwxPIq/9ovQL20wQny1iLPBaDbwkZiVOqShuKU7l0oOKT+jKypMnLhbuyyy7eCznKyaekx
	U67AFqEjXDHg6OGpuP3HmfbAYFzZDh/2JOd32U0Rn77GdY5gl1IUulb9G7jOLfc8XjJqyn+wYHezw
	7fcAueAAPP7SyerBJZ86rUhfhty5fnB5UKwCh/ge9Q7fFbDC895+3yUU6d0jJddn9nJQRkKKg1w6a
	mb1i1I9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCajt-0000000Eqy5-1MMH;
	Wed, 07 May 2025 09:06:53 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZFt-0000000EXnG-3jR8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603109; x=1778139109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0cur8ilifh2WKjNlVxEGKdLdHBX8xWsGsKF2bcY55+U=;
  b=WIOfZVyEf6Xly06+y0yJzTh5rIhDOR2p7cfymfLeJjyfQa2bgFspmY36
   vepmMxNc9kwK5uRaxCK1k7EopU5SbQv6HB/43mMmH8FoGPK+UgXpj5qZy
   8LWZO9i5ZO7BXybNG338UWE7mBGVQKMroqSfAcM6wOkv06i6o3gBSYryV
   hy4dRZlFOqSwKuZiU8gmeVkYPU6NLxks5Rd4z9z6brZALMuhjhs60M1MF
   5DcTMYhjHNURzfiEsSRCVygMPy/rdtYPvVjmqGAYtll51qHw/kTxzf/V0
   Fuoresiap0s5E/FPHCYx1GtUL8qXMIfK1kSR9VwZGruq2T6PriXnf0p+H
   A==;
X-CSE-ConnectionGUID: 7apMHMzhRS6rKMmU+jCEXA==
X-CSE-MsgGUID: kPrbbykIT0+ci/y9Kg3Ymg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35944829"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35944829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:31:44 -0700
X-CSE-ConnectionGUID: RSlEYW6FRciUmNy6dTwI/Q==
X-CSE-MsgGUID: FDmAR+czTniIup4AsqAqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="173064110"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 00:31:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZFi-0007JR-10;
	Wed, 07 May 2025 07:31:38 +0000
Date: Wed, 7 May 2025 15:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, peter.ujfalusi@gmail.com,
	vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, a-chavda@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/8] dmaengine: ti: New driver for K3 BCDMA_V2
Message-ID: <202505071527.yZZNwWXf-lkp@intel.com>
References: <20250428072032.946008-7-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428072032.946008-7-s-adivi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_003149_943320_902B4FB6 
X-CRM114-Status: GOOD (  15.14  )
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
[also build test WARNING on linus/master v6.15-rc5]
[cannot apply to next-20250506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Sree-Kartheek-Adivi/dt-bindings-dma-ti-Add-document-for-K3-BCDMA-V2/20250428-152616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250428072032.946008-7-s-adivi%40ti.com
patch subject: [PATCH 6/8] dmaengine: ti: New driver for K3 BCDMA_V2
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071527.yZZNwWXf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071527.yZZNwWXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071527.yZZNwWXf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/ti/k3-udma-v2.c:147:14: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     147 |         int status, ret;
         |                     ^
>> drivers/dma/ti/k3-udma-v2.c:1042:6: warning: variable 'cap2' set but not used [-Wunused-but-set-variable]
    1042 |         u32 cap2, cap3;
         |             ^
>> drivers/dma/ti/k3-udma-v2.c:1042:12: warning: variable 'cap3' set but not used [-Wunused-but-set-variable]
    1042 |         u32 cap2, cap3;
         |                   ^
   3 warnings generated.


vim +/ret +147 drivers/dma/ti/k3-udma-v2.c

   142	
   143	static int udma_v2_start(struct udma_chan *uc)
   144	{
   145		struct virt_dma_desc *vd = vchan_next_desc(&uc->vc);
   146		struct udma_dev *ud = uc->ud;
 > 147		int status, ret;
   148	
   149		if (!vd) {
   150			uc->desc = NULL;
   151			return -ENOENT;
   152		}
   153	
   154		list_del(&vd->node);
   155	
   156		uc->desc = to_udma_desc(&vd->tx);
   157	
   158		/* Channel is already running and does not need reconfiguration */
   159		if (udma_is_chan_running(uc) && !udma_chan_needs_reconfiguration(uc)) {
   160			udma_start_desc(uc);
   161			goto out;
   162		}
   163	
   164		/* Make sure that we clear the teardown bit, if it is set */
   165		ud->udma_reset_chan(uc, false);
   166	
   167		/* Push descriptors before we start the channel */
   168		udma_start_desc(uc);
   169	
   170		switch (uc->desc->dir) {
   171		case DMA_DEV_TO_MEM:
   172			/* Config remote TR */
   173			if (uc->config.ep_type == PSIL_EP_PDMA_XY) {
   174				u32 val = PDMA_STATIC_TR_Y(uc->desc->static_tr.elcnt) |
   175					  PDMA_STATIC_TR_X(uc->desc->static_tr.elsize);
   176				const struct udma_match_data *match_data =
   177								uc->ud->match_data;
   178	
   179				if (uc->config.enable_acc32)
   180					val |= PDMA_STATIC_TR_XY_ACC32;
   181				if (uc->config.enable_burst)
   182					val |= PDMA_STATIC_TR_XY_BURST;
   183	
   184				udma_chanrt_write(uc,
   185						   UDMA_CHAN_RT_STATIC_TR_XY_REG,
   186						   val);
   187	
   188				udma_chanrt_write(uc,
   189					UDMA_CHAN_RT_STATIC_TR_Z_REG,
   190					PDMA_STATIC_TR_Z(uc->desc->static_tr.bstcnt,
   191							 match_data->statictr_z_mask));
   192	
   193				/* save the current staticTR configuration */
   194				memcpy(&uc->static_tr, &uc->desc->static_tr,
   195				       sizeof(uc->static_tr));
   196			}
   197	
   198			udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
   199					UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_AUTOPAIR);
   200	
   201			/* Poll for autopair completion */
   202			ret = read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
   203					status, status != 0, 100, 500, false, uc);
   204	
   205			if (status <= 0)
   206				return -ETIMEDOUT;
   207	
   208			break;
   209		case DMA_MEM_TO_DEV:
   210			/* Config remote TR */
   211			if (uc->config.ep_type == PSIL_EP_PDMA_XY) {
   212				u32 val = PDMA_STATIC_TR_Y(uc->desc->static_tr.elcnt) |
   213					  PDMA_STATIC_TR_X(uc->desc->static_tr.elsize);
   214	
   215				if (uc->config.enable_acc32)
   216					val |= PDMA_STATIC_TR_XY_ACC32;
   217				if (uc->config.enable_burst)
   218					val |= PDMA_STATIC_TR_XY_BURST;
   219	
   220				udma_chanrt_write(uc,
   221						   UDMA_CHAN_RT_STATIC_TR_XY_REG,
   222						   val);
   223	
   224				/* save the current staticTR configuration */
   225				memcpy(&uc->static_tr, &uc->desc->static_tr,
   226				       sizeof(uc->static_tr));
   227			}
   228	
   229			udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
   230					UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_AUTOPAIR);
   231	
   232			/* Poll for autopair completion */
   233			ret = read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
   234					status, status != 0, 100, 500, false, uc);
   235	
   236			if (status <= 0)
   237				return -ETIMEDOUT;
   238	
   239			break;
   240		case DMA_MEM_TO_MEM:
   241			udma_bchanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
   242					   UDMA_CHAN_RT_CTL_EN);
   243			udma_bchanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
   244					   UDMA_CHAN_RT_CTL_EN);
   245	
   246			break;
   247		default:
   248			return -EINVAL;
   249		}
   250	
   251		uc->state = UDMA_CHAN_IS_ACTIVE;
   252	out:
   253	
   254		return 0;
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

