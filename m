Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026E4C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlFlVN5wdgjaXk24EiHBdPa2kCEhMJgQr+tWiyziEYY=; b=U9Ux3dBPtPn7T/O0n2wpn20jCc
	lkpt1QCFdCRSyv9/IArWtSI5keDxpc7l7DwD4AO09XlMsbktSS7m3R9aXAgp6PdWPa/rGyuNSxPEf
	8hNWLxqZUFKm01lalw8ZrUXL1nAx5ONZtCwJGHQDRLRwAvwykZtW0koCkHVKJV4DD/YZoonyOfE7n
	Urpt/HFE6VjYWGDWSKPBPDhbs+AuPGr/Mc3ORZdphQ1LjbS8PEYwtUfULmdD4AM4ueaLIAo9tKBpo
	QKE+QVHQAZ8SDq80brFaACROTWOOvZ2ZrpuK1RDlp5sZVuphYvsSnxTHSSclf8QJcAZl5dWQ19WjP
	Y0vhM66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lJW-00000003ouO-1PNa;
	Sat, 05 Sep 2026 07:59:50 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lJT-00000003otz-33zy;
	Sat, 05 Sep 2026 07:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788595188; x=1820131188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pbA6rvFYYarR8MxJYGq5cw/7vkB61rDNf7lyNAo93QA=;
  b=HvF/ijJPqpFcekliQhf1u1DxPS90moxDJ7Q/jC0MeA2eNJPGbOhrHAki
   VASy7EVz3hru/SzEOweg0tlySFjdzZ2q1huexbBptYvKnq7vjGFlVsqI4
   BnypEYhmuadIviOdChNPaTkewh0YT61BxB/xxecCMt7mzLYuxH7ekIcU/
   Dl3UsZSY0ICgdR845s3PznC+abClrpOYW6eMZImyxDt5eU/SUbp8Jsz27
   hx1A8WZakwSvrw3BflMGArUBkjChbG5TeXE9IVUgiXzDt7lhvqVm6W5p5
   57t2GoEzYvmAeGIWy2ibFZUNWm/t+0kePveHBNNo3iOlGUY5M6XKHFALp
   w==;
X-CSE-ConnectionGUID: w7kpy63aRx62fet3Jx2K7Q==
X-CSE-MsgGUID: 2jCrFy3dQqyxqOHC2LgLmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99682101"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="99682101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 00:59:47 -0700
X-CSE-ConnectionGUID: Xf5I0G4OTMOcp1QBaOOGYQ==
X-CSE-MsgGUID: ynFtavY4QxibRVi+CHkcdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="295125461"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 00:59:38 -0700
Date: Sat, 5 Sep 2026 10:59:35 +0300
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
Subject: Re: [PATCH v3 4/4] dmaengine: add union chan_dev for dma_chan::dev
 for clarity
Message-ID: <apvL5yXKGHrEyp9Z@ashevche-desk.local>
References: <20260904-dma-chan_dev-rename-v3-0-685601b0b788@nxp.com>
 <20260904-dma-chan_dev-rename-v3-4-685601b0b788@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-dma-chan_dev-rename-v3-4-685601b0b788@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_005947_784008_CD4AD2DD 
X-CRM114-Status: GOOD (  18.38  )
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

On Fri, Sep 04, 2026 at 05:49:46PM -0400, Frank.Li@oss.nxp.com wrote:

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

I was almost ready to give a tag for the entire series, but found a minor
issue here...

...

> +++ b/include/linux/dmaengine.h
> struct dma_router {

>   * @lock: protect between config and prepare transfer when driver have not
>   *	  implemented callback device_prep_config_sg().
>   * @chan_id: channel ID for sysfs
> - * @dev: class device for sysfs
> + * @chan_dev: class channel device for sysfs, some device use it for per-channel
> + *            iommu mapping.

IOMMU

>   * @name: backlink name for sysfs
>   * @dbg_client_name: slave name for debugfs in format:
>   *	dev_name(requester's dev):channel name, for example: "2b00000.mcasp:tx"

> struct dma_chan {

>  
>  	/* sysfs */
>  	int chan_id;
> -	struct dma_chan_dev *dev;
> +	union {
> +		struct dma_chan_dev *chan_dev;
> +		/*
> +		 * please use chan_dev, dev will be removed after all user
> +		   switch to chan_dev
> +		*/

Something went wrong with this comment style. It also need to respect English
grammar and punctuation as we do for multi-line comments.

> +		struct dma_chan_dev *dev;
> +	};
>  	const char *name;
>  #ifdef CONFIG_DEBUG_FS
>  	char *dbg_client_name;

-- 
With Best Regards,
Andy Shevchenko



