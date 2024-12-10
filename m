Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C58E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ac2l8o1SrvJRgDxLDRPHtHLNs4gHiv6dELLkDytkxA4=; b=Mg43R4JeihozWGk0yPgNzx38rD
	Hr72SG/c5LahoF0kEZH3MKOC1vns9DqXyBOL62QUKAj6g8EEYKOs0+BHmF0LBp2+X8EAt0M9bO8rs
	4ZeSN5AdmWNzIrjbJu3Zgio4hpvmZ9j4H/S20PMhJKAXYkXd5VIMkHznh3FJbz5pt9cD6lE/BQPk9
	zMVsQdaUhW73xldYGiuKwzzY5vnNbU17VchGT30VTI2XAItzRJw5AGm/nDRCX0Tc5CdowQQ/F1juO
	tP6A0T10OedjG3G5xOfIZyFJBj17zzcFt95SWbbPGZxlzNOFYjkUN8PTv6uKCCMa47MVo1IV7Dk9C
	SpZkA/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzv4-0000000BWhJ-1uSq;
	Tue, 10 Dec 2024 13:04:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzrB-0000000BVeo-42Sg;
	Tue, 10 Dec 2024 13:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9EC25C5FCD;
	Tue, 10 Dec 2024 13:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4104C4CED6;
	Tue, 10 Dec 2024 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733835653;
	bh=MIAxjIrD/lQ/XU1a7Wha9ESXrTCJKMU1xX6Hab/QdPQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ikJS7Vp/nie0FJ5JFNlxCSZpO3Splxs5tL1yMayfWaVGdQpsABgrAx6wDO8Yv/c3H
	 DbU+1yG+/4HF3e5e+WE+m1/5fWOV9DBynRekfkp6DTGg2ArspwKBnfQfjQl6lgUmLk
	 3J54ZheUj9qzsq7+J8CcWP7vuAz4y9eRjb3DTb55AKz96E9gPy4boitPH+KS/uOY/U
	 CEVE4dUwjrB2JDwwJJwEh4vUYUMAFml5O5v64p5/6FHCvFwzqz3FJeOWwnRBOhzwsn
	 IExFIKQlhgh/ECiO8Ig1m2g9ZBGAlDhuXFCAWWCY22TGVKeVK0+QMdHCi+M6uM4sRF
	 YfFIhPymfuo6g==
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de, luis.dearquer@inertim.com, 
 Christian Loehle <christian.loehle@arm.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <1f2b3af4-2b7a-4ac8-ab95-c80120ebf44c@arm.com>
References: <1f2b3af4-2b7a-4ac8-ab95-c80120ebf44c@arm.com>
Subject: Re: [PATCH] spi: rockchip: Fix PM runtime count on no-op cs
Message-Id: <173383565160.34030.9711673452793299443.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:00:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050054_050447_8014B478 
X-CRM114-Status: GOOD (  11.49  )
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

On Fri, 06 Dec 2024 19:50:55 +0000, Christian Loehle wrote:
> The early bail out that caused an out-of-bounds write was removed with
> commit 5c018e378f91 ("spi: spi-rockchip: Fix out of bounds array
> access")
> Unfortunately that caused the PM runtime count to be unbalanced and
> underflowed on the first call. To fix that reintroduce a no-op check
> by reading the register directly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: rockchip: Fix PM runtime count on no-op cs
      commit: 0bb394067a792e7119abc9e0b7158ef19381f456

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


