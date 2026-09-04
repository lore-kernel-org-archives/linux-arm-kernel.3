Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647FAC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVM1Jn1rfgxhsZ1aM/Qe33d2huYeQJeQXjEZqCx+VAc=; b=co78rfr8lqexbBHqWCml2C8kof
	CcF+rbT3r6MrGw4dzt3qqak9QTrCglvIRX3q9HXQgXtqc2SF5sBCldnz3Lw04dWIqv9wOFqoGjIef
	LzeIqmcE7TQE5xDl/kz5JILpyRFB7bgmx2lhdewQmdnrruhJ06sHhyS9Nu8YihMwOfkHcYtrpBums
	Ut0G6/b0FxzJfWFZ1hcHmLYYvIhnZhkLqQTvXzepuOyoJ7X+R48bD0KkNH5rdXUKPvxjgv4avTGhc
	6lMXDonlneFq6XErC3d6ARmzRXNfwpNyiwa2Q0s02vjygZSqkrVhXN0EIAb/CwuRtaKK/OEVxW4t2
	u+kbWpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Q4x-00000001VPb-10bA;
	Fri, 04 Sep 2026 09:19:23 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Q4u-00000001VOC-3jGe;
	Fri, 04 Sep 2026 09:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788513561; x=1820049561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ciu3EUMUtyrEFe1yr//0MMiw5+oF+KjxR5BN8wbUdAE=;
  b=XM7/bWJ5rXX7uqjQN6Im++aS0O65I6viUyRrsczn26KzTD4iL0BIDJdE
   vanJwpev7VZp4bhRa1QSeaMSW7gBZ4e4+rIINNtLcoj5WChKePebo/DDw
   dT2gd+6UXIqhJxUaHVS/Z5J88368ri9Kh/HfC/6AYvURTHY+Vx7Pti7+r
   238j9Vh2kjXi0YDRPEz6/IP2WWMKWPNGgDFZq48q0sGR8f4tey9CWZDAc
   xGttwAw+EO6qlkfGNHPEHuArjAC6OSk159kLUnQ1X7suK1GghPPtGjJcB
   RD5phUa6tOFuW0GxDLjkEUYELazIJjJH1osKWygKfmjS2/XfbnGoDgHIJ
   A==;
X-CSE-ConnectionGUID: Rx7Usr9sTIyPdY1yceJVRg==
X-CSE-MsgGUID: OUrv3yntTIS0ry6FxsnnVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88859565"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88859565"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 02:19:19 -0700
X-CSE-ConnectionGUID: VxyZgL0WS8O2yrnlkTwwVw==
X-CSE-MsgGUID: gb9jsf5TTzWkjd20oz81HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="268676438"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.224])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 02:19:11 -0700
Date: Fri, 4 Sep 2026 12:19:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 3/3] dmaengine: add union chan_dev for dma_chan::dev
 for clarity
Message-ID: <apqNDHoNt09QYJe7@ashevche-desk.local>
References: <20260903-dma-chan_dev-rename-v2-0-0db305b6c716@nxp.com>
 <20260903-dma-chan_dev-rename-v2-3-0db305b6c716@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-dma-chan_dev-rename-v2-3-0db305b6c716@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_021920_992063_6D89F4AA 
X-CRM114-Status: GOOD (  18.71  )
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

On Thu, Sep 03, 2026 at 04:53:13PM -0400, Frank.Li@oss.nxp.com wrote:

> The current dma_chan structure contains both "device" and "dev". So
> 
> chan->device->dev refers to the DMA engine device.
> chan->dev->device refers to the per-channel device instance.
> 
> Their similar naming makes the distinction unclear and increases reader
> confusion.
> 
> Add union dma_chan::chan_dev to make its purpose explicit and clearly
> identify it as the per-channel device. After all user switch to chan_dev,
> union and dma_chan::dev will be removed.
> 
> Update the kernel-doc accordingly. Besides its sysfs usage, the per-channel
> device is also used by some DMA engine drivers for IOMMU mapping and
> therefore deserves a more accurate description.
> 
> No functional change intended.

...

>  static inline struct device *chan2dev(struct axi_dma_chan *chan)
>  {
> -	return &chan->vc.chan.dev->device;
> +	return &chan->vc.chan.chan_dev->device;
>  }

