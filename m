Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA94EC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgQ5iek2QTRW8iASH+lY6sNR6kN5ASLBvwS4YFHgBVk=; b=rNT1teO95Gr4wAziPbypuK/EBM
	y5UhcNlylU4BDb71nCH8g3PYPSYdowSioWORCMmYNAi9fP1ll3CIkjguSPNHo0uB8nuTzYu85H1+5
	lux4uCn4yWpyY12/goodwWmkvq7j5r+EDpO3l7OGfoRG3rs9CvFSY9o6YuUsRVcKwJAx/kXuGaf/y
	vqVsvIW3z+jhvm5TFDV1UfMDyUi5ADmyycRYrjBmLEwvSuJDeGxA/Pnn0uTca1iwt5jSMEpSIevje
	A1Ug6xfSEcbIp3u2W4ko+hHohVaO107nctF+OXCvIIye51/R6AJ4NOGdHWYqqFyeNIm1HWFwLe8Bs
	IdpcUv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumtY-00000002FEI-2l5m;
	Fri, 14 Aug 2026 08:04:04 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumtW-00000002FDC-1CKi;
	Fri, 14 Aug 2026 08:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786694642; x=1818230642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f/gV5vYFiyp1v8tbidEy1y5VhvcAHpOxhT/ORtc2H+I=;
  b=Eb9CMvg6R2WIIbbMOn5A1/0ARVXdT9djZLq068qgzWA+hBJRYZZQqaNK
   fr5QKVXNT5ht6LZCWRFOL9W8k/pWK9v4uJAM5mpIkq/++RGsf5qfWkIce
   JbTLKDHpFCDR+8Ijm/fcnCJyyxpWCpxDDVej9FSlpWlOwCM2olWSc9bj1
   nswjC08eb2jwOKEPsjYorNiBv4qWblDlSuDFOC9OOLerehRcdtBw1ixX+
   H4nFh635Sqa7miLgzO8bMBDgZYwpyOpj9J2PpuI+EYNfqFcUBzRre3v8I
   Iye9JLsdvUFwjmydjFBbWgFVRKqnroSs6cou134v3FJBoKRFFynpiOLGe
   A==;
X-CSE-ConnectionGUID: Vnhg9wjnRCeOIC+iMnL8YA==
X-CSE-MsgGUID: XS50avMcSOaFhFMVeVF0Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="112817493"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="112817493"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 01:04:00 -0700
X-CSE-ConnectionGUID: uZWHJQ8jQdKFP7Q1mWiRNg==
X-CSE-MsgGUID: 8lhQsporQJ2V5PiZN1hVjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="262411537"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.134])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 01:03:51 -0700
Date: Fri, 14 Aug 2026 11:03:48 +0300
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
Subject: Re: [PATCH 1/2] dmaengine: use dma_chan_name() helper to get
 per-channel device name
Message-ID: <an7L5D_9aGMkLiEw@ashevche-desk.local>
References: <20260812-dma-chan_dev-rename-v1-0-a67131f7d5c2@nxp.com>
 <20260812-dma-chan_dev-rename-v1-1-a67131f7d5c2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-dma-chan_dev-rename-v1-1-a67131f7d5c2@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_010402_334029_A352A03C 
X-CRM114-Status: GOOD (  10.96  )
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

On Wed, Aug 12, 2026 at 05:24:08PM -0400, Frank.Li@oss.nxp.com wrote:

> Use the existing dma_chan_name() helper to obtain the per-channel device
> name instead of open-coding: dev_name(chan->dev->device) /
> dev_name(chan2dev())
> 
> Simplify the code and improve consistency.
> 
> No functional change intended.

...

>  		ret = devm_request_irq(dev, lchan->irq, loongson2_cmc_dma_chan_irq, IRQF_SHARED,
> -				       dev_name(chan2dev(lchan)), lchan);
> +				       dma_chan_name(&lchan->vchan.chan), lchan);

Depending on the amount of users (and I expect there is a number), I would
expect specific API for virt-dma case.

>  		if (ret)
>  			return ret;

-- 
With Best Regards,
Andy Shevchenko



