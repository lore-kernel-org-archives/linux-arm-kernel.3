Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4E0FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 03:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=285hWYc/kFXdZ4MUmTwcW7eKNWuOlY/ZotYC0OPQCtY=; b=VoYuCF93Jne7EcA89+ZPZbRqI+
	Jlld9x1nNC2QqQj4Yc9a9ZgGJnVr591pSrsFOoBoJd7ZatuYGXdciBwOmgrTcJJmgPO3ITU2kNVwj
	G5ZgQVnVFpEPjkvUk0QDxoqQPKkFqNDhnMj5L//P6CtSL3zzp1eIIudIeOH1KgBIt/ae0amf7KlQ1
	vd+rkemP/9J9hYXZ3PZtDyqOgMBRnaK6CQIw89p+y4CyJuGbBidAZNJQMh2lb+Xkz+X4rWVjf9vBS
	OR+7hA+X9NwCvPBvM1uqGMw1DZ5bgtI8G6wXE4oYnj9IBwi1g3DkUGTJEmak9/KRjb7xtUWju777d
	BTEEMJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZGV-00000000VR2-0Lb6;
	Tue, 28 Apr 2026 03:37:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZGU-00000000VQv-2y6I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 03:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AD6860128;
	Tue, 28 Apr 2026 03:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B77C2BCB3;
	Tue, 28 Apr 2026 03:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777347457;
	bh=NEf/nz49Jg5cePXiflaKdHCDvgtTYKtPL33NG+khY4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S603NHWzzyuuW6NGjbe45U+3g2zbeeyN+6WY7hmeqEFU49pCh/qP4icOtTAtOItMZ
	 1HfjdtUWUgiUcVJoRkSXBAK+8CtIwLuHm9aDOYVB8Jg88sVryiwHRVPUDHJRwuKyeg
	 DEShaIYqiLN5hnBAj/2fZVugNWLt4XIivYqfN+aiK9hl7099ErQ6hMrGhgOzFnh62M
	 hBKdxSyk5wcTZ91qT1/QCBBi0Be3VDvhi5L+2lGhQ8cwXmhmI/si2CCeb/jvrX43Gj
	 UTq/yWw8XSk7dCqMU/bjl577g5VSBXXcK+YDIvaX2VU9mnPNIlTUBAwemnI40H4Xj6
	 bhH7iUA41xLsQ==
From: Mark Brown <broonie@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Harshit Shah <hshah@axiado.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260428-axiado-v1-1-cd767500af72@gmail.com>
References: <20260428-axiado-v1-1-cd767500af72@gmail.com>
Subject: Re: [PATCH] spi: axiado: replace usleep_range() with udelay() in
 IRQ path
Message-Id: <177733296453.324244.7720403151697677139.b4-ty@b4>
Date: Tue, 28 Apr 2026 08:36:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NEf/nz49Jg5cePXiflaKdHCDvgtTYKtPL33NG+khY4c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8Ct/MjDAxn8mdGp6ObrdIsYa9KFm0Svgqfo4R
 hLW2izo2B6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafArfwAKCRAk1otyXVSH
 0Hj7B/9yqUS9eo3ZW3/ugPvk+J9hVbs7T5ZfOhPCDnVLIwZgrsUNXbz5B98NkQ56+wqLz0YheZl
 SeGKo5ILY+W/5CLwYcM2jsmkeHxcijMXZvQ5kOPozbi/YC0CkHGpGHnORxyxbbEzFugDnfVNtVC
 +GXTRVcAh2ZRLsiNsEuXCljwRSCU2lXIn6jCkAyUcIbnKpl+k0zGQjj2fHg+qEGNsK969I6t/Q8
 8RNz0u/rgM8QaPbcvwdmGw1wdayIUuINpuhiePyv+qMU7ZmsLqYxSXWxMuLt9y23dbdoLuXcXLU
 fpcrYfijy2bTh0m6llpKpz4ccjoI/XY7PvlDiCLlRHlDlnqC
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

On Tue, 28 Apr 2026 00:33:04 +0800, Felix Gu wrote:
> spi: axiado: replace usleep_range() with udelay() in IRQ path

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: axiado: replace usleep_range() with udelay() in IRQ path
      https://git.kernel.org/broonie/spi/c/f5c6a272b699

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


