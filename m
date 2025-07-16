Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BBEC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 17:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZMuO7A37Tl3fPNXRXe6hAyojciraVFHI4/gyxnAwzA=; b=LYN6KTlxI5f+ZCmU4cftn0p77I
	OwUoXQ2Pous9o7sApvpttH9AymuKdYp0D8Enz8Qb2qqbH3hGzSOdL8py8lSN/CiqV714s7oHDIjlS
	WYG4uRx58xw7zwFi+r8D+sKl7NKFLB1y9SygKkMZ7yH9RTywnnFJMYv9fKUm+Jeg3cXUb0bQXqWpn
	IDFGmiXDfS7DO7uhj8kAIXlHuGHXxwMgUp+5CIJw52Z78yqwg39RidYLqCbU4SuIAlxrOSqr/9ifA
	zOT5372cM9YjTspZNlPp5JIbc0gKRgUrfOG8hKiSJWfZZmAuFJF3fDmNF8qd8aH+3ObQjzYMEeOV+
	VQMJh+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc60e-00000008J4L-2lDf;
	Wed, 16 Jul 2025 17:33:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5y9-00000008Itn-3z0a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 17:31:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A56E0448AA;
	Wed, 16 Jul 2025 17:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44FDC4CEF0;
	Wed, 16 Jul 2025 17:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752687061;
	bh=PaXYTlyE1AmCd9f7kz8r4SkpNALOlTX1xFZrFy9kj0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RIsPrqhyv6e9Qxaf7h3jN09thDJp15IZQO/mwKshVTqYWa95vzhXZlSxH4erTUW1/
	 N1F+kqa3Fi0D3Jk5hEhCKwaEXoq64BRYzpY1gqHIcbdfCQWTOavi97qhqzxaEAYnwS
	 RoRevb3I2gJBTTmtwLo6Szt/gjD56GbFshfWMcfcEkOScawnBl1UvuHzTa4XhgJSGB
	 5yMeBlder1FV2bxGLHEqLTGSaY3GRInR3di0cjC2jMVct8LRagXyHbBusEth12UhoW
	 y2OXRTuDA82/dyb5XZ4CwPq4cRG/nOEI2E3sv0x2IQgX+lxtDgrbGBXrDfR/MayeLh
	 V1civMqJepi3Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <fb2a26a2-119b-4b5a-8d44-b29e2c736081@sabinyo.mountain>
References: <fb2a26a2-119b-4b5a-8d44-b29e2c736081@sabinyo.mountain>
Subject: Re: [PATCH next] spi: stm32-ospi: Fix NULL vs IS_ERR() bug in
 stm32_ospi_get_resources()
Message-Id: <175268705940.745920.11297005700076211217.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 18:30:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_103102_012939_3A442DAA 
X-CRM114-Status: GOOD (  10.69  )
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

On Tue, 15 Jul 2025 18:01:39 -0500, Dan Carpenter wrote:
> This code was changed from using devm_ioremap() which returns NULL to
> using devm_ioremap_resource() which returns error pointers.  Update
> the error checking to match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Fix NULL vs IS_ERR() bug in stm32_ospi_get_resources()
      commit: 951a6d8d41289b86a564ee5563ededa702b62b1b

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


