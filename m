Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5D8C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhT7RRiorAEvqIxi2NFea7yWCgMcbVY4FpqIxZK3PtE=; b=QX0W8O1GiBQytFThezxYlYndkQ
	383UfJriBL3gp+y3gWUE541d+2lCCKtsQrS/hf+D3D50Xp6x/3/bPeEyepR6ye2iUpWIu7r6N4xD2
	cVfwsyxU98Rq7r2lSFAkHYa0D7flM115Gal02IwsXVWzJOYQxGKYwoDfEP5UqXlLS2FLnQi3meJwr
	3lrkC/K7N4FVkYtEg2g1lLZd1fuz8WhswPmXGQCAfo1EqcGdtWlxqXmsiyDxancjl1X8s30q8mRDE
	JJQuVUIDBez/NCxp0xe6lqVWGDVLs1BSxFJXW1sCUPD+W7sqehdRF8PRAgpnHHtejSo7aC35Pe4HY
	k7bgaeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAE0s-0000000EXyW-01kh;
	Fri, 25 Sep 2026 22:03:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAE0p-0000000EXy9-4AGh;
	Fri, 25 Sep 2026 22:03:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11CE460136;
	Fri, 25 Sep 2026 22:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1F51F000FF;
	Fri, 25 Sep 2026 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790373802;
	bh=JhT7RRiorAEvqIxi2NFea7yWCgMcbVY4FpqIxZK3PtE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZUvOckdxiOcldP8Y7TLsUS4ywfbYq4Ijjecu79bk0752GH6Sg3t/+aQzGlFN42Lka
	 gJ731UvY24MQV8DSWDb6Jw3Q2c1iYBk0wsRNUUAaXhiWxT7HtMP6VNgbhr4R/OmwUH
	 aPe84aaAplzXaZkXqHiliqdce77HlpvDYAlw0fvhT4p9c6nwE+WEdM8OSMWzqM99LP
	 SJbGzRmiaZoFusZA2p8J9u6E87YNB0WidoU0yCXtpzRR0P8bMwdCdwGt4rSF7jPvRL
	 J9al3TzRaPtP6Zyde5ecwJuSjLRImUm07bDc8Jg4qyaFKySe4iDLXCWSu09in5hWvr
	 gy1sGYY7nYyWw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20260925165919.5407-1-ansuelsmth@gmail.com>
References: <20260925165919.5407-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] ASoC: airoha: Fix sparse warning for AN7581 AFE PCM
Message-Id: <179035774627.204944.11119676121161416824.b4-ty@b4>
Date: Fri, 25 Sep 2026 18:35:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1STb2I6uOMYbLA23SF2cJPxli3BlqZ5BLB/N2hVX9uY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtu+lNkMGdG0kvojTWyemgHhcmJdazKAyvhUOC
 YTDhNBb9tmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarbvpQAKCRAk1otyXVSH
 0FHcB/92pEnXmYv1k9Q9C82R6lOvgrpJ3wfBG+HkoECwxidD4NUEo9QxUCnZsS63DS3EFisQquJ
 XOSgFZPcfK6aIIVNnFSALY8A/CxeqYk785rKcflYKM6nJTz+DCW0QwyeF2dByakq2WWc0uQ9f3i
 sik/Vs0sFHFcmnjIEHeYY76bq0tTNEJbUkWzqFJVB87IHpbE0ua8i1jiU0tHFyT10tvZui4KO8E
 DVXdNqrCJbIcLQCwjb6LXw3zq/qNL6coDftJP3vb67w0zPCMVdYWaLtzuxiFsMwjB3aMlaMzR5X
 IYPLpcjxQqbMqhaIITvbW72MKfkkBzHJv8jAoPhx5boe38SX
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

On Fri, 25 Sep 2026 18:59:17 +0200, Christian Marangi wrote:
> ASoC: airoha: Fix sparse warning for AN7581 AFE PCM

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: airoha: Fix sparse warning for AN7581 AFE PCM
      https://git.kernel.org/broonie/sound/c/cc466c77059e

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


