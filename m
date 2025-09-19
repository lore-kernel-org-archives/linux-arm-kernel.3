Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F7ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeCN2avjte29nqWHR7pO3LU+pxIxD8Ku7K1GIsBVk0A=; b=iXk9MQ2L/GWWai1mQfZJ5rVaU6
	WE/F4XiT9WcVhgdNJxfgWZBqsNnijpdMA1Oxvlm2SoV4LTUGzUOSIFIgsy6TlMBVmhalTGul6PFjZ
	OlHMKypQVPSQdISl8HhxuiDCmv+ODJhBrtWSi4/QlWjScHeAdr9v1yXc5TxthQ90P2Nw9wplIe2Ek
	aSeD6ae05cLodvZoP5nT6EsQ5hdLo5JsaxB39lz3w/h9Hz5BQZIwnxNuyee8urIdxno1g+iOLW6Ok
	BCet1+3YUi/Kg731RpZrEomaCGE2J/Bx3Ds24uqozOWnU1cUoQwvsJ7CaW1WmwshOgDiPT8sp0ECH
	CD1z0SYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzda9-00000003SUf-2Kxq;
	Fri, 19 Sep 2025 16:03:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzda6-00000003SU8-3BJ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:03:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C24241820;
	Fri, 19 Sep 2025 16:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36CEC4CEF1;
	Fri, 19 Sep 2025 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758297810;
	bh=lpomwfxtk9a4+r9bgZHNE22kfKHJ+s60q4CwLekgFe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gMlb4A8Egcyts/MtR5Mw8qBFv4iE/79CmfDyT5HtS+MBA+CAqAnbRrwuwchTk843f
	 MP2A/1u4QocVvOjuTfBnW5FGSoxChq53xYw4ywv5Vy92rxHo+Ogl2oADs3ienzA0Cv
	 TMYsYTeQ5GCj4ieQNAMhxKtUZmst7zb2APbrUAe5CzaddCPa4kQskDQEQue5EmpFal
	 xAgytAAzSl9cxDudQLo3FJhVxOA4Sg3t0QAnea3RIklRNn7Q4D5QMHuPQIHQIEWXF1
	 bUbDMF7tzwf7tHsIpQjCzfWexQi4O6rs9R0DQZchNfteXsShL47JjMIsbBNeIRxxGs
	 9vaGXDMsLQtEw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Dharma Balasubiramani <dharma.b@microchip.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Varshini Rajendran <varshini.rajendran@microchip.com>
In-Reply-To: <20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com>
References: <20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com>
Subject: Re: [PATCH v2 0/5] Add QSPI support for sam9x7 and sama7d65 SoCs
Message-Id: <175829780315.161854.16031631803406215563.b4-ty@kernel.org>
Date: Fri, 19 Sep 2025 17:03:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_090330_823549_CE6C30DD 
X-CRM114-Status: GOOD (  14.41  )
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

On Mon, 08 Sep 2025 09:44:15 +0530, Dharma Balasubiramani wrote:
> This patch series adds support for SAM9X7 and sama7d65 QSPI controller
> along with the SoC-specific capabilities.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/5] dt-bindings: spi: Document sam9x7 QSPI
      commit: 68f6b403ee90293b6fa4eb094dcee79138b692b2
[2/5] dt-bindings: spi: Define sama7d65 QSPI
      commit: f3837edc05c66de0104041d3f300524773b46526
[3/5] spi: atmel-quadspi: add padcalib, 2xgclk, and dllon capabilities
      commit: 86d074921e34db6daaa7ea2976b1dfe7d507309b
[4/5] spi: atmel-quadspi: add support for SAM9X7 QSPI controller
      commit: 65a977d752d72a53d16ce32b85ef9db9b0747df6
[5/5] spi: atmel-quadspi: Add support for sama7d65 QSPI
      commit: 20253f806818e9a1657a832ebcf4141d0a08c02a

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


