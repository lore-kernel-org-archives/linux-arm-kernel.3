Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8E4F53D83
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie5I9rEnfD8YKeXQBJDS0BtAerc9C15u4CL5A1Kmh6E=; b=kObWaXs8gRAczN22gj1WZwRBgD
	WW2HxlPUIQLTvk/gSnNNM/OgL76XpwA7jautMT5XG7GsQayBDYRIWj+qZqzTxJ1r791vnpYkI4nth
	09WxBaj7HjWzlzH+iU3HkcKq/cvHZaUaG6pEzPgq1vUm3E40X4+Qn7GdVeB9c5EGcjCqyKOBz0NG3
	equxu9GQtXa9UypNPCqpmJdJML5Uau1M1cf4YSKsOE6xRNuEU29JQ+QARb9Zbcqowo55U3RO+uyOH
	WjudtuXITwF1Xg1teA62rKF7IoZ7gLo7fnIu+R1EuVByxB8AjhmDCwx3VV0uDclGXFpzGJ3O3hAbr
	3T2j3/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C7h-00000004cPR-37JH;
	Mon, 16 Mar 2026 17:53:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C7f-00000004cMy-0MT7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:53:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F326744289;
	Mon, 16 Mar 2026 17:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D651C2BC87;
	Mon, 16 Mar 2026 17:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683578;
	bh=getjwqKgNmfq6BzmmTQiHcZudhJOJnw/iMntCINEbFw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ViS4wNTa1ZHgMdsTM50AyxsY2fwxoCk5PMsa+Zqn0xkpHkUzzBBa4yil+gLgXOHOk
	 t4nXT4JBUF3PXhQe9Y75B0GgLZGpdpe2r7EOwFyhnMAOI5sGBCE6dTKlH1zec7AQPL
	 AICnAywmBQ9VHXewPtV9YYTwyuW2oVjB9bl7pUl1Xo0vx08NhurgWxNoKIjPGsaYOJ
	 kQgqCiewgYUjbHy6RtpDJ2mBLeDE8GrPQC6yJ1fip+3VxmAMnkVE2iCO/UHhq481lD
	 7llUI3qlacmNf+SbMxD+t5RqnDge1kzNDykr+ZnHhpcTxetJ3pAZT+CERuRnp3bDnY
	 y50Q3Xzpq2IhQ==
From: Mark Brown <broonie@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Harshit Shah <hshah@axiado.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260302-axiado-v1-1-1132819f1cb7@gmail.com>
References: <20260302-axiado-v1-1-1132819f1cb7@gmail.com>
Subject: Re: [PATCH] spi: axiado: Fix double-free in ax_spi_probe()
Message-Id: <177368357691.147197.14162826062674228144.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_105259_147550_9C042A61 
X-CRM114-Status: GOOD (  10.64  )
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

On Mon, 02 Mar 2026 01:08:40 +0800, Felix Gu wrote:
> ctlr is allocated using devm_spi_alloc_host(), which automatically
> handles reference counting via the devm framework.
> 
> Calling spi_controller_put() manually in the probe error path is
> redundant and results in a double-free.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: axiado: Fix double-free in ax_spi_probe()
      https://git.kernel.org/broonie/misc/c/7fc5e2f5603c

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


