Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431ACC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpmBQVIrlWgpZZOZVynm/vpDFkSUAecYOIex6AMP6p8=; b=fTE/Ur7g7LHu6LPVIpGvUyr94g
	lP8d6e0HLoXxnCfbwj8FTW3UN14OS1v2H/irHcboxfcZL5hwYRzXo79++MQdDUlnAZkKChVd0g8tQ
	OHfWePlqSTXNhswQw/T3EMPESYqf3O/fXB0GkMKMZqlnk9GeByiR70PLXU1NbEDwoXiaK+jhlYWTg
	MFkCdYAMDXubRdISXDd9yrwK/9SLQpcRbum0rtCsz7DYUwqrlFBWxHynQmfyocb4GkGLOZjO2GWtC
	PphcnqGMsHnRquC4LxShBD+K+9wTPryP3e33l0/MSrs8bkkVEfbio91gQBNtorp117OZOxBoYDehH
	Pdb/TyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx8-00000000FjK-0FKt;
	Tue, 25 Feb 2025 16:38:38 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmv97-0000000HOzw-35s4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:38:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53F586125E;
	Tue, 25 Feb 2025 13:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFC8C4CEDD;
	Tue, 25 Feb 2025 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740490728;
	bh=bJ3NHtM9/m9NUKbxneBtDPd7ROoBbzlkPBC3/NbsPqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aozRsqQcxJytbSXfak4vSwnCDDCrH7+LkABfWILugEivMpJONUQtuia7FcMU8ndmB
	 ixDXHiPlBQ4imWw2fDG5LoPr4IbhUs5AzHEElp97IYpQ0IBER+Jh8svQqtYiAwiRT7
	 o8g57BzTJFhg98uon5ILu1KB2iyDsYSpGbOGOUaOyvoCJjn8AiDf51xSlkNOSw5rJx
	 ziBEaGtdpGsEN5mLIcn+xsYCp6xOum4DXB+8HY1yOVHq/u/8+iG6nrqg7gTafImNMj
	 oNNrJispyfCYpK8xD5KnUDEsnwGERpHLf/y0XGuW8xzFSSCStG0dUwKg3GMrNEdv7c
	 EfJDLWyD7pKVw==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250222225925.539840-2-thorsten.blum@linux.dev>
References: <20250222225925.539840-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: atmel: atmel-classd: Use str_enabled_disabled()
 helper
Message-Id: <174049072628.42497.15584165793923327558.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 13:38:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
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

On Sat, 22 Feb 2025 23:59:25 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: atmel-classd: Use str_enabled_disabled() helper
      commit: 88e09306b7e0f8a9e9f9c729ac13ccd11ed9679d

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


