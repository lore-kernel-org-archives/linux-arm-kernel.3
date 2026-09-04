Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F206C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 20:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbT1VLDIS80UBAzC8yx9HtCTeNwNwTpzzQk3VWwmyyo=; b=uHijbUJMTLGhu7G87p1Q8ZZM8I
	zDTFRN2c38IgbPdJuFYkJeDrp8byAQelTAhmkINsGP38FPHCREY8MU3BoQoLnw6lpqz7Mnam0vAwu
	4tSOYggNr16obGvWtmDlvnK7AyYipbkPAjshZSthiWrYRBCOK3j5VHhvxF0VZw34vodFX3PCJOxAC
	q+714p0ESzIHXPEebxSU+JqFpDe13gFriQBZEjvliK7J45AhaGrROAl3h3usx7mmw3gsfrLE6K64Y
	7nItl44B4A5IBglLkzXELGK8lsZ0tsiKFaGIZn34sIUPsknXkPP4h/0tUQmyrx1GpSYlk4C7x2Y/k
	SpCjEDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aH6-00000003Eyr-1q5v;
	Fri, 04 Sep 2026 20:12:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aH5-00000003Eyi-1CGG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 20:12:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71545600C8;
	Fri,  4 Sep 2026 20:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C154B1F00A3E;
	Fri,  4 Sep 2026 20:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788552754;
	bh=lbT1VLDIS80UBAzC8yx9HtCTeNwNwTpzzQk3VWwmyyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hg3YaQh8sb4xeRkcp2NOeZZFgQqcO1jOd9zcKjr3bsQqpv/d+JnnUlHIeZ82GVczI
	 W3KusPXZraaxOEhVwO+HCEO6FqBXeVwx82kWM8GIXec2XiioYlJ5dN8XotmH8blSW/
	 4ihFmADP/eWDNWtAfi9f7dHhLygPo1MTHJ3nMs0PROiAbSAynnARmgaXqwZLEuFSc9
	 Z6jr83uc8vWdNPY688R3CeGvuRJ6oVjD2QNLBexs6pv75IzI/5LGY2EI/wHYWUTwDP
	 5KPIjaOJ22sJySnTk2aa18jCyhyq1ASgisisKoseYhUWh99OhifQ/r4jFK6KW2HAqZ
	 bN3SvVIdG1tlA==
From: Mark Brown <broonie@kernel.org>
To: ychuang3@nuvoton.com, schung@nuvoton.com, 
 Li Youhong <dayou5941@163.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Li Youhong <liyouhong@kylinos.cn>
In-Reply-To: <20260901025129.359960-1-dayou5941@163.com>
References: <20260901025129.359960-1-dayou5941@163.com>
Subject: Re: [PATCH] spi: ma35d1-qspi: assert reset on probe error paths
Message-Id: <178854594307.632048.12009363322377734268.b4-ty@b4>
Date: Fri, 04 Sep 2026 19:19:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9NNiNkIhkWioxv54G8qMXV7N2CmJ8UHysUOt8WjPS6E=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqzZanpz7WqSbSyq8kOFLfzyug4YdbzQFg5YNPNRxjOd9
 sdF2lydjMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBE6prY/6nZMUpMCZzaYBM5
 Q1/mRcBapbyFiz723il69yrec2LjEQ6e6sB9m3I51ORPX+K/dlbN0F0pavs0hozZhnuBJvnayJu
 FauYf+xi7ojO9bt17ruCfffI965Y/PcR6Wkj2V67zte3OLcJWv0oi7snVrYgX1I9YtujyGiFjCc
 33Jt9+N2aoZcjNupRfxxpYuvrJc95/UvPuBB2xU3iXb9O3w0Ps3MrmiO9FrYIlF5T81Y8bNRbZ/
 7u4yXnDASdN0fsXAlmtMw//e73Ax2La7hUbpjFq2oruLDDccebaobe1u25yKQZ8KDCavFqzVbZ8
 js3lwMLCT+F3GdUTGxas/fVj4yfvic0dc58/+3ZjM+sCAA==
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

On Tue, 01 Sep 2026 10:51:29 +0800, Li Youhong wrote:
> spi: ma35d1-qspi: assert reset on probe error paths

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: ma35d1-qspi: assert reset on probe error paths
      https://git.kernel.org/broonie/spi/c/8992169e7ac6

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


