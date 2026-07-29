Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A298C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdm/4il38IN1nKJeSh1Dv315qQqaUsufDNjASuCwRh8=; b=bnflX9nsOhgrN3Xmgj6932AY6L
	oOMwdVjUGEhtqhW15PgShBBGyfkAPo2criedmbrqpIxeHDoq90+DLcVeJXk10CZHOwt2eIuNAbWMi
	aUKbp2nE7ok39ET/7Zjlq4uAHcIjUNIdzZOteFBijnba7LXV/7qc0TwgY3fRnhWPbpJYMtR0w9M8Y
	RemgXkp0vZH34Syk7AitdxKIezICDJCRqhyKY4c4vxd3ze09o8kh4eBflyGjvxQLbUqEMXRV7J50w
	IHvUCSRMoM1IfMRH369atDJyi4obF0VaVD6uSsWDBUcGFvuOyFQO9DAeIhnp8xPT4pyl5uQC2ent9
	a1n5DcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Hk-00000008Zww-2avs;
	Wed, 29 Jul 2026 16:37:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Hi-00000008ZwS-1xng
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:37:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 717E06001D;
	Wed, 29 Jul 2026 16:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E0F1F000E9;
	Wed, 29 Jul 2026 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785343053;
	bh=bdm/4il38IN1nKJeSh1Dv315qQqaUsufDNjASuCwRh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aVXP+5TcRctt7b5DFU1VxU7S+stOIg8c/uRTbzt72HJm+K5+veaMpNDXeAnl8YVJu
	 3gcz77/440+7/AP2ZeqZcxyAQDMT/lU598vkVZaHo3awWYmbykde7c6xhd3esaOnJ4
	 NDPATFOCVbaiQH6Lud3wn4p11kLceT/Lj76KN4P1Uvtzf4OFmi7MVakLymCoYzUi8g
	 GF7gcSy0GSe5rNsdGy8UGeju8W/c49fvuHZKfBwiGLKO4jav4/KMPfwAPBRh1ZETQA
	 Ap1YqJ3M72XU7MZNiFKnvx2sOzbWj6r4j8Qw0pk+IFEJh01eLMsEnsEntjceuQ7FhU
	 U0MNttEJLd//A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@kernel.org>, 
 phucduc.bui@gmail.com
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Chen Ni <nichen@iscas.ac.cn>, Marcus Cooper <codekipper@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/6] ASoC: sunxi: Simplify error handling
Message-Id: <178533547523.172652.1817134697531789671.b4-ty@b4>
Date: Wed, 29 Jul 2026 15:31:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
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

On Wed, 15 Jul 2026 16:55:19 +0700, phucduc.bui@gmail.com wrote:
> ASoC: sunxi: Simplify error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves probe error handling in the sunxi ASoC drivers.
> It replaces suitable probe error paths with dev_err_probe() to
> simplify the code and handle deferred probe errors consistently.
> It also removes redundant error messages where the called helpers
> already report failures, avoiding duplicate log messages.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/6] ASoC: sunxi: sun4i-codec: Use dev_err_probe() for probe error handling
      https://git.kernel.org/broonie/sound/c/a8023598f3ae
[2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/de6bda2088e4
[3/6] ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe error handling
      https://git.kernel.org/broonie/sound/c/3e2262df8460
[4/6] ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for probe error handling
      https://git.kernel.org/broonie/sound/c/ac95bdb98246
[5/6] ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
      https://git.kernel.org/broonie/sound/c/76a770c30bcd
[6/6] ASoC: sunxi: sun8i-codec-analog: Improve probe error handling
      https://git.kernel.org/broonie/sound/c/bb0d825c8ad9

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


