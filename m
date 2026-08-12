Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46D2C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UWAE3YyH4XKWS1i6AZYOVl03Cz627Sq6U1AvRQjmsE=; b=Hvl0dSWx3jPi6pbiq9Zv+7cdIf
	XO4yA3ehqeKobcwQmGN9c23PlO1QtMnzzvJVunQ9Ixdxnj7e3ClZWCJvWUaJnnmM4YlatwJyVVlht
	DX+haaagTdxQZguXja8qh9j6Jycvs4n0KI34ce87FofurLO1xy34PCDXXcJIDQOFh4lYcUAOaVHRx
	41MLSzPUgiy19YBMH+LMrpzfqyrhlHlTF2PpiOn6VyDT03BLucBN6yHvW9mCN1zfyT4oImBRXpvcV
	CeyUYb1/nxcUUJAM+tEIa67gDWQw5+uV2QYB43TXc+cCn30RVcW6SVtIKRgtV5CRndY3huDlBvWwd
	SfX/BKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBq6-0000000GaUk-0mfu;
	Wed, 12 Aug 2026 16:30:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBq5-0000000GaTt-08q0;
	Wed, 12 Aug 2026 16:30:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C8154087A;
	Wed, 12 Aug 2026 16:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872DC1F000E9;
	Wed, 12 Aug 2026 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786552199;
	bh=6UWAE3YyH4XKWS1i6AZYOVl03Cz627Sq6U1AvRQjmsE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WNhQdhHTGn/2BWrRfPpoU56S8XSJbzUreg0GvIRj2hNGf+zrjdFJIt1CeFWvXq/C6
	 vStJ4AtGZJgfjzDi2nDHpuK30NYEbROkGQZFm2aKy9z9fnfzbu8b+WhT3DYRSLg7zt
	 Ip5b1S12GLpE5z5mGSvshS6GdagcT1jlmfoFYncuqcYPd3u9+Bz3U0gQg2eoEiirI2
	 5/jd2nbK6AsylTrsE4hoAfLRsqMhd9AJcF5+Itj8eTOVVFgv8gEiDNOTVYo8BL2bYZ
	 UCCL0zoKTttdVEkYMbwquf+7e/0hJJA0eufA+yqu+khfmh1OhdUnu3WSrbtgkXmuRy
	 h5w86XCDPwisg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260811042424.66882-1-rosenp@gmail.com>
References: <20260811042424.66882-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8365: use
 devm_platform_ioremap_resource helpers
Message-Id: <178655027936.8393.11056539340382876563.b4-ty@b4>
Date: Wed, 12 Aug 2026 16:57:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wnZ3dwLi2v71HRTnl19XP230YuzHDG2xlcwtpxnEExM=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqfJ+D9IUcUTa8aN8BdfJR70JuBC1nerzCrNVN6
 XUamXYxiz6JATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanyfgwAKCRAk1otyXVSH
 0FkqB/jelPTFXsIwlc/UGyL5aieoa3lN30k90fSwHzywnFlnuY210O1mo+m8hKrYtKS4Cc3iieZ
 mHiwU7BOnjCrOk76enRTLa4e0kSpoecdQQMzP9wUdn458s7wVnX/JWyVw3TAbQtMpjIryegKZWw
 VRuL04lh99OyDVuDPEgLOdIqql19Lh+aVgKZJoX99WsWZjKwxjLtFFI9S+EX0dVg2bKE+Rj21Ns
 BPG9k8GQzLv13WONqLDk3k5PSSXAJN8WBSz20LA90G6x3h5nGdGDdXEsrKZCDi/NylmkZoiotnz
 OJMxpq1fAjqdlvb4GaULRDvvppFfdYCrYGtsVgjZpNmuuPE=
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

On Mon, 10 Aug 2026 21:24:24 -0700, Rosen Penev wrote:
> ASoC: mediatek: mt8365: use devm_platform_ioremap_resource helpers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: mediatek: mt8365: use devm_platform_ioremap_resource helpers
      https://git.kernel.org/broonie/sound/c/3d7fb01b36aa

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


