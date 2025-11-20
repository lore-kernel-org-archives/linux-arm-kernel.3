Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96871CF857B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUi5lS5rCzVuDAcHFYLYCYAitVuFZQocxlSp+9/3pB8=; b=4tid17GMNTI6csaQ/Rs5TEediG
	GXwNMrT8ttm0YzfPZaHEdqOP6TVZed6RtzPFoWjYG303NCfDOcTcZiYsc6HJOFih36hwq8ujAjZWa
	cHI0KFfkMrRr6H+SDAM2WUMP+c581a+mB3DeMaSctpS6DtuJvj3LC+XsxWY1BKbvoeSHLHkeXydvD
	huEsIhIqKWz3tr3NbwRWEd8vjcK1tGxGH5zRLwqIDadFQ2+LStyqJec0WEwS5TlmQ/S/p6/GkeJiB
	Pct0WVNHuMMDuG1x4BCTw0+kUAhpFPNghSirnDyQBuU2I84urdlPGGuGrf6W1HFfKg/sNpVef/RBb
	e2d22iLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM19c-00000006RLq-2Oyj;
	Thu, 20 Nov 2025 09:40:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM19Y-00000006RLQ-3J05
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31DE042DA0;
	Thu, 20 Nov 2025 09:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22B0C4CEF1;
	Thu, 20 Nov 2025 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763631636;
	bh=d9gi6IAhGMrPheyNCbI0JonIbRfzHt0QW40OJqiT97M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=D8x5dMDI9qJnYU21qSlLei8gHq6Zp6XE3Ht93IoCv3k7PJAFzVClSKbtAgejBTKQ9
	 Mlfkw1A7ZzKb+RXGRyRjn44BAeRKBXZkSIw6dDMVgPLcb4V86Y6I7sMSO17zYx81q8
	 Lb5p2niv4ymriPG4Rh4qDWJUCqR3AXLPVdGP+enV5nTKiKhcvUEMsjwNR5IxksI+iI
	 pOuGw0lIbm+/s4GAY7s5IaveZtqiSuhHzrVxN0SfktEXbcH3diGb4+WggKOSWAetV5
	 hJZhfgmu6eLjeVPX9gEw+PGJqSjehjYiliL4+9+a0TF+R5/jlR0BSczu8Z2OYlYOdh
	 sQ3lludhl8vrw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, andrew@codeconstruct.com.au, clg@kaod.org, clg@redhat.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, BMC-SW@aspeedtech.com, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
In-Reply-To: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
References: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH v2 0/4] spi: aspeed: Add AST2700 SoC support and Quad
 SPI handling update
Message-Id: <176363163164.560683.4991477364624751148.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 09:40:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_014036_873459_CB8FE878 
X-CRM114-Status: GOOD (  13.15  )
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

On Fri, 14 Nov 2025 18:10:38 +0800, Chin-Ting Kuo wrote:
> This series adds AST2700 support to the ASPEED FMC/SPI driver and
> bindings, introduces 64-bit address compatibility, and improves
> Quad SPI page programming behavior. It also implements AST2700-specific
> segment logic, where range adjustment is not required because the
> AST2700 SPI hardware controller already fixes decoding issues on
> the existing platforms and adopts an updated scheme.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700 SoC support
      commit: be6671d3908e97a2128f5327610a1dcb4d420cfa
[2/4] spi: aspeed: Enable Quad SPI mode for page program
      commit: 716d0a0a2ab00c601120c19bb357f4373f4722d1
[3/4] spi: aspeed: Use phys_addr_t for bus addresses to support 64-bit platforms
      commit: 508f3d3b688e1650ed383fe208b323aa6c164420
[4/4] spi: aspeed: Add support for the AST2700 SPI controller
      commit: 9e510e677090bb794b46348b10e1c8038286e00a

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


