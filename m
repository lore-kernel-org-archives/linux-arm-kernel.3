Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0F6C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TG2xvNJBCXx1WTpRAKtFtjW+qEDTB07eN3TryfDzbiM=; b=QUrCpXx2ywt9jyOB9KBmoC9+k+
	BAITdS7ttCV+0xSCRUPON8bLOjMsYUnxzCLIjf+zWkwUlv/bXISpbG4oZnVf9wLAcYyXGVaYkyCAx
	LIpyp8WahufTH4tCRPn4UwN+WcAASRPU2o84kEDsFi6SJYAluWf5gk9R7FSHcSSQkuXqFqPzUCq/3
	KQ7D+0hP93xKbdjNB4mhZ56uS3+YXr7FjYOFcKq2wQsJtH8SP/iQp6tdfZ2r+oH5WYWh+wscETmJO
	xO5aoW+HNMl4i6bPmlMUWnHv2EDyaEtNBNhEpQfY7YLB/WfYl65gkcYZ7LA/gce+0XFdxnBgNWbgp
	+XHabxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cjP-0000000FDeQ-1Wmv;
	Fri, 18 Sep 2026 17:50:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cjO-0000000FDe1-1rjU;
	Fri, 18 Sep 2026 17:50:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 803D1602CC;
	Fri, 18 Sep 2026 17:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B751F000FF;
	Fri, 18 Sep 2026 17:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789753837;
	bh=TG2xvNJBCXx1WTpRAKtFtjW+qEDTB07eN3TryfDzbiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jvtw5OGw0qgxCGGmNESlcbfLK2iqnqleBg0SZDDtuoGuy78On8VzRlf5agdDYe+aU
	 D6fKMdGPGu7vRSVE6n19/ak5jN+gjUEEsJiZWAp+R6AcU36ncJQ2YmcNHh2BdV2jls
	 lW4iilLjgjTT/9jjNUn/+Sw/SSB0acL/5kXk21rl3MJvDnGoszcdb2gW1s3X28f9Gy
	 JJLm3W9SWzbxgAVFkyPJaWtMf9t6tXYLrwRFxYKc08K498LyrxQs+yjQc7dHjkZauV
	 Dur9aZKISUJ/kR5yNKl4bmrQEr8tdm1OlVy1NnuMJ7WaQo98QZGYMeSTsH6hq2y092
	 XceuyyBfUgXdg==
Date: Fri, 18 Sep 2026 23:20:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Aubin Constans <aubin.constans@microchip.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Linus Walleij <linusw@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>,
	Rosen Penev <rosenp@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>,
	Pan Chuang <panchuang@vivo.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Rakuram Eswaran <rakuram.e96@gmail.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>,
	"open list:OMAP HS MMC SUPPORT" <linux-omap@vger.kernel.org>,
	"moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
	"open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>
Subject: Re: [PATCH v2 1/1] mmc: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-ID: <aq156IdeXdaE4Fqg@parshuram>
References: <20260918152349.2101305-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918152349.2101305-1-Frank.Li@oss.nxp.com>
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

On 18-09-26, 11:23, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() for consumer API
> 
> chan->device->dev is not always the device used for DMA mapping.
> Some DMA engines support per-channel IOMMU mappings, so different
> channels may use different DMA devices.  dmaengine_get_dma_device()
> returns the correct device for each channel.
> 
> This also prepares for making the DMA engine provider data structures
> private. DMA consumers should not access DMA engine internals directly.
> 
> Assisted-by: LLM
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

