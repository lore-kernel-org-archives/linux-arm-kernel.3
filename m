Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C869E74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlT1zALzbgxU+zKCEprUsYwm2s1Oy5+l62zNU9xo5jw=; b=mHra0Rx/KCPVUJ2Xdom9FVMYFH
	xTy7t5ws5UbKhlBi13smVSETdQYkozcIMRl+6Vaubr6gIaQZ2GNstiLSdHdYYG87TucHQrvFCjpR+
	ldfsOKYKAHH/EhUrRG4U/LzE6lEkiwr1MNibbINE1OE36F9RcNujyg8QFOQny9c1KfJSfBJm6tsxt
	7zvUFyg86Z1nIxfsEeqzISTHANitePZVM86xcRsR89LD/LJmhlvPoJkFTKXUwNw2YRIiWlkcD9ULb
	BNID2bwq/POHi0y5XRS5qTl9383kObsu2cQE1UCLFjHwMC82bRILjcOo6fxw1JuQnZA04QOwqKO58
	R4j74+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIX53-0000000AJNl-1lQe;
	Tue, 03 Dec 2024 17:53:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIX3A-0000000AJ6W-0UWJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84E155C6D05;
	Tue,  3 Dec 2024 17:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293EFC4CED9;
	Tue,  3 Dec 2024 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733248263;
	bh=5p8vEzZ8oE54TBgFSDxwhE30LNOudRqhkcJKN4lnoSA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dr+Jo7AI5gaM3Qai4tsjbWIuJim3Y1vImcD6YE3kfY/L+sIcqLyI3VMCzqrNJDidZ
	 1NczPyr3O3v68KpCIp+ejbd6YFc97KVhss17XGTyKmFPrsv8kz4zyZDl3Iw79wBhV+
	 ikevbvI/gRzaI6QztP9waYtbyV/Cm3f57LNi5NP6sEe5/p+7jRA13NUdmNjXOJqM20
	 wHbrqBKzyETWlQ74ClcPzPjf/woB78myrNA+Sr/63HGC3MddIpqD5OLpJj7InGLstC
	 HyQt/fhaAszt3ffIAXGOaCt+tuGhD10aQ7ypVLDkLY0tADZa6YNo7FS32YVO3PL7pI
	 k/DZgrUBKczyA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cs=C3=B3k=C3=A1s=2C_Bence?= <csokas.bence@prolan.hu>
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20241123123900.2656837-1-csokas.bence@prolan.hu>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
Subject: Re: (subset) [PATCH v6 0/3] Add support for codec of F1C100s
Message-Id: <173324825989.459040.3874572873005288609.b4-ty@kernel.org>
Date: Tue, 03 Dec 2024 17:50:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_095104_194466_44019221 
X-CRM114-Status: GOOD (  13.61  )
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

On Sat, 23 Nov 2024 13:38:55 +0100, Csókás, Bence wrote:
> Support for Allwinner F1C100s/200s series audio was
> submitted in 2018 as an RFC series, but was not merged,
> despite having only minor errors. However, this is
> essential for having audio on these SoCs.
> This series was forward-ported/rebased to the best of
> my abilities, on top of Linus' tree as of now:
> commit 28eb75e178d3 ("Merge tag 'drm-next-2024-11-21' of https://gitlab.freedesktop.org/drm/kernel")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: sun4i-codec: Add DMA Max Burst field
      commit: cabd4ac290a6ceb87c8dbfb5a3251750e24529e7
[2/5] dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec
      commit: bb2cc3014d74dfdab0b358b4539a9d2747598663
[3/5] ASoC: sun4i-codec: Add support for Allwinner suniv F1C100s
      commit: 2198deb823a6ebe110b737614421a4687d3327f4

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


