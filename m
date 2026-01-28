Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832AFD2FEFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4MPZ6aQ2kOGAGPtTfC8ElZcBs2Ixiq0W0L4uS7OjCw=; b=3oojlh6TZtme2BjXGspElWWvVT
	pQEs355c4ab1uKNZJu/KzDA6dCHrqPiI5qvOOJEdegSeagMEywMS0Lk6bLh9V0xtcJbuhztqm1YN8
	CMliQPFsGRRRel9SdYYZ8qnxDsY0LalfW69U/5p05Hbhi2DXrBwZ5BHjayYxv9jPUWAGtbD9S0/dd
	y17uB3FctQBdq433qMSjqVEB/s1Hp6bkXlLcLPVjLfju0IhYK8VlZNKp4IDimZhKksNnhc0RIDnTI
	MnVzNkGYFUYdD47AH2mbOnmCtj/k4PUXPbuIn30FtkQfQU0oiohkSmYmbAnGbxZf8SEcdpbxO8Div
	G3NNjRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktYg-0000000FDOg-1UAM;
	Wed, 28 Jan 2026 00:37:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktYf-0000000FDOZ-1hxu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 00:37:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7423A60007;
	Wed, 28 Jan 2026 00:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B21C116C6;
	Wed, 28 Jan 2026 00:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769560640;
	bh=3HKL1uGM12hoyqBDnBz72rYrhDDgXcv6Fn/aZXK0xx4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pS/E3Jj+p3TvOmNrgN86e4nKrI6A5a9Io56PUSW2vMEjiWILlMgm0CoHCgytgTf28
	 vplIlSXAywsVbwFdINDnUi3xH0/zn6qO3CSTKeF1puGU9oOuHBpFGazy3IgVxUGpBs
	 PUZafb1vLxI55N45DcEDeZJps3raa4KJQxG/7Ty/xDVMd6tzIu4YR1gIcvjkRh2W4Z
	 w3BboQvraE/U+atqOXw/PqFZhGK9MHn3cgDl6X0RteRGAhwU07a7/ne/AaVqiR8BKx
	 pEnef0S/Acba3ai/ZlpMLMIioK8Al1NVDvLwxhS/fNkW5bNX/Sw4B8U/LXpb96OvS6
	 7Mp5JwNj+D3Kw==
From: Mark Brown <broonie@kernel.org>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260127033250.2044608-1-nichen@iscas.ac.cn>
References: <20260127033250.2044608-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sunxi: sun50i-dmic: Add missing check for
 devm_regmap_init_mmio
Message-Id: <176956063766.1483098.13549944935065058916.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 00:37:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Tue, 27 Jan 2026 11:32:50 +0800, Chen Ni wrote:
> Add check for the return value of devm_regmap_init_mmio() and return the
> error if it fails in order to catch the error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sunxi: sun50i-dmic: Add missing check for devm_regmap_init_mmio
      commit: 74823db9ba2e13f3ec007b354759b3d8125e462c

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


