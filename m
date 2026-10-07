Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EB6CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSxPZEPR5SziIXhK2HrZDL72qyLOyeEGstZGusBKpNM=; b=3NRUlOGAMS7es7RK3YNEH5NjU8
	c97Runy4F2oiA0O4El5BT/+nvbqw9RlwEOJhYcuiJJ8t2lGdcPIkxZLHT/QLo9X3n5NkCgHFqP8yw
	FDDxWbWxFxLHzrGd8Hdd2EkWwQig/DhPbyLrfdMeJSbUM1pd5UudbWD8RepOozq73ZOR4dGApvb4o
	oiCtLGrH9PaMxAN2ybZf3iuq4ADa8aZ5dxBy2zRpeq4uobv3dfxfZmUQsgr0A6vN64+7tDvq7lD9m
	Lg0o82aBM2I/vF71ClqwAE+doR9sKlhcf+Ux6pqjJAOHm2N0vyPPrwvRjatDesTkM+7Ohc5cKQlaB
	9K8uTWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiPK-00000003jDx-3TeP;
	Thu, 08 Oct 2026 07:19:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiPJ-00000003jDa-0H9s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:19:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA1274404B;
	Thu,  8 Oct 2026 07:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F241F00893;
	Thu,  8 Oct 2026 07:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443952;
	bh=LSxPZEPR5SziIXhK2HrZDL72qyLOyeEGstZGusBKpNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LQsfXGtdDAq5hxoRYFNW5Bc7NQI+wkUEG7tOAvMv450ED0QbJr+NjFOIOEW0tqXCg
	 0JFra5nKNM5H+TIHlvq0la45Xz/b8+3jCWG6mvZZp9QcYX/zCYhD20jHfcC36J/4KH
	 Rvn1vvl3UwijR664CP0qb0Z/wlAdkgd6lrDEP2wi3wNubzBNZzfYb/mwRYgk7XVT1c
	 x+9/O6+fzwKtxkw7NMV49CBCUS+YGoGmnl39/KsFBRyO/9Xpp4GGUGJOqJdnZtHwy8
	 SlCE3MO+FMBUjLy5X6Bnzhc9MU3biOun1q7E4QKy7JEz/5OSKvJjTsFs2AqcUfNV1v
	 YBk27Mf8I7bRA==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Pin-Hao Chen <billy920225@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261005220528.7199-1-billy920225@gmail.com>
References: <20261005220528.7199-1-billy920225@gmail.com>
Subject: Re: [PATCH] spi: stm32: fix double free of SRAM buffer on MDMA
 fallback
Message-Id: <179138619954.2423942.17574965828667602495.b4-ty@b4>
Date: Wed, 07 Oct 2026 17:16:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8RaKJJa88G/U43Om9GWKyuM7R61X/xlktmHdGJHrtew=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0PqnniUR/n8Cc0GizO4cmryq7XxHYvsVWhR2
 Isr9QXQfHmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdD6gAKCRAk1otyXVSH
 0PEMB/9jChwCIe3aM1b6h8T/3EjY6c0rCpzb8LBIjBXSH+I3C5muPF31tDmpJbZlA2rInp3S+54
 rrA2HswRABIZY0iAnIXZVh5efFl219B4cVRO7IuAfbKdl81A/do86DIal7ucBKyojoKV8w9CX77
 F4EvzTeWzGD+N4pqlHYl5lOzdOeSmBuuw4QZAaEV/Y7gXuYKAio9Dd5xS5VHUP1ZrsuF0hQOfHI
 rdyALx0PiErmOjBiUuqIXk9eDY1EvWzkjSExiKNZDlAnYbULFwnb3KYa5UrnSaVtPoIC4tgCyOr
 cdsb7teB6Dzj8b5TqPgDmJ23v8//S2LQLYeHBHxtiyIVuYMK
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

On Tue, 06 Oct 2026 06:05:28 +0800, Pin-Hao Chen wrote:
> spi: stm32: fix double free of SRAM buffer on MDMA fallback

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: stm32: fix double free of SRAM buffer on MDMA fallback
      https://git.kernel.org/broonie/spi/c/0c5b0c3eb1d6

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


