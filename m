Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEECCF2561
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 23:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HZzrGOkt5Jd6HoMYIM1rcm0J3M+lshQLBbiPXsgoLw=; b=Z+VZfZN3cjyZzgA3uYHHjRkCGm
	MZR7pguZ/OTTPDi8wbIRs4ARrCwz1T4TQErOZIY2K0kPsdJVDf42yl9QFH1aw0JSyVwNQ8ro26zQI
	JeWx07frvggkq42iAVmEg3OVx0c6INt2iJ73pgrvl35Vbry0TKfkx279EjQZc3fbgioFcJAMRyRSe
	C9utXpjR/us4T6chRue09mD8BmpL/iNkSjA7w+HI8/4rGs47kkZz+1UbxvOx1qYEJCbJiO7ubo5gt
	X+qBO2/yj+qkhS9sLAb5KlPofhgdBSlBS7ZMiLr8pW5JbXqUI0xilbH3z+PFZsXAV+12hmvSbnCKS
	LOeBSc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUui-00000001Dzv-2k2U;
	Tue, 18 Nov 2025 23:15:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUuh-00000001Dzp-3zHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 23:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D4E7D60155;
	Tue, 18 Nov 2025 23:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE5CC2BC86;
	Tue, 18 Nov 2025 23:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763507706;
	bh=wjOnpeSH0cShWbz8Nnic7ZJoqey1D4fTZlYzuXxqIYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YVXJGIiUstn9db05v8svunLc10N5L2z5f6bUyFCZ3TydbqiOHavDr2NAVBlAJUFZ6
	 5mLv9YkW8Vrc0goXkUN80NS0TUigWpCs6jqJLVdbSOjx9HBOjZiQOEeL5P0+anfch8
	 Yan3SgbHnq3K/WiqOX/jNX1pbefyVjDz4ds6c43yc0Pgnqd/y5XvCtG4+/m9R7wqL3
	 1gh/uYt7J7kvBy54B9QCSUONULewk65ymJ9tcrleY//76eboOi6kZ7iAKwlCygIrXw
	 XmiLOmAghprMkblCqQ6cGQn2XztI7QsR0GReUDuuu0SwQyPaONGam8mH5Udsw3P24D
	 bWXvPJn/UFaSQ==
From: Mark Brown <broonie@kernel.org>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, frank.li@nxp.com, Carlos Song <carlos.song@nxp.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Clark Wang <xiaoning.wang@nxp.com>
In-Reply-To: <20251118065012.1418279-1-carlos.song@nxp.com>
References: <20251118065012.1418279-1-carlos.song@nxp.com>
Subject: Re: [PATCH v3] spi: imx: add 16/32 bits per word support for
 target PIO mode
Message-Id: <176350770375.1411024.1671130391576223645.b4-ty@kernel.org>
Date: Tue, 18 Nov 2025 23:15:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
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

On Tue, 18 Nov 2025 14:50:12 +0800, Carlos Song wrote:
> Enable 16/32 bits per word support for spi-imx target PIO mode.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: imx: add 16/32 bits per word support for target PIO mode
      commit: 4dbb5f6e1b4eed64037d4462977c196acab2af16

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


