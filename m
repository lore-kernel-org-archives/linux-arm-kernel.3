Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40114C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJCiK4INJhDSZpJeFKwRa90UtlOoxWDZJYhb+z4TaHg=; b=qHILCw8x9YIh+ADk3qkHW3RjVe
	euOO48JLnnKpQ5SWE3Hx2JKIChjkxVUfBdJtlUJ/X9xq5G/P1bKY5nfnPF2JJfDkTP6DFZGZRlXR0
	BHlcZ8W8FVB4fTrK8Zn3mnHvN6joXskcO13wid9wrP3TOK1XSTnsfU+hgP0ckevt87exUT4m2GYiB
	FTIJIS6hZMWuLA5CzasfJWZlAicrPk11ckH/U+CoIrxptR5WjMcWawJ09N7QVaqK9dHXPmbc3elIi
	2P8U4IQ3UTb1N3DDMUpEwjrmjiADkrLhINpJ5iZDPeUOPLRoOocA/YWlk9nU2MB9CEPKh5CxabmkF
	j+Hh6fkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcnz-00000004Gqv-1PVe;
	Mon, 09 Jun 2025 13:44:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOck3-00000004GCd-2STj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 13:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA480629DC;
	Mon,  9 Jun 2025 13:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2E5C4CEED;
	Mon,  9 Jun 2025 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476446;
	bh=LikEvWObK5cLWG5kDOh8WIv3nJ7NrbLjTJ/RRELK4kc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jbxQAEZ7NNI+UWJCL+5wuwHeQk9bhLv9Y7FV2kwU8ZYrBWWkI8Sehiu+z5dX8+/Q7
	 wsYiuGLoJNXHFBsYnbR7+osZJKsO/HVVXu5LNAP+P/EuiUZDQLp8OtEy3nJO1aiCab
	 EunIHl2IMy7xrlV6y3i6cBWmsUCU4DhYaUFFTsvCAHycyYkwXcCvcE9u4ifxJspnWr
	 TKbBPGO9D9ax/aYDJVgp+jkOF9HPRiWuZkUJpvVyeBGgLMoEoUlsyJRy90aEaTf9+f
	 zP9Gc2WQ3JZQ8m4iFRl/rduCREWoI66Y8IlzpcfZG7wBZs+2atmmJjIvk/aiC8Hrro
	 gLDa4/3H4snSQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250528222821.728544-1-Frank.Li@nxp.com>
References: <20250528222821.728544-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] spi: dt-bindings: mxs-spi: allow clocks properpty
Message-Id: <174947644363.127013.4646317883893758390.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Wed, 28 May 2025 18:28:20 -0400, Frank Li wrote:
> Allow clocks property to fix below CHECK_DTB warnings:
> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80014000 (fsl,imx28-spi): Unevaluated properties are not allowed ('clocks' was unexpected)
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: dt-bindings: mxs-spi: allow clocks properpty
      commit: 6b500757aef0b5b639253508cf93eb8134a2d340

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


