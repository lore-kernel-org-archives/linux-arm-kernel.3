Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD2BCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5fAL6BtxNcOQIXnaFA1UzDQKFUzFJbXS6uRSNGokOs=; b=OaxJbZ1VkuKUq3BofP+62X7E5o
	ol3N3no+ZJ2097ciIWkOJ8AuFsz7a3wg6PAQgFJbo8tu5VYY/X5L64A87qmWwz00llVRIWe9T39yk
	HALwxRc/6JE5WBD8+8+Wwj+Zy68LKx1RVUx7U0X+1gtEUxdGblSg9xNXX44M9cFY8rk3e+98plBmg
	q6h9F5iOSBou6XGM9sjur/Vcyp2T4uIAJwp1D7LQMVa+TlYaqlQcMIu3aCdejxNpP6vxYxaBsLkVa
	aCdTvjEB9qHi+JZOf84x3F8+v4WdLyoltZQzYo+4oa0RIT5RfONnHpFRcb/LXAUa37yupzCmKmQ5r
	mFgVJyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIkw-0000000HRwH-1Te4;
	Thu, 15 Oct 2026 10:32:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIkm-0000000HRtA-2n09
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:32:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C119409E3;
	Thu, 15 Oct 2026 10:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6951F000C4;
	Thu, 15 Oct 2026 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060324;
	bh=g5fAL6BtxNcOQIXnaFA1UzDQKFUzFJbXS6uRSNGokOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eDYch1M1AaI/BrViyUWrp4VT7eVkXE/di0KdS1vbPLmmBsmvXiN2+iZ+woVZOBvwi
	 9gIRThYB+wugKariNCuJ2BHhcRcSUVxFAQGmEfKd4z5MsZ66IAGbW5R6IX/2XJgUS7
	 nzvS20Aa78IcmM9P4vulC1PB8vNmUJyf8R2Dv9SLYM6Y1QkauenQb+4jyxkbq1GHYs
	 hToOtTQFVj0coxS6trUj5r6mLT9Jh9CHQeI/o4C/f5x8Dgcc2+bDAFS7fj4Yteq5Ig
	 pjqFGa1KTGBr2kZjwyZXwNU2WJgcqyTg4yzAQdDMe1nHhRksecxG97ohlH7Z5PtRpi
	 tNz4LicR+GzPQ==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
Message-Id: <179190773817.42298.3099194075465995539.b4-ty@b4>
Date: Tue, 13 Oct 2026 17:08:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nGe6k58I3oJCWTNecGN8SY+3eIvLr3w09JkHMiZvKmo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurJ5/s1776Kugc+Ub+Hb9nmBUXWfR+Hpzqknjkk+MM
 0x9e+R/dpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi/18z/OFaqvVf5r/fzy3i
 l5sdH3vN6r3032/1549Htp7cXtGyc3M7I8PZx16HZPJY1rzQlqn9e6LjQYHNpW0MLKrcZprHnDQ
 Pv+MEAA==
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

On Fri, 02 Oct 2026 11:38:51 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel-i2s: fix clock error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes clock error handling in the Atmel I2S driver by
> propagating errors, using optional clock APIs, and simplifying probe
> error reporting.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: atmel-i2s: fix MCK generator error handling
      https://git.kernel.org/broonie/misc/c/2e2da92de9bf
[2/5] ASoC: atmel-i2s: use optional API for muxclk
      https://git.kernel.org/broonie/misc/c/be952abd69c1
[3/5] ASoC: atmel-i2s: use optional API for gclk
      https://git.kernel.org/broonie/misc/c/b431a055fb76
[4/5] ASoC: atmel-i2s: use dev_err_probe() for pclk errors
      https://git.kernel.org/broonie/misc/c/5421a0a39d43
[5/5] ASoC: atmel-i2s: remove redundant error message
      https://git.kernel.org/broonie/misc/c/c501f9873aca

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