Looking at this and below I think we need a common helper(s)

>  static struct device *chan2dev(struct loongson2_cmc_dma_chan *lchan)
>  {
> -	return &lchan->vchan.chan.dev->device;
> +	return &lchan->vchan.chan.chan_dev->device;
>  }

>  	({								\
>  		u32 _v;							\
>  		_v = readl_relaxed((phy)->base + _reg((phy)->idx));	\
> -		dev_vdbg(&phy->vchan->vc.chan.dev->device,		\
> +		dev_vdbg(&phy->vchan->vc.chan.chan_dev->device,		\
>  			 "%s(): readl(%s): 0x%08x\n", __func__, #_reg,	\
>  			  _v);						\
>  		_v;							\

>  #define phy_writel(phy, val, _reg)					\
>  	do {								\
>  		writel((val), (phy)->base + _reg((phy)->idx));		\
> -		dev_vdbg(&phy->vchan->vc.chan.dev->device,		\
> +		dev_vdbg(&phy->vchan->vc.chan.chan_dev->device,		\
>  			 "%s(): writel(0x%08x, %s)\n",			\
>  			 __func__, (u32)(val), #_reg);			\
>  	} while (0)
>  #define phy_writel_relaxed(phy, val, _reg)				\
>  	do {								\
>  		writel_relaxed((val), (phy)->base + _reg((phy)->idx));	\
> -		dev_vdbg(&phy->vchan->vc.chan.dev->device,		\
> +		dev_vdbg(&phy->vchan->vc.chan.chan_dev->device,		\
>  			 "%s(): writel_relaxed(0x%08x, %s)\n",		\
>  			 __func__, (u32)(val), #_reg);			\
>  	} while (0)

>  out_unlock:
>  	spin_unlock_irqrestore(&pdev->phy_lock, flags);
> -	dev_dbg(&pchan->vc.chan.dev->device,
> +	dev_dbg(&pchan->vc.chan.chan_dev->device,
>  		"%s(): phy=%p(%d)\n", __func__, found,
>  		found ? found->idx : -1);
>  

> -	dev_dbg(&chan->vc.chan.dev->device,
> +	dev_dbg(&chan->vc.chan.chan_dev->device,
>  		"%s(): freeing\n", __func__);

> -	dev_dbg(&phy->vchan->vc.chan.dev->device,
> +	dev_dbg(&phy->vchan->vc.chan.chan_dev->device,
>  		"%s(); phy=%p(%d) misaligned=%d\n", __func__,
>  		phy, phy->idx, misaligned);

> -	dev_dbg(&phy->vchan->vc.chan.dev->device,
> +	dev_dbg(&phy->vchan->vc.chan.chan_dev->device,
>  		"%s(): phy=%p(%d)\n", __func__, phy, phy->idx);

> -	dev_dbg(&chan->vc.chan.dev->device,
> +	dev_dbg(&chan->vc.chan.chan_dev->device,
>  		"%s(): desc=%p\n", __func__, desc);
>  	if (!chan->phy) {
>  		chan->phy = lookup_phy(chan);
>  		if (!chan->phy) {
> -			dev_dbg(&chan->vc.chan.dev->device,
> +			dev_dbg(&chan->vc.chan.chan_dev->device,
>  				"%s(): no free dma channel\n", __func__);
>  			return;

(and so on in this PXA driver)

Besides that we should drop __func__ from all _dbg() messages, that can be
enabled run-time with help of Dynamic Debug.

So I think this driver requires more prerequisite work.

>  static struct device *chan2dev(struct stm32_dma_chan *chan)
>  {
> -	return &chan->vchan.chan.dev->device;
> +	return &chan->vchan.chan.chan_dev->device;
>  }

>  static struct device *chan2dev(struct stm32_dma3_chan *chan)
>  {
> -	return &chan->vchan.chan.dev->device;
> +	return &chan->vchan.chan.chan_dev->device;
>  }

>  static struct device *chan2dev(struct stm32_mdma_chan *chan)
>  {
> -	return &chan->vchan.chan.dev->device;
> +	return &chan->vchan.chan.chan_dev->device;
>  }

...

Something like

vchan_to_device(vchan)
{
	return &vchan->chan.chan_dev->device;
}



-- 
With Best Regards,
Andy Shevchenko



