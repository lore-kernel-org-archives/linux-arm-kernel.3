Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20403CF857B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVhl8Gyq4QOxkIjEmZCCvy+cRf4XiSsQXDsvaKQDhks=; b=H69tWHZP8jErkMROOUoGBt1HbY
	LGj+H0XmD+aYbggFWKqrRBw+2hzKjwkLqKvsuxIqqJulmmf3KqQZ0h0GzYKzvUrmbA/kJftA0TDrB
	6ShCZvqrQmkaC2DBsHz7u8sguFgRgHniLofTBMk/RZdMmqz87dUmpc2mCMLbUBZ8k76hzHq9XOH3K
	qldCfuIIBz+SRnf5PwW99r1oyluMOAF11+BUETUbDEAgjRn5N5lTSYeepRy1/XV8ecRaX3ovdEf0j
	hpQkuo/5ZGGYfZ7OzXTtjP9JCq3i6w97F7ToqAfBVkf/b9DA6i1d/xqOMPH22uWCSyThRzav9wYhY
	UdVoUCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM19l-00000006RNO-3bGN;
	Thu, 20 Nov 2025 09:40:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM19e-00000006RM6-06P8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C40860149;
	Thu, 20 Nov 2025 09:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9003BC116B1;
	Thu, 20 Nov 2025 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763631640;
	bh=no0VPyTw7icF2zOkFEwABDlOo/lI3S6IIIyj6ujTktY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sse2LlKdtF2PIUw6SuvG0NQKkrLRzGH6K11yG5mjHxlj0oHOGvxcwPqoH1VOsJ6QB
	 FC6b14pG0ui5Ftdubjz+mn3c+fpHjX1nqKK8y6MJUHgZSHlDnVe5gmxRzNGRo8bSyB
	 UjOnoEEzXOjjq8wPcNqtAjouCSf00Eyoal7/6QSPttPyF7NFveo8WDEeB3jzK7OEah
	 BGleVya59i0NvgLlKLdKxsSGy5gbe1fIQgleum44wNF79NuKj/PK+Bk+p46oX5YBbf
	 +mGMGuzc1bVkEi6GlB5eMwc1rA1VDARCuDf0cX78jDdq2+GTQb5NAMQ1SSLPTy3k4K
	 uY3jgGC9ns0sw==
From: Mark Brown <broonie@kernel.org>
To: a-dutta@ti.com, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20251119152545.2591651-1-s-vadapalli@ti.com>
References: <20251119152545.2591651-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] spi: cadence-quadspi: Fix cqspi_probe() error handling
 for runtime pm
Message-Id: <176363163845.560683.16994547761881991962.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 09:40:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
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

On Wed, 19 Nov 2025 20:53:53 +0530, Siddharth Vadapalli wrote:
> Commit f1eb4e792bb1 ("spi: spi-cadence-quadspi: Enable pm runtime earlier
> to avoid imbalance") relocated code but missed updating the error handling
> path associated with it.
> 
> Prior to the relocation, runtime pm was enabled after the code-block
> associated with 'cqspi_request_mmap_dma()', due to which, the error
> handling for the same didn't require invoking 'pm_runtime_disable()'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: cadence-quadspi: Fix cqspi_probe() error handling for runtime pm
      commit: 295fe8406a357bc0abb901a21d1a554fd4dd1d05

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


