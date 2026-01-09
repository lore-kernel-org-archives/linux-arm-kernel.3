Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FADD232D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 03:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lla7B10SrYBRg7dO5+dhvww8o5+hyyYKqG+YwIZzQC4=; b=Gdk3QEv7YqnDdD6zICW1dwkTkI
	FZ4nthADQvrVWtYlExmftvuBta10duGdalOIokkbUVzpSOSe4jZ+KivFUvHUOF5QNY573qpl4vxGM
	OMYH0aR+ZCThDLMLE2teJwrKk/Zqej92PPPi4UMxTJH4OsxWAP2/+gtm3/XGpuR8z9nD5Rd6hdHZz
	p2L5QHXK2Qq1fu/2l4NjAsvyEStUIcRPFXAb0hi9RCN5XI78sYedAfTem1PZM2Tw0bEQJaVPyQaDG
	YDxSy9YUfUNLFk2kLx1qk6L3NHdsDSzh8A0q6mD8il8HdwuOxJ1BvDUFZk/Koq7rvALodspPnv1Ht
	emxRs7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve2xF-000000019n1-370L;
	Fri, 09 Jan 2026 03:14:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve2xE-000000019mo-1OWZ;
	Fri, 09 Jan 2026 03:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C122E6014C;
	Fri,  9 Jan 2026 03:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68ABC116D0;
	Fri,  9 Jan 2026 03:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767928463;
	bh=JM6afzoYTowQzjljySmLl/5jLkOrxyGbdNB1qD5wmKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FkVAwDUzlepumCpf0yGB+QKEd1XGdp4cqikxVBM/9XQf6maNCI+Zw4uKgHsLFrybW
	 bD5YI+l1/NByhBMsN1YHVd38p5wMB1CcQSFAm3HijvWc4uZfkede3lLhY/o7ln3TxL
	 qzxdtuHS7+BPlhA2Ub8+0DXfmv+ZtMp8QeMKx/kH0Io3j6FX3N9tYwxCXABqsOh2xy
	 1KcO1V43dpW9ChKYR8tFTnVzYv5bQUMbcy8fNGNF+1NIAtzzZZIlH+7+CJ5sk4Klcc
	 MGr8CoKm+tEXRVVMOgQrNES304Y+PlVbJcrtB1KxAA4t/hauzpIM1Vh0US1duEBcT9
	 2cIBzgSonruzw==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Thomas Andreatta <thomasandreatta2000@gmail.com>, 
 Caleb Sander Mateos <csander@purestorage.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>, 
 Stefan Roese <sr@denx.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Lizhi Hou <lizhi.hou@amd.com>, 
 Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 0/13] dmaengine: introduce sg_nents_for_dma() and
 convert users
Message-Id: <176792845632.658957.11812821464342552504.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 08:44:16 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Mon, 24 Nov 2025 13:09:18 +0100, Andy Shevchenko wrote:
> A handful of the DMAengine drivers use same routine to calculate the number of
> SG entries needed for the given DMA transfer. Provide a common helper for them
> and convert.
> 
> I left the new helper on SG level of API because brief grepping shows potential
> candidates outside of DMA engine, e.g.:
> 
> [...]

Applied, thanks!

[01/13] scatterlist: introduce sg_nents_for_dma() helper
        commit: 80c70bfb95cdbe0c644070f4ca4754a60f0a4830
[02/13] dmaengine: altera-msgdma: use sg_nents_for_dma() helper
        commit: 47f5cb7878cc62ed95981c5d02862b253eddb590
[03/13] dmaengine: axi-dmac: use sg_nents_for_dma() helper
        commit: 024ae9d3092c425f3ea6eae92086a2001ca2e0c7
[04/13] dmaengine: bcm2835-dma: use sg_nents_for_dma() helper
        commit: 39110c68500a149664bafb0c174baef0d42e2129
[05/13] dmaengine: dw-axi-dmac: use sg_nents_for_dma() helper
        commit: 5d6ceb254fa9ac1f50932c42a0a9a8bedaa3190d
[06/13] dmaengine: k3dma: use sg_nents_for_dma() helper
        commit: 3fc49d21f3a46866724ff8ef8a79c6e2cd9d7676
[07/13] dmaengine: lgm: use sg_nents_for_dma() helper
        commit: f9b0274f53a2d464e71f37e8f4d0d0dc41321259
[08/13] dmaengine: pxa-dma: use sg_nents_for_dma() helper
        commit: 068942eaa232ba752b744d98ff8ab22b26c8bff4
[09/13] dmaengine: qcom: adm: use sg_nents_for_dma() helper
        commit: 425f871d7acdb521d67c2578e6ae688a751d1e80
[10/13] dmaengine: qcom: bam_dma: use sg_nents_for_dma() helper
        commit: 107fdf0c4e944030bf544aea98e8ae8537914177
[11/13] dmaengine: sa11x0: use sg_nents_for_dma() helper
        commit: d7785661010e2fe113aec2500f988a8e73ac3e7b
[12/13] dmaengine: sh: use sg_nents_for_dma() helper
        commit: ac326dca6870f0d8e0787e94b1d9c2c91bb358d7
[13/13] dmaengine: xilinx: xdma: use sg_nents_for_dma() helper
        commit: 3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2

Best regards,
-- 
~Vinod



