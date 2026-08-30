Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589D5C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYTRqz9reQrRANzaUSuksr4IU2wuSDD3poeNmgbVZio=; b=pa17c6G0BrDlJEm9bz1buQQB9V
	x+pXKIIZwlBPxR4jSNXs1OSV4TDxlJXiIVuHqViDk1v6eGF3k6bYjIW68nuA99SAKLLZzyojt7W4C
	xKf1xkx6+KMD/RxhrHv8ts9NjQJfOT84Q8W/S6U6ZyUBfT4cUYITBU6kIoKte9kMgr9Au0yxPMWeP
	91qCXa07pb2liseFvSvCrwUuEoCkSxCXMB5R4Gxv1Tg7zQ81EKUivaoM4G8Ex+BS4hCQXK7bATvIX
	VmRTWMCdSmRNxxe4DxhD61OrzD1uj5uw4qZNXnNfEXSMZFt/y42sqq+Ff2RbcmmaTTz32zeMnqpIV
	rZEe4aSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Fc-00000009TD8-08DT;
	Mon, 31 Aug 2026 13:40:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Fa-00000009T9H-02N5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:40:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75133602C4;
	Mon, 31 Aug 2026 13:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1001F00ACA;
	Mon, 31 Aug 2026 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183637;
	bh=GYTRqz9reQrRANzaUSuksr4IU2wuSDD3poeNmgbVZio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=c8MN9aHsZqRxvQ/jDEbW53cLfX3FxpQPI7Yjsm3NSrDRzWMM2baUcM35tAQBslqCw
	 BxRQrJMSgRTt+LSJsEdZDRok3oFveOgNAHaxcqKsqeh+dOFOPFHJo/HpNteOaCmLLT
	 0ZJQw4BpsoAzUaj5Bjbm9lskX0sR3v6gOd7isx6JKTnA1rkWiSa0aPBoqj2M6HcPv5
	 s/ACdHowDiK9aimJwBZCoQwjBzHLLZvpNei0YEtxEP/aQQZYfyxGXnkUA89joNPQ1o
	 hjpzOTWmM2MIHHTbnyLc/pLAAaX+6eFt8ur2r+CY0wXB4QJfP9LzcGgpzCQMRjVLIy
	 hSVCKy+KGFmyA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260814204536.38010-1-rosenp@gmail.com>
References: <20260814204536.38010-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: uniphier: aio-dma: pass chip to irq handler
Message-Id: <178812782836.13461.12974675930175322499.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:10:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RBkE86kZEDBMgrlWJHPlqDaV6bv2GNEOtO69Oq7xVq0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlYRRFTJNkNYN7XTUFfOphFNK79cXRBcj+Pk+1
 q8PRwANv9SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapWEUQAKCRAk1otyXVSH
 0EmHB/96mN7B3Z95G0JhFaYpi1TladpWrqYB/zXYStSx7ojyAkOZ1ZMzw9GH5LmFEJGno1pvrPl
 n7BdE3Wobs3c7RBiWhu0QLVBdrt3cEY721Z6N9MvIzTMUDhyI4CDTecsjd+zogxbxzF/aSZ0KD+
 zCfRq/LAUpQeWRUyFAMA2Y7R8ytGHZIHe3zCGBmL4HxhFwVYPEr3sVc86z2fgqrUEk/tx/phsCY
 oOtsYGOqSZ7/5Sbee7ceZrrgmNmR5Vg3GXfFzzyLbAEn5HoEuPrmrwwk9zegosM9zIrp4dcraxd
 oSgoR/WqR/jzsr/yvl8dD2Kge1kM3WV+MSv2sFqJIgP8YIMm
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

On Fri, 14 Aug 2026 13:45:36 -0700, Rosen Penev wrote:
> ASoC: uniphier: aio-dma: pass chip to irq handler

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: uniphier: aio-dma: pass chip to irq handler
      https://git.kernel.org/broonie/sound/c/a3521b02ff0e

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


