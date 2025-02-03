Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A12C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feQLUNPstNElf5lr4hbdbzWndsnR5LpLLVjY7NxvOA4=; b=nSLgP96pkQgaGMRv5G2fAzhA8w
	IETT7R1I6Byd/O30MCAq2Iz5Wop+bKmzWTqmjk8tXchRiDJK14PBqjLLea7OVFo3XhYOJiNGQNMfI
	fKg/VChxLV02GsjwD7qs0vUyohtiaUjFcgMqhytVxMWGabhJed5KsDTTAPvXiKlAIgPUzPxIhqw+v
	RYGeBmjb1ht8tizUZNnf+pZRXH/WZEAKhLQFJoKK+f6ehLtPZi2L1E47E1g7ySSoewyzdc0FcSJY4
	+h77ipvXph5ueYP/wRHbiB2jjUou/neJnC/kyroXZCZzc/7/CdnUMTPlA9BRP+lJeJn/YYz2tBBXD
	Ou14WA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2bE-0000000GVDu-0TGH;
	Mon, 03 Feb 2025 19:59:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2Zr-0000000GV93-3HCG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 19:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0400A41C52;
	Mon,  3 Feb 2025 19:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37BDC4CED2;
	Mon,  3 Feb 2025 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738612670;
	bh=durZiyUzKeQV8I7CDYBd9bdRLrh73k2nsD8U1EuoMNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GwzGCyl+NjMgN6QiwVEbFS1WawVGL2e3kcTGvNzQUqJ9W93Jk/xBCjut6IL6lN30t
	 HPAiZoCt9knGKLw4BWT+5jplUrJ08LSqhhNEmlFN+bBgRsmvencGfc53E8lb9L2oZF
	 IrHMnff+KS1Ktq1Mw9A0JJb9TvavUnidAHJHV+A3rcRQiGlOhcmyTdM/3/4G18/tYe
	 LZv4hPRa1RIu/hS8qqM+xX8wDtHO6NPv75H8KhKoUxOQzxRd0g9XUX1VZhKOx3cUkh
	 VFUSFeZ2vPwFIc56CMBTXcYsy5cyKcwnhfVrE18N3OQnEtQr4cbuZ5anw4eEW+VAPp
	 nBE5nGZeSZF2w==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>, 
 Conor Dooley <conor@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Robin Gong <yibin.gong@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder@fris.de>
Cc: Bo Liu <liubo03@inspur.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
References: <20241218152842.97483-1-frieder@fris.de>
Subject: Re: (subset) [PATCH v3 0/9] Use correct LDO5 control registers for
 PCA9450
Message-Id: <173861266637.674751.16665389874730608623.b4-ty@kernel.org>
Date: Mon, 03 Feb 2025 19:57:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_115751_890230_7FB07B24 
X-CRM114-Status: GOOD (  15.06  )
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

On Wed, 18 Dec 2024 16:27:23 +0100, Frieder Schrempf wrote:
> This is a follow-up of [1].
> 
> The main objective of this is to fix the PCA9450 driver to
> use the correct control register for the LDO5 regulator.
> 
> Currently the control register to use for LDO5 is hardcoded to
> LDO5CTRL_H. This is wrong for two reasons:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/9] dt-bindings: regulator: pca9450: Add properties for handling LDO5
      commit: f9cbf56b0a1966d977df87d15a5bdbff2c342062
[2/9] arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT
      commit: b5ec74c2aec76fbdff9bc16951455602e11902bf
[3/9] Revert "regulator: pca9450: Add SD_VSEL GPIO for LDO5"
      commit: c73be62caabbec6629689c705aea65e5ce364d5d
[4/9] regulator: pca9450: Fix control register for LDO5
      commit: 3ce6f4f943ddd9edc03e450a2a0d89cb025b165b
[5/9] regulator: pca9450: Fix enable register for LDO5
      commit: f5aab0438ef17f01c5ecd25e61ae6a03f82a4586

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


