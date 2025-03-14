Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A724C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDxOT//GxO9nIv8pFk6XtNSZqMFJBF+zmnr3xS/QoH8=; b=l+VSw6fW5TasRiG66OJxnb3lYQ
	nHFXfSbvUqCA/SAgD4LCSJIx6FVsfOSGwvfXerEHdN3J/rn3+b+fA9n5DJdFrct2UF2fT+/knp771
	eSiecrbrvIQOUUL2EW0o8MzRLGANJZSFyDR0ucDywePwbGEXEynLwMjZdw6nrZWchvkl2H7xSsZKu
	Z4On0gGny3gdDWYEOFQtsx5CaUKnDlAAEQ+4UKci5TGfxh+QY7MBH6JPHoteYcmcAFqDI634fExpA
	R8rUOXMjaX4qlw558xyBYswO0FW73ov18Bjken5CR/qUeVJ6XstrkfcSPBwMHcdZkCTjZFXfAndjF
	87dUKUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7OW-0000000Edu0-15G2;
	Fri, 14 Mar 2025 15:56:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7LP-0000000EdOo-01JP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:53:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38297A47779;
	Fri, 14 Mar 2025 15:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF52C4CEE9;
	Fri, 14 Mar 2025 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967585;
	bh=J+7FE7jUtWw2AkNGj7vXJdveBzqHGNZ5nLZnbOlg8Bo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AhM+irCxXAaEjDCeEZLxG5c1Ms7aTmmFS9d+PQYBHJkboKQeHpTrEnSFYuX5xKFHT
	 HVO+frw/2i/ZMZXfdKqzZvNCacLqc6RKivRZMMHX4zoMQZw1dTSmUzEqgGNIHKwBoW
	 EkHAixH4eX2mizir1ao0e3xCU/b3x2t/oal8NDHo/07cnfQh8P/cZrzaf6RqMD8BPb
	 HolwUOjg/7HnEu0FLCOS6K0fcioq8ad8F5in8+1Cf3G/jzACgzvRrd6DGGKnQcfmMo
	 8IWiAhMPdYjUlz5eYMttVMRpnO2gTuty6YCiCHtQCnPdZZ4RVnzqQ40D4K9m0hbj3S
	 HLawMom/GDLKw==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
In-Reply-To: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
Subject: Re: (subset) [PATCH v2 00/12] arm64: dts: freescale: Add support
 for the GOcontroll Moduline Display
Message-Id: <174196758090.19958.7850853709519472369.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 15:53:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085307_111860_F93A4541 
X-CRM114-Status: GOOD (  12.79  )
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

On Wed, 26 Feb 2025 15:19:11 +0100, Maud Spierings wrote:
> Add inital support for 2 variants of the Moduline Display controller.
> This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
> features an imx8mp SoC.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[02/12] dt-bindings: vendor-prefixes: add GOcontroll
        commit: 5f0d2de417166698c8eba433b696037ce04730da
[03/12] dt-bindings: connector: Add the GOcontroll Moduline module slot bindings
        commit: 43fd4d2f4f9df4ae1f6493d51cdd2687f325a225
[06/12] MAINTAINERS: add maintainer for the GOcontroll Moduline module slot
        commit: 8f1cc5242544052e4be037861abc8bc2b89cabda
[12/12] spi: spidev: Add an entry for the gocontroll moduline module slot
        commit: 10254a6c6073b0be171d434a3aeeff0256e59443

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


