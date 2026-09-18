Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DBBC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Awg67cxHl18a2D/zvjxAJGydZiXsMD2cX9Cd0uol1eY=; b=HKvG7/YrEjx1WMNtjGIz04Z6fO
	qH9GtVarJWIDgQdrRJKSrOAZHgwPoQjbqg8iYFJJSd9jFDfdgF9bfAJwY6aiH9g3HB0vp4KCZsQwE
	CL7XPLtDDj63WzI0XC6GGBKrJiHLWf95nVUf0mUDlQgbGT2wWXqVuZ3XDrD1YXsCVT9mIKOMdl93Q
	LSkUUaoJ7RFRHuk1W7tWBaulB8Cbh8BOJHyR5sGBT00J5L3pM+mCykJiSR0phzIe7NqJkLlU3T1Fc
	vtw9ziwkunKF0GiFcvOigrPX93EjqFPiS0h/I7xV7Wu+eIeS1jlzvtb4XFVCgP9qE1kQ+ySCiAVCg
	OcUz0x3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rBc-0000000G7XW-2pY4;
	Sat, 19 Sep 2026 09:16:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rBb-0000000G7XN-2d7s;
	Sat, 19 Sep 2026 09:16:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 302396020C;
	Sat, 19 Sep 2026 09:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11DF1F00898;
	Sat, 19 Sep 2026 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789809401;
	bh=Awg67cxHl18a2D/zvjxAJGydZiXsMD2cX9Cd0uol1eY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=D6bTLqfUcwgwHXNN2m8iiQmju3ywMCqfUeA8Pxi83jxqjKXay6zBuctYKlYwrKJhA
	 Ooni5TFUpqMA9Sb5sSEvvwXHNLyzfJ+cZ5X72yu3cv7wwZESuuqCEFd+t4ibZ10NEO
	 Bu+UJRtBBMGOFdgZKofYdY0rDHQZ/sO1WLtuE/S27fEqXuJ92zZQDexgbIbStF27kY
	 cmolrPno6YL/0ofzxDFVaANbY87g1ti0ihrIJobilNiO8imtHCDFEBC3eR/CfOFC3h
	 qJTCN8JcY1idmW2VjWjUN3TsfcRgkjOuRPPq3d7Ras1fjmcBqjpBEL1g0swX+iL2Eo
	 xYouV74JzK4KA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Darren Ye <darren.ye@mediatek.com>, 
 Rosen Penev <rosenp@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
Message-Id: <178976668737.1863384.7459518219395606759.b4-ty@b4>
Date: Fri, 18 Sep 2026 23:24:47 +0200
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

On Tue, 08 Sep 2026 11:04:42 +0200, Christian Marangi wrote:
> ASoC: Add support for Airoha AN7581
> 
> Add all the patch and documentation to support Airoha AN7581
> sound driver.
> 
> The card follows similar implementation with Mediatek with
> the codec present on i2c but with a simplified implementation
> register wise and additional frequency supported.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
      https://git.kernel.org/broonie/sound/c/78da571393da
[2/5] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
      https://git.kernel.org/broonie/sound/c/8fcf0497e6da
[3/5] ASoC: mediatek: common: permit to provide dedicated regmap for irq
      https://git.kernel.org/broonie/sound/c/b49799e40313
[4/5] ASoC: airoha: Add AFE driver for Airoha AN7581
      https://git.kernel.org/broonie/sound/c/4974ffa0d6c2
[5/5] ASoC: airoha: Add machine driver for Airoha AN7581
      https://git.kernel.org/broonie/sound/c/272d6e51bc1f

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


