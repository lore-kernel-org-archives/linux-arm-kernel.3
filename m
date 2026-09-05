Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED444C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrNNNpmENkLSLFoWAcP4vCzqdAZoU3BbwVHBFJ9AweM=; b=ugIdkp2wlDnXsr5VkPBMQQM8ic
	lBThovgz0Z+tkwx7d7I9CIivxFB3R01VUSwutb6xXS3JWes9M+GFuxpwiVBUdkMzJZVI+VZPRwrPH
	NAyt4yqQmP+8dTH+tqnrJbMMaKEaLW5qzkMAxamhQ/uVnawXupN9ddMdd72BqUh/FdsVa4cgq0BlP
	09F6YNNFxpQX+WxJd2pXpseDnvVmtV1ZC3oiVYDuojtAnRfIL0oteWekrzGS2z5rGGfIjiKeRrix/
	EbIzvhpN7RfhEMAtbEAFZwCluHUqmrgZl61DUtrPC2psEiudjS6f9CFbr4oPthG5wh3MC1FTo50mA
	hJKi1y/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lKZ-00000003p8P-45ZQ;
	Sat, 05 Sep 2026 08:00:55 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lKX-00000003p7O-1F5P;
	Sat, 05 Sep 2026 08:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788595253; x=1820131253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DZFfBMrRtiY/73SGDh0XULVSppgU/RJ7ThjUIl3cq4s=;
  b=Om3qZEmHtBMxTj8aSZntr5knFq6x4V/3MV3cePZY87dgfbqi7cnnOGlb
   2EumNmW53gO2tVcLKo3Oiaux+UX8cK76/CQ5pFmkB9TZNjaM8PuF9HnCn
   WgNL3qqvLBw/xKAVa8+2HTmCj7gpWVWSyVz2PEChWw3xtlj37R9yor4zQ
   qb14U0l/ijuv7YKpDC8F7nqo+0mlQctVcgKY+R0PfGWlGCeJlkRxKrrHr
   Iz5HeMGu17kbbKz6cm46RWTcf7wrIcZ/Wh9xY395kdUyTCdNFZEzNVcVN
   sNCJ3y+4taMHVJWUfIBmpvYmVUorrkSH95qvuH/0iJ1ZfJ9g/hsi4nC0z
   A==;
X-CSE-ConnectionGUID: 5a11WN/JTjGh2WetNkKPtw==
X-CSE-MsgGUID: cR4/mBwqRHSZOXi5xfveIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89119579"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89119579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:00:52 -0700
X-CSE-ConnectionGUID: 9JbBadgHQ7SEjpVvHYYgmw==
X-CSE-MsgGUID: bwhdz7ZKSjWLvCde1OANJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="270230591"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:00:43 -0700
Date: Sat, 5 Sep 2026 11:00:41 +0300
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
Subject: Re: [PATCH v3 0/4] dmaengine: rename dma_chan::dev to
 dma_chan::chan_dev for clarity
Message-ID: <apvMKWQhTn5Kf8Sq@ashevche-desk.local>
References: <20260904-dma-chan_dev-rename-v3-0-685601b0b788@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-dma-chan_dev-rename-v3-0-685601b0b788@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_010053_380280_6F67CF3D 
X-CRM114-Status: GOOD (  15.86  )
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

On Fri, Sep 04, 2026 at 05:49:42PM -0400, Frank.Li@oss.nxp.com wrote:
> The current dma_chan structure contains both "device" and "dev". So
> 
>     chan->device->dev refers to the DMA engine device.
>     chan->dev->device refers to the per-channel device instance.
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
> 1st patch add help vchan_chan_name()
> 2nd patch use existing helper dma_chan_name() to reduce rename difference.
> 3rd patch add (dmaengine|vchan)_chan_dev() helper
> 4th patch add union chan_dev for dma_chan::dev for clarity
> 
> Need following patch to clean other dma engineer driver, which is not
> in drivers/dma
> 
> After complete all rename work, dma_chan::dev can be removed.

Nice work!
I have one comment against patch 4/4, after addressing that feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
to the entire series.

-- 
With Best Regards,
Andy Shevchenko



