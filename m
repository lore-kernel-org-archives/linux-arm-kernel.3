Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E7DD6ACD7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2G+/x3jtQrXMi/svP6iEzjO6ovvdc59qY/88LJBgKg=; b=qi0FZJyOnT7Q2S5Fq5mRh/K6FC
	b2Mw9CYbi7SUZTN9LBIy4gCuIwD1SG0DdPoXvk3toGLL3iPo1FezQnWZ8GRLUWTyVcbaC1FR2s+A2
	l1V42DQ5lg9BaXTewGz+W1Gj/Z3RxRTSy4gSsrKacT3daYpQsc3CB72PgSi5GJ34ogEMJR+iyLmtl
	DEPjzwDbl/Y3U9TIHrWDjrzuMEvbgLU7axJuW5mmwgTFeCXqW86ALCWN5FIPVV0N0X3y/jkfgo9hg
	D5ZKiXHzV9s1+OjQF8zvHJXmN104tzfwgP5PbrwCcw73ucHAgqoHYrWLM7oj7gT25GMwW5vgC9elR
	mGspHYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWANK-000000089UJ-2YCt;
	Thu, 18 Dec 2025 09:32:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWANI-000000089TU-3LvB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B3F043B07;
	Thu, 18 Dec 2025 09:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0578FC4CEFB;
	Thu, 18 Dec 2025 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766050363;
	bh=TvHwwQh6QW4aMRcWQ0xejXsyZkwHJK10UZAYUX2ZWVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZLIEAvyPipdJbsBGy8cdMYXrr+LjCydIMGF+AMTjoGbum7dacm37sXvo0MiE0x3Z3
	 PBIlaWia7FRplfd3b5HxBmewAdyFUzXy8AWbkl+4W7twqaPpvjEmZ29TbAZilzjdtC
	 YOSeb7v6uBbZPf5bV5FYctGUc1awZIGNbf4yRT6wY/FrNPvj3yKprzwIZPQdOFzbss
	 9JDjzAy0xQA/lUPScQ7p09LgHPAoJBP5iGCexexKYmjKftsz0W+3Olkkx9322L6M46
	 xmCRPp783WICs2aGFINFPH6AadisFLEEEYbB1DmcMtOKHUin0Eo0tflH6su3VK2WlM
	 qclOYFuoZeeig==
From: Mark Brown <broonie@kernel.org>
To: Han Xu <han.xu@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, frank.li@nxp.com, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251125-xspi-v6-0-22b22de50cda@nxp.com>
References: <20251125-xspi-v6-0-22b22de50cda@nxp.com>
Subject: Re: [PATCH v6 0/2] Add support for NXP XSPI
Message-Id: <176605036072.87569.17728068603081639345.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 09:32:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_013244_867087_A73CAC55 
X-CRM114-Status: GOOD (  16.74  )
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

On Tue, 25 Nov 2025 15:42:17 +0800, Haibo Chen wrote:
> XSPI is a flexible SPI host controller which supports up to
> 2 external devices (2 CS). It support Single/Dual/Quad/Octal
> mode data transfer.
> 
> The difference between XSPI and Flexspi is XSPI support
> multiple independent execution environments (EENVs) for HW
> virtualization with some limitations. Each EENV has its own
> interrupt and its own set of programming registers that exists
> in a specific offset range in the XSPI memory map.
> The main environment (EENV0) address space contains all of the
> registers for controlling EENV0 plus all of the general XSPI
> control and programming registers. The register mnemonics for
> the user environments (EENV1 to EENV4) have "_SUB_n" appended
> to the mnemonic for the corresponding main-environment register.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] dt-bindings: spi: Document imx94 xspi
      (no commit info)
[2/2] spi: add driver for NXP XSPI controller
      commit: 29c8c00d9f9db5fb659b6f05f9e8964afc13f3e2

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


