Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386E6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPwb5P2Z/xOuau2WzM1UHakkCwj8UNGvANOk2/0DZwg=; b=ZNfv+7zvUbsAGghZl2qbX7kBF0
	VTmQ+O0JmZ9dkWz2n7FvlDxnvgf1yvwYdPK2TSPUh3MQVLE+R8/tRp9Kq+bG19Mxy/kgfivWW3089
	b5suqpp/hf1BXunaCoUOmGyH0ahdlzKUQouR069I+OOI/+dWmpKS8T9l5T9gFdvJ0RpEKX060X8JD
	Ozkm7e25YWbMLLyJJMa9A+PPoRQ18QIYNlapQJ4RBY4IN9rSPIrJ5TiTru8B6F49452UaIdNjhCIB
	V/MeXSNaSCw3TuW0+akhURwwdnfzV2GQKcEbqmDGYNNftNpuONkxxyWO53MELjAZrgpSBWl9hDxRt
	z/zhOReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9oH-0000000GPl2-2Nnj;
	Thu, 06 Nov 2025 23:54:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9oG-0000000GPkj-2uAC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23AFA601A5;
	Thu,  6 Nov 2025 23:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FCCC113D0;
	Thu,  6 Nov 2025 23:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762473271;
	bh=rL5lonvJ+6XWhO7NtUniCQhRINHtr54lMYQRxenrnUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LXSlAOXuzj8yYF5vRIyjoo32M8xD4WpMBiQw3/y2dcSNUfQBQWJyIEnkzsXHAoGvU
	 vwsMbYsiSFvqFmC06vYCoMjLA1GqOangYFDp5Ul+p24FmeAr7o8oDyCauT4UF5yOwC
	 Sw32h0l/wdv2xuZ2XTTxgps28KKohElsQfIak3qUIz0+aqdtbuUoc2KDRwFz674LCK
	 8QFpNVo9e20SfZAQ9KvKfp1+yjEuFmci37uJJA5IiiohmMeaCigy0xbBLcRkmjyVTf
	 M2I9yCCJTLmSIfjqw5ZzJC8PBvvXG+uF2dPtKshfKygalyJI163LREp9ecdzxdGQ+Q
	 Schr4wgHirzJQ==
From: Mark Brown <broonie@kernel.org>
To: frank.li@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251024055211.408440-1-carlos.song@nxp.com>
References: <20251024055211.408440-1-carlos.song@nxp.com>
Subject: Re: [PATCH] spi: imx: remove CLK calculation and check for target
 mode
Message-Id: <176247326802.2483158.5597170860062557920.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 23:54:28 +0000
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

On Fri, 24 Oct 2025 13:52:11 +0800, carlos.song@nxp.com wrote:
> In target mode, the clock signal is controlled by the master. Target does
> not need to check, calculate and configure the clock frequency division.
> The target can directly use the root clock to sample the SCL signal.
> 
> Therefore, remove check, calculation and frequency division function of
> the clock for target mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: imx: remove CLK calculation and check for target mode
      commit: 55d03b5b5bdd04daf9a35ce49db18d8bb488dffb

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


