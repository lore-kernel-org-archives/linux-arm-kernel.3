Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB474CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bndECe7tVksSz5MoZ2EIWK0CTKacoiB1e4ynpEjmeO4=; b=eLuy2OR9Rf0Sgj06fYuozPXUI0
	OAJ7m4pHA6c/vO3Wv77pB6vtk0r7hoVJiY0VwASps4GKXCVPTo9xR749qegDE1XdzW9/AKcJPvZGh
	nBuG2UjRVeQj6KmfkdwBaFFjN9GVGt39F4YkMy5PGGWOniOCqqxpXNkXzCjN0W+eowF/0pbnaE2Fr
	Gf0xNL6jOSib/A4RKfPHEqObtlhE2JO8e0xJi9j9YniqsuY5n1iug2G1b36WsVTib1KBcGttk4oAs
	pH4QOT4NMK+135c64kogxqZyXOA85ysVuo7U/e1DR5k02DWb+UH7qZFNw09dyvtPQ0rEpeUwXy97n
	+N7H43/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEPs-0000000G79G-1rA9;
	Tue, 05 May 2026 11:58:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEPq-0000000G78U-2WpZ;
	Tue, 05 May 2026 11:58:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE0EF60133;
	Tue,  5 May 2026 11:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10004C2BCB4;
	Tue,  5 May 2026 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982297;
	bh=zpz/IBCMJ9rlEr5yvIog9kP6PEwlQCzTVEu7FEW2KM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cEzCYbvzlQqVwbMHf3QKF3rgBoeN0/DldW50hQ2kCJwawcZw3c7FeP99QGUIKKRRf
	 rPVlDpcd7kZOIlxtgbE3kljytwC7tCAeSQ/Oe9dHJMV+y1Tx+wj4xwCrIPl0KMOfMu
	 caR/laiD6TwQHFfXueIMSjPmgX0Z5vmewf8IQkm2W8a8p/hk29v+A+qRB4coQANeWV
	 w3Xi9OkfUjN5HFv1LQtwjwWoPxjwTag61ifSccoKkQMWXmo6ordqP2qVvs91CGi+b1
	 C6uyHTmQoCDprRlbP8k92QxZXn7CQsIWUlx0u4zPh0Jtv+3pd0jF4IWTD3yCWrMpJ1
	 m96mKYj83UOhg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 "Darren.Ye" <darren.ye@mediatek.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
In-Reply-To: <20250822125301.12333-1-darren.ye@mediatek.com>
References: <20250822125301.12333-1-darren.ye@mediatek.com>
Subject: Re: [PATCH v7 00/10] ASoC: mediatek: Add support for MT8196 SoC
Message-Id: <177798229351.597350.5415197464438946507.b4-ty@b4>
Date: Tue, 05 May 2026 20:58:13 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 22 Aug 2025 20:52:29 +0800, Darren.Ye wrote:
> This series of patches adds support for Mediatek AFE of MT8196 SoC.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v6:
>  - optimize mtk_afe_pcm_pointer interface and improved logic checks.
>  - update mt8196_afe_private structure by removing unused member variables.
>  - only reference clocks directly supplied to afe and set required frequencies directly.
>  - update adda driver according to reviewer suggestions.
>  - update i2s driver according to reviewer suggestions.
>  - update tdm driver according to reviewer suggestions.
>  - optimize platform driver and update widget rotues.
>  - move the sof route from platform driver to the machine driver, and moved pinctrl to platform driver.
>  - update the afe yaml file to remove unnecessary clock references.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
        https://git.kernel.org/broonie/misc/c/1aadc0147b42
[02/10] ASoC: mediatek: mt8196: add common header
        https://git.kernel.org/broonie/misc/c/33eda2c14ff7
[03/10] ASoC: mediatek: mt8196: support audio clock control
        https://git.kernel.org/broonie/misc/c/7384ecab34eb
[04/10] ASoC: mediatek: mt8196: support ADDA in platform driver
        https://git.kernel.org/broonie/misc/c/9a5881402c6e
[05/10] ASoC: mediatek: mt8196: support I2S in platform driver
        https://git.kernel.org/broonie/misc/c/65a195132669
[06/10] ASoC: mediatek: mt8196: support TDM in platform driver
        https://git.kernel.org/broonie/misc/c/ede4d841111a
[07/10] ASoC: mediatek: mt8196: add platform driver
        https://git.kernel.org/broonie/misc/c/57513aabfe5b
[08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE
        https://git.kernel.org/broonie/misc/c/5cd03440c0d4
[09/10] ASoC: mediatek: mt8196: add machine driver with nau8825
        https://git.kernel.org/broonie/misc/c/de764b0d1838
[10/10] ASoC: dt-bindings: mediatek,mt8196-nau8825: Add audio sound card
        https://git.kernel.org/broonie/misc/c/1c65cc451873

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


