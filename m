Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF28C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVPmOtiyGymaUHvGHWNJiVVfq8sCCje7jrMUD4Cur90=; b=CkhdrquDu02hSZa0E1uUwhc2y/
	hWYAQQ5d0gkmmmyXYx3NNadsFAhp8XTYvXq7EEYSCDHjOz326FjlgotR3x7UZhLts85Bc5x0z10B5
	C/xG4mR6XbbTlNNTBFpxgKfE40BSrKqhp2WWLRlCVR8HeOwHstQkBt3MvIfpNyIiHbQ/uCTycZqIV
	NnIl8K+ddIzwapQSzjxyzS8dnp13jTyjNbXYqxz4Wnklo6n8TZHXeHy/TiJgje3014cR1saWYjqEv
	MHnq2rIQ8zzkVCe4HmZYXfFYO5NIy0kBhtvDm4sQAGNgOUoyEPRsFsHp94GS0Jo98An+844EwTCz4
	M1ZjXYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxu5-0000000EatJ-35tc;
	Wed, 15 Jul 2026 11:35:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxu2-0000000Earv-1ual;
	Wed, 15 Jul 2026 11:35:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A992434AB;
	Wed, 15 Jul 2026 11:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABF71F00A3A;
	Wed, 15 Jul 2026 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115350;
	bh=GVPmOtiyGymaUHvGHWNJiVVfq8sCCje7jrMUD4Cur90=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=c8gPhCu/TKUqbcR0ylDm7VI+IHLGtfS11ZwKJtVLxoMSrXqMUN+1hIUZvlXsDfy6O
	 ViH4bGcpIU9AsjQTGa1A0JksaPBXMbmSvj25Cjn2202aQw5A6DsBjFFRaX7CKcX/Pe
	 mKSopDK5CEZSBHj/f0rrY+8SCuq3zPAFSqyqLE/MpTFG0pxBNjUX5zD61vr5d9IdfB
	 lqSOw7P1dKcAl66XE00PrXzoQd6LS7QHCvYWLcymEekNoKxmxZq256f3i571O/L3XA
	 KUfzbYaUAct6B7ikRrJJHXsbgRnHfMgwr/Q1ZXMPkcg8nrpbXtVIx5xOOf95g+dwS2
	 KaxTuLZ10zEGg==
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 linux-spi@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260714164215.183809-1-colin.i.king@gmail.com>
References: <20260714164215.183809-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] spi: bcm2835: make read-only const array
 pinctrl_compats static
Message-Id: <178406403166.7661.9867975248660061132.b4-ty@b4>
Date: Tue, 14 Jul 2026 22:20:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9nnuB1fqJSaQhxX9t366m0Ukz3gVMDVj7wyBMmrJHuQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqV3CTMOwSqGeTDhkxx2Zr5CzjZcsf+CTWe3x4g
 CStB7IohQCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaldwkwAKCRAk1otyXVSH
 0BO4B/9cio96bw8Ib1mcHoju08NqAyYc6spD77PZS53l24iQr86lUU86LurrTiodnKcDTWpx1pD
 My9M4rPRlT/WRQPxSmasGxjZlADdqc/ZGnIvh0cRqTZ3cymKwnnmAZbCA7OxJ0uD5vIYWlK4PBs
 fgiIB5MUU7S8rOC6jTjxZJnJuvWn4lpbpG3kNxySCQOxktwSijUX1tQWAK4yESMYzlHQ7YnwY5F
 RrRMdAo7yLnYM+ghXEdT9dlophgrYbCBorAmLl16RAa3R2ohI20TzlGORgfw4SeYH4NHsFMw+Ev
 s+Kz7HnB2dQ7jkUpgrT4dVAVYMK2Up42KgK+xR/0R3etqTsK
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

On Tue, 14 Jul 2026 17:42:15 +0100, Colin Ian King wrote:
> spi: bcm2835: make read-only const array pinctrl_compats static

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/1] spi: bcm2835: make read-only const array pinctrl_compats static
      https://git.kernel.org/broonie/spi/c/9c4a2dced735

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


