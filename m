Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE42D58D4D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYVKVjUh3XoFRLrIYkad7XkYN1dPGDXQfYWne8LAmGE=; b=JQZQOxhO5+HAjK
	gZyephjAZq1rMOay4V1FCt9YkldV7EbR4GnK3nzO1rG45cgaXJMywEpbYP2AfOqn+rdQsbyrooTx2
	/N9Vox1jNO9lDKzk1LSNnbl/IhI+8xPpFQamjjjWivGDMHkqFvE6aO9AhzkRZx1LpYzlzgoRr9U3V
	omeodqpmf/cYbAzzQfjEDlVXhESNH4Qkp3oTCeBKhxnCly/3YNv8Eo3/osXGVz6RI+MaRGcKYflET
	I1YfnXjzF8sGoTXQgJWAh/+BXvnqf9QOjy+D8CyC2XX4vIkpf9DIvUdH1MdEXdOSlnbVEkmTJuw4G
	Jqf9wvsnCQrtfaZgiQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZqN-00000008FQH-2ZaI;
	Mon, 25 Nov 2024 14:13:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZpP-00000008FCd-0WUs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1747AA4168F;
	Mon, 25 Nov 2024 14:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370F8C4CECE;
	Mon, 25 Nov 2024 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732543957;
	bh=7GrKwdo+Ze02RMQOa0MhC0RENsxkBytNYFyBKpaDBzw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YqNN12anDTPC/J9xLvoC8O2JGI/txSR+lJGBk6Z8ijAnbaFajvSShjObNisz6U+pZ
	 pX+xn5ApwfQql496eArXVDVlFSnu8Z2LBa52RwR1dBgF2IzIxCrETR9HYZy1yQZeec
	 wbLQyab3nqsPTVO667W3HC0a3pOlFIyl0E6RJU84vyqYICqTOztq1FRjzUO8Tvz/6Z
	 YL/y5LDbBxhmbAEU1clHwm+g2zi70YZH+ENE8J/YnOqrvu67+ZvRxKMQB2nz+MFXO5
	 1NDFX+qhN4QbConZYck+ubB+fgOBC7UopooUB1QoUvH8DIN3v5wswEye4P6QN5olJN
	 jUR0thFQ9RrbQ==
From: Mark Brown <broonie@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cs=C3=B3k=C3=A1s=2C_Bence?= <csokas.bence@prolan.hu>
In-Reply-To: <20241122141302.2599636-1-csokas.bence@prolan.hu>
References: <20241122141302.2599636-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH] spi: atmel-quadspi: Fix register name in verbose
 logging function
Message-Id: <173254395595.42978.234561624552571601.b4-ty@kernel.org>
Date: Mon, 25 Nov 2024 14:12:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_061239_223104_2CEB659D 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 22 Nov 2024 15:13:02 +0100, Csókás, Bence wrote:
> `atmel_qspi_reg_name()` is used for pretty-printing register offsets
> for verbose logging of register accesses. However, due to a typo
> (likely a copy-paste error), QSPI_RD's offset prnts as "MR", the
> name of the previous register. Fix this typo.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: atmel-quadspi: Fix register name in verbose logging function
      commit: 1c6f3eb4f394d8bb14b2b677151c347a0db088eb

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


