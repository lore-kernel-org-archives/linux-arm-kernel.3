Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4224AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYIm2uAEnfHsOOQ0khul4dRoej6P3tmk5lJuSGlKObs=; b=o8SYnuu7M4+KfhTcvGMHT8+7DR
	0fV/HkkfBrB+hNnkbhRMO9vSKK9tFfGmcpqZ4zwoPiFxsd6iGQYVc2gbGS3umJWyNqxM07dFQsDRe
	HztJXRxBXw/lgmme4x7lfQaRF40Io6akzCRHzCjouh74xkGQ/ghaNeSlxs7v7NIFmFq/+42rLExy/
	hrihxmLC0Z/Eg3UXcTeIFjE+b9mx2CzRdn5+gFUg2+6RtSFG/wTzPZjUkPBkF6+OoQGdkHshHdFMy
	DQU3IjBqiPrw2xiDD6rQpI0xq8ZukYoo40gi2N1bvZ03OjQErReXQ6rc1tkXTzzy0rD+1CKw0lxoD
	drAMzu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0hC-00000001Amj-1JzM;
	Tue, 25 Feb 2025 19:34:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0fe-00000001AZz-2zl5;
	Tue, 25 Feb 2025 19:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7D095C4982;
	Tue, 25 Feb 2025 19:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DDDC4CEE2;
	Tue, 25 Feb 2025 19:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740511965;
	bh=EJ0p7kJP7tcBXTVtX2EQW5Eqt9I/PZY1PRXbITilg4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mTrZE4WuJLivocdDlOAyUC2sQPoGHxDaCYT9NHKSq28BUTlAulfb4fehDp0FsRufS
	 wN2GyPsPi6OmFzTc6Ee2sTqgm3ETtXKtEe6iEdhwM7NDGtfgbvQFp4cOJ8WNAcZfBT
	 BFiGFR6ejC//8RQRWhkzVwv1JEOxWPjZq/K8aBcaurTcLTt+xmYzVyl5eL1Yx7gEG/
	 d5hPZA2+vFU/+Mx2BzCzyS6yUNx0qvgMlmexsoD8ynAY+8glKvJmR/lCTKClqV9Lc+
	 CyfjXuELUxxY24pzKEo5rik8bu9FfV+No86fQNUU58QoDTwOBhtCTXtmOZwL8WPsSy
	 V5yFbpl2Z+/Iw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 parkeryang <Parker.Yang@mediatek.com>, Zoran Zhan <zoran.zhan@mediatek.com>
In-Reply-To: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
Subject: Re: (subset) [PATCH v2 0/8] Enable DMIC for Genio 700/510 EVK
Message-Id: <174051196206.229034.7513749709146445847.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 19:32:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_113246_838192_E1ACF8EC 
X-CRM114-Status: GOOD (  15.75  )
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

On Tue, 25 Feb 2025 11:33:46 -0300, Nícolas F. R. A. Prado wrote:
> This series enables the dual digital microphones present on the Genio
> 700 and 510 EVK boards.
> 
> Patches 1 and 2 add some required clocks, patch 3 changes volatility
> handling of some registers to prevent issues, patch 3 adds the DMIC DAI
> driver for MT8188 and updates the AFE with its routes, patch 4 adds the
> DMIC backend and widget to the mt8188-6359 machine sound driver, patch 5
> adds the audio routes for the DMIC to the Devicetree, patch 6 adds
> DMIC_BE in the dt-binding and patch 6 assigns a wakeup-delay-ms to the
> DMIC DAI.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: mediatek: mt8188: Add audsys hires clocks
      commit: ef6a24c79d5047c029577113af43eddd1d0f1bd2
[2/8] ASoC: mediatek: mt8188: Add reference for dmic clocks
      commit: bf1800073f4d55f08191b034c86b95881e99b6fd
[3/8] ASoC: mediatek: mt8188: Treat DMIC_GAINx_CUR as non-volatile
      commit: 7d87bde21c73731ddaf15e572020f80999c38ee3
[4/8] ASoC: mediatek: mt8188: Add support for DMIC
      commit: c1e42ec04197ac013d049dde40d9c72cf543b5f6
[5/8] ASoC: mediatek: mt8188-mt6359: Add DMIC support
      commit: 390ebb24b3c3a95e109c28e14c2ec9fe3f0f8aaa
[7/8] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add DMIC backend to dai-link
      commit: f00b3056843d14754ac1bab2106cf5599680f115

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


