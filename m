Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F44FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 11:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23ZYKOjKAg6Z4RsmhRnef4fxyr8C7DuBo5MUbYH/Jtw=; b=p5RvEjLjap9Vo5Ug9HqCoQmnys
	MxnDdkk3EdEDpIIazErd/5lvqE5q6G8I8K9My5BTZ5ZY9hZuQqWJ+gUvaEsS66PVNCif/8ts4K15Q
	UvsAsrlPHu9LEQslX57Vx3N/q09bHgfliRZkHtSyfh3lPSgxVjsP7Pw7BNuEXFmSqiBG647eUKDl2
	sLiHJMXbKMaB5uh/bOJhd8A14YcQIQPZgJ/9WDQl5FhjuzuIZKSu9/8+i5HwUMi0IWHFT4/MaERlf
	48B/5o+J1JYnJycJBkjlXkNBBEYmnPXE9T/M15ZRQlT/VtIbAaUVP95UpvxdJFRbs7xEQeqBcbi+T
	4al1eXsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOsp-00000001Aul-0ohK;
	Sat, 14 Jun 2025 11:17:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOoa-00000001AX6-0xaE;
	Sat, 14 Jun 2025 11:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D533A5C5628;
	Sat, 14 Jun 2025 11:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A581C4CEEB;
	Sat, 14 Jun 2025 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749899566;
	bh=9wVEwKDRxCUUHYAtNHKLRbgqbNZpbzuce/1YR2Sz23o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LTmaV3tb2hcMRRxMSe4a59qK2K9g3tJhPwicOqGofFQ2PrPD/j5BTD3GKTqR/LqCL
	 12Ihqpd6PVhpQOtJw4YW5OCH5LkNF4QBLNPPKx955+Du6fR+HG6829g1/wEEB7vSH2
	 HxLmnc4gXkJYGKHKlFly4oXB9RXpTUfKkPjN2ZE32Dmnqh0BCc0iXDrTCICrW4jhnw
	 Jr18OqsYrlwZQlSufeICaZaLnUjfv+MvS9MNqm7YaU9xrOXBlWr/afGJ0c1TXnYknR
	 Iec62PgQZLpsHqe5kjdPMgrvOAZ4ddEdRY1HRQkBnhV8GVHwFc2RxBSYR3wDWQMl/u
	 YYYEn5j7KA9gA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v2 00/13] ASoC: mediatek: use reserved memory
 or enable buffer pre-allocation
Message-Id: <174989956314.19870.6679132279735424997.b4-ty@kernel.org>
Date: Sat, 14 Jun 2025 12:12:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_041248_362348_B5A44B64 
X-CRM114-Status: GOOD (  13.96  )
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

On Thu, 24 Apr 2025 18:24:54 +0800, Chen-Yu Tsai wrote:
> This is v2 of what was just a single patch "ASoC: mediatek: re-enable
> buffer pre-allocation on some platforms". Link to v1:
> 
>     https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/
> 
> Angelo requested that these platforms use reserved memory regions if
> possible, and fall back to pre-allocated buffers only if that fails,
> to align with other MediaTek SoCs / platforms that already use reserved
> memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
> SoCs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
        commit: bb90e0c91d375ec5db8a4f8cd2555900aea0725f
[02/13] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
        commit: 2fd902152c15a8cacab91e4a660413d189411561
[03/13] ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
        commit: 473ee884263f2127ea4e46a74ba15d07446ceabb
[04/13] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
        commit: 81c73294a4eb2df31e974db2fc4397f5e0ecae09
[05/13] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
        commit: cd12d3a5ed10e3e3b323f2b2c652de1c8e17a750
[06/13] ASoC: mediatek: use reserved memory or enable buffer pre-allocation
        commit: ec4a10ca4a68ec97f12f4d17d7abb74db34987db
[07/13] ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
        commit: 9e7bc5cb8d089d9799e17a9ac99c5da9b13b02e3
[08/13] ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver callbacks
        commit: b2c090c9f6aa9d19f4c966233d7fcb872255f83b
[09/13] ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver callbacks
        commit: bb8d8ba4715cb8f997d63d90ba935f6073595df5

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


