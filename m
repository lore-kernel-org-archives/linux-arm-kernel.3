Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5761DD5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEfjPPMKngyR1fa+QGnCJB4lIjeocWCJtbHsn8x8VVY=; b=25xXJDRNOwGvZ+l5YXzEMsmgf0
	qUSBT8uEq9hS1QOorzS9X+0pBUh/tRrSfRSA5vOjy3t5R6iWnhCLYDAZC/hm1g/nGRoUnN0H3vHmq
	+GGiw9OOVAs0OhJa1ekjErYCfL8SjVlposdIyEfrxvp9RHQyisnxBKoks9AuNSzzmGbWdnoy9tygh
	1xzNX6wMibrUK9G5Zpkgiqd4ZO1IowWnmrxtTfRc6h1g7ySJzs0kEh47CzTyZFINisYi5EZSGAKmH
	btW9KKKq1ZZOi2uDFcQy/aaVlHAwJG+Du1Elh9TWiB6vH9+ZEbpirYUGByvEOfwgBCeRKIKb3w4ct
	Q6fDPAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96o-00000003j7p-0rui;
	Mon, 15 Dec 2025 13:59:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96m-00000003j6k-2D6l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0A8960156;
	Mon, 15 Dec 2025 13:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE3BC4CEF5;
	Mon, 15 Dec 2025 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807167;
	bh=cfJDm4wYiGitWnngtHNxkthZHqnlQgjzwLU69mBly90=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OdV9YeSsdQmu7/bQcVmD8XlVXOq3y/rwXUDJUbHHLgin2Oo8ssgtvwDFQ9n1/6Fjd
	 AKc1xgWoASmNyybhSks9k6oDzfiiaj8iy8Y9uLuDbpmf0wWJ/nWT5PQfq7XlCfP1rG
	 vae+9jtWehpPHxlLiX4Y46vVMfZoO/+560L0Yhof29O3RYHURNzDsl4EXv/Kcg8e0T
	 TGTXx30ZWIfvhJPusm7xLeuV5/o3G8cthFfb7NGf+jUnd/IBHU9xCI95psT4oTqJjr
	 ZfLJw7hivwWdRJlLyB9oUGBwmFTBl3X36/NFj7HTJr2OR8NbBt7CcHbO1rV4CUB5Rr
	 6QuvKgv7j2haQ==
From: Mark Brown <broonie@kernel.org>
To: frank.li@nxp.com, mkl@pengutronix.de, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 kees@kernel.org, gustavoars@kernel.org, Carlos Song <carlos.song@nxp.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20251203085949.2922166-1-carlos.song@nxp.com>
References: <20251203085949.2922166-1-carlos.song@nxp.com>
Subject: Re: [PATCH v3 0/6] Support ECSPI dynamic burst feature for DMA
 mode
Message-Id: <176580716540.161463.10558713364568567703.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:59:25 +0900
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

On Wed, 03 Dec 2025 16:59:43 +0800, Carlos Song wrote:
> ECSPI has a low throughput because of no dynamic burst support, it
> transfers only one word per frame in DMA mode, causing SCLK stalls
> between words due to BURST_LENGTH updates.
> 
> This patch set is to support ECSPI dynamic burst feature to help improve
> the ECSPI DMA mode performance.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/6] spi: imx: group spi_imx_dma_configure() with spi_imx_dma_transfer()
      commit: c64f62b036aed30626cb30fa82d3ec4a13fa83df
[2/6] spi: imx: introduce helper to clear DMA mode logic
      commit: 5395bb7f7c361310d0f329c8169d2190809b05c1
[3/6] spi: imx: avoid dmaengine_terminate_all() on TX prep failure
      commit: a5f298581d454c5ea77c5fb6f4ee1bff61eb2b2c
[4/6] spi: imx: handle DMA submission errors with dma_submit_error()
      commit: a450c8b77f929f5f9f5236861761a8c5cab22023
[5/6] spi: imx: support dynamic burst length for ECSPI DMA mode
      commit: faa8e404ad8e686cb98c51dc507fdcacfb8020ce
[6/6] spi: imx: enable DMA mode for target operation
      commit: ba9b28652c75b07383e267328f1759195d5430f7

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


