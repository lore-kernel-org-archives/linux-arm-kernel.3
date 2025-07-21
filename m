Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7BCC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GAVag3m5ecuAfWWIp28IdphYGPB3qD6DensfCFBx4o=; b=fSYTge1EldRCFZOGpp5cFCXRye
	Ku6Xew3PbRjJho/WruckDIZs1B1MrkqcZq290EDkBcezZF21UGib5J+n/H5yPrJTlWZMiFbsikSKi
	D6erDgcWECBnH9k+bpjFbA9vAj8NVU89PapVxyM0mitOzRCRW64lQqIuAY+x5ahh2zvJDhUpoiiqh
	9XVJhxtClJXsVSl7ooqdvbgoP7bLm1QaUhGBDXnMH8mmMf29s9z8GNMCT7TnrbcRPykae/H7oue71
	0Dsf1if6tboaCmhR3ju/J878jRRXGwztL8Dqcp6VCvBtdrHn78iVaHEmULgvV3Bs2jVit99Fmmsdp
	P/ewLB2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduRL-00000000Kgm-0imc;
	Mon, 21 Jul 2025 17:36:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udssC-000000008ER-1oEG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 15:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A416143276;
	Mon, 21 Jul 2025 15:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D872C4CEED;
	Mon, 21 Jul 2025 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753113375;
	bh=RmvVp8Cc5s3PNQobge2CUWiM9uh0u33UicVxKxhwc00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mzesJ5k8af1yqWf95XwEexGnQdlboi/uiIG5R/a5H2hgmcMzJqbwL3o3LTzr9PtHi
	 n+I2d/MMeEqRRGxuoM+ZL/D/lgxAodi9PnUZQcq5J+e2c1hcHvJxDtlE6MC7K36ZN/
	 MDVgMqXN5nS6Dsh38Q4AjUZcFB970DMHP8iNkmhyad2Wna6kdYHbgh22I3Ms1hl14x
	 kPC93tv+L4Rfp3nTqjM3CP7ubRvOll5FU144rkE3RT1AumWpSyYLm8/u4Kmp//zugD
	 f6B55wu4pf3Bp0tkrPFZk+KvH0aoWZ4OCmt0urScl8JFZdN4NLDHdr/oYzozquZfq5
	 q7SBhclNl6j9Q==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Andrei Lalaev <andrey.lalaev@gmail.com>, 
 Chanh Nguyen <chanh@os.amperecomputing.com>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Grant Peltier <grantpeltier93@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250719063355.73111-1-hs@denx.de>
References: <20250719063355.73111-1-hs@denx.de>
Subject: Re: (subset) [PATCH v1 0/3] spidev: introduce trivial abb sensor
 device
Message-Id: <175311337130.327079.7374455187420344577.b4-ty@kernel.org>
Date: Mon, 21 Jul 2025 16:56:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085616_495549_0A55D7CA 
X-CRM114-Status: GOOD (  13.56  )
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

On Sat, 19 Jul 2025 08:33:51 +0200, Heiko Schocher wrote:
> This series introduces the changes needed for trivial spi
> based sensors from ABB, currently operated from userspace.
> 
> The last patch adds the spidevices to the DTS files, already
> in mainline.
> 
> make dtbs_check showed no errors/warnings for the dts files
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: trivial-devices: Document ABB sensors
      commit: aad2f87cbcab56b322109d26d7b11842a09df91f
[2/3] spi: spidev: Add an entry for the ABB spi sensors
      commit: d60f7cab7c04944a79af16caa43c141e780a59c6

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


