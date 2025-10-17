Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FE7CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfR4Lph4WHUU2Tf4SyFQuNjOQxYiOJWv7VymSbuw3Qc=; b=XGOyD3YTTZyGJYNzfBn+lTOP3z
	upkgiseziOAfsbDtpIX64IhagJEXiM3qkWZ6asK84BNZwsEYwXx6WVyNlcRrPNQBoU4uuxFGyyXvy
	h/8584RZobCjVmuhVyxN1tGY1brq1nrKp95io0xkVoR1ZfJjAofMAJwqQdCwAXX1WtD9sbApF6tNK
	8B/M8PtbYdF7PM+h6edhiKhPPBsjYnmag3/3yZIOuFwtkXnoM1qcAw2LlS6XYM/3RvtnfhJ14dFwO
	yla8J0kJULlRWAt5iRJSIY6sse21aSuWPOQnxbujtRVAe9GrhGR1X/UiT+bqpSuZ5CQfhDs8aW/s3
	Xjgts2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iZj-00000007fsj-18so;
	Fri, 17 Oct 2025 11:24:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iZh-00000007fsI-25YH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E768A6425E;
	Fri, 17 Oct 2025 11:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8360C4CEE7;
	Fri, 17 Oct 2025 11:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760700284;
	bh=NpJFzxCcFayc9t00+SnzWuPNyLNxy1/G27ZnwSAHG+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ey9lk/9cEPHsfTFxHF6dHjMzr+5HY15ilUWSaaZznVNWlEfdyepcGCN/1yRXUJIeX
	 pHZlyUyRB36a4dg74aQPWina5N5d7MtZWkUXOpgRgQkuZyKaGrkK9Z3PkmekNS9FUF
	 mh9BJNicGVBARBJG0cuBFWrm9iVyVN8md9KaxD2GJirZAtL8PHIe2+jb3QCeKECwuv
	 8fwxzzgZ0nUGfxIv/HAnmXAXpzKkhVyiWlC4kow5opraCV8XIjTsQAE6Em17wTJY4i
	 zevlFxT6nms7qEJBS3vMtKLH0+mspvF7B66Cn2Ald54beyYzMSCMEEJZVIRt4+ExbO
	 JqNRe4CMWkVYw==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>, 
 Andreas Kemnade <akemnade@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20250917-sy7636-rsrc-v3-0-331237d507a2@kernel.org>
References: <20250917-sy7636-rsrc-v3-0-331237d507a2@kernel.org>
Subject: Re: (subset) [PATCH v3 0/3] regulator: sy7636a: define and init
 all resources needed
Message-Id: <176070027934.36205.12873966810251115615.b4-ty@kernel.org>
Date: Fri, 17 Oct 2025 12:24:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268
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

On Wed, 17 Sep 2025 09:14:28 +0200, Andreas Kemnade wrote:
> The SY7636A has some pins which can be hardwired or used to have more
> more advanced power management available. As several devices containing
> this regulator have these pins not hardwired, but instead connected to some
> GPIO, enhance the driver to have them defined and initialized.
> Also add the ability to power off the chip completely by defining some
> input power supply.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/3] regulator: sy7636a: add gpios and input regulator
      commit: fb25114cd760c13cf177d9ac37837fafcc9657b5

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


