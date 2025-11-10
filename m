Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47842CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDzFhESh+0dXWEnSaoeWGWe64AWCa9rzJCFrSN8/64c=; b=QesDvrzvcf6xADPJU5ySkvMVhw
	FOvmWoGN0N2STG4p49wUVgwrLXdzc0VxYmZfQa/EZsXySrnrJYco8QL4wxvbRAH0lUkKrgrvKwoe9
	aNxqGT+FsxiRA8R8iqPXA5VbvAyXyGmf5YD2oWjwhYRiX9DxMOgQm3CdiqMOfo7QinkNsk0KPljYC
	RynGsbnTk2Yv99Iq5UDkgbhAy3Gb9VoddOQlr73n2TosTjGZXSlRnisgQz/WuDsaP7agTHi06nMvH
	3b3CQA9D7bKAReGh4O1nWLu5d1V6Ds7o7OYprJEEcpP6uaidWgKcva1WE9WPQyT0OnKZ15yzK56wg
	gbr+0luQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITed-00000005fj3-3SAO;
	Mon, 10 Nov 2025 15:18:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITec-00000005fif-0i7Q;
	Mon, 10 Nov 2025 15:18:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42913601B4;
	Mon, 10 Nov 2025 15:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FDBC4CEF5;
	Mon, 10 Nov 2025 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762787880;
	bh=bXd9TtF3dk2wRq/oyzyztTa7C2oi3PkIcAOa05k8Tlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMbris1lF1zUOR+rGlAjOMgRPn2kNYoJHRbnvYFQWaaIX14n+LHehqDy0FcnNZa5v
	 hwc5SOnQDIhKdThiA/NIwcIbGGcIsksIDSVbZBNxyQr8VaaYKF9Zi9BFzHgKNlB67E
	 vRNE7hp+l1PUBjxVkQ2B1Xg2oeOiaxcjHNl7XgxwZJhl3FoA0A5XJYNFareLSD+B13
	 IZI+uziLiPWuqSoo8y0FZXBO6Ec2by7B5cDqiXUUrxYxRUV24bABkd1QnqWrO+6vwx
	 Uosw+h6nEz+AAWMEzPQnBCCXb3zJGZU0GpcfGkIWB1DtbBARyGyE8Qz8vlENswZHZn
	 ozHwZ7m8HVdUg==
Date: Mon, 10 Nov 2025 09:22:06 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Vinod Koul <vkoul@kernel.org>, 
	Thomas Andreatta <thomasandreatta2000@gmail.com>, Caleb Sander Mateos <csander@purestorage.com>, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Olivier Dautricourt <olivierdautricourt@gmail.com>, 
	Stefan Roese <sr@denx.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 00/13] dmaengine: introduce sg_nents_for_dma() and
 convert users
Message-ID: <h4twbib3pxrcmohckzg7d64moo5v5gjtdu3pz5wtroegdylcuh@7po5qbe3h2au>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
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

On Mon, Nov 10, 2025 at 11:23:27AM +0100, Andy Shevchenko wrote:
> A handful of the DMAengine drivers use same routine to calculate the number of
> SG entries needed for the given DMA transfer. Provide a common helper for them
> and convert.
> 
> I left the new helper on SG level of API because brief grepping shows potential
> candidates outside of DMA engine, e.g.:
> 
>   drivers/crypto/chelsio/chcr_algo.c:154:  nents += DIV_ROUND_UP(less, entlen);
>   drivers/spi/spi-stm32.c:1495:  /* Count the number of entries needed */
> 

Comment in patch 1, but for the rest.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Changelog v2:
> - dropped outdated patches (only 9 years passed :-)
> - rebased on top of the current kernel
> - left API SG wide It might
> 
> v1: https://patchwork.kernel.org/project/linux-dmaengine/patch/20161021173535.100245-1-andriy.shevchenko@linux.intel.com/
> 
> Andy Shevchenko (13):
>   scatterlist: introduce sg_nents_for_dma() helper
>   dmaengine: altera-msgdma: use sg_nents_for_dma() helper
>   dmaengine: axi-dmac: use sg_nents_for_dma() helper
>   dmaengine: bcm2835-dma: use sg_nents_for_dma() helper
>   dmaengine: dw-axi-dmac: use sg_nents_for_dma() helper
>   dmaengine: k3dma: use sg_nents_for_dma() helper
>   dmaengine: lgm: use sg_nents_for_dma() helper
>   dmaengine: pxa-dma: use sg_nents_for_dma() helper
>   dmaengine: qcom: adm: use sg_nents_for_dma() helper
>   dmaengine: qcom: bam_dma: use sg_nents_for_dma() helper
>   dmaengine: sa11x0: use sg_nents_for_dma() helper
>   dmaengine: sh: use sg_nents_for_dma() helper
>   dmaengine: xilinx: xdma: use sg_nents_for_dma() helper
> 
>  drivers/dma/altera-msgdma.c                   |  5 ++--
>  drivers/dma/bcm2835-dma.c                     | 19 +-------------
>  drivers/dma/dma-axi-dmac.c                    |  5 +---
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  6 ++---
>  drivers/dma/k3dma.c                           |  9 ++-----
>  drivers/dma/lgm/lgm-dma.c                     |  9 ++-----
>  drivers/dma/pxa_dma.c                         |  5 ++--
>  drivers/dma/qcom/bam_dma.c                    |  9 ++-----
>  drivers/dma/qcom/qcom_adm.c                   |  9 +++----
>  drivers/dma/sa11x0-dma.c                      |  6 ++---
>  drivers/dma/sh/shdma-base.c                   |  5 ++--
>  drivers/dma/xilinx/xdma.c                     |  6 ++---
>  include/linux/scatterlist.h                   |  2 ++
>  lib/scatterlist.c                             | 25 +++++++++++++++++++
>  14 files changed, 51 insertions(+), 69 deletions(-)
> 
> -- 
> 2.50.1
> 
> 

