Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD9EC5DF77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izd/HCzGE0yxE0o+CJ1/xuChvzuNC7U0xyJQJ7s1Adw=; b=z/RQcjOXk90ZQnH6PbroSp1Pgf
	pclX5YKuZOhd98yHnke6gyC7qBwG35ZHQeGGUmFkHJCfpHnnD+AXe7klfrvw8k6ptTstxa1YSTHeL
	WdqYH/1C9Mz5vXeFAY0LcAf7I54ciQQFo3BphMFxDw9UvW2xF7m/sk7zEmTxUs19yagGsdy5dJGds
	rdJXgkF54HdYBLSSMJ+ePpJhf4pasA/ksJ1Px+bSQVHfDfIZd7+GsaWDDoWHDo4sS2+VE1jpmck1D
	Ln2jPuS5WJ/IkYrY74DOS4MxE2fmC41JEK/80WFRqmXAsUnz1OseChMXJMW0IJTZvTkyyGq/ifI/C
	82hHoD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wuD-000000036Lz-14CU;
	Mon, 16 Mar 2026 01:38:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wtx-000000036BN-1i2t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D607960008;
	Mon, 16 Mar 2026 01:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87591C2BCAF;
	Mon, 16 Mar 2026 01:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625068;
	bh=o2Kt//keYJ+NgTeHopW+uwqqu+ppeKzO49PBlKK0bEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C1O0f3aj4g8guDb9Ggr9S9XmVgoShCmQ9BuLZT2O6coVxka3j/7wV/Ta245IUZiD/
	 5sE/OGQwb9NJPDfmbLNUuBzOIMAC60bn8J0ab1xRnsJ6Q3B5LlQE1hfjhEVuHpheVL
	 vxqNw3oZoyiMirz46O1fdxzq9FXaSBU3GNung4xJ2Qp0FZ1qLPgTWcdmf6HGr/ALxw
	 rzrdWBQsQnQu/DvngHi2gMNhRzeILtWc247jk7s/lexErzvMqL22MsKBx/uFrVAKEL
	 iB93FHqnPqRAQ/k3yf/41E381wwMVFSd0qNjo0UhzrX8kxFungFZfei8BmGw9E/YHO
	 1wHmwtQGJzAHQ==
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
Message-Id: <177362094240.178501.3639810667396404638.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 00:29:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=broonie@kernel.org;
 h=from:subject:message-id; bh=o2Kt//keYJ+NgTeHopW+uwqqu+ppeKzO49PBlKK0bEI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt17pvrpdD7qpehSqBYHlW3c5n0W2MDvd8SiEK
 zYl1MmgCHmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabde6QAKCRAk1otyXVSH
 0BxHB/42RQEE9PvihKdowhdlYvGJQ882bYEMYvjBp9yrekPJUsK35hnaXnh+pfw+Gzqa5shBKcA
 9PJXO5O28NUF243uaH7umcplQ4Lr413leHxLZK5Ql6RmhGnJWlqL7A8AIVt8kADCNUT/yCQBRs3
 TnSbQqg9HLO88x4SUtaZH+He/2WCe51hbSDVh0RuSsoAxuVBNB8v3wPnvGXpOS4Ktdk4Oy2sDmf
 dtKhw4sKyw1AYcGLQ7lmti9OwG0S7z5z/LMbljyYK6tAJyl72lJ/dkCpBDkjM9yg/U7fpFQ7yqN
 tRYCpg7FixvgEQylGjKd5tsijo223bltKHD0Hl16oB+gQnEH
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

On Mon, 02 Mar 2026 01:08:40 +0800, Felix Gu wrote:
> spi: axiado: Fix double-free in ax_spi_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: axiado: Fix double-free in ax_spi_probe()
      https://git.kernel.org/broonie/spi/c/7fc5e2f5603c

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


