Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0444CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 00:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EU7hP5vGG3LUZhdD3CsdfYAGBkQxAC6HY5rWrqMzak=; b=i9JlljlVYYi178t/haqVFQoSP4
	X3IEBveRsbsCjSMydGGwv9N89Vx1aQJsKOWro4r82VTI8eT8hNMCJjUI70aZxeVqdFI5eE+41F7uB
	3kHKMW+VPa0fJOn2JFbVr3GitJAn3F0YKcZdRsbRr+K+su9eIaxbXZPmlrnbiBwu1RQyF8Uzv2PEM
	y+fEEgqlgrg23OVCGEerXNWlq0CNzEsr/OjTGZJIC0orqhKWs9+zvjNBM08C6DzdMXGNNn+unhxIO
	Q+gfxGT9+xp8OdfG4syUPm8S7ru2x91Y7Gp/BfETRj3gC3al9WDMr0IYfxD+Bst7d2LeUq9AbdNnB
	1C+2W7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWHc-00000001ePQ-25UO;
	Fri, 16 Oct 2026 00:58:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWHa-00000001ePC-3oNx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 00:58:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0400A60A98;
	Fri, 16 Oct 2026 00:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDB81F000C6;
	Fri, 16 Oct 2026 00:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792112329;
	bh=2EU7hP5vGG3LUZhdD3CsdfYAGBkQxAC6HY5rWrqMzak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nlDp0hvmJepY02wyE9K2fj3OVRlxWeLLVlQAmMs5lyY9qsklQTrgHU9IvC2ncsaMh
	 KKS5apMxwaE+1CY7TY+EbRJOEUAlemkenZtZgQN2VeuyBaDu6xlhaR285t5GjtCxL9
	 Ceeukfp6uIwPdPwkBd96y/fuppmFqY8xRH8CCF8NhoQLDtL7VlGVoaLWcJy1j7d0wa
	 PrpJdRT97sgVbEKaj95lIJWIyFdv4rdtCaZfAuolqUZ1APUDqXFDh1cCh3TObTLY+s
	 2EPu72HUQfkiCkEas9kO3+4nPncu5tSBH0+CHpKh2cvpGbxTfEOsacI6N+iTJY2v0c
	 O7dM99c2Ejp8g==
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Carlos Song <carlos.song@nxp.com>, 
 Richard Leitner <richard.leitner@linux.dev>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261015-fix-spi-imx-dma-v1-1-e28259671392@linux.dev>
References: <20261015-fix-spi-imx-dma-v1-1-e28259671392@linux.dev>
Subject: Re: [PATCH] spi: imx: fix slab corruption from undersized DMA
 bounce buffers
Message-Id: <179209959253.134795.9397557555007574163.b4-ty@b4>
Date: Thu, 15 Oct 2026 22:26:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ynwuheiIWANQC04BmAHXZkIRlH18J0WhcJhdUIM8KyI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIulh0VWj27PfmcyLPvr1tCLtmkhrz77TV/8oevD00s3
 27iPTphWkcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmsuwfwx+OD7YPH+yQqfW8
 cqHM6aXDZaGYCoZE3T+r7k1PjzGLiY1n+Kc259ixNyIyl45cly1Xj1o2SeFcG4PIXsedE6Uk1ht
 +Xc4MAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Thu, 15 Oct 2026 22:58:00 +0200, Richard Leitner wrote:
> spi: imx: fix slab corruption from undersized DMA bounce buffers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/1] spi: imx: fix slab corruption from undersized DMA bounce buffers
      https://git.kernel.org/broonie/spi/c/59eb22641f0c

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


