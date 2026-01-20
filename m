Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C72CA5FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 17:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiagzopqmUz1gS977wswB/TaEecYtBsUAs0WBNtZm2Q=; b=otvFQYy1caJLtj371AEp/Qd7+U
	5OB4nlijXcFNQ6r3sfJ0b/KuwAirFA5V7GKJu2hH5nfdMWQtsYjWxm7ZCHuz0ZV9jCjyQE/MSorhI
	a7Zf7HMjMZu7aVO+RmAGObIHV6s3qhheW+tcKyVpbxdWOVOaLOrUqEzUaHvNwVSUz0iymsYXE72PX
	omo2TFEjlkXKnUy6Jzx2rL+VcZ0ZHF0VTD7SWmJGlwAwoffwnGNNQ52iHmG3zPJ05+OgqURIyRat9
	PzrxcwOgPOVYVXxwMUL3tlGMAPHkRzIC4QKONFZR4h2IGOdjLabKp83cyAuqTWMCJlBBJtxLS4cxe
	RJh72JAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFzq-00000004GvH-3Nnr;
	Tue, 20 Jan 2026 17:58:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFzp-00000004Guh-1VD6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 17:58:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C212460054;
	Tue, 20 Jan 2026 17:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C62C19425;
	Tue, 20 Jan 2026 17:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768931907;
	bh=Nk9VnswpvEWj76/iU42LuuRakmT+FfshH+6D9vCd9hQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fKHzqjAIwjHA7/QZSWBOqz8oUkMNNdeeYWJe7XhItW3eP0AfaR0pQXMsf82N1KrBx
	 CebD3npCjUru2KLNlzU7eKqOvlD0QXZwWzeLuZnuE41Co5vG4bLBL+dECSzpPQV+J0
	 ZC/1AcxnuphKob8FTzr3LpZlmwY0kLBnhFVasD8vm8qX4WKczYPGvvZmbSBUaqfkgF
	 v4O/WHZAvRQrk1JnuL94/rxbxRmNXiMi78hLHRzd6KZIGx9OksQxoRPYo7HAcRy9mm
	 rISMvSAzZT6IKOxxPXmFM1p9bLkMdoptgekLqpCgNKJn5A2d9/gnjMAIDjGE3sYKZ2
	 94ZfTz5q41BlQ==
From: Mark Brown <broonie@kernel.org>
To: Han Xu <han.xu@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260114-xspi-imx952-v1-0-acc60a5a2a9d@nxp.com>
References: <20260114-xspi-imx952-v1-0-acc60a5a2a9d@nxp.com>
Subject: Re: (subset) [PATCH 0/3] Add MT35XU01G SPI NOR flash on
 i.MX952-EVK board
Message-Id: <176893190467.701694.2959767523548654547.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 17:58:24 +0000
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

On Wed, 14 Jan 2026 14:49:44 +0800, Haibo Chen wrote:
> on i.MX952 EVK board, there is MT35XU01G SPI NOR, i.MX952 control
> this nor device through XSPI controller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: nxp,imx94-xspi: add nxp,imx952-xspi
      commit: 3495a5df94a9ad7a8940bcb3ebfda58255f5b952

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


