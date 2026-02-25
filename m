Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE70EFD23F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCFVFObzWl7uiJ7DKi9f+WMWIZEu6xCzwdS7RV3hLJ8=; b=l2vNMM+KLi0mgQWbe2bFPjpPx7
	XW7ynscaRCTcwthxWjRZokpS/7mrzVdu8flbIKULwhKT5+KajWXIZQL7X8bBBYvgSLd/NzSyt8/30
	A0O6mvMRbdjVwnFlGA0ezWHWuHW/009/HV1dKm8s0dEY+56JDD1fN9vQ3YoIpTGm0qF4KNP7v1HbX
	a+f3LonVr35oi8r/jGznKOw34E1uqDgmFIooL76IwTik1Wl2pn4rjTx0oXrdlArYpAxbdRytg0jY0
	3e982vZ7m/sgAf14tU5ceoN844v1USk81Pxir8pSZDnTqnp0HiA4x2ppXvY8r7TwkZlDmSLBnoJNx
	E0PSMcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEi-00000004lmH-2ZNl;
	Wed, 25 Feb 2026 19:07:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEf-00000004lkm-49PD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 19:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B09464438C;
	Wed, 25 Feb 2026 19:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EF8C19421;
	Wed, 25 Feb 2026 19:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046469;
	bh=/fC8mtMNV8v0M5K9EhKSE0JzfsOboD027+MkCKRsFVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D1MYwCeihEtPbugUoN66TcSmkPwEuC13KnKlBhIfCu5HOeOkL7ZIAgzcDz+Kdn0jR
	 17sslS44CPGIb2a4sqcMsZDBnUa0vsZYcdYYptVT0Xz8vSZnnM27Y2IMfEGmA/Bw/c
	 GifLKy37po9Yk/D0JK2HmF3r64o6C0jA+r8eOlCmVdNhymGybK8kGmQR2KKKny8mIt
	 hBZ3Nsa12A8E7aiRiWbm7vcv3dEbQndr25h7ePUbypRszc8OaJGCpLS4resRVhScmQ
	 M3fktNxF+mKN1fSDOOuLa41jNlpOoZfn2FDqyAYzk91YytmmqYxZ7i8npATl4ykvqQ
	 JM87f7eNUZ44Q==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
In-Reply-To: <20260223144437.2836369-1-andriy.shevchenko@linux.intel.com>
References: <20260223144437.2836369-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] spi: pxa2xx: use min() instead of min_t()
Message-Id: <177204646782.169139.4278556764726477870.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:07:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_110750_246936_46825B90 
X-CRM114-Status: GOOD (  12.97  )
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

On Mon, 23 Feb 2026 15:44:37 +0100, Andy Shevchenko wrote:
> min_t(int, a, b) casts an 'unsigned long' to 'int'. This might lead
> to the cases when big number is wrongly chosen. On the other hand,
> the SPI transfer speed rate is unsigned and driver uses signed type
> for an unknown reason. Change the type of the SPI transfer speed
> to be unsigned and convert to use min() instead of min_t().
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: pxa2xx: use min() instead of min_t()
      commit: 507a071d9868cb60e4e76f8a06fc8eb014f59ae4

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


