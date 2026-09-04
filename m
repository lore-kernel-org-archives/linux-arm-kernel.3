Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F0C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CRakxbCCPhcLhlWXRaYkkxMdtZySZI3KxwZkzMAZeo=; b=FwITdZ7VUhWXAKwz26RZgfNb3R
	iO+tQvLAg9MfH8OCH1DxXmV6kxiuZZeEpEWL9rkmgCtCCOsDWT2TQYTk6Qf6Bdw8XYl8IPQcVwErJ
	gCiJ/mJWWv2L4RgqTYJ4uX6MzygFMqXfTmFJ3G0os+LbMZWRvidxRfFZZUU1SqMCu59xc6z39aehw
	CbU/VDFkyXtsK32mg3COM3oozsoRkB0K8F1AbjTRPQgr0uQ3yFm2G8I9lcglBHS25o8WwgwqDiHc5
	cLQ1VICbNx1Kc6Y68H+4UGoM4K57Spz6nqxQvEP3kiiXT4+IknYV83YgKGD4qT+Ru4VRrmeePSAqP
	+qM2/N3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PuS-00000001UC9-2au2;
	Fri, 04 Sep 2026 09:08:32 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PuQ-00000001UBg-2sDH;
	Fri, 04 Sep 2026 09:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788512911; x=1820048911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RTOkuJscrpPJjVNNjxoNkn5V5c05RKVFnU/ZyQKRXhU=;
  b=dr4iivw2GDOourEFlXm7MdytEhGHOqnIHBJ/RN4TqzPTLyfd6b38HHWF
   w4EMXWz5NA3eOj9WkYfYzw0F+oG9UzCeBz+VcawanNpxReaOXN5sM6f9z
   I+5YqZuuYY/tuhaTeLC81+e0bH7dl5xEcKw6HGO9z8lkN8+blIQIORfqU
   wXoEEvTTCJUkuzhdh+OVLvXb4pLf8B5y7DlIVJk15UeZQ5d5sKpzRdqio
   YNEbPvnZd9rBOYivXpzjaKUF/154YasSDZ8egZ2pkUzTGxsDnKc/GFsUS
   wW4PNLU3FfmVF4QtyHeQDCTA9qDmIPlQt46yNd8fyP4/n7RmYCMIlaHTy
   w==;
X-CSE-ConnectionGUID: ccUoF79NR+qGMKnA7+Hokg==
X-CSE-MsgGUID: Z+wSg6dkT/GAAEOpFlSopg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99669241"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99669241"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 02:08:29 -0700
X-CSE-ConnectionGUID: EXOLF6UfRfSAQklaHXyikw==
X-CSE-MsgGUID: 3CuE8+pcSBiwMrpvowrn3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="266732821"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.224])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 02:08:20 -0700
Date: Fri, 4 Sep 2026 12:08:17 +0300
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
Subject: Re: [PATCH v2 1/3] dmaengine: vchan: add vchan_chan_name() to get
 channel device name
Message-ID: <apqKgda7dW_JXolJ@ashevche-desk.local>
References: <20260903-dma-chan_dev-rename-v2-0-0db305b6c716@nxp.com>
 <20260903-dma-chan_dev-rename-v2-1-0db305b6c716@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-dma-chan_dev-rename-v2-1-0db305b6c716@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_020830_756149_670B4B6C 
X-CRM114-Status: GOOD (  11.46  )
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

On Thu, Sep 03, 2026 at 04:53:11PM -0400, Frank.Li@oss.nxp.com wrote:

> Introduce vchan_chan_name() to obtain the DMA channel device name.
> 
> Use a dedicated helper instead of directly accessing dma_chan::dev
> so callers remain unaffected by an upcoming rename of the struct member.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

>  		ret = devm_request_irq(&pdev->dev, chan->irq,
>  				       stm32_dma_chan_irq, 0,
> -				       dev_name(chan2dev(chan)), chan);
> +				       vchan_chan_name(&chan->vchan), chan);
>  		if (ret) {
>  			dev_err(&pdev->dev,
>  				"request_irq failed with err %d channel %d\n",

This one...

> +++ b/drivers/dma/stm32/stm32-dma3.c

>  		ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
> -				       dev_name(chan2dev(chan)), chan);
> +				       vchan_chan_name(&chan->vchan), chan);
>  		if (ret) {
>  			dev_err_probe(&pdev->dev, ret, "Failed to request channel %s IRQ\n",
> -				      dev_name(chan2dev(chan)));
> +				      vchan_chan_name(&chan->vchan));
>  			goto err_clk_disable;

...and this one are duplicate messages as devm_request*irq() printsr
most of the information.

Not sure if there will be a patch to simply drop them.

-- 
With Best Regards,
Andy Shevchenko



