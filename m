Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39277C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04EpgVHAKmLsqy8U670jtrllHmdMbW5pVvsjZyQk5Js=; b=q62mveCG8roy8SYwPWInJHHpTt
	W02vHvBPPC4/q0LOVAR0GgiNXX5A3XMvXPmb3EdvjIV8uQyinXKhfwoh0w0enTHLbWqsWreAgJ4Z6
	6JoRDT04FOj4EzMOPnZePlVZoPGzaVQVglEIFoKGFAGD563PpXq55QCYcuriIJopcqEPbri+4+EUO
	I5W4UFU+XYYDx8SfIFPBMIeQtbeGdXpvlKmX/mr24BNj4uezJjfl6BUGKtqDZnbvwYP1hOomWWeL9
	2agn5bfBAuemxR8e4lKn1x+F0Ar2RTA3sxv+d/UsZ0BqQ5ptbTScWGGqFWAdR0CAIKqzJ/wG9XGrv
	ZCjDiJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgi9v-0000000CRlp-32Mp;
	Mon, 06 Jul 2026 12:10:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgi9u-0000000CRlh-3GBj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 12:10:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C0624388A;
	Mon,  6 Jul 2026 12:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7A11F000E9;
	Mon,  6 Jul 2026 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783339846;
	bh=04EpgVHAKmLsqy8U670jtrllHmdMbW5pVvsjZyQk5Js=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=dY8O76dncaLM4LujFA9nTO3lxVuAS6S7riaJozcpXXixfqmj6F7phYCgMehhqZTRS
	 Apzc4/ZXlC5pFf4Itzg2M0MVL+6gEaN7uZJub+fKkJg+mg4cYafBsfd+C1Kl2ybB5l
	 yrK6s1E6VMopBHOZ7fx7UwUKNPCi/WTaTkT3c5tTLBVRw7ePNJkZeuduvQciApTMw9
	 DC0dWxVtDQCg7jnTiav4bOLMyvETM6ZEKEUcRJJKm0r5tcBaQ0PcDgux249vYrKvgP
	 dEO+4tlRK6p6/R4teWMnQj3aDROWuWAD6j4JLbX3es1JZf5vKShBd89sEkNrI/dVjL
	 nJ/F8QW4yFVfA==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87qzlteuae.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzlteuae.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [RFC][PATCH] ASoC: mediatek: mt8365-mt6357: tidyup mach_priv
Message-Id: <178333979296.57168.10784886073653885308.b4-ty@b4>
Date: Mon, 06 Jul 2026 13:09:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IPLljQVD+rnby4poPgNZ2mUlWThqeISX6fqgKm83GkA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS5tDPRhV3UHQeENxvLgZXsLx22VPX8mBCzPeq
 Lsp7jIIINyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakubQwAKCRAk1otyXVSH
 0MfCB/9taYaioPJqZCdfFqG9Qf8O3t/TVNoUud+YSorODXje93qU8CuKwhEfVsqsgRydb7BEkZb
 JLxkFUow6DOk4Qm44hX2Z3zTHOqSE19UncCFNyYGfT6kLgDpnl422qtOSK7XfMEBAitbR4e7EpS
 q2EF4WNVc+X+5s4TqHCoqtHkSYDuqL4xSZ3m0Ilk7DyvWpP7cjK4be84K7iXn+Q7x24eiAM5gdg
 WzAJo4UsOJoaHjHf/KJ3LMJjVQCeO7+YfFcYU4UHpOV4YFhn51wb5nEf2iwQDVd1xzKzX1I3s6v
 kucqaVA5AFaFdQUDc48a0QgLVHrdvwnusBbswU6dIAe9y/DT
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

On Fri, 26 Jun 2026 05:37:45 +0000, Kuninori Morimoto wrote:
> ASoC: mediatek: mt8365-mt6357: tidyup mach_priv

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: mediatek: mt8365-mt6357: tidyup mach_priv
      https://git.kernel.org/broonie/sound/c/8aa079a408d0

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


