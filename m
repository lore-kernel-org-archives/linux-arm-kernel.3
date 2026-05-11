Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838F5CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erSYttUjC1KtNW0Hb2+M+JAB2FNRprxJvtda2kTZFEg=; b=xT1FFIr7r+eNhNpKUCZKVkfidP
	TiK8f9aULPYuKUaIGO8AyGsUrknNuUU1D8zXKdV5J0868LYyg1vtcDV/gt/nhbzF8QdHj3bF/jZPk
	WpZ9a2VJrxdjeVmYEikoFKR/jGegQlEwORaRzP8CP5e74x8Htlh8YvUohVStE+bcxD7zKnycE+Uwv
	NtK4v0l+34vOYnqHKhqY0a4ZfEpurP430eeA5GuFyyR9BMdlKL8Zv1N8qeCPQDeU3Jh3vbMV0IKVG
	BrbVqpedFGfKMReNVd1veAbrzsTXmYRuUXmYKkcaD6Xa1nG+sCLTT1fKcsBPAoka7qkdojqjF8AwW
	hQ4hJPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRgR-0000000Dv1I-2Vkz;
	Mon, 11 May 2026 14:32:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRgQ-0000000Dv0x-0vEM;
	Mon, 11 May 2026 14:32:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EEE56001A;
	Mon, 11 May 2026 14:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B853C2BCB0;
	Mon, 11 May 2026 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509952;
	bh=6yDaCsm6Fs9/qKu1KUmDi4lpZf7x22qyRdhvdJv9Oww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=icPhxbc98tRXVJGF37J6eXmeRpm12v6pan1cFmoGM0830Cpvh691Wj04oH6/hPSox
	 g6JS62vnM0lvZVuRfEF/xsyV7/un38Y+f6f9bxClpsCs5tS+1lyKmD14IsTMqR9dvJ
	 bNhzafjdJYFJ53Psw9zHojjB+gPBQ8KC2YHV3xNgErJXfwkCYpOymSCjR5TtCmKA6O
	 2lTZQdRweGWxqNGQqXY0+wh6gwQQVGe3ZFP0vIOzzEbpLyf2TWz0SdUMvNM54TfvnF
	 0hCrtu8nHVnrmARng8NGBDlhXTjWjZuxl0HIw6cOsjQsRN33fzrNrbsOaxlfddQsGY
	 AXQ6PTIJh9Ygg==
From: Mark Brown <broonie@kernel.org>
To: sunny.luo@amlogic.com, xianwei.zhao@amlogic.com, 
 neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com, 
 haibo.chen@nxp.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 lhjeff911@gmail.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 Hans Zhang <18255117159@163.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
Subject: Re: [PATCH 00/10] spi: Use FIELD_MODIFY() for bitfield operations
Message-Id: <177850111749.988959.3324914194988461245.b4-ty@b4>
Date: Mon, 11 May 2026 21:05:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6yDaCsm6Fs9/qKu1KUmDi4lpZf7x22qyRdhvdJv9Oww=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAeh8vjkGkzUWV0FtkGu3VAG7YFX76JbuewSvr
 7LFDYp1pNuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHofAAKCRAk1otyXVSH
 0GgYB/0bjIyo5EXJiMTycuOQXtlDCYiBMJdMFY7I1IWduMD5RfXhniWXgWw9k/IIvjGySM8RXO0
 IIhV/HTwGFzjDO2SXcPM4W+Jr/8ZF7Qgw9SE0jEpgJN4OAvuq+Xik1N3z68utaNT1f6RduItRcE
 Zy7ES4g0a0t3V0NvEhMX9Mk5HL++3ycbAX6/3GtnZJOhFtHzPjYKbhhDxZiZYCsr+nKFTcHAFtq
 jT3ZRGgXQKN3xMnPqBBedkhZqWWNnhB8QIFZg64/HuIhb4jAla7PrY4zWwZ5cIdM2zeACsGa6EQ
 ddioBbSzHiHvztPDDNzxCiFvaq0EdY3ACBvex9ByywYEtj/R
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Thu, 30 Apr 2026 23:54:46 +0800, Hans Zhang wrote:
> spi: Use FIELD_MODIFY() for bitfield operations
> 
> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
> macro across multiple SPI controller drivers. This improves readability and
> adds compile-time checking without functional changes.
> 
> Each patch modifies a single driver, allowing independent review and
> application.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[01/10] spi: amlogic-spifc-a1: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/8262b1421ddd
[02/10] spi: amlogic-spisg: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/b69bfa593329
[03/10] spi: cadence-xspi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/6fa473f4c5dc
[04/10] spi: meson-spicc: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/cfdab17cd2d7
[05/10] spi: nxp-xspi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/0f2efc6d4938
[06/10] spi: sn-f-ospi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/579fcc06576d
[07/10] spi: stm32-ospi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/21ee6902a576
[08/10] spi: stm32-qspi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/3e0530c087a9
[09/10] spi: sunplus-sp7021: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/673214ac9bcd
[10/10] spi: uniphier: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/ce7984bea2a1

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


