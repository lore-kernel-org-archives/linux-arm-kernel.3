Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836BCD68B03
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iCRMQgxKEbKmY23mtTxx2j3ocktgqQvefLfPvigazg=; b=jQu9Da9/VjWjcLcYCfqbB0Rlj6
	YE5jclUDYCJcus9Uu3HcczhqLJNfAL2m4tbryI0SfQPnHDqiuzH4D+11MQAuKMx/sddRR97w8FYYj
	dKQ9rbAhuerOeA8Zy9C/WcQkY7dIJUkjGWaBY+zOBdyvcyJPIjqbUViev26OLAb2FmkdBFVsoVx4K
	DocCC0u3Bs0AdCXMQsqeqY5oUWinIwtnXQbnlTGyQdG5xsGd4Nm4E2TLF7KASJ6j2FDfbYzmCYcXS
	+G0L/yD+un92SZbN7WYVgf+5yuv3InRetzm0vHwchHJVBM3cCA/69U0teAlwdrn6gowDdTXcG0bOo
	ZyDoXhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZWJ-00000009zxb-15Jr;
	Thu, 14 Nov 2024 13:04:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZTX-00000009zZ1-49V3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 13:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 218845C5F13;
	Thu, 14 Nov 2024 13:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE6AC4CECD;
	Thu, 14 Nov 2024 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731589291;
	bh=znIi5ZhH0roDBGFwUetxCsbJMCd7PbY3dvLNlBEnHaI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OKVi/7d2yTopEE+eYkrzveGgVu5IM+UsZgON8pbD8HClNlqS+9D0NQviThUXXHawO
	 XJKMPf+csqspkjwsPxUVy+EMQDQQERKICOnyk56M6lR/1HgZl0QNfsCaECyGOHgL9q
	 6MnQD6w01f3EZAZDc7VyCiwOlU7DJH9yhHWC3uGulh+Yw0K2ly5N6iX6OZt4LGNruy
	 LmFWfzP79wsnELTxOeRtad/7ItcT84bolDJ3CJp+AqQEGIFlTYN7hWe4pGIJTSOE6R
	 w1ImRIfTRCqGiN8cCgGj/kwhu/nLEs3f9KqN31tgbFsvjTR5N1Qo4vwlm+k1efSsFb
	 rNr2J33odeT5g==
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jonas Rebmann <jre@pengutronix.de>
Cc: kernel@pengutronix.de, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241113-imx-spi-word-delay-v2-0-2b65b737bf29@pengutronix.de>
References: <20241113-imx-spi-word-delay-v2-0-2b65b737bf29@pengutronix.de>
Subject: Re: [PATCH v2 0/2] spi: imx: support word delay in ecspi
Message-Id: <173158928856.484595.3921699899296506205.b4-ty@kernel.org>
Date: Thu, 14 Nov 2024 13:01:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_050132_109671_EEB82BEE 
X-CRM114-Status: GOOD (  12.98  )
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

On Wed, 13 Nov 2024 13:18:30 +0100, Jonas Rebmann wrote:
> The i.MX SPI controller supports inserting a configurable delay between
> subsequent words, which is needed for some slower devices that couldn't
> keep up otherwise.
> 
> This patch series introduces support for the word delay parameters for
> i.MX51 onwards.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: imx: pass struct spi_transfer to prepare_transfer()
      commit: 7b94af24a7a4d12a76183f1b2f0d363d2c9ced43
[2/2] spi: imx: support word delay
      commit: a3bb4e663df318b232746478e7b191bcf6e3af40

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


