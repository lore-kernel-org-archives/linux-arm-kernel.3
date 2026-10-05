Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053A2CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h9+yYx9vCpmotG9nojbUu5IAfempJl5vCqPgtuwvFo=; b=od1RfbdJmGRIVZ3hOOhwALjrfX
	Wg2ooWPxAWF+2MbILZeakb3kyjI88zcmpPomrIB4El8Clz4+vrm7lInQ9lTADafyw+xvfHJQYZD04
	HTREldpKRODO7pZxlwoYp79eY7mnZMubSHfs3Xu2etCg0kE1PybGaaA8YsEQXlw5ycNv1zN3pZAW1
	qska92/NymeXsnAv/I3fqe8O6OZzfBZKWSIyNcMGHSv19XsSDXJeBpnDny0Olk+jrI/4yFagPtiLd
	4UnR3ilOYe/JtKv31CTTMh3ZRuWzIprLYdg/jNgVxdoJnc1NuUkyucDDVQu9miPgXknAYfTfOxl3U
	JdjR0LLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0Hp-00000000GoF-1Ic1;
	Tue, 06 Oct 2026 08:12:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0Hn-00000000Go9-3i5v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 08:12:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36573601F1;
	Tue,  6 Oct 2026 08:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16611F000FF;
	Tue,  6 Oct 2026 08:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791274348;
	bh=7h9+yYx9vCpmotG9nojbUu5IAfempJl5vCqPgtuwvFo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KczcJp2NxsC52UaYoca9TicJzMgEWYYjA2x8RRf/B+/Nqqff/wA3UI82zsn0N9NII
	 WF1bJncM83HmEYUBu+6k3GYheW9rWQuc1v0nXYBSJZMEP8+voIe1vVh6qT4y0pkYeX
	 oFzll+FG/JZGUuMcE2x1+YYIk/B+HD3Th2ETUzv34sQwFXzG24ntRUbtqTjC5DaRRC
	 dTT9F7WgbdPP6V39SaGwlDDa9QQeUNpXdBCG8U25Oz1xt+zNi/KcLQmSwovWdoD6Fb
	 2TvOk6M98iCjBwDxop4Gt6W8VhLAQNZPxLtMix98IEYS28U41OqvDYEsyNg/CdI0gd
	 xl9Jp6LP5R+nQ==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Myeonghun Pak <mhun512@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20261004043451.1138613-1-mhun512@gmail.com>
References: <20261004043451.1138613-1-mhun512@gmail.com>
Subject: Re: [PATCH] ASoC: stm: stm32_i2s: request IRQ after regmap
 initialization
Message-Id: <179120716531.150114.2078241476703327218.b4-ty@b4>
Date: Mon, 05 Oct 2026 15:32:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zm+OpLLELwb7hrM2/g1QIO+IVAqsCSLrDqO6ci09Vvs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxK1mb4SogEOteBhnmY/5JBgFwx62J4mRMdXey
 mz9uw+UdYKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasStZgAKCRAk1otyXVSH
 0MUMB/4jH6NwA/h9kOpUpsDoQh+ZlGcm/CH16zFLgmwQooPdrGJSG19NkGw3V6oe6cCaVL+LrAS
 zPmWdqJZh/7SIbRMG9th7EALTxaOu9PMir6NIlvslMG9WLvL68GpRfvkjoM79wIwE+Ke296StJP
 BJ7QiuV/wv2fqE97AuVnJY2jpYk+H7lrJTlVfgyjnc9m1D6DxCtAncnIER08k2c83QeKOugMY11
 sxy/jZZw15HTKi7NCcKqRalzvwf5Ljop+kCKUtHtI9cJcoRwYPsUR3oKgwmxmqKuaNG6VANycEO
 JPUISc/t+z/VMpSj5dMyUgavq9K0CMr3Bt52zS58Qm88Dc7J
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

On Sun, 04 Oct 2026 00:34:51 -0400, Myeonghun Pak wrote:
> ASoC: stm: stm32_i2s: request IRQ after regmap initialization

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: stm: stm32_i2s: request IRQ after regmap initialization
      https://git.kernel.org/broonie/sound/c/1b207c85551f

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


