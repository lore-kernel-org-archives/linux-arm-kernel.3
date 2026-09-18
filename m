Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D216C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jf1Sg8JZNv68DkLQ9YM/PpRyl/DdqtnqTNtVqMW7pCQ=; b=KCi41MEwY4Uh5AaSKHCCCvEGtN
	ghtm31JhO97H6Op3kucxDEFpPk7o1rq4IXLdVwdwcTbMKAwYCcHzashCBKqDb+yHlVAxmjuuVyRfb
	tW18wL8bK/Q+PO0WM3eH0uzlqb7scEOH5NDGSgoKBxThHTf0+zWM5fK9d2KealizNpYlr7H/w2Tc8
	ZB5OXE2M4sfvyVn3iofLIUz8tp/ZIXAFh6fiQaYdy3aZ9S6nykrG7AWtXWKfYsMRgQnoq3kP5/kdq
	B0cUt91FAWxHIlxeylH4k58kgomX2SNjaQ3+INXgroAqZoByIeDnlADbZ0C93Kiv7oFF2Gx/wmE67
	Mji6qmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cmz-0000000FE25-35Eo;
	Fri, 18 Sep 2026 17:54:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cmy-0000000FE1y-3CUq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:54:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 341186053B;
	Fri, 18 Sep 2026 17:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE0C1F000FF;
	Fri, 18 Sep 2026 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754059;
	bh=jf1Sg8JZNv68DkLQ9YM/PpRyl/DdqtnqTNtVqMW7pCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Klb0wgBf/SLgWj8gfV4cN6tyX52Ht6NPmHY80Oiah1HnBqO/OyUciZTIDi9BkPFl+
	 kVtM4MDrwL3iJ+Dk/0t3AaAekBg9bRyzcdefzbxTjxuIEhjb8dcgDVZPk9jdRN7OdI
	 LMGZig5sWRuoHAiWPcr+7SpWNuYKQHu27i4Oj2XHabTFt/dxwR3ueBfq3VstKbxvyC
	 AdTWPXpOPqP7ncNnv7LeerbxTpIM5NuWsruvwllc0f4393t8cH2oYPxlos/dV9NO5x
	 dI7koVgdfW93gUCUPDUTUS2xQtbdNyDCufvoJUpFbuz/kdK/aX6pyvQl6zfm5KCgdj
	 zRxyAidCalLFA==
Date: Fri, 18 Sep 2026 23:24:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Eugen Hristev <ehristev@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Felix Gu <ustc.gu@gmail.com>, Stepan Ionichev <sozdayvek@gmail.com>,
	Shuvam Pandey <shuvampandey1@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Frank Li <Frank.Li@nxp.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Pei Xiao <xiaopei01@kylinos.cn>, Shi Hao <i.shihao.999@gmail.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	"open list:MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER" <linux-iio@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] iio: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-ID: <aq16x3gAOIslmNE4@parshuram>
References: <20260917203652.1279059-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917203652.1279059-1-Frank.Li@oss.nxp.com>
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

On 17-09-26, 16:36, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() accessor in IIO DMA consumers.
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
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

