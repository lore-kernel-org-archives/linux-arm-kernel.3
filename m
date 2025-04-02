Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F32C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzVnI76eV2KauOwxh4jsYfdf0Jq0IiMW3tnIwP1yyQg=; b=4rdKVmkW2z0by0vKq42Cr0KuDt
	l9Ui5ZoyZnLYV4np3vC+n19fjjKMc9C4zPbQm4fkHsaCvf5g0vXI0/2G+lKrq0/tSYz7gOAnA4el0
	lsTxbQE2cJdiql6X6Tjz0naSKzb8eXviKd57vGDkxWnY4NftTh3a4dvpLjlF0CMPwHPdcKbTcJ9Cw
	uKq92ihawSXRBaW0iHax5+X3ozrteWkGh4YXN+jHJMCT/szWbYaeC3UNDCeilsc28X6gEcWt+hZpT
	JepT8TEfhyXTVBFFXzilnoLC37oH+qt+lcpzp5GYZ7hg5w4xLuk0YAOBz3dcVETUwPPDO5nx9hQkb
	g8bRps0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u002g-00000006WLW-23of;
	Wed, 02 Apr 2025 15:30:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzztI-00000006V0o-0X7p;
	Wed, 02 Apr 2025 15:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8961A5C68FB;
	Wed,  2 Apr 2025 15:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE1EC4CEDD;
	Wed,  2 Apr 2025 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743607231;
	bh=3klwY/13y3eX/XjL82BJOviHTrEYQAUzY4Y9RpKHRZ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FoBJxK2r4cGE5dlTh4rBu7MeILUjBBiBhUiou49P7bRTgWiEvokTB9ms1l53E9Pzb
	 q0zoBpo6FT+E4H55yt9Qjz9MZaSxSwegFZyRm+F1+gOYUnZ5LiVJ6vSMWl3Ilo99vX
	 RzruOvp74nMDWxiw24lu5b/FH/TlpHw+tK9vKLiZz66cbKp68LDjb6SF5GpO/EKwxT
	 IGDsAu0pgAtsdpwhEys50l2wwvZ7kvYki91URZqfNQpeyn4K+Bb08LTmHRYuWlrR5a
	 K2mK9U4GxQfyZqOYm1nznvDzzYvXCKuO7cR6pgswU7IsIu+6hlgyJE5UINOokQ5YPV
	 eRYMgI1JbOhYw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-spi@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250401233603.2938955-1-florian.fainelli@broadcom.com>
References: <20250401233603.2938955-1-florian.fainelli@broadcom.com>
Subject: Re: [PATCH] spi: bcm2835: Restore native CS probing when
 pinctrl-bcm2835 is absent
Message-Id: <174360722920.71466.13412350626935947497.b4-ty@kernel.org>
Date: Wed, 02 Apr 2025 16:20:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_082032_211862_3DDA3278 
X-CRM114-Status: GOOD (  14.28  )
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

On Tue, 01 Apr 2025 16:36:03 -0700, Florian Fainelli wrote:
> The lookup table forces the use of the "pinctrl-bcm2835" GPIO chip
> provider and essentially assumes that there is going to be such a
> provider, and if not, we will fail to set-up the SPI device.
> 
> While this is true on Raspberry Pi based systems (2835/36/37, 2711,
> 2712), this is not true on 7712/77122 Broadcom STB systems which use the
> SPI driver, but not the GPIO driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: bcm2835: Restore native CS probing when pinctrl-bcm2835 is absent
      commit: e19c1272c80a5ecce387c1b0c3b995f4edf9c525

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


