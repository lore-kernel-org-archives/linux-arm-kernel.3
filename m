Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F951E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEAjQfOReu2fHrsBppUp6r/Nku+JlxCILNXG6vZqqOw=; b=hCYIpv5FibXADM
	b+KBFBWwwgg8O1czI1A2JUHBKqqKklVAKc7YS5xndUkVs7T7z752VAuPmyK/QYxTz7rbmQYdC8DKY
	Sw1kjXCkvoilpCHRRIK5bvVIi7MnBskt0wXnB51dWt5SfM8z39k2zDG5lj0sU0UJ5+Lw+r5R0CVIj
	UOw/2cT5n6tKlZM27EL+cIQdCe8+Z36+LWwPlnrHPDd8ardEfWO3RDuUN9xLiBaWlRmpAr52TCyNz
	cOoM1UY2qGBIzTjaTlu3sm6FytneCN8gN9VdmaZBw/Wz87OtmjSiO9+kByKIiJETpL44tJoHKzr6R
	Sby89tTmBxHA+rOkNTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8OI-00000004hga-0P8A;
	Tue, 07 Jan 2025 12:08:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8E3-00000004f1o-2VoX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:58:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0E345C6160;
	Tue,  7 Jan 2025 11:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B616C4CEDD;
	Tue,  7 Jan 2025 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736251102;
	bh=8b/xr2q46e+APxvnC56zVcaG7myWN4n1kBuGonTWras=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WUhRTCCbFFGBx51yNADAjPDWxXXmXV9dMCTd2hTqr43+dnx/EeYXsxgKClC8tJbP7
	 aaTRjEn+4zp4/danzFGGEClt1AYINZHmbzAFoe0xkxoAIZQEhRu+k6XCKxqZYbyAd8
	 QFUSV0u14sIN4zKMQRFta1cEqFPFIwSGDPE8HLYSXW1WRtC9Y02SeXWCM48XVe4yow
	 i7KYaMEXNv0hyg0mJDprbGpkuiA8azKLOzfpopXFZpo8a8nDSZ+GYbALs1+nUYZIvH
	 FEtJ/rlPXvR+TL9UoZF1ONewK958lMd5nlD4YRFLWTpUHS5LBmlC6xy6mlqRU75aOy
	 7b4ZK/2W67cKg==
From: Mark Brown <broonie@kernel.org>
To: Piotr Bugalski <bugalski.piotr@gmail.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
In-Reply-To: <20241219091258.395187-1-csokas.bence@prolan.hu>
References: <20241219091258.395187-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v2] spi: atmel-qspi: Memory barriers after
 memory-mapped I/O
Message-Id: <173625110018.23847.7363192643987703594.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 11:58:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_035823_684606_CC4293BC 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Marco.Cardellini@microchip.com, stable@vger.kernel.org, Mahesh.Abotula@microchip.com, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Hari.PrasathGE@microchip.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 19 Dec 2024 10:12:58 +0100, Bence Csókás wrote:
> The QSPI peripheral control and status registers are
> accessible via the SoC's APB bus, whereas MMIO transactions'
> data travels on the AHB bus.
> 
> Microchip documentation and even sample code from Atmel
> emphasises the need for a memory barrier before the first
> MMIO transaction to the AHB-connected QSPI, and before the
> last write to its registers via APB. This is achieved by
> the following lines in `atmel_qspi_transfer()`:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: atmel-qspi: Memory barriers after memory-mapped I/O
      commit: be92ab2de0ee1a13291c3b47b2d7eb24d80c0a2c

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


