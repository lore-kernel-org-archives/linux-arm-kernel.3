Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A529C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwxCrhIsI/dM9NiZgFkhB47Rw/3Jn9Pik3VTYeanWC0=; b=MjjT9mx25BXufdjWX/QX0AuECs
	cSBSDdvAV/rXej5LGcKAHacNH7OB94xf9l6QmRJtgsne8Md4wsh52ODNA45m++3fuOU1/BPoA883A
	z6i+BthXJ4HT3dVD6DDHFUJO++icOlhrmBUWSaZb1E7AmA37WNd1LBIsk5jNQsi5TpjL+ItGZQsHT
	t22t5fLeUEWYqn+MKTpwxt3HY+QFO+rdt7f+9IoEqvBRp7qHXv9jyyneo84meaZN2WkyihY5MOP0N
	vKngLB+HOatDOrORAUffoPAS9hC9pAg8yDwPvJU5NM12+X+8B8AaH33thMzzKSUUDX18Y0t7AOaGv
	OSOYKfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lFG-00000003okA-3mJR;
	Sat, 05 Sep 2026 07:55:26 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lFE-00000003ojk-1B3Q;
	Sat, 05 Sep 2026 07:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788594925; x=1820130925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nVoM4RkYZfBPC9WAJEVNQ4+CpJomELlbuzuYSgYBRRs=;
  b=StvZvLTq3AJFIQo324s/7ZzNqKjD9EP9bpSuiCY2VXlaadRmnmn038J7
   6dqkVO8TmFK7K4Gjnh8A2aM+iLRvPTyhHa3kVoCVDvvze4U9Ov+QzHFxS
   uifyrqSWiwVMZnQ4fPERGwElKBfbH6h5DHbVcoonlDDUuQusHz8I2CZ0l
   QhrBZ2nXqgG7Xt5JDSVDQ/Kbj2OHsH1FoH8FzQrzeZCeL9/JzeKkReLRa
   qQiNet6cmMlN4GIG1M7E6m3vPTgTenXwywNNX/uNRyGkx76x9jxBvqI5C
   f/h0yr8/cSBG/pe2/GsEZQf2Oag0kfSA8ZXABtilJAH8a2jRoxgSg5sWI
   A==;
X-CSE-ConnectionGUID: 88vgIIymSBCP+nC0EX8efA==
X-CSE-MsgGUID: jF8QxbZTTWuyL7HvBGnQcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88933096"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="88933096"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 00:55:23 -0700
X-CSE-ConnectionGUID: EEhu5k1rQMWULfktoCCXzQ==
X-CSE-MsgGUID: lwmOrv2pTjCcruQ2CcFOzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="267010278"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 00:55:14 -0700
Date: Sat, 5 Sep 2026 10:55:12 +0300
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
Subject: Re: [PATCH v3 2/4] dmaengine: use dma_chan_name() helper to get
 per-channel device name
Message-ID: <apvK39-BqTHo_CZF@ashevche-desk.local>
References: <20260904-dma-chan_dev-rename-v3-0-685601b0b788@nxp.com>
 <20260904-dma-chan_dev-rename-v3-2-685601b0b788@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-dma-chan_dev-rename-v3-2-685601b0b788@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_005524_385518_7A774F27 
X-CRM114-Status: GOOD (  12.16  )
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

On Fri, Sep 04, 2026 at 05:49:44PM -0400, Frank.Li@oss.nxp.com wrote:

> Use the existing dma_chan_name() helper to obtain the per-channel device
> name instead of open-coding: dev_name(chan->dev->device) /
> dev_name(chan2dev())
> 
> Simplify the code and improve consistency.
> 
> No functional change intended.

...

> @@ -507,7 +507,7 @@ static int idma64_alloc_chan_resources(struct dma_chan *chan)
>  	struct idma64_chan *idma64c = to_idma64_chan(chan);
>  
>  	/* Create a pool of consistent memory blocks for hardware descriptors */
> -	idma64c->pool = dma_pool_create(dev_name(chan2dev(chan)),
> +	idma64c->pool = dma_pool_create(dma_chan_name(chan),
>  					chan->device->dev,
>  					sizeof(struct idma64_lli), 8, 0);

For example here it may now be condensed to less LoC:

	idma64c->pool = dma_pool_create(dma_chan_name(chan), chan->device->dev,
					sizeof(struct idma64_lli), 8, 0);

Consider that in case you will need a new version (no need
to address it separately).

-- 
With Best Regards,
Andy Shevchenko



