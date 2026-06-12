Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B00CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rjf7u5kij4vJaq9pyQURIZj1Xgzs8ixnfkyI+QpjFFI=; b=JI+fJOytXJVq7VUEEbD1Z+AQBG
	gpEwUh4TQXWI8X1rYh8D/GYlerLQgMqXBV07NmKK/TL/UaRUV//9tqy7Yn1+FbLd+myjP7RQhCM86
	A2QPmMYWBTjN7sbwCbJ5hSJ7fWcl3eJFE7BMPcdAilZgnmYGylObz8u3jZPr3r9mqZ5rgxj7YWKVQ
	9zyLXLyAKFQy/iKuTATDepFtzwQeM3JdvfFeQd16kCY6p0+vb1tGBpen69q8O7TBwidV49f6w/UBt
	X9cGrDwIivCFeDF6BK/S8SnBJWEaz9pDz1Iljyhv9tmUTG2UufeEH3MlMQ8TMTijOEFkXQdwnJTte
	6GnACrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAE5-0000000Bey1-2LYL;
	Fri, 12 Jun 2026 22:19:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAE3-0000000BexQ-3Pp4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:19:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4678F60008;
	Fri, 12 Jun 2026 22:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5635F1F000E9;
	Fri, 12 Jun 2026 22:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302783;
	bh=Rjf7u5kij4vJaq9pyQURIZj1Xgzs8ixnfkyI+QpjFFI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LuJZTpvTk2xBE7GFiJEjOeQyZwDAIZe47EsLII2soWXEN/C2kFW/qx4RIpYgtJ6WX
	 N6RP/o54Da5WzlzbW5fvRa80oH4Y/ZZOsSUZ/eLi0CGZmGZQIQFy5H1GmssqdPz2jL
	 1RuZu5HMqtvgcipZo6J/V2wId9oAiVRjsQXL/aYE1rMjDjIKE/XaWWlUuCqpmkN6Mp
	 x3o8dL1vidOO5D19+tqgej0JvmF4HI4gXtHQntzh384ecLZyl6KvEa5q6oHxfukYNm
	 JAKauTgJg6MedMgAiPuerSLNy30mkoSQUtGNlEx6dIrwgwZqzdak7YY3GxRmlJafhW
	 SdlYC+HUc+quA==
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 lars.poeschel.linux@edag.com
Cc: Amit Kumar <amit.kumar-mahapatra@amd.com>, 
 =?utf-8?q?Lars_P=C3=B6schel?= <lars.poeschel@edag.com>
In-Reply-To: <20260612105244.9076-1-lars.poeschel.linux@edag.com>
References: <20260612105244.9076-1-lars.poeschel.linux@edag.com>
Subject: Re: [PATCH v2] spi: xilinx: use FIFO occupancy register to
 determine buffer size
Message-Id: <178127049350.48375.2372816224344426076.b4-ty@b4>
Date: Fri, 12 Jun 2026 14:21:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bxtw81kStBvPUM2laRswuDU3GDsQW2OIqLHNHrp4AbI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIX6lF1v6PkuJqGkJwP+TJf9yiR+17mD+/wb2
 Hp7ke99gc6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyF+gAKCRAk1otyXVSH
 0PGrB/9N6cPtogQCaTQdfOVX/73iUZUSAgYGIF08XOXQRpRjrhCzo6eQbfeyZSaebAx8j+MYt0P
 L51ITSUp9BMvd1OegSHN2DK65rDqN67Lvj6lKfaBBMiUNTjlKd7KK3yPax+0Alc+inGgNn8ZuTu
 c/fglPEzA8gHpo1/XvsVmh+p5RJTLzATAdJKo/7tFK4tmUX2+a5NzeNF0Ae6d9VYhyx7TsDw8KP
 YqqauBhSnRA1piPgE/dfeEBHR6x9/0hO3N5y0rFY8f+oZmg7gFUf9EvEdYiV1tLc1ny5zhD6bfB
 nPXYDqhHSnB2DElDucOGoQXqEVCbvgLZiIDm3c9PBsGPystY
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

On Fri, 12 Jun 2026 12:52:44 +0200, lars.poeschel.linux@edag.com wrote:
> spi: xilinx: use FIFO occupancy register to determine buffer size

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: xilinx: use FIFO occupancy register to determine buffer size
      https://git.kernel.org/broonie/spi/c/47f3b5365536

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


