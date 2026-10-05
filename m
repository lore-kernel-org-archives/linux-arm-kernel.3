Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CE2CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Uli3qJzdxDmhMetE65SwSEJBObD0AmWiQfg1Q4vFqQ=; b=K/BpHA0+mRrv4qQaafGDd5gHOw
	l2Y1oCAKp51h0sPj8MZGkatClLO9n/pZvhNk4cJ9uIwOE8WpTTVUGiuOTOxO/Nky6uTCLQ6IT4rZR
	O3HzuFORtAz0ZkQTXhHvLqoYH2EUgKPDzRN00Zuil0mPosrii0kBe3UFpB4tCvt5ejA3oIFyzrwZo
	WDJw2lMTyEtb0Xb+DETc8+vjoVQJnPEWKBNzpfcFcozfnLs0uS3YYvU9cwua18uISWk4ixzx6r47z
	eWNwLkGcVj6fqP/qy8F/TGsaWFrSrsb8LG2qM4acrkEb0UR7tKrmefrzx/w6AdW3xUxHpqnguHfJ2
	HTiOmPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkqC-0000000GmG1-01bF;
	Mon, 05 Oct 2026 15:43:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkqA-0000000GmFB-0kSU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:42:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F1E644033;
	Mon,  5 Oct 2026 15:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B97F1F000FF;
	Mon,  5 Oct 2026 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214977;
	bh=3Uli3qJzdxDmhMetE65SwSEJBObD0AmWiQfg1Q4vFqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eKuN2C4VgSMw6YWLjklPJY+m+rH6ot7rkUFDI4eRPSojfedne1QoOYG3xljLf1hhP
	 pBFIf75t/k4EHrMSRBiTAYdCQ1gRY7r4U5/UKpQqGl0NIE5+e/pemn8EotwOV2gIic
	 4DzSAEd4w02m24aKSrOmOyHsNVwUp3GWnczl8GInSMAWM2wxNwAUVhKjLipbjaTsJN
	 YdPCrEF45Gc5eBbXWI+kG13l0KbN9eVknH2gXxsyyNYWF+v60hIjG5kqOjc1HNzUL0
	 DJztbsnkl9bNpVbOcO/1WtcqHR9HciQylTmoKAy1ZPNQ2GKu9OpCiOBRjnr/wnrdMD
	 n8BMgAGrAcdlw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
Subject: Re: [PATCH v5 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Message-Id: <179121497373.358863.1015427192725194332.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:42:53 +0200
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


On Wed, 26 Aug 2026 02:40:26 +0000, Yuanshen Cao wrote:
> This patch series introduces support for the Allwinner A733 DMA
> controller in the `sun6i-dma` driver.
> 
> The A733 DMA controller differs from previous generations in several key
> ways:
> - Support for higher addresses (up to 32G).
> - A different interrupt register layout and mapping.
> - A different number of channels per interrupt register.
> 
> [...]

Applied, thanks!

[1/5] dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      commit: 3b18c8e460760a7993c54f9d591b1b758349b1b3
[2/5] dmaengine: sun6i-dma: Support variable address widths using masks
      commit: 4ec2d7bbbf2c79a63469b4a027cd522abdbfb2f9
[3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      commit: 9ab1198158a5e6b1d24677970cdd30aba2d39d37
[4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      commit: 714f0410eaf057b3fe19e4b9c9028406e38a29d0
[5/5] dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller
      commit: 779867c3a5309561e056f9c3c55e5d1dcc7717c9

Best regards,
-- 
~Vinod



