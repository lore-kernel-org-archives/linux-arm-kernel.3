Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0309CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owgt5GZRIYeDMJIHAWtLU/xNbrE+XbTLopPPhhJdwX0=; b=BadblBD3HgXWk3D0d1Pe04NEA4
	vPCdWrmNssV3jaZhrrYKaxkj17uv/4Tujd/3uRTds+Cazno7s47mkapgGB0mL0ID/Av4Ime2ornGG
	T/J2CCZFoeZf5+NUd4VZaC0F2u7cOp7om8Blq5Ph5FYO1JcF7ktBDnvCg0WyXtQJhjW9J8Lp1cZRg
	vt/te/9EQzcfsSOSspkZhbo7p6JxgO5s22H8hyCEzHOivzpHA9qMy+S9LuwPbz7BGuheFcq6yQiqm
	SI011ux+d09B1GNt9I9Jy6uH5YY3cpcvlDRV34G+YeFmFfrcUVI+r3c/JafdZDUVC1sIRGuar+Rd2
	MgCdyDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfeV-0000000EQYJ-2eCi;
	Wed, 03 Jun 2026 07:04:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfeT-0000000EQXx-0rDY;
	Wed, 03 Jun 2026 07:04:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FA1A42ADA;
	Wed,  3 Jun 2026 07:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96401F00898;
	Wed,  3 Jun 2026 07:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470272;
	bh=owgt5GZRIYeDMJIHAWtLU/xNbrE+XbTLopPPhhJdwX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fAxZ5M5Z6UB9VOMhTBp9fakq6NBZWlNLeoac9S3KzKpnvG6ip4bNQxWZOebB8mj/G
	 BK8bwNp3pGZuNKNqpmfYalXmCeKOjz3n6/dic0WicfEyJUY17+1r1+dliIhO4BLlI2
	 iHmoGnTLR0KdWuc2N/5gkTDqybFaoJaVE9+fR1OSdwtTfQ/4WvVtC+CMh3EhKeyKfm
	 8Ee+Si/3okzTqe8FfPLlwG8MTD1c3sTfEdzPdcDIJu6nZ1EVNFLSr5FtL+Kczc7M1C
	 xyr6g58ugpOwu8bwiJD+tA2DGjyrLk4ljPw/SnJPWjzYv6W1kYLS4QtintXqHBSvfc
	 /m5ufH25vAlBw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521-asoc-rockchip-i2s-devm-cleanup-v1-1-9319bd781393@gmail.com>
References: <20260521-asoc-rockchip-i2s-devm-cleanup-v1-1-9319bd781393@gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Use managed hclk and runtime PM
 cleanup
Message-Id: <178041265480.93058.3443088566208285913.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:04:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=u/zNKQDn2qZ5UricnkeWmclMJhxio9VwGxwwA+hGTOw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9H9YBF7/GEMcxFUwfJTVENUepltyZ5fT6mUm
 1UYNG7rS4KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/R/QAKCRAk1otyXVSH
 0P4SB/9L2IrHxod3dm8i9HNZt7IgrEdr5Xbe00ZvnkA6R3WtT1VYCjObwb+1XiQjPMwsrDwc9uO
 PoA5FdvMRtG+jWbvzl3asMRzVcqB2VRliwYPoGEN9W845NmwAzTjDvlXUm/PdXV3Angxqjkv+gx
 N4HgHJ1V0qlJBj5WJXjj0lyDntBf++FA15PolkXq5UBKuK+f9xUbX7D2CABeyhGEVZcY8mep79K
 ZVuMGSDVlrmbQ3iz7G/QIax7gFup/pyBTijMC70JJB/QDI3lKlNz6Dfsx8iRSkXI1k5tXHCGPtp
 68adMWk7OWG25nqsuSAEZHOjyZFvj+lm6zupiSrorzdgWQ2Q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_000433_288044_D0C3D1B2 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

On Thu, 21 May 2026 23:30:07 -0300, Cássio Gabriel wrote:
> ASoC: rockchip: i2s: Use managed hclk and runtime PM cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rockchip: i2s: Use managed hclk and runtime PM cleanup
      https://git.kernel.org/broonie/sound/c/2d90ecdfa326

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


