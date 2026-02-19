Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA3AE9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1A+dNBxguBbn5VJh68NDqx86KEby+IrtcR9pMN3bxI=; b=dqK7i1CtenwVol59DuLLKxNK3z
	zwz9WnaLQsptNwiN9WTW+Ke3Aq5rg8TzdLcvLD/23vnJZXEcd4MpW8431Ut8rz03qgTMNG1HjfO+r
	762uBOxSV5uecbZMxYXseEJQJlJcO/WQLw+NvRzwCHb03Z0bQSsr4lqmROhyUZinqYK2VxDhzAs7n
	9QKFJ//3tzEojMEcbjbnzuilwhmTnSm0si1d4VLZRqh9IN2zhs5n1J39alKgC2WFDSK/KyzKvgyGC
	bBLfZMPiBicuHJ/KcVt95Vdmr6X4+ipv+G6QM/gUPQ51RuTFy8I1hNeSNY4XdS7lm/lnTAEpRttbv
	EiUBW/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt64v-0000000BZKf-2aOW;
	Thu, 19 Feb 2026 15:36:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt64u-0000000BZKT-20J9;
	Thu, 19 Feb 2026 15:36:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56DBB60054;
	Thu, 19 Feb 2026 15:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3F1C4CEF7;
	Thu, 19 Feb 2026 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771515390;
	bh=dnerQRAkWguoqhDbE6xYkx4ycJCWKMZ2dF+v2bxWQ8o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kSSRDVrx1HY5u5gxDKR1bty/30CCkC3qhwWpzo+55b9o1gmyqq4DNJFvqGBLxJ+cP
	 l9ah4CAIA4eQ7bLMap8fzdfdFqDfCXB5VzVu13nJWiE6sYvvGn/bKy3lV1KFgn0K3P
	 3H/6VNr0av9PHl+GokoPwX/mCBWPcMQSKkl6LOCRkH/4ZX9bpICXH+cd8GsUyVxndX
	 1Sw5NNX+o4PkaDq25lnTSh3g9OdsPFDiBipolic/gHGsxYBic7AU6jJhdDjUQ8oeNX
	 QHE7RoD/uhIfAY0iTvJP62xa2yCJVr/41JnOIsG5azjQhky2z4WXJURGGZousPXRAa
	 M87wcMnBoC3Mw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260218201834.924358-1-detlev.casanova@collabora.com>
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not
 provided by set_sysclk
Message-Id: <177151538730.130550.12673698490748954577.b4-ty@kernel.org>
Date: Thu, 19 Feb 2026 15:36:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Wed, 18 Feb 2026 15:18:34 -0500, Detlev Casanova wrote:
> Drivers will not always call set_sysclk() for all clocks, especially when
> default mclk-fs can be used.
> When that is the case, use the clock rate set in the params multiplied by the
> default mclk-fs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s-tdm: Use param rate if not provided by set_sysclk
      commit: 0783052534f547f8f201dd4554b1df9f1f8615b5

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


