Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F059C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGCT5eRYjmFviKIY/lV6E5VTvm4jFqZV5t+tNlA13zw=; b=D+UlSXeqHTYKUajcRT1FygMZnp
	t3pS0m3P9Ese/9ecKcXVb11uNshtNyH82IPK1i3CfzdaumSrEyevn5AFP92xE76YJpF+c988hyqUe
	ZBhQwfAxhK3dx40zIYawBXFdC57aaVU4rt98PHHBzc+g+Y1iLV5NuubWWbpTxsO8Bv91a+p+KiBvx
	YuOkF4ZCm/IkJXmtllFyN2i8smWzDde6UiolnhNASn2AztBwxT6mQLWcYqbroKcLckBjaeqvLiXl0
	D/h19X6lgIILT8pqTTZQ3OLOnIApGIwzmYGboMQlfEXmHAv6ylZK4LELbGy9xfdWyftt/C2XFZQd8
	SyBrANjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2X6-00000005W7N-3F0F;
	Tue, 24 Jun 2025 12:13:48 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1kE-00000005QQR-0AX8;
	Tue, 24 Jun 2025 11:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750764198; x=1782300198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jiKUfZqjG7qOZGQfCaAa2+Vnx3BVrYF0VLfPGeJuxmY=;
  b=NLHE207e76koI8+eT2LvCyWwLLpe1qGE7uiRlohVZvF5ZQoG34CgxIl5
   GfZWAmKTbx6wMBIQeXnhC/6PcaebnPF4NX7wrfKVrGDycfIos9NSibZhw
   UYwR/Eh0MYXArq5a/TZYhmt1DbXAqvzcIrdEVUbAHcbXQjaFYTalRtMHa
   k5B8yXMtTS6HQVZTjbdSENwpfNJ1LX3H1z0MUl4wYVHEUvBcfRAFHnfPi
   HfiYEEwRabu5N0hssVIOWWn8/wzB4TNsX8HOHuMTaDD7l7fTkfD6k/4JW
   9Sjfvee+7pGvOfdvCpx9ixWDV4BhU8ExXjoOOyMDm7+5Fu7FQARJx8fwX
   A==;
X-CSE-ConnectionGUID: tQTYp8UoS62Jk7wvgARTnw==
X-CSE-MsgGUID: IhqzKCghSluNcu6OOGXApg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52721279"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52721279"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:23:12 -0700
X-CSE-ConnectionGUID: kxUeEGS9Qhe2/bO/DnAVLw==
X-CSE-MsgGUID: 3f3kdLdqTwuaN2cQTp+PAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151373519"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jun 2025 04:23:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU1k2-000S3W-2D;
	Tue, 24 Jun 2025 11:23:06 +0000
Date: Tue, 24 Jun 2025 19:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jassisinghbrar@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/2] mailbox: Add MediaTek TinySYS MHU-like Mailbox
Message-ID: <202506241946.HEKwafHB-lkp@intel.com>
References: <20250623120127.109237-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120127.109237-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_042318_123136_34E02082 
X-CRM114-Status: GOOD (  18.30  )
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

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on robh/for-next soc/for-next linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-mailbox-Add-MediaTek-TinySYS-MHU-mailbox/20250623-201139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20250623120127.109237-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 2/2] mailbox: Add MediaTek TinySYS MHU-like Mailbox
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506241946.HEKwafHB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241946.HEKwafHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241946.HEKwafHB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/mtk-tinysys-mailbox.c: In function 'mtk_tinysys_mhu_mbox_startup':
>> drivers/mailbox/mtk-tinysys-mailbox.c:95:9: error: implicit declaration of function 'irq_clear_status_flags' [-Werror=implicit-function-declaration]
      95 |         irq_clear_status_flags(priv->irq, IRQ_NOAUTOEN);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/mtk-tinysys-mailbox.c:95:43: error: 'IRQ_NOAUTOEN' undeclared (first use in this function); did you mean 'IRQF_NO_AUTOEN'?
      95 |         irq_clear_status_flags(priv->irq, IRQ_NOAUTOEN);
         |                                           ^~~~~~~~~~~~
         |                                           IRQF_NO_AUTOEN
   drivers/mailbox/mtk-tinysys-mailbox.c:95:43: note: each undeclared identifier is reported only once for each function it appears in
   drivers/mailbox/mtk-tinysys-mailbox.c: In function 'mtk_tinysys_mhu_mbox_probe':
