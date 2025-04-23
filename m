Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FACAC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6y9Ns9bLwoVB6LCkoIvWkmDMfOx5eZ5lD7xpj73u3Q=; b=BTN7U8nmSA1bGcjB8CWErjAAwH
	xQRUc0xcjowec2vpc+lyQN4GIp7G732S+JUJFEGrm4NA/ez/79ZjClnxvTbtLIWc022Z6m0vlArbX
	0wVXItvRpSXagdeQLP2TUjF199x6LbI5fX8Kl2q/3ayHn3uI/Z6E9ZgR+FyIem/c8E1kuCUY2aKpH
	RldIgukhkEppJWRAQrJfdcxQfbQKN6CEpmPjMZdo7jY3KiGxzWtgGVTQRK/BbmcXFtoJ51WY0ZFxD
	X9OvGxK0IqWmBSdWGA6pH12KeCcTxU89bXZrK7UNnFoTdLMCsqfWJTFkIPjqstQ7aHMHCN4PPno1y
	/lR115kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bBK-0000000AqIH-1nto;
	Wed, 23 Apr 2025 14:34:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aTd-0000000AfNu-2oqK;
	Wed, 23 Apr 2025 13:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7BFB4A0A9;
	Wed, 23 Apr 2025 13:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FE6C4CEE2;
	Wed, 23 Apr 2025 13:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745416165;
	bh=osGtOXoJ3/G4yq2pLf+qpaLC++EVm4B+QQ46Ny8HTnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=txMPS8mzhOH4JqWs1/gpActbHw272wesasElzGIudFpTPjkYoE2Fidl1RznTJYoB6
	 HrIW0sUUeMDYBEGX9A/z9xoQkqHITBpJgrLpcBLkoETNeCWg2Ppw1Z4WTmIhG6Zt5M
	 2S7JGvwX4KzuRr6fzQEyVX5BPNuqZhTBegeRGEdr3O0aPf6H5i5qWfemZZRNWldNdt
	 ylCBx4jutIwZmwtbc/01ACKzZptf2DOuKlb60SkdBqPU9zb3pJJHQlnDh3EdZDXjGD
	 dP7fKeCj1xnj6YDBpdC9zQ5dxsTbRteEBjFwyn8anEIXhn2f3+SuZo2N/hs4VsISpY
	 keUVg1uVu8MiA==
From: Mark Brown <broonie@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
Subject: Re: (subset) [PATCH v2 00/11] Add RK3576 SAI Audio Controller
 Support
Message-Id: <174541616068.423395.2187976314107237451.b4-ty@kernel.org>
Date: Wed, 23 Apr 2025 14:49:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_064925_735037_03E99947 
X-CRM114-Status: GOOD (  14.21  )
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

On Thu, 10 Apr 2025 21:39:52 +0200, Nicolas Frattaroli wrote:
> This series adds support for Rockchip's Serial Audio Interface (SAI)
> controller, found on SoCs such as the RK3576. The SAI is a flexible
> controller IP that allows both transmitting and receiving digital audio
> in the I2S, TDM and PCM formats. Instances of this controller are used
> both for externally exposed audio interfaces, as well as for audio on
> video interfaces such as HDMI.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[05/11] ASoC: dt-bindings: add schema for rockchip SAI controllers
        commit: fd55908d3278300ec4cbbacbfb07748bb9166314
[06/11] ASoC: rockchip: add Serial Audio Interface (SAI) driver
        commit: cc78d1eaabad3caf3c425c83037cd8ba1c9f2bc6

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


