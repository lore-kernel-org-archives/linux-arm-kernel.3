Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1E6D3A67F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcnKqDu4vYMLcUrzLfWym3dgQuYqMxMi7m2J1SGHMIM=; b=222Reety/59oTKTJ4yU6atefZi
	gXy1ey9oDvKUB8DdmW5niK5ZKU9HpG4qO7jZS4Gp6F1593I/0OykeKmjFN0md5xZz1ugzSac6kKwq
	LYdNXOB9C0h1H2YagRaas5cimDkiQlBRyHvvzCaO0tukydO/6mOUIbc4d9tf+CHTAcDgi/qLU0xX+
	4jQe5psFa5JaQD+IJxZLMQNiozYzkUxiccqOLuVs7R9mQ011WN/o0HcLB2ROYos42PxWxhR3RQ2kx
	BlBZHgh+g1yDIOJnIpwHYDiScYO1L5qUvr2aoCMuWjwiHv7kic+tacaOFh6i7Tx7uIu/EqBqAPM8Z
	iWgfHAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rRB-0000000FaxG-1Fr6;
	Tue, 29 Oct 2024 18:59:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rOW-0000000Fada-2kCD;
	Tue, 29 Oct 2024 18:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KcnKqDu4vYMLcUrzLfWym3dgQuYqMxMi7m2J1SGHMIM=; b=qvv8/N5H+Mjih7KSipu0bF4j8C
	vJjB26I7W9VzNYWI+STA+StW7u+b6LhpsEsICRPkCnc2Qnz+3+oQBSarRPbY1zzr7elpeuCy3oVlR
	vBZSZCvfAfq4cmPPwn42757BI5Pp49K1a/fZsiiEsMXRdYggD7dc72+iRIXRVfwkxHS/t84NBMNqz
	3iX03DVkcVJHezrFhtruTmewSBEa+X1plpSsv868aHynfhqrKtrbM3Wcz17KNssRx04t9xb2EQdnS
	7ydMnOTEn6bquL0eygTIBdzoKawZehFGIrhYUdlvGFzBKmlP85UFWpaj5z41cY5+DBF66F2qlztfj
	CyNyavvA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rOT-00000009zBx-2BNd;
	Tue, 29 Oct 2024 18:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 489E75C377F;
	Tue, 29 Oct 2024 18:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D12C4CEE4;
	Tue, 29 Oct 2024 18:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730228198;
	bh=9wfadzzh1VnQtg6LRhMagkiOx4YTPfzItSf0HhOo8IQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jRya4OeQfmmxvY7x5muWWu5Ig00y++Aa7s6voYFgMNP3UXnJGSCy8mWcoFH9jaAaZ
	 Gevmg+OY4USApAe/g1zY9I4ULdh0eAVDgGQ9nmJ4yojmFeVFX+KEPPAfzeH6IGBW0o
	 ut0wHOK4YfEmWdpXDggEa7KjuHSH6tKxizQwstJxr69xL1tRrxEQGRR4lO3OuEbvDC
	 fU1MndB8HvLcaoFb0fUNXoc7RcGTgqNEZ8Uxq8HSCkk0sd6QFUeum0qIVk1NN1B5s0
	 GIdf5O+wyYjJvL7QY+mU4k5FzXaGGRRklfEHmuJInaFq/wN1FW/OLKeDk1Rz38C2+P
	 mEK8LAiIxd/pw==
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Dmitry Yashin <dmt.yashin@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241028213314.476776-1-dmt.yashin@gmail.com>
References: <20241028213314.476776-1-dmt.yashin@gmail.com>
Subject: Re: (subset) [PATCH 0/3] arm64: dts: rockchip: add Banana Pi
 BPI-P2 Pro board
Message-Id: <173022819553.134081.16666383098906856024.b4-ty@kernel.org>
Date: Tue, 29 Oct 2024 18:56:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_185641_796867_DC555DA3 
X-CRM114-Status: GOOD (  12.58  )
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

On Tue, 29 Oct 2024 02:33:11 +0500, Dmitry Yashin wrote:
> This series add support for Banana Pi BPI-P2 Pro based on Rockchip RK3308
> (RK3308B-S variant) made by Shenzhen SINOVOIP.
> 
> Patch 1 fixes rk3308-codec DTB warning.
> Patch 2-3 adds binding and dts for the board.
> 
> Dmitry Yashin (3):
>   ASoC: dt-bindings: rockchip,rk3308-codec: add port property
>   dt-bindings: arm: rockchip: add Banana Pi BPI-P2 Pro board
>   arm64: dts: rockchip: add Banana Pi BPI-P2 Pro board
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: rockchip,rk3308-codec: add port property
      commit: cc8475a07cf34891bf11a63025659d3537b638ef

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


