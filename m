Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348BECE8D55
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnbudDyF8NxX8yAg7dHI2PVOKu9sIE96vc2Vw9I8veM=; b=zvN6KjkUjqsCDuhUxjt68fqJRt
	UgPkqCp0YDQJJCpv38+YLntciu5A6lZHtnjmbzvy6QC44En8cKjwsrNBOu3Kmp1gEySv5AY0qbcsQ
	hbjw1RMxwL3u7GK1XdpH0j4j8c5H57zw14JI/R/VGbpejjnQ/3De3m783hblp6EX2CpmEKO7vgSaR
	lACNY0pIHA33Y7OfENLxnHwRWjzuQAYtstgzKk1X0BYj0jKRQ3TiN0IOH1ye0EogDC9VmxF0fO9O2
	kx349SUlTkKWDXt6wc4ZYtJuOxreDXwhbAt0GHYp+uU34EUov+MNQiOaBdQyooNNhtTKfL836QfTw
	VEsl7lqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxGP-0000000CoNz-1HTq;
	Fri, 14 Nov 2025 17:07:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxGN-0000000CoNc-3AbY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56C2643CB3;
	Fri, 14 Nov 2025 17:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D910C4CEF1;
	Fri, 14 Nov 2025 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763140027;
	bh=ga44oaeQFbH7wASZKjv+ryueYrWRV/VVMvZPstiCLTA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GFfWDvi56HBMPyHhDFEQ3UIwI9ulm2tDs7ilvjUGPIsUiol2TuVeg3qGPAIUHZMn1
	 /w1lHu/hH4SrD8vT1c8KyGAswcPRKtTbUcHB5RVRepCJGzZ4+cWp7jZywCosB2kVbc
	 3y6LqdZaVFtUBjcLJDvjWPKdNABCffxsfn/KXei86ZZLTP60LhYeiSb2q5Ep2issBj
	 PfrhmsU54EZQW3rtfWsX39X2b/u0LItq1HM5AABFjKVt/Votex6ZuQLPDdHfK3tx5W
	 Hl5ipoNQ2K/eRt/8iYJzORY7O/TwqVj4cLP/a0w4F5JWujjvhRHjQCD3rvn/6scl+u
	 8yC7BRcPeIWKA==
From: Mark Brown <broonie@kernel.org>
To: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, Jun Guo <jun.guo@cixtech.com>
Cc: linux-spi@vger.kernel.org, michal.simek@amd.com, 
 cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251031073003.3289573-1-jun.guo@cixtech.com>
References: <20251031073003.3289573-1-jun.guo@cixtech.com>
Subject: Re: (subset) [PATCH v3 0/3] spi-cadence: support transmission with
 bits_per_word of 16 and 32
Message-Id: <176314002487.180192.8916984509259656715.b4-ty@kernel.org>
Date: Fri, 14 Nov 2025 17:07:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_090707_817232_8F17FE1D 
X-CRM114-Status: GOOD (  12.87  )
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

On Fri, 31 Oct 2025 15:30:00 +0800, Jun Guo wrote:
> The Cadence SPI IP supports configurable FIFO data widths during
> integration. On some SoCs, the FIFO data width is designed to be 16 or
> 32 bits at the chip design stage. However, the current driver only
> supports communication with an 8-bit FIFO data width. Therefore, these
> patches are added to enable the driver to support communication with
> 16-bit and 32-bit FIFO data widths.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: spi-cadence: update DT binding docs to support cix sky1 SoC
      commit: 55b5d192bab5e152bda8f8cefe837c4ed0ec60c5
[2/3] spi: spi-cadence: supports transmission with bits_per_word of 16 and 32
      commit: 4e00135b2dd1d7924a58bffa551b6ceb3bd836f2

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


