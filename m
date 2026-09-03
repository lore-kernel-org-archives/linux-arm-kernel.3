Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2A0C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Dl5feE32R5YSmycpNB7tG4kFg0khyu/BjlzmNR2MYc=; b=qe/Ke0KtMaYJLYHBPyclKU8+SL
	WNuzfxKpjGY3uPRFIPBdh8rvIQSd91/FhnxwAxER97oagtKrbTdJ1deJeThLxOzFg0JfylT+YJEYK
	p3hZjj+3ZDN1kchzQojyNprgk9l95MB0o8r8eISzY5pVcXQ4TpUA3wyPT9XEPDSPPEAQaiBlZo1gx
	zxBcQFNnLUiPypL6YtO3F4SolYroeIsA2il/ggk+cR8eE/3YLqfp76Fxmt+HZ4p3y3BwZ6pI2JnG2
	8vQGkvknkbdjMVArCl4iyspSZgkCquUtTLtLgb5iY+X4rSqq5epzvRV34RRH/3fnsT/qCn9gKqu26
	XF1vLFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AsE-00000000ErX-28L7;
	Thu, 03 Sep 2026 17:05:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AsD-00000000Eqe-0C9f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:05:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CADBA43606;
	Thu,  3 Sep 2026 17:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1541D1F000E9;
	Thu,  3 Sep 2026 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455112;
	bh=+Dl5feE32R5YSmycpNB7tG4kFg0khyu/BjlzmNR2MYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IxISMyqa6Z8ZHxKuew18kV8M5NNd8ulFRT+m7YnpSgtr14GjWN/4S/FCcL44vxkyX
	 LwzUNohC53hI8u36l4uovyz1FloKZZy7u7QDJ0x3SJRfFnkAFvq8A30oZULKFtr2FP
	 rDb3Ke0ersoEH5/p2u5koqgkm9lUikSmKsbZ+l+Xt2iDnmXpvEt+cRqgl8DtWnKJT8
	 oSWUX8cZ1vZnxyR/1JRg8bOQVRH75nczJrVd5F73VcYp7aAUeEiEtxlcufGW+IQ/Is
	 jV58d/1ZX/NQetnwxHxrJbuPaNXJw6c3R24L8IXL4TO1ZKKqxRQKuG5enJ1cE+fnGM
	 Y0JW1wQxUXTGg==
From: Vinod Koul <vkoul@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Suraj Gupta <suraj.gupta2@amd.com>, 
 Marek Vasut <marex@nabladev.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alex Bereza <alex@bereza.email>, 
 Folker Schwesinger <dev@folker-schwesinger.de>, dmaengine@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, git@amd.com
In-Reply-To: <20260818174151.1608971-1-srinivas.neeli@amd.com>
References: <20260818174151.1608971-1-srinivas.neeli@amd.com>
Subject: Re: (subset) [PATCH V6 0/4] dmaengine: xilinx_dma: MCDMA
 descriptor and metadata handling improvements
Message-Id: <178845510663.1711546.3081841181501985033.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:35:06 +0530
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


On Tue, 18 Aug 2026 23:11:47 +0530, Srinivas Neeli wrote:
> This series improves the Xilinx AXI DMA and MCDMA driver's descriptor
> handling and metadata reporting. It fixes direction-specific descriptor
> field usage, ensures completion is based on the hardware completion bit
> (important with interrupt coalescing), and extends metadata handling to
> expose status and sideband fields alongside APP fields.
> 
> The axienet driver is updated to derive RX frame length from the standard
> dmaengine residue mechanism rather than descriptor APP fields, making it
> work on designs where the AXI4-Stream status/control interface is not
> present.
> 
> [...]

Applied, thanks!

[1/4] dmaengine: xilinx_dma: Fix MCDMA descriptor fields based on DMA direction
      commit: c791d22ddd7b4940fa3c211b5ee7c5d4ce2d1dc3
[2/4] dmaengine: xilinx_dma: Move descriptors to done list based on completion bit
      commit: 5af3ac5de34f9f7a4ae81c690d8dea5dcb523ab0
[4/4] dmaengine: xilinx_dma: Extend metadata handling for AXI DMA and MCDMA
      commit: 37c44606eaac6f600fe2c602372bb02ef5ec0c53

Best regards,
-- 
~Vinod



