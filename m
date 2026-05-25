Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2150CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rlh+oYV+P/+1/m8THqzUSHnl6pvPwf9k2pk0kwC/skM=; b=J6/t96R1CIYH9eTptQ/CbErI9W
	uMV2Mt00z2mYufLMV/eUyTX4OocGJxFsVTpQZ2eZ6Z7UHrc0LQQhoaujkyzoZ2TXZjmb1Wk7iLqhF
	ND6hIQRHxR1d3yN2jat/6ErU0n+AlOMdK0qiwBjjznsEY/lDwIJSJM5hWrFT47YbIfk55TkEUsGr5
	21/4rjssF3x7APNBDirrBBmvrMNSQDd1d1IrN4yufBKEZAUc9Co3CWP6Ylft9raLGVzxbxxZUHVbe
	RwxEzyU9/0BzyPKalh3vPnLj0ShrXIoaXVkQ6dAoV37bVy5h5KGrwI7zabXQY3AqSoqjMjyelQbdO
	UqulixsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXNU-0000000HXZ1-2Bly;
	Mon, 25 May 2026 15:38:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXNT-0000000HXYr-1z3s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 15:38:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F6866008A;
	Mon, 25 May 2026 15:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1F51F000E9;
	Mon, 25 May 2026 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779723482;
	bh=Rlh+oYV+P/+1/m8THqzUSHnl6pvPwf9k2pk0kwC/skM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CPbQoCK85r7KVUyfv4U3p2wcqp9owjOmyyO5fAqYM2oPq1FvX/QfiYrcOu+6W1AM6
	 UFXIpvmpla6okI91+txKBJ71yoCQi1BdW2gPI873OlOou83eA/4uOJsY/6EUvIbMTe
	 WyMJRvI5im7SPPs7bIx2eD6O4AHuYgB9Bczn7wN+LA52Fae4HIWthuD0huHKBMV24k
	 bEncvArhH8VmdBHA6Qacw4ZsAvNHA3V+Mm1K8qTxLy/qFdt/8RETG5aGikb+aNinRs
	 qoxwhCyF911HpF7YSpddwUDmZREhFaD+Ibsgpp/Gc/fAYbAEu9brD7RZ9XfUKSBmnl
	 lwAXCSo8nnZKw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 Chancel Liu <chancel.liu@nxp.com>
Cc: kernel@pengutronix.de, shumingf@realtek.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260507013654.2945915-1-chancel.liu@nxp.com>
References: <20260507013654.2945915-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v4 0/3] ASoC: soc-core: Add core support for ignoring
 suspend on selected DAPM widgets
Message-Id: <177971268540.58460.7539013149269437135.b4-ty@b4>
Date: Mon, 25 May 2026 13:38:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mfakf2KSCdA6oLTC+W7ozYHLNIjtRk6O1EZB6UlOvIQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFGzWus3H0DiqbvYsMNr6AhAn2YhKG9F0iSV+B
 32wu4npHTKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahRs1gAKCRAk1otyXVSH
 0KcuB/93oLl8Dd37RwlCi7zKXZ0udVgDD24fhItx7pWfOYBluGwUA3VTRlqk9uLajf0/rCnks2L
 x9cGZE2Yc44RmIsPZH7pjx8YRINcTUTnPYeAZzZ11pKZbIyEXofmxlGuullQ943JHpvSPmAfpBO
 pZzP/ksFkeSGl+hejU+Akib6DfjYbibr21CuVMf4aepOEfYIQeHub25jopsyAPWNIhSgdkfxqsg
 OxlHe7xIKOqgpD37K6zXN/LcsDJdNn7aEl6/hFg7185XVZdRKT/7aeJbRxTEjmpeOWUmFDuXfX1
 Q/Fu1mdF+RWX0wrtIVCNhCjnZxtgz52tMLU6dlP2rF4QRTFF
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

On Thu, 07 May 2026 10:36:51 +0900, Chancel Liu wrote:
> ASoC: soc-core: Add core support for ignoring suspend on selected DAPM widgets
> 
> Some audio systems require specific DAPM widgets to remain powered
> during system suspend. Introduce a generic and reusable mechanism in
> the ASoC core to mark selected DAPM widgets as ignore_suspend.
> 
> The unified mechanism consists of two parts:
> 1. Parse and store the name list of widgets to ignore suspend in
> struct snd_soc_card
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: dapm: Fix widget lookup with prefixed names across DAPM contexts
      https://git.kernel.org/broonie/sound/c/8468c8aafe8b
[2/3] ASoC: soc-core: Add core support for ignoring suspend on selected DAPM widgets
      https://git.kernel.org/broonie/sound/c/51271184a06d
[3/3] ASoC: fsl: imx-rpmsg: Switch to core ignore-suspend-widgets support
      https://git.kernel.org/broonie/sound/c/68bb9a7f557a

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


