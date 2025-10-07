Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64489CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQpP+/DkkvpxRyAQnMh9FvDGMelKLnnkPfd9ErgObE0=; b=pNW9xGr+ViCWDQBUj9gMTmQptb
	mJibhaRcEoAy4YkD28NkcsJ9hWkb3siBr4TcIcCJ8AzI0wr/flyLmOHEyGl7FAjYnx9/87gYh4YJG
	TovPmwCnjRVASdp/Vlm0N4qqpFFHcfaRPvdYM6lrvubmX99uVvX2bg3wao5z6blTLvdkfedaMGfZA
	WpDwT/ei0zz2fkmbqAfxL57BUsYUob5dLQ5LGxkPlcudqQffigdyu0nuxHsZ/BaD5oP8HU1wIq8HC
	VHLf0oV2QwAk4cugrBGZ9Y7QYYF6MShxEfBGKoBCNWWcX1kRqlmM3/OnkDaK4UI6pbW3XgJLJdtMX
	abmmiFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6B5x-00000002SN1-1XG1;
	Tue, 07 Oct 2025 17:03:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6B5v-00000002SMn-18oS;
	Tue, 07 Oct 2025 17:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 955F461D22;
	Tue,  7 Oct 2025 17:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9B5C4CEF7;
	Tue,  7 Oct 2025 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759856602;
	bh=/pSQNfp/NoybqW59QlXQrWZnpCKQXoNs3vgFg+pkIaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kJ0EwbfZh6hA4LkGyNhay0l2/t3gpMYISrJvJOXSwiCYtGyauST1J4a8Fh2rmVqQp
	 wTbaUcG0VjlIphJVstEii87typHLD4ne3Jj/sMTxos/potZRu2dr6bm+jhFxNQhamm
	 1cANhRm63DawqftB+Hz2DjK6gmvslPkzm3xawjzUxcw37tEIMFEUuG1hLW5NH+Qt8+
	 RY8ZQUNMDpgEMJnkPi0WZcmoL50ra6rbB46E3ChCiTckzfBgYV90AzfUra1Jj3CeR8
	 I1WAfwHvnDFvNLdqt8rGRJUEoCoQyUrZMR3UTZWH68SaDS8IosFAFJSCgemR4U/U8D
	 DgKIlQk8gBM8w==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251007-fix-i2s-polarity-v1-1-86704d9cda10@baylibre.com>
References: <20251007-fix-i2s-polarity-v1-1-86704d9cda10@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
Message-Id: <175985659977.122025.13786700969734596641.b4-ty@kernel.org>
Date: Tue, 07 Oct 2025 18:03:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
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

On Tue, 07 Oct 2025 00:12:19 +0200, Valerio Setti wrote:
> According to I2S specs audio data is sampled on the rising edge of the
> clock and it can change on the falling one. When operating in normal mode
> this SoC behaves the opposite so a clock polarity inversion is required
> in this case.
> 
> This was tested on an OdroidC2 (Amlogic S905 SoC) board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
      commit: 4c4ed5e073a923fb3323022e1131cb51ad8df7a0

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


