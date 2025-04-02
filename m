Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E07C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i65f8xYTW8s9cy+aA4eZeWtgu0ynp2dlk4ikTwHC+Dc=; b=0OEUXeMThDzrLsGfBF29FlMpz+
	OchqFu3mZsK8bF+wUfv69oRKIeoTybEcBiMRRNYLVX2aCQE6Wim/ZJRDXy0imNteGC444B7em81U9
	10cLQi9g33jT7cBtmR9y3f682Lw3ejILye5g3apYfmUcdUQiOFA6qLBg2v9SwyIjAA11PJ8z7x15T
	NZxXdLzO1dw6/AGvfuNh083x/cCro7z/cNowuiuyeiwHZVr4a7K5cyIsAWxdEA2X4Cm/+OLr3brgw
	hGz9N7Z191zG2tZ9A7TU6KEpMg2+JY0/y2TMyVjDZ10ip7u2CVlrP5rqYJRTCGe/nxb2jLcMgG1J1
	EeQeaJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwbg-00000005yFJ-3xlF;
	Wed, 02 Apr 2025 11:50:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwSN-00000005wHs-0tOS;
	Wed, 02 Apr 2025 11:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D92BA434BD;
	Wed,  2 Apr 2025 11:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDF1C4CEDD;
	Wed,  2 Apr 2025 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743594030;
	bh=rWw1nvdooHXL1b328RODRK4t6uLOG2YbVobjGz1PYjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tZJIdwOAq6sWLw00g3WJOxMk/ZXoFvX4Wxd8pQ93qwiGzqrHP5GI4mmTboQsW2H+e
	 brSJ5kE5PSCbW2/TZWNDlb6C9XkHsb6pNVCG66yweM43NkpkH7JztqUVzV+boquyNn
	 5/3GlRbyh/CmVRHoXrDw3VvoUHDEra3+uX/DwzhZENoB7SQARbEbQRfNiB5AjfC1jo
	 rJOrLVfXnqbnOmW9AZT1Xi/dUylVeyLRj5uv6bJO0Y2Ib6uBH2ONqN4D8kDKr08lUW
	 tJUED4We9ySNj9wx+HORMiOd5LMrUH1ANbZW4piJWAPzCuMUrmBcHaHRHnSBgg8OL1
	 wBG+sQv1wz9Rw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-spi@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250401224238.2854256-1-florian.fainelli@broadcom.com>
References: <20250401224238.2854256-1-florian.fainelli@broadcom.com>
Subject: Re: [PATCH] spi: bcm2835: Do not call gpiod_put() on invalid
 descriptor
Message-Id: <174359402811.29241.11140395458491844797.b4-ty@kernel.org>
Date: Wed, 02 Apr 2025 12:40:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_044031_292270_793AF60E 
X-CRM114-Status: GOOD (  11.92  )
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

On Tue, 01 Apr 2025 15:42:38 -0700, Florian Fainelli wrote:
> If we are unable to lookup the chip-select GPIO, the error path will
> call bcm2835_spi_cleanup() which unconditionally calls gpiod_put() on
> the cs->gpio variable which we just determined was invalid.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: bcm2835: Do not call gpiod_put() on invalid descriptor
      commit: d6691010523fe1016f482a1e1defcc6289eeea48

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