>> drivers/mailbox/mtk-tinysys-mailbox.c:152:9: error: implicit declaration of function 'irq_set_status_flags' [-Werror=implicit-function-declaration]
     152 |         irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/mtk-tinysys-mailbox.c:152:41: error: 'IRQ_NOAUTOEN' undeclared (first use in this function); did you mean 'IRQF_NO_AUTOEN'?
     152 |         irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
         |                                         ^~~~~~~~~~~~
         |                                         IRQF_NO_AUTOEN
   cc1: some warnings being treated as errors


vim +/irq_clear_status_flags +95 drivers/mailbox/mtk-tinysys-mailbox.c

    90	
    91	static int mtk_tinysys_mhu_mbox_startup(struct mbox_chan *chan)
    92	{
    93		struct mtk_tinysys_mhu_mbox *priv = to_mtk_tinysys_mhu_mbox(chan->mbox);
    94	
  > 95		irq_clear_status_flags(priv->irq, IRQ_NOAUTOEN);
    96		enable_irq(priv->irq);
    97	
    98		return 0;
    99	}
   100	
   101	static void mtk_tinysys_mhu_mbox_shutdown(struct mbox_chan *chan)
   102	{
   103		struct mtk_tinysys_mhu_mbox *priv = to_mtk_tinysys_mhu_mbox(chan->mbox);
   104	
   105		disable_irq(priv->irq);
   106	}
   107	
   108	static const struct mbox_chan_ops tinysys_mbox_chan_ops = {
   109		.send_data = mtk_tinysys_mhu_mbox_send_data,
   110		.startup = mtk_tinysys_mhu_mbox_startup,
   111		.shutdown = mtk_tinysys_mhu_mbox_shutdown,
   112		.last_tx_done = mtk_tinysys_mhu_mbox_last_tx_done,
   113	};
   114	
   115	static int mtk_tinysys_mhu_mbox_probe(struct platform_device *pdev)
   116	{
   117		struct device *dev = &pdev->dev;
   118		struct mtk_tinysys_mhu_mbox *priv;
   119		struct mbox_controller *mbox;
   120		int ret;
   121	
   122		/* Allocate memory for device */
   123		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   124		if (!priv)
   125			return -ENOMEM;
   126	
   127		priv->base = devm_platform_ioremap_resource(pdev, 0);
   128		if (IS_ERR(priv->base))
   129			return PTR_ERR(priv->base);
   130	
   131		priv->irq = platform_get_irq(pdev, 0);
   132		if (priv->irq < 0)
   133			return priv->irq;
   134	
   135		priv->pdata = device_get_match_data(dev);
   136		if (!priv->pdata)
   137			return -EINVAL;
   138	
   139		mbox = &priv->mbox;
   140		mbox->dev = dev;
   141		mbox->ops = &tinysys_mbox_chan_ops;
   142		mbox->txdone_irq = false;
   143		mbox->txdone_poll = true;
   144		mbox->txpoll_period = 1;
   145		mbox->num_chans = 1;
   146		mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNEL);
   147		if (!mbox->chans)
   148			return -ENOMEM;
   149	
   150		platform_set_drvdata(pdev, priv);
   151	
 > 152		irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
   153		ret = devm_request_irq(dev, priv->irq, mtk_tinysys_mhu_mbox_irq,
   154				       IRQF_TRIGGER_NONE, dev_name(dev), mbox->chans);
   155		if (ret < 0)
   156			return ret;
   157	
   158		ret = devm_mbox_controller_register(dev, &priv->mbox);
   159		if (ret)
   160			return dev_err_probe(dev, ret, "Failed to register mailbox\n");
   161	
   162		return 0;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

