Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ACBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBoAF+t2oJZ5EdffaS0tkno992Btqbmx+JkLc+oX7vA=; b=3gNHSriyX00mqK6Z1UxIJfFnlw
	7o+Gl3J+NW2y7Ebyc90DvpDDGeRicMkqLPLSKfxeRU+rz7BuIG7SD97an0GUDb+DeuGC1VvA4prkX
	IdeqCty8rSyOsHf2W0b6hfH+PXzgt9hIcDrPzw6QpPSqOLgbKcsRGFTshrjW0ScHrzNrlqke+brMB
	1fjz46cfRDbyIWv/JpCk0O1bHiZnh+5PGBNYiL5pwoGSA+5+yO5LshLapP1FPsKd71z4oNkf1kC52
	ZKtcgDleT7S/mr5UiFdPiI0kD9BSu5wpaQobAt16GzX4SwkkiHoPoYBlAlzcDOTx45SdL5czX/rTN
	FqaWO+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzw5-0000000BWyS-2raM;
	Tue, 10 Dec 2024 13:05:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzrD-0000000BVfb-3lyw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:00:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2DAB5C60E8;
	Tue, 10 Dec 2024 13:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E07C4CEDF;
	Tue, 10 Dec 2024 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733835655;
	bh=w/ontMIclNaG+gytLgn0uR87w5kq+wV6ujyQIHeHOXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GdS6iRorN0uTR2iyLNz7xg2WFhwhII4g+dxImwCBRgvXdcsk3ReyjvmpppPyi1D0y
	 k1HZ4yBNDHg/0Xc4OqQQvcrpDlJUkAVcJQcC+xC+vCyVC0AG6Fz7jZTkB5/p2OW5GL
	 IrF278DKexZrhvd5JzE7JZCyL01vBXim90xhq8lYXG61HmwMWe8f6eikshb8LouQwB
	 g+1XVFRGgdOv/YW9EuJIw6yX4bg4UeWFbvBLwFBHhZf7guU4I7IFNxYPhfVOpx6V/Z
	 wdZ8QN4JxCpVwuG8aIra/kdR2fKiPejHO5ZQ7LOPrVNOH8bjPY8g955t/f9/F0VA4y
	 Rw6FRaStz7YxQ==
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Stefan Wahren <wahrenst@gmx.net>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241209111316.4767-1-wahrenst@gmx.net>
References: <20241209111316.4767-1-wahrenst@gmx.net>
Subject: Re: [PATCH] spi: mxs: support effective_speed_hz
Message-Id: <173383565340.34030.7139873956151908430.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:00:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050055_982377_827E2D59 
X-CRM114-Status: GOOD (  10.72  )
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

On Mon, 09 Dec 2024 12:13:16 +0100, Stefan Wahren wrote:
> Setting spi_transfer->effective_speed_hz in transfer_one_message so that
> SPI client driver can use it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mxs: support effective_speed_hz
      commit: a17162f0b2dc97aa2dedfde8a7226fb9b5210534

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


