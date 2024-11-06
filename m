Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0D6D59F73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 20:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbdU6cNiXd22FmxLC90fw+xLrqqoSW6ZVbk3Iji2kRI=; b=oEuxDvyFJEjPIwOVXJel3T3RZ9
	4rUXe9BmbBXH5aaZHGVWuOr3mmS++a5w+q8VtjUzKlsdxj0XtQvlO7KXCzpnPtx6r8DWeCX4W5TKZ
	6WD8lMw3FmMsyCligZfleH5pGRjN2lclEHBIkv+pH1TdgP/9+4ATc3EQ8Y5TLXgPObPA1MLHl/Fdi
	JrUOKxI2W2yw+bG4EL+vCm5P1aFj4ZctEq70d7ivgBLs/NBUKdJ9ZlE9Kezir+b32YZFQH1ioUr7E
	4Z41Uw3nGcf2Iu7IEg4K+e0V3FnaXm4GmU7/URADn3b/TC50BovF1ku+wBM4wBJjNyiAAJbxHijcF
	2mg7VkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8muG-00000004j80-0bgd;
	Wed, 06 Nov 2024 20:45:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mqt-00000004iQN-3t1V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 20:42:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 535C1A4443C;
	Wed,  6 Nov 2024 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37867C4CED4;
	Wed,  6 Nov 2024 20:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730925726;
	bh=MyX3vKLdgoNWgBlUZe2r+I4QjJHT+W6zplpfpZ/F1mI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eXtGBP3RqH+IvKcwi1Qkk5Nw4s/pFWZCpftB/e9XRwrImO+4M6CBJ/1FLRHVamJiw
	 PYfL5Cv+2PD+Lx/L0ZDxEM+WaHbjUmpykx1KtaojE3Mgq+Q0rUZ/0NX9gYBvkOFILR
	 pZb4RiAVTmbul7B1gdaQI0KY9DXdbEa+hQLTUStC/ZDBVaKf5TAiXxZgj5sTt9V3DR
	 FVe7EdJM9EUUvdpHZWm0IbBKzWnZOukok6no1tk7CzST35iECYGHIPueU/3zgPEZam
	 NQdbe23z/9fiv+ShgEUNohUnq4uWnYOBk9SP06edwf8wEs1Drl7WetqrDDGHzxfld1
	 xfklhGblZVLaw==
From: Mark Brown <broonie@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20241106-asahi-spi-v5-0-e81a4f3a8e19@jannau.net>
References: <20241106-asahi-spi-v5-0-e81a4f3a8e19@jannau.net>
Subject: Re: (subset) [PATCH v5 0/3] Apple SPI controller driver
Message-Id: <173092572295.200222.12076711239744365643.b4-ty@kernel.org>
Date: Wed, 06 Nov 2024 20:42:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_124208_068432_CB972B18 
X-CRM114-Status: GOOD (  15.86  )
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

On Wed, 06 Nov 2024 08:53:59 +0100, Janne Grunau wrote:
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

[1/3] spi: dt-bindings: apple,spi: Add binding for Apple SPI controllers
      commit: 18096d339206de6cdb48500b2c3ad5ad0b48aad7
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


