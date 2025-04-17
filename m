Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5DAC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfwiCW7HBdl78z7Ugyo6Qh6eo4Sj03oSZPNdD3NKLtA=; b=E4dk1NTCRkLj8LGUYV+yHfO681
	PT3xh8RuWCgFQtZ6q2dv1Zah7Fg92Yk9u4wnVVF64A1cE8t4JXUQED8rI04H96HhiGXYsp1D3Ve3D
	x1FF6/oTXPpEeNhBeuxCLRYeyJzIpdrHWRS3sLb0yDzJzpzsWUPKA3MBsHftCjxtshYFCJFSLCqpW
	WOrjwxDx88t1OzeujaEOSWkkpUTqGCt/i0xDONoHP8pwObP2XnZ2Zek+Xq3EgZZlZa3XgkVqtwzMg
	gfVJSKad9Cnz0zcrGITNj2Va1SCKnNTKVqf2O+Qivivs/NFJHo0AQ1Xtqjw/khjDhe+/BW5Lpx1z2
	q8JB2iyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SGz-0000000DhKp-3Bmr;
	Thu, 17 Apr 2025 16:39:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5S0A-0000000Deep-39ae
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8087A4B4ED;
	Thu, 17 Apr 2025 16:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A355C4CEE4;
	Thu, 17 Apr 2025 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744906929;
	bh=+tJVKOIu+gBSCFEwwsnlu5dV6AI8KsV8zFpj108Zr4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e7hcoEI1K2N7tr2pPvAvyGf9F2OS0j6PilDcGIYecuC+tWybN1PsAfR/i1HPUXMoV
	 5dIH0NEUai+CFJeC5gkKpXo2g/WIqqkFRtSTEao/i/e28EpyWfGjY2V2QSIg1rMRof
	 Ux/w/fbqIyvS+fTcFPDMAwOZwTqKwcMnPsUiywa5Q5mpASAY63CbgFMxf594yLjFRS
	 kSxHLWbblcwy3YmhptglAY35iQ/TnzyvlEirtSpft+EEomL8naaEvil33ZvQExiwz0
	 rxi4wWP8ocVY5/4dQXCV5SmGxIBQzXGDs4yCDmJld52zduHnvNSxUrsw8KxT45ZZUK
	 Ep0J7+gOUDeJw==
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Tamura Dai <kirinode0@gmail.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250417011700.14436-1-kirinode0@gmail.com>
References: <20250417011700.14436-1-kirinode0@gmail.com>
Subject: Re: [PATCH] spi: spi-imx: Add check for spi_imx_setupxfer()
Message-Id: <174490692776.121478.4533295304176579175.b4-ty@kernel.org>
Date: Thu, 17 Apr 2025 17:22:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_092210_862863_E5B63D12 
X-CRM114-Status: GOOD (  11.50  )
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

On Thu, 17 Apr 2025 10:16:05 +0900, Tamura Dai wrote:
> Add check for the return value of spi_imx_setupxfer().
> spi_imx->rx and spi_imx->tx function pointer can be NULL when
> spi_imx_setupxfer() return error, and make NULL pointer dereference.
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>  Call trace:
>   0x0
>   spi_imx_pio_transfer+0x50/0xd8
>   spi_imx_transfer_one+0x18c/0x858
>   spi_transfer_one_message+0x43c/0x790
>   __spi_pump_transfer_message+0x238/0x5d4
>   __spi_sync+0x2b0/0x454
>   spi_write_then_read+0x11c/0x200
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-imx: Add check for spi_imx_setupxfer()
      commit: 951a04ab3a2db4029debfa48d380ef834b93207e

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


