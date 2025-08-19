Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A37CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3QvULILPiJhQx+3azi75CxDR2UwJAQV6a3CiOHiJ+k=; b=VAMHqYuwtUtSEN0vZaGbKsxmgy
	tuNdBStFbMO2I1LUaV5f717nuw7WLO7QdMPTC5DQjegM2MvFRztDhogBpAqGWOD5J1jMAtdfH9khy
	XcR3woubC6zqgyoXw2glgIXUuLuFy92SbMq8GB2/BJAMe0ROOBTlRot5ekxgP3s08MZH/WyQD7Fd3
	eXVh4HOQbe+Nhd/shqyga27Uj1Efbm2nURgSIc9Ha158VzlDO5z818f7RWk2wuGNjioZ4S+Dg8cZk
	wOJ4EcAPmzJ2GLW5dd3gbOw3KTZWAynO4rxiCsdEuwsSSSKmJNRnbC8NdJHdzEsWMEram8ujgNvL0
	7XI4WJkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAW-0000000BZ0X-2IeC;
	Tue, 19 Aug 2025 20:42:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRRc-0000000BLQ7-2lOt;
	Tue, 19 Aug 2025 18:52:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B76B5C65AD;
	Tue, 19 Aug 2025 18:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AB7C4CEF1;
	Tue, 19 Aug 2025 18:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755629547;
	bh=UtpGsqXUkldWGa3nJKuOrHaS+PduZ9qTMdBlN9e+xOY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=r+iA9dLmj6cVcyob6HLoSTvGYGcB4vNpyq5nDs1dLlAuYwxuYvdz2dIxJMRTFnDbB
	 ngKZot3gY1gBpWm8qEElguO95+95Fjhx2qo3EZPCTtBiDhFkwUQ15WTT4omOLWdUDJ
	 fb+seFWe7JcwLS5EAT3BuLplKV9J0hp6BHU/FYieC0RXGHRK2ga4wFag12a87a3nHa
	 2GASII1kgQFzWdB6huGdUs9exYHIfvPOv8+lS4Iq9FE3+UIN1jfGtUsA/tg/48dPex
	 jS2H5rn2P2+aHxmw6t7sbD4Ciod6k7kqfB1MW3Oa8aiRgVAJt0VFLBnC/5K9tkH9RX
	 xy6zNeW7U8SUg==
From: Mark Brown <broonie@kernel.org>
To: Raju Rangoju <Raju.Rangoju@amd.com>, Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Andi Shyti <andi.shyti@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Xichao Zhao <zhao.xichao@vivo.com>
In-Reply-To: <20250819092044.549464-1-zhao.xichao@vivo.com>
References: <20250819092044.549464-1-zhao.xichao@vivo.com>
Subject: Re: [PATCH v1 0/6] spi: Remove the use of dev_err_probe()
Message-Id: <175562954316.246851.7964895006967945147.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 19:52:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_115228_777508_6C7EB6DE 
X-CRM114-Status: GOOD (  12.60  )
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

On Tue, 19 Aug 2025 17:20:37 +0800, Xichao Zhao wrote:
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
> remove the useless call to dev_err_probe(), and just return the value instead.
> 
> Xichao Zhao (6):
>   spi: spi_amd: Remove the use of dev_err_probe()
>   spi: SPISG: Remove the use of dev_err_probe()
>   spi: Remove the use of dev_err_probe()
>   spi: mt65xx: Remove the use of dev_err_probe()
>   spi: pxa2xx: Remove the use of dev_err_probe()
>   spi: s3c64xx: Remove the use of dev_err_probe()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/6] spi: spi_amd: Remove the use of dev_err_probe()
      commit: 2a5d410916d3a8dcac06f72494f252314e933cfb
[2/6] spi: SPISG: Remove the use of dev_err_probe()
      commit: 0d00ebc6b869f4df67c05522bc1e8d01d1c7daa7
[3/6] spi: Remove the use of dev_err_probe()
      commit: b875b97017050b92c64273178a0b0d282ea67874
[4/6] spi: mt65xx: Remove the use of dev_err_probe()
      commit: 2bee48c9d1cd1749922d0e2df54330c924e14a0e
[5/6] spi: pxa2xx: Remove the use of dev_err_probe()
      commit: 67259af78219bdbdea00491f32b1c0971a33401e
[6/6] spi: s3c64xx: Remove the use of dev_err_probe()
      commit: 27848c082ba0b22850fd9fb7b185c015423dcdc7

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


