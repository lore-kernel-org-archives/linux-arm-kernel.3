Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5133D6ACD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rwkgH0df4xaqo5yuZWdnYvQ1Ko8f/MsSqOkeihtOYU=; b=mM45kHr69fWY3VFNI5mF6mBIdx
	XFs/L3pMyubtZi4RnM2tB5RpqlVLOWshP8CQAY5qQus8eaZ6ViWpZinXk5b946O+bxhPF2p2jcRVH
	YYKgrMoCaZ2UK2ytwSkijQ/ifwzNUadxCGODBDR33CCNW/rxfD3U90cMbnuEUF+MdZuGopy5rXrtH
	MYhNZ8GNBYhqa9hnvA2un8Pyf9l8YAzbGq13JsJa2OgThl32QwJlQvz0b/Nuum+aNyuiwAdi9qav/
	JWe+jt8ELZp5BqmeVWT/6FS6XYmwWpWyWK7DKk0+eHsjAP7/CYObCVjxKnmOC2PGiQ+o3eWvHX0/a
	cxeg49Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWANP-000000089Wv-1dko;
	Thu, 18 Dec 2025 09:32:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWANO-000000089WJ-2Id3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 945F460133;
	Thu, 18 Dec 2025 09:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B31C4CEFB;
	Thu, 18 Dec 2025 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766050369;
	bh=81UJb/tDyeaP+qvZ6Zz59Q3gkULX3YPSvT8fk2ia0Pc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aKwYji/f8E+1YmeQiWeg2bkwx1HWEbIxjhnET+XKiEKP4jdCqXokC70raZmnFfEAU
	 Fn936QbztgdaopG6l0bdvRHiPJaPIeYOylJtVwjNR0S/xWy+G9lRTQ9N+J9haW0P6P
	 q3VrmZWidEbQTZaA3wNmY6oX/fYl8si2eANWlxC/7ioY6gyvYmzTBWDldmq7D1vi17
	 GaoxQSt49+pR4GFUxUkZZF/tZbOcW0QOsfj1Gnrbusxsjkp4c6Ek8w/2JdxqO5ARTc
	 cMM6nTSB8OVyOPq5f6R7J5+0WyLfZkK1to9XAcjKbylBC8y9gUUmtCaQeeSg/wzQlo
	 jPQ6JqY/1JfiQ==
From: Mark Brown <broonie@kernel.org>
To: Han Xu <han.xu@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20251216-xspi-v7-0-282525220979@nxp.com>
References: <20251216-xspi-v7-0-282525220979@nxp.com>
Subject: Re: [PATCH v7 0/2] Add support for NXP XSPI
Message-Id: <176605036628.87569.2326741752652519619.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 09:32:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Tue, 16 Dec 2025 11:20:12 +0800, Haibo Chen wrote:
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

[1/2] spi: dt-bindings: nxp,imx94-xspi: Document imx94 xspi
      commit: 64ba616741bcfc4c7ef1ed856179328300ca0422
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


