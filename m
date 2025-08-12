Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D70BCA0EDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAfYK0Cjr2Qz41KBglzn2sIYJYZHj2VwG/els/wt5bg=; b=oUJ2p0SGR4cNIIhjVbYTi4Q7RF
	56agcuGmbnhFyXeSyjbO9+PMq3J0OmTGCo76C6mqSQ7UqT2tzVYz7TuuqmSSSQlkc8HuPO40yko3x
	yykIGjS2W3pSoyCDq6GJC7s3XLc8t6Yjx9vnT++1FxPmu6amyNu5PLE26/RTMXr6RSpqR5CoxfA81
	9sNUUNMr4UcFX5gS+a51Iu5L65C1Y/rFU7AQhhXZbODOi99btJzJdwtxhO2I4G7TuldYqerW9zKom
	jVrKHF+2IEqcPEa7I2JcErYsSj5+Ub3rbOX4c4B8R772W9PiGsLFsjvJ+RooqKLJIzJT14cOQ5mzL
	X1UkD9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulspz-0000000BZJT-3Tmq;
	Tue, 12 Aug 2025 17:31:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmpE-0000000AYvw-3j7A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2D96600AC;
	Tue, 12 Aug 2025 11:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550B7C4CEF4;
	Tue, 12 Aug 2025 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996751;
	bh=DKWZGx+TMzDh4nT8KSomqllRYPxezHT+9s2or2Azo4o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LcO3FcJvz5AwH1cMfQyjoxycSL/+ZSWHplSedZ4GF/AWmha9nJKsLfJ+FT6LM4Meo
	 m1vyLEO934nZCX2rJ7pJ4PNzXXPYGOJkRlPVShdty5aZHDCCDpWwpTA/D+9jNSuTa3
	 7mssVQbM85pFyfKWIvqwfcdFpx734grqTUefo5Cd7Z+nAXQf4B53+jBVQ2gmJ2Aar3
	 sbi6qp6jzNJs6DU2Ksywc9RRlBtViKUr0xsxXvfWtSAElMiJ/9KUjnTB2g7JuHjS/M
	 MM3n0H+Lw8ycrVzKQ/uAhM4SF5UiiQmpT2LN5IqxOWNXRlp3+NtKYiuDXe5YrDMxVi
	 LGou2IuoDY23g==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, ryan.wanner@microchip.com, 
 tudor.ambarus@linaro.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Manikandan Muralidharan <manikandan.m@microchip.com>
In-Reply-To: <20250730101015.323964-1-manikandan.m@microchip.com>
References: <20250730101015.323964-1-manikandan.m@microchip.com>
Subject: Re: [PATCH v2 1/3] spi: atmel: simplify MR register update in
 cs_activate()
Message-Id: <175499674908.16293.5097516304989126078.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
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

On Wed, 30 Jul 2025 15:40:13 +0530, Manikandan Muralidharan wrote:
> simplified the MR register configuration by updating only the PCS field
> using SPI_BFINS() instead of rewriting the entire register.
> Avoids code duplication.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: atmel: simplify MR register update in cs_activate()
      commit: 379f819733f28b5aa1802f3ede442f08b7275f4e
[2/3] spi: dt-bindings: atmel,at91rm9200-spi: Add support for optional 'spi_gclk' clock
      commit: a673ebd0a2a587f3d6b923d59d363fc9e8a9f920
[3/3] spi: atmel: Add support for handling GCLK as a clock source
      commit: 91e5722baaea06c1f1b105e9e3fd6645dbdd938b

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


