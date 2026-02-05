Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6779EECD9AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 22:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ur3im+yw6s5lRPqHTVZ/rsr646t+2SdB/quvTIX3Qzs=; b=y5HnFW/Stxy7WvrIAnBadkTSEK
	sNqxHzKfH+L6VK4mtEU6bTd2ZRwrX9j7GciHa8lwlsYVX/kcXyUGNtV4NH3kuO8YfjXVkFvsgKMs7
	a3xQ91KxSI8+L+cG0b5gp77DB0xWfQRalJGnWXGKyfM6t5Li2uYgufZX7dBvwKmF39S3w+eKmRkHl
	P45vNfZIjC+4fyMAXFkwAK8YO0JrtffR9RJkjx/YEIQAj42dlCD/6EpVM0jCtkIv9Kj8XqWA7E4sp
	L01G2345tVyVfwHsNJ9Kgl0Ey93/Y/JbNe7eWlUZ/rdOjue/m6kF/rUKHUsZAPp0Brgh8eNJvO6R3
	gPDa2q5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo826-0000000Aa1O-1B8x;
	Thu, 05 Feb 2026 22:41:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo823-0000000Aa1E-29hv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 22:41:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E84CC600AD;
	Thu,  5 Feb 2026 22:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DBFC4CEF7;
	Thu,  5 Feb 2026 22:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331260;
	bh=1QH77lN80Kres8OgN/Z7IXiB0dr9VvTvVAnf9VM/fI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BXubLqiAttaMUSHV+NfdZ+g5tJ3ciMr5Z+t5viM96e/rmcM3vwWJgObX4Z7u3Ln07
	 99QwnpBcPTaNZ2msannroEA6RPs9O4mHfQ6VTjKMB0bAfuu52US4PplQPIdzzz1vfx
	 52m4efwIkCwC4232WrLokp6LsVblt/2PR031ty25QIeic7XLNRb72l3VO34B77HUHj
	 67hfRc5x5+WXy7PE2/dIuRHiSjc1/NnfCFN+3qjX0o1umib1tWN0v1ZgBzIYwN4r2Q
	 lbcd4UG4rJ0cSyx5+SN9Ovc2A1pKlXE3bkXB3bYpmoIjDSrR3vVfCFZEtuHU0CQjjO
	 ngNue4RAlvgug==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 kernel@pengutronix.de, linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260205052429.4046903-1-n7l8m4@u.northwestern.edu>
References: <20260205052429.4046903-1-n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH] ASoC: fsl: imx-rpmsg: use
 snd_soc_find_dai_with_mutex() in probe
Message-Id: <177033125765.213903.15587934334040553214.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 22:40:57 +0000
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

On Thu, 05 Feb 2026 05:24:29 +0000, Ziyi Guo wrote:
> imx_rpmsg_probe() calls snd_soc_find_dai() without holding client_mutex.
> However, snd_soc_find_dai() has lockdep_assert_held(&client_mutex)
> indicating callers must hold this lock, as the function iterates over the
> global component list.
> 
> All other callers of snd_soc_find_dai() either hold client_mutex via the
> snd_soc_bind_card() path or use the snd_soc_find_dai_with_mutex() wrapper.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
      commit: 84faa91585fa22a161763f2fe8f84a602a196c87

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


