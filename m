Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227A3D59F73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 20:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGbEKml6XocCnMUg9EQMEXmgz35Eu8WlpcAfYzDaqUg=; b=N55VCuUGgfHa2Zq7axJKNGpUhf
	A5iBn63gLKwdpZ12FLjVOQq8MzIcKul7tTXwMJiGCTUUfQKLPwZh1Ow65qg/yl8PF4tZ+LC4fws2l
	c8GS/WG7s970ca3wmbQc/te75jSMvnQriBNa9zRHc/uO/wFk/H2GtbJB7Abnf7qWJ2D9Ysydl3vqt
	MH61VP1DnZocV5ChkcgMiSarX7Yb7Ls3uhjwgnrMFtgjG0rhavodUoxSoTz4lXkkbXzz07rvvUuFs
	C/YPbdh+IZkp8DDwUXZnqkSWJLLcfQY0k8fYcN89VhmADlkhJnLuWG/Ip91T/ffZedzeZ6F8pZj+n
	coQfsuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8msZ-00000004ind-2vrN;
	Wed, 06 Nov 2024 20:43:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mqp-00000004iPt-3za5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 20:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B98DA443FA;
	Wed,  6 Nov 2024 20:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22910C4CECD;
	Wed,  6 Nov 2024 20:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730925722;
	bh=6xZxZRX9pJzYRY60SdV8AMMfsLpXD2gY5VSstB6NEdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sCQjTB3J8wNAnJdCpp6NFeQ5m+qOYAnC7uz0jN9RD9r4ZDEM5gh/gdpwKuh0WnvK6
	 6luotJKNV4CjOiMtEsLhkj1xdFDI+2hOj/SKcdroRHZ5yPedI4t08aQ1IQn/Kk0d48
	 PbqUf56xfLmt8NCXp3G04vXlKBDErRNqvreVJrkCA4UbnJB1tmkNZu5ARxXJ5WoR/J
	 OyqTAvnmQuL2cvVO3+F8dtWcXC8//eOzIk0RSWRcOucgfLl33PGd0w8+3PLNW/9VyB
	 th0cStjpArlhtd6NHCVt8dlcs/U97CigsreexapnYxLfgY6Dg4bXE6KpBAxgoOOgom
	 Mip9aKOsYV4Rw==
From: Mark Brown <broonie@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20241105-asahi-spi-v4-0-d9734f089fc9@jannau.net>
References: <20241105-asahi-spi-v4-0-d9734f089fc9@jannau.net>
Subject: Re: (subset) [PATCH v4 0/3] Apple SPI controller driver
Message-Id: <173092571984.200222.14602988312951678347.b4-ty@kernel.org>
Date: Wed, 06 Nov 2024 20:41:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_124204_092693_FFDBB119 
X-CRM114-Status: GOOD (  15.73  )
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

On Tue, 05 Nov 2024 09:08:28 +0100, Janne Grunau wrote:
> This updated series address the review comments from the original
> submission in 2021 [1]. It adds a new SPI controller driver for Apple
> SoCs and is based on spi-sifive. It has been tested with the generic
> jedec,spi-nor support and with a downstream driver for an Apple specific
> HID over SPI transport.
> 
> As usual, I'm splitting off the MAINTAINERS and DT binding changes.
> We would rather merge the MAINTAINERS change through the Asahi-SoC
> tree to avoid merge conflicts as things trickle upstream, since
> we have other submissions touching that section of the file.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: apple,spi: Add binding for Apple SPI controllers
      (no commit info)
[2/3] spi: apple: Add driver for Apple SPI controller
      commit: c36212b2610d09eb42142beb0d5613c70206c658

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


