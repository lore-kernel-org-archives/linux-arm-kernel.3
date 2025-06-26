Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF6AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsAMv6GY24VZvKxwNnsWEVWIudvjJ/AUIwa3ND/YSIw=; b=fkB2DOMFRMXz4IOvUMbk5uNVmA
	WskYO7G5LFrwSa1CnNggidOieypm06bawd86QIXdBWMuvctDEo102AsFjyNzbbif6d3Y4beqoA4LC
	MtoBQJrkqgKLGxGpfogkz2a+LeT+D3mmkSvBT2NqNqoNEbO5jXxsXZ33a+4w6hxc7/2XR5wEdZ2B5
	LLLuUrA/d92DHFqxEctHXpdWDgf4sAcRX3PaAxsm1pl2XdJsN/giVERPAnEe634mXGkHg18c4bpH1
	IrUZMCWuVunIMRpEV2w42dcQsaHuqF5oYcfyFc6L1lVJwiZu1fq4CwHcBni07sgNJzpafQpHLqPoG
	CJ+PD3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwiu-0000000DBCp-17dD;
	Fri, 27 Jun 2025 00:13:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvO6-0000000CyrZ-0omg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 22:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A078A613AB;
	Thu, 26 Jun 2025 22:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18258C4CEF0;
	Thu, 26 Jun 2025 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750978089;
	bh=UOOZqUVVQFUoc7bZ295+uDKZCugXA5Wvp3MAd/fhdrM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gUnQGwQEsJ9ge0VZgXMVu9Lv/49qvmNlKocha/kF6+BrmG2ufSjIXEmYLD/HB41cv
	 nzvk52EAXwiC6JkuCNvDsnaf5iq7/iafMHo0AnCrkeJBopgzhsCkF8MkwlbWwgpKKE
	 UYDEAYkODZT57+HuzQ+J64ivbHy1KdhKgIA9SeRJeu27BqyZlt7dDrub1653yzZfmu
	 ASC2m1uhUTZlST2RooJ1KgL3VGqpX4K454reuLGnb8xx+Uw+5v0C4uejj0voJtqkDh
	 trIBg73kgc7jgrdpy/ARO543hpPEUzc9CICIxNdlIp5YYdrcAGNEDinJNY3j9trKKx
	 d+DS1yRWEZrWQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250610082256.400492-1-csokas.bence@prolan.hu>
References: <20250610082256.400492-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v7 0/2] Add `devm_dma_request_chan()` to simplify probe
 path in atmel-quadspi.c
Message-Id: <175097808905.79884.10352681234846740562.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 15:48:09 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 10 Jun 2025 10:22:52 +0200, Bence Csókás wrote:
> The probe function of the atmel-quadspi driver got quite convoluted,
> especially since the addition of SAMA7G5 support, that was forward-ported
> from an older vendor kernel. To alleivate this - and similar problems in
> the future - an effort was made to migrate as many functions as possible,
> to their devm_ managed counterparts. Patch 1/2 adds the new
> `devm_dma_request_chan()` function. Patch 2/2 then uses this APIs to
> simplify the probe() function.
> 
> [...]

Applied, thanks!

[1/2] dma: Add devm_dma_request_chan()
      commit: 08bf1663c21a3e815eda28fa242d84c945ca3b94
[2/2] spi: atmel-quadspi: Use `devm_dma_request_chan()`
      (no commit info)

Best regards,
-- 
~Vinod



