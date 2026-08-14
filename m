Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B15C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4P2Uqal5fCOZ6vxtHXYL6JVblh9CtBcZ4XBZjUo5gMY=; b=he9O7LTdtb2WGtLpsdrnczOVft
	z6Xe6h7t1FAbkCTbSnCWli1skBGda82LXN6shTwBLkOok62r6qTxTxwkyjeEfVaO1TxQ96LMgQL3u
	MPp5xpkoJKxcyX4UbKHwHIZqnRSNX44dYsDmapXnsBfXNVmubOw4aoudf1Tx4Fre+kM/6CzgGRtsl
	mcqIBO9K7cx5H5LKaMAbBjTEtAha0lDrN5oTWJApV3AaglStbjv0Cr7QCsNgI2MomTLcmOKz68BOE
	11yGV7SI4grf2BictZ4CyoKSbl/nL7d/lu1xwKbFHpt+uMO5EktrZ8wuHRQuRQ77npyyArlaEq1qn
	1M5PPcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wutn8-00000002rGm-3yHt;
	Fri, 14 Aug 2026 15:25:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wutn7-00000002rGU-1tcd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 15:25:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6B7D40695;
	Fri, 14 Aug 2026 15:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DF81F000E9;
	Fri, 14 Aug 2026 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786721152;
	bh=4P2Uqal5fCOZ6vxtHXYL6JVblh9CtBcZ4XBZjUo5gMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QC4mY75EU4G55Ix5S2Hl07J7CLkljwyHynEkfOw4K4CHWVAgOj8wm2/6DgRQJrR2M
	 Wv16Eq3SSH9UkNkfGbwzRGAJvmUmbumD53ylD9ntUXOPIZlCt41O1VibgF8BqEe4+r
	 De+9qNCryj+widk2DaIiq6PLA2PaYbFZ9g2XtfhHdHFmAtK3zMQQBTlrYKmWlDZS5C
	 O+zBw8JbVMGaoR6WK5pl6eiRK6ONplM9G3PYv8veAklmQUxSlJ+/8znHd4JkSp962k
	 AZ+jD9GiFIdNuqUMuFnmN4Bx1vLqN8CSkFtxPHOmftOFX1v5Q8T49TJ8ahY/UhX17B
	 doDSXwVjqSyVA==
From: Mark Brown <broonie@kernel.org>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
References: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
Subject: Re: [PATCH 0/5] spi: ma35d1-qspi: Improvements and DTR support
Message-Id: <178671109592.118516.7247309761546749849.b4-ty@b4>
Date: Fri, 14 Aug 2026 13:38:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
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

On Thu, 13 Aug 2026 10:00:20 +0200, Miquel Raynal wrote:
> spi: ma35d1-qspi: Improvements and DTR support
> 
> I am in possession of an MA35D1 NuMaker board. The SPI controller has
> been contributed, but:
> 1- it lacks a DT descriptions [1]
> 2- it does not work with current clock driver [2]
> 3- it can be improved
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/5] spi: ma35d1-qspi: Remove redundant reset operation
      https://git.kernel.org/broonie/spi/c/dc72e9e8cd19
[2/5] spi: ma35d1-qspi: Move speed setting to bus configuration
      https://git.kernel.org/broonie/spi/c/b5671d865ed9
[3/5] spi: ma35d1-qspi: Allow several command bytes
      https://git.kernel.org/broonie/spi/c/99542d244f53
[4/5] spi: ma35d1-qspi: Add DTR support
      https://git.kernel.org/broonie/spi/c/15e9362f6190
[5/5] spi: ma35d1-qspi: Use the existing update helper
      https://git.kernel.org/broonie/spi/c/0730bb35229b

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


