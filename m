Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3268D6ACC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEOL0ptYLtxEqIdAC+9tZlm8gvCy8mQhR6WGhJ022Z0=; b=WJy7wl0H3gjpN1rmzOBZSWJNee
	KAF0vIcElC/0ASf2piBB3TOeD7KMf5MT2PScFRTuIJR9ztNNeKVBpg2OPdY9tORTfkIs7LAR0uHFA
	z5/TWiV9xW15kPheLGD/8RtYu8F4iKSIZaS+yQnc5XwDEuXW2l/JqB8cxlzTEizWDBN/Rt499PNgK
	Lo09vavVHB0gZcJruGijqx+y2eM8DQBgf98hqmZUH6jo2iLWUAx0epQY809zjPv2c0fCBnfIeDu7p
	+AcEwwYpff+npOiuQFwEtCt878ifU3rdWPtN7RVAjt2cPGddCTfLQA/D1SpIExaH15S5uviR1BYoY
	yRRsXmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGw4-0000000D6oI-2ta3;
	Wed, 27 Nov 2024 12:14:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGv5-0000000D6bB-2hES;
	Wed, 27 Nov 2024 12:13:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAE935C32B5;
	Wed, 27 Nov 2024 12:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C632C4CED2;
	Wed, 27 Nov 2024 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732709602;
	bh=VoLkH65bL3SCOolWXPTIPl3bQkL5q34kt5m/3L5PBvE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eai+IyX2DHv87NXUhGl5Th2caqMIBIpxVJOrR8c1aFjoeQNCTmBD51LLFMkO+R5ns
	 Nn7fYNhEWkmKjG9mm6WAEJOqceJmADIRtmbQuszuISP9ytmlJ3Dt3ZURtd4C40f+/g
	 jYvcoB/sof8oksETHdCT+hak+YCgehTgmAaHcZbw5awtLoWn7lPq7yY5ufdoliBlcX
	 SlEa3NBpQ3M14MoxixNOQlUDHuWTK3kOCKMU66r9Xsbh/oYJZtARN3iUP+8YSIw8Zc
	 rAENWa3Pnv8tQtMP7VUWPFsO4ZL9thlAGpq+Q04avat5+34r9wAtyMivjOACi0FXgT
	 xHFJ6tCgtr4SA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
References: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: Check num_codecs is not zero to avoid
 panic during probe
Message-Id: <173270960024.162310.7545183344614439367.b4-ty@kernel.org>
Date: Wed, 27 Nov 2024 12:13:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_041323_722720_4775795E 
X-CRM114-Status: GOOD (  12.25  )
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

On Tue, 26 Nov 2024 15:09:43 -0500, Nícolas F. R. A. Prado wrote:
> Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
> Component via COMP_DUMMY()"), COMP_DUMMY() became an array with zero
> length, and only gets populated with the dummy struct after the card is
> registered. Since the sound card driver's probe happens before the card
> registration, accessing any of the members of a dummy component during
> probe will result in undefined behavior.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Check num_codecs is not zero to avoid panic during probe
      commit: 2f2020327cc8561d7c520d2f2d9acea84fa7b3a3

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


