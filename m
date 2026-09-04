Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FB9C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYSzSDJUW7xpJUnde+29e34n1o9fwvIdmtg8dq44maQ=; b=K3ujM1uA0g40yYmvRj3OklzBF9
	UMzJpcRkDonz2Z71l/La50GLNGqDnsTXJVXHPeoMpgie+b5TJaHpV7OSk3hO5aoSaLAvRirqDaNEW
	/Vt/+vKanXCR45OS/kK7xve72tABDJyfM2dMzPIACyhM8ua+z9otzbMH0uS/ghEpdfYTpn9SoLUqX
	sGfJExj0ZjHNmDxugTs2YpOWSnBPl0qJ6i2do36nsHN41OoyXpvc2oBm9itJ1HFgDJaPu89tlaxy9
	jjbTCuE2p+9vXjc33hFj4MiFRyLkcEIyT0zM4xf1J2QclUutJlfpNKLy0/FJrD22K0CZL7KE148Xu
	OmiVvlIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SFy-00000001rB3-19KV;
	Fri, 04 Sep 2026 11:38:54 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SFw-00000001rA5-0SZe;
	Fri, 04 Sep 2026 11:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788521932; x=1820057932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sI88re9mQH9GGvNdQuqSOyqwac+FJGSZRs1mUIUeR4w=;
  b=jPoU2ajZ0jJpa1MZBPRQWRXsc+c6MroJDaxkQnFUFgq0FFoZux/d+dwF
   BfP6Hp0+OcTj93fkkBfLIPQHK+KOOql7MxNXQ/0hTD0cIjweQtXgNXOyV
   LVGg7dyaz4aJY8199ZNTGL9QgrPPiV8E6lS75auvOdkTF/rtS3R5s1Hzi
   83wZjGFoBAjrt8GeuBEKFkKWTctcyVxXQ7PkyXs9lGZ7r9eBXdh8CS1c7
   +Kr5P0412pYm46p4ptBKYbL15qYnJ0LJ6LLXzyZ34vsywTdunRuLloCD5
   o8gGHkrnPd+eYVCBotj9B5Qgozklb059VsD08mTaS/hVjw2CPXWQwqVZX
   Q==;
X-CSE-ConnectionGUID: zJbD07bQTQmjFHqWMbh5Tg==
X-CSE-MsgGUID: wGBNIgZ5RNWubiwSLrvelw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92720053"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="92720053"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 04:38:50 -0700
X-CSE-ConnectionGUID: ObP9eg0VQSCbRIFJ00EGKA==
X-CSE-MsgGUID: UlijwXHGRmWAqOZ/7kly8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="268698798"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.224])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 04:38:42 -0700
Date: Fri, 4 Sep 2026 14:38:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Frank.Li@oss.nxp.com, Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
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
Message-ID: <apqtvq2Xov1LKBPN@ashevche-desk.local>
References: <20260903-dma-chan_dev-rename-v2-0-0db305b6c716@nxp.com>
 <20260903-dma-chan_dev-rename-v2-1-0db305b6c716@nxp.com>
 <apqKgda7dW_JXolJ@ashevche-desk.local>
 <be376690-5219-4bf3-8ed7-02a49cee0e30@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be376690-5219-4bf3-8ed7-02a49cee0e30@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_043852_217255_0C95323D 
X-CRM114-Status: GOOD (  18.78  )
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

On Fri, Sep 04, 2026 at 11:26:37AM +0200, Amelie Delaunay wrote:
> On 9/4/26 11:08, Andy Shevchenko wrote:
> > On Thu, Sep 03, 2026 at 04:53:11PM -0400, Frank.Li@oss.nxp.com wrote:
> > 
> > > Introduce vchan_chan_name() to obtain the DMA channel device name.
> > > 
> > > Use a dedicated helper instead of directly accessing dma_chan::dev
> > > so callers remain unaffected by an upcoming rename of the struct member.
> > 
> > LGTM,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > ...
> > 
> > >   		ret = devm_request_irq(&pdev->dev, chan->irq,
> > >   				       stm32_dma_chan_irq, 0,
> > > -				       dev_name(chan2dev(chan)), chan);
> > > +				       vchan_chan_name(&chan->vchan), chan);
> > >   		if (ret) {
> > >   			dev_err(&pdev->dev,
> > >   				"request_irq failed with err %d channel %d\n",
> > 
> > This one...
> > 
> > > +++ b/drivers/dma/stm32/stm32-dma3.c
> > 
> > >   		ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
> > > -				       dev_name(chan2dev(chan)), chan);
> > > +				       vchan_chan_name(&chan->vchan), chan);
> > >   		if (ret) {
> > >   			dev_err_probe(&pdev->dev, ret, "Failed to request channel %s IRQ\n",
> > > -				      dev_name(chan2dev(chan)));
> > > +				      vchan_chan_name(&chan->vchan));
> > >   			goto err_clk_disable;
> > 
> > ...and this one are duplicate messages as devm_request*irq() printsr
> > most of the information.
> > 
> > Not sure if there will be a patch to simply drop them.
> 
> It was the purpose of this series:
> https://lore.kernel.org/dmaengine/20260709135846.97972-1-panchuang@vivo.com/

Yes, thanks. My point is (independently on who contributes that patch) that
the piece above may be an unneeded churn due to messages are going to be
removed. It all relies if that series (a.k.a. patch that removes messages)
goes first.

-- 
With Best Regards,
Andy Shevchenko



