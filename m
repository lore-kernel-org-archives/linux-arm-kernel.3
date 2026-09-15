Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615C3C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTLQWI728P1f1TgVNc2IjXvlKruVQpSAnHbGOlFGSMA=; b=xD6KrK2FxOG29Uoz62XaFJuisf
	VvrDLJCVd5yqupwr776wjbskP1oUC6UC7DmA7chxQ2SBWPsQSBNdVM9CWRqdfp1ZDkuvPm8kVwbHq
	U8qJPstLue5NxxxKwNk/jbi1tMBv94U/4CnEH+PDBirpDipQkYr29xaa2FKvacapHTCPX3pShgu+H
	CPh43xJfGLs5KsGKLDgajL2ILEm5N+o2wviaAEZlKIlzjUGusKegKSecHHzaE502jbI4f4dP6Sc5c
	dC9DTHaWHHLbM3NovjH+UzYeaQGMrN3iIcj/KBTEpfWyouMpz590FT3Zev0H1JlivP6G8NweLjs0e
	7tkajMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X4x-00000007bc0-0hLh;
	Tue, 15 Sep 2026 17:36:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X4w-00000007bbk-1J8n;
	Tue, 15 Sep 2026 17:36:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0305411C2;
	Tue, 15 Sep 2026 17:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1471F000FF;
	Tue, 15 Sep 2026 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493781;
	bh=eTLQWI728P1f1TgVNc2IjXvlKruVQpSAnHbGOlFGSMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IqL0uFcAz2W5DkjxGwOnkWfM8TYT1N01QbSqNK3HTHMrWJ43bARjd9DgtrhAA+Rxu
	 AXl3bxb6/jx9HNVXvT16HSsGtKRh3NyLYICoIxx0z3RP2s0fUb/g/5Urzt+JBSVeUZ
	 V9aLg7r6c7LM7/xKVxGQTneRMd50O3P9qKIPkNJGggGC6cmjXP9FhKqVuey76ETL0c
	 w4GUPZdtt0LiDIUsPy2XaBzSC3HsohqRmZu+6gVqgnGE8I6K+1EiVnTs+OgCsxwbAI
	 eFq37WxaO9GpIGKpb/KOnS946OLkckZszqkpaQHjg4CdbsCLEW70ryH7yPR0PTv7JQ
	 y0opBllzEbU8Q==
From: Vinod Koul <vkoul@kernel.org>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Frank Li <Frank.Li@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Viresh Kumar <vireshk@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Kelvin Cao <kelvin.cao@microchip.com>, 
 Logan Gunthorpe <logang@deltatee.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Frank.Li@oss.nxp.com
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260909-dma-chan_dev-rename-v4-0-d8fb6892a70f@nxp.com>
References: <20260909-dma-chan_dev-rename-v4-0-d8fb6892a70f@nxp.com>
Subject: Re: [PATCH v4 0/4] dmaengine: rename dma_chan::dev to
 dma_chan::chan_dev for clarity
Message-Id: <178949376928.248239.6347762847462574995.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:09 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 09 Sep 2026 12:22:27 -0400, Frank.Li@oss.nxp.com wrote:
> The current dma_chan structure contains both "device" and "dev". So
> 
>     chan->device->dev refers to the DMA engine device.
>     chan->dev->device refers to the per-channel device instance.
> 
> Their similar naming makes the distinction unclear and increases reader
> confusion.
> 
> [...]

Applied, thanks!

[1/4] dmaengine: vchan: add vchan_chan_name() to get channel device name
      commit: 75d8640d7f5f89d1a1c39ccb72166ada95fb38d2
[2/4] dmaengine: use dma_chan_name() helper to get per-channel device name
      commit: 76574306c1ac38137683c69407f0e7810f407e4d
[3/4] dmaengine: add (dmaengine|vchan)_chan_dev() helper
      commit: 3b97a3ec420542591c10db8600cf481f1038a011
[4/4] dmaengine: add union chan_dev for dma_chan::dev for clarity
      commit: 6ad1b49cc30dc9bc7c06dd44241e61fe6f82c0b8

Best regards,
-- 
~Vinod



