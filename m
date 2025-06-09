Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C105C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5TE4lh17LS86DU5Q+x0QatDct4atgM/8aAJY4o0/A4=; b=xXKvsnrgonuWyGaaFP/+8jDF2j
	sEcoyDlC7VnKRCGQPWVF3VNuSG7VT/eyd6/Hsm+FpApbRCi5gx67/lbZiY8Xjh61GQhutzosHLzZM
	Nl+ygM0zVFwJxcXOn5iftzjhHs8HAFRsyGzNd/98U/RZcqc/JjC7h2MCinoIisk+MxuHt56Ah8dbj
	T1+9qCwNoJh2TYnnMKsSBj65QCRA1Xck0EhMQBzvKwuEXN4XCZCth3Bt6IKloxzzYCSRO1zsTfDM5
	3kSad4LMSCbNdqyDUHBqKj1TM9PDP5YSoCSZGaJRqIFDz2KJzGqFgRd5R1gG/g982uHPz8LoF/4c9
	abe9GLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiYn-000000055PN-1jOZ;
	Mon, 09 Jun 2025 19:53:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiFi-000000052gA-10zU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 19:33:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 594CC614BD;
	Mon,  9 Jun 2025 19:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0987EC4CEEB;
	Mon,  9 Jun 2025 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749497629;
	bh=29yRo6RPxQh+/QZzJP1u/4ErdaOrzZjMU+NJw20l2bM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dzVTCF4+/WNoSRjQTdz/EC0sZ2J9OWquqckraAJ7DfINQKYMiCidAOb31pzazIBye
	 7+Jl7XqdzWN3IvEFOyKaDVoFVVt8nCM+cor+PDaZBh7PPR8PYdNEMkYoIzhMiISc2T
	 PIdZ7YB4lvbACiu0cgWmHX7MJZBsen0F0rHqWtr7iMyfF17zXHhEMxqq0xM/3RSKp0
	 7gU3z4Z0bJJVZdvhkem7evpK2qte2ftg1D9R+sMnPnXXiuP2RuPEl3gjcBvjcOansB
	 KfKMHLHWtkKBi943JXaUEtRWbNq/OwrhTWCAiOaDIuA6PJkFhBzkgsj7tyATWuU6O3
	 gaEKv/+wsjNpQ==
From: Mark Brown <broonie@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 James Clark <james.clark@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Xulin Sun <xulin.sun@windriver.com>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Marius Trifu <marius.trifu@nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Andra-Teodora Ilie <andra.ilie@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
Subject: Re: (subset) [PATCH v2 00/14] spi: spi-fsl-dspi: DSPI support for
 NXP S32G platforms
Message-Id: <174949762279.256775.5072206138424672774.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 20:33:42 +0100
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

On Thu, 22 May 2025 15:51:29 +0100, James Clark wrote:
> DT and driver changes for DSPI on S32G platforms. First 3 commits are
> fixes for various edge cases which also apply to other platforms.
> Remaining commits add new S32G registers and device settings, some S32G
> specific fixes and then finally add the DT compatibles and binding docs.
> 
> Tested in both host and target mode on S32G-VNP-RDB3 by transferring to
> an external device over spi1 using spidev_test.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[04/14] spi: spi-fsl-dspi: Re-use one volatile regmap for both device types
        commit: 87a14a96bc323aff824fad8cdbe61b78eff22255
[05/14] spi: spi-fsl-dspi: Define regmaps per device
        commit: 1672b0653212cecf11be9ef55bc2a2fabe0fa2ca
[06/14] spi: spi-fsl-dspi: Add config and regmaps for S32G platforms
        commit: 70c0b17ee344b0c14b88e6b5b1db6abe2fa84218
[07/14] spi: spi-fsl-dspi: Use spi_alloc_target for target
        commit: e7397e4d3b161ed8a57648a9ac03df7902958682
[08/14] spi: spi-fsl-dspi: Avoid setup_accel logic for DMA transfers
        commit: cac7e5054115fcc41b1cb050af8e8971f7c9b22b
[09/14] spi: spi-fsl-dspi: Use DMA for S32G controller in target mode
        commit: 870d6fda18d590df88beac9b0504f810807a5ed6
[10/14] spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G
        commit: c5412ec5f687732f9722bd0f94f9632ad78f4c52
[11/14] spi: spi-fsl-dspi: Enable modified transfer protocol on S32G
        commit: 0cb9ca1187b311db21288a79ec7b98121f730354
[12/14] dt-bindings: spi: dspi: Add S32G support
        commit: be47ecfecf5a6f16d028fd572410251b502692bf
[13/14] spi: spi-fsl-dspi: Enable support for S32G platforms
        commit: 9a30e332c36c52e92e5316b4a012d45284dedeb5

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


