Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D0CC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmChifo/Gjz7A2amPSNMWNpWBYkzl0p0o+oaQshPTd4=; b=pYPASaKhiAl1+6fA2QsySNx3cr
	aOPZLVW9hS5VFG5HumnBnTgpMlAb8dXr96pHY5Siji/rIZItv9XeBQG9hp37HbgM7IA40kLaTCmLC
	V3Q9XP6juOsVVudZzQ+D/Om2LlVdjcyMuQnz0TSxxrW3nmHgVdNtc/FqDN7hY7z084f9hzZX/o5mq
	xcE7GAzDuQyXpNoPFb5f0GJ5x/Gnahc3XdOGAVMJZziCBDZmc+mICBBJgBtxlPO747ZbK47Ryp20P
	1kzpqTYhTd/HBxU1+aPUiUXYxqtrfL+2m/09YGSGe4LKbgdBYY2Tuotk/POyAXGd7XSC1kBHWcJ0b
	zfQliIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmX5f-0000000Buzo-2kQj;
	Wed, 22 Jul 2026 13:34:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmX5e-0000000BuzJ-1jMR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:34:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F42343F64;
	Wed, 22 Jul 2026 13:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E72D1F000E9;
	Wed, 22 Jul 2026 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727266;
	bh=jmChifo/Gjz7A2amPSNMWNpWBYkzl0p0o+oaQshPTd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Og/WWq0JkRxmGCMk1czJjwIUBIyaV7DSP2g9GSu4PPv5jW2uoUEhkpH9/HDy+fpT1
	 u3X+rzAxAzXUQVebdfsYB0xJBVK/zJnMHEAusYO3ZEtpqz+vltHolQpRVvgvgbybdq
	 ujnczKmeDOTfb6GpRRi5jzNkBEFkH8qSFh7c42Il/dW2tuMUnml4rs1EhatMZqLrra
	 n5jO+Fi+M8xjPrV3AIY2WJqkH8t05IJBUo74LbYeB9Az+xzpAuXTkWcY16z6iXbdVV
	 aIPXE1A2r9ut0EaphZsmdNkK6zeHmefsz7zk/jzvUOvIWfsL8Bx3+Zf2v9bxWTZTcf
	 o1Pk2fGrBqLMw==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Darren Ye <darren.ye@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
In-Reply-To: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
References: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: preparation for Card capsuling
Message-Id: <178466142199.260430.443154717706779036.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:17:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794; i=broonie@kernel.org;
 h=from:subject:message-id; bh=D9+/Td8Wm7af9ygq2eIXcVzX3ufnwVZvoGMz68HYenI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYMbfaOVThgOx+6ES/VyfJQ5iIHUoKVIxq/bTJ
 Fm8T4tDJWaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamDG3wAKCRAk1otyXVSH
 0AboB/4zC+6rh+8Py9zo8qDAHu1a32ouy1OBRAzdmGIxje4WQhtCxZDCojWuQ6ELClyaE20cJZ4
 Y8pc+Y86IO5vm7eg1bpIf/9nx0Gx580YuQybFUPO6dqMrcg6XwQlqYM21uTb6CG4Mbo0PnUFr8d
 PN9W8OyIrcIe49sxVyOX6+x1owXaTcI2Z3+muAzfMBg7N15CNXxNqDOmaGSZT8fncQPHspKYXg6
 zCvbatu9M4plpp32ePLfSz0ZD2Y1BEOf3CGPbrC31of/RWHKTSrznpP8obJUbs2XFMRU8TzV6WV
 bzwtZ21YUSn9hvcIg1sdgpisB3m1Tpl4s6gUCNS1a2N2ZpAq
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

On Tue, 21 Jul 2026 01:33:21 +0000, Kuninori Morimoto wrote:
> ASoC: mediatek: preparation for Card capsuling
> 
> Hi Mediatek developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup mediatek drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use *dev in mt8192_mt6359_card_set_be_link()
      https://git.kernel.org/broonie/sound/c/315a717c716e
[2/4] ASoC: mediatek: common/mtk-dsp-sof-common: use for_each_card_prelinks()
      https://git.kernel.org/broonie/sound/c/8fd27d490a87
[3/4] ASoC: mediatek: mt8196-nau8825: remove unnecessary declaration
      https://git.kernel.org/broonie/sound/c/a5db24234405
[4/4] ASoC: mediatek: mt8365-mt6357: remove useless assignment
      https://git.kernel.org/broonie/sound/c/7a8073fe03bb

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


