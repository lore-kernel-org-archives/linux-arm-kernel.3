Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C987DC369B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJ2x+J/AmdS4OiU1XCgpOCATC+bPho36BXIweRCpFzM=; b=1EONT/13Qgx5Og7yQOK5cTJlhl
	HqzhFU/FiXtEi25xGS8a8tTZrk2Uh7GCAutgSooX9yVB746Cjv+3y/AVXNM0YkEbL9V2qtb84M9oK
	LvFIHq4Rs2qNLK9f8hED2ECi9aND3bUu310eCDajhD0vzEqJXZ2t3Pnv7gQrZbyUu+VcejnYoRuz6
	tlo7zgNfUpbq2I6wpWGp5xi5YsWOFlK57JK/OKthDhhb+pdfHxQAOEnmfRCxZS8SOCW0uZPb2yhdL
	Crt6SvgWvyCVCzrTjTmAfFcRQpJqYo65gSUj6oNUG1l7nz+PQ6NX3zl6D68tWEGkmoIU0mdqp1txQ
	YvykMGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KvD-00000002PiT-1y2X;
	Mon, 14 Apr 2025 14:36:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Kka-00000002Mpr-1dPy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:25:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0567849F45;
	Mon, 14 Apr 2025 14:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE2DC4CEE2;
	Mon, 14 Apr 2025 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744640727;
	bh=3daDj0mcIsp68OogGpd0fzNPIdyotvmgnk6RkCbuVWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KyP9D3Nvl9VPs4Y+adIbgJ/kWDV8oOJFDl25SW4Z8E3+fC5MdUg2iVjQ3ngxK6IHd
	 xveMv/ctz4aIS3rkjZhiFXun4FauYhVpTc2nNHA4xMvq6kV4ZiXWvPE8melIYiWUd5
	 WyGC28M9iH2WBh+W4SvBqfKeGzMPFqTKT7rNVN8Sl0KmrJ+8iuyGjqxdvXf11M1So3
	 bYcp2JgZBOB5D553M4LCbhOyqODMDAxOKOCe8jJj0cRJvhNAuI3A2Docv8DbQn/jS9
	 Hu3nE2pUhk3iL5f667EVFF7Ns2T2KTRFl8m6EvMW4c6HiwJsh4+D8qw7O8nW5iH2aW
	 d7RuK1wsCPezQ==
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Mans Rullgard <mans@mansr.com>
Cc: Pan Nan <pannan@allwinnertech.com>, Maxime Ripard <mripard@kernel.org>, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250410115303.5150-1-mans@mansr.com>
References: <20250410115303.5150-1-mans@mansr.com>
Subject: Re: [PATCH] spi: sun4i: add support for GPIO chip select lines
Message-Id: <174464072481.99542.17446384569030524351.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 15:25:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_072528_453273_5E9AF073 
X-CRM114-Status: GOOD (  10.81  )
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

On Thu, 10 Apr 2025 12:53:03 +0100, Mans Rullgard wrote:
> Set use_gpio_descriptors to true so that GPIOs can be used for chip
> select in accordance with the DT binding.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: sun4i: add support for GPIO chip select lines
      commit: 36ff6c3f5084f2dbb6cd89d15b78cf734e9abfa6

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


