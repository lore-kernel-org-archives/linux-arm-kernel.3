Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C96CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYftf/Su62EUrYUf6blYPGhehrDzs/z2OLT9geCyA8k=; b=meU2vXkXrETWTB3nc4B7rksWWR
	DGtnqVPwMMD61A32VSYOlY6IaCAxS3JoLHVlHX33adx4VMkf5UQOP38lfbIJVJGa73JH717tOb4WX
	jpuwTz12TvmWg8oBmE4S7NufyBmfVhSPvMQxGtQrxnouplheJQ0z2Ey24TPWTU0mn7ru9UhURmZop
	TG9i7/pRA9QpFAN7bRbKe4CqJkf2kDi3ZDeqGjSngkE6PLKaT1S3Yi5QzrsxESwvGkEdyNYAdZVxk
	73hbKU9s1LGeMHKS7Z2ermxBerM/l0DsbVLqkCGqklyzbiX3hiaFLnOyx/a38RYTEYMyJf5CsJFkO
	ZbtiRErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiKt-00000003iBp-2saj;
	Thu, 08 Oct 2026 07:14:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiKr-00000003iBO-2Knu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:14:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 922CA601DB;
	Thu,  8 Oct 2026 07:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8D41F000FF;
	Thu,  8 Oct 2026 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443676;
	bh=fYftf/Su62EUrYUf6blYPGhehrDzs/z2OLT9geCyA8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hhbNkvpuOPygjgYsFStv9E0RgIjhNCYJwUEu/8GYXgVNf1UPp+cxBC5dJ6Mc09LAh
	 l27Uzx3XKns+0nsbuOK6mPS2q2iGcile21+ki9LTGc3zDrJU74cQB8CTYlFXQ1bZLL
	 SsRhF2LcLCA+RTm7WKGvLW5Kxv9xeLB2FNLf/f2Sy0O0C590W0nZUMAtFJpkIsPHxi
	 HPYFMqCK6ku4aaq3NJvsvaWF3CZV8LhAQjfMV3Tuy53hJSB4FVDtGsdJ7ePODzrdyM
	 6Nb038rtu4ahglDWK72ExH9XnIq1J2rzKSxiKU/bVx/MVjZbhaKPHY++gcqiJOEX0S
	 /7xqm1nBJiRuw==
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, 
 Olliver Schinagl <o.schinagl@ultimaker.com>, 
 Jonas Rebmann <jre@pengutronix.de>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Marc Kleine-Budde <mkl@pengutronix.de>, 
 Tobias Schramm <t.schramm@manjaro.org>
In-Reply-To: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
References: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
Subject: Re: [PATCH v3 0/6] spi: spi-sun4i: assorted fixes
Message-Id: <179130066333.150114.1591753111573299755.b4-ty@b4>
Date: Tue, 06 Oct 2026 17:31:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2091; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Al8+VIKGWcxGhYyRaeMpCro0EDWhQL2GdHl//h0s4MQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0LUIXMhyrvOstkVy0FxPa1zNc8ZuG7T2x7tb
 1y74cN4wp+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdC1AAKCRAk1otyXVSH
 0M35B/4kUlR7nD0lYrEwWvVkYsWDVwvaKgRLOc2ITC8JrxazDJ86Vtclvy/EIT6tBMMdiAQcAeE
 PgrkLGNeICYjJw6j2kw3hvAthfGmpslblAEcWtpPc1KIS687D6HzL5C6vJf7hAJ2k84iXyunNN9
 jH/3CwFRvxPzqpp3h7wOUhaCgEfE2wQlM7szs2yJ/jm46v9ZlICntQuSJKuSUTsb6D3/QF3h8rw
 g0NsyYZHZ6ZWf3KfBD4sfVOYuWsNHaB0CFxfQUx8miVE8hegvWg4q4az80NTt09bVa/ofbvIoXh
 SeGUE3nWL8cGNm1i97WrLnTZ3TVh/yc7koKpVkZrPUr2d9JR
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

On Mon, 14 Sep 2026 17:35:54 +0200, Jonas Rebmann wrote:
> spi: spi-sun4i: assorted fixes
> 
> This is a series of patches for the spi-sun4i driver, some of which have
> been sitting around for a while.
> 
> 1-4 are fixes and 5 is a small patch that introduces reporting of the
> effective SPI speed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/6] spi: spi-sun4i: sun4i_spi_transfer_one(): fix transfers for SUN4I_FIFO_DEPTH
      https://git.kernel.org/broonie/spi/c/f3ce7a3ca82b
[2/6] spi: spi-sun4i: sun4i_spi_fill_fifo(): always apply A10 FIFO fill level workaround
      https://git.kernel.org/broonie/spi/c/ee109e2bbea0
[3/6] spi: spi-sun4i: sun4i_spi_transfer_one(): fix setting of clock rate
      https://git.kernel.org/broonie/spi/c/672ba6d88324
[4/6] spi: spi-sun4i: sun4i_spi_handler(): fix race condition between transfer completion and RX FIFO interrupt
      https://git.kernel.org/broonie/spi/c/b8f09251da78
[5/6] spi: spi-sun4i: sun4i_spi_transfer_one(): add error handling at clock setup
      https://git.kernel.org/broonie/spi/c/a3df049084c7
[6/6] spi: spi-sun4i: sun4i_spi_transfer_one(): report effectively used speed_hz of transfer
      https://git.kernel.org/broonie/spi/c/b42ff8dc7e54

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


