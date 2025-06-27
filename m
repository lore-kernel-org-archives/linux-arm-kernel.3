Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88629C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ael58yhaaQW6M4MXIPOGPMY+ESq3VcKGmud4NxxDtg=; b=eW4h00EbZlwiV7ppR9BOCyh3B2
	I6PCiSISCjTnok3G9Up3C3WVdsN8Q9lCtubs7y4XLTOiLvAWuI1V+N3lh+rdRXw+Ju80CaDMMRh5v
	yWsfilbirUc+MVjC0XakFISddykn3M1MP+0N99y4SFd9uYpaJ4t/Bmb5EqwnCUDGELwGC5YjlYwZh
	mb490VRtys9axTKM153H1qRhGn/IVhzC5Jusp6dQwaWflvBvs3ILeLWap5lzY5+DBlT/geNA1Ms1L
	oxmabKJ+AtmTyAlTNytr5wVLY25XtGFCJdVxh44/AVyOz0n6SX2X6S22yBdLuaBOcYEsM+RGRZ7td
	z07K+w7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV99l-0000000Emak-08O0;
	Fri, 27 Jun 2025 13:30:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8YM-0000000Eh3H-3QTe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:51:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03D2F450FD;
	Fri, 27 Jun 2025 12:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72064C4CEE3;
	Fri, 27 Jun 2025 12:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751028696;
	bh=OV5rE1Egth+rX0x2sNvM7ePPH3s60fZPUkM/cp/VU/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YnX5UCJ2VZODMIac638/iCrEzmTSFGezr7liVfqz3IiV8g8OggwHu0Ac1cjz64g81
	 nb+G2u4YsJZmbI5/Ace3gDfDt3iKJQrcTJsLZbomxSuzTyD3/xaQCmcHTSVk7MDg4q
	 uVDZUNOLqalhnvCYVCfwTL6val+O3k6ozOpl3lkOCSnb5DjRluwItHmccb8VANX0lm
	 2dyws2QQfXXulbajDqZBZ2wcPmuedYcGaee84hFY4+r/BiVfzIgDYtgAD/ylNI9gnY
	 eXi/FTvKZo3sQfF6VBiqBDcupY34u0tps19otPyWof7lvLcLtEMK17fWMQwn0rqp9Q
	 0S9nu9hPGtI/A==
From: Mark Brown <broonie@kernel.org>
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250610082256.400492-1-csokas.bence@prolan.hu>
References: <20250610082256.400492-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v7 0/2] Add `devm_dma_request_chan()` to simplify probe
 path in atmel-quadspi.c
Message-Id: <175102869373.390499.16488467994340140791.b4-ty@kernel.org>
Date: Fri, 27 Jun 2025 13:51:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-07fe9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_055138_874608_A0ADFBA8 
X-CRM114-Status: GOOD (  12.86  )
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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] dma: Add devm_dma_request_chan()
      (no commit info)
[2/2] spi: atmel-quadspi: Use `devm_dma_request_chan()`
      commit: 2555691165a0285a4617230fed859f20dcc51608

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


