Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF66E74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEEmR9qdeZhpCywKEKcZNcZmwsD8RIDWWW3SVa1S5uw=; b=IspWcOKxCLSqYuMfJSMDxexTcL
	1oo7DdZIVK+WZCV2qB3ilCcGI8g8F1Zp0yYOcKdbPktJkAHuXYhcBdzhTpaE4MzUX/utBrU4+bdoK
	d6d52kQFF8J3XLtUvJNMpFz9uSrzqkrIW8XGA5Q8wV6D5bKRUR26gi/qXObDnAu7LCTTYluK0ng3j
	gX752+uonxj0pdXNS4Y4l/iXsLr4NNbMC1GiR+8BOL7m3QtbK2QtKP5ZILjk+KWoyy1Eh/+tfbPqI
	KnpdSG9ljYoh3DDPZ1pO8pdDhv8J3SSz7+tB1rxmKC1ufzQ6iumdgzLKhYSKLqu+sMxtfEEMQ3+nU
	hl7K8ELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIX44-0000000AJF9-3BiS;
	Tue, 03 Dec 2024 17:52:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIX34-0000000AJ66-13ni
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C5775C6CF5;
	Tue,  3 Dec 2024 17:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2826AC4CECF;
	Tue,  3 Dec 2024 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733248257;
	bh=OSrO/elSn5qIF+zISWp/GORkYyBZhWFrJkT400xtaug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qQj1QnVapS8uBGnl89xNEjYNhkPYsYeAz7sgRrEIqcUwbU2NWG8gcPe6OVlzWb8V9
	 cY3jARPjtO/dFw9hnJpa8XHGtPQaJAzBTj7ecfwaCE2f+Pw/EH8jd6o9K8z/p2Xq1h
	 XEPWwWPfodOOZLq4i2wGlJSsAw030tB+0yC398aO76SskILKk2oRv/ZPfl6rHPE4KT
	 dMfRmqrUEU61RL2jbb8yp8n4FNq09qpoDb+7ujD/I7S6QeurnIBfNBXlsXHR1LSeeW
	 uDJTmlzsZW68yujhGWIS30PWg/DBaUEdqjr/az7SmHheZiV1pn4Kk2Vn2oYkRNOSmd
	 iMrOoHevVofLA==
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
In-Reply-To: <20241102125712.2647325-1-csokas.bence@prolan.hu>
References: <20241102125712.2647325-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v5 0/3] Add support for codec of F1C100s
Message-Id: <173324825387.459040.17438717506518048504.b4-ty@kernel.org>
Date: Tue, 03 Dec 2024 17:50:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_095058_335888_E81F7102 
X-CRM114-Status: GOOD (  13.89  )
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

On Sat, 02 Nov 2024 13:57:09 +0100, Csókás, Bence wrote:
> Support for Allwinner F1C100s/200s series audio was
> submitted in 2018 as an RFC series, but was not merged,
> despite having only minor errors. However, this is
> essential for having audio on these SoCs.
> This series was forward-ported/rebased to the best of
> my abilities, on top of Linus' tree as of now:
> commit c2ee9f594da8 ("KVM: selftests: Fix build on on non-x86 architectures")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: sun4i-codec: Add DMA Max Burst field
      commit: cabd4ac290a6ceb87c8dbfb5a3251750e24529e7
[2/3] dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec
      (no commit info)
[3/3] ASoC: sun4i-codec: Add support for Allwinner suniv F1C100s
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


