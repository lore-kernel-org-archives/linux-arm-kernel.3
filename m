Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11088D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZU72f/WSkylee/jlvxwVkfbfYRrPrrwZE8L9knKBNI=; b=C2snbjNUjoB9jtrOfwtPBz4+WS
	0zwi21X3df05UCAYqq4/5Fr1FQSozQtyM8rCU+cNHmzD+P4mTmo0OKtekRd8ukvW4TPNxz6CVBc+y
	SdDy0/9p/BOyW5OTxr5zD4+rMKCd0LYdmOUbSK+2xHEpzL/vHT0NlOjNR9UbZAPf441BWEkcwvAiE
	mrTM4oqt8C6rVRW9XOCUu2Alt+k3OLbAXLIc3uEO7FR00bRfoY1dB8RA6VJacVZE2xM3EbAcGcz37
	7/dcaqYmq1mABprbzYJR2/QfjtuxaGA3xJfRKb/YGwbWXHhW7G4YKxNR0ZDDJ/CkJUakobT+sVMdD
	y+DFFs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96y-00000003jEf-3jek;
	Mon, 15 Dec 2025 13:59:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96v-00000003jCJ-2AfI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB0E16015E;
	Mon, 15 Dec 2025 13:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93286C4CEF5;
	Mon, 15 Dec 2025 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807176;
	bh=o0X2IyCU5xJJncvKbdeohmJq4Nt8o89APee6pHzCAfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jEvPfafcH0xiTVOe9LMvWBjQf488lqW7thyhMiVVthpo5/vh+2KdAn8BpLKo9i98v
	 FuBThjuFN8DNEY9PWXJVaWsSJHzwCM1SiU5dmrHAGCIm3efvNPFyHFUxZC1w95DFDm
	 hzN45fijycF81XBy2KM2ilr8ukGrEPoV4s00U2aSANlG5xjKwssk4vJceErAAsqU1u
	 eSKXpPjJiUwvDPOl9No4mQogMnMoFoqMKfw/VUYhnhArR9Hjx4m9v09DI59pqCfwWA
	 tyyNYgDkpPBENE0+lTuGw2Ne2fm2D8PMWJZR7Rz+A4bNiZpRMYt8EtFDPl5iLbBJVR
	 45vCXp0M8calg==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251208-upstream_qspi_ospi_updates-v2-0-62526c9467dc@foss.st.com>
References: <20251208-upstream_qspi_ospi_updates-v2-0-62526c9467dc@foss.st.com>
Subject: Re: [PATCH v2 0/8] spi: stm32: Update for OSPI and QSPI drivers
Message-Id: <176580717503.161463.8142752344614450653.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:59:35 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Mon, 08 Dec 2025 08:29:07 +0100, Patrice Chotard wrote:
> This serie applies the following updates on the spi-stm32-ospi and
> spi-stm32-qspi dirvers :
> 
>   _ Update FIFO accesses using u16 and u32 when possible instead of u8
>     only to optimize throughput.
>   _ Replace Transmit Complete and Transmit Error interrupt management by
>     usage of read_poll_timeout_atomic() to optimize throughtput.
>   _ Simplify Status Match interrupt check.
>   _ Set DMA burst configuration dynamically.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/8] spi: stm32-ospi: Set DMA maxburst dynamically
      commit: e35a7607e05d59d35e937b80532ae93d1dd2493f
[2/8] spi: stm32-ospi: Optimize FIFO accesses using u16 or u32
      commit: cfe58ffc95a601988702df6f3462cb54dde467e9
[3/8] spi: stm32-ospi: Remove CR_TCIE and CR_TEIE irq usage
      commit: f6ed06926b510f54a0817567ffd458194ed90bd6
[4/8] spi: stm32-ospi: Simplify SMIE interrupt test
      commit: e2f0ea18e560e5fa6180f52dffe434525a0cf86b
[5/8] spi: stm32-qspi: Set DMA maxburst dynamically
      commit: 4ef80c71c62ab841db9b1a9d74ffe043c60f6222
[6/8] spi: stm32-qspi: Optimize FIFO accesses using u16 or u32
      commit: 1ca91281649547efa4be34584a304974c9601df1
[7/8] spi: stm32-qspi: Remove CR_TCIE and CR_TEIE irq usage
      commit: c5f76d888810bca2d46297a7b942e10bc8cc69dd
[8/8] spi: stm32-qspi: Simplify SMIE interrupt test
      commit: fee876b2ec75dcc18fdea154eae1f5bf14d82659

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


