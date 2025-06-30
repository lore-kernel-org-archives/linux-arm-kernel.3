Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA51C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RY7hr5/tdyXvqxxJmJYxIKfXATfaGUBnEw9LN9iX3oc=; b=lhY+1ksynCozxCkHPlX6zN7/OF
	EBaFzOP/2yG/wKQPAPDuZF+1i9TUtiy/s7x52Qe5ixWNoFicmoJvOaWptsq1dKbUKyKV5ocZ3XTL+
	sh2xPVY7hrEJYGUD61WEBHlT3AdNirPIeGjneaoek0G8zRKt7TiodeKDTQW6s0Iu/iHsKm2ut7tH/
	5eg+Po0aiMzJPln9q6u79HrCLinwcxI2IaUgj6z/Yf9OHekyZ1OpbhTYdigcIk/rTt/zQdegH452A
	ahKMdScY83+UUsQj9XrKMVXE17ot9ETA6bgIMva6LeT1qZ8YXPDojYHQC4is/0i9CvgOkjaJha4Gy
	ciCmoH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDEM-0000000280T-3iHU;
	Mon, 30 Jun 2025 12:03:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCsV-000000024DM-2CFd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 11:40:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D12B4A5327A;
	Mon, 30 Jun 2025 11:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74121C4CEE3;
	Mon, 30 Jun 2025 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283650;
	bh=ftNktXx3viZwDTtRvJBBYVylno1HnW9Egn+Kkhk6AGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bgLez+HXlFANtNBrQDtXBKnd3LtN7bLY5hLHEsx+pDJtWlg9HvhK5sazMio5sQijC
	 MUtdekGSSf3sPBFjhb0RtVom5b2C9pra/P0PDIrTvncDBzScCO2IRLkKd5NGwaCvhz
	 +1zBi+Bf6q5R0N4i56Tw64XQlFGPO7b1AcDpd7JIvFsD+Nhlm4xE+PS7RoAAFE/5gp
	 +p9AM7W46qckbniToFXS8bCzcPHF0fBAdUEBgaDyrgGm62jwPraqo28n1nXR1hkePV
	 wP/aho+87KhbJf4iRb/alT+xt+K2x2ZIiD5tSbXPP2HllyuHJ4JCApclvNnRYPv6B6
	 V3yO5ytFHpAnQ==
From: Mark Brown <broonie@kernel.org>
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250505184936.312274-1-csokas.bence@prolan.hu>
References: <20250505184936.312274-1-csokas.bence@prolan.hu>
Subject: Re: (subset) [PATCH v5 0/2] Add `devm_dma_request_chan()` to
 simplify probe path in atmel-quadspi.c
Message-Id: <175128364820.28911.16876247019790951320.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_044051_626777_9A964BCB 
X-CRM114-Status: GOOD (  12.52  )
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

On Mon, 05 May 2025 20:49:32 +0200, Bence Csókás wrote:
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


