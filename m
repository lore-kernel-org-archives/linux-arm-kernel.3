Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D01C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 19:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLfsZXX5/E+IfEtyY4p83itvgdWnsgPZnXzLGjQa8G4=; b=Zh2vdBKFSwuUOj+oQlOzRDHQX+
	CSSmyrN+ODPLlPRUmirA52R1/GFnsSAwUmnO0LWlqtF+YDw1Jq48toLll12PnN/o7jxr4Lyfv2iDz
	Ogl262ez0CS5L91YZN8Vh/x+zVOzP/8KeGDKFybDAsUFfbYI5iVZo6ThR0mNQZEnSuuFV54hgxCfg
	NPe79rd+/k3ElZo50ShBPPKDL080ySEVRlKJOsBxEGk8/bEeig2/+C3TGnV8xmeJlg8PcDR9Q8U/N
	oUE93/RFBeBxzspLjXlilBqshz62Xl7v4Od4nOdIZE0x9sVcq6FOpoQsqKlyBgvnacCmsj/9d7GP6
	f8iorFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQVA-00000008gTc-0eXZ;
	Fri, 07 Aug 2026 19:45:08 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQV7-00000008gT5-3R3d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 19:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786131906; x=1817667906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+w0PGlKmPEFGqlIuidQ1lzrH3L8TG2Zmd2apHS/JsGU=;
  b=V1mY5b/Zdk6w+hhh0m4Wm7UiJOagCp8FFKZrEb1hb9kqQIysIZlCI4hB
   pPXA4hvhzEauPPvfvHO3U4rzLE8tqYSEkiL8Puqbqx6n7iy6bClgfjboB
   u6CleoWtM1UfZVTjaeV9337ccIUOWBC0tp5zd5lvLNt8sXkjaUtk2/cNX
   yiCj+plB+MrMVKwjsfU5+JMBH4v6GUrEurwPrQNj74QsohlpzOQ3dkMei
   k68TPJ+DDlutfNoaRY/0MDv8MVci4C9l0YqZ4OUm18Fq4vqTH4cevALOk
   OLDJ/N8HzVbL0zYSv+e7UTV1DKHLixi5LD/mYLOOzOOJyW34Hfv40Lf8C
   g==;
X-CSE-ConnectionGUID: FiHgAd5VTROFVQfZPi+xHQ==
X-CSE-MsgGUID: Af1OvOK/SguEcg+v52Dxfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90626939"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90626939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 12:45:05 -0700
X-CSE-ConnectionGUID: UtqLO1MXSF+yKYI1YUiWUw==
X-CSE-MsgGUID: tNN/1NNcRt+7n7Hn0VoAuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="258619825"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 12:45:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsQV1-00000000J45-1cVi;
	Fri, 07 Aug 2026 19:44:59 +0000
Date: Sat, 8 Aug 2026 03:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-sunxi@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mailbox: sun6i: modernize probe and convert to fully
 managed
Message-ID: <202608080303.ryiYJhRA-lkp@intel.com>
References: <20260727194208.10082-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727194208.10082-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_124505_952885_09AE5E3C 
X-CRM114-Status: GOOD (  16.25  )
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

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on linus/master v7.2-rc6 next-20260806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/mailbox-sun6i-modernize-probe-and-convert-to-fully-managed/20260807-054041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20260727194208.10082-1-rosenp%40gmail.com
patch subject: [PATCH] mailbox: sun6i: modernize probe and convert to fully managed
config: arm64-randconfig-001-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080303.ryiYJhRA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080303.ryiYJhRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080303.ryiYJhRA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/sun6i-msgbox.c:271:56: error: too few arguments to function call, expected 2, have 1
     271 |         return devm_mbox_controller_register(&mbox->controller);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/mailbox_controller.h:149:5: note: 'devm_mbox_controller_register' declared here
     149 | int devm_mbox_controller_register(struct device *dev,
         |     ^                             ~~~~~~~~~~~~~~~~~~~
     150 |                                   struct mbox_controller *mbox);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +271 drivers/mailbox/sun6i-msgbox.c

   194	
   195	static int sun6i_msgbox_probe(struct platform_device *pdev)
   196	{
   197		struct device *dev = &pdev->dev;
   198		struct mbox_chan *chans;
   199		struct reset_control *reset;
   200		struct sun6i_msgbox *mbox;
   201		void __iomem *regs;
   202		int i, ret;
   203		int irq;
   204	
   205		irq = platform_get_irq(pdev, 0);
   206		if (irq < 0)
   207			return irq;
   208	
   209		regs = devm_platform_ioremap_resource(pdev, 0);
   210		if (IS_ERR(regs))
   211			return PTR_ERR(regs);
   212	
   213		mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
   214		if (!mbox)
   215			return -ENOMEM;
   216	
   217		chans = devm_kcalloc(dev, NUM_CHANS, sizeof(*chans), GFP_KERNEL);
   218		if (!chans)
   219			return -ENOMEM;
   220	
   221		for (i = 0; i < NUM_CHANS; ++i)
   222			chans[i].con_priv = mbox;
   223	
   224		mbox->clk = devm_clk_get_enabled(dev, NULL);
   225		if (IS_ERR(mbox->clk)) {
   226			ret = PTR_ERR(mbox->clk);
   227			dev_err(dev, "Failed to get clock: %d\n", ret);
   228			return ret;
   229		}
   230	
   231		reset = devm_reset_control_get_exclusive(dev, NULL);
   232		if (IS_ERR(reset)) {
   233			ret = PTR_ERR(reset);
   234			dev_err(dev, "Failed to get reset control: %d\n", ret);
   235			return ret;
   236		}
   237	
   238		/*
   239		 * NOTE: We rely on platform firmware to preconfigure the channel
   240		 * directions, and we share this hardware block with other firmware
   241		 * that runs concurrently with Linux (e.g. a trusted monitor).
   242		 *
   243		 * Therefore, we do *not* assert the reset line if probing fails or
   244		 * when removing the device.
   245		 */
   246		ret = reset_control_deassert(reset);
   247		if (ret) {
   248			dev_err(dev, "Failed to deassert reset: %d\n", ret);
   249			return ret;
   250		}
   251	
   252		mbox->regs = regs;
   253	
   254		/* Disable all IRQs for this end of the msgbox. */
   255		writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
   256	
   257		ret = devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(dev), mbox);
   258		if (ret)
   259			return ret;
   260	
   261		mbox->controller.dev           = dev;
   262		mbox->controller.ops           = &sun6i_msgbox_chan_ops;
   263		mbox->controller.chans         = chans;
   264		mbox->controller.num_chans     = NUM_CHANS;
   265		mbox->controller.txdone_irq    = false;
   266		mbox->controller.txdone_poll   = true;
   267		mbox->controller.txpoll_period = 5;
   268	
   269		spin_lock_init(&mbox->lock);
   270	
 > 271		return devm_mbox_controller_register(&mbox->controller);
   272	}
   273	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

