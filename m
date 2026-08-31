Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ADBC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yh7XuHloez7+OO+Q7zttgY4q8xC1jjwMT4fr0NaBN4=; b=WWTUTFk0UrdqVbJERX3dUC6XWq
	6GZCKTq3OoZEUfJvGeOLIRbgCtpDM989SSDEsK2rXno3csr2JFvXKfUCUpB56DPd7BiOM01TKR3Au
	NGs9P5TxHGYsnEmzcY7Lc+JfhOoC9WB+UgP9oyIC8vEe80joNUA65RpyUfCWCt0giNKAsVJ1awrPl
	pjBI+XsPJmfsEtAzyMsSmwkF0BANuhug0Mnsass1ylkuHL/+fmi9wxnm5Nt9Q5Vvg0EsTxCZGgcMz
	NH1lHFduOq5+wpuRCwX1xdIwnFRlmLNOlqx3C2ljwyKRGNzl8Gsf46SagkhRbNJzEONcQUGlNkpUb
	Z9olKOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1T6X-0000000CwaT-3FvL;
	Tue, 01 Sep 2026 18:21:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1T6E-0000000CwTj-3y7K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:20:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 66978600D2;
	Tue,  1 Sep 2026 18:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6904F1F000E9;
	Tue,  1 Sep 2026 18:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286846;
	bh=1yh7XuHloez7+OO+Q7zttgY4q8xC1jjwMT4fr0NaBN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PLAZQFQq/Qu58bCbYoRk95ITvXMNNETa1KoERJjOXKNiGuj4RC9stccis7uZiy0DC
	 a/JgGtLSetpB2B8PYnPP3nPRuhfMu3VQKxaAamnZgJwrvJLnAktA9yFdHcs4M3RxAA
	 J8KgWD2SJmc0oDjXUHj/XYcJmNXfoa/zBFyoD3xQxBm2S4YGRk4IwCqqPpscRRkwWp
	 f5SkuiQDO3JnH6/u8sbRrzhl/8nofkW29MSfXGUJcxyinJT/amciv7/0ppNJL8gzfJ
	 WWREFpRQLQ9QV+cBzajHhO2ceSG1ZAT42BF8rWsD63DTUMVoIzQ/yALxA9UPD8LYPJ
	 oxHPJg0ZRiHFg==
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, James Calligeros <jcalligeros99@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
Subject: Re: (subset) [PATCH 0/3] Enable shared GPIO for Apple Silicon
 audio support
Message-Id: <178817837781.5427.14614213924415204585.b4-ty@b4>
Date: Mon, 31 Aug 2026 13:12:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zMAznwTrjGlv6LsHPtXbJmH6HgxU8Mpga2sT8tWq+To=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxd515re3aOu94/A8T4lwlDOihUI8QnVnRuZk
 sKmdaAEUgGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXeQAKCRAk1otyXVSH
 0MIQB/90tLoiF2P3pn3sdLzvnrc2QiH+kRCxRWY77pZ9PN24aXxDiu5L4uxD7xwTmrGfg7SL1R9
 kDoVs40grVeR/CMbhRZIV7GtfqmKicgizgHgUobp33i9JOl1YGUW0T4kkw4pE2dglRMZED22tzc
 YzzBZJaTH0LTJCJ8f39Bd1knuEF/4HX8lgA2QxsHTReo1z1bVu3Is870k4hVM49ALqvnnkd9N/v
 1hrdm2378O1YwubHAukbZN/3oPeHF9Te6CXHD4trcN1Kp5zOK3BzpCMl7hVjJjpf4cvTsh8X7iw
 ZNjna0t5+jkrgIDRJbDwxuLyIFLN/Oh7ij2JeJvdRA2e/m4D
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

On Mon, 31 Aug 2026 21:32:38 +1000, James Calligeros wrote:
> Enable shared GPIO for Apple Silicon audio support
> 
> Hi folks,
> 
> On Apple Silicon Macs, every speaker codec's software shutdown pin
> is connected to the same GPIO line. This line must be pulled high
> whenever any codec asserts it so.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[2/3] ASoC: tas2764: Initialise SDZ GPIO low
      https://git.kernel.org/broonie/sound/c/e152ac60589b
[3/3] ASoC: tas2770: Initialise SDZ GPIO low
      https://git.kernel.org/broonie/sound/c/87e41baa36fc

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


